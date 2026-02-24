import React from "react";
import ProductCard2 from "../Cards/ProductCard2";

interface SearchDataOutputProps {
	data: ProductType[];
	isloading: boolean;
}

const SearchDataOutput = ({ data, isloading }: SearchDataOutputProps) => {
	if (isloading) {
		return (
			<div className='grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4 w-full'>
				{Array.from({ length: 8 }).map((_, i) => (
					<div key={i} className='rounded-2xl bg-white overflow-hidden animate-pulse'>
						<div className='aspect-square bg-gray-100' />
						<div className='p-4 space-y-2'>
							<div className='h-4 bg-gray-100 rounded w-3/4' />
							<div className='h-4 bg-gray-100 rounded w-1/2' />
							<div className='h-6 bg-gray-100 rounded w-1/3 mt-2' />
						</div>
					</div>
				))}
			</div>
		);
	}

	return (
		<div className='grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4 w-full'>
			{data?.map((product) => (
				<ProductCard2
					key={product?.id}
					id={product?.id}
					image={product?.images[0]?.src}
					oldAmount={product?.regular_price}
					newAmount={product?.price}
					description={product?.name}
				/>
			))}
		</div>
	);
};

export default SearchDataOutput;
