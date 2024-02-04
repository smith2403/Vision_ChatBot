-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 09:14 PM
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

    -- Get the item_id and price for the food item
    SET v_item_id = (SELECT item_id FROM fooditems WHERE name = p_food_item);
    SET v_price = (SELECT get_price_for_item(p_food_item));

    -- Calculate the total price for the order item
    SET v_total_price = v_price * p_quantity;

    -- Insert the order item into the orders table
    INSERT INTO orders (order_id, item_id, quantity, total_price)
    VALUES (p_order_id, v_item_id, p_quantity, v_total_price);
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_price_for_item` (`p_item_name` VARCHAR(255)) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN
    DECLARE v_price DECIMAL(10, 2);
    
    -- Check if the item_name exists in the food_items table
    IF (SELECT COUNT(*) FROM fooditems WHERE name = p_item_name) > 0 THEN
        -- Retrieve the price for the item
        SELECT price INTO v_price
        FROM fooditems
        WHERE name = p_item_name;
        
        RETURN v_price;
    ELSE
        -- Invalid item_name, return -1
        RETURN -1;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_order_price` (`p_order_id` INT) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN
    DECLARE v_total_price DECIMAL(10, 2);
    
    -- Check if the order_id exists in the orders table
    IF (SELECT COUNT(*) FROM orders WHERE order_id = p_order_id) > 0 THEN
        -- Calculate the total price
        SELECT SUM(total_price) INTO v_total_price
        FROM orders
        WHERE order_id = p_order_id;
        
        RETURN v_total_price;
    ELSE
        -- Invalid order_id, return -1
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
(1, 'Burger', 399.99),
(2, 'Pizza', 564.49),
(3, 'Salad', 259.99),
(4, 'Pasta', 459.99),
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
(33, 'Mango Lassi', 30.00),
(34, 'Fruit Salad', 60.00),
(35, 'Rasgulla', 35.00),
(36, 'Kheer', 50.00),
(37, 'Cheesecake', 120.00),
(38, 'Brownie Sundae', 100.00),
(39, 'Pista Kulfi', 40.00);

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
(1, 21, 2, 30.00);

-- --------------------------------------------------------

--
-- Table structure for table `ordertracking`
--

CREATE TABLE `ordertracking` (
  `order_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordertracking`
--

INSERT INTO `ordertracking` (`order_id`, `status`) VALUES
(1, 'in progress');

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
