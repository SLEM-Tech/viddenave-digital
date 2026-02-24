"use client";
import React, { useMemo } from "react";
import Image from "next/image";
import Link from "next/link";
import { signOut } from "@utils/lib";
import { CompanyName, filterCustomersByEmail } from "@constants";
import { useCustomer } from "../lib/woocommerce";
import useToken from "../hooks/useToken";
import {
	BiLogoFacebook,
	BiLogoInstagram,
	BiLogoYoutube,
} from "react-icons/bi";

const Footer = () => {
	const { email } = useToken();
	const currentYear = new Date().getFullYear();

	const { data: customer } = useCustomer("");
	const wc_customer_info: Woo_Customer_Type | undefined = useMemo(
		() => filterCustomersByEmail(customer as Woo_Customer_Type[], email),
		[customer, email],
	);

	const firstName = wc_customer_info?.first_name;

	const col1Links = [
		{ label: "Explore", href: "/" },
		{ label: "Product", href: "/category" },
		{ label: "Pricing", href: "/category" },
		{ label: "Reviews", href: "/faq" },
	];

	const col2Links = [
		{ label: "Privacy policy", href: "/terms-of-use?privacy-policy" },
		{ label: "Legal", href: "/terms-of-use?terms-of-use" },
		{ label: "Terms of service", href: "/terms-of-use?terms-of-use" },
		{ label: "Help center", href: "/contact-us" },
	];

	const socialLinks = [
		{ label: "Instagram", icon: <BiLogoInstagram className='text-lg' />, href: "#" },
		{ label: "Facebook", icon: <BiLogoFacebook className='text-lg' />, href: "#" },
		{ label: "YouTube", icon: <BiLogoYoutube className='text-lg' />, href: "#" },
	];

	return (
		<footer className='bg-white w-full border-t border-gray-100'>
			<div className='max-w-[1440px] mx-auto px-4 sm:px-8 py-12 flex flex-col md:flex-row gap-10 md:gap-16 justify-between'>

				{/* Left – Brand */}
				<div className='space-y-4 max-w-xs'>
					<Link href='/' className='flex items-center gap-2.5'>
						<Image
							src='/images/logo-tiny.svg'
							alt={CompanyName}
							width={36}
							height={36}
							className='h-9 w-9 shrink-0'
						/>
						<span className='text-lg font-black text-gray-900 tracking-tight leading-none'>
							<span className='text-shop'>V</span>iddenave Digital
						</span>
					</Link>
					<p className='text-sm text-gray-400 leading-relaxed'>
						Vestibulum non est nisl. Donec eget sodales nisl.
						Donec ut velit erat.
					</p>
					<p className='text-xs text-gray-400'>
						&copy; {currentYear} All rights reserved.
					</p>
				</div>

				{/* Right – Two link columns */}
				<div className='flex gap-12 sm:gap-20 flex-shrink-0'>

					{/* Column 1 */}
					<div className='space-y-3.5'>
						{col1Links.map((link) => (
							<Link
								key={link.label}
								href={link.href}
								className='block text-sm text-gray-500 hover:text-gray-900 transition-colors'
							>
								{link.label}
							</Link>
						))}
						{firstName && (
							<button
								onClick={signOut}
								className='block text-sm text-red-400 hover:text-red-600 transition-colors text-left'
							>
								Log Out
							</button>
						)}
					</div>

					{/* Column 2 – Legal + Social */}
					<div className='space-y-3.5'>
						{col2Links.map((link) => (
							<Link
								key={link.label}
								href={link.href}
								className='block text-sm text-gray-500 hover:text-gray-900 transition-colors'
							>
								{link.label}
							</Link>
						))}

						{/* Social Media */}
						<div className='pt-1'>
							<p className='text-sm font-bold text-gray-900 mb-3'>Social Media</p>
							<div className='flex items-center gap-2'>
								{socialLinks.map((s) => (
									<a
										key={s.label}
										href={s.href}
										aria-label={s.label}
										className='w-9 h-9 rounded-lg flex items-center justify-center text-gray-500 hover:text-white transition-all'
										style={{ background: "#f3f4f6" }}
										onMouseEnter={(e) =>
											((e.currentTarget as HTMLElement).style.background = "#3734A9")
										}
										onMouseLeave={(e) =>
											((e.currentTarget as HTMLElement).style.background = "#f3f4f6")
										}
									>
										{s.icon}
									</a>
								))}
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	);
};

export default Footer;
