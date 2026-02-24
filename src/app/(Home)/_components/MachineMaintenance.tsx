import React from "react";
import Link from "next/link";
import Picture from "@src/components/picture/Picture";
import { FiArrowRight } from "react-icons/fi";

/* Scattered gaming-icon pattern rendered as inline SVG */
const GamingPattern = () => (
	<svg
		className='absolute inset-0 w-full h-full'
		xmlns='http://www.w3.org/2000/svg'
		aria-hidden='true'
	>
		{/* Triangles */}
		{[
			[72, 18], [210, 55], [340, 20], [490, 70], [630, 15], [760, 50],
			[880, 25], [50, 110], [300, 130], [550, 105], [700, 140], [830, 90],
			[120, 175], [420, 160], [670, 180], [900, 155],
		].map(([x, y], i) => (
			<polygon
				key={`tri-${i}`}
				points={`${x},${y - 7} ${x - 6},${y + 5} ${x + 6},${y + 5}`}
				fill='none'
				stroke='rgba(255,255,255,0.08)'
				strokeWidth='1.2'
			/>
		))}
		{/* Circles */}
		{[
			[150, 40], [390, 80], [570, 35], [720, 80], [960, 50],
			[250, 150], [470, 170], [810, 160], [100, 195],
		].map(([cx, cy], i) => (
			<circle
				key={`cir-${i}`}
				cx={cx}
				cy={cy}
				r='5'
				fill='none'
				stroke='rgba(255,255,255,0.08)'
				strokeWidth='1.2'
			/>
		))}
		{/* Squares / diamonds */}
		{[
			[270, 30], [620, 60], [850, 35], [180, 145], [640, 120],
		].map(([x, y], i) => (
			<rect
				key={`sq-${i}`}
				x={x - 5}
				y={y - 5}
				width='10'
				height='10'
				fill='none'
				stroke='rgba(255,255,255,0.08)'
				strokeWidth='1.2'
				transform={`rotate(45 ${x} ${y})`}
			/>
		))}
		{/* X marks */}
		{[
			[450, 45], [800, 110], [350, 185],
		].map(([x, y], i) => (
			<g key={`x-${i}`} stroke='rgba(255,255,255,0.08)' strokeWidth='1.2'>
				<line x1={x - 5} y1={y - 5} x2={x + 5} y2={y + 5} />
				<line x1={x + 5} y1={y - 5} x2={x - 5} y2={y + 5} />
			</g>
		))}
	</svg>
);

const MachineMaintenance = () => {
	return (
		<section className='w-full px-4 sm:px-8 py-6'>
			<div
				className='relative max-w-[1440px] mx-auto rounded-2xl overflow-hidden'
				style={{ background: "#0f1f3d" }}
			>
				{/* Background gaming pattern */}
				<GamingPattern />

				<div className='relative z-10 px-8 md:px-14 py-10 md:py-12 grid grid-cols-1 md:grid-cols-2 gap-8 items-center'>

					{/* Left – copy */}
					<div className='space-y-4'>
						<h2 className='text-3xl sm:text-4xl font-bold leading-tight' 
						style={{
								backgroundImage: "linear-gradient(90deg, #00FFF0, #F47AFF, #FFF500)",
								WebkitBackgroundClip: "text",
								WebkitTextFillColor: "transparent",
								backgroundClip: "text",
							}}>
							<span
								
							>
								Everything For Your
							</span>
							<br />
							<span className=''>Gaming Setup</span>
						</h2>

						<p
							className='text-sm leading-relaxed max-w-sm'
							style={{ color: "rgba(255,255,255,0.6)" }}
						>
							Do you need to upgrade your gaming gear? We have one of Denmark&apos;s
							largest selections of PC parts, consoles, and gaming equipment.
						</p>

						<Link
							href='/category'
							className='inline-flex items-center gap-2.5 text-white text-sm font-bold transition-opacity hover:opacity-80'
						>
							<span>Upgrade Your Gaming Experience</span>
							<span
								className='w-7 h-7 rounded-full flex items-center justify-center flex-shrink-0'
								style={{ background: "rgba(255,255,255,0.15)" }}
							>
								<FiArrowRight className='text-sm' />
							</span>
						</Link>
					</div>

					{/* Right – image */}
					<div className='flex justify-center md:justify-end'>
						<Picture
							src='/images/devices-image.jpg'
							alt='Gaming setup'
							className='max-h-44 md:max-h-56 w-auto object-contain drop-shadow-2xl'
						/>
					</div>
				</div>
			</div>
		</section>
	);
};

export default MachineMaintenance;
