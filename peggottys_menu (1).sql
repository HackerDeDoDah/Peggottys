-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2025 at 03:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peggottys_menu`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price_small` decimal(10,2) DEFAULT NULL,
  `price_medium` decimal(10,2) DEFAULT NULL,
  `price_large` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `category`, `price_small`, `price_medium`, `price_large`, `created_at`) VALUES
(1, 'Cod', 'fish', 8.60, 9.90, 11.90, '2025-05-02 14:34:08'),
(2, 'Haddock', 'fish', NULL, 9.90, 11.80, '2025-05-02 14:34:08'),
(3, 'Plaice', 'fish', NULL, 9.80, NULL, '2025-05-02 14:34:08'),
(4, 'Scampi', 'fish', NULL, 7.90, NULL, '2025-05-02 14:34:08'),
(13, 'Rock', 'fish', NULL, 9.90, NULL, '2025-05-02 15:44:11'),
(14, 'Skate (Wing/Middle)', 'fish', NULL, 11.50, NULL, '2025-05-02 15:44:11'),
(15, 'Cod Bites (4PCS)', 'fish', NULL, 7.30, NULL, '2025-05-02 15:44:11'),
(16, 'Cod Bites (6PCS)', 'fish', NULL, 10.30, NULL, '2025-05-02 15:44:11'),
(17, 'Fish Cake', 'fish', NULL, 2.95, NULL, '2025-05-02 15:44:11'),
(18, 'Cod Roe', 'fish', NULL, 2.95, NULL, '2025-05-02 15:44:11'),
(19, '1/4 Pounder', 'Burgers', NULL, 4.70, NULL, '2025-05-03 09:13:35'),
(20, '1/4 Pounder Cheese', 'Burgers', NULL, 4.90, NULL, '2025-05-03 09:13:35'),
(21, '1/2 Pounder', 'Burgers', NULL, 6.60, NULL, '2025-05-03 09:13:35'),
(22, '1/2 Pounder Cheese', 'Burgers', NULL, 6.80, NULL, '2025-05-03 09:13:35'),
(23, 'Chicken Breast Fillet', 'Burgers', NULL, 6.60, NULL, '2025-05-03 09:13:35'),
(24, 'Veggie Supreme Burger', 'Burgers', NULL, 5.50, NULL, '2025-05-03 09:13:35'),
(25, 'Chicken & Mushroom Pie', 'pies', NULL, 4.25, NULL, '2025-05-03 09:27:27'),
(26, 'Minced Beef & Onion Pie', 'pies', NULL, 4.25, NULL, '2025-05-03 09:27:27'),
(27, 'Steak & Kidney Pie', 'pies', NULL, 4.25, NULL, '2025-05-03 09:27:27'),
(28, 'Plain Sausage', 'pies', NULL, 2.85, NULL, '2025-05-03 09:27:27'),
(29, 'Battered Sausage', 'pies', NULL, 2.95, NULL, '2025-05-03 09:27:27'),
(30, 'Saveloy', 'pies', NULL, 2.85, NULL, '2025-05-03 09:27:27'),
(31, 'Chicken Nuggets (5PCS)', 'chicken', NULL, 3.85, NULL, '2025-05-03 09:49:47'),
(32, 'Chicken Nuggets (9PCS)', 'chicken', NULL, 5.95, NULL, '2025-05-03 09:49:47'),
(33, 'Chicken Fillet Bites (6PCS)', 'chicken', NULL, 5.85, NULL, '2025-05-03 09:49:47'),
(34, '1/2 Chicken', 'chicken', NULL, 6.95, NULL, '2025-05-03 09:49:47'),
(35, '1/2 Chicken & Chips', 'chicken', NULL, 8.70, NULL, '2025-05-03 09:49:47'),
(36, 'Cheese Burger', 'kids', NULL, 5.95, NULL, '2025-05-03 09:58:26'),
(37, 'Nuggets (4PCS)', 'kids', NULL, 5.95, NULL, '2025-05-03 09:58:26'),
(38, 'Sausage or Saveloy', 'kids', NULL, 5.95, NULL, '2025-05-03 09:58:26'),
(39, 'Cod Fish Fingers (2PCS)', 'kids', NULL, 5.95, NULL, '2025-05-03 09:58:26'),
(40, 'Onion rings (10pcs)', 'sides', NULL, 3.30, NULL, '2025-05-03 13:06:39'),
(41, 'curry spring roll', 'sides', NULL, 3.50, NULL, '2025-05-03 13:06:39'),
(42, 'vegetable spring roll', 'sides', NULL, 3.50, NULL, '2025-05-03 13:06:39'),
(43, 'mushy peas', 'sides', NULL, 2.30, NULL, '2025-05-03 13:06:39'),
(44, 'curry sauce', 'sides', NULL, 2.30, NULL, '2025-05-03 13:45:01'),
(45, 'bottled vinegar', 'sides', NULL, 2.50, NULL, '2025-05-03 13:51:57'),
(46, 'bottle of onion vinegar', 'sides', NULL, 2.50, NULL, '2025-05-03 13:51:57'),
(47, 'bottled ketchup', 'sides', NULL, 2.50, NULL, '2025-05-03 13:51:57'),
(48, 'pickled gherkin', 'sides', NULL, 1.10, NULL, '2025-05-03 13:51:57'),
(49, 'pickled onion', 'sides', NULL, 0.90, NULL, '2025-05-03 14:01:20'),
(50, 'bread roll', 'sides', NULL, 1.30, NULL, '2025-05-03 14:02:14'),
(51, 'can drink', 'sides', NULL, 1.60, NULL, '2025-05-03 14:10:16'),
(52, 'chip butty', 'sides', NULL, 3.90, NULL, '2025-05-03 14:10:16'),
(53, 'mozzarella sticks (6pcs)', 'sides', NULL, 4.95, NULL, '2025-05-03 14:10:16'),
(54, 'sachets of sauce (ketchup, mayo, tartar)', 'sides', NULL, 0.40, NULL, '2025-05-03 14:10:16'),
(55, 'pots of sauce (burger, mayonnaise)', 'sides', NULL, 2.00, NULL, '2025-05-03 14:10:16'),
(56, 'chips', 'fish', NULL, 3.50, 4.75, '2025-05-03 15:06:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
