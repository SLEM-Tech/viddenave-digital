-- ============================================================
-- Viddenave Seed Data v4 — Computers, Accessories & Related Hardware
-- Run via: GET /api/db/seed?secret=seed-db-2024
-- ============================================================

-- ── Categories ───────────────────────────────────────────────

-- Parent categories
INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count) VALUES
  ('Computer Accessories',       'computer-accessories',   'Keyboards, mice, monitors and peripheral equipment',               NULL, 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400', 0),
  ('Storage & Memory',           'storage-memory',         'External SSDs, HDDs, USB drives and memory cards',                 NULL, 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400', 0),
  ('Networking Equipment',       'networking',             'Routers, switches, network adapters and cabling',                  NULL, 'https://images.unsplash.com/photo-1606904825846-647eb07f5be2?w=400', 0),
  ('Computers',                  'computers',              'Laptops, desktops, workstations and all-in-one computers',         NULL, 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=400', 0),
  ('Hardware Components',        'hardware-components',    'CPUs, GPUs, RAM, motherboards and other internal components',       NULL, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400', 0),
  ('Printers & Scanners',        'printers-scanners',      'Inkjet, laser printers, flatbed and document scanners',            NULL, 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=400', 0),
  ('Power & UPS',                'power-ups',              'UPS systems, surge protectors and power banks',                    NULL, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400', 0),
  ('Cables & Adapters',          'cables-adapters',        'HDMI, USB-C, Thunderbolt and display cables',                      NULL, 'https://images.unsplash.com/photo-1601597111158-2fceff292cdc?w=400', 0)
ON CONFLICT (slug) DO NOTHING;

-- Sub-categories

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Keyboards & Mice', 'keyboards-mice', 'Mechanical keyboards, ergonomic mice and combos', id,
  'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400', 0
FROM viddenave_categories WHERE slug = 'computer-accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Monitors & Displays', 'monitors-displays', '4K, QHD and curved monitors for work and gaming', id,
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=400', 0
FROM viddenave_categories WHERE slug = 'computer-accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Headphones & Earbuds', 'headphones-earbuds', 'Over-ear, on-ear and in-ear audio devices', id,
  'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400', 0
FROM viddenave_categories WHERE slug = 'computer-accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Speakers & Microphones', 'speakers-microphones', 'Desktop speakers, studio monitors and USB microphones', id,
  'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400', 0
FROM viddenave_categories WHERE slug = 'computer-accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Webcams', 'webcams', 'HD and 4K webcams for video calls and streaming', id,
  'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=400', 0
FROM viddenave_categories WHERE slug = 'computer-accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Laptop Bags & Cases', 'laptop-bags-cases', 'Backpacks, sleeves and hard cases for laptops and tablets', id,
  'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400', 0
FROM viddenave_categories WHERE slug = 'computer-accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Cooling Pads', 'cooling-pads', 'Laptop cooling pads and notebook stands', id,
  'https://images.unsplash.com/photo-1593642533144-3d62aa4783ec?w=400', 0
FROM viddenave_categories WHERE slug = 'computer-accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'External Storage', 'external-storage', 'Portable SSDs and external hard drives', id,
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400', 0
FROM viddenave_categories WHERE slug = 'storage-memory' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'USB Flash Drives', 'usb-drives', 'High-speed USB 3.x flash drives and OTG drives', id,
  'https://images.unsplash.com/photo-1618424181497-157f25b6ddd5?w=400', 0
FROM viddenave_categories WHERE slug = 'storage-memory' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Internal SSDs & HDDs', 'internal-storage', 'M.2 NVMe SSDs, SATA SSDs and 3.5" hard drives', id,
  'https://images.unsplash.com/photo-1531492746076-161ca9bcad58?w=400', 0
FROM viddenave_categories WHERE slug = 'storage-memory' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Memory Cards', 'memory-cards', 'SD, microSD and CFexpress memory cards', id,
  'https://images.unsplash.com/photo-1618424181497-157f25b6ddd5?w=400', 0
FROM viddenave_categories WHERE slug = 'storage-memory' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Routers & Modems', 'routers-modems', 'WiFi 6/6E routers, mesh systems and ADSL modems', id,
  'https://images.unsplash.com/photo-1606904825846-647eb07f5be2?w=400', 0
FROM viddenave_categories WHERE slug = 'networking' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Network Adapters', 'network-adapters', 'USB WiFi adapters, PCIe cards and Ethernet dongles', id,
  'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=400', 0
FROM viddenave_categories WHERE slug = 'networking' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Laptops', 'laptops', 'Thin-and-light, business and gaming laptops', id,
  'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400', 0
FROM viddenave_categories WHERE slug = 'computers' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Desktops & Workstations', 'desktops-workstations', 'Tower PCs, mini-PCs and professional workstations', id,
  'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400', 0
FROM viddenave_categories WHERE slug = 'computers' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Processors & CPUs', 'processors-cpus', 'Intel and AMD desktop and laptop processors', id,
  'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400', 0
FROM viddenave_categories WHERE slug = 'hardware-components' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Graphics Cards (GPUs)', 'graphics-cards', 'NVIDIA and AMD discrete graphics cards for gaming and workstations', id,
  'https://images.unsplash.com/photo-1591489378430-ef2f4c626b35?w=400', 0
FROM viddenave_categories WHERE slug = 'hardware-components' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Memory (RAM)', 'memory-ram', 'DDR4 and DDR5 desktop and laptop RAM modules', id,
  'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=400', 0
FROM viddenave_categories WHERE slug = 'hardware-components' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Cooling & Cases', 'cooling-cases', 'AIO liquid coolers, air coolers and PC chassis', id,
  'https://images.unsplash.com/photo-1587202372583-49330a15584d?w=400', 0
FROM viddenave_categories WHERE slug = 'hardware-components' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Power Supplies & Motherboards', 'psu-motherboards', '80+ rated PSUs and ATX/mATX motherboards', id,
  'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400', 0
FROM viddenave_categories WHERE slug = 'hardware-components' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Inkjet Printers', 'inkjet-printers', 'Home and office inkjet printers and multifunction devices', id,
  'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=400', 0
FROM viddenave_categories WHERE slug = 'printers-scanners' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Laser Printers', 'laser-printers', 'Monochrome and colour laser printers for office use', id,
  'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=400', 0
FROM viddenave_categories WHERE slug = 'printers-scanners' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'UPS Systems', 'ups-systems', 'Uninterruptible power supplies for PCs and servers', id,
  'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400', 0
FROM viddenave_categories WHERE slug = 'power-ups' ON CONFLICT (slug) DO NOTHING;

INSERT INTO viddenave_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Surge Protectors', 'surge-protectors', 'Multi-outlet surge protectors and power strips', id,
  'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400', 0
FROM viddenave_categories WHERE slug = 'power-ups' ON CONFLICT (slug) DO NOTHING;

-- ── PRODUCTS ─────────────────────────────────────────────────
-- === LAPTOPS ===

-- 1. ASUS ZenBook Pro 14 OLED
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'ASUS ZenBook Pro 14 OLED (Intel Core i9, 32GB RAM, 1TB SSD)',
  'asus-zenbook-pro-14-oled-i9-32gb-1tb',
  'ASUS-ZNBKP14-I9-32-1T',
  'The ASUS ZenBook Pro 14 OLED is the ultimate creator laptop with a stunning 14.5" 2.8K OLED 120Hz display covering 100% DCI-P3 and VESA DisplayHDR 600 True Black certification. Powered by Intel Core i9-13900H, NVIDIA GeForce RTX 4060 8GB and 32GB DDR5 RAM with 1TB PCIe 4.0 SSD. ASUS DialPad physical rotary controller for creative apps. Thunderbolt 4, Wi-Fi 6E, HDMI 2.1 and a 75Whr battery. Under 1.65kg.',
  'Creator laptop — Core i9, RTX 4060, 2.8K OLED 120Hz, DialPad rotary controller',
  1750000, 1980000, 1750000, 'instock', 10, 38, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 2. Samsung Galaxy Book3 Ultra
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Samsung Galaxy Book3 Ultra (Core i9, 32GB, 1TB, RTX 4070)',
  'samsung-galaxy-book3-ultra-i9-32gb-1tb',
  'SAM-GB3ULTRA-I9-32-1T',
  'The Samsung Galaxy Book3 Ultra is the definitive Windows laptop for power users and creators. 16" Dynamic AMOLED 2X display (2880×1800, 120Hz, 500 nits, 100% DCI-P3). Intel Core i9-13900H processor, NVIDIA GeForce RTX 4070 Laptop GPU 8GB, 32GB LPDDR5 RAM and 1TB NVMe SSD. Galaxy ecosystem integration — mirror your Galaxy phone display, share files instantly and answer calls from your laptop. Two Thunderbolt 4, Wi-Fi 6E, Bluetooth 5.3.',
  'Samsung flagship laptop — 16" AMOLED 2X 120Hz, Core i9, RTX 4070, Galaxy ecosystem',
  1950000, 2200000, 1950000, 'instock', 8, 34, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 3. Intel NUC 13 Pro Mini PC
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Intel NUC 13 Pro Mini PC (Core i7, 32GB, 1TB SSD)',
  'intel-nuc-13-pro-i7-32gb-1tb',
  'INT-NUC13P-I7-32-1T',
  'The Intel NUC 13 Pro is an ultra-compact mini PC that punches well above its size. Powered by 13th Gen Intel Core i7-1360P, 32GB DDR4 SO-DIMM RAM (2 slots, upgradeable) and a 1TB NVMe SSD. Drives up to four 4K displays simultaneously via Thunderbolt 4, two HDMI 2.0 and USB-C. Wi-Fi 6E, Bluetooth 5.3, six USB-A 3.2 Gen 2 ports. Whisper-quiet fan. Windows 11 Pro pre-installed. VESA and desk-mounting kit included.',
  'Ultra-compact mini PC — Core i7 13th Gen, 4-display support, Thunderbolt 4, Wi-Fi 6E',
  685000, 780000, 685000, 'instock', 14, 28, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 4. HP Spectre x360 14
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'HP Spectre x360 14" 2-in-1 Laptop (Core i7, 16GB, 1TB)',
  'hp-spectre-x360-14-i7-16gb-1tb',
  'HP-SPCX360-I7-16-1T',
  'The HP Spectre x360 14 is a premium 2-in-1 convertible laptop powered by 13th Gen Intel Core i7-1355U. Features a stunning 13.5" 2.8K OLED touchscreen with 400 nits brightness and HP Sure View Reflect privacy screen. 16GB LPDDR5 RAM and 1TB PCIe NVMe SSD. Dual Thunderbolt 4 ports, Wi-Fi 6E, Bluetooth 5.3. Gem-cut CNC aluminium chassis in Nightfall Black. Up to 17-hour battery life.',
  'Premium 2-in-1 with 13.5" 2.8K OLED touch, Core i7 13th Gen, 17h battery',
  1650000, 1850000, 1650000, 'instock', 18, 34, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 5. Lenovo ThinkPad X1 Carbon Gen 11
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Lenovo ThinkPad X1 Carbon Gen 11 (Core i7, 16GB, 512GB)',
  'lenovo-thinkpad-x1-carbon-gen11',
  'LNV-X1CG11-I7-16-512',
  'The legendary ThinkPad X1 Carbon Gen 11 is the ultimate business ultrabook. Weighing just 1.12 kg with a 14" IPS display (1920×1200, 400 nits). Powered by 13th Gen Intel Core i7-1365U vPro, 16GB LPDDR5 RAM and 512GB PCIe Gen 4 SSD. MIL-SPEC 810H tested for 12 categories. Two Thunderbolt 4, two USB-A 3.2, HDMI 2.0, Wi-Fi 6E, 4G LTE option.',
  'Ultra-light business laptop — 1.12kg, 14" IPS, MIL-SPEC 810H, ThinkPad reliability',
  1950000, 2200000, 1950000, 'instock', 12, 41, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 6. ASUS ROG Zephyrus G14
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'ASUS ROG Zephyrus G14 Gaming Laptop (Ryzen 9, 16GB, 1TB, RX 7600S)',
  'asus-rog-zephyrus-g14-r9-16gb-1tb',
  'ASUS-ZEPG14-R9-16-1T',
  'The ASUS ROG Zephyrus G14 packs incredible power into a compact 14" chassis. AMD Ryzen 9 7940HS with AMD Radeon RX 7600S (8GB GDDR6) delivers exceptional gaming and creative performance. 14" QHD+ (2560×1600) 165Hz Nebula Display with 3ms response time. 16GB DDR5 RAM, 1TB PCIe 4.0 SSD. ROG AniMe Matrix LED lid display. Under 1.7kg.',
  'Compact 14" gaming laptop — Ryzen 9, RX 7600S, QHD+ 165Hz, ROG AniMe Matrix',
  1480000, 1680000, 1480000, 'instock', 10, 39, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 7. Acer Swift X 14
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Acer Swift X 14 Creator Laptop (Ryzen 7, 16GB, 512GB, RTX 3050)',
  'acer-swift-x-14-r7-16gb-512gb',
  'ACR-SWFTX14-R7-16-512',
  'The Acer Swift X 14 is a slim creator laptop that packs discrete GPU power into a 1.4 kg aluminium body. AMD Ryzen 7 7745H processor with NVIDIA GeForce RTX 3050 (4GB) for creative workloads and light gaming. 14.5" 2.5K (2560×1600) IPS display with 100% sRGB, 16GB LPDDR5 RAM, 512GB PCIe NVMe SSD. Thunderbolt 4, USB-A 3.2, HDMI 2.0, SD card reader. Up to 12 hours battery.',
  'Slim creator laptop — Ryzen 7, RTX 3050, 2.5K 100% sRGB display, 1.4kg',
  985000, 1150000, 985000, 'instock', 22, 28, 4.60, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 8. Microsoft Surface Laptop 5
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Microsoft Surface Laptop 5 13.5" (Core i5, 8GB, 256GB)',
  'microsoft-surface-laptop-5-i5-8gb-256gb',
  'MSF-SRL5-I5-8-256',
  'The Microsoft Surface Laptop 5 pairs beautiful design with powerful performance. 12th Gen Intel Core i5-1235U processor, 8GB LPDDR5x RAM and 256GB SSD. 13.5" PixelSense touchscreen (2256×1504, 201 PPI) with Dolby Vision IQ. USB-C with Thunderbolt 4, USB-A 3.1, Surface Connect, headphone jack. Weighs just 1.27 kg. Ideal for students and professionals.',
  'Elegant 13.5" touchscreen laptop — Core i5, PixelSense display, 1.27kg',
  1250000, 1400000, 1250000, 'instock', 15, 33, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 9. Lenovo IdeaPad Gaming 3
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Lenovo IdeaPad Gaming 3 15" (Ryzen 5, 8GB, 512GB, RTX 3050)',
  'lenovo-ideapad-gaming-3-r5-8gb-512gb',
  'LNV-IPG3-R5-8-512',
  'The Lenovo IdeaPad Gaming 3 is the ideal entry-level gaming laptop for students and budget-conscious gamers. Powered by AMD Ryzen 5 7535H and NVIDIA GeForce RTX 3050 6GB, it handles popular titles at 1080p medium to high settings. 15.6" FHD IPS 120Hz anti-glare display with 250 nits brightness. 8GB DDR5 RAM (upgradeable to 16GB), 512GB PCIe NVMe SSD. Wi-Fi 6, USB-A 3.2, USB-C 3.2, HDMI 2.0.',
  'Budget gaming laptop — Ryzen 5, RTX 3050, 15.6" 120Hz FHD, upgradeable RAM',
  685000, 780000, 685000, 'instock', 30, 52, 4.55, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 10. HP Pavilion Desktop Tower
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'HP Pavilion Desktop Tower (Core i7-13700, 16GB, 1TB HDD + 256GB SSD)',
  'hp-pavilion-desktop-i7-13700-16gb',
  'HP-PAVTWR-I7-13700',
  'The HP Pavilion Desktop Tower delivers reliable everyday performance for home and small office. Powered by 13th Gen Intel Core i7-13700 (16 cores), 16GB DDR4 RAM (expandable to 64GB), 256GB SSD + 1TB HDD storage combo. Integrated Intel UHD Graphics 770. Two USB-A 3.2, two USB-A 2.0, USB-C 3.2, HDMI, DisplayPort, SD card reader. Windows 11 Home pre-installed.',
  'Versatile family desktop — Core i7-13700, dual storage, expandable to 64GB RAM',
  680000, 780000, 680000, 'instock', 25, 22, 4.55, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 11. Apple Mac Mini M2
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Apple Mac Mini M2 (8GB RAM, 256GB SSD)',
  'apple-mac-mini-m2-8gb-256gb',
  'APL-MACMINI-M2-8-256',
  'The Apple Mac Mini with M2 chip packs extraordinary performance into a compact desktop. The M2 chip features an 8-core CPU and 10-core GPU — up to 2x faster than the previous generation. Supports up to two displays simultaneously (one via HDMI 2.0, one via Thunderbolt). Two Thunderbolt 4 ports, two USB-A 3.1, HDMI 2.0, 3.5mm audio jack and Gigabit Ethernet. Wi-Fi 6E and Bluetooth 5.3.',
  'Compact powerhouse desktop — M2 chip, 2-display support, Wi-Fi 6E',
  680000, 780000, 680000, 'instock', 20, 47, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 12. ASUS ROG Strix Gaming Desktop
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'ASUS ROG Strix G15 Gaming Desktop (Core i9, 32GB, 2TB, RTX 4080)',
  'asus-rog-strix-g15-i9-32gb-rtx4080',
  'ASUS-ROGG15-I9-32-4080',
  'The ASUS ROG Strix G15 is the ultimate pre-built gaming desktop. Powered by Intel Core i9-13900KF, NVIDIA GeForce RTX 4080 16GB, 32GB DDR5 5600MHz RAM and 2TB PCIe 4.0 SSD. Distinctive Polyaxial System Architecture (PASA) chassis with front-mounted airflow vents and ARGB lighting. Pre-installed Windows 11 Home. Thunderbolt 4, Wi-Fi 6E, Bluetooth 5.2.',
  'Ultimate gaming desktop — Core i9-13900KF, RTX 4080 16GB, 32GB DDR5',
  3850000, 4300000, 3850000, 'instock', 6, 18, 4.90, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 13. Dell Inspiron 15 3000
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Dell Inspiron 15 3000 Laptop (Core i5-1235U, 8GB, 256GB SSD)',
  'dell-inspiron-15-3000-i5-8gb-256gb',
  'DEL-INS15-I5-8-256',
  'The Dell Inspiron 15 3000 is a reliable everyday laptop for students, home users and light business use. Powered by 12th Gen Intel Core i5-1235U with Intel Iris Xe graphics, 8GB DDR4 RAM and 256GB PCIe SSD. 15.6" FHD (1920×1080) anti-glare display with 250 nits brightness. SD card reader, USB-C 3.2 Gen 1, two USB-A 3.2, HDMI 1.4, RJ-45 Ethernet, Wi-Fi 6 and Bluetooth 5.2. Windows 11 Home included.',
  'Reliable everyday laptop — Core i5, 15.6" FHD, Ethernet port, Wi-Fi 6',
  520000, 598000, 520000, 'instock', 40, 46, 4.50, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 14. MacBook Air M2
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Apple MacBook Air 13" M2 (8GB RAM, 256GB SSD, Midnight)',
  'apple-macbook-air-m2-8gb-256gb',
  'APL-MBA13-M2-8-256',
  'The MacBook Air powered by M2 is impossibly thin at just 11.3mm and 1.24kg. The M2 chip delivers up to 18 hours of battery life with a fanless design, keeping the laptop completely silent at all times. The 13.6" Liquid Retina display covers 100% sRGB, and a 1080p FaceTime HD camera. MagSafe 3 charging port, two Thunderbolt 4 ports and a 3.5mm headphone jack with high-impedance headphone support.',
  'Fanless ultrabook — M2 chip, 18h battery, 13.6" Liquid Retina, MagSafe 3',
  1450000, 1620000, 1450000, 'instock', 25, 71, 4.90, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 15. HP EliteBook 840 G10
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'HP EliteBook 840 G10 Business Laptop (Core i7-1355U, 16GB, 512GB)',
  'hp-elitebook-840-g10-i7-16gb-512gb',
  'HP-EB840G10-I7-16-512',
  'The HP EliteBook 840 G10 is an enterprise-grade business laptop built to MIL-STD 810H standards for drop, shock, vibration and temperature resistance. 13th Gen Intel Core i7-1355U vPro, 16GB LPDDR5 RAM and 512GB PCIe Gen 4 SSD. 14" IPS display at 1920×1200 with 400 nits, anti-glare, low blue light. HP Sure View privacy screen option. Thunderbolt 4, USB-A 3.2, HDMI 2.0, SD card reader and 4G LTE option.',
  'Enterprise business laptop — MIL-STD 810H, Core i7 vPro, 400-nit display, 4G LTE',
  1850000, 2100000, 1850000, 'instock', 14, 24, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === MONITORS ===

-- 16. Samsung 32" Odyssey G7 QLED 240Hz
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Samsung 32" Odyssey G7 QLED 240Hz Gaming Monitor',
  'samsung-32-odyssey-g7-qled-240hz',
  'SAM-LS32G75-240',
  'The Samsung Odyssey G7 32" delivers a 2560×1440 QLED VA panel with 240Hz refresh rate and 1ms MPRT response time. QLED quantum dot technology covers 95% DCI-P3 for vivid, accurate colours. DisplayHDR 600 certification provides 600 nits peak brightness and true local dimming. NVIDIA G-Sync Compatible and AMD FreeSync Premium Pro. 1000R curvature immerses you in games. Two HDMI 2.0 and one DisplayPort 1.4.',
  '32" QLED VA 240Hz, HDR600, 1000R curve — G-Sync & FreeSync Premium Pro',
  320000, 365000, 320000, 'instock', 12, 38, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 17. BenQ PD2705U 27" 4K Designer Monitor
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'BenQ PD2705U 27" 4K IPS Designer Monitor',
  'benq-pd2705u-27-4k-designer',
  'BNQ-PD2705U-4K',
  'The BenQ PD2705U is engineered for designers and content creators. 27" 4K IPS panel with 100% sRGB and 95% DCI-P3 colour accuracy ensures what you see matches what you print or publish. Built-in KVM switch lets you control two computers with one keyboard and mouse. USB-C with 65W power delivery, Thunderbolt 4 passthrough and 4-port USB hub. Eye-Care technology with flicker-free and Low Blue Light certified by TÜV Rheinland.',
  '27" 4K designer display — 100% sRGB, 95% DCI-P3, KVM switch, 65W USB-C',
  295000, 340000, 295000, 'instock', 9, 29, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 18. LG 27" UltraGear 1440p 165Hz
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'LG 27" UltraGear QHD 165Hz IPS Gaming Monitor (27GP850-B)',
  'lg-27-ultragear-qhd-165hz',
  'LG-27GP850B-QHD',
  'The LG 27GP850-B UltraGear features a 27" Nano IPS panel at 2560×1440 (QHD) with a blazing 165Hz refresh rate (overclockable to 180Hz) and 1ms GtG response time. Wide colour gamut covers 98% DCI-P3 for vibrant, lifelike visuals. NVIDIA G-Sync Compatible and AMD FreeSync Premium certified. Anti-glare coating, HDMI 2.0 (x2) and DisplayPort 1.4. Height, tilt and pivot adjustable stand. VESA 100×100 mountable.',
  '27" QHD Nano IPS 165Hz — 1ms GtG, 98% DCI-P3, G-Sync Compatible, pivot stand',
  195000, 228000, 195000, 'instock', 20, 55, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 19. Dell UltraSharp 24" 4K USB-C
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Dell UltraSharp 24" 4K USB-C Monitor (U2422DE)',
  'dell-ultrasharp-24-4k-usbc-u2422de',
  'DEL-U2422DE-4K',
  'The Dell UltraSharp U2422DE is a 23.8" 4K IPS monitor precision-calibrated from the factory for Delta E < 2 colour accuracy. Covers 100% sRGB and 100% Rec. 709 colour spaces. USB-C with 90W power delivery charges your laptop while displaying video. Built-in USB hub with RJ-45 Ethernet pass-through. Compatible with Thunderbolt 3/4 and USB-C laptops. Anti-glare, flicker-free and ComfortView Low Blue Light certified.',
  '24" 4K IPS monitor — factory calibrated, 90W USB-C, Ethernet hub, Delta E < 2',
  195000, 230000, 195000, 'instock', 18, 41, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 20. ASUS ProArt 32" 4K OLED
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'ASUS ProArt PA32DC 32" 4K OLED Professional Monitor',
  'asus-proart-pa32dc-32-4k-oled',
  'ASUS-PA32DC-4K-OLED',
  'The ASUS ProArt PA32DC features a 31.5" 4K UHD OLED panel with true 10-bit colour depth, covering 99% DCI-P3 and 99% Adobe RGB. Infinite contrast ratio and 0.1ms response time make it ideal for video production, colour grading and high-end photography work. ASUS ProArt Calibration technology and a built-in colour sensor ensure ongoing accuracy. Thunderbolt 4, USB-C 90W, HDMI 2.0 (x2) and a four-port USB hub.',
  '32" 4K OLED pro monitor — 99% DCI-P3, infinite contrast, Thunderbolt 4, 90W USB-C',
  850000, 980000, 850000, 'instock', 6, 18, 4.90, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === KEYBOARDS & MICE ===

-- 21. Apple Magic Keyboard
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Apple Magic Keyboard with Touch ID and Numeric Keypad (Space Grey)',
  'apple-magic-keyboard-touch-id-numeric',
  'APL-MGKBD-TID-NUM',
  'The Apple Magic Keyboard with Touch ID and Numeric Keypad features a low-profile scissor-switch mechanism with 1mm key travel for quiet, comfortable typing. Touch ID enables secure fingerprint login and Apple Pay authentication on compatible Macs. Rechargeable built-in battery lasts about a month. Connects via USB-C to pair and charge, then works wirelessly via Bluetooth. Compatible with macOS 12.3+ (M-series or T2 chip Mac required for Touch ID).',
  'Apple wireless keyboard — Touch ID fingerprint login, numeric keypad, 1-month battery',
  68000, 78000, 68000, 'instock', 42, 47, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 22. SteelSeries Apex Pro TKL Wireless
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'SteelSeries Apex Pro TKL Wireless Mechanical Keyboard',
  'steelseries-apex-pro-tkl-wireless',
  'STS-APXPRO-TKL-WL',
  'The SteelSeries Apex Pro TKL Wireless is the world''s first keyboard with adjustable mechanical switches. OmniPoint 2.0 magnetic switches let you tune actuation from 0.2mm to 3.8mm per key for the perfect balance of speed and accuracy. Quantum 2.0 Wireless (2.4GHz, 1ms polling) plus Bluetooth and USB wired. OLED display shows game stats and macros. 35-hour battery life. Per-key RGB. 100% anti-ghosting.',
  'Adjustable actuation wireless keyboard — OmniPoint 2.0, OLED display, 35h battery',
  125000, 145000, 125000, 'instock', 18, 33, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 23. Keychron K2 Pro Wireless Mechanical Keyboard
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Keychron K2 Pro QMK/VIA Wireless Mechanical Keyboard',
  'keychron-k2-pro-wireless-mechanical',
  'KCH-K2PRO-RED-BT',
  'The Keychron K2 Pro is a compact 75% wireless mechanical keyboard with QMK/VIA support for full key remapping and macro programming. Hot-swappable PCB accepts any 3-pin or 5-pin MX switches. Connects via Bluetooth 5.1 (up to 3 devices) or USB-C wired. White backlight (RGB optional). Aluminium frame, doubleshot PBT keycaps, screw-in stabilisers. Compatible with macOS and Windows with dedicated layout switch.',
  '75% wireless mechanical keyboard — QMK/VIA, hot-swap, Bluetooth 3-device, aluminium',
  72000, 85000, 72000, 'instock', 35, 49, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 24. Corsair K100 RGB Optical-Mechanical Keyboard
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Corsair K100 RGB Optical-Mechanical Gaming Keyboard',
  'corsair-k100-rgb-optical-keyboard',
  'COR-K100-RGB-OPX',
  'The Corsair K100 RGB is Corsair''s flagship gaming keyboard featuring CORSAIR OPX optical-mechanical switches rated for 150 million keystrokes. 0.4mm actuation, zero debounce delay — the fastest key response available. iCUE Control Wheel with 6 programmable commands. 44-zone per-key dynamic RGB backlighting. Aluminium frame. 8000Hz hyper-polling rate. USB-C detachable cable. 8MB onboard storage for 50 lighting/macro profiles.',
  'Flagship optical-mechanical keyboard — OPX switches, 8000Hz polling, iCUE Control Wheel',
  145000, 168000, 145000, 'instock', 15, 36, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 25. Logitech MX Master 3S
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Logitech MX Master 3S Wireless Performance Mouse',
  'logitech-mx-master-3s-wireless-mouse',
  'LOG-MXMSTR3S-GRY',
  'The Logitech MX Master 3S is the pinnacle of productivity mice. Quiet Click buttons reduce noise by 90% while maintaining tactile feel. MagSpeed electromagnetic scroll wheel flips between precise click-to-click and free-spinning modes automatically. 8K DPI Darkfield sensor tracks on any surface, including glass. Easy-Switch button pairs up to 3 computers. USB-C rechargeable — 70 days per charge. Works with Logi Options+ for customisation.',
  'Flagship productivity mouse — MagSpeed scroll, 8K DPI, 3-device pairing, USB-C',
  85000, 98000, 85000, 'instock', 32, 67, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 26. Razer DeathAdder V3 HyperSpeed
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Razer DeathAdder V3 HyperSpeed Wireless Gaming Mouse',
  'razer-deathadder-v3-hyperspeed',
  'RZR-DAV3-HSPD-BLK',
  'The Razer DeathAdder V3 HyperSpeed combines Razer HyperSpeed wireless technology with the award-winning ergonomic DeathAdder shape at 77g. Focus Pro 30K optical sensor with 99.6% resolution accuracy. Razer HyperPolling Wireless Dongle (sold separately) supports 4000Hz polling rate. 70-hour battery life. 6 programmable buttons. Razer Synapse compatible. Connects via USB nano-receiver (2.4GHz) or Bluetooth.',
  '77g wireless gaming mouse — 30K DPI, HyperSpeed wireless, 70h battery',
  65000, 78000, 65000, 'instock', 28, 44, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 27. Microsoft Arc Mouse
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Microsoft Arc Bluetooth Mouse (Glacier)',
  'microsoft-arc-mouse-glacier',
  'MSF-ARCMOUSE-GLC',
  'The Microsoft Arc Mouse flattens completely for ultra-slim travel and snaps into a comfortable curved shape when you are ready to use it. Bluetooth 5.0 — pairs with up to 3 devices simultaneously via Easy Switch. A unique touch scroll strip provides smooth, precise scrolling. 6-month battery life on 2x AAA batteries. Blades Scroll technology enables horizontal and vertical scrolling. Compatible with Windows, macOS, Android, iOS.',
  'Fold-flat travel mouse — Bluetooth 5.0, touch scroll strip, 6-month battery',
  52000, 62000, 52000, 'instock', 40, 38, 4.55, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 28. Logitech G Pro X Superlight 2
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Logitech G Pro X Superlight 2 Wireless Gaming Mouse',
  'logitech-g-pro-x-superlight-2',
  'LOG-GPROXSL2-WHT',
  'The Logitech G Pro X Superlight 2 weighs less than 60 grams while delivering the HERO 2 sensor with up to 32,000 DPI and zero smoothing. LIGHTSPEED wireless delivers less than 1ms connection. Designed with input from pro esports athletes for tournament play. 95-hour battery life on a single charge. Ambidextrous shape. Minimal design with no RGB. Includes rubber feet replacements in the box.',
  'Ultra-light 60g gaming mouse — 32K DPI, LIGHTSPEED, 95h battery, pro esports design',
  95000, 112000, 95000, 'instock', 22, 58, 4.90, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === HEADPHONES & AUDIO ===

-- 29. Sony WH-1000XM5
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Sony WH-1000XM5 Wireless Noise-Cancelling Headphones',
  'sony-wh-1000xm5-wireless-headphones',
  'SNY-WH1000XM5-BLK',
  'The Sony WH-1000XM5 sets the benchmark for wireless noise-cancelling headphones. Eight microphones and two processors power the industry-leading Auto NC Optimizer and Precise Voice Pickup Technology for crystal-clear calls. 30 hours battery life (quick charge: 3 hours in 3 minutes). Hi-Res Audio, LDAC codec (up to 990kbps), Speak-to-Chat, Multipoint connection (2 devices simultaneously). Foldable design with carry case.',
  'Best-in-class ANC headphones — 30h battery, LDAC, multipoint, quick charge',
  195000, 225000, 195000, 'instock', 28, 68, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 30. Bose QuietComfort 45
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Bose QuietComfort 45 Wireless Bluetooth Headphones',
  'bose-quietcomfort-45',
  'BSE-QC45-BLK',
  'The Bose QuietComfort 45 delivers the signature Bose comfort with world-class noise cancellation. Quiet Mode for deep ANC, Aware Mode to let ambient sound in. 24-hour battery life with quick charge (15 minutes = 3 hours play). TriPort acoustic architecture and Volume-Optimized EQ deliver clear, balanced audio at every volume. Foldable design. USB-C charging. Works with Alexa and Google Assistant.',
  'Bose signature comfort and ANC — 24h battery, Quiet/Aware modes, USB-C',
  175000, 200000, 175000, 'instock', 22, 55, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 31. JBL Quantum 810 Gaming Headset
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'JBL Quantum 810 Wireless Gaming Headset with ANC',
  'jbl-quantum-810-wireless-gaming-headset',
  'JBL-Q810-BLK',
  'The JBL Quantum 810 delivers immersive gaming audio through JBL QuantumSURROUND 7.1 virtual surround sound and JBL''s 50mm QuantumSphere 360 drivers. Active noise cancellation lets you focus on the game. 2.4GHz wireless and Bluetooth 5.0 dual connection — play and take calls simultaneously. 36-hour battery life. Retractable JBL Quantum Voice Focus microphone. Compatible with PC, PlayStation, Xbox, Nintendo Switch and mobile.',
  'Wireless gaming headset — 7.1 surround, ANC, 36h battery, dual wireless',
  95000, 115000, 95000, 'instock', 30, 38, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 32. Logitech G Pro X 2 LIGHTSPEED Headset
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Logitech G Pro X 2 LIGHTSPEED Wireless Gaming Headset',
  'logitech-g-pro-x-2-lightspeed-wireless',
  'LOG-GPROX2-WIRELESS',
  'The Logitech G Pro X 2 LIGHTSPEED is built to pro-gaming tournament standards. 50mm PRO-G 2 graphene drivers deliver ultra-clear audio with deeper bass. LIGHTSPEED 2.4GHz wireless provides lossless audio with a lag-free connection. 50-hour battery life. Leatherette and velour ear pads included. Blue VO!CE microphone technology with AI noise suppression filters background noise on calls and streams.',
  'Pro-grade wireless headset — 50mm graphene drivers, 50h battery, LIGHTSPEED wireless',
  115000, 135000, 115000, 'instock', 18, 43, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 33. Apple AirPods Pro 2nd Gen
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Apple AirPods Pro (2nd Generation) with MagSafe Case',
  'apple-airpods-pro-2nd-gen',
  'APL-APP2-MAGSAFE',
  'Apple AirPods Pro 2nd Generation feature the H2 chip for up to 2x more Active Noise Cancellation than the previous generation. Adaptive Transparency lets you hear the world naturally while protecting hearing. Personalised Spatial Audio with dynamic head tracking. Up to 6 hours listening with ANC (30 hours total with MagSafe Charging Case). Precision Finding in Find My. IP54 dust and water resistant. Conversation Awareness.',
  'AirPods Pro 2 — H2 chip, 2x ANC, Adaptive Transparency, 30h total battery',
  185000, 210000, 185000, 'instock', 35, 82, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 34. Blue Yeti USB Microphone
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Blue Yeti USB Condenser Microphone (Space Grey)',
  'blue-yeti-usb-microphone-grey',
  'BLU-YETI-USB-GRY',
  'The Blue Yeti is the world''s most popular USB microphone for podcasting, streaming, gaming, and remote work. Three custom condenser capsules in four polar pattern modes: cardioid, bidirectional, omnidirectional and stereo. Plug-and-play USB (no drivers). Built-in headphone amplifier with zero-latency monitoring and real-time gain control. Compatible with Mac, Windows and iOS (with Lightning adapter). Includes desk stand.',
  'World''s most popular USB mic — 4 polar patterns, zero-latency monitoring, plug-and-play',
  65000, 78000, 65000, 'instock', 45, 74, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 35. Creative Pebble V3 Desktop Speakers
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Creative Pebble V3 2.0 USB-C Desktop Speakers',
  'creative-pebble-v3-usb-c-speakers',
  'CRE-PEBV3-BLK',
  'The Creative Pebble V3 delivers impressive 2.0 stereo audio from a compact minimalist design. Dual 2.5" full-range drivers with a 45-degree up-firing angle project sound directly toward your ears for better imaging. USB-C powered and audio connection means a single cable setup. Bluetooth 5.0 for wireless streaming. Far-field microphone for hands-free calls. Optical input, 3.5mm input and USB-C audio all supported simultaneously via the onboard hub.',
  'Minimalist desktop speakers — USB-C, Bluetooth 5.0, optical in, built-in mic',
  28000, 34000, 28000, 'instock', 60, 47, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 36. Razer Nommo V2 Gaming Speakers
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Razer Nommo V2 2.0 PC Gaming Speakers',
  'razer-nommo-v2-gaming-speakers',
  'RZR-NOMV2-BLK',
  'The Razer Nommo V2 gaming speakers feature 3.5" woven glass fibre woofers for deep, room-filling bass without distortion. Chroma RGB underglow with 16.8 million colour options syncs with your Razer setup. USB connection for digital audio, optical input and 3.5mm analogue input. Individual left/right tweeters improve stereo separation. Razer Synapse software for EQ and Chroma customisation. Down-firing bass port for floor-reflected low frequencies.',
  '3.5" woofer gaming speakers — Chroma RGB, USB + optical + 3.5mm inputs',
  55000, 65000, 55000, 'instock', 25, 32, 4.60, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === WEBCAMS ===

-- 37. Logitech BRIO 4K Webcam
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Logitech BRIO 4K Ultra HD Pro Webcam',
  'logitech-brio-4k-webcam',
  'LOG-BRIO-4K-GRY',
  'The Logitech BRIO is the gold standard in webcam technology. 4K Ultra HD 30fps with 1080p at 60fps and 720p at 90fps. RightLight 3 with HDR corrects exposure in challenging lighting conditions. 5x digital zoom, adjustable 65°/78°/90° field of view. Dual omni-directional noise-cancelling microphones with 3-4 metre pickup. Windows Hello and Face ID compatible. USB 3.0. Works with Teams, Zoom, Google Meet and OBS.',
  '4K 30fps webcam — HDR, 5x zoom, Windows Hello, dual noise-cancelling mics',
  98000, 115000, 98000, 'instock', 20, 59, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 38. Razer Kiyo Pro Ultra Webcam
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Razer Kiyo Pro Ultra 4K Adaptive Light Webcam',
  'razer-kiyo-pro-ultra-4k-webcam',
  'RZR-KIYOPROU-BLK',
  'The Razer Kiyo Pro Ultra features the largest image sensor ever on a consumer webcam — a Sony STARVIS 2 1/1.2" CMOS sensor. Captures 4K 30fps with exceptional low-light performance without any ring light. Adaptive Light Sensor automatically adjusts ISO and shutter speed. Physical privacy shutter. 103° wide-angle lens. USB 3.0. Compatible with Razer Synapse for image tuning, works with all major streaming and conferencing software.',
  'Studio-quality 4K webcam — Sony STARVIS 2 sensor, exceptional low light, privacy shutter',
  145000, 168000, 145000, 'instock', 12, 34, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 39. Logitech C920 HD Pro Webcam
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Logitech C920 HD Pro 1080p Webcam',
  'logitech-c920-hd-pro-webcam',
  'LOG-C920-1080P',
  'The Logitech C920 HD Pro is the best-selling webcam for home offices and video calls. Full HD 1080p video at 30fps with automatic light correction that adapts to your environment. Dual stereo microphones with noise cancellation. Universal clip fits laptops, LCD monitors and tripods. USB plug-and-play, no software required. Compatible with Zoom, Microsoft Teams, Google Meet and other video calling apps. 78° field of view.',
  'Best-selling HD webcam — 1080p, dual stereo mics, auto light correction, plug-and-play',
  38000, 46000, 38000, 'instock', 65, 92, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === CPUs ===

-- 40. AMD Ryzen 7 7800X3D
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'AMD Ryzen 7 7800X3D Desktop Processor (8-Core, 5.0GHz)',
  'amd-ryzen-7-7800x3d',
  'AMD-R7-7800X3D',
  'The AMD Ryzen 7 7800X3D is the world''s best gaming CPU thanks to AMD''s 3D V-Cache technology, which stacks 96MB of additional L3 cache directly on the processor die — delivering up to 15% higher gaming performance than any competing CPU. 8 Zen 4 cores, 16 threads, boost up to 5.0GHz. AM5 socket with PCIe 5.0 and DDR5 support. 120W TDP. Compatible with all X670, B650 and X670E motherboards.',
  'World''s best gaming CPU — 8-core Zen 4 + 96MB 3D V-Cache, 5.0GHz, AM5 socket',
  320000, 370000, 320000, 'instock', 20, 51, 4.90, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 41. AMD Ryzen 9 7950X
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'AMD Ryzen 9 7950X Desktop Processor (16-Core, 5.7GHz)',
  'amd-ryzen-9-7950x',
  'AMD-R9-7950X',
  'The AMD Ryzen 9 7950X is AMD''s flagship Zen 4 desktop processor with 16 cores and 32 threads. Boost clock up to 5.7GHz with a base of 4.5GHz. Built on TSMC 5nm, supports PCIe 5.0, DDR5 memory and AM5 socket. 80MB total cache (64MB L3 + 16MB L2). AMD''s EXPO memory overclocking profiles for easy DDR5 tuning. TDP 170W. Ideal for content creation, 3D rendering and scientific computing.',
  'Flagship 16-core Zen 4 CPU — 5.7GHz boost, PCIe 5.0, DDR5, AM5 socket',
  580000, 650000, 580000, 'instock', 15, 29, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 42. Intel Core i5-13400F
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Intel Core i5-13400F Desktop Processor (10-Core, 4.6GHz)',
  'intel-core-i5-13400f',
  'INT-I5-13400F',
  'The Intel Core i5-13400F offers exceptional value for budget and mid-range PC builds. 10 cores (6P+4E) and 16 threads with a boost clock of 4.6GHz. No integrated graphics (requires discrete GPU). LGA1700 socket — compatible with B660, B760, Z690 and Z790 motherboards. 20MB Intel Smart Cache, PCIe 4.0 support. TDP 65W — power-efficient for everyday gaming and productivity.',
  'Best-value gaming CPU — 10-core, 4.6GHz boost, LGA1700, low power (65W TDP)',
  185000, 220000, 185000, 'instock', 40, 52, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 43. AMD Ryzen 5 7600X
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'AMD Ryzen 5 7600X Desktop Processor (6-Core, 5.3GHz)',
  'amd-ryzen-5-7600x',
  'AMD-R5-7600X',
  'The AMD Ryzen 5 7600X is the go-to processor for mid-range gaming builds on the AM5 platform. 6 cores, 12 threads, boost up to 5.3GHz. Zen 4 architecture on TSMC 5nm delivers a 16% IPC uplift over Zen 3. Full DDR5 and PCIe 5.0 support. 38MB total cache. Works with any AM5 B650 or X670 motherboard. AMD EXPO for tool-free memory overclocking. TDP 105W.',
  'Mid-range gaming CPU — 6-core Zen 4, 5.3GHz boost, PCIe 5.0, DDR5 ready',
  220000, 260000, 220000, 'instock', 35, 44, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 44. Intel Core i9-13900K
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Intel Core i9-13900K Desktop Processor (24-Core, 5.8GHz)',
  'intel-core-i9-13900k',
  'INT-I9-13900K',
  'The Intel Core i9-13900K is Intel''s flagship 13th Gen desktop processor with 24 cores (8P+16E) and 32 threads. Boost frequency up to 5.8GHz, base at 3.0GHz. Supports DDR4 and DDR5 memory, PCIe 5.0 and Thunderbolt 4. Compatible with Intel 700 and 600 series motherboards (LGA1700). Integrated Intel UHD Graphics 770 included. 36MB Intel Smart Cache. 125W base TDP, 253W maximum turbo.',
  'Intel flagship 24-core CPU — 5.8GHz boost, PCIe 5.0, DDR5 & DDR4, LGA1700',
  580000, 660000, 580000, 'instock', 12, 35, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === GPUs ===

-- 45. AMD Radeon RX 7800 XT
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'AMD Radeon RX 7800 XT 16GB Graphics Card',
  'amd-radeon-rx-7800-xt-16gb',
  'AMD-RX7800XT-16G',
  'The AMD Radeon RX 7800 XT is the premier 1440p gaming GPU built on RDNA 3 architecture. 3840 stream processors and 16GB GDDR6 VRAM on a 256-bit memory bus. AMD FSR 3 with Frame Generation delivers outstanding performance in supported titles. DisplayPort 2.1 output supports 4K/144Hz or 1440p/240Hz without compression. AMD Radiance Display Engine for pure image quality. PCIe 4.0 x16. 263W board power. Triple fan cooling.',
  'Top 1440p GPU — 16GB GDDR6, AMD FSR 3 Frame Generation, DisplayPort 2.1, RDNA 3',
  485000, 560000, 485000, 'instock', 15, 42, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 46. AMD Radeon RX 7900 XTX
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'AMD Radeon RX 7900 XTX 24GB Graphics Card',
  'amd-radeon-rx-7900-xtx-24gb',
  'AMD-RX7900XTX-24G',
  'The AMD Radeon RX 7900 XTX is AMD''s flagship RDNA 3 graphics card, featuring 24GB GDDR6 VRAM on a 384-bit memory bus. Delivers 4K gaming at ultra settings with hardware ray tracing via AMD Ray Accelerators and upscaling via AMD FSR 3. DisplayPort 2.1 output supports 8K/165Hz or 4K/480Hz. PCIe 4.0 x16. Supports AV1 hardware encode/decode. Triple fan, dual BIOS.',
  'Flagship AMD GPU — 24GB GDDR6, DisplayPort 2.1, AMD FSR 3, 4K ultra gaming',
  950000, 1100000, 950000, 'instock', 8, 37, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 47. NVIDIA GeForce RTX 4060 Ti 16GB
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'NVIDIA GeForce RTX 4060 Ti 16GB Graphics Card',
  'nvidia-rtx-4060-ti-16gb',
  'NVD-RTX4060TI-16G',
  'The NVIDIA GeForce RTX 4060 Ti 16GB is designed for 1080p and 1440p gaming with an exceptionally large VRAM buffer. Ada Lovelace architecture, 4352 CUDA cores and 16GB GDDR6 on a 128-bit bus. DLSS 3 Frame Generation multiplies frame rates, NVIDIA Reflex minimises latency, AV1 hardware encode for streaming. Dual DisplayPort 1.4a + HDMI 2.1. PCIe 4.0 x16. 165W TDP.',
  'RTX 4060 Ti 16GB — massive VRAM, DLSS 3, ideal 1080p/1440p gaming card',
  480000, 560000, 480000, 'instock', 14, 31, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 48. NVIDIA GeForce RTX 4090 24GB
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'NVIDIA GeForce RTX 4090 24GB Graphics Card',
  'nvidia-rtx-4090-24gb',
  'NVD-RTX4090-24G',
  'The NVIDIA GeForce RTX 4090 is the world''s most powerful consumer GPU. Ada Lovelace architecture with 16,384 CUDA cores, 24GB GDDR6X VRAM and a 384-bit memory bus delivering 1008 GB/s bandwidth. Renders games at 4K/120fps ultra. DLSS 3 Frame Generation, hardware ray tracing, 900 Tensor TFLOPS AI performance. Requires 850W PSU and 3-slot cooler space. PCIe 4.0 x16.',
  'World''s fastest consumer GPU — 16384 CUDA cores, 24GB GDDR6X, 4K/120fps',
  1850000, 2100000, 1850000, 'instock', 5, 52, 4.95, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === RAM ===

-- 49. Kingston Fury Beast DDR4 16GB
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Kingston Fury Beast DDR4 16GB (2×8GB) 3200MHz RAM Kit',
  'kingston-fury-beast-ddr4-16gb-3200',
  'KST-FURYBST-DDR4-16G',
  'Kingston Fury Beast DDR4 is the reliable choice for AMD and Intel DDR4 platforms. 16GB dual-channel kit (2×8GB) at 3200MHz CL16. Low-profile heat spreader fits in tight builds and under most CPU coolers. Intel XMP 2.0 and AMD Expo one-click overclocking. Tested for compatibility across hundreds of DDR4 motherboards. Plug-and-play simplicity — no BIOS configuration required at 2666MHz default.',
  '16GB DDR4 3200MHz dual-channel kit — XMP 2.0, low-profile, plug-and-play',
  48000, 58000, 48000, 'instock', 80, 63, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 50. TeamGroup T-Force Xtreem ARGB DDR5 32GB
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'TeamGroup T-Force Xtreem ARGB DDR5 32GB (2×16GB) 6000MHz Kit',
  'teamgroup-t-force-xtreem-ddr5-32gb-6000',
  'TMG-TFXTRM-DDR5-32G',
  'TeamGroup T-Force Xtreem ARGB DDR5 32GB kit (2×16GB) runs at 6000MHz CL38 with Intel XMP 3.0 and AMD EXPO support for one-click overclocking. Features addressable RGB lighting with a 360° mirror finish for stunning system builds. On-die ECC improves memory reliability under heavy workloads. Compatible with Intel 12th/13th/14th Gen and AMD Ryzen 7000 platforms. Premium Samsung or Hynix ICs for excellent overclocking headroom.',
  '32GB DDR5 6000MHz ARGB kit — XMP 3.0/EXPO, 360° mirror RGB, on-die ECC',
  195000, 225000, 195000, 'instock', 30, 26, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 51. G.Skill Trident Z5 RGB DDR5 64GB
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'G.Skill Trident Z5 RGB DDR5 64GB (2×32GB) 6000MHz Kit',
  'gskill-trident-z5-rgb-ddr5-64gb-6000',
  'GSK-TRZ5RGB-DDR5-64G',
  'G.Skill Trident Z5 RGB DDR5 64GB kit (2×32GB) is engineered for high-end Intel and AMD DDR5 platforms. Runs at 6000MHz CL36 with XMP 3.0 and EXPO profiles for one-click overclocking. Aluminium heat spreader with addressable RGB lighting synchronized via G.Skill Trident Z Lighting Control, iCUE, Armoury Crate, Dragon Center and Polychrome SYNC. On-die ECC for improved stability.',
  '64GB DDR5 6000MHz kit with RGB — XMP 3.0/EXPO, on-die ECC, premium quality',
  380000, 430000, 380000, 'instock', 25, 22, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 52. Crucial Pro DDR5 32GB
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Crucial Pro DDR5 32GB (2×16GB) 5600MHz RAM Kit',
  'crucial-pro-ddr5-32gb-5600',
  'CRU-PRO-DDR5-32G-5600',
  'Crucial Pro DDR5 32GB kit (2×16GB) is designed for next-gen Intel 12th/13th/14th Gen and AMD Ryzen 7000 platforms. Runs at 5600MHz with Intel XMP 3.0 and AMD EXPO profiles. On-die ECC corrects single-bit errors in real time for improved system stability during heavy workloads. No RGB — clean aesthetic for professional builds. Backed by Micron''s industry-leading DRAM manufacturing.',
  '32GB DDR5 5600MHz kit — Intel & AMD compatible, on-die ECC, clean no-RGB design',
  165000, 195000, 165000, 'instock', 50, 38, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === STORAGE ===

-- 53. Samsung 990 Pro 2TB M.2 NVMe
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Samsung 990 Pro 2TB M.2 NVMe PCIe 4.0 SSD',
  'samsung-990-pro-2tb-nvme',
  'SAM-990PRO-2TB-M2',
  'The Samsung 990 Pro is Samsung''s highest-performance consumer NVMe SSD. Sequential reads up to 7,450 MB/s and writes up to 6,900 MB/s via PCIe 4.0 x4. The innovative V-NAND and in-house Pascal controller deliver ultra-low latency for gaming and professional applications. Features Samsung Magician software for health monitoring and firmware updates. Available in M.2 2280 form factor. 5-year warranty.',
  '2TB PCIe 4.0 NVMe SSD — 7,450MB/s reads, Samsung V-NAND, 5-year warranty',
  185000, 215000, 185000, 'instock', 30, 44, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 54. WD Black SN850X 1TB M.2 NVMe
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'WD Black SN850X 1TB M.2 NVMe PCIe 4.0 SSD (with Heatsink)',
  'wd-black-sn850x-1tb-nvme-hs',
  'WD-SN850X-1TB-HS',
  'The WD Black SN850X with heatsink is designed for high-performance gaming PCs and workstations. Sequential read speeds up to 7,300 MB/s and writes up to 6,600 MB/s. Game Mode 2.0 predictively loads game assets to reduce stuttering. PCIe 4.0 x4, M.2 2280. The aluminium heatsink keeps temperatures low under sustained loads. Compatible with PS5 (heatsink model requires PS5 cover removal). 5-year warranty.',
  'Gaming NVMe SSD — 7,300MB/s, Game Mode 2.0, heatsink included, PS5 compatible',
  125000, 148000, 125000, 'instock', 35, 48, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 55. Seagate Barracuda 4TB HDD
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Seagate Barracuda 4TB 3.5" Internal Hard Drive (SATA 6Gb/s)',
  'seagate-barracuda-4tb-3-5-hdd',
  'SGT-BARCUDA-4TB-35',
  'The Seagate Barracuda 4TB is the reliable, affordable choice for mass storage in desktop PCs. 7200 RPM spindle speed with 256MB cache delivers dependable performance for bulk data storage. SATA 6Gb/s interface. MultiTier Caching Technology (MTC) optimises frequent-access data placement. Backed by a 2-year limited warranty. Compatible with Windows and Linux systems. Ideal as a secondary storage drive.',
  '4TB desktop HDD — 7200RPM, 256MB cache, SATA 6Gb/s, reliable bulk storage',
  62000, 72000, 62000, 'instock', 45, 35, 4.55, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 56. Crucial X9 Pro 2TB Portable SSD
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Crucial X9 Pro 2TB Portable SSD (USB 3.2 Gen 2)',
  'crucial-x9-pro-2tb-portable-ssd',
  'CRU-X9PRO-2TB',
  'The Crucial X9 Pro 2TB portable SSD delivers read speeds up to 1,050 MB/s via USB 3.2 Gen 2. Built for creators on the go — its compact aluminium shell withstands drops from up to 2 metres and is rated IP55 for dust and water splashes. Works seamlessly with PC, Mac, Android and iPad. Includes USB-C to C and USB-C to A cables in the box. No software required. Backed by a 5-year limited warranty from Micron.',
  '2TB portable SSD — 1,050MB/s, IP55, drop-resistant aluminium, USB-C, 5-year warranty',
  88000, 102000, 88000, 'instock', 25, 41, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 57. Samsung T9 4TB Portable SSD
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Samsung T9 4TB Portable SSD (USB 3.2 Gen 2x2)',
  'samsung-t9-4tb-portable-ssd',
  'SAM-T9-4TB-BLK',
  'The Samsung T9 4TB portable SSD delivers blazing fast transfers via USB 3.2 Gen 2x2 (20Gbps). Read speeds up to 2,000 MB/s and write speeds up to 1,950 MB/s — outperforming any external HDD. Tough rubber exterior absorbs drops from up to 3 meters. Dynamic Thermal Guard prevents overheating during sustained transfers. Compatible with PC, Mac, Android and PlayStation/Xbox. Includes USB-C to C and USB-C to A cables.',
  '4TB portable SSD — 2,000MB/s reads, drop-resistant, USB 3.2 Gen 2x2',
  285000, 320000, 285000, 'instock', 18, 31, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 58. Seagate One Touch 4TB External HDD
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Seagate One Touch 4TB Portable External HDD (USB 3.0)',
  'seagate-one-touch-4tb-external',
  'SGT-ONETOUCH-4TB',
  'The Seagate One Touch 4TB portable hard drive offers effortless backup with One Touch auto-backup software. USB 3.0 bus-powered — no adapter needed. Durable brushed aluminium casing available in multiple colours. Compatible with Windows and macOS. 3-year limited warranty with Rescue Data Recovery Services.',
  '4TB portable HDD — USB 3.0, brushed aluminium, one-touch backup, 3-year warranty',
  68000, 78000, 68000, 'instock', 38, 27, 4.50, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 59. SanDisk Extreme Pro 1TB Portable SSD
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'SanDisk Extreme Pro 1TB Portable SSD V2 (USB 3.2 Gen 2)',
  'sandisk-extreme-pro-1tb-portable-ssd',
  'SDK-EXPPRO-1TB-SSD',
  'The SanDisk Extreme Pro Portable SSD V2 delivers up to 2,000 MB/s read and 2,000 MB/s write speeds via USB 3.2 Gen 2x2. IP55 rated for water and dust resistance, and drop-tested from up to 2 meters. The aluminium casing acts as a heat sink to sustain peak performance. Password-protection with 256-bit AES encryption. Compatible with USB-C laptops, PCs and Macs. Includes both USB-C to C and USB-C to A cables. 5-year warranty.',
  '1TB portable SSD — 2,000MB/s, IP55, AES encryption, USB 3.2 Gen 2x2',
  118000, 138000, 118000, 'instock', 25, 39, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 60. PNY PRO Elite V2 256GB USB Flash Drive
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'PNY PRO Elite V2 256GB USB 3.2 Gen 2 Flash Drive',
  'pny-pro-elite-v2-256gb-usb32',
  'PNY-PROELITEV2-256',
  'The PNY PRO Elite V2 delivers USB 3.2 Gen 2 speeds of up to 600 MB/s read and 500 MB/s write — making it one of the fastest flash drives available. Compact metal housing with a durable slide cap protects the USB-A connector. Compatible with all USB 3.0, 3.1 and 3.2 hosts. Backward compatible with USB 2.0. Plug-and-play on Windows, macOS and Linux with no driver installation. Lifetime limited warranty.',
  '256GB USB 3.2 Gen 2 flash drive — 600MB/s reads, metal housing, lifetime warranty',
  18000, 24000, 18000, 'instock', 65, 46, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 61. Kingston DataTraveler Max 512GB USB-C
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Kingston DataTraveler Max 512GB USB-C 3.2 Gen 2 Flash Drive',
  'kingston-datatraveler-max-512gb-usbc',
  'KST-DTMAX-512-USBC',
  'The Kingston DataTraveler Max 512GB delivers USB 3.2 Gen 2 speeds of up to 1,000 MB/s read and 900 MB/s write — approaching SSD performance in a flash drive form factor. USB-C connector with reversible plug. Includes a USB-A to USB-C adapter for backward compatibility. Aluminium casing with a cap protects the connector. Compatible with USB-C laptops, tablets and smartphones. 5-year warranty.',
  '512GB USB-C flash drive — 1,000MB/s reads, USB 3.2 Gen 2, includes USB-A adapter',
  42000, 52000, 42000, 'instock', 55, 41, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 62. Samsung EVO Plus 256GB microSD
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Samsung EVO Plus 256GB microSDXC Card (UHS-I U3, 160MB/s)',
  'samsung-evo-plus-256gb-microsd',
  'SAM-EVOPLUS-256-MSD',
  'The Samsung EVO Plus 256GB microSDXC card delivers read speeds up to 160 MB/s and write speeds up to 120 MB/s, making it ideal for Android smartphones, tablets, drones and action cameras. UHS-I Speed Grade 3 (U3) and Class 10 ensure 4K UHD video recording without dropped frames. Water-proof, temperature-proof, X-ray proof and magnetic-proof. Includes SD card adapter. 10-year limited warranty.',
  '256GB microSD — 160MB/s, 4K UHD ready, waterproof, 10-year warranty',
  22000, 28000, 22000, 'instock', 90, 67, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === NETWORKING ===

-- 63. ASUS RT-AX88U Pro WiFi 6 Router
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'ASUS RT-AX88U Pro AX6000 Dual-Band WiFi 6 Router',
  'asus-rt-ax88u-pro-wifi6',
  'ASUS-RTAX88U-PRO',
  'The ASUS RT-AX88U Pro delivers combined WiFi 6 speeds up to 6000Mbps (1148Mbps 2.4GHz + 4804Mbps 5GHz). Eight high-performance antennas with AiMesh support for whole-home coverage. AiProtection Pro (powered by Trend Micro) provides lifetime network security scanning at no extra charge. Two USB 3.0 ports for network storage sharing. Eight Gigabit LAN ports. Supports WPA3, OpenVPN and Adaptive QoS for gaming and streaming.',
  'AX6000 WiFi 6 router — 8 LAN ports, AiProtection Pro, AiMesh, Adaptive QoS',
  85000, 98000, 85000, 'instock', 18, 36, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 64. Netgear Orbi RBK863S WiFi 6E Mesh
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Netgear Orbi RBK863S WiFi 6E Tri-Band Mesh System (2-Pack)',
  'netgear-orbi-rbk863s-wifi6e-mesh',
  'NGR-RBK863S-2PK',
  'The Netgear Orbi RBK863S is a premium WiFi 6E mesh system covering up to 560 m² with AXE11000 tri-band wireless (6GHz 4.8Gbps + 5GHz 4.8Gbps + 2.4GHz 1.2Gbps). The new 6GHz band eliminates congestion and delivers the lowest latency. Includes 2.5G WAN and 2.5G LAN ports. Daisy-chaining supported for whole-home coverage. NETGEAR Armor security powered by Bitdefender included for 30 days.',
  'WiFi 6E tri-band mesh — AXE11000, 560m² coverage, 2.5G ports, 6GHz band',
  485000, 560000, 485000, 'instock', 8, 19, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 65. TP-Link TL-SG1008P PoE Switch
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'TP-Link TL-SG1008P 8-Port Gigabit PoE Network Switch',
  'tp-link-sg1008p-8port-poe-switch',
  'TPL-SG1008P-BLK',
  'The TP-Link TL-SG1008P is an 8-port unmanaged Gigabit switch with 4 PoE+ ports (802.3at, up to 30W per port, 55W total budget). Powers IP cameras, VoIP phones and wireless access points without separate power adapters. Plug-and-play, no configuration required. Fanless silent design for home and office environments. IEEE 802.3x flow control. 16 Gbps switching capacity. 19" rack-mountable.',
  '8-port Gigabit switch with 4x PoE+ ports — fanless, plug-and-play, rack-mountable',
  38000, 46000, 38000, 'instock', 45, 33, 4.60, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 66. TP-Link AX1800 USB WiFi Adapter
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'TP-Link Archer TX20U Plus AX1800 USB WiFi Adapter',
  'tp-link-archer-tx20u-ax1800-usb-wifi',
  'TPL-TX20U-PLUS',
  'The TP-Link Archer TX20U Plus is a high-gain USB WiFi 6 adapter that upgrades any desktop or laptop to Wi-Fi 6 speeds up to 1800 Mbps (1201Mbps on 5GHz + 574Mbps on 2.4GHz). Four adjustable external antennas for maximum range and signal strength. USB 3.0 connection, WPA3 security, OFDMA and MU-MIMO support. Compatible with Windows 7/8.1/10/11 and macOS 10.9+.',
  'WiFi 6 USB adapter — 1800Mbps, 4 external antennas, USB 3.0, WPA3',
  18000, 22000, 18000, 'instock', 70, 45, 4.55, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === HARDWARE COMPONENTS (Cooling, Cases, PSU, Motherboards) ===

-- 67. Corsair iCUE H150i Elite ARGB AIO
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Corsair iCUE H150i Elite ARGB 360mm AIO Liquid CPU Cooler',
  'corsair-icue-h150i-elite-argb-360mm',
  'COR-H150I-360-ARGB',
  'The Corsair iCUE H150i Elite ARGB is a premium 360mm AIO liquid cooler featuring the new AF120 Elite ARGB fans — high-performance fans with anti-vibration pads and individually addressable RGB lighting. The magnetic levitation bearing delivers long life and near-silent operation. Copper cold plate with pre-applied thermal paste and Zero RPM fan mode for silent idle operation. Supports LGA1700, LGA1200, AM4 and AM5 sockets. iCUE software integration.',
  '360mm AIO cooler — AF120 Elite fans, ARGB, LGA1700/AM5, near-silent operation',
  98000, 115000, 98000, 'instock', 22, 35, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 68. Noctua NH-D15 Air Cooler
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Noctua NH-D15 Dual-Tower CPU Air Cooler',
  'noctua-nh-d15-dual-tower-air-cooler',
  'NOC-NHD15-DUAL',
  'The Noctua NH-D15 is widely regarded as the best air CPU cooler ever made. Dual-tower heatsink with two 140mm NF-A15 PWM fans delivers performance comparable to 280mm AIO coolers while remaining completely silent. Six heat pipes with precision-machined nickel-plated copper base. Compatible with LGA1700, LGA1200, AM4 and AM5 sockets via included SecuFirm2+ mounting. Backed by Noctua''s 6-year warranty.',
  'Best-in-class air cooler — dual 140mm fans, AM5/LGA1700, silent, 6-year warranty',
  68000, 80000, 68000, 'instock', 28, 46, 4.90, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 69. NZXT H7 Flow Mid-Tower Case
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'NZXT H7 Flow Mid-Tower ATX PC Case (White)',
  'nzxt-h7-flow-mid-tower-white',
  'NZXT-H7FLOW-WHT',
  'The NZXT H7 Flow features a perforated front panel for maximum airflow — up to 37% more airflow than a solid front panel. Supports up to 420mm radiators and 360mm radiators simultaneously. Spacious interior fits E-ATX, ATX, Micro-ATX and Mini-ITX motherboards. Cable management channels with tie-down points. Tempered glass side panel. Front I/O: USB-C 3.2 Gen 2, two USB-A 3.2, HD audio. Two 140mm fans included.',
  'High-airflow mid-tower — perforated front, 420mm rad support, tempered glass, USB-C',
  78000, 92000, 78000, 'instock', 18, 29, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 70. Corsair RM850x 850W PSU
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Corsair RM850x 850W 80+ Gold Fully Modular ATX Power Supply',
  'corsair-rm850x-850w-gold-psu',
  'COR-RM850X-850W',
  'The Corsair RM850x 850W is a fully modular 80+ Gold certified power supply delivering 850W of continuous power. Zero RPM fan mode operates silently at low-to-medium loads. Japanese 105°C-rated capacitors ensure long-term reliability. Tight voltage regulation (±5% on all rails) protects sensitive components. Includes ATX 3.0 PCIe 5.0 16-pin GPU power connector for RTX 40/RX 7000 series cards. 10-year warranty.',
  '850W 80+ Gold PSU — fully modular, Zero RPM, ATX 3.0 PCIe 5.0, 10-year warranty',
  88000, 105000, 88000, 'instock', 28, 42, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 71. ASUS ROG Strix B650E-F Motherboard
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'ASUS ROG Strix B650E-F Gaming WiFi AMD AM5 ATX Motherboard',
  'asus-rog-strix-b650e-f-am5-atx',
  'ASUS-B650EF-AM5',
  'The ASUS ROG Strix B650E-F is a feature-packed AM5 motherboard for AMD Ryzen 7000 series processors. PCIe 5.0 x16 primary slot and PCIe 5.0 M.2 slot for next-gen storage and GPUs. Wi-Fi 6E (802.11ax), 2.5G LAN, Bluetooth 5.3. 14+2 DrMOS power stages for Ryzen 9 overclocking headroom. Four DDR5 slots supporting up to 192GB. Aura Sync ARGB headers. ROG AI Overclocking and Memory Context Restore for effortless performance tuning.',
  'AM5 ATX motherboard — PCIe 5.0 M.2, Wi-Fi 6E, 2.5G LAN, DDR5, ASUS ROG quality',
  195000, 225000, 195000, 'instock', 20, 26, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 72. MSI MAG Z790 Tomahawk WiFi
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'MSI MAG Z790 Tomahawk WiFi DDR5 ATX Motherboard (LGA1700)',
  'msi-mag-z790-tomahawk-wifi-ddr5',
  'MSI-Z790TWIFI-DDR5',
  'The MSI MAG Z790 Tomahawk WiFi is a well-rounded Z790 motherboard for Intel 12th, 13th and 14th Gen processors. 16+1+1 power design handles Core i9 overclocking with ease. PCIe 5.0 x16, three M.2 slots (one PCIe 5.0), Wi-Fi 6E, 2.5G LAN and Bluetooth 5.3. Four DDR5 DIMM slots supporting up to 192GB. USB 3.2 Gen 2x2 Type-C rear I/O. Mystic Light RGB sync. Excellent VRM thermal solution for sustained loads.',
  'Z790 DDR5 motherboard — PCIe 5.0, Wi-Fi 6E, 2.5G LAN, Core i9 ready, LGA1700',
  175000, 205000, 175000, 'instock', 18, 31, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === PRINTERS ===

-- 73. Canon PIXMA G3470 MegaTank
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Canon PIXMA G3470 MegaTank All-In-One Inkjet Printer',
  'canon-pixma-g3470-megatank-aio',
  'CAN-G3470-MGTNK',
  'The Canon PIXMA G3470 MegaTank is a refillable ink tank printer that prints up to 6,000 colour pages or 7,700 black pages before needing a refill — significantly reducing cost per page compared to cartridge printers. Print, scan and copy with Wi-Fi connectivity for wireless printing from phones and tablets. Prints up to A4 at 4800×1200 dpi. Auto Document Feeder for scan and copy. Borderless photo printing. Compatible with Canon Print app.',
  'Refillable tank AIO printer — 6,000 colour pages, Wi-Fi, scan/copy, borderless photo',
  145000, 172000, 145000, 'instock', 30, 44, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 74. HP LaserJet MFP M234dwe
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'HP LaserJet MFP M234dwe Monochrome Laser Printer',
  'hp-laserjet-mfp-m234dwe',
  'HP-LJM234DWE-MONO',
  'The HP LaserJet MFP M234dwe is a compact monochrome laser all-in-one that prints, scans and copies. Prints up to 30 pages per minute with auto duplex (double-sided) printing. Wi-Fi, Ethernet and USB connectivity. Compatible with HP+ smart printing system for remote management and automatic cartridge replenishment. 150-sheet input tray, 10-sheet ADF. Works with iOS, Android and Windows via HP Smart app.',
  'Compact mono laser AIO — 30ppm, auto duplex, Wi-Fi, HP+, 150-sheet tray',
  185000, 215000, 185000, 'instock', 22, 38, 4.60, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 75. Epson EcoTank ET-2850
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Epson EcoTank ET-2850 Wi-Fi All-in-One Printer',
  'epson-ecotank-et-2850-wifi-aio',
  'EPS-ET2850-WIFI',
  'The Epson EcoTank ET-2850 eliminates costly cartridges with its refillable ink tank system. Prints up to 7,500 colour pages or 4,500 black pages from one set of ink bottles included in the box. PrecisionCore print head delivers sharp text and vibrant photos. 2.4" colour LCD touchscreen. Wi-Fi Direct, Wi-Fi and USB connectivity. Auto 2-sided printing, copy and scan. 100-sheet rear paper tray.',
  'Cartridge-free tank printer — 7,500 colour pages, 2.4" touchscreen, Wi-Fi, auto duplex',
  195000, 230000, 195000, 'instock', 18, 29, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === POWER & UPS ===

-- 76. APC Back-UPS 1500VA
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'APC Back-UPS 1500VA 865W UPS (BX1500G)',
  'apc-back-ups-1500va-865w',
  'APC-BX1500G-1500',
  'The APC Back-UPS BX1500G provides 1500VA/865W of battery backup to protect your desktop PC, monitor and networking equipment from power outages, surges and fluctuations. Automatic Voltage Regulation (AVR) corrects minor power fluctuations without switching to battery, extending battery life. 10 outlets (5 battery backup + 5 surge-only). USB charging port. LCD display shows battery level, load and runtime. USB management interface. Replaces battery without a technician.',
  '1500VA UPS with AVR — 865W, 10 outlets, LCD display, USB, battery-replaceable',
  128000, 148000, 128000, 'instock', 35, 52, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 77. APC Back-UPS 650VA
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'APC Back-UPS 650VA 400W UPS (BX650CI)',
  'apc-back-ups-650va-400w',
  'APC-BX650CI-650',
  'The APC Back-UPS BX650CI is an affordable and compact UPS perfect for protecting home PCs, routers and network switches from power interruptions and surges. 650VA/400W capacity with 6 IEC outlets (4 battery backup + 2 surge-only). LED status indicators show power, battery and overload status. USB connectivity for automatic system shutdown via PowerChute software. Easy battery replacement without tools.',
  'Entry-level 650VA UPS — 400W, 6 outlets, USB management, router and PC protection',
  58000, 70000, 58000, 'instock', 55, 61, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 78. Belkin 12-Outlet Surge Protector
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Belkin 12-Outlet Surge Protector Power Strip (3600 Joules)',
  'belkin-12-outlet-surge-protector-3600j',
  'BLK-BST900-12OUT',
  'The Belkin 12-Outlet Surge Protector offers 3600 joules of surge protection to safeguard all your devices — PC, monitor, printer, router, gaming consoles and home entertainment. Eight widely spaced outlets plus four standard outlets accommodate large power adapters. 2m heavy-duty power cord. Dual USB-A charging ports (2.1A). LED status indicators for power and protection status. Resettable circuit breaker. Lifetime connected equipment warranty up to $300,000.',
  '12-outlet surge protector — 3600J, dual USB, 2m cord, $300k connected equipment warranty',
  28000, 34000, 28000, 'instock', 60, 48, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- === LAPTOP BAGS & ACCESSORIES ===

-- 79. Targus 15.6" Classic Laptop Backpack
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Targus 15.6" Classic Laptop Backpack (TSB84604GL)',
  'targus-156-classic-laptop-backpack',
  'TRG-TSB84604-156',
  'The Targus Classic 15.6" Laptop Backpack is designed for daily commuting with a padded laptop compartment that fits up to 15.6" laptops, a front organisation panel with multiple pockets for accessories and a spacious main compartment for books and files. Padded, adjustable shoulder straps with a sternum strap for comfort on long commutes. Water-resistant fabric and a trolley strap for attachment to rolling luggage. Includes a Targus 3-year warranty.',
  '15.6" laptop backpack — padded compartment, organiser panel, water-resistant, trolley strap',
  22000, 28000, 22000, 'instock', 75, 55, 4.55, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 80. Kensington Laptop Cooling Pad
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Kensington SmartFit Easy Riser Go Laptop Cooling Stand',
  'kensington-smartfit-easy-riser-go-stand',
  'KSG-K50421-RISER',
  'The Kensington SmartFit Easy Riser Go elevates your laptop to an ergonomic height while providing ventilation to reduce heat buildup. Compatible with 14" and 17" laptops. Folding design with cable management clip stores flat in your laptop bag. Non-slip rubber feet and a front stop-bar prevent the laptop from sliding. Suitable for use on a desk or lap. Available in black and grey.',
  'Portable laptop cooling stand — folds flat, non-slip, 14-17", cable management',
  18000, 22000, 18000, 'instock', 80, 43, 4.50, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 81. Tomtoc 360 Protective Laptop Sleeve
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Tomtoc 360 Protective Laptop Sleeve 14" (Military Grade)',
  'tomtoc-360-protective-laptop-sleeve-14',
  'TMT-360-A13-14-BLK',
  'The Tomtoc 360 Protective Sleeve meets US military drop-test standards (MIL-STD-810G) for edge, corner and face protection. Dual-layer foam padding with a ThickSkin outer shell. Compatible with 13.5"-14.1" laptops including MacBook Pro 14", Dell XPS 13 and Surface Laptop 5. Double-sided YKK zippers for smooth, durable operation. A front accessory pocket fits a mouse, cables and a power adapter. Water-repellent exterior.',
  'Military-grade 14" laptop sleeve — MIL-STD-810G, ThickSkin, YKK zippers',
  18500, 22000, 18500, 'instock', 60, 39, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 82. Anker USB-C Hub 7-in-1
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Anker 7-in-1 USB-C Hub (4K HDMI, 100W PD, USB 3.0)',
  'anker-7in1-usbc-hub-4k-hdmi',
  'ANK-A8346-7IN1',
  'The Anker 7-in-1 USB-C Hub expands a single USB-C port into seven connections: 4K 30Hz HDMI output, 100W USB-C Power Delivery pass-through, two USB-A 3.0 ports (5Gbps), SD card reader, microSD card reader and one USB-A 2.0 port. Compact aluminium casing with an 18cm braided tether cable. No drivers required on Windows, macOS, ChromeOS, iPad Pro and Air. Compatible with MacBook Air, MacBook Pro, Dell XPS and most USB-C laptops.',
  '7-in-1 USB-C hub — 4K HDMI, 100W PD, USB 3.0, SD/microSD, aluminium',
  22000, 28000, 22000, 'instock', 85, 78, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 83. UGREEN 65W GaN Fast Charger
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'UGREEN 65W GaN 3-Port USB-C Charger (2×USB-C + 1×USB-A)',
  'ugreen-65w-gan-3port-charger',
  'UGR-CD239-65W-GAN',
  'The UGREEN 65W GaN charger uses Gallium Nitride technology to deliver 65W of total charging power from a form factor 40% smaller than traditional chargers. Charges a laptop at up to 45W via USB-C port 1, a phone at 20W via USB-C port 2 and a third device at 22.5W via USB-A simultaneously. Supports PD 3.0, PPS, Quick Charge 4+/3.0 and Apple Fast Charging. Universal compatibility with MacBook, iPad, iPhone, Samsung Galaxy and more.',
  '65W GaN 3-port charger — laptop + phone + device simultaneously, 40% smaller',
  18000, 22000, 18000, 'instock', 100, 84, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 84. Baseus 20000mAh Power Bank
INSERT INTO viddenave_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Baseus Blade 20000mAh 100W USB-C Laptop Power Bank',
  'baseus-blade-20000mah-100w-power-bank',
  'BAS-PPBLD010-20K',
  'The Baseus Blade is an ultra-slim power bank designed to charge laptops. 20,000mAh capacity with 100W USB-C output — enough to charge a MacBook Air from 0-100% twice. Ultra-flat 11.5mm profile makes it easy to slip into a laptop bag. Two USB-C ports (100W + 45W) and two USB-A ports (22.5W each). LCD digital display shows exact battery percentage. Charges itself at 65W in under 2 hours. Airline-safe capacity.',
  '20,000mAh 100W laptop power bank — ultra-slim 11.5mm, USB-C 100W, LCD display',
  55000, 65000, 55000, 'instock', 45, 52, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- ── Product Images ────────────────────────────────────────────

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600', 'ASUS ZenBook Pro 14 OLED', 'ASUS ZenBook Pro 14 OLED Core i9 32GB', 0
FROM viddenave_products p WHERE p.slug = 'asus-zenbook-pro-14-oled-i9-32gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600', 'Samsung Galaxy Book3 Ultra', 'Samsung Galaxy Book3 Ultra Core i9 32GB', 0
FROM viddenave_products p WHERE p.slug = 'samsung-galaxy-book3-ultra-i9-32gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=600', 'Intel NUC 13 Pro', 'Intel NUC 13 Pro Mini PC Core i7', 0
FROM viddenave_products p WHERE p.slug = 'intel-nuc-13-pro-i7-32gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600', 'HP Spectre x360 14', 'HP Spectre x360 14 2-in-1 Laptop', 0
FROM viddenave_products p WHERE p.slug = 'hp-spectre-x360-14-i7-16gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600', 'Lenovo ThinkPad X1 Carbon Gen 11', 'Lenovo ThinkPad X1 Carbon Gen 11', 0
FROM viddenave_products p WHERE p.slug = 'lenovo-thinkpad-x1-carbon-gen11' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=600', 'ASUS ROG Zephyrus G14', 'ASUS ROG Zephyrus G14 Gaming Laptop', 0
FROM viddenave_products p WHERE p.slug = 'asus-rog-zephyrus-g14-r9-16gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600', 'Acer Swift X 14', 'Acer Swift X 14 Creator Laptop', 0
FROM viddenave_products p WHERE p.slug = 'acer-swift-x-14-r7-16gb-512gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600', 'Microsoft Surface Laptop 5', 'Microsoft Surface Laptop 5 13.5 inch', 0
FROM viddenave_products p WHERE p.slug = 'microsoft-surface-laptop-5-i5-8gb-256gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=600', 'Lenovo IdeaPad Gaming 3', 'Lenovo IdeaPad Gaming 3 15 inch', 0
FROM viddenave_products p WHERE p.slug = 'lenovo-ideapad-gaming-3-r5-8gb-512gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=600', 'HP Pavilion Desktop Tower', 'HP Pavilion Desktop Tower', 0
FROM viddenave_products p WHERE p.slug = 'hp-pavilion-desktop-i7-13700-16gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=600', 'Apple Mac Mini M2', 'Apple Mac Mini M2', 0
FROM viddenave_products p WHERE p.slug = 'apple-mac-mini-m2-8gb-256gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=600', 'ASUS ROG Strix G15 Gaming Desktop', 'ASUS ROG Strix G15 Gaming Desktop', 0
FROM viddenave_products p WHERE p.slug = 'asus-rog-strix-g15-i9-32gb-rtx4080' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600', 'Dell Inspiron 15 3000', 'Dell Inspiron 15 3000 Laptop', 0
FROM viddenave_products p WHERE p.slug = 'dell-inspiron-15-3000-i5-8gb-256gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600', 'Apple MacBook Air M2', 'Apple MacBook Air M2 13 inch', 0
FROM viddenave_products p WHERE p.slug = 'apple-macbook-air-m2-8gb-256gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600', 'HP EliteBook 840 G10', 'HP EliteBook 840 G10 Business Laptop', 0
FROM viddenave_products p WHERE p.slug = 'hp-elitebook-840-g10-i7-16gb-512gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600', 'Samsung Odyssey G7 32"', 'Samsung Odyssey G7 QLED 240Hz Gaming Monitor', 0
FROM viddenave_products p WHERE p.slug = 'samsung-32-odyssey-g7-qled-240hz' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600', 'BenQ PD2705U 27" 4K', 'BenQ PD2705U 27 4K IPS Designer Monitor', 0
FROM viddenave_products p WHERE p.slug = 'benq-pd2705u-27-4k-designer' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600', 'LG 27" UltraGear QHD 165Hz', 'LG 27 UltraGear QHD 165Hz Gaming Monitor', 0
FROM viddenave_products p WHERE p.slug = 'lg-27-ultragear-qhd-165hz' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600', 'Dell UltraSharp 24" 4K', 'Dell UltraSharp U2422DE 4K USB-C Monitor', 0
FROM viddenave_products p WHERE p.slug = 'dell-ultrasharp-24-4k-usbc-u2422de' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600', 'ASUS ProArt 32" 4K OLED', 'ASUS ProArt PA32DC 4K OLED Monitor', 0
FROM viddenave_products p WHERE p.slug = 'asus-proart-pa32dc-32-4k-oled' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=600', 'Apple Magic Keyboard', 'Apple Magic Keyboard Touch ID Numeric Keypad', 0
FROM viddenave_products p WHERE p.slug = 'apple-magic-keyboard-touch-id-numeric' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=600', 'SteelSeries Apex Pro TKL Wireless', 'SteelSeries Apex Pro TKL Wireless Keyboard', 0
FROM viddenave_products p WHERE p.slug = 'steelseries-apex-pro-tkl-wireless' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=600', 'Keychron K2 Pro', 'Keychron K2 Pro Wireless Mechanical Keyboard', 0
FROM viddenave_products p WHERE p.slug = 'keychron-k2-pro-wireless-mechanical' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=600', 'Corsair K100 RGB Keyboard', 'Corsair K100 RGB Optical-Mechanical Keyboard', 0
FROM viddenave_products p WHERE p.slug = 'corsair-k100-rgb-optical-keyboard' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=600', 'Logitech MX Master 3S', 'Logitech MX Master 3S Wireless Mouse', 0
FROM viddenave_products p WHERE p.slug = 'logitech-mx-master-3s-wireless-mouse' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=600', 'Razer DeathAdder V3 HyperSpeed', 'Razer DeathAdder V3 HyperSpeed Gaming Mouse', 0
FROM viddenave_products p WHERE p.slug = 'razer-deathadder-v3-hyperspeed' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=600', 'Microsoft Arc Mouse', 'Microsoft Arc Bluetooth Mouse', 0
FROM viddenave_products p WHERE p.slug = 'microsoft-arc-mouse-glacier' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=600', 'Logitech G Pro X Superlight 2', 'Logitech G Pro X Superlight 2 Gaming Mouse', 0
FROM viddenave_products p WHERE p.slug = 'logitech-g-pro-x-superlight-2' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600', 'Sony WH-1000XM5', 'Sony WH-1000XM5 Wireless Headphones', 0
FROM viddenave_products p WHERE p.slug = 'sony-wh-1000xm5-wireless-headphones' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600', 'Bose QuietComfort 45', 'Bose QuietComfort 45 Headphones', 0
FROM viddenave_products p WHERE p.slug = 'bose-quietcomfort-45' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600', 'JBL Quantum 810', 'JBL Quantum 810 Wireless Gaming Headset', 0
FROM viddenave_products p WHERE p.slug = 'jbl-quantum-810-wireless-gaming-headset' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600', 'Logitech G Pro X 2 Wireless', 'Logitech G Pro X 2 LIGHTSPEED Headset', 0
FROM viddenave_products p WHERE p.slug = 'logitech-g-pro-x-2-lightspeed-wireless' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1588423771073-b8903fead85b?w=600', 'Apple AirPods Pro 2nd Gen', 'Apple AirPods Pro 2nd Generation', 0
FROM viddenave_products p WHERE p.slug = 'apple-airpods-pro-2nd-gen' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=600', 'Blue Yeti USB Microphone', 'Blue Yeti USB Condenser Microphone', 0
FROM viddenave_products p WHERE p.slug = 'blue-yeti-usb-microphone-grey' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=600', 'Creative Pebble V3 Speakers', 'Creative Pebble V3 USB-C Desktop Speakers', 0
FROM viddenave_products p WHERE p.slug = 'creative-pebble-v3-usb-c-speakers' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=600', 'Razer Nommo V2 Gaming Speakers', 'Razer Nommo V2 PC Gaming Speakers', 0
FROM viddenave_products p WHERE p.slug = 'razer-nommo-v2-gaming-speakers' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=600', 'Logitech BRIO 4K Webcam', 'Logitech BRIO 4K Ultra HD Webcam', 0
FROM viddenave_products p WHERE p.slug = 'logitech-brio-4k-webcam' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=600', 'Razer Kiyo Pro Ultra Webcam', 'Razer Kiyo Pro Ultra 4K Webcam', 0
FROM viddenave_products p WHERE p.slug = 'razer-kiyo-pro-ultra-4k-webcam' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=600', 'Logitech C920 HD Pro Webcam', 'Logitech C920 HD Pro 1080p Webcam', 0
FROM viddenave_products p WHERE p.slug = 'logitech-c920-hd-pro-webcam' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 'AMD Ryzen 7 7800X3D', 'AMD Ryzen 7 7800X3D Desktop Processor', 0
FROM viddenave_products p WHERE p.slug = 'amd-ryzen-7-7800x3d' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 'AMD Ryzen 9 7950X', 'AMD Ryzen 9 7950X Desktop Processor', 0
FROM viddenave_products p WHERE p.slug = 'amd-ryzen-9-7950x' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 'Intel Core i5-13400F', 'Intel Core i5-13400F Desktop Processor', 0
FROM viddenave_products p WHERE p.slug = 'intel-core-i5-13400f' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 'AMD Ryzen 5 7600X', 'AMD Ryzen 5 7600X Desktop Processor', 0
FROM viddenave_products p WHERE p.slug = 'amd-ryzen-5-7600x' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 'Intel Core i9-13900K', 'Intel Core i9-13900K Desktop Processor', 0
FROM viddenave_products p WHERE p.slug = 'intel-core-i9-13900k' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591489378430-ef2f4c626b35?w=600', 'AMD Radeon RX 7800 XT', 'AMD Radeon RX 7800 XT 16GB Graphics Card', 0
FROM viddenave_products p WHERE p.slug = 'amd-radeon-rx-7800-xt-16gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591489378430-ef2f4c626b35?w=600', 'AMD Radeon RX 7900 XTX', 'AMD Radeon RX 7900 XTX 24GB', 0
FROM viddenave_products p WHERE p.slug = 'amd-radeon-rx-7900-xtx-24gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591489378430-ef2f4c626b35?w=600', 'NVIDIA RTX 4060 Ti 16GB', 'NVIDIA GeForce RTX 4060 Ti 16GB', 0
FROM viddenave_products p WHERE p.slug = 'nvidia-rtx-4060-ti-16gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591489378430-ef2f4c626b35?w=600', 'NVIDIA RTX 4090 24GB', 'NVIDIA GeForce RTX 4090 24GB', 0
FROM viddenave_products p WHERE p.slug = 'nvidia-rtx-4090-24gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=600', 'Kingston Fury Beast DDR4 16GB', 'Kingston Fury Beast DDR4 16GB 3200MHz', 0
FROM viddenave_products p WHERE p.slug = 'kingston-fury-beast-ddr4-16gb-3200' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=600', 'TeamGroup T-Force Xtreem DDR5 32GB', 'TeamGroup T-Force Xtreem ARGB DDR5 32GB 6000MHz', 0
FROM viddenave_products p WHERE p.slug = 'teamgroup-t-force-xtreem-ddr5-32gb-6000' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=600', 'G.Skill Trident Z5 RGB DDR5 64GB', 'G.Skill Trident Z5 RGB DDR5 64GB 6000MHz', 0
FROM viddenave_products p WHERE p.slug = 'gskill-trident-z5-rgb-ddr5-64gb-6000' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=600', 'Crucial Pro DDR5 32GB', 'Crucial Pro DDR5 32GB 5600MHz', 0
FROM viddenave_products p WHERE p.slug = 'crucial-pro-ddr5-32gb-5600' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1531492746076-161ca9bcad58?w=600', 'Samsung 990 Pro 2TB NVMe', 'Samsung 990 Pro 2TB M.2 NVMe SSD', 0
FROM viddenave_products p WHERE p.slug = 'samsung-990-pro-2tb-nvme' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1531492746076-161ca9bcad58?w=600', 'WD Black SN850X 1TB NVMe', 'WD Black SN850X 1TB NVMe SSD with Heatsink', 0
FROM viddenave_products p WHERE p.slug = 'wd-black-sn850x-1tb-nvme-hs' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=600', 'Seagate Barracuda 4TB HDD', 'Seagate Barracuda 4TB 3.5 Internal HDD', 0
FROM viddenave_products p WHERE p.slug = 'seagate-barracuda-4tb-3-5-hdd' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=600', 'Crucial X9 Pro 2TB SSD', 'Crucial X9 Pro 2TB Portable SSD', 0
FROM viddenave_products p WHERE p.slug = 'crucial-x9-pro-2tb-portable-ssd' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=600', 'Samsung T9 4TB Portable SSD', 'Samsung T9 4TB Portable SSD', 0
FROM viddenave_products p WHERE p.slug = 'samsung-t9-4tb-portable-ssd' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=600', 'Seagate One Touch 4TB External', 'Seagate One Touch 4TB External HDD', 0
FROM viddenave_products p WHERE p.slug = 'seagate-one-touch-4tb-external' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=600', 'SanDisk Extreme Pro 1TB SSD', 'SanDisk Extreme Pro 1TB Portable SSD V2', 0
FROM viddenave_products p WHERE p.slug = 'sandisk-extreme-pro-1tb-portable-ssd' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1618424181497-157f25b6ddd5?w=600', 'PNY PRO Elite V2 256GB', 'PNY PRO Elite V2 256GB USB Flash Drive', 0
FROM viddenave_products p WHERE p.slug = 'pny-pro-elite-v2-256gb-usb32' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1618424181497-157f25b6ddd5?w=600', 'Kingston DataTraveler Max 512GB', 'Kingston DataTraveler Max 512GB USB-C', 0
FROM viddenave_products p WHERE p.slug = 'kingston-datatraveler-max-512gb-usbc' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1618424181497-157f25b6ddd5?w=600', 'Samsung EVO Plus 256GB microSD', 'Samsung EVO Plus 256GB microSDXC', 0
FROM viddenave_products p WHERE p.slug = 'samsung-evo-plus-256gb-microsd' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1606904825846-647eb07f5be2?w=600', 'ASUS RT-AX88U Pro Router', 'ASUS RT-AX88U Pro WiFi 6 Router', 0
FROM viddenave_products p WHERE p.slug = 'asus-rt-ax88u-pro-wifi6' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1606904825846-647eb07f5be2?w=600', 'Netgear Orbi RBK863S Mesh', 'Netgear Orbi RBK863S WiFi 6E Mesh System', 0
FROM viddenave_products p WHERE p.slug = 'netgear-orbi-rbk863s-wifi6e-mesh' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=600', 'TP-Link TL-SG1008P Switch', 'TP-Link 8-Port Gigabit PoE Switch', 0
FROM viddenave_products p WHERE p.slug = 'tp-link-sg1008p-8port-poe-switch' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=600', 'TP-Link AX1800 USB WiFi Adapter', 'TP-Link Archer TX20U Plus AX1800 WiFi Adapter', 0
FROM viddenave_products p WHERE p.slug = 'tp-link-archer-tx20u-ax1800-usb-wifi' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587202372583-49330a15584d?w=600', 'Corsair iCUE H150i Elite ARGB', 'Corsair iCUE H150i Elite ARGB 360mm AIO Cooler', 0
FROM viddenave_products p WHERE p.slug = 'corsair-icue-h150i-elite-argb-360mm' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587202372583-49330a15584d?w=600', 'Noctua NH-D15 Air Cooler', 'Noctua NH-D15 Dual-Tower CPU Air Cooler', 0
FROM viddenave_products p WHERE p.slug = 'noctua-nh-d15-dual-tower-air-cooler' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587202372583-49330a15584d?w=600', 'NZXT H7 Flow Mid-Tower Case', 'NZXT H7 Flow Mid-Tower ATX PC Case', 0
FROM viddenave_products p WHERE p.slug = 'nzxt-h7-flow-mid-tower-white' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 'Corsair RM850x PSU', 'Corsair RM850x 850W 80+ Gold Power Supply', 0
FROM viddenave_products p WHERE p.slug = 'corsair-rm850x-850w-gold-psu' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 'ASUS ROG Strix B650E-F Motherboard', 'ASUS ROG Strix B650E-F AM5 ATX Motherboard', 0
FROM viddenave_products p WHERE p.slug = 'asus-rog-strix-b650e-f-am5-atx' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 'MSI MAG Z790 Tomahawk WiFi', 'MSI MAG Z790 Tomahawk WiFi DDR5 Motherboard', 0
FROM viddenave_products p WHERE p.slug = 'msi-mag-z790-tomahawk-wifi-ddr5' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=600', 'Canon PIXMA G3470 MegaTank', 'Canon PIXMA G3470 MegaTank All-In-One Printer', 0
FROM viddenave_products p WHERE p.slug = 'canon-pixma-g3470-megatank-aio' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=600', 'HP LaserJet MFP M234dwe', 'HP LaserJet MFP M234dwe Monochrome Laser Printer', 0
FROM viddenave_products p WHERE p.slug = 'hp-laserjet-mfp-m234dwe' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=600', 'Epson EcoTank ET-2850', 'Epson EcoTank ET-2850 All-in-One Printer', 0
FROM viddenave_products p WHERE p.slug = 'epson-ecotank-et-2850-wifi-aio' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600', 'APC Back-UPS 1500VA', 'APC Back-UPS 1500VA 865W UPS', 0
FROM viddenave_products p WHERE p.slug = 'apc-back-ups-1500va-865w' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600', 'APC Back-UPS 650VA', 'APC Back-UPS 650VA 400W UPS', 0
FROM viddenave_products p WHERE p.slug = 'apc-back-ups-650va-400w' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600', 'Belkin 12-Outlet Surge Protector', 'Belkin 12-Outlet Surge Protector Power Strip', 0
FROM viddenave_products p WHERE p.slug = 'belkin-12-outlet-surge-protector-3600j' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600', 'Targus 15.6" Laptop Backpack', 'Targus Classic 15.6 Laptop Backpack', 0
FROM viddenave_products p WHERE p.slug = 'targus-156-classic-laptop-backpack' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1593642533144-3d62aa4783ec?w=600', 'Kensington Laptop Cooling Stand', 'Kensington SmartFit Easy Riser Go Laptop Stand', 0
FROM viddenave_products p WHERE p.slug = 'kensington-smartfit-easy-riser-go-stand' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600', 'Tomtoc 360 Protective Laptop Sleeve', 'Tomtoc 360 Protective 14 inch Laptop Sleeve', 0
FROM viddenave_products p WHERE p.slug = 'tomtoc-360-protective-laptop-sleeve-14' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1601597111158-2fceff292cdc?w=600', 'Anker 7-in-1 USB-C Hub', 'Anker 7-in-1 USB-C Hub 4K HDMI', 0
FROM viddenave_products p WHERE p.slug = 'anker-7in1-usbc-hub-4k-hdmi' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1601597111158-2fceff292cdc?w=600', 'UGREEN 65W GaN Charger', 'UGREEN 65W GaN 3-Port USB-C Charger', 0
FROM viddenave_products p WHERE p.slug = 'ugreen-65w-gan-3port-charger' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1601597111158-2fceff292cdc?w=600', 'Baseus Blade Power Bank', 'Baseus Blade 20000mAh 100W Power Bank', 0
FROM viddenave_products p WHERE p.slug = 'baseus-blade-20000mah-100w-power-bank' ON CONFLICT DO NOTHING;

-- ── Product ↔ Category Links ──────────────────────────────────

-- Laptops
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'asus-zenbook-pro-14-oled-i9-32gb-1tb', 'samsung-galaxy-book3-ultra-i9-32gb-1tb',
  'hp-spectre-x360-14-i7-16gb-1tb', 'lenovo-thinkpad-x1-carbon-gen11',
  'asus-rog-zephyrus-g14-r9-16gb-1tb', 'acer-swift-x-14-r7-16gb-512gb',
  'microsoft-surface-laptop-5-i5-8gb-256gb', 'lenovo-ideapad-gaming-3-r5-8gb-512gb',
  'dell-inspiron-15-3000-i5-8gb-256gb', 'apple-macbook-air-m2-8gb-256gb',
  'hp-elitebook-840-g10-i7-16gb-512gb'
) AND c.slug IN ('computers', 'laptops')
ON CONFLICT DO NOTHING;

-- Desktops
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'intel-nuc-13-pro-i7-32gb-1tb', 'hp-pavilion-desktop-i7-13700-16gb',
  'apple-mac-mini-m2-8gb-256gb', 'asus-rog-strix-g15-i9-32gb-rtx4080'
) AND c.slug IN ('computers', 'desktops-workstations')
ON CONFLICT DO NOTHING;

-- Monitors
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'samsung-32-odyssey-g7-qled-240hz', 'benq-pd2705u-27-4k-designer',
  'lg-27-ultragear-qhd-165hz', 'dell-ultrasharp-24-4k-usbc-u2422de',
  'asus-proart-pa32dc-32-4k-oled'
) AND c.slug IN ('computer-accessories', 'monitors-displays')
ON CONFLICT DO NOTHING;

-- Keyboards
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'apple-magic-keyboard-touch-id-numeric', 'steelseries-apex-pro-tkl-wireless',
  'keychron-k2-pro-wireless-mechanical', 'corsair-k100-rgb-optical-keyboard'
) AND c.slug IN ('computer-accessories', 'keyboards-mice')
ON CONFLICT DO NOTHING;

-- Mice
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'logitech-mx-master-3s-wireless-mouse', 'razer-deathadder-v3-hyperspeed',
  'microsoft-arc-mouse-glacier', 'logitech-g-pro-x-superlight-2'
) AND c.slug IN ('computer-accessories', 'keyboards-mice')
ON CONFLICT DO NOTHING;

-- Headphones
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'sony-wh-1000xm5-wireless-headphones', 'bose-quietcomfort-45',
  'jbl-quantum-810-wireless-gaming-headset', 'logitech-g-pro-x-2-lightspeed-wireless',
  'apple-airpods-pro-2nd-gen'
) AND c.slug IN ('computer-accessories', 'headphones-earbuds')
ON CONFLICT DO NOTHING;

-- Microphones & Speakers
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'blue-yeti-usb-microphone-grey', 'creative-pebble-v3-usb-c-speakers',
  'razer-nommo-v2-gaming-speakers'
) AND c.slug IN ('computer-accessories', 'speakers-microphones')
ON CONFLICT DO NOTHING;

-- Webcams
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'logitech-brio-4k-webcam', 'razer-kiyo-pro-ultra-4k-webcam', 'logitech-c920-hd-pro-webcam'
) AND c.slug IN ('computer-accessories', 'webcams')
ON CONFLICT DO NOTHING;

-- CPUs
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'amd-ryzen-7-7800x3d', 'amd-ryzen-9-7950x', 'intel-core-i5-13400f',
  'amd-ryzen-5-7600x', 'intel-core-i9-13900k'
) AND c.slug IN ('hardware-components', 'processors-cpus')
ON CONFLICT DO NOTHING;

-- GPUs
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'amd-radeon-rx-7800-xt-16gb', 'amd-radeon-rx-7900-xtx-24gb',
  'nvidia-rtx-4060-ti-16gb', 'nvidia-rtx-4090-24gb'
) AND c.slug IN ('hardware-components', 'graphics-cards')
ON CONFLICT DO NOTHING;

-- RAM
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'kingston-fury-beast-ddr4-16gb-3200', 'teamgroup-t-force-xtreem-ddr5-32gb-6000',
  'gskill-trident-z5-rgb-ddr5-64gb-6000', 'crucial-pro-ddr5-32gb-5600'
) AND c.slug IN ('hardware-components', 'memory-ram')
ON CONFLICT DO NOTHING;

-- Internal Storage
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'samsung-990-pro-2tb-nvme', 'wd-black-sn850x-1tb-nvme-hs', 'seagate-barracuda-4tb-3-5-hdd'
) AND c.slug IN ('storage-memory', 'internal-storage')
ON CONFLICT DO NOTHING;

-- External Storage
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'crucial-x9-pro-2tb-portable-ssd', 'samsung-t9-4tb-portable-ssd',
  'seagate-one-touch-4tb-external', 'sandisk-extreme-pro-1tb-portable-ssd'
) AND c.slug IN ('storage-memory', 'external-storage')
ON CONFLICT DO NOTHING;

-- USB Drives
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'pny-pro-elite-v2-256gb-usb32', 'kingston-datatraveler-max-512gb-usbc'
) AND c.slug IN ('storage-memory', 'usb-drives')
ON CONFLICT DO NOTHING;

-- Memory Cards
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug = 'samsung-evo-plus-256gb-microsd' AND c.slug IN ('storage-memory', 'memory-cards')
ON CONFLICT DO NOTHING;

-- Networking
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN ('asus-rt-ax88u-pro-wifi6', 'netgear-orbi-rbk863s-wifi6e-mesh')
AND c.slug IN ('networking', 'routers-modems')
ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN ('tp-link-sg1008p-8port-poe-switch', 'tp-link-archer-tx20u-ax1800-usb-wifi')
AND c.slug IN ('networking', 'network-adapters')
ON CONFLICT DO NOTHING;

-- Cooling & Cases
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'corsair-icue-h150i-elite-argb-360mm', 'noctua-nh-d15-dual-tower-air-cooler',
  'nzxt-h7-flow-mid-tower-white'
) AND c.slug IN ('hardware-components', 'cooling-cases')
ON CONFLICT DO NOTHING;

-- PSU & Motherboards
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'corsair-rm850x-850w-gold-psu', 'asus-rog-strix-b650e-f-am5-atx',
  'msi-mag-z790-tomahawk-wifi-ddr5'
) AND c.slug IN ('hardware-components', 'psu-motherboards')
ON CONFLICT DO NOTHING;

-- Printers
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN ('canon-pixma-g3470-megatank-aio', 'epson-ecotank-et-2850-wifi-aio')
AND c.slug IN ('printers-scanners', 'inkjet-printers')
ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug = 'hp-laserjet-mfp-m234dwe' AND c.slug IN ('printers-scanners', 'laser-printers')
ON CONFLICT DO NOTHING;

-- UPS
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN ('apc-back-ups-1500va-865w', 'apc-back-ups-650va-400w')
AND c.slug IN ('power-ups', 'ups-systems')
ON CONFLICT DO NOTHING;

-- Surge Protectors
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug = 'belkin-12-outlet-surge-protector-3600j'
AND c.slug IN ('power-ups', 'surge-protectors')
ON CONFLICT DO NOTHING;

-- Bags, Cases & Accessories
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN ('targus-156-classic-laptop-backpack', 'tomtoc-360-protective-laptop-sleeve-14')
AND c.slug IN ('computer-accessories', 'laptop-bags-cases')
ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug = 'kensington-smartfit-easy-riser-go-stand'
AND c.slug IN ('computer-accessories', 'cooling-pads')
ON CONFLICT DO NOTHING;

-- Cables & Adapters (hubs and chargers go under computer-accessories)
INSERT INTO viddenave_product_categories (product_id, category_id)
SELECT p.id, c.id FROM viddenave_products p, viddenave_categories c
WHERE p.slug IN (
  'anker-7in1-usbc-hub-4k-hdmi', 'ugreen-65w-gan-3port-charger',
  'baseus-blade-20000mah-100w-power-bank'
) AND c.slug IN ('cables-adapters')
ON CONFLICT DO NOTHING;

-- ── Product Attributes ────────────────────────────────────────

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'RAM', ARRAY['16GB', '32GB', '64GB'], 0 FROM viddenave_products WHERE slug = 'asus-zenbook-pro-14-oled-i9-32gb-1tb' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['512GB SSD', '1TB SSD', '2TB SSD'], 1 FROM viddenave_products WHERE slug = 'asus-zenbook-pro-14-oled-i9-32gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'RAM', ARRAY['16GB', '32GB'], 0 FROM viddenave_products WHERE slug = 'samsung-galaxy-book3-ultra-i9-32gb-1tb' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['512GB SSD', '1TB SSD', '2TB SSD'], 1 FROM viddenave_products WHERE slug = 'samsung-galaxy-book3-ultra-i9-32gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'RAM', ARRAY['16GB', '32GB', '64GB'], 0 FROM viddenave_products WHERE slug = 'intel-nuc-13-pro-i7-32gb-1tb' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['256GB SSD', '512GB SSD', '1TB SSD'], 1 FROM viddenave_products WHERE slug = 'intel-nuc-13-pro-i7-32gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Colour', ARRAY['Midnight Black', 'Natural Silver'], 0 FROM viddenave_products WHERE slug = 'hp-spectre-x360-14-i7-16gb-1tb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Socket', ARRAY['AM5'], 0 FROM viddenave_products WHERE slug = 'amd-ryzen-7-7800x3d' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Memory Support', ARRAY['DDR5'], 1 FROM viddenave_products WHERE slug = 'amd-ryzen-7-7800x3d' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Socket', ARRAY['AM5'], 0 FROM viddenave_products WHERE slug = 'amd-ryzen-9-7950x' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Memory Support', ARRAY['DDR5'], 1 FROM viddenave_products WHERE slug = 'amd-ryzen-9-7950x' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Socket', ARRAY['LGA1700'], 0 FROM viddenave_products WHERE slug = 'intel-core-i5-13400f' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Memory Support', ARRAY['DDR4', 'DDR5'], 1 FROM viddenave_products WHERE slug = 'intel-core-i5-13400f' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'VRAM', ARRAY['16GB GDDR6'], 0 FROM viddenave_products WHERE slug = 'amd-radeon-rx-7800-xt-16gb' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Interface', ARRAY['PCIe 4.0 x16'], 1 FROM viddenave_products WHERE slug = 'amd-radeon-rx-7800-xt-16gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'VRAM', ARRAY['24GB GDDR6X'], 0 FROM viddenave_products WHERE slug = 'nvidia-rtx-4090-24gb' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Interface', ARRAY['PCIe 4.0 x16'], 1 FROM viddenave_products WHERE slug = 'nvidia-rtx-4090-24gb' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Capacity', ARRAY['16GB (2×8GB)', '32GB (2×16GB)', '64GB (2×32GB)'], 0 FROM viddenave_products WHERE slug = 'teamgroup-t-force-xtreem-ddr5-32gb-6000' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Speed', ARRAY['5200MHz', '5600MHz', '6000MHz', '6400MHz'], 1 FROM viddenave_products WHERE slug = 'teamgroup-t-force-xtreem-ddr5-32gb-6000' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Capacity', ARRAY['1TB', '2TB'], 0 FROM viddenave_products WHERE slug = 'crucial-x9-pro-2tb-portable-ssd' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Capacity', ARRAY['64GB', '128GB', '256GB', '512GB'], 0 FROM viddenave_products WHERE slug = 'pny-pro-elite-v2-256gb-usb32' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Switch Type', ARRAY['OmniPoint 2.0 (Adjustable 0.2–3.8mm)'], 0 FROM viddenave_products WHERE slug = 'steelseries-apex-pro-tkl-wireless' ON CONFLICT DO NOTHING;
INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Colour', ARRAY['Black'], 1 FROM viddenave_products WHERE slug = 'steelseries-apex-pro-tkl-wireless' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Colour', ARRAY['Black', 'White'], 0 FROM viddenave_products WHERE slug = 'sony-wh-1000xm5-wireless-headphones' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Colour', ARRAY['Black', 'White'], 0 FROM viddenave_products WHERE slug = 'apple-airpods-pro-2nd-gen' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Capacity', ARRAY['16GB', '32GB', '64GB', '256GB', '512GB'], 0 FROM viddenave_products WHERE slug = 'samsung-evo-plus-256gb-microsd' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Output', ARRAY['650VA/400W', '1000VA/600W', '1500VA/865W'], 0 FROM viddenave_products WHERE slug = 'apc-back-ups-1500va-865w' ON CONFLICT DO NOTHING;

INSERT INTO viddenave_product_attributes (product_id, name, options, position)
SELECT id, 'Colour', ARRAY['Black', 'Space Grey'], 0 FROM viddenave_products WHERE slug = 'apple-magic-keyboard-touch-id-numeric' ON CONFLICT DO NOTHING;

-- ── Update category product counts ───────────────────────────

UPDATE viddenave_categories c
SET count = (
  SELECT COUNT(*) FROM viddenave_product_categories pc WHERE pc.category_id = c.id
);