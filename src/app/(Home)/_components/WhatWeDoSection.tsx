import React from "react";
import { FiShoppingCart, FiShoppingBag } from "react-icons/fi";
import { MdOutlineHeadsetMic, MdLocalShipping } from "react-icons/md";

const services = [
	{
		Icon: FiShoppingCart,
		title: "Shop for latest computers",
		description:
			"powerful, sleek, and cutting-edge, built to elevate your productivity.",
		iconBg: "#FEF3C7",
		iconColor: "#D97706",
	},
	{
		Icon: MdOutlineHeadsetMic,
		title: "Request for help for maintenance",
		description:
			"our team is ready to provide fast, reliable support to fix issues and keep your equipment running smoothly.",
		iconBg: "#EDE9FE",
		iconColor: "#7C3AED",
	},
	{
		Icon: FiShoppingBag,
		title: "Buy software",
		description:
			"Buy software that empowers productivity, enhances security.",
		iconBg: "#DBEAFE",
		iconColor: "#2563EB",
	},
	{
		Icon: MdLocalShipping,
		title: "Get your product delivered to you",
		description:
			"fast, safe, and hassle-free, bringing convenience and quality right to you.",
		iconBg: "#DCFCE7",
		iconColor: "#16A34A",
	},
];

const WhatWeDoSection = () => {
	return (
		<section className='py-16 md:py-20 bg-white'>
			<div className='max-w-[1440px] mx-auto px-4 sm:px-8'>
				{/* Section heading */}
				<h2 className='text-2xl sm:text-3xl font-bold text-gray-900 text-center mb-10'>
					What we do
				</h2>

				{/* Dark navy outer card */}
				<div
					className='rounded-2xl p-6 md:p-10'
					style={{ background: "#0f1f3d" }}
				>
					{/* White inner card with 2×2 service grid */}
					<div className='bg-white rounded-xl p-6 md:p-8 grid grid-cols-1 sm:grid-cols-2 gap-6 md:gap-8'>
						{services.map(({ Icon, title, description, iconBg, iconColor }) => (
							<div key={title} className='flex items-start gap-4'>
								<span
									className='flex-shrink-0 w-12 h-12 rounded-lg flex items-center justify-center mt-0.5'
									style={{ background: iconBg }}
								>
									<Icon className='text-xl' style={{ color: iconColor }} />
								</span>
								<div>
									<h3 className='text-sm font-bold text-gray-900 mb-1'>{title}</h3>
									<p className='text-xs leading-relaxed text-gray-500'>
										{description}
									</p>
								</div>
							</div>
						))}
					</div>
				</div>
			</div>
		</section>
	);
};

export default WhatWeDoSection;
