-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2024 at 07:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--
CREATE DATABASE IF NOT EXISTS `chatbot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `chatbot`;

-- --------------------------------------------------------

--
-- Table structure for table `fooditems`
--

CREATE TABLE `fooditems` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fooditems`
--

INSERT INTO `fooditems` (`item_id`, `name`, `price`) VALUES
(1, 'Burger', 250.00),
(2, 'Pizza', 200.00),
(3, 'Salad', 120.00),
(4, 'Pasta', 150.00),
(5, 'Vada Pav', 15.00),
(6, 'Coke', 50.00),
(7, 'Lassi', 20.00),
(8, 'Mango Shake', 80.00),
(9, 'Chocolate Shake', 80.00),
(10, 'Vanilla Ice Cream', 50.00),
(11, 'Strawberry Ice Cream', 50.00),
(12, 'Chicken Biryani', 200.00),
(13, 'Paneer Tikka', 150.00),
(14, 'Butter Chicken', 220.00),
(15, 'Aloo Gobi', 120.00),
(16, 'Chole Bhature', 100.00),
(17, 'Palak Paneer', 180.00),
(18, 'Dosa', 70.00),
(19, 'Idli Sambhar', 60.00),
(20, 'Rajma Chawal', 130.00),
(21, 'Samosa', 15.00),
(22, 'Masala Dosa', 80.00),
(23, 'Bhindi Masala', 90.00),
(24, 'Tandoori Roti', 15.00),
(25, 'Malai Kofta', 200.00),
(26, 'Kadai Chicken', 180.00),
(27, 'Pav Bhaji', 70.00),
(28, 'Fish Curry', 250.00),
(29, 'Aloo Paratha', 60.00),
(30, 'Gulab Jamun', 40.00),
(31, 'Chai', 15.00),
(32, 'Coffee', 25.00),
(34, 'Fruit Salad', 60.00),
(35, 'Rasgulla', 35.00),
(36, 'Kheer', 50.00),
(37, 'Cheesecake', 120.00),
(38, 'Brownie Sundae', 100.00),
(39, 'Pista Kulfi', 40.00),
(40, 'Tacos', 250.00),
(41, 'Burritos', 200.00),
(42, 'Salsa and Chips', 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `item_id`, `quantity`, `total_price`) VALUES
(1, 5, 1, 15.00),
(1, 21, 2, 30.00),
(2, 6, 1, 50.00),
(2, 10, 2, 100.00),
(3, 2, 1, 564.49),
(3, 6, 1, 50.00),
(3, 21, 2, 30.00),
(4, 2, 1, 564.49),
(4, 7, 2, 40.00),
(5, 1, 1, 399.99),
(5, 6, 2, 100.00),
(5, 10, 1, 50.00),
(6, 6, 2, 100.00),
(7, 1, 2, 799.98),
(7, 6, 1, 50.00),
(8, 27, 5, 350.00),
(9, 2, 5, 2822.45),
(10, 1, 1, 399.99),
(10, 2, 2, 1128.98),
(10, 7, 3, 60.00),
(11, 7, 4, 80.00),
(12, 1, 1, 399.99),
(13, 1, 1, 399.99),
(14, 1, 1, 399.99),
(15, 1, 1, 399.99),
(16, 1, 1, 399.99),
(17, 1, 1, 399.99),
(18, 6, 1, 50.00),
(19, 1, 1, 399.99),
(20, 1, 1, 399.99),
(21, 6, 2, 100.00),
(22, 2, 1, 564.49),
(22, 6, 1, 50.00),
(23, 1, 2, 799.98),
(23, 2, 1, 564.49),
(23, 6, 1, 50.00),
(23, 7, 1, 20.00),
(24, 1, 2, 799.98),
(24, 2, 1, 564.49),
(24, 6, 1, 50.00),
(24, 7, 1, 20.00),
(25, 1, 2, 799.98),
(25, 2, 2, 1128.98),
(25, 6, 1, 50.00),
(26, 1, 3, 750.00),
(26, 2, 2, 400.00),
(26, 6, 1, 50.00),
(27, 1, 3, 750.00),
(27, 2, 2, 400.00),
(28, 1, 5, 1250.00),
(28, 2, 5, 1000.00),
(29, 1, 5, 1250.00),
(29, 2, 5, 1000.00),
(29, 6, 1, 50.00),
(30, 1, 3, 750.00),
(30, 2, 2, 400.00),
(30, 6, 1, 50.00),
(31, 1, 5, 1250.00),
(31, 2, 2, 400.00),
(31, 6, 1, 50.00),
(32, 1, 1, 250.00),
(32, 6, 2, 100.00),
(33, 1, 1, 250.00),
(33, 2, 5, 1000.00),
(33, 6, 1, 50.00),
(34, 1, 1, 250.00),
(34, 2, 5, 1000.00),
(34, 6, 1, 50.00),
(35, 2, 5, 1000.00),
(35, 6, 1, 50.00),
(36, 2, 5, 1000.00),
(36, 6, 1, 50.00),
(37, 6, 1, 50.00),
(38, 6, 1, 50.00),
(39, 6, 1, 50.00),
(40, 6, 1, 50.00),
(41, 6, 1, 50.00),
(42, 6, 1, 50.00),
(43, 6, 1, 50.00),
(44, 6, 1, 50.00),
(45, 2, 5, 1000.00),
(45, 6, 1, 50.00),
(46, 1, 5, 1250.00),
(46, 2, 5, 1000.00),
(47, 1, 1, 250.00),
(48, 7, 5, 100.00),
(48, 16, 2, 200.00),
(49, 1, 1, 250.00),
(49, 2, 8, 1600.00),
(49, 7, 5, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `ordertracking`
--

CREATE TABLE `ordertracking` (
  `order_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `payment` varchar(100) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordertracking`
--

INSERT INTO `ordertracking` (`order_id`, `status`, `payment`, `total_price`) VALUES
(48, 'in progress', 'paid', 300.00),
(49, 'in progress', 'Cash on delivery', 1950.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `address`, `password`) VALUES
(1, 'Smith', 'iamsmith1103@gmail.com', 'Mumbai', 'Ywy5%G(v(9ZBG!K'),
(2, 'Smith', 'iamsmith1103@gmail.com', 'Mumbai', 'smith123'),
(3, 'Ramesh', 'ramesh.yadav1@gmail.com', 'Nagpur', 'Ram123'),
(4, 'Aarti', 'aarti.sharma2@gmail.com', 'Mumbai', 'Aarti456'),
(5, 'Sunil', 'sunil.kumar3@gmail.com', 'Delhi', 'Sunil789'),
(6, 'Puja', 'puja.verma4@gmail.com', 'Bangalore', 'Puja012'),
(7, 'Vikram', 'vikram.singh5@gmail.com', 'Chennai', 'Vikram345'),
(8, 'Anita', 'anita.gupta6@gmail.com', 'Kolkata', 'Anita678'),
(9, 'Rajesh', 'rajesh.patel7@gmail.com', 'Ahmedabad', 'Rajesh901'),
(10, 'Neeta', 'neeta.jain8@gmail.com', 'Hyderabad', 'Neeta234'),
(11, 'Mohan', 'mohan.shah9@gmail.com', 'Chandigarh', 'Mohan567'),
(12, 'Sakshi', 'sakshi.kapoor10@gmail.com', 'Jaipur', 'Sakshi890'),
(13, 'Amit', 'amit.singh11@gmail.com', 'Pune', 'Amit123'),
(14, 'Sneha', 'sneha.gupta12@gmail.com', 'Lucknow', 'Sneha456'),
(15, 'Pradeep', 'pradeep.sharma13@gmail.com', 'Surat', 'Pradeep789'),
(16, 'Kavita', 'kavita.verma14@gmail.com', 'Indore', 'Kavita012'),
(17, 'Rahul', 'rahul.kumar15@gmail.com', 'Bhopal', 'Rahul345'),
(18, 'Pooja', 'pooja.shah16@gmail.com', 'Kanpur', 'Pooja678'),
(19, 'Ravi', 'ravi.patel17@gmail.com', 'Nashik', 'Ravi901'),
(20, 'Neha', 'neha.jain18@gmail.com', 'Agra', 'Neha234'),
(21, 'Vijay', 'vijay.sharma19@gmail.com', 'Patna', 'Vijay567'),
(22, 'Sarika', 'sarika.kapoor20@gmail.com', 'Ranchi', 'Sarika890'),
(23, 'Ajay', 'ajay.yadav21@gmail.com', 'Vadodara', 'Ajay123'),
(24, 'Priya', 'priya.singh22@gmail.com', 'Coimbatore', 'Priya456'),
(25, 'Rohit', 'rohit.verma23@gmail.com', 'Visakhapatnam', 'Rohit789'),
(26, 'Divya', 'divya.gupta24@gmail.com', 'Thiruvananthapuram', 'Divya012'),
(27, 'Arun', 'arun.kumar25@gmail.com', 'Guwahati', 'Arun345'),
(28, 'Shreya', 'shreya.sharma26@gmail.com', 'Noida', 'Shreya123'),
(29, 'Rajat', 'rajat.yadav27@gmail.com', 'Kochi', 'Rajat456'),
(30, 'Anjali', 'anjali.verma28@gmail.com', 'Varanasi', 'Anjali789'),
(31, 'Santosh', 'santosh.kumar29@gmail.com', 'Patiala', 'Santosh012'),
(32, 'Meera', 'meera.singh30@gmail.com', 'Amritsar', 'Meera345'),
(33, 'Kunal', 'kunal.shah31@gmail.com', 'Ajmer', 'Kunal678'),
(34, 'Ritu', 'ritu.gupta32@gmail.com', 'Raipur', 'Ritu901'),
(35, 'Sushant', 'sushant.patel33@gmail.com', 'Jabalpur', 'Sushant234'),
(36, 'Ananya', 'ananya.jain34@gmail.com', 'Shillong', 'Ananya567'),
(37, 'Vivek', 'vivek.sharma35@gmail.com', 'Gangtok', 'Vivek890'),
(38, 'Ayesha', 'ayesha.kapoor36@gmail.com', 'Agartala', 'Ayesha123'),
(39, 'Rahul', 'rahul.singh37@gmail.com', 'Itanagar', 'Rahul456'),
(40, 'Nidhi', 'nidhi.verma38@gmail.com', 'Kohima', 'Nidhi789'),
(41, 'Alok', 'alok.kumar39@gmail.com', 'Imphal', 'Alok012'),
(42, 'Simran', 'simran.gupta40@gmail.com', 'Aizawl', 'Simran345'),
(43, 'Nitin', 'nitin.shah26@gmail.com', 'Ahmednagar', 'Nitin123'),
(44, 'Swati', 'swati.yadav27@gmail.com', 'Noida', 'Swati456'),
(45, 'Rajat', 'rajat.kumar28@gmail.com', 'Kochi', 'Rajat789'),
(46, 'Anjali', 'anjali.gupta29@gmail.com', 'Raipur', 'Anjali012'),
(47, 'Deepak', 'deepak.singh30@gmail.com', 'Varanasi', 'Deepak345'),
(48, 'Suman', 'suman.sharma31@gmail.com', 'Thane', 'Suman678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fooditems`
--
ALTER TABLE `fooditems`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`,`item_id`),
  ADD KEY `orders_ibfk_1` (`item_id`);

--
-- Indexes for table `ordertracking`
--
ALTER TABLE `ordertracking`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fooditems`
--
ALTER TABLE `fooditems`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `ordertracking`
--
ALTER TABLE `ordertracking`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `fooditems` (`item_id`);
--
-- Database: `dentcare`
--
CREATE DATABASE IF NOT EXISTS `dentcare` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dentcare`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'smith', 'smith');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `service` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `service`, `name`, `email`, `date`, `time`) VALUES
(5, 'Orthodontic treatments', 'ssss', 'sss@gmail.com', '2024-01-04', '12:20:00'),
(7, 'Orthodontic treatments', 'ssss', 'sss@gmail.com', '2024-01-04', '12:20:00'),
(9, 'Orthodontic treatments', 'ssss', 'sss@gmail.com', '2024-01-20', '12:20:00'),
(11, 'Orthodontic treatments', 'ssss', 'sss@gmail.com', '2024-01-20', '12:20:00'),
(12, 'Orthodontic treatments', 'ssss', 'sss@gmail.com', '2024-01-20', '12:20:00'),
(13, 'Select A Service', '', '', '0000-00-00', '00:00:00'),
(14, 'Dental implants', 'tftftftft', 'sss@Gmail.com', '2024-01-26', '10:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`) VALUES
(5, 'ssss', 'smithkinny2003@gmail.com', 123456789, 'sadfdsfsdagas'),
(6, 'ssss', 'smithkinny2003@gmail.com', 123456789, 'sadfdsfsdagas'),
(7, 'ssss', 'deathr144@gmail.com', 123456789, 'sadfdsfsdagas'),
(8, 'ssss', 'deathr144@gmail.com', 123456789, 'sadfdsfsdagas'),
(9, 'ssss', 'deathr144@gmail.com', 123456789, 'sadfdsfsdagas'),
(10, 'ssss', 'smithkinny2003@gmail.com', 123456789, 'qwerty'),
(11, 'Samay', 'snowvelsoares8@gmail.com', 9967342559, 'Hello bade!!!! How are you!? I hope this email reaches out to you! I love you :P'),
(12, 'Smith', 'iamsmith1103@gmail.com', 9999999999, 'Hello Smith!'),
(13, 'Samay', 'iamsmith1103@gmail.com', 2222222222, 'qwerty'),
(14, 'Smith', 'iamsmith1103@gmail.com', 1234567890, 'qwerty'),
(15, 'Smith', 'deathr144@gmail.com', 1234567890, 'qwe'),
(16, 'Snowvel', 'snowvelsoares8@gmail.com', 9967342559, 'Hello I hope this message reaches to you in proper format. Cheez Chineez Toast.\nYours Sincere, Chhote'),
(17, 'smith', 'iamsmith1103@gmail.com', 9365223458, 'hello! i am a freelancer. I create Softwares Appk'),
(18, 'Fareen', 'kfareen1911@gmail.com', 1234567890, 'Hello Namaste');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `pandeyji_eatery`
--
CREATE DATABASE IF NOT EXISTS `pandeyji_eatery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pandeyji_eatery`;

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`item_id`, `name`, `price`) VALUES
(1, 'Pav Bhaji', 6.00),
(2, 'Chole Bhature', 7.00),
(3, 'Pizza', 8.00),
(4, 'Mango Lassi', 5.00),
(5, 'Masala Dosa', 6.00),
(6, 'Vegetable Biryani', 9.00),
(7, 'Vada Pav', 4.00),
(8, 'Rava Dosa', 7.00),
(9, 'Samosa', 5.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `item_id`, `quantity`, `total_price`) VALUES
(40, 1, 2, 12.00),
(40, 3, 1, 8.00),
(41, 4, 3, 15.00),
(41, 6, 2, 18.00),
(41, 9, 4, 20.00),
(42, 9, 2, 10.00),
(43, 9, 2, 10.00),
(44, 9, 2, 10.00),
(45, 9, 2, 10.00),
(46, 4, 1, 5.00),
(46, 9, 2, 10.00),
(47, 4, 1, 5.00),
(47, 9, 2, 10.00),
(48, 4, 1, 5.00),
(48, 7, 5, 20.00),
(48, 9, 2, 10.00),
(49, 3, 1, 8.00),
(49, 7, 1, 4.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `order_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_tracking`
--

INSERT INTO `order_tracking` (`order_id`, `status`) VALUES
(40, 'delivered'),
(41, 'in transit'),
(42, 'in progress'),
(43, 'in progress'),
(44, 'in progress'),
(45, 'in progress'),
(46, 'in progress'),
(47, 'in progress'),
(48, 'in progress'),
(49, 'in progress');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`,`item_id`),
  ADD KEY `orders_ibfk_1` (`item_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `food_items` (`item_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"chatbot\",\"table\":\"ordertracking\"},{\"db\":\"chatbot\",\"table\":\"orders\"},{\"db\":\"chatbot\",\"table\":\"fooditems\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-03-06 20:10:51', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":246}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `smithdb`
--
CREATE DATABASE IF NOT EXISTS `smithdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `smithdb`;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `mrp` int(11) NOT NULL,
  `offerprice` int(11) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `mrp`, `offerprice`, `img`) VALUES
(2, 'bgbgtb', 'fdfdg', 4234, 34234, '1smitj.png'),
(3, 'Smith', 'Smith', 86858756, 11111111, 'blursmith.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`) VALUES
(4, 'daylight', 'drifttt@gmail.com', 'daylight', 'pass123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
