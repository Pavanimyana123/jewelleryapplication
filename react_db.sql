-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2024 at 10:08 AM
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
-- Database: `react_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountgroup`
--

CREATE TABLE `accountgroup` (
  `accountgroup_id` int(11) NOT NULL,
  `AccountsGroupName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accountgroup`
--

INSERT INTO `accountgroup` (`accountgroup_id`, `AccountsGroupName`) VALUES
(1, 'Capital Account'),
(2, 'Current Assets'),
(3, 'Current Liabilities'),
(4, 'Fixed Assets'),
(5, 'Investments'),
(6, 'Loans (Liability)'),
(7, 'Pre-Operative Expenses'),
(8, 'Profit & Loss'),
(9, 'Revenue Accounts'),
(10, 'Suspense Account'),
(11, 'Cash-in-hand'),
(12, 'Bank Accounts'),
(13, 'Securities & Deposits (Asset)'),
(14, 'Loans & Advances (Asset)'),
(15, 'Stock-in-hand'),
(16, 'Sundry Debtors'),
(17, 'Sundry Creditors'),
(18, 'Duties & Taxes'),
(19, 'Provisions/Expenses Payable'),
(20, 'Secured Loans'),
(21, 'Unsecured Loans'),
(22, 'Purchase'),
(23, 'Sale'),
(24, 'Expenses (Direct/Mfg.)'),
(25, 'Expenses (Indirect/Admn.)'),
(26, 'Income (Direct/Opr.)'),
(27, 'Income (Indirect)'),
(28, 'Bank O/D Account'),
(29, 'Reserves & Surplus'),
(30, 'SELF STOCK'),
(31, 'Broker'),
(32, 'CUSTOMERS'),
(33, 'SUPPLIERS');

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `print_name` varchar(255) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `op_bal` decimal(10,2) DEFAULT NULL,
  `dr_cr` enum('DR','CR') DEFAULT NULL,
  `metal_balance` decimal(10,2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthday_on` date DEFAULT NULL,
  `anniversary_on` date DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `bank_account_no` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `account_name`, `print_name`, `group`, `op_bal`, `dr_cr`, `metal_balance`, `address`, `address2`, `city`, `area`, `pincode`, `state`, `state_code`, `phone`, `mobile`, `contact_person`, `email`, `birthday_on`, `anniversary_on`, `branch`, `bank_account_no`, `bank_name`, `ifsc_code`) VALUES
(5, 'Pavani', 'M Pavani', 'Capital Ac', 5000.00, 'DR', 10000.00, 'h-no 5-47/2/d Chandrampet sircilla', 'Chandrampet', 'Rajanna Sircilla', 'Area1', '505301', 'Telangana', 'India', '9676704365', '9874563214', 'Pavani', 'pavanimyana2000@gmail.com', '2024-12-14', '2024-12-27', 'Sircilla', '1234556789', 'SBI', 'Aawsdecs'),
(10, 'John Doe', 'J. Doe', 'Capital Ac', 5000.00, 'DR', 0.00, '123 Main Street', 'Apt 4B', 'Metropolis', 'Downtown', '123456', 'StateName', 'ST', '9876543210', '9876543210', 'Jane Smith', 'john.doe@example.com', '1985-05-19', '2010-06-14', 'Main Branch', '123456789012', 'Bank Name', 'IFSC0001234'),
(11, 'John Doe', 'J. Doe', 'Capital Ac', 5000.00, 'DR', 0.00, '123 Main Street', 'Apt 4B', 'Metropolis', 'Downtown', '123456', 'StateName', 'ST', '9876543210', '963258741', 'Jane Smith', 'john.doe@example.com', '1985-05-19', '2010-06-14', 'Main Branch', '123456789012', 'Bank Name', 'IFSC0001234');

-- --------------------------------------------------------

--
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `print_name` varchar(255) DEFAULT NULL,
  `account_group` varchar(255) DEFAULT NULL,
  `op_bal` decimal(15,2) DEFAULT NULL,
  `metal_balance` decimal(15,2) DEFAULT NULL,
  `dr_cr` enum('Dr','Cr') DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `anniversary` date DEFAULT NULL,
  `bank_account_no` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `gst_in` varchar(15) DEFAULT NULL,
  `aadhar_card` varchar(12) DEFAULT NULL,
  `pan_card` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_details`
--

INSERT INTO `account_details` (`account_id`, `account_name`, `print_name`, `account_group`, `op_bal`, `metal_balance`, `dr_cr`, `address1`, `address2`, `city`, `pincode`, `state`, `state_code`, `phone`, `mobile`, `contact_person`, `email`, `birthday`, `anniversary`, `bank_account_no`, `bank_name`, `ifsc_code`, `branch`, `gst_in`, `aadhar_card`, `pan_card`, `created_at`) VALUES
(2, 'John Doe', 'John D.', 'CUSTOMERS', 1500.50, 10.25, 'Dr', '123 Main Street', 'Suite 101', 'New York', '10001', 'New York', 'NY01', '1234567890', '9876543210', 'Jane Doe', 'john.doe@example.com', '2024-12-16', '2024-12-16', '123456789012', 'XYZ Bank', 'XYZB1234567', 'Main Branch', '22AAAAA0000A1Z5', '123456789012', 'ABCDE1234F', '2024-12-22 09:04:30'),
(7, 'Pavani', 'Pavani', 'CUSTOMERS', 10000.00, 2000.00, 'Dr', 'h-no 5-47/2/d Chandrampet sircilla', 'Chandrampet', 'Rajanna Sircilla', '505301', 'Telangana', '21', '9676704365', '9676704365', NULL, 'pavanimyana2000@gmail.com', '2024-12-14', '2024-12-14', '1234567890123456', 'XYZ Bank', 'BOFA0001234', 'Los Angeles', '123456789012345', '123456789012', 'ABCDE1234F', '2024-12-22 09:04:30'),
(9, 'Bhargav', 'Bhargav', 'CUSTOMERS', NULL, NULL, NULL, '5-47', 'Sircilla', 'Sircilla', '505301', 'Telangana', '24', '09676704365', '9856321478', NULL, 'bhargav@gmail.com', '2024-12-18', '2024-12-18', '1234567890123456', 'XYZ Bank', 'BOFA0001234', 'Main Branch', '123456789012345', '123412341234', 'ABCDE1234F', '2024-12-22 09:04:30'),
(12, 'Raju', 'Raju', 'SUPPLIERS', NULL, NULL, NULL, 'h-no 5-47/2/d Chandrampet sircilla', 'Chandrampet', 'Rajanna Sircilla', '505301', 'Telangana', '24', '852147963', '9856231471', NULL, 'raju@gmail.com', '2004-12-31', '2024-01-31', '1234567890123456', 'SBI', 'XYZB0001234', 'Main Branch', '123456789012345', '123412341234', 'ABCDE1234F', '2024-12-22 09:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `current_rates`
--

CREATE TABLE `current_rates` (
  `current_rates_id` int(11) NOT NULL,
  `rate_date` date NOT NULL,
  `rate_time` time NOT NULL,
  `rate_16crt` decimal(10,2) NOT NULL,
  `rate_18crt` decimal(10,2) NOT NULL,
  `rate_22crt` decimal(10,2) NOT NULL,
  `rate_24crt` decimal(10,2) NOT NULL,
  `silver_rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `current_rates`
--

INSERT INTO `current_rates` (`current_rates_id`, `rate_date`, `rate_time`, `rate_16crt`, `rate_18crt`, `rate_22crt`, `rate_24crt`, `silver_rate`) VALUES
(1, '2024-12-21', '04:18:40', 4773.00, 5809.00, 7100.00, 7745.00, 99.00);

-- --------------------------------------------------------

--
-- Table structure for table `designmaster`
--

CREATE TABLE `designmaster` (
  `design_id` int(11) NOT NULL,
  `metal` varchar(255) NOT NULL,
  `short_id` varchar(50) NOT NULL,
  `item_type` varchar(100) DEFAULT NULL,
  `design_item` varchar(255) DEFAULT NULL,
  `design_name` varchar(255) DEFAULT NULL,
  `wastage_percentage` decimal(5,2) DEFAULT NULL,
  `making_charge` decimal(10,2) DEFAULT NULL,
  `design_short_code` varchar(50) DEFAULT NULL,
  `brand_category` varchar(255) DEFAULT NULL,
  `mc_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designmaster`
--

INSERT INTO `designmaster` (`design_id`, `metal`, `short_id`, `item_type`, `design_item`, `design_name`, `wastage_percentage`, `making_charge`, `design_short_code`, `brand_category`, `mc_type`, `created_at`, `updated_at`) VALUES
(3, 'Gold', 'G253', 'Ring', 'Wedding Ring', 'Elegant Gold Ring', 5.50, 1500.00, 'EGR00005', 'Premium', 'Fixed', '2024-12-04 15:47:18', '2024-12-06 09:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `estimate`
--

CREATE TABLE `estimate` (
  `estimate_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `pcode` varchar(255) DEFAULT NULL,
  `estimate_number` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `gross_weight` decimal(10,2) DEFAULT NULL,
  `stones_weight` decimal(10,2) DEFAULT NULL,
  `stones_price` decimal(10,2) DEFAULT NULL,
  `weight_bw` decimal(10,2) DEFAULT NULL,
  `wastage_on` enum('Gross Weight','Weight WW') DEFAULT NULL,
  `wastage_percent` decimal(5,2) DEFAULT NULL,
  `wastage_weight` decimal(10,2) DEFAULT NULL,
  `total_weight` decimal(10,2) DEFAULT NULL,
  `making_charges_on` enum('By Weight','Fixed') DEFAULT NULL,
  `mc_per_gram` decimal(10,2) DEFAULT NULL,
  `total_mc` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `rate_amt` int(20) DEFAULT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `tax_vat_amount` decimal(10,2) DEFAULT NULL,
  `total_rs` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estimate`
--

INSERT INTO `estimate` (`estimate_id`, `date`, `pcode`, `estimate_number`, `product_id`, `product_name`, `gross_weight`, `stones_weight`, `stones_price`, `weight_bw`, `wastage_on`, `wastage_percent`, `wastage_weight`, `total_weight`, `making_charges_on`, `mc_per_gram`, `total_mc`, `rate`, `rate_amt`, `tax_percent`, `tax_vat_amount`, `total_rs`, `created_at`, `updated_at`) VALUES
(8, '2024-12-19', '', 'EST001', '', 'Braclet', 20.00, 2.00, 2000.00, 18.00, 'Gross Weight', 4.00, 0.80, 18.80, 'By Weight', 100.00, 1880.00, 7135.00, 134138, 3.00, 4024.14, 142042.14, '2024-12-19 12:35:54', '2024-12-19 12:35:54'),
(9, '2024-12-19', '', 'EST001', '', 'Necklace', 20.00, 4.00, 5000.00, 16.00, '', 2.00, 0.32, 16.32, 'By Weight', 153.00, 2496.96, 7500.00, 122400, 3.00, 3672.00, 133568.96, '2024-12-19 12:35:54', '2024-12-19 12:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `metaltype`
--

CREATE TABLE `metaltype` (
  `metal_type_id` int(11) NOT NULL,
  `metal_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `default_purity` decimal(5,2) DEFAULT NULL,
  `default_purity_for_rate_entry` decimal(5,2) DEFAULT NULL,
  `default_purity_for_old_metal` decimal(5,2) DEFAULT NULL,
  `default_issue_purity` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metaltype`
--

INSERT INTO `metaltype` (`metal_type_id`, `metal_name`, `description`, `default_purity`, `default_purity_for_rate_entry`, `default_purity_for_old_metal`, `default_issue_purity`, `created_at`, `updated_at`) VALUES
(2, 'Gold', 'A precious metal widely used in jewelry.', 99.99, 95.00, 99.50, 99.80, '2024-12-04 15:53:19', '2024-12-06 08:01:15'),
(6, 'Silver', 'A soft, white, and lustrous metal with excellent electrical and thermal conductivity', 99.90, 99.50, 99.50, 99.50, '2024-12-18 08:18:58', '2024-12-18 08:18:58'),
(7, 'Platinum', 'A dense, corrosion-resistant precious metal', 95.00, 95.00, 95.00, 95.00, '2024-12-18 08:20:07', '2024-12-18 08:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `opening_tags_entry`
--

CREATE TABLE `opening_tags_entry` (
  `opentag_id` int(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `Pricing` varchar(255) DEFAULT NULL,
  `Tag_ID` varchar(255) DEFAULT NULL,
  `Prefix` varchar(255) DEFAULT NULL,
  `Category` varchar(200) NOT NULL,
  `Purity` varchar(255) DEFAULT NULL,
  `PCode_BarCode` varchar(255) DEFAULT NULL,
  `Gross_Weight` decimal(10,2) DEFAULT NULL,
  `Stones_Weight` decimal(10,2) DEFAULT NULL,
  `Stones_Price` decimal(10,2) DEFAULT NULL,
  `WastageWeight` decimal(10,2) DEFAULT NULL,
  `HUID_No` varchar(255) DEFAULT NULL,
  `Wastage_On` varchar(255) DEFAULT NULL,
  `Wastage_Percentage` decimal(5,2) DEFAULT NULL,
  `Weight_BW` decimal(10,2) DEFAULT NULL,
  `MC_Per_Gram` decimal(10,2) NOT NULL,
  `Making_Charges_On` varchar(200) DEFAULT NULL,
  `TotalWeight_AW` decimal(10,2) NOT NULL,
  `Making_Charges` decimal(10,2) NOT NULL,
  `Status` varchar(200) NOT NULL,
  `Source` varchar(200) NOT NULL,
  `Stock_Point` varchar(255) DEFAULT NULL,
  `Design_Master` varchar(200) NOT NULL,
  `product_Name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opening_tags_entry`
--

INSERT INTO `opening_tags_entry` (`opentag_id`, `product_id`, `Pricing`, `Tag_ID`, `Prefix`, `Category`, `Purity`, `PCode_BarCode`, `Gross_Weight`, `Stones_Weight`, `Stones_Price`, `WastageWeight`, `HUID_No`, `Wastage_On`, `Wastage_Percentage`, `Weight_BW`, `MC_Per_Gram`, `Making_Charges_On`, `TotalWeight_AW`, `Making_Charges`, `Status`, `Source`, `Stock_Point`, `Design_Master`, `product_Name`, `created_at`) VALUES
(24, 71, 'By Weight', 'TAG001', 'tag', 'Gold', '91.6HM', 'BR005', 20.00, 2.00, 2000.00, 0.80, 'HD001', 'Gross Weight', 4.00, 18.00, 100.00, 'By Weight', 18.80, 1880.00, 'sold', 'Transactions', 'Main Store', 'Priyanka', 'Necklace', '2024-12-22 09:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `mode` varchar(50) NOT NULL,
  `cheque_number` varchar(50) DEFAULT NULL,
  `receipt_no` varchar(50) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `total_amt` decimal(10,2) NOT NULL,
  `discount_amt` decimal(10,2) DEFAULT NULL,
  `cash_amt` decimal(10,2) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `date`, `mode`, `cheque_number`, `receipt_no`, `account_name`, `total_amt`, `discount_amt`, `cash_amt`, `remarks`, `created_at`) VALUES
(3, '2024-12-03', 'Cheque', 'CH12345678', 'REC987654', 'John Doe', 1500.00, 100.00, 1400.00, 'Payment for services', '2024-12-22 09:05:25'),
(4, '2024-12-03', 'Cheque', 'CH12345678', 'REC987654', 'John Doe', 1500.00, 100.00, 1400.00, 'Payment for services', '2024-12-22 09:05:25'),
(5, '2024-12-09', 'Cash', '123456', '23', 'Account1', 50000.00, 5000.00, 45000.00, NULL, '2024-12-22 09:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `rbarcode` varchar(100) DEFAULT NULL,
  `Category` varchar(200) DEFAULT NULL,
  `design_master` varchar(200) DEFAULT NULL,
  `purity` varchar(50) DEFAULT NULL,
  `item_prefix` varchar(50) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `sale_account_head` varchar(100) DEFAULT NULL,
  `purchase_account_head` varchar(100) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `tax_slab` varchar(100) DEFAULT NULL,
  `tax_slab_id` int(20) DEFAULT NULL,
  `hsn_code` varchar(50) DEFAULT NULL,
  `maintain_tags` tinyint(1) DEFAULT 0,
  `op_qty` decimal(10,2) DEFAULT NULL,
  `op_value` decimal(10,2) DEFAULT NULL,
  `op_weight` decimal(10,2) DEFAULT NULL,
  `huid_no` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `rbarcode`, `Category`, `design_master`, `purity`, `item_prefix`, `short_name`, `sale_account_head`, `purchase_account_head`, `status`, `tax_slab`, `tax_slab_id`, `hsn_code`, `maintain_tags`, `op_qty`, `op_value`, `op_weight`, `huid_no`, `created_at`) VALUES
(71, 'Necklace', 'RB001', 'Gold', 'Priyanka', '91.6HM', 'NK', 'NK', 'Sales', 'Purchase', '', '03% GST', 9, 'HSN001', 0, 1.00, 0.00, 10.00, 'HUID001', '2024-12-22 09:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `productstockentry_stone_details`
--

CREATE TABLE `productstockentry_stone_details` (
  `id` int(11) NOT NULL,
  `subproductname` varchar(255) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `ratepergram` decimal(10,2) NOT NULL,
  `amount` int(20) NOT NULL,
  `totalweight` decimal(10,2) NOT NULL,
  `totalprice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productstockentry_stone_details`
--

INSERT INTO `productstockentry_stone_details` (`id`, `subproductname`, `weight`, `ratepergram`, `amount`, `totalweight`, `totalprice`) VALUES
(20, 'Diamond', 2.00, 1000.00, 2000, 2.00, 2000.00),
(21, 'Diamond', 2.00, 1000.00, 2000, 2.00, 2000.00),
(22, 'Pendant', 2.00, 1000.00, 2000, 2.00, 2000.00),
(23, 'Pearl', 2.00, 1000.00, 2000, 2.00, 2000.00);

-- --------------------------------------------------------

--
-- Table structure for table `purity`
--

CREATE TABLE `purity` (
  `purity_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `metal` varchar(100) NOT NULL,
  `purity_percentage` decimal(5,2) DEFAULT NULL,
  `purity` varchar(50) DEFAULT NULL,
  `urd_purity` varchar(50) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `old_purity_desc` text DEFAULT NULL,
  `cut_issue` text DEFAULT NULL,
  `skin_print` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purity`
--

INSERT INTO `purity` (`purity_id`, `name`, `metal`, `purity_percentage`, `purity`, `urd_purity`, `desc`, `old_purity_desc`, `cut_issue`, `skin_print`, `created_at`, `updated_at`) VALUES
(9, '916HM', 'Gold', 96.00, '91', 'High', 'A high-purity gold necklace.', 'Previously tested at 99.98%', 'None', 'Smooth', '2024-12-16 09:15:30', '2024-12-18 08:41:46'),
(10, '24K', 'Gold', 99.90, '99', '99', 'Soft and not ideal for everyday jewelry', 'Soft and not ideal for everyday jewelry', 'None', 'Smooth', '2024-12-18 08:27:04', '2024-12-18 08:27:04'),
(11, '18K', 'Gold', 75.00, '75', '75', 'A balance of purity and strength, often used for fine jewelry', 'A balance of purity and strength, often used for fine jewelry', 'None', 'Smooth', '2024-12-18 08:27:45', '2024-12-18 08:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `rates_id` int(11) NOT NULL,
  `rate_date` date NOT NULL,
  `rate_time` time NOT NULL,
  `rate_16crt` decimal(10,2) NOT NULL,
  `rate_18crt` decimal(10,2) NOT NULL,
  `rate_22crt` decimal(10,2) NOT NULL,
  `rate_24crt` decimal(10,2) NOT NULL,
  `silver_rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`rates_id`, `rate_date`, `rate_time`, `rate_16crt`, `rate_18crt`, `rate_22crt`, `rate_24crt`, `silver_rate`) VALUES
(1, '2024-12-16', '12:30:00', 4500.50, 4700.75, 5000.25, 5500.00, 750.00),
(2, '2024-12-16', '12:30:00', 4500.50, 4700.75, 5000.25, 5500.00, 750.00),
(3, '2024-12-16', '14:30:00', 4500.50, 4700.75, 5000.25, 5500.00, 750.00),
(4, '2024-12-16', '14:30:00', 4500.50, 4700.75, 5000.25, 5500.00, 750.00),
(5, '2024-12-16', '14:30:00', 4500.50, 4700.75, 5000.25, 5500.00, 750.00),
(6, '2024-12-16', '06:40:42', 70000.00, 75000.00, 77000.00, 85000.00, 1000.00),
(7, '2024-12-16', '06:41:10', 70000.00, 75000.00, 77000.00, 85000.00, 1500.00),
(8, '2024-12-18', '01:42:40', 6500.00, 70000.00, 7135.00, 7784.00, 1000.00),
(9, '2024-12-18', '03:20:53', 70000.00, 75000.00, 77000.00, 85000.00, 1000.00),
(10, '2024-12-19', '09:27:40', 4759.00, 5838.00, 7135.00, 7784.00, 999.00),
(11, '2024-12-21', '04:18:40', 4773.00, 5809.00, 7100.00, 7745.00, 99.00);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `receipt_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `mode` varchar(50) NOT NULL,
  `cheque_number` varchar(100) DEFAULT NULL,
  `receipt_no` varchar(100) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `total_amt` decimal(10,2) NOT NULL,
  `discount_amt` decimal(10,2) DEFAULT NULL,
  `cash_amt` decimal(10,2) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`receipt_id`, `date`, `mode`, `cheque_number`, `receipt_no`, `account_name`, `total_amt`, `discount_amt`, `cash_amt`, `remarks`, `created_at`) VALUES
(3, '2024-12-02', 'Cash', NULL, 'R123456', 'John Doe', 500.00, 50.00, 450.00, 'Payment for services', '2024-12-22 09:06:30'),
(5, '2024-12-02', 'Cash', '619865484653', 'R1234567', 'John Doe', 500.00, 50.00, 450.00, 'Payment for services', '2024-12-22 09:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `repairdetails`
--

CREATE TABLE `repairdetails` (
  `repairdetails_id` int(11) NOT NULL,
  `repair_id` int(11) NOT NULL,
  `metal_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `rate_type` enum('Per Qty','Per Weight') DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `overall_weight` float DEFAULT NULL,
  `overall_qty` int(20) DEFAULT NULL,
  `overall_total` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repairdetails`
--

INSERT INTO `repairdetails` (`repairdetails_id`, `repair_id`, `metal_type`, `description`, `weight`, `qty`, `rate_type`, `rate`, `overall_weight`, `overall_qty`, `overall_total`, `created_at`) VALUES
(31, 24, 'Gold', 'Gold', 10, 1, 'Per Qty', 7500, 15, 2, 9500, '2024-12-22 09:06:49'),
(32, 24, 'Silver', 'Silver Coins', 5, 1, 'Per Weight', 2000, 15, 2, 9500, '2024-12-22 09:06:49');

-- --------------------------------------------------------

--
-- Table structure for table `repairs`
--

CREATE TABLE `repairs` (
  `repair_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `staff` varchar(255) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `metal` varchar(255) DEFAULT NULL,
  `counter` varchar(255) DEFAULT NULL,
  `entry_type` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `metal_type` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `tag_no` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `purity` decimal(10,2) DEFAULT NULL,
  `extra_weight` decimal(10,2) DEFAULT NULL,
  `stone_value` decimal(10,2) DEFAULT NULL,
  `making_charge` decimal(10,2) DEFAULT NULL,
  `handling_charge` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `repair_no` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repairs`
--

INSERT INTO `repairs` (`repair_id`, `name`, `mobile`, `email`, `address1`, `address2`, `address3`, `staff`, `delivery_date`, `place`, `metal`, `counter`, `entry_type`, `date`, `metal_type`, `item`, `tag_no`, `description`, `purity`, `extra_weight`, `stone_value`, `making_charge`, `handling_charge`, `total`, `city`, `repair_no`, `status`, `created_at`) VALUES
(24, 'Pavani', '9676704365', 'pavanimyana2000@gmail.com', 'h-no 5-47/2/d Chandrampet sircilla', 'Chandrampet', '', 'ABC', '2024-12-28', 'Chandrampet', '', '1', 'Repair', '2024-12-21', 'Gold', 'Chain', '123456', 'Gold', 24.00, 0.00, 0.00, 0.00, 0.00, 9500.00, 'Rajanna Sircilla', 'RPN001', 'Receive from Workshop', '2024-12-22 09:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `repair_details`
--

CREATE TABLE `repair_details` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `aadhar_card` varchar(20) DEFAULT NULL,
  `gst_in` varchar(30) DEFAULT NULL,
  `pan_card` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `product_id` int(20) NOT NULL,
  `metal` varchar(50) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `metal_type` varchar(100) DEFAULT NULL,
  `design_name` varchar(255) DEFAULT NULL,
  `purity` varchar(50) DEFAULT NULL,
  `gross_weight` decimal(10,2) DEFAULT NULL,
  `stone_weight` decimal(10,2) DEFAULT NULL,
  `weight_bw` decimal(10,2) DEFAULT NULL,
  `stone_price` decimal(10,2) DEFAULT NULL,
  `va_on` varchar(50) DEFAULT NULL,
  `va_percent` decimal(5,2) DEFAULT NULL,
  `wastage_weight` decimal(10,2) DEFAULT NULL,
  `total_weight_av` decimal(10,2) DEFAULT NULL,
  `mc_on` varchar(50) DEFAULT NULL,
  `mc_per_gram` decimal(10,2) DEFAULT NULL,
  `making_charges` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `rate_amt` decimal(5,2) DEFAULT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `tax_amt` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `cash_amount` decimal(10,2) DEFAULT NULL,
  `card_amount` decimal(10,2) DEFAULT NULL,
  `card_amt` decimal(10,2) DEFAULT NULL,
  `chq` varchar(255) DEFAULT NULL,
  `chq_amt` decimal(10,2) DEFAULT NULL,
  `online` varchar(255) DEFAULT NULL,
  `online_amt` decimal(10,2) DEFAULT NULL,
  `transaction_status` varchar(255) NOT NULL,
  `qty` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repair_details`
--

INSERT INTO `repair_details` (`id`, `customer_id`, `mobile`, `account_name`, `email`, `address1`, `address2`, `city`, `pincode`, `state`, `state_code`, `aadhar_card`, `gst_in`, `pan_card`, `date`, `invoice_number`, `code`, `product_id`, `metal`, `product_name`, `metal_type`, `design_name`, `purity`, `gross_weight`, `stone_weight`, `weight_bw`, `stone_price`, `va_on`, `va_percent`, `wastage_weight`, `total_weight_av`, `mc_on`, `mc_per_gram`, `making_charges`, `rate`, `rate_amt`, `tax_percent`, `tax_amt`, `total_price`, `cash_amount`, `card_amount`, `card_amt`, `chq`, `chq_amt`, `online`, `online_amt`, `transaction_status`, `qty`) VALUES
(1, 7, '777943993', 'Hemanth', 'kjj@gmail.com', 'jd', 'jkd', 'jjd', 'hjd', 'Telangana', '94', 'hjjsd', '8390', 'nnd', '2024-12-13', '65464', 'Rbarcode', 0, '916HM', '12', '12', '12', '12', 12.00, 12.00, 12.00, 12.00, '12', 999.99, 12.00, 12.00, '12', 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, '12', 12.00, '12', 12.00, '', NULL),
(2, 8, 'Vitae quod dict', 'Stacy Dickson', 'zywuhubat@mailinator.com', '63 Hague Road', 'Lorem atque eveniet', 'Ex commodo modi qui ', 'Ipsum aut ', 'Maharashtra', 'Suscipit n', 'Ut sit vel i', 'Voluptatibus al', 'Tempor sit', '2024-12-14', '6328689', 'Rbarcode', 0, '22k', '12', '12', '12', '12', 12.00, 12.00, 12.00, 12.00, '12', 12.00, 12.00, 12.00, '12', 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, '12', 12.00, '12', 12.00, '', NULL),
(3, 7, '777943993', 'Hemanth', 'kjj@gmail.com', 'jd', 'jkd', 'jjd', 'hjd', 'Telangana', '94', 'hjjsd', '8390', 'nnd', '2024-12-21', '22345', 'BarCode', 0, '916HM', '22345', '22345', '22345', '22345', 22345.00, 22345.00, 22345.00, 22345.00, '22345', 999.99, 22345.00, 22345.00, '22345', 22345.00, 99999999.99, 22345.00, 999.99, 999.99, 22345.00, 22345.00, 22345.00, 22345.00, 22345.00, '22345', 22345.00, '22345', 22345.00, '', NULL),
(4, 4, 'Sunt voluptatem', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', 'Dicta volu', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-14', '22345', 'BarCode', 0, '916HM', '22345', '22345', '22345', '22345', 22345.00, 22345.00, 22345.00, 22345.00, '22345', 999.99, 22345.00, 22345.00, '22345', 22345.00, 22345.00, 22345.00, 999.99, 999.99, 22345.00, 22345.00, 22345.00, 22345.00, 22345.00, '22345', 22345.00, '22345', 22345.00, '', NULL),
(5, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-13', 'INV001', 'Rbarcode', 0, '916HM', 'Necklace', 'Gold', 'Jewellery', '24K', 50000.00, 2000.00, 2000.00, 2000.00, '2000', 999.99, 2000.00, 2000.00, '2000', 2000.00, 2000.00, 2000.00, 999.99, 999.99, 2000.00, 2000.00, 2000.00, 2000.00, 2000.00, '2000', 2000.00, '2000', 2000.00, '', NULL),
(6, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '0000-00-00', '', 'BR002', 0, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 30.00, 0.00, 25.00, 0.00, 'Gross Weight', 10.00, 3.00, 33.00, 'By Weight', 100.00, 3300.00, 1000.00, 999.99, 5.00, 1000.00, 100000.00, 1000.00, 1000.00, 1000.00, '1000', 1000.00, '1000', 1000.00, '', NULL),
(7, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '0000-00-00', '', 'BR001', 0, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 20.00, 0.00, 18.00, 0.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 100.00, 100.00, 0.00, '', 0.00, '', 0.00, '', NULL),
(8, 2, '9876543210', 'John Doe', 'john.doe@example.com', '123 Main Street', 'Suite 101', 'New York', '10001', 'New York', 'NY01', '123456789012', '22AAAAA0000A1Z5', 'ABCDE1234F', '0000-00-00', '', 'BR002', 52, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 30.00, 0.00, 25.00, 0.00, 'Gross Weight', 10.00, 3.00, 33.00, 'By Weight', 100.00, 3300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, '', NULL),
(9, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-13', 'INV005', 'RB0001', 52, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 20.00, 2.00, 18.00, 5000.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, 75000.00, 999.99, 2.00, 33144.00, 1690344.00, 1690344.00, 1690344.00, 1690344.00, '1690344', 1690344.00, '1690344', 1690344.00, '', NULL),
(10, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-13', 'INV004', 'BR002', 52, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 30.00, 5.00, 25.00, 10000.00, 'Gross Weight', 10.00, 3.00, 33.00, 'By Weight', 100.00, 3300.00, 50000.00, 999.99, 2.00, 33266.00, 1696566.00, 1663300.00, 1663300.00, 1663300.00, '', 0.00, '', 0.00, '', NULL),
(11, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-13', 'INV001', 'BR001', 52, NULL, 'Necklace', 'Gold', 'Jewellery', '91.6HM', 20.00, 2.00, 18.00, 5000.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, NULL, 999.99, NULL, 0.00, 7200.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, '', NULL),
(12, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-16', 'INV001', 'BR002', 52, '', '', '', '', '', 30.00, 5.00, 25.00, 10000.00, 'Gross Weight', 10.00, 3.00, 33.00, 'By Weight', 100.00, 3300.00, 0.00, 999.99, 0.00, 0.00, 13300.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, 'Sales', NULL),
(13, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-16', 'INV001', 'BR001', 52, '', '', '', '', '', 20.00, 2.00, 18.00, 5000.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, 0.00, 999.99, 0.00, 0.00, 7200.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, 'Sales', 1),
(14, 2, '9876543210', 'John Doe', 'john.doe@example.com', '123 Main Street', 'Suite 101', 'New York', '10001', 'New York', 'NY01', '123456789012', '22AAAAA0000A1Z5', 'ABCDE1234F', '0000-00-00', 'INV021', 'BR001', 52, '', '', '', '', '', 20.00, 2.00, 18.00, 5000.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, 0.00, 999.99, 0.00, 0.00, 7200.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, 'Sales', 1),
(15, 2, '9876543210', 'John Doe', 'john.doe@example.com', '123 Main Street', 'Suite 101', 'New York', '10001', 'New York', 'NY01', '123456789012', '22AAAAA0000A1Z5', 'ABCDE1234F', '0000-00-00', 'INV022', 'BR001', 52, '', '', '', '', '', 20.00, 2.00, 18.00, 5000.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, 0.00, 999.99, 0.00, 0.00, 7200.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, 'Orders', 1),
(16, 9, '9856321478', 'Bhargav', 'bhargav@gmail.com', '5-47', 'Sircilla', 'Sircilla', '505301', 'Telangana', '24', '123412341234', '123456789012345', 'ABCDE1234F', '0000-00-00', 'INV023', 'GR001', 63, '', 'Gold Ring', 'Gold', 'Priyanka', '91.6HM', 10.00, 0.00, 10.00, 0.00, 'Gross Weight', 4.00, 0.40, 10.40, 'By Weight', 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, 'Sales', 1),
(17, 9, '9856321478', 'Bhargav', 'bhargav@gmail.com', '5-47', 'Sircilla', 'Sircilla', '505301', 'Telangana', '24', '123412341234', '123456789012345', 'ABCDE1234F', '0000-00-00', 'INV023', 'GR001', 63, '', 'Gold Ring', 'Gold', 'Priyanka', '91.6HM', 10.00, 0.00, 10.00, 0.00, 'Gross Weight', 4.00, 0.40, 10.40, 'By Weight', 100.00, 1040.00, 7940.00, 999.99, 2.00, 1672.32, 85288.32, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, 'Sales', 0),
(18, 7, '9676704365', 'Pavani', 'pavanimyana2000@gmail.com', 'h-no 5-47/2/d Chandrampet sircilla', 'Chandrampet', 'Rajanna Sircilla', '505301', 'Telangana', 'India', '123456789012', '123456789012345', 'ABCDE1234F', '2024-12-18', 'INV024', 'RB005', 65, '', 'Gold999', 'Gold', 'Priyanka', '91.6HM', 15.00, 0.00, 15.00, 0.00, 'Gross Weight', 0.00, 0.00, 15.00, 'By Weight', 0.00, 0.00, 7500.00, 999.99, 3.00, 3375.00, 115875.00, 103425.00, 0.00, 50000.00, '', 50000.00, '', 0.00, 'Sales', 1),
(19, 7, '9676704365', 'Pavani', 'pavanimyana2000@gmail.com', 'h-no 5-47/2/d Chandrampet sircilla', 'Chandrampet', 'Rajanna Sircilla', '505301', 'Telangana', 'India', '123456789012', '123456789012345', 'ABCDE1234F', '2024-12-18', 'INV024', 'GR001', 63, '', 'Gold Ring', 'Gold', 'Priyanka', '91.6HM', 10.00, 2.00, 8.00, 5000.00, 'Gross Weight', 4.00, 0.40, 10.40, 'Fixed', 192.31, 2000.00, 7500.00, 999.99, 3.00, 2550.00, 87550.00, 103425.00, 0.00, 50000.00, '', 50000.00, '', 0.00, 'Sales', 1),
(20, 7, '9676704365', 'Pavani', 'pavanimyana2000@gmail.com', 'h-no 5-47/2/d Chandrampet sircilla', 'Chandrampet', 'Rajanna Sircilla', '505301', 'Telangana', 'India', '123456789012', '123456789012345', 'ABCDE1234F', '2024-12-19', 'INV025', 'BR001', 71, '', 'Necklace', 'Gold', 'Priyanka', '91.6HM', 20.00, 2.00, 18.00, 2000.00, 'Gross Weight', 4.00, 0.80, 18.80, 'By Weight', 100.00, 1880.00, 7135.00, 999.99, 3.00, 4024.14, 142042.14, 10000.00, 0.00, 42042.00, '', 0.00, '', 0.00, 'Sales', 1),
(21, 2, '9876543210', 'John Doe', 'john.doe@example.com', '123 Main Street', 'Suite 101', 'New York', '10001', 'New York', 'NY01', '123456789012', '22AAAAA0000A1Z5', 'ABCDE1234F', '2024-12-19', 'INV026', 'BR001', 71, '', 'Necklace', 'Gold', 'Priyanka', '91.6HM', 20.00, 2.00, 18.00, 2000.00, 'Gross Weight', 4.00, 0.80, 18.80, 'By Weight', 100.00, 1880.00, 0.00, 0.00, 3.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00, 'Sales', 1);

-- --------------------------------------------------------

--
-- Table structure for table `taxslabs`
--

CREATE TABLE `taxslabs` (
  `tax_id` int(11) NOT NULL,
  `TaxSlabID` int(11) NOT NULL,
  `TaxSlabName` varchar(255) DEFAULT NULL,
  `TaxationType` varchar(255) DEFAULT NULL,
  `SGSTPercentage` float DEFAULT NULL,
  `CGSTPercentage` float DEFAULT NULL,
  `IGSTPercentage` float DEFAULT NULL,
  `TaxCategory` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taxslabs`
--

INSERT INTO `taxslabs` (`tax_id`, `TaxSlabID`, `TaxSlabName`, `TaxationType`, `SGSTPercentage`, `CGSTPercentage`, `IGSTPercentage`, `TaxCategory`) VALUES
(1, 9, '03% GST', 'Taxable', 1.5, 1.5, 3, 'Goods'),
(2, 8, '18% GST', 'Taxable', 9, 9, 18, 'Goods'),
(4, 4, '12% GST', 'Taxable', 6, 6, 12, 'Goods'),
(5, 3, '05% GST', 'Taxable', 2.5, 2.5, 5, 'Goods'),
(6, 1, 'Tax Free', 'Taxable', 0, 0, 0, 'Goods'),
(7, 2, '28%', 'Taxable', 14, 14, 28, 'Goods');

-- --------------------------------------------------------

--
-- Table structure for table `urd_purchase_details`
--

CREATE TABLE `urd_purchase_details` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `aadhar_card` varchar(12) DEFAULT NULL,
  `gst_in` varchar(15) DEFAULT NULL,
  `pan_card` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `purchase_number` varchar(20) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `metal` varchar(50) DEFAULT NULL,
  `purity` varchar(50) DEFAULT NULL,
  `hsn_code` varchar(20) DEFAULT NULL,
  `gross` decimal(10,2) DEFAULT NULL,
  `dust` decimal(10,2) DEFAULT NULL,
  `touch_percent` decimal(5,2) DEFAULT NULL,
  `ml_percent` decimal(5,2) DEFAULT NULL,
  `eqt_wt` decimal(10,2) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `urd_purchase_details`
--

INSERT INTO `urd_purchase_details` (`id`, `customer_id`, `account_name`, `mobile`, `email`, `address1`, `address2`, `city`, `state`, `state_code`, `aadhar_card`, `gst_in`, `pan_card`, `date`, `purchase_number`, `product_id`, `product_name`, `metal`, `purity`, `hsn_code`, `gross`, `dust`, `touch_percent`, `ml_percent`, `eqt_wt`, `remarks`, `rate`, `total_amount`, `created_at`) VALUES
(1, '', 'John Doe', '9876543210', 'john.doe@example.com', '123 Main Street', 'Suite 101', 'New York', 'New York', 'NY01', '123456789012', '22AAAAA0000A1Z5', 'ABCDE1234F', '2024-12-17', 'N/A', 'Voluptatum expedita ', 'PRODUCT2', 'SILVER', '22K', 'Facere qui veritatis', 23.00, 45.00, 43.00, 28.00, 60.00, 'Possimus deserunt e', 42.00, 78.00, '2024-12-22 09:07:25'),
(3, '4', 'Denise Lloyd', '09676704365', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-17', 'N/A', '8998', 'PRODUCT2', 'PLATINUM', '18K', '1', 1.00, 1.00, 1.00, 1.00, 1.00, '1', 1.00, 1.00, '2024-12-22 09:07:25'),
(4, '2', 'John Doe', '9876543210', 'john.doe@example.com', '123 Main Street', 'Suite 101', 'New York', 'New York', 'NY01', '123456789012', '22AAAAA0000A1Z5', 'ABCDE1234F', '2024-12-17', 'N/A', '767', 'PRODUCT3', 'PLATINUM', '18K', '89', 12.00, 12.00, 1.00, 1.00, 1.00, '1', 1.00, 1.00, '2024-12-22 09:07:25'),
(9, '7', 'Pavani', '9676704365', 'pavanimyana2000@gmail.com', 'h-no 5-47/2/d Chandrampet sircilla', 'Chandrampet', 'Rajanna Sircilla', 'Telangana', 'India', '123456789012', '123456789012345', 'ABCDE1234F', '0000-00-00', NULL, '2', 'PRODUCT2', 'SILVER', '18K', 'HSN001', 20.00, 2.00, 2.00, 2.00, 2.00, '', 0.00, 0.00, '2024-12-22 09:07:25'),
(10, '2', 'John Doe', '9876543210', 'john.doe@example.com', '123 Main Street', 'Suite 101', 'New York', 'New York', 'NY01', '123456789012', '22AAAAA0000A1Z5', 'ABCDE1234F', '2024-12-21', 'URD001', '1', 'PRODUCT1', 'GOLD', '22KHM', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0.00, '2024-12-22 09:07:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountgroup`
--
ALTER TABLE `accountgroup`
  ADD PRIMARY KEY (`accountgroup_id`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `current_rates`
--
ALTER TABLE `current_rates`
  ADD PRIMARY KEY (`current_rates_id`),
  ADD UNIQUE KEY `rate_date` (`rate_date`,`rate_time`);

--
-- Indexes for table `designmaster`
--
ALTER TABLE `designmaster`
  ADD PRIMARY KEY (`design_id`);

--
-- Indexes for table `estimate`
--
ALTER TABLE `estimate`
  ADD PRIMARY KEY (`estimate_id`);

--
-- Indexes for table `metaltype`
--
ALTER TABLE `metaltype`
  ADD PRIMARY KEY (`metal_type_id`);

--
-- Indexes for table `opening_tags_entry`
--
ALTER TABLE `opening_tags_entry`
  ADD PRIMARY KEY (`opentag_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `productstockentry_stone_details`
--
ALTER TABLE `productstockentry_stone_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purity`
--
ALTER TABLE `purity`
  ADD PRIMARY KEY (`purity_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`rates_id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD UNIQUE KEY `receipt_no` (`receipt_no`);

--
-- Indexes for table `repairdetails`
--
ALTER TABLE `repairdetails`
  ADD PRIMARY KEY (`repairdetails_id`),
  ADD KEY `repair_id` (`repair_id`);

--
-- Indexes for table `repairs`
--
ALTER TABLE `repairs`
  ADD PRIMARY KEY (`repair_id`);

--
-- Indexes for table `repair_details`
--
ALTER TABLE `repair_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxslabs`
--
ALTER TABLE `taxslabs`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `urd_purchase_details`
--
ALTER TABLE `urd_purchase_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountgroup`
--
ALTER TABLE `accountgroup`
  MODIFY `accountgroup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `account_details`
--
ALTER TABLE `account_details`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `current_rates`
--
ALTER TABLE `current_rates`
  MODIFY `current_rates_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designmaster`
--
ALTER TABLE `designmaster`
  MODIFY `design_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `estimate`
--
ALTER TABLE `estimate`
  MODIFY `estimate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `metaltype`
--
ALTER TABLE `metaltype`
  MODIFY `metal_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `opening_tags_entry`
--
ALTER TABLE `opening_tags_entry`
  MODIFY `opentag_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `productstockentry_stone_details`
--
ALTER TABLE `productstockentry_stone_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `purity`
--
ALTER TABLE `purity`
  MODIFY `purity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `rates_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `repairdetails`
--
ALTER TABLE `repairdetails`
  MODIFY `repairdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `repairs`
--
ALTER TABLE `repairs`
  MODIFY `repair_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `repair_details`
--
ALTER TABLE `repair_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `taxslabs`
--
ALTER TABLE `taxslabs`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `urd_purchase_details`
--
ALTER TABLE `urd_purchase_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `repairdetails`
--
ALTER TABLE `repairdetails`
  ADD CONSTRAINT `repairdetails_ibfk_1` FOREIGN KEY (`repair_id`) REFERENCES `repairs` (`repair_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
