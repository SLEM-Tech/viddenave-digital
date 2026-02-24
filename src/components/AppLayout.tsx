import { ReactNode } from "react";
import Header from "./Navbars/Header";
import Footer from "./Footers/Footer";

interface AppLayoutProps {
	children: ReactNode;
	className?: string;
}

const AppLayout = ({ children, className }: AppLayoutProps) => {
	return (
		<main className={`relative`}>
			<Header />
			{/*
			  pt offsets the fixed header:
			  mobile  ≈ 120 px  (logo row + search row)
			  desktop ≈ 76 px   (floating pill header: py-3 outer + py-2.5 pill + h-8 logo)
			*/}
			<div className={`min-h-screen pt-[120px] slg:pt-[76px] ${className}`}>
				{children}
			</div>
			<Footer />
		</main>
	);
};

export default AppLayout;
