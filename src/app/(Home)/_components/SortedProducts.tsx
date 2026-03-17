"use client";
import React, { useEffect, useState, useTransition } from "react";
import { convertToSlug } from "@constants";
import { useCategories, WooCommerce, cacheGet, cacheSet } from "@src/components/lib/woocommerce";
import GlobalLoader from "@src/components/modal/GlobalLoader";
import Link from "next/link";
import { useCart } from "react-use-cart";
import { AiFillStar, AiOutlineStar } from "react-icons/ai";
import { BsStarHalf } from "react-icons/bs";
import { RiShoppingCartLine } from "react-icons/ri";
import Picture from "@src/components/picture/Picture";
import { FormatMoney2 } from "@src/components/Reusables/FormatMoney";
import { useDispatch } from "react-redux";
import { updateCategorySlugId } from "@src/components/config/features/subCategoryId";
import { useRouter } from "next/navigation";

/* Render 5 stars based on a numeric rating (supports halves) */
const StarRating = ({ rating }: { rating: number }) => {
	const stars = Array.from({ length: 5 }, (_, i) => {
		const full = i + 1;
		if (rating >= full) return <AiFillStar key={i} className='text-yellow-400 text-sm' />;
		if (rating >= full - 0.5) return <BsStarHalf key={i} className='text-yellow-400 text-sm' />;
		return <AiOutlineStar key={i} className='text-gray-300 text-sm' />;
	});
	return <>{stars}</>;
};

/* ─────────────────────────────────────────────
   Home-page product card (light theme)
───────────────────────────────────────────── */
const HomeProductCard = ({ product }: { product: ProductType }) => {
	const { addItem, getItem, updateItem, removeItem } = useCart();
	const ID = product.id.toString();
	const cartItem = getItem(ID);
	const qty = cartItem?.quantity || 0;
	const price = parseInt(product.price);
	const oldPrice = parseInt(product.regular_price);
	const slugDesc = convertToSlug(product.name);

	const handleAdd = (e: React.MouseEvent) => {
		e.preventDefault();
		if (qty === 0) {
			addItem({ id: ID, name: product.name, price, quantity: 1, image: product.images?.[0]?.src });
		} else {
			updateItem(ID, { quantity: qty + 1 });
		}
	};

	const handleDecrease = (e: React.MouseEvent) => {
		e.preventDefault();
		if (qty <= 1) removeItem(ID);
		else updateItem(ID, { quantity: qty - 1 });
	};

	return (
		<div className='relative group flex flex-col h-full bg-white'>
			{/* Image */}
			<Link
				href={`/home-item/product/${slugDesc}-${product.id}`}
				className='flex items-center justify-center overflow-hidden'
				style={{ height: "200px", background: "#f8fafc" }}
			>
				<Picture
					src={product.images?.[0]?.src}
					alt={product.name}
					className='w-full h-full object-contain p-4 group-hover:scale-105 transition-transform duration-300'
				/>
			</Link>

			{/* Content */}
			<div
				className='px-4 pb-4 pt-3 flex flex-col gap-1.5 flex-1'
				style={{ borderTop: "1px solid #f0f0f0" }}
			>
				{/* Name */}
				<Link
					href={`/home-item/product/${slugDesc}-${product.id}`}
					className='text-sm font-bold line-clamp-2 leading-snug text-gray-900 hover:text-shop transition-colors'
					dangerouslySetInnerHTML={{ __html: product.name }}
				/>

				{/* Category */}
				<p className='text-xs text-gray-400'>
					{product.categories?.[0]?.name || "Product"}
				</p>

				{/* Price row */}
				<div className='flex items-center gap-2 mt-auto pt-1'>
					<span className='text-sm font-bold text-gray-900'>
						{price ? <FormatMoney2 value={price} /> : "N/A"}
					</span>
					{oldPrice > price && (
						<span className='text-xs line-through text-gray-400'>
							<FormatMoney2 value={oldPrice} />
						</span>
					)}
				</div>

				{/* Cart controls */}
				{qty === 0 ? (
					<button
						onClick={handleAdd}
						className='mt-1 flex items-center justify-center gap-1.5 w-full text-white text-xs font-semibold py-2 rounded-sm transition-opacity hover:opacity-85'
						style={{ background: "#7C3AED" }}
					>
						<RiShoppingCartLine className='text-sm' />
						Add to Cart
					</button>
				) : (
					<div
						className='mt-1 flex items-center rounded-sm overflow-hidden'
						style={{ border: "1px solid #7C3AED" }}
					>
						<button
							onClick={handleDecrease}
							className='flex-1 py-1.5 font-bold text-sm transition-colors hover:opacity-80'
							style={{ color: "#7C3AED" }}
						>
							−
						</button>
						<span className='px-3 text-xs font-bold text-gray-900'>
							{qty}
						</span>
						<button
							onClick={handleAdd}
							className='flex-1 py-1.5 text-white text-sm font-bold'
							style={{ background: "#7C3AED" }}
						>
							+
						</button>
					</div>
				)}
			</div>
		</div>
	);
};

/* ─────────────────────────────────────────
   Skeleton loader (light theme)
───────────────────────────────────────── */
const ProductSkeleton = () => (
	<div className='bg-white'>
		<div className='animate-pulse bg-gray-100' style={{ height: "200px" }} />
		<div className='px-4 pb-4 pt-3 space-y-2.5'>
			<div className='h-4 rounded animate-pulse bg-gray-100' />
			<div className='h-4 rounded animate-pulse w-3/4 bg-gray-100' />
			<div className='h-3 rounded animate-pulse w-1/3 bg-gray-100' />
			<div className='h-3 rounded animate-pulse w-1/2 bg-gray-100' />
			<div className='h-5 rounded animate-pulse w-2/5 mt-1 bg-gray-100' />
		</div>
	</div>
);

/* ─────────────────────────────────────────
   Functional pagination UI
───────────────────────────────────────── */
const ITEMS_PER_PAGE = 8;

interface PaginationProps {
	currentPage: number;
	totalPages: number;
	onPageChange: (page: number) => void;
}

const Pagination = ({ currentPage, totalPages, onPageChange }: PaginationProps) => {
	if (totalPages <= 1) return null;

	// Build the visible page numbers (window of 4 around current)
	const getPageNumbers = () => {
		const pages: (number | "…")[] = [];
		if (totalPages <= 6) {
			for (let i = 1; i <= totalPages; i++) pages.push(i);
			return pages;
		}
		pages.push(1);
		const start = Math.max(2, currentPage - 1);
		const end = Math.min(totalPages - 1, currentPage + 1);
		if (start > 2) pages.push("…");
		for (let i = start; i <= end; i++) pages.push(i);
		if (end < totalPages - 1) pages.push("…");
		pages.push(totalPages);
		return pages;
	};

	return (
		<div className='flex items-center justify-center gap-1 mt-6'>
			<button
				onClick={() => onPageChange(currentPage - 1)}
				disabled={currentPage === 1}
				className='w-7 h-7 flex items-center justify-center text-gray-400 hover:text-gray-600 text-sm disabled:opacity-30 disabled:cursor-not-allowed'
			>
				‹
			</button>

			{getPageNumbers().map((n, i) =>
				n === "…" ? (
					<span key={`ellipsis-${i}`} className='text-gray-400 text-xs px-1'>
						…
					</span>
				) : (
					<button
						key={n}
						onClick={() => onPageChange(n as number)}
						className={`w-7 h-7 flex items-center justify-center text-xs rounded-sm font-medium transition-colors ${
							n === currentPage
								? "text-white"
								: "text-gray-500 hover:bg-gray-100"
						}`}
						style={n === currentPage ? { background: "#7C3AED" } : {}}
					>
						{n}
					</button>
				)
			)}

			<button
				onClick={() => onPageChange(currentPage + 1)}
				disabled={currentPage === totalPages}
				className='w-7 h-7 flex items-center justify-center text-gray-400 hover:text-gray-600 text-sm disabled:opacity-30 disabled:cursor-not-allowed'
			>
				›
			</button>
		</div>
	);
};

/* ─────────────────────────────────────────────────────
   Single product section with filter tabs
───────────────────────────────────────────────────── */
interface PopularSectionProps {
	allCategories: CategoryType[];
	categoryProductsMap: { [key: string]: ProductType[] };
	isLoading: boolean;
	title?: string;
}

const PopularProductsSection = ({
	allCategories,
	categoryProductsMap,
	isLoading,
	title = "Popular Product",
}: PopularSectionProps) => {
	const dispatch = useDispatch();
	const router = useRouter();
	const [isPending, startTransition] = useTransition();
	const [activeTab, setActiveTab] = useState<string>("all");
	const [currentPage, setCurrentPage] = useState(1);

	const allProducts: ProductType[] =
		activeTab === "all"
			? allCategories.flatMap((c) => categoryProductsMap[c.id.toString()] || [])
			: categoryProductsMap[activeTab] || [];

	const totalPages = Math.ceil(allProducts.length / ITEMS_PER_PAGE);
	const displayedProducts = allProducts.slice(
		(currentPage - 1) * ITEMS_PER_PAGE,
		currentPage * ITEMS_PER_PAGE,
	);

	const handleTabChange = (tab: string) => {
		setActiveTab(tab);
		setCurrentPage(1);
	};

	const handleCategoryClick = (name: string, id: number) => {
		const categorySlugId = `${convertToSlug(name) + "-" + id}`;
		dispatch(updateCategorySlugId({ categorySlugId }));
		startTransition(() => {
			router.push(`/category/${convertToSlug(name) + "-" + id}`);
		});
	};

	if (!isLoading && allCategories.length === 0) return null;

	return (
		<section className='py-10 bg-white'>
			<div className='max-w-[1440px] mx-auto px-4 sm:px-8'>
				{/* Section title */}
				<h2 className='text-2xl sm:text-3xl font-bold text-gray-900 text-center mb-6'>
					{title}
				</h2>

				{/* Sub-header: Products label + filter tabs + View all */}
				<div
					className='flex items-center justify-between gap-3 mb-4 pb-3'
					style={{ borderBottom: "1px solid #e5e7eb" }}
				>
					<div className='flex items-center flex-wrap gap-0.5'>
						<span className='text-sm font-bold text-shop mr-3'>Products</span>
						<button
							onClick={() => handleTabChange("all")}
							className={`text-sm px-3 py-1.5 transition-colors ${
								activeTab === "all"
									? "font-semibold border-b-2"
									: "hover:opacity-70"
							}`}
							style={
								activeTab === "all"
									? { color: "#7C3AED", borderColor: "#7C3AED" }
									: { color: "#6b7280" }
							}
						>
							All
						</button>

						{allCategories.map((cat) => (
							<button
								key={cat.id}
								onClick={() => handleTabChange(cat.id.toString())}
								className={`text-sm px-3 py-1.5 transition-colors ${
									activeTab === cat.id.toString()
										? "font-semibold border-b-2"
										: "hover:opacity-70"
								}`}
								style={
									activeTab === cat.id.toString()
										? { color: "#7C3AED", borderColor: "#7C3AED" }
										: { color: "#6b7280" }
								}
								dangerouslySetInnerHTML={{ __html: cat.name }}
							/>
						))}
					</div>

					<Link
						href='/category'
						className='text-xs font-medium px-3 py-1.5 transition-colors hover:opacity-80 shrink-0 text-gray-600 hover:text-gray-900'
						style={{ border: "1px solid #e5e7eb" }}
					>
						View all →
					</Link>
				</div>

				{/* Products grid — 4 columns */}
				<div
					className='grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4'
					style={{ borderLeft: "1px solid #e5e7eb", borderTop: "1px solid #e5e7eb" }}
				>
					{isLoading
						? Array.from({ length: 8 }).map((_, i) => (
								<div
									key={i}
									style={{ borderRight: "1px solid #e5e7eb", borderBottom: "1px solid #e5e7eb" }}
								>
									<ProductSkeleton />
								</div>
							))
						: displayedProducts.map((product) => (
								<div
									key={product.id}
									style={{ borderRight: "1px solid #e5e7eb", borderBottom: "1px solid #e5e7eb" }}
								>
									<HomeProductCard product={product} />
								</div>
							))}
				</div>

				{/* Pagination */}
				<Pagination currentPage={currentPage} totalPages={totalPages} onPageChange={setCurrentPage} />

				<GlobalLoader isPending={isPending} />
			</div>
		</section>
	);
};

/* ──────────────────────────────────────────
   Spiral divider between sections
────────────────────────────────────────── */
const SwirlDivider = () => (
	<div className='flex justify-center py-4 bg-white'>
		<svg
			width='40'
			height='40'
			viewBox='0 0 40 40'
			fill='none'
			xmlns='http://www.w3.org/2000/svg'
			className='opacity-70'
		>
			<path
				d='M20 4C11.163 4 4 11.163 4 20s7.163 16 16 16 16-7.163 16-16'
				stroke='#7C3AED'
				strokeWidth='2'
				strokeLinecap='round'
			/>
			<path
				d='M20 10C14.477 10 10 14.477 10 20s4.477 10 10 10'
				stroke='#7C3AED'
				strokeWidth='1.5'
				strokeLinecap='round'
				strokeOpacity='0.6'
			/>
			<path
				d='M20 15C17.239 15 15 17.239 15 20s2.239 5 5 5'
				stroke='#7C3AED'
				strokeWidth='1.5'
				strokeLinecap='round'
				strokeOpacity='0.35'
			/>
		</svg>
	</div>
);

/* ────────────────────────────────
   Main exported component
──────────────────────────────── */
const SortedProducts = ({
	middleBanner,
	initialCategories,
	initialProductsMap,
}: {
	middleBanner?: React.ReactNode;
	initialCategories?: CategoryType[];
	initialProductsMap?: { [key: string]: ProductType[] };
}) => {
	const hasServerData = !!initialCategories?.length;

	const [isLoading, setIsLoading] = useState(!hasServerData);
	const [categoryProductsMap, setCategoryProductsMap] = useState<{
		[key: string]: ProductType[];
	}>(initialProductsMap ?? {});

	// Pass undefined when server data is present to disable the query (enabled: categoryId !== undefined)
	const {
		data: categories,
		isLoading: categoryWpIsLoading,
		isError: categoryIsError,
	} = useCategories(hasServerData ? undefined : "");

	const filteredCategories: CategoryType[] = hasServerData
		? (initialCategories ?? []).filter((cat) => cat.count > 0).slice(0, 6)
		: (categories || []).filter((cat: CategoryType) => cat.count > 0).slice(0, 6);

	const group1 = filteredCategories.slice(0, 3);
	const group2 = filteredCategories.slice(3, 6);

	useEffect(() => {
		if (hasServerData) return;
		if (!filteredCategories.length) return;

		const fetchCategoryProducts = async () => {
			setIsLoading(true);
			try {
				const promises = filteredCategories.map(async (cat: CategoryType) => {
					const cacheKey = `sorted_products_${cat.id}`;
					const cached = cacheGet<ProductType[]>(cacheKey);
					if (cached) return { id: cat.id.toString(), products: cached };
					const response = await WooCommerce.get(
						`products?category=${cat.id}&per_page=10`,
					);
					cacheSet(cacheKey, response.data);
					return { id: cat.id.toString(), products: response.data };
				});
				const results = await Promise.all(promises);
				const map = results.reduce(
					(acc: any, r) => ({ ...acc, [r.id]: r.products }),
					{},
				);
				setCategoryProductsMap(map);
			} catch (error) {
				console.error("Error fetching category products:", error);
			} finally {
				setIsLoading(false);
			}
		};

		fetchCategoryProducts();
		// eslint-disable-next-line react-hooks/exhaustive-deps
	}, [categories]);

	if (categoryIsError && !hasServerData) return null;

	return (
		<>
			<PopularProductsSection
				allCategories={group1.length ? group1 : filteredCategories}
				categoryProductsMap={categoryProductsMap}
				isLoading={hasServerData ? false : isLoading || categoryWpIsLoading}
				title='Our featured Product'
			/>

			{/* Swirl divider */}
			<SwirlDivider />

			{/* Gaming banner between product sections */}
			{group2.length > 0 && middleBanner}

			{group2.length > 0 && (
				<PopularProductsSection
					allCategories={group2}
					categoryProductsMap={categoryProductsMap}
					isLoading={hasServerData ? false : isLoading || categoryWpIsLoading}
					title='Popular Product'
				/>
			)}
		</>
	);
};

export default SortedProducts;
