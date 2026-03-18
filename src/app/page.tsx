import AppLayout from "@src/components/AppLayout";
import AllCategorySection from "@src/components/PageFragments/AllCategorySection";
import SortedProducts from "./(Home)/_components/SortedProducts";
import WhatWeDoSection from "./(Home)/_components/WhatWeDoSection";
import MachineMaintenance from "./(Home)/_components/MachineMaintenance";
import HomeFaqSection from "./(Home)/_components/HomeFaqSection";
import { SEODATA } from "@constants/seoContants";
import { Metadata } from "next";
import { query } from "@src/lib/db";
import { hydrateProducts } from "@src/lib/productHelpers";
import { T } from "@src/lib/tables";

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

async function fetchHomeData(): Promise<{
	initialCategories: CategoryType[];
	initialProductsMap: { [key: string]: ProductType[] };
}> {
	try {
		const categoryRows = await query(
			`SELECT id, name, slug, parent, description, display, menu_order, count
       FROM ${T.categories} WHERE count > 0 ORDER BY menu_order ASC LIMIT 6`,
		);

		const initialCategories: CategoryType[] = categoryRows.map((c) => ({
			id: c.id,
			name: c.name,
			slug: c.slug,
			parent: c.parent ?? 0,
			description: c.description ?? "",
			display: c.display ?? "default",
			image: null,
			menu_order: c.menu_order ?? 0,
			count: c.count ?? 0,
			_links: { self: [], collection: [] },
		}));

		const productPromises = initialCategories.map(async (cat) => {
			const rows = await query(
				`SELECT p.* FROM ${T.products} p
         JOIN ${T.productCategories} pc ON pc.product_id = p.id
         WHERE pc.category_id = $1 AND p.status = 'publish' LIMIT 10`,
				[cat.id],
			);
			const products = await hydrateProducts(rows);
			return { id: cat.id.toString(), products };
		});

		const results = await Promise.all(productPromises);
		const initialProductsMap: { [key: string]: ProductType[] } = results.reduce(
			(acc, r) => ({ ...acc, [r.id]: r.products }),
			{},
		);

		return { initialCategories, initialProductsMap };
	} catch {
		return { initialCategories: [], initialProductsMap: {} };
	}
}

const page = async () => {
	const { initialCategories, initialProductsMap } = await fetchHomeData();

	return (
		<AppLayout>
			{/* ── 1. Hero ── */}
			<AllCategorySection />

			{/* ── 2. What we do ── */}
			<WhatWeDoSection />

			{/* ── 3. Products (with gaming banner between groups) ── */}
			<SortedProducts
				middleBanner={<MachineMaintenance />}
				initialCategories={initialCategories}
				initialProductsMap={initialProductsMap}
			/>

			{/* ── 4. FAQ ── */}
			<HomeFaqSection />
		</AppLayout>
	);
};

export default page;
