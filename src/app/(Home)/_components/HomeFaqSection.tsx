"use client";
import React, { useState } from "react";
import Link from "next/link";
import { FiChevronDown, FiChevronRight } from "react-icons/fi";

const faqs = [
	{
		q: "How does the Viddenave Digital importation process work?",
		a: "We operate a seamless two-phase system: First, you pay for the cost of the goods to initiate procurement overseas. Once your cargo arrives, a second invoice is generated for shipping and customs clearing fees.",
	},
	{
		q: "How long does it take to receive my imported items?",
		a: "Procurement typically takes 24–48 hours. International air freight usually arrives within 7 to 14 business days, while sea freight takes 45 to 60 days. You can track every milestone via your order dashboard.",
	},
	{
		q: "What is the required initial deposit for procurement?",
		a: "Our flexible payment plan requires a down payment of 20% to 40% of the goods' value. For items below ₦200,000, a 40% deposit is required. For premium items valued at ₦500,000 and above, we offer a reduced commitment of 20–30%.",
	},
	{
		q: "Do you handle nationwide delivery?",
		a: "Yes, we provide secure nationwide delivery. Once your shipping and clearing fees are settled at our warehouse, we dispatch your items to any state via our trusted local logistics partners.",
	},
	{
		q: "Are my imports covered by a warranty?",
		a: "Yes. All electronic and mechanical products procured through Viddenave Digital carry a standard manufacturer's warranty, which we help you facilitate in the event of a technical issue.",
	},
	{
		q: "How do I get help if my shipment is delayed?",
		a: "Our support team is available 24/7. Contact your designated account officer directly for real-time updates on customs or weather-related delays, or reach us via the Contact page.",
	},
];

const FaqItem = ({ q, a }: { q: string; a: string }) => {
	const [open, setOpen] = useState(false);

	return (
		<div
			className='border-b border-gray-100 last:border-0'
		>
			<button
				onClick={() => setOpen(!open)}
				className='w-full flex items-center justify-between gap-4 py-5 text-left'
			>
				<span className='text-sm font-semibold text-gray-900'>{q}</span>
				<span className='flex-shrink-0 text-gray-400'>
					{open
						? <FiChevronDown className='text-shop text-lg' />
						: <FiChevronRight className='text-lg' />
					}
				</span>
			</button>
			<div
				style={{
					height: open ? "auto" : 0,
					opacity: open ? 1 : 0,
					overflow: "hidden",
					transition: "opacity 0.25s",
				}}
			>
				<p className='text-sm text-gray-500 leading-relaxed pb-5'>
					{a}
				</p>
			</div>
		</div>
	);
};

const HomeFaqSection = () => {
	return (
		<section className='py-16 md:py-20 bg-white'>
			<div className='max-w-[1440px] mx-auto px-4 sm:px-8'>

				<div className='max-w-3xl mx-auto'>
					{/* Heading */}
					<div className='text-center mb-10'>
						<h2 className='text-2xl sm:text-3xl font-bold text-gray-900 mb-2'>
							Frequently asked questions
						</h2>
						<p className='text-sm text-gray-400'>
							Everything you need to know about ordering, delivery, and payments.
						</p>
					</div>

					{/* Accordion */}
					<div className='divide-y divide-gray-100 border border-gray-100 rounded-2xl px-6'>
						{faqs.map((faq) => (
							<FaqItem key={faq.q} q={faq.q} a={faq.a} />
						))}
					</div>

					{/* View all link */}
					<div className='mt-8 text-center'>
						<Link
							href='/faq'
							className='inline-flex items-center gap-1.5 text-sm font-semibold transition-opacity hover:opacity-80'
							style={{ color: "#3734A9" }}
						>
							View all FAQs
							<FiChevronRight className='text-base' />
						</Link>
					</div>
				</div>
			</div>
		</section>
	);
};

export default HomeFaqSection;
