-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2020 at 12:11 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pop`
--

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(30) NOT NULL,
  `order_id` varchar(30) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `supplier_name` varchar(30) NOT NULL,
  `purchase_date` varchar(30) NOT NULL,
  `purchase_address` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `is_approved` int(30) NOT NULL,
  `is_reject` int(30) NOT NULL,
  `is_waiting` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `order_id`, `supplier_id`, `supplier_name`, `purchase_date`, `purchase_address`, `contact`, `email`, `is_approved`, `is_reject`, `is_waiting`) VALUES
(7, '255894057', 1, 'ABC', '2020-10-31', 'parramata', '9595956965', 'abc@gmail.com', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Id` int(11) NOT NULL,
  `account` int(30) NOT NULL,
  `code` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `process_order`
--

CREATE TABLE `process_order` (
  `id` int(30) NOT NULL,
  `order_id` varchar(30) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `item` varchar(30) NOT NULL,
  `price` int(30) NOT NULL,
  `total` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `process_order`
--

INSERT INTO `process_order` (`id`, `order_id`, `supplier_id`, `quantity`, `item`, `price`, `total`) VALUES
(64, '687240563', 2, 2, 'Hanging Lights', 23, 46),
(65, '687240563', 2, 4, 'Close-To-Ceiling Lights', 14, 56),
(66, '1065607563', 2, 4, 'Hanging Lights', 6, 24),
(67, '1065607563', 2, 3, 'Close-To-Ceiling Lights', 1, 3),
(68, '1890670789', 2, 1, 'Hanging Lights', 1, 1),
(69, '1890670789', 2, 1, 'Close-To-Ceiling Lights', 1, 1),
(70, '1553794711', 2, 2, 'Hanging Lights', 2, 4),
(71, '1553794711', 2, 4, 'Close-To-Ceiling Lights', 6, 24),
(72, '412317496', 1, 1, 'Pendant Lights', 1, 1),
(73, '412317496', 1, 1, 'Cluster Lights', 1, 1),
(74, '686153216', 1, 5, 'Pendant Lights', 5, 25),
(75, '686153216', 1, 2, 'Cluster Lights', 5, 10),
(76, '2020613021', 2, 52, 'Hanging Lights', 42, 2184),
(77, '2020613021', 2, 122, 'Close-To-Ceiling Lights', 2, 244),
(78, '1252822390', 1, 543, 'Pendant Lights', 42, 22806),
(79, '1252822390', 1, 54, 'Cluster Lights', 42, 2268),
(80, '725214442', 2, 42, 'Hanging Lights', 2, 84),
(81, '725214442', 2, 4, 'Close-To-Ceiling Lights', 42, 168),
(82, '255894057', 1, 4, 'Pendant Lights', 4, 16),
(83, '255894057', 1, 2, 'Cluster Lights', 24, 48);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `SupplierId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `title`, `SupplierId`) VALUES
(1, 'Pendant Lights', 1),
(2, 'Cluster Lights', 1),
(3, 'Hanging Lights', 2),
(4, 'Close-To-Ceiling Lights', 2),
(5, 'Chandeiers', 3),
(6, 'kid Lamps', 3),
(7, 'Wall & Desk Lamps', 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `Id` int(11) NOT NULL,
  `P_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `unit` int(30) NOT NULL,
  `productId` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(30) NOT NULL,
  `order_id` varchar(30) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `supplier_name` varchar(30) NOT NULL,
  `purchase_date` varchar(30) NOT NULL,
  `purchase_address` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `is_approved` int(30) NOT NULL,
  `is_reject` int(30) NOT NULL,
  `is_waiting` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`id`, `order_id`, `supplier_id`, `supplier_name`, `purchase_date`, `purchase_address`, `contact`, `email`, `is_approved`, `is_reject`, `is_waiting`) VALUES
(36, '687240563', 2, 'xyz', '2020-10-11', 'auburn', '8888882332', 'xyz@mail.com', 1, 0, 0),
(37, '1065607563', 2, 'xyz', '2020-10-15', 'auburn', '8888882332', 'xyz@mail.com', 0, 1, 0),
(38, '1890670789', 2, 'xyz', '2020-10-17', 'auburn', '8888882332', 'xyz@mail.com', 0, 1, 0),
(39, '686153216', 1, 'ABC', '2020-10-17', 'parramata', '9595956965', 'abc@gmail.com', 0, 0, 1),
(40, '2020613021', 2, 'xyz', '2020-10-01', 'auburn', '8888882332', 'xyz@mail.com', 0, 0, 1),
(41, '2020613021', 2, 'xyz', '2020-10-01', 'auburn', '8888882332', 'xyz@mail.com', 0, 0, 1),
(42, '2020613021', 2, 'xyz', '2020-10-01', 'auburn', '8888882332', 'xyz@mail.com', 0, 0, 1),
(43, '1252822390', 1, 'ABC', '2020-10-15', 'parramata', '9595956965', 'abc@gmail.com', 0, 0, 1),
(44, '725214442', 2, 'xyz', '2020-10-07', 'auburn', '8888882332', 'xyz@mail.com', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `Id` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `email` varchar(15) NOT NULL,
  `contact` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Id`, `name`, `address`, `email`, `contact`) VALUES
(1, 'ABC', 'parramata', 'abc@gmail.com', '9595956965'),
(2, 'xyz', 'auburn', 'xyz@mail.com', '8888882332'),
(3, 'prb', 'strathfield', 'prb@gmail.com', '9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `profile`, `image`) VALUES
(1, 'Pradip Rajbhandari', 'Admin', '$2y$07$xdfN4i29zUiuyL/y7iIMCehCMhqOEGe7eHFJeEuYuFMAisKgHJG5e', 'Admin', '1.jpg'),
(2, 'jiban', 'jiban@fed.edu.au', '$2y$12$P/5Y4FbMNQPaZCasv7SJI.egmPCu3ZA4K3jGpTotf52MnlsiSGuFW', 'user', '2.jpg'),
(3, 'llena', 'llena@fed.edu.au', '$2y$12$RP1TNjsmaZ8sbGqJ2d3LDutLw75F2N30Y/JX2ypJTm/cM6A38ybnC', 'my profile', '3.jpg'),
(4, 'Neha', 'Neha@fed.edu.au', '$2y$12$2HY1M5.3PqqXgWTGZOPPr.JJH2eCjCezMDGOXD7EpVIt3WZDNLQvK', 'myprofile', '4.jpg'),
(5, 'tutor', 'alu@fed.edu.au', '$2y$12$g8lYzuAdE9/mV7KmJ65L9Ob0/LMOHl.Cp/Ymy7ti52b0n71O6LgLy', 'my profile', '5.jpsg'),
(7, 'Sid', 'laighesiddhat@gmail.com', '$2y$12$jXmvrwdWTFZ23AeJwJpEFubwUuhwN14CB7KAXGL7b77/OJV1lnSOG', 'sid', '67e9c21a-0c8c-4ad9-a25b-1f60060e6c8c.jpg'),
(8, 'akshay', 'laigheakk@gmail.com', '$2y$12$BuYeB/1bdkNGT5IYTBbY5OZUCpKDQZ1eQ9o6.K15E87cgDJ8fORrq', '', NULL),
(9, 'avni', 'avni@gmail.com', '$2y$12$qTPozQgmaSFsAlSAYY7bS.7ldJoRipjfXO/I2Vl6taa7yI8L/v2aO', NULL, NULL),
(10, 'demo', 'rimmy@gmail.com', '$2y$12$t3AVZj40Tl0MCPfnsVq21.AwZJ9x3rjrvHAN8/MgVsIRsvCgvm8z.', 'pradip_profile', 'm.jpeg'),
(11, 'Siddhu', 'siddhu@gmail.com', '$2y$12$ac4GB/eW4yF6/jDJ.ukUiuUNgHNhMTjNfins7EdxZI93AZS9BIEeq', 'User', NULL),
(12, 'SidAdmin', 'admin@gmail.com', '$2y$12$ac4GB/eW4yF6/jDJ.ukUiuUNgHNhMTjNfins7EdxZI93AZS9BIEeq', 'Admin', NULL),
(13, 'siddhant1', 'siddhant12', '$2y$12$cLoJFrsSvY7GVKkRLkvizuEezC2QDlo1YwK.KGG5wamV8oF2XGeUm', 'User', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `process_order`
--
ALTER TABLE `process_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `SupplierId` (`SupplierId`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `process_order`
--
ALTER TABLE `process_order`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`SupplierId`) REFERENCES `supplier` (`Id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
