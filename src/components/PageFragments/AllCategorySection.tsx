"use client";
import Link from "next/link";
import Picture from "../picture/Picture";
import { MdCheckCircle } from "react-icons/md";

const AllCategorySection = () => {
	return (
		<div>
			{/* ── Hero ── */}
			<section
				className='relative overflow-hidden'
				style={{ background: "#0d0d0d", minHeight: "calc(100vh - 76px)" }}
			>
				{/* Full-bleed background image */}
				<div className='absolute inset-0'>
					<Picture
						src='/images/hero-bg.jpg'
						alt='Viddenave Digital hero'
						className='w-full h-full object-cover'
					/>
					{/* Gradient overlay — stronger on left so text stays readable */}
					<div
						className='absolute inset-0'
						style={{
							background:
								"linear-gradient(to right, rgba(0,0,0,0.90) 50%, rgba(0,0,0,0.55) 75%, rgba(0,0,0,0.25))",
						}}
					/>
				</div>

				{/* Left-aligned content */}
				<div className='relative z-10 flex flex-col justify-center h-full min-h-[inherit] px-6 sm:px-12 lg:px-20 xl:px-28 py-28 slg:py-36 max-w-3xl'>
					{/* Main heading */}
					<h1 className='text-3xl sm:text-4xl lg:text-5xl xl:text-[3.25rem] font-normal leading-snug text-white mb-5'>
						Getting the best and latest style has never{" "}
						<span className='font-extrabold'>been easier!</span>
					</h1>

					{/* Subtitle */}
					<p
						className='text-sm sm:text-base mb-8 max-w-md leading-relaxed'
						style={{ color: "rgba(255,255,255,0.72)" }}
					>
						we are a platform that helps to make computer accessories available
						to all. It brings comfort to your doorstep!
					</p>

					{/* Feature badges */}
					<div className='flex flex-wrap gap-6 mb-10 bg-black bg-opacity-80 px-6 py-4 rounded-2xl w-fit'>
						{["Free Register", "Great Service", "Easy payment"].map((badge) => (
							<span
								key={badge}
								className='flex items-center gap-1.5 text-sm text-white'
							>
								<MdCheckCircle className='text-shop text-base shrink-0' />
								{badge}
							</span>
						))}
					</div>

					{/* CTA */}
					<Link
						href='/category'
						className='inline-block text-white text-sm font-bold px-8 py-3 transition-opacity hover:opacity-90 w-fit rounded-lg'
						style={{ background: "#3734A9" }}
					>
						ORDER NOW
					</Link>
				</div>
			</section>
		</div>
	);
};

export default AllCategorySection;
