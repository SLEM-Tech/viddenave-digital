"use client";
import Link from "next/link";

interface LogoImageProps {
	className?: string;
}

export const LogoImage = ({ className }: LogoImageProps) => {
	return (
		<Link href='/' className={`flex items-center gap-2.5 flex-shrink-0 ${className ?? ""}`}>
			{/* Viddenave hexagon icon */}
			<svg width="36" height="42" viewBox="0 0 50 58" fill="none" xmlns="http://www.w3.org/2000/svg">
				{/* Flat-top hexagon */}
				<polygon points="49,29 37,8.2 13,8.2 1,29 13,49.8 37,49.8" fill="#0E366B" />
				{/* Mountain / triangle */}
				<polygon points="25,17 12,44 38,44" fill="#3A7DC4" />
				{/* White apex circle */}
				<circle cx="25" cy="13.5" r="3.8" fill="white" />
			</svg>

			{/* Text block */}
			<div className="flex flex-col leading-none gap-[3px]">
				<span className="text-[17px] font-light tracking-wider" style={{ color: "#9BBDD9" }}>
					viddenave
				</span>
				<span className="text-[7px] font-medium uppercase tracking-[0.32em]" style={{ color: "#7BACD1" }}>
					digital
				</span>
			</div>
		</Link>
	);
};

export const extractCurrencySymbol = (html: string) => {
	if (!html) return "";
	const doc = new DOMParser().parseFromString(html, "text/html");
	return doc.body.textContent?.match(/[\u20A6]/)?.[0] || "";
};

export const getFriendlyStatus = (status: string, cargoStatus?: string) => {
	const map: Record<string, { label: string; color: string }> = {
		"on-hold": {
			label: "Awaiting Payment Verification",
			color: "bg-orange-100 text-orange-700",
		},
		processing: {
			label: "Procurement in Progress (China)",
			color: "bg-blue-100 text-blue-700",
		},
		"import-in-transit": {
			label: "In Transit to Nigeria",
			color: "bg-indigo-100 text-indigo-700",
		},
		"awaiting-shipping-payment": {
			label: "Arrived Lagos - Awaiting Clearing",
			color: "bg-purple-100 text-purple-700",
		},
		"shipping-paid": {
			label: "Clearing Payment Verified",
			color: "bg-teal-100 text-teal-700",
		},
		completed: {
			label: "Order Delivered",
			color: "bg-green-100 text-green-700",
		},
		cancelled: {
			label: "Order Cancelled",
			color: "bg-red-100 text-red-700",
		},
		refunded: {
			label: "Funds Refunded",
			color: "bg-slate-100 text-slate-700",
		},
		failed: {
			label: "Payment Failed / Rejected",
			color: "bg-red-50 text-red-600 border border-red-100",
		},
	};

	return map[status] || { label: status, color: "bg-gray-100 text-gray-700" };
};
