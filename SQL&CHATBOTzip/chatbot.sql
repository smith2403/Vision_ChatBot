-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 05:50 PM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_order_item` (IN `p_food_item` VARCHAR(255), IN `p_quantity` INT, IN `p_order_id` INT)   BEGIN
    DECLARE v_item_id INT;
    DECLARE v_price DECIMAL(10, 2);
    DECLARE v_total_price DECIMAL(10, 2);

    SET v_item_id = (SELECT item_id FROM fooditems WHERE name = p_food_item);
    SET v_price = (SELECT get_price_for_item(p_food_item));
    SET v_total_price = v_price * p_quantity;

    INSERT INTO orders (order_id, item_id, quantity, total_price)
    VALUES (p_order_id, v_item_id, p_quantity, v_total_price);
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_price_for_item` (`p_item_name` VARCHAR(255)) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN
    DECLARE v_price DECIMAL(10, 2);
    IF (SELECT COUNT(*) FROM fooditems WHERE name = p_item_name) > 0 THEN
        SELECT price INTO v_price
        FROM fooditems
        WHERE name = p_item_name;
        
        RETURN v_price;
    ELSE
        RETURN -1;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_order_price` (`p_order_id` INT) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN
    DECLARE v_total_price DECIMAL(10, 2);
    IF (SELECT COUNT(*) FROM orders WHERE order_id = p_order_id) > 0 THEN
        SELECT SUM(total_price) INTO v_total_price
        FROM orders
        WHERE order_id = p_order_id;
        
        RETURN v_total_price;
    ELSE
        RETURN -1;
    END IF;
END$$

DELIMITER ;

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
(1, 'Burger', 250.49),
(2, 'Pizza', 200.00),
(3, 'Salad', 120.00),
(4, 'Pasta', 150.00),
(5, 'Vada Pav', 15.00),
(6, 'Coke', 50.25),
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
(49, 7, 5, 100.00),
(50, 2, 3, 600.00),
(51, 6, 1, 50.00),
(52, 5, 1, 15.00),
(53, 2, 1, 200.00),
(54, 6, 1, 50.00),
(55, 2, 1, 200.00),
(55, 9, 1, 80.00),
(56, 6, 1, 50.00),
(56, 27, 2, 140.00),
(57, 6, 1, 50.00),
(58, 1, 1, 250.00),
(59, 1, 5, 1250.00),
(59, 6, 2, 100.00),
(60, 1, 5, 1252.45),
(60, 2, 5, 1000.00),
(61, 6, 10, 502.50),
(62, 2, 10, 2000.00);

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
(48, 'delivered', 'paid', 300.00),
(49, 'in progress', 'Cash on delivery', 1950.00),
(50, 'in progress', 'Cash on delivery', 600.00),
(51, 'in progress', 'Cash on delivery', 50.00),
(52, 'in progress', 'Cash on delivery', 15.00),
(53, 'in progress', 'Cash on delivery', 200.00),
(54, 'in progress', 'Cash on delivery', 50.00),
(55, 'in progress', 'Cash on delivery', 280.00),
(56, 'delivered', 'paid', 190.00),
(57, 'in progress', 'Cash on delivery', 50.00),
(58, 'delivered', 'paid', 250.00),
(59, 'delivered', 'paid', 1350.87),
(60, 'in progress', 'Cash on delivery', 2252.45),
(61, 'in progress', 'Cash on delivery', 502.50),
(62, 'in progress', 'Cash on delivery', 2000.00);

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
(48, 'Suman', 'suman.sharma31@gmail.com', 'Thane', 'Suman678'),
(49, 'smith', 'iamsmith1103@gmail.com', 'mumbai', 'smith'),
(50, 'Smith', 'iamsmith1103@gmail.com', 'sfsfsfsa', 'Ywy5%G(v(9ZBG!K'),
(51, 'Smith', 'iamsmith1103@gmail.com', 'fsdfadf', 'Ywy5%G(v(9ZBG!K'),
(52, 'Smith', 'iamsmith1103@gmail.com', 'fsdfadf', 'Ywy5%G(v(9ZBG!K'),
(53, 'Smith', 'iamsmith1103@gmail.com', 'mumbai', 'Ywy5%G(v(9ZBG!K'),
(54, 'smith24', 'iamsmith1103@gmail.com', 'mumbai', 'smithkinny'),
(55, 'random', 'iamsmith1103@gmail.com', 'mumbai', 'random'),
(56, 'stanger', 'iamsmith1103@gmail.com', 'mumbai', 'stranger'),
(57, 'Smith', 'iamsmith1103@gmail.com', 'sdsds', 'smith'),
(58, 'samay', 'deathr144@gmail.com', 'sdsds', 'samay'),
(59, 'kent', 'iamsmith1103@gmail.com', 'mumbai', 'kent');

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
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `fooditems` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
