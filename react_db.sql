-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2024 at 07:46 AM
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
  `pan_card` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_details`
--

INSERT INTO `account_details` (`account_id`, `account_name`, `print_name`, `account_group`, `op_bal`, `metal_balance`, `dr_cr`, `address1`, `address2`, `city`, `pincode`, `state`, `state_code`, `phone`, `mobile`, `contact_person`, `email`, `birthday`, `anniversary`, `bank_account_no`, `bank_name`, `ifsc_code`, `branch`, `gst_in`, `aadhar_card`, `pan_card`) VALUES
(2, 'John Doe', 'John D.', 'CUSTOMERS', 1500.50, 10.25, 'Dr', '123 Main Street', 'Suite 101', 'New York', '10001', 'New York', 'NY01', '1234567890', '9876543210', 'Jane Doe', 'john.doe@example.com', '1985-05-15', '2010-06-25', '123456789012', 'XYZ Bank', 'XYZB1234567', 'Main Branch', '22AAAAA0000A1Z5', '123456789012', 'ABCDE1234F'),
(4, 'Denise Lloyd', 'Adrienne Atkinson', 'CUSTOMERS', 10000.00, NULL, NULL, '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', '09676704365', '09676704365', NULL, 'sufyvos@mailinator.com', '2024-12-02', '2024-12-11', 'Sit vitae cillum tot', 'Allistair Saunders', 'Voluptatibus mollit ', 'Quis quia necessitat', 'Aspernatur aper', 'Irure iusto ', 'Sed id sol');

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
  `making_charges_on` enum('Gross Weight','Weight WW') DEFAULT NULL,
  `mc_per_gram` decimal(10,2) DEFAULT NULL,
  `total_mc` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `tax_vat_amount` decimal(10,2) DEFAULT NULL,
  `total_rs` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estimate`
--

INSERT INTO `estimate` (`estimate_id`, `date`, `pcode`, `estimate_number`, `product_id`, `product_name`, `gross_weight`, `stones_weight`, `stones_price`, `weight_bw`, `wastage_on`, `wastage_percent`, `wastage_weight`, `total_weight`, `making_charges_on`, `mc_per_gram`, `total_mc`, `rate`, `tax_percent`, `tax_vat_amount`, `total_rs`, `created_at`, `updated_at`) VALUES
(1, '2024-12-12', 'P123', 'E12345', 'PRD001', 'Gold Necklace', 25.50, 5.20, 3000.00, 20.30, 'Gross Weight', 5.00, 1.25, 21.55, 'Gross Weight', 500.00, 10775.00, 5300.00, 18.00, 1940.25, 12715.25, '2024-12-12 08:34:50', '2024-12-12 08:34:50'),
(2, '2024-12-12', 'P124', 'E12346', 'PRD001', 'Gold Necklace', 25.50, 5.20, 3000.00, 20.30, 'Gross Weight', 5.00, 1.25, 21.55, 'Gross Weight', 500.00, 10775.00, 5300.00, 18.00, 1940.25, 12715.25, '2024-12-12 08:35:03', '2024-12-12 08:35:03'),
(3, '2024-12-12', 'PRD002', 'E123457', '', 'Chain', 25.00, 2.00, 20000.00, 20.00, 'Gross Weight', 10.00, 1000.00, 23.00, 'Gross Weight', 10000.00, 10000.00, 70000.00, 5.00, 800.00, 80000.00, '2024-12-12 08:47:04', '2024-12-12 08:47:04');

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
(3, 'Gold', 'A precious metal widely used in jewelry.', 99.99, 99.95, 99.90, 99.80, '2024-12-04 15:53:20', '2024-12-04 15:53:20'),
(4, 'Gold', 'A precious metal widely used in jewelry.', 99.99, 99.95, 99.90, 99.80, '2024-12-04 15:53:21', '2024-12-04 15:53:21');

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
  `product_Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opening_tags_entry`
--

INSERT INTO `opening_tags_entry` (`opentag_id`, `product_id`, `Pricing`, `Tag_ID`, `Prefix`, `Category`, `Purity`, `PCode_BarCode`, `Gross_Weight`, `Stones_Weight`, `Stones_Price`, `WastageWeight`, `HUID_No`, `Wastage_On`, `Wastage_Percentage`, `Weight_BW`, `MC_Per_Gram`, `Making_Charges_On`, `TotalWeight_AW`, `Making_Charges`, `Status`, `Source`, `Stock_Point`, `Design_Master`, `product_Name`) VALUES
(12, 52, 'By Weight', 'TAG001', 'tag', 'Gold', '916HM', 'BR001', 20.00, 2.00, 5000.00, 2.00, 'HD001', 'Gross Weight', 10.00, 18.00, 100.00, 'By Weight', 22.00, 2200.00, 'Active', 'Tags Entry', 'Main Store', 'gold', 'Unnamed Product'),
(13, 52, 'By Weight', 'TAG002', 'Gold', 'Gold', '22K', 'BR002', 30.00, 5.00, 10000.00, 3.00, 'HD002', 'Gross Weight', 10.00, 25.00, 100.00, 'By Weight', 33.00, 3300.00, 'Active', '', 'Secondary Store', '', 'Unnamed Product'),
(14, 53, 'By Weight', 'TAG004', 'tag', 'Gold', '916HM', 'BR005', 20.00, 2.00, 5000.00, 2.00, 'HD001', 'Gross Weight', 10.00, 18.00, 100.00, 'By Weight', 22.00, 2200.00, 'Active', 'Tags Entry', '', 'gold', 'Unnamed Product'),
(15, 53, 'By Fixed', 'TAG005', 'Gold', '', '22K', 'BR006', 10.00, 1.00, 500.00, 1.00, 'HD001', 'Gross Weight', 10.00, 9.00, 50.00, 'By Weight', 11.00, 550.00, 'Active', '', 'Main Store', '', 'Unnamed Product');

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
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `date`, `mode`, `cheque_number`, `receipt_no`, `account_name`, `total_amt`, `discount_amt`, `cash_amt`, `remarks`) VALUES
(3, '2024-12-03', 'Cheque', 'CH12345678', 'REC987654', 'John Doe', 1500.00, 100.00, 1400.00, 'Payment for services'),
(4, '2024-12-03', 'Cheque', 'CH12345678', 'REC987654', 'John Doe', 1500.00, 100.00, 1400.00, 'Payment for services'),
(5, '2024-12-09', 'Cash', '123456', '23', 'Account1', 50000.00, 5000.00, 45000.00, NULL);

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
  `huid_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `rbarcode`, `Category`, `design_master`, `purity`, `item_prefix`, `short_name`, `sale_account_head`, `purchase_account_head`, `status`, `tax_slab`, `tax_slab_id`, `hsn_code`, `maintain_tags`, `op_qty`, `op_value`, `op_weight`, `huid_no`) VALUES
(52, 'Necklace', 'RB0001', 'Gold', 'Jewellery', '91.6HM', 'RB', 'NCK', 'Sales', 'Purchase', '', 'ACTIVE', NULL, 'HSN001', 1, 2.00, 0.00, 50.00, ''),
(53, 'Braclet', 'RB002', 'Gold', 'Jewellery', '91.6HM', '22', 'BR', 'Sales', 'Purchase', 'ACTIVE', 'ACTIVE', NULL, 'HSN003', 1, 2.00, 0.00, 30.00, '');

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
(3, 'Necklace', 'Silver', 99.99, '24K', 'High', 'A high-purity gold necklace.', 'Previously tested at 99.98%', 'None', 'Smooth', '2024-12-04 07:24:19', '2024-12-06 08:57:33');

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
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`receipt_id`, `date`, `mode`, `cheque_number`, `receipt_no`, `account_name`, `total_amt`, `discount_amt`, `cash_amt`, `remarks`) VALUES
(3, '2024-12-02', 'Cash', NULL, 'R123456', 'John Doe', 500.00, 50.00, 450.00, 'Payment for services'),
(5, '2024-12-02', 'Cash', '619865484653', 'R1234567', 'John Doe', 500.00, 50.00, 450.00, 'Payment for services');

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
  `rate_type` enum('per_item','per_weight') DEFAULT NULL,
  `rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repairdetails`
--

INSERT INTO `repairdetails` (`repairdetails_id`, `repair_id`, `metal_type`, `description`, `weight`, `qty`, `rate_type`, `rate`) VALUES
(1, 10, 'necklace', 'Evaluation of the participant\'s knowledge gained', 0, 0, '', 0),
(2, 10, 'Gold', 'Ok Approved', 0, 0, '', 0),
(3, 11, 'necklace', 'Gold', 10, 1, 'per_item', 10000),
(4, 10, 'Gold', 'Gold Coins', 10, 1, 'per_item', 80000),
(5, 11, 'necklace', 'Gold', 10, 1, 'per_weight', 1000),
(6, 11, 'Gold', 'Gold', 10, 1, 'per_weight', 1000);

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
  `receipt_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
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
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repairs`
--

INSERT INTO `repairs` (`repair_id`, `name`, `mobile`, `email`, `address1`, `address2`, `address3`, `staff`, `delivery_date`, `place`, `metal`, `counter`, `entry_type`, `receipt_no`, `date`, `type`, `item`, `tag_no`, `description`, `purity`, `extra_weight`, `stone_value`, `making_charge`, `handling_charge`, `total`, `city`, `repair_no`, `status`) VALUES
(10, 'John Doe', '9876543210', 'john.doe@example.com', '123 Main St', 'Suite 100', 'Landmark Building', 'Jane Smith', '2024-12-15', 'New York', 'Gold', 'C1', 'Walk-In', 'RC56789', '2024-12-10', 'Repair', 'Ring', 'T123', 'Gold ring with diamond', 22.00, 0.50, 1500.00, 500.00, 200.00, 2200.00, 'New York', 'RN7890', 'Assign To Workshop'),
(11, 'John Doe', '9876543210', 'john.doe@example.com', '123 Main St', 'Suite 100', 'Landmark Building', 'Jane Smith', '2024-12-15', 'New York', 'Gold', 'C1', 'Walk-In', 'RC56789', '2024-12-10', 'Repair', 'Ring', 'T123', 'Gold ring with diamond', 22.00, 0.50, 1500.00, 500.00, 200.00, 2200.00, 'New York', 'RN7891', 'Receive from Workshop');

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
  `online_amt` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repair_details`
--

INSERT INTO `repair_details` (`id`, `customer_id`, `mobile`, `account_name`, `email`, `address1`, `address2`, `city`, `pincode`, `state`, `state_code`, `aadhar_card`, `gst_in`, `pan_card`, `date`, `invoice_number`, `code`, `product_id`, `metal`, `product_name`, `metal_type`, `design_name`, `purity`, `gross_weight`, `stone_weight`, `weight_bw`, `stone_price`, `va_on`, `va_percent`, `wastage_weight`, `total_weight_av`, `mc_on`, `mc_per_gram`, `making_charges`, `rate`, `rate_amt`, `tax_percent`, `tax_amt`, `total_price`, `cash_amount`, `card_amount`, `card_amt`, `chq`, `chq_amt`, `online`, `online_amt`) VALUES
(1, 7, '777943993', 'Hemanth', 'kjj@gmail.com', 'jd', 'jkd', 'jjd', 'hjd', 'Telangana', '94', 'hjjsd', '8390', 'nnd', '2024-12-13', '65464', 'Rbarcode', 0, '916HM', '12', '12', '12', '12', 12.00, 12.00, 12.00, 12.00, '12', 999.99, 12.00, 12.00, '12', 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, '12', 12.00, '12', 12.00),
(2, 8, 'Vitae quod dict', 'Stacy Dickson', 'zywuhubat@mailinator.com', '63 Hague Road', 'Lorem atque eveniet', 'Ex commodo modi qui ', 'Ipsum aut ', 'Maharashtra', 'Suscipit n', 'Ut sit vel i', 'Voluptatibus al', 'Tempor sit', '2024-12-14', '6328689', 'Rbarcode', 0, '22k', '12', '12', '12', '12', 12.00, 12.00, 12.00, 12.00, '12', 12.00, 12.00, 12.00, '12', 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00, '12', 12.00, '12', 12.00),
(3, 7, '777943993', 'Hemanth', 'kjj@gmail.com', 'jd', 'jkd', 'jjd', 'hjd', 'Telangana', '94', 'hjjsd', '8390', 'nnd', '2024-12-21', '22345', 'BarCode', 0, '916HM', '22345', '22345', '22345', '22345', 22345.00, 22345.00, 22345.00, 22345.00, '22345', 999.99, 22345.00, 22345.00, '22345', 22345.00, 99999999.99, 22345.00, 999.99, 999.99, 22345.00, 22345.00, 22345.00, 22345.00, 22345.00, '22345', 22345.00, '22345', 22345.00),
(4, 4, 'Sunt voluptatem', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', 'Dicta volu', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-14', '22345', 'BarCode', 0, '916HM', '22345', '22345', '22345', '22345', 22345.00, 22345.00, 22345.00, 22345.00, '22345', 999.99, 22345.00, 22345.00, '22345', 22345.00, 22345.00, 22345.00, 999.99, 999.99, 22345.00, 22345.00, 22345.00, 22345.00, 22345.00, '22345', 22345.00, '22345', 22345.00),
(5, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-13', 'INV001', 'Rbarcode', 0, '916HM', 'Necklace', 'Gold', 'Jewellery', '24K', 50000.00, 2000.00, 2000.00, 2000.00, '2000', 999.99, 2000.00, 2000.00, '2000', 2000.00, 2000.00, 2000.00, 999.99, 999.99, 2000.00, 2000.00, 2000.00, 2000.00, 2000.00, '2000', 2000.00, '2000', 2000.00),
(6, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '0000-00-00', '', 'BR002', 0, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 30.00, 0.00, 25.00, 0.00, 'Gross Weight', 10.00, 3.00, 33.00, 'By Weight', 100.00, 3300.00, 1000.00, 999.99, 5.00, 1000.00, 100000.00, 1000.00, 1000.00, 1000.00, '1000', 1000.00, '1000', 1000.00),
(7, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '0000-00-00', '', 'BR001', 0, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 20.00, 0.00, 18.00, 0.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 100.00, 100.00, 0.00, '', 0.00, '', 0.00),
(8, 2, '9876543210', 'John Doe', 'john.doe@example.com', '123 Main Street', 'Suite 101', 'New York', '10001', 'New York', 'NY01', '123456789012', '22AAAAA0000A1Z5', 'ABCDE1234F', '0000-00-00', '', 'BR002', 52, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 30.00, 0.00, 25.00, 0.00, 'Gross Weight', 10.00, 3.00, 33.00, 'By Weight', 100.00, 3300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00),
(9, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-13', 'INV005', 'RB0001', 52, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 20.00, 2.00, 18.00, 5000.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, 75000.00, 999.99, 2.00, 33144.00, 1690344.00, 1690344.00, 1690344.00, 1690344.00, '1690344', 1690344.00, '1690344', 1690344.00),
(10, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-13', 'INV004', 'BR002', 52, '', 'Necklace', 'Gold', 'Jewellery', '91.6HM', 30.00, 5.00, 25.00, 10000.00, 'Gross Weight', 10.00, 3.00, 33.00, 'By Weight', 100.00, 3300.00, 50000.00, 999.99, 2.00, 33266.00, 1696566.00, 1663300.00, 1663300.00, 1663300.00, '', 0.00, '', 0.00),
(11, 4, '09676704365', 'Denise Lloyd', 'sufyvos@mailinator.com', '820 Fabien Lane', 'Qui non soluta dolor', 'Est duis harum susci', '505301', 'Telangana', 'Esse qui r', 'Irure iusto ', 'Aspernatur aper', 'Sed id sol', '2024-12-13', 'INV001', 'BR001', 52, NULL, 'Necklace', 'Gold', 'Jewellery', '91.6HM', 20.00, 2.00, 18.00, 5000.00, 'Gross Weight', 10.00, 2.00, 22.00, 'By Weight', 100.00, 2200.00, NULL, 999.99, NULL, 0.00, 7200.00, 0.00, 0.00, 0.00, '', 0.00, '', 0.00);

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
-- Indexes for table `purity`
--
ALTER TABLE `purity`
  ADD PRIMARY KEY (`purity_id`);

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
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `designmaster`
--
ALTER TABLE `designmaster`
  MODIFY `design_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `estimate`
--
ALTER TABLE `estimate`
  MODIFY `estimate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `metaltype`
--
ALTER TABLE `metaltype`
  MODIFY `metal_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `opening_tags_entry`
--
ALTER TABLE `opening_tags_entry`
  MODIFY `opentag_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `purity`
--
ALTER TABLE `purity`
  MODIFY `purity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `repairdetails`
--
ALTER TABLE `repairdetails`
  MODIFY `repairdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `repairs`
--
ALTER TABLE `repairs`
  MODIFY `repair_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `repair_details`
--
ALTER TABLE `repair_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `taxslabs`
--
ALTER TABLE `taxslabs`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
