"use client";
import React, { useMemo, useState, useTransition, Fragment } from "react";
import { usePathname, useRouter } from "next/navigation";
import Link from "next/link";
import { useCart } from "react-use-cart";
import { useAppDispatch, useAppSelector } from "../hooks";
import Drawer from "rc-drawer";
import { useCustomer, useCategories } from "../lib/woocommerce";
import { currencyOptions, filterCustomersByEmail, convertToSlug } from "@constants";
import { signOut } from "@utils/lib";
import Picture from "../picture/Picture";
import { APICall } from "@utils";
import { fetchExchangeRate } from "@utils/endpoints";
import { setBaseCurrency, setExchangeRate } from "../Redux/Currency";
import FormToast from "../Reusables/Toast/SigninToast";
import useToken from "../hooks/useToken";

import { Menu, Transition } from "@headlessui/react";
import {
	FiSearch,
	FiShoppingBag,
	FiUser,
	FiLogOut,
	FiMenu,
	FiShoppingCart,
} from "react-icons/fi";
import { SlArrowDown } from "react-icons/sl";
import Flag from "react-world-flags";
import GlobalLoader from "../modal/GlobalLoader";
import MobileNav from "./MobileNav";
import ProductTable from "../Tables/ProductTable";
import CategoryPageBottomHeader from "./CategoryPageBottomHeader";
import ProductPageBottomHeader from "./ProductPageBottomHeader";
import { FaCartArrowDown } from "react-icons/fa";
import { BiUser } from "react-icons/bi";
import { updateCategorySlugId } from "../config/features/subCategoryId";

const topNavLinks = [
	{ id: 1, href: "/", label: "Home" },
	{ id: 2, href: "/category", label: "Products" },
	{ id: 3, href: "/contact-us", label: "Contact" },
];

const Header = () => {
	const pathname = usePathname();
	const router = useRouter();
	const dispatch = useAppDispatch();
	const { email } = useToken();
	const { totalItems } = useCart();

	const { baseCurrency } = useAppSelector((state) => state.currency);
	const [isPending, startTransition] = useTransition();

	const [isCartOpen, setIsCartOpen] = useState(false);
	const [drawerVisible, setDrawerVisible] = useState(false);
	const [searchValue, setSearchValue] = useState("");
	const [selectedCategory, setSelectedCategory] = useState<CategoryType | null>(null);

	const { data: categoriesData } = useCategories("");
	const categories: CategoryType[] = ((categoriesData as CategoryType[]) || []).filter(
		(c: CategoryType) => c.count > 0,
	);

	const { data: customer } = useCustomer("");
	const wc_customer_info = useMemo(
		() => filterCustomersByEmail(customer as Woo_Customer_Type[], email),
		[customer, email],
	);

	const onOpenCart = () => setIsCartOpen(true);
	const onCloseCart = () => setIsCartOpen(false);

	const handleCurrencyChange = async (code: string) => {
		const selectedObj = currencyOptions.find((c) => c.code === code);
		if (!selectedObj) return;
		try {
			const data = await APICall(fetchExchangeRate, ["NGN", code], true, true);
			if (data) {
				dispatch(setExchangeRate(data));
				dispatch(setBaseCurrency(selectedObj));
				FormToast({ message: `Switched to ${code}`, success: true });
			}
		} catch (error) {
			FormToast({ message: "Currency switch failed", success: false });
		}
	};

	const handleSearch = () => {
		if (!searchValue) return;
		startTransition(() => {
			router.push(`/search?${searchValue}`);
		});
	};

	const handleCategoryNav = (cat: CategoryType) => {
		const slug = `${convertToSlug(cat.name)}-${cat.id}`;
		dispatch(updateCategorySlugId({ categorySlugId: slug }));
		setSelectedCategory(cat);
		startTransition(() => {
			router.push(`/category/${slug}`);
		});
	};

	const userDropDownLinks = [
		{ id: 1, href: "/user/dashboard", icon: <BiUser />, label: "My Account" },
		{
			id: 2,
			href: "/user/my-orders",
			icon: <FaCartArrowDown />,
			label: "Orders",
		},
		{ id: 3, onClick: onOpenCart, icon: <FiShoppingCart />, label: "Cart" },
	];

	const isOnCategoryPage = pathname.includes("/category");
	const isOnProductPage = pathname.includes("/home-item");

	return (
		<>
			<header className='flex flex-col w-full z-[100] fixed top-0 transition-all'>

				{/* ══ DESKTOP HEADER – floating pill ══ */}
				<div className='hidden slg:block w-full px-6 py-3'>
					<div className='max-w-[1200px] mx-auto bg-white rounded-full shadow-md border border-gray-200 flex items-center px-6 py-2.5 gap-5'>

						{/* Logo */}
						<Link href='/' className='flex-shrink-0 flex items-center gap-2'>
							<Picture
								src='/images/logo-tiny.svg'
								alt='Viddenave Digital'
								width={32}
								height={32}
								className='h-8 w-8 shrink-0'
							/>
							<span className='text-sm font-black text-gray-900 tracking-tight leading-none'>
								<span className='text-shop'>V</span>iddenave Digital
							</span>
						</Link>

						<div className='flex-1' />

						{/* Nav links */}
						<nav className='flex items-center gap-6'>
							{topNavLinks.map(({ id, href, label }) => {
								const isActive = pathname === href;
								return (
									<Link
										key={id}
										href={href}
										className={`text-xs font-medium tracking-wide transition-colors ${
											isActive
												? "text-shop border-b border-shop pb-0.5"
												: "text-gray-500 hover:text-gray-900"
										}`}
									>
										{label}
									</Link>
								);
							})}
						</nav>

						<div className='flex-1' />

						{/* Search icon+text */}
						<button
							onClick={() => router.push("/search")}
							className='flex items-center gap-1.5 text-gray-500 hover:text-gray-900 transition-colors text-xs'
						>
							<FiSearch className='text-base' />
							<span>Search</span>
						</button>

						{/* Divider */}
						<span className='h-4 w-px bg-gray-200' />

						{/* Cart */}
						<button
							onClick={onOpenCart}
							className='relative flex items-center gap-1.5 text-gray-500 hover:text-gray-900 transition-colors text-xs'
						>
							<FiShoppingBag className='text-base' />
							<span>Cart</span>
							{totalItems > 0 && (
								<span className='absolute -top-1.5 left-3 size-[14px] bg-shop text-white text-[8px] font-black flex items-center justify-center rounded-full'>
									{totalItems}
								</span>
							)}
						</button>

						{/* Divider */}
						<span className='h-4 w-px bg-gray-200' />

						{/* Account dropdown */}
						<Menu as='div' className='relative inline-block text-left'>
							{({ open }) => (
								<>
									<Menu.Button className='flex items-center gap-1.5 cursor-pointer outline-none text-gray-500 hover:text-gray-900 transition-colors'>
										<div className='size-6 rounded-full bg-gray-100 flex items-center justify-center overflow-hidden border border-gray-200'>
											{wc_customer_info?.shipping?.address_2 ? (
												<Picture
													src={wc_customer_info.shipping.address_2}
													alt='user'
													className='size-6 rounded-full object-cover'
													width={24}
													height={24}
												/>
											) : (
												<FiUser className='text-gray-500 text-[10px]' />
											)}
										</div>
										<SlArrowDown
											className={`text-[7px] text-gray-400 transition-transform duration-200 ${open ? "rotate-180" : ""}`}
										/>
									</Menu.Button>
									<Transition
										as={Fragment}
										enter='transition ease-out duration-100'
										enterFrom='transform opacity-0 scale-95'
										enterTo='transform opacity-100 scale-100'
										leave='transition ease-in duration-75'
										leaveFrom='transform opacity-100 scale-100'
										leaveTo='transform opacity-0 scale-95'
									>
										<Menu.Items className='absolute right-0 mt-3 w-56 origin-top-right bg-white border border-gray-200 rounded-2xl shadow-xl p-1.5 z-[110] outline-none'>
											{wc_customer_info?.first_name && (
												<div className='px-3 py-2 mb-1 border-b border-gray-100'>
													<p className='text-[10px] text-gray-400'>Logged in as</p>
													<p className='text-xs font-bold text-gray-900 truncate'>
														{wc_customer_info.first_name}
													</p>
												</div>
											)}
											{userDropDownLinks.map((item) => (
												<Menu.Item key={item.id}>
													{({ active }) => (
														<button
															onClick={(e) => {
																if (item.onClick) {
																	e.preventDefault();
																	item.onClick();
																} else if (item.href) {
																	router.push(item.href);
																}
															}}
															className={`${active ? "bg-gray-50 text-gray-900" : "text-gray-600"} flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-xs transition-colors`}
														>
															<span>{item.icon}</span>
															{item.label}
														</button>
													)}
												</Menu.Item>
											))}
											{/* Currency switcher inside account menu */}
											<div className='border-t border-gray-100 mt-1 pt-1'>
												{currencyOptions.map((c) => (
													<Menu.Item key={c.code}>
														{({ active }) => (
															<button
																onClick={() => handleCurrencyChange(c.code)}
																className={`${active ? "bg-gray-100 text-gray-900" : "text-gray-600"} flex w-full items-center gap-2 rounded-lg px-3 py-2 text-xs font-medium transition-colors`}
															>
																{/* @ts-ignore */}
																<Flag code={c.countryCode} className='w-4' />
																{c.code} ({c.symbol})
															</button>
														)}
													</Menu.Item>
												))}
											</div>
											<Menu.Item>
												{({ active }) => (
													<button
														onClick={() => signOut()}
														className={`${active ? "bg-red-50" : ""} flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-xs text-red-500 font-semibold transition-colors mt-0.5`}
													>
														<FiLogOut /> Log Out
													</button>
												)}
											</Menu.Item>
										</Menu.Items>
									</Transition>
								</>
							)}
						</Menu>

						{/* Get started */}
						<Link
							href='/user/login'
							className='flex items-center text-xs font-semibold px-5 py-2 rounded-full text-white transition-opacity hover:opacity-90'
							style={{ background: "#3734A9" }}
						>
							Get started
						</Link>
					</div>
				</div>

				{/* Conditional sub-headers for category / product pages */}
				{isOnCategoryPage && <CategoryPageBottomHeader />}
				{isOnProductPage && <ProductPageBottomHeader />}

				{/* ══ MOBILE HEADER ══ */}
				<div className='slg:hidden flex flex-col w-full bg-white border-b border-gray-200 shadow-sm'>
					<div className='flex items-center justify-between px-4 py-3'>
						<div className='flex items-center gap-3'>
							<button
								onClick={() => setDrawerVisible(true)}
								className='p-1 -ml-1'
							>
								<FiMenu className='text-[22px] text-gray-900' />
							</button>
							<Link href='/' className='flex items-center gap-2'>
								<Picture
									src='/images/logo-tiny.svg'
									alt='Viddenave Digital'
									width={32}
									height={32}
									className='h-8 w-8 shrink-0'
								/>
								<span className='text-sm font-black text-gray-900 tracking-tight leading-none'>
									<span className='text-shop'>V</span>iddenave Digital
								</span>
							</Link>
						</div>

						{/* Right: account + cart */}
						<div className='flex items-center gap-1'>
							<button
								onClick={() =>
									router.push(
										wc_customer_info?.first_name
											? "/user/dashboard"
											: "/user/login",
									)
								}
								className='relative p-2 rounded-full hover:bg-gray-100 transition-colors'
							>
								{wc_customer_info?.shipping?.address_2 ? (
									<Picture
										src={wc_customer_info.shipping.address_2}
										alt='user'
										className='size-[22px] rounded-full object-cover'
										width={22}
										height={22}
									/>
								) : (
									<FiUser className='text-[20px] text-gray-700' />
								)}
							</button>

							<button
								onClick={onOpenCart}
								className='relative p-2 rounded-full hover:bg-gray-100 transition-colors'
							>
								<FiShoppingBag className='text-[20px] text-gray-700' />
								{totalItems > 0 && (
									<span className='absolute top-0.5 right-0.5 size-4 bg-shop rounded-full text-[9px] flex items-center justify-center text-white font-bold'>
										{totalItems}
									</span>
								)}
							</button>
						</div>
					</div>

					{/* Mobile search bar */}
					<div className='px-4 pb-3'>
						<div
							className='flex items-center overflow-hidden'
							style={{ border: "1px solid #e5e7eb", background: "#f9fafb" }}
						>
							<input
								type='text'
								placeholder='Search For Items...'
								className='flex-1 h-10 text-sm bg-transparent pl-4 pr-3 outline-none text-gray-900 placeholder-gray-400'
								value={searchValue}
								onChange={(e) => setSearchValue(e.target.value)}
								onKeyDown={(e) => e.key === "Enter" && handleSearch()}
							/>
							<button
								onClick={handleSearch}
								className='h-10 w-10 flex items-center justify-center flex-shrink-0'
								style={{ background: "#3734A9" }}
							>
								<FiSearch className='text-white text-sm' />
							</button>
						</div>
					</div>
				</div>
			</header>

			{/* Cart Drawer */}
			<Drawer
				open={isCartOpen}
				onClose={onCloseCart}
				placement='right'
				width={
					typeof window !== "undefined" && window.innerWidth > 768 ? 500 : "100%"
				}
			>
				<ProductTable onClose={onCloseCart} />
			</Drawer>

			<GlobalLoader isPending={isPending} />
			<MobileNav
				closeDrawer={() => setDrawerVisible(false)}
				drawerVisible={drawerVisible}
			/>
		</>
	);
};

export default Header;
