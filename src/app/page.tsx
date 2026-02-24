import AppLayout from "@src/components/AppLayout";
import AllCategorySection from "@src/components/PageFragments/AllCategorySection";
import SortedProducts from "./(Home)/_components/SortedProducts";
import WhatWeDoSection from "./(Home)/_components/WhatWeDoSection";
import MachineMaintenance from "./(Home)/_components/MachineMaintenance";
import HomeFaqSection from "./(Home)/_components/HomeFaqSection";
import { SEODATA } from "@constants/seoContants";
import { Metadata } from "next";

const { description, title, ogImage, keywords } = SEODATA.home;
export const metadata: Metadata = {
	title: title,
	description: description,
	keywords: keywords,
	icons: ogImage,
	openGraph: {
		images: [
			{
				url: ogImage ?? "",
			},
		],
	},
};

const page = () => {
	return (
		<AppLayout>
			{/* ── 1. Hero ── */}
			<AllCategorySection />

			{/* ── 2. What we do ── */}
			<WhatWeDoSection />

			{/* ── 3. Products (with gaming banner between groups) ── */}
			<SortedProducts middleBanner={<MachineMaintenance />} />

			{/* ── 4. FAQ ── */}
			<HomeFaqSection />
		</AppLayout>
	);
};

export default page;
