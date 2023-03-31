-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2023 at 01:57 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(12, 15, 1, 1),
(13, 15, 5, 1),
(14, 15, 2, 1),
(16, 15, 9, 1),
(20, 9, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'Bedroom', 'Bedroom'),
(2, 'Sofa', 'Sofa'),
(3, 'Chair', 'Chair'),
(4, 'Dianing-room', 'Dianing-room');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5),
(21, 11, 2, 1),
(22, 12, 1, 1),
(23, 13, 1, 2),
(24, 13, 9, 1),
(25, 14, 2, 1),
(26, 14, 5, 1),
(27, 15, 3, 1),
(28, 15, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password`
--

CREATE TABLE `forgot_password` (
  `id` int(5) NOT NULL,
  `email` int(30) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forgot_password`
--

INSERT INTO `forgot_password` (`id`, `email`, `token`) VALUES
(0, 0, '2a2f1d416128cfcbc959945d6b7146ac6409b4cbcd2c3'),
(0, 0, 'a9fa887d40b55e6032d2b3a10f7ec93e6409b4cc40cbb'),
(0, 0, 'a9fa887d40b55e6032d2b3a10f7ec93e6409b4cc6c7c1'),
(0, 0, 'a9fa887d40b55e6032d2b3a10f7ec93e6409b4cc919f5'),
(0, 0, 'a9fa887d40b55e6032d2b3a10f7ec93e6409b4ccb737e'),
(0, 0, 'a9fa887d40b55e6032d2b3a10f7ec93e6409b4ccf1187'),
(0, 0, 'd5727282395b15a03db88c80cb2fb8bb6409b4cd48ad2'),
(0, 0, 'd5727282395b15a03db88c80cb2fb8bb6409b4cd730af'),
(0, 0, 'd5727282395b15a03db88c80cb2fb8bb6409b4cd9e5e0'),
(0, 0, 'd5727282395b15a03db88c80cb2fb8bb6409b4cdc4acf'),
(0, 0, 'd5727282395b15a03db88c80cb2fb8bb6409b4cdefd7e');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(1, 1, 'Toya Queen size bed in walnut finish', '<p>Available in King bed, Queen bed, Night stand, Dresser with mirror & 4 Door wardrobe, Sold separately.\r\nBlack glass & geometric pattern on headboard for aesthetic look.\r\nHydraulic with LVL slats makes structure strong & allows breathability for mattresses.\r\nHydraulic lift capacity 85-90 (KB) kg for easy operation by female\r\nComes with 1 year warranty against manufacturing defect</p>\r\n', 'b-1', 15000, 'b-1.jpg', '2023-03-10', 3),
(2, 1, 'Empire Solidwood Queen bed with Hydraulic storage in Walnut Colour', '<p>Available in King bed, Queen bed, Night stand, Dresser with mirror & 4 Door wardrobe.</p>\r\n<p>Carved design on headboard</p>\r\n<p>Upto 8\" spring mattress recommended</p>\r\n<p>Hydraulic with LVL slats makes structure strong & allows </p><p>breathability for mattresses.</p>\r\n', 'bed with pure black lavis color', 20000, 'b-2.jpg', '2023-03-10', 2),
(3, 1, 'Modrest Token Modern White Stainless Steel Bed Nightstands sofa chair', '<p>Merging royal elegance with a modern touch, the Modrest Token Modern White and Stainless Steel Bedroom Set has a spacious bed with a sunken frame. The tall headboard has vertical ridges in stainless steel, making you feel like royalty. This bedroom set includes two nightstands and a bed, both of which are made in the same style. This stylishly designed modern bedroom set is out to turn your bedroom into a haven of luxuriousness and comfort.</p>\r\n', 'Modrest Token  Modern White  Stainless Steel Bed  Nightstands  sofa  chair', 60000, 'b-3.jpg', '2023-03-10', 1),
(4, 1, 'Monte Carlo Black Leatherette Modern Bed w/ Crystals', '<p>Black, retro luxurious leatherette covered bed that sits low to the ground and has a tall headboard that features tufted padding covered by high quality crystal buttons that give off a brilliant shine when light falls on them.</p>', 'Monte Carlo Black Leatherette Modern Bed w/ Crystals', 50000, 'b-4.jpg', '2018-05-10', 3),
(5, 3, 'Circular Fiberglass Lounge Chair Red', '<p> Complete the coziness in your living room with our Red Circular Lounge Chair. With its white fiberglass exterior and its warm and elegant cashmere finish, just looking at this piece would make you feel the need to sit down for maximum comfort. </p>\r\n', 'Circular Fiberglass Lounge Chair Red', 6000, 'c-1.jpg', '2023-03-10', 2),
(6, 1, 'Brown Eastern King Oak Bed', '<p>The Denmark modern lights between the headboard and the wing-like extensions provide ambient illumination. This uniquely designed modern bed has a plush backboard giving it a strong and sturdy construction that will provide your bedroom an elegant style.</p>\r\n', 'Brown Eastern King Oak Bed', 25000, 'b-5.jpg', '2023-02-27', 1),
(7, 3, 'Alpha Black Solid Back Plastic Chair with Arm', '<p> Luxurious & Sleek Design, Wipe Clean with a Wet & Dry Cloth.\r\nDurability: The Chair\'s Seat Offers Comfort & Support, The Structure Follows the Scientific Principle & Strong Enough to Hold Various Things & It\'s Sturdy, Solid for Long Time & Durable Usage.\r\nMulti-Purpose Use: These Chairs are Preferred for Both Indoor & Outdoor Activities, Let There be a Party, Family Gatherings, Kids Day Out & These Chairs Will be Your Go to Choice for Any Family Event.\r\nStackable: While Designing These Chairs We Have Kept in Mind to Provide Our Customers with Easy & Hassle-Free Ownership Experience & Thus Chairs are Designed in Such a Way That They are Easy to Stack, Store & Transport. </p>\r\n\r\n\r\n', 'Alpha Black Solid Back Plastic Chair with Arm', 3000, 'c-2.jpg', '2023-02-27', 1),
(8, 1, 'TUFFING Bunk bed frame', '<p>A bunk bed is perfect when you need 2 sleeping places on a small area. This one has passed the same tough safety tests as all our other bunk beds.</p>', 'TUFFING Bunk bed frame', 8000, 'b-6.jpg', '2023-02-27', 1),
(9, 2, 'VIMLE color 3 seater', '<p>A new cover is a great way to extend the life of your favourite sofa and revitalise your home – for a new season or a special occasion. You also make a sustainable choice by freshening up and reusing!</p>', 'VIMLE color 3 seater', 6000, 's-1.jpg', '2023-03-10', 1),
(10, 2, 'FURNY Carlito Fabric 5 Seater LHS L Shape Sofa Set', '<p>Upholstery Material is Fabric and Color is Light Grey-Dark Grey.\r\nFurny is a leading provider of sofa sets - wooden sofa sets both in leather and fabric finishes.\r\nGood ground clearance for easy cleaning below the sofa.\r\nTop quality recliner sofa sets, sofa sets in L shapes, sectional designs and comfortable rocking chairs.\r\nAssembly Instructions: Sofa is Pre-Assembled.</p>\r\n', 'FURNY Carlito Fabric 5 Seater LHS L Shape Sofa Set', 30000, 's-2.jpg', '2023-02-25', 2),
(11, 2, 'Kaylee Velvet 3 Seater Sofa In Sky Blue Colour', '<p> Package Contains : 3+2 Fabric Sofa Set For Living Room|\r\nUpholstery Material : Fabric| Color :Sky Blue-Light Grey| Seating Capacity : 5 Seater\r\nThis 3+2 Fabric Sofa Set is one of our finest wooden sofa sets in Premium Leatherette offering superb comfort, look and finish as compared to other sofa sets. All Casastyle sofa sets go through rigorous checking and quality testing to meet our standards of improving customer experience while buying a sofa set </p>\r\n', 'Kaylee Velvet 3 Seater Sofa In Sky Blue Colour', 26000, 's-3.jpg', '2023-02-27', 1),
(12, 2, 'Lifestyle Cuba Leatherette 6 Seater Sofa  (Finish Color - White, DIY(Do-It-Yourself))', '<p> Lifestyle brings to you modern and comfortable sofa set for your living room. Bharat Lifestyle Cuba Black 3+D Leatherette Sofa Set is made of Acacia wood. It has an elegant design which enhances the interior decor of your living room. Designed in such a way, the sofa is comfortable to sit. The best part it, it comes with good price without compromising on quality. Buy this sofa today! </p>', 'Lifestyle Cuba Leatherette 6 Seater Sofa  (Finish Color - White, DIY(Do-It-Yourself))', 16000, 's-4.jpg', '2018-05-12', 3),
(13, 2, 'Napper L Shape Sofa Set 3 Seater Left Aligned Chaise', '<p>  L Shaped Six-seater sofa with lounger made from high-quality fabric in blue color;Product Dimensions: Sofa set - Length (71 inch), width (30 inch), height (31 inch) and Lounger - Length (72 inch), width (30 inch), height (31 inch)\r\nOver 30 tests conducted to ensure quality;Fabric does not lose color while rubbing\r\nPassed durability testing with 100 kg on each seat and backrest for 25,000 cycles;Meets Indian Standards IS 12674/ IS 5416 for performance and stringent European Safety Requirement Standard EN 12520; Warranty on manufacturing defects: 3 years;Lightweight for easy shifting\r\nGood ground clearance for easy cleaning below the sofa;Free from toxins and harmful chemicals like formaldehyde and AZO Dye. Please note: Sofa is delivered with the legs in a detached condition. The legs are packed in a separate package and will be installed during assembly</p>', 'Napper L Shape Sofa Set 3 Seater Left Aligned Chaise', 30000, 's-5.jpg', '2023-02-27', 1),
(14, 2, 'WESTIDO Mac Leatherette 3 Seater Sofa', '<p>Seasoned solid wood frames</p>\r\n\r\n<p>This sofa’s frame is made from seasoned solid wood that undergoes a 3-step treatment for protection against borers and is kiln-dried for moisture control.</p>\r\n\r\n\r\n<p>Long-lasting suspension system</p>\r\n\r\n<p>This sofa is supported on a foundation of 3 inch wide elastic bands, thicker and more durable than the industry standard.</p>', 'WESTIDO Mac Leatherette 3 Seater Sofa', 16000, 's-6.jpg', '2018-05-10', 13),
(15, 2, 'Roman Living Hastings', '<p>Cushions are firm, giving ample support to the body while maintaining shape for a long time</p>\r\n<p>Fully upholstered 3+1+1 sofa set\r\nSeating height - 40.6 cm\r\n1 year warranty. </p>\r\n<p> With multiple use </p>', 'Roman Living Hastings', 14000, 's-7.jpg', '2018-07-09', 1),
(16, 2, 'Blissplus Fabric LHS Sectional Sofa  in Royal Black & Grey Colour', '<p>Pharaoh Black & Gold Carving Luxury Sofa Set is Best Choice For Those Who Are Searching For Classic Sofa Set With Luxury Appearance. Black & Gold Check Back Upholstery, Gold Varnished Polish and Special Hand-Woven Fabric Adding Eternal Pharaoh Beauty. Wooden Hand Carved Motifs Work On Grade 1 Teak Wood, Ergonomic Structure and High-Quality Cushion Together Provide a Comfortable Session.</p>', 'Blissplus Fabric LHS Sectional Sofa  in Royal Black & Grey Colour', 10000, 's-8.jpg', '2018-05-10', 2),
(17, 3, 'Arm Chair in Warm Teak Designed by Pierre Jeanneret', '<p> Solid teak. Famous for its strength and elegant grain pattern.\r\nHighest grade, natural rattan weave\r\nHandmade by traditional artisan carpenters to the highest quality standards\r\nPremium German epoxy adhesives for superior strength and durability\r\nEnvironmentally friendly and safe water-based finishes. </p>\r\n\r\n', 'Arm Chair in Warm Teak Designed by Pierre Jeanneret', 3500, 'c-3.jpg', '2018-05-12', 1),
(18, 3, 'White Rose Table Chair Set', '<p> Material:Fabric cusioned seat with plain back (Mesh) , 360-degree swivel & nylon casters, Easily adjust height to your comfort.\r\nThe Black colour chair enables the chair to fit in easily with your office or home decor & looks very elegant | Weight Capacity:- Upto 90 kgs |\r\nAssembly : Easy to Assemble / Manual Included with METAL quality </p>\r\n', 'White Rose Table Chair Set', 5500, 'c-4.jpg', '2018-05-12', 2),
(19, 3, 'JAE Furniture Home Office Chair', '<p>A comfy chair that’s sturdy, yet lightweight and stackable too. An easy match with different tables and styles and eager to please, whether it’s in the dining room, in the entrance or by your bed.</p>\r\n\r\n\r\n', 'JAE Furniture Home Office Chair', 3900, 'c-5.jpg', '2018-05-10', 1),
(20, 3, 'FURNITUREHUB Sheesham Wooden Rocking Chair', '<p>The gentle swaying motion, comfortable seats, and the sturdy build are all characteristics of an awesome rocking chair. From the good old-fashioned wooden to latest and modern designs. There’s nothing more inviting than the sight of a rocking chair waiting to be settled into. This Rocking Chair is fully Portable & Easy to Dismantle. Easy to Carry from one place to another. Relax your Back Pain & Heals your mind while rolling on it. From the good old-fashioned wooden rocking chairs to pieces with slim, sleek silhouettes,</p>', 'FURNITUREHUB Sheesham Wooden Rocking Chair', 5000, 'c-6.jpg', '2018-05-12', 1),
(27, 1, 'Sofa Cum Bed : fabric Alfonsco Convertable sofa', 'Sofa Cum Bed - Wooden Street offers a wide range of Sofa Cum Bed online in India in best price. Now choose the perfect sofa cum bed furniture for your home', 'Sofa Cum Bed : fabric Alfonsco Convertable sofa', 18000, 'b-7.jpg', '2023-02-27', 1),
(28, 4, 'Wood Dining Table with Cushion Chairs Wooden Dining Room Solid Wood 6 Seater Dining Set', '<p> We endeavor to serve you furniture with the excellence of top-notch International Quality Standards. We produce Sophisticated Design that can embellish your interior. Our Store has various furniture category i.e. Solid Wood Dining Table Set, Nesting Table, Coffee Table, Console Table, Stool, cabinets, Shoe Racks, Wall Shelf, Book Shelf, TV Unit, Bar Cabinet and much More. This Dining Table Set is made up of Solid Sheesham wood and ingenious design will refreshen your interiors with its plush look & elegant finish and compliments any existing decor.</p>', 'Modway Solid Sheesham Wood Dining Table with Cushion Chairs Wooden Dining Room Solid Wood 6 Seater Dining Set', 20000, 'd-1.jpg', '2023-03-25', 3),
(29, 4, 'Alice Solid Wood 6 Seater Dining Set', '<p>Dining holds a special place in our households. It is a place where we can relax after a long day in the company of our loved ones. With the Alice Dining Set, @home is here to make these occasions even more memorable. With a rectangular dining table, four chairs, and a bench, this modern dining set can easily seat six people at a time. The premium rubber wood and MDF construction ensure that you will have this furniture in your home for many years to come. This sturdy wooden structure has a beautiful melamine finish that adds to its beauty and durability. The soft upholstery on the seats will make you want to put your feet up and sit for hours, laughing and telling stories with your family and friends.</p>', ' Alice Solid Wood 6 Seater Dining Set', 25000, 'd-2.jpg', '2023-03-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10'),
(11, 14, 'PAYID-MQFK6OQ75H42998DL387064L', '2023-03-10'),
(12, 14, 'PAYID-MQFLE4I33P28382EB087383N', '2023-03-10'),
(13, 14, 'PAYID-MQFLW6A10Y736159E328174U', '2023-03-10'),
(14, 14, 'PAYID-MQFLYQQ3AK31239MM528443F', '2023-03-10'),
(15, 14, 'PAYID-MQFLZGA1EN26070NC565443K', '2023-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`, `token`) VALUES
(1, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, 'patel', 'ashik', '', '', 'user.png', 1, '', '', '2018-05-01', ''),
(9, 'harry@den.com', '$2y$10$Oongyx.Rv0Y/vbHGOxywl.qf18bXFiZOcEaI4ZpRRLzFNGKAhObSC', 1, 'Harry', 'Den', 'Silay City, Negros Occidental', '09092735719', 'user.png', 1, 'k8FBpynQfqsv', 'eTYmDtU4C7lKPIh', '2018-05-09', ''),
(12, 'christine@gmail.com', '$2y$10$ozW4c8r313YiBsf7HD7m6egZwpvoE983IHfZsPRxrO1hWXfPRpxHO', 0, 'Christine', 'becker', 'demo', '7542214500', 'user.png', 1, '', '', '2018-07-09', ''),
(13, 'patelashik@gmail.com', '$2y$10$e8rjToGfV1jzQ0njHdCuHe9b5ebBDvAKVwD3ZwF3T3je3hm9l..ly', 0, 'patel', 'ashik', '', '', '', 1, 'YXHgrTbx93Sk', 'QtU726XlsSwyD8T', '2023-02-21', ''),
(14, 'patelashik456@gmail.com', '$2y$10$NEBFxhxLg9/ah1zFUrz74.GY8vE3DvKRN34bjrN4awC5KPW5spibS', 0, 'patel', 'ashik', '', '', '', 1, '3FyvnVIs1LaQ', '', '2023-02-21', ''),
(15, '123@gmail.com', '123', 0, 'patel', 'arpit', '', '', '', 1, 'B6ZwPQujNeXG', 'KN9GQD6rpukPUvA', '2023-02-25', ''),
(56, 'patelnaimish@gmail.com', '$2y$10$XgVHtJY5p.Ra.DQt8aSp/ewcx1Osh05RR0ZQb.v66C7bVIRbASMbm', 0, '9316847394', 'sp hostel gulbai tekra , navarngpura', 'naimish', 'patel', '', 1, 'ySWLEOmh56aw', '', '2023-03-10', ''),
(103, 'patelashik2226@gmail.com', '$2y$10$h3Cp8kXk05pgxFCx6BAb3OcmgXXBFvUg6okrzEpkO6EuTilUkb5.K', 0, 'patel', 'sanket', '', '', '', 1, 'gY2JHPqQakMf', 'nClTBDUtAbLZuSg', '2023-03-25', ''),
(104, 'nemishkakadiya@gmail.com', '$2y$10$vho2Fn/6dCZbBit64n/ibebFDnfqniwwy2xFA2z5VyxMnJvuG6v.K', 0, 'patel', 'nemish', '', '', '', 0, 'sYHK7ao8fFgq', '', '2023-03-25', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
