"use client";
import AppLayout from "@src/components/AppLayout";
import SearchDataOutput from "@src/components/PageFragments/SearchDataOutput";
import { useProductSearch } from "@src/components/lib/woocommerce";
import { useSearchParams, useRouter } from "next/navigation";
import React, { useState, useTransition } from "react";
import { FiSearch } from "react-icons/fi";

const Page = () => {
	const router = useRouter();
	const searchParams = useSearchParams().toString();
	const initialQuery = searchParams.replace(/=$/, "").toLowerCase();

	const [inputValue, setInputValue] = useState(initialQuery);
	const [, startTransition] = useTransition();

	const { data: products, isLoading } = useProductSearch(initialQuery);

	const Products: ProductType[] = products || [];
	const ProductsTotal = Products?.length;

	const handleSearch = (e: React.FormEvent) => {
		e.preventDefault();
		if (!inputValue.trim()) return;
		startTransition(() => {
			router.push(`/search?${inputValue.trim()}`);
		});
	};

	return (
		<AppLayout>
			<div className='max-w-[1440px] mx-auto px-4 sm:px-8 py-10 min-h-[60vh]'>

				{/* Search bar */}
				<form onSubmit={handleSearch} className='flex items-center max-w-2xl mx-auto mb-10'>
					<div className='flex flex-1 items-center border border-gray-200 bg-gray-50 rounded-l-sm overflow-hidden'>
						<input
							type='text'
							value={inputValue}
							onChange={(e) => setInputValue(e.target.value)}
							placeholder='Search for products…'
							className='flex-1 h-12 text-sm bg-transparent pl-4 pr-3 outline-none text-gray-900 placeholder-gray-400'
						/>
					</div>
					<button
						type='submit'
						className='h-12 px-6 flex items-center gap-2 text-white text-sm font-semibold transition-opacity hover:opacity-90 rounded-r-sm flex-shrink-0'
						style={{ background: "#3734A9" }}
					>
						<FiSearch className='text-base' />
						Search
					</button>
				</form>

				{/* Results */}
				{!isLoading && initialQuery && ProductsTotal === 0 ? (
					<div className='flex flex-col items-center py-20 text-center'>
						<p className='text-4xl mb-4'>😞</p>
						<h3 className='text-lg font-semibold text-gray-800 mb-1'>
							No results for &ldquo;{initialQuery}&rdquo;
						</h3>
						<p className='text-sm text-gray-400'>
							Try a different keyword or browse our categories.
						</p>
					</div>
				) : (
					<>
						{!isLoading && initialQuery && (
							<p className='text-sm text-gray-500 mb-6'>
								Showing{" "}
								<span className='font-bold text-gray-900'>{ProductsTotal}</span>{" "}
								result{ProductsTotal !== 1 ? "s" : ""} for &ldquo;{initialQuery}&rdquo;
							</p>
						)}
						<SearchDataOutput data={Products} isloading={isLoading} />
					</>
				)}
			</div>
		</AppLayout>
	);
};

export default Page;
