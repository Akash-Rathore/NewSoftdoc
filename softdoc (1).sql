-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2020 at 03:49 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softdoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `roll_number` varchar(255) NOT NULL,
  `attendance_status` varchar(255) NOT NULL,
  `present_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `roll_number`, `attendance_status`, `present_date`) VALUES
(1, '1', 'present', '2020-04-11'),
(2, '2', 'present', '2020-04-11'),
(3, '1', 'present', '2020-04-12'),
(4, '3', 'absent', '2020-04-12'),
(5, '1', 'present', '2020-04-20'),
(6, '1', 'absent', '2020-04-18'),
(7, '1000', 'present', '2020-04-20');

-- --------------------------------------------------------

--
-- Table structure for table `client_details`
--

CREATE TABLE `client_details` (
  `id` int(11) NOT NULL,
  `softdoc_id` varchar(255) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `emp_email_id` varchar(255) DEFAULT NULL,
  `joining_date` varchar(255) DEFAULT NULL,
  `activation_date` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `selectdepartment` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `imageupload` varchar(255) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_details`
--

INSERT INTO `client_details` (`id`, `softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location`, `selectdepartment`, `password`, `username`, `mobile`, `customer_id`, `imageupload`, `flag`) VALUES
(1, 'null', 'TEST004', 'Priyank Agrawal', 'priyank.agrawal12@gmail.com', '31 Mar 2020', '21 Mar 2020', 'Purchase,', 'Partner', 'Ghaziabad', NULL, 'Client@123', NULL, '1234567890', 1, 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/Priyank.jpg?generation=1584788149219707&alt=media', 0),
(2, 'TESTCC0002', 'TEST005', 'Mayank Goyal', 'pri.maverick@gmail.com', '31 Mar 2020', '17 Mar 2020', 'Sales,Accounts & Finance,', 'Partner', 'Ghaziabad', NULL, 'Client@123', NULL, NULL, 1, NULL, 0),
(3, 'TESTCC0003', 'EMPTEST', 'TEST', 'TEST@gmail.com', '31 Mar 2020', '21 Mar 2020', 'Purchase,', 'TEST', 'TEST', NULL, '43253097', NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `complain_list`
--

CREATE TABLE `complain_list` (
  `id` int(11) NOT NULL,
  `customer_id` int(255) DEFAULT NULL,
  `complain_id` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `situation` varchar(255) DEFAULT NULL,
  `area_of_issue` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Raised',
  `flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `documentnumberref` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complain_list`
--

INSERT INTO `complain_list` (`id`, `customer_id`, `complain_id`, `department`, `situation`, `area_of_issue`, `comment`, `status`, `flag`, `remark`, `date`, `title`, `attachment`, `documentnumberref`, `category`, `client_id`) VALUES
(1, 11, 'COM91555', NULL, NULL, 'This is description', NULL, 'Raised', NULL, NULL, '2020-03-08 16:32:24', 'Hello', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/AkashRathore(1).pdf?generation=1583685142167492&alt=media', 'ghjh', 'indexing', '1'),
(2, 33, 'COM76177', NULL, NULL, 'this is descrption', NULL, 'Complete', NULL, 'hgjhgjh', '2020-03-08 16:34:49', 'this', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/AkashRathore(1).pdf?generation=1583685286952493&alt=media', 'ref009', 'indexing', '20'),
(3, 33, 'COM2289', NULL, NULL, 'jghjg', NULL, 'Pending', NULL, 'uiyuyuy', '2020-03-08 17:47:31', 'ghjgjh', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/SOFTDOCADMIN(1)(1).pdf?generation=1583689649626305&alt=media', 'hgjg', 'indexing', NULL),
(4, 11, 'COM29334', NULL, NULL, 'This descrption', NULL, 'Raised', NULL, NULL, '2020-03-09 06:54:46', 'This is title', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/SOFTDOCADMIN(1)(1).pdf?generation=1583736884116832&alt=media', 'ref0090', 'general', NULL),
(5, NULL, 'COM73483', NULL, NULL, 'njhh', NULL, 'Raised', NULL, NULL, '2020-03-10 10:03:57', 'hhgg', '', 'bnbb', 'General', '1'),
(6, NULL, 'COM77303', NULL, NULL, 'znnsjsk', NULL, 'Raised', NULL, NULL, '2020-03-10 11:46:52', 'nsjnsjs', '', 'jsjsjs', 'Scanning', '20'),
(7, NULL, 'COM93802', NULL, NULL, 'znnsjsk', NULL, 'Raised', NULL, NULL, '2020-03-10 11:47:04', 'nsjnsjs', '', 'jsjsjs', 'Scanning', '20'),
(8, NULL, 'COM17280', NULL, NULL, 'znnsjsk', NULL, 'Raised', NULL, NULL, '2020-03-10 11:47:14', 'nsjnsjs', '', 'jsjsjs', 'Scanning', '20'),
(9, NULL, 'COM47726', NULL, NULL, 'hhgh', NULL, 'Raised', NULL, NULL, '2020-03-10 12:30:33', 'hggh', '', 'bhhh', 'Indexing', '20'),
(10, NULL, 'COM70824', NULL, NULL, 'hggggh', NULL, 'Raised', NULL, NULL, '2020-03-10 12:52:29', 'hhhh', '', 'hggg', 'Indexing', '20'),
(11, 33, 'COM68332', NULL, NULL, 'This is description', NULL, 'Raised', NULL, NULL, '2020-03-10 13:00:17', 'Hello', NULL, '7878', 'kjlkjk', '20'),
(12, 33, 'COM75075', NULL, NULL, 'This is description', NULL, 'Raised', NULL, NULL, '2020-03-10 13:01:02', 'Hello', NULL, '7878', 'kjlkjk', '20'),
(13, NULL, 'COM76355', NULL, NULL, 'bbhhj', NULL, 'Raised', NULL, NULL, '2020-03-10 13:42:37', 'hhhh', '', 'hhhh', 'Indexing', '20'),
(14, NULL, 'COM68813', NULL, NULL, 'hhhjj', NULL, 'Raised', NULL, NULL, '2020-03-10 13:43:07', 'ggg', '', 'hhj', 'Indexing', '20'),
(15, NULL, 'COM9228', NULL, NULL, 'hhhjj', NULL, 'Raised', NULL, NULL, '2020-03-10 13:43:15', 'ggg', '', 'hhj', 'Indexing', '20'),
(16, NULL, 'COM38168', NULL, NULL, 'jjjj', NULL, 'Raised', NULL, NULL, '2020-03-10 13:44:09', 'gggj', '', 'hhj', 'Indexing', '20'),
(17, 33, 'COM76490', NULL, NULL, 'this', NULL, 'Raised', NULL, NULL, '2020-03-10 13:52:55', 'ghh', '', 'refoo', 'General', '20'),
(18, 33, 'COM2743', NULL, NULL, 'this', NULL, 'Raised', NULL, NULL, '2020-03-10 13:53:11', 'ghh', '', 'refoo', 'General', '20'),
(19, 11, 'COM74182', NULL, NULL, 'hhgghh', NULL, 'Raised', NULL, NULL, '2020-03-10 17:10:15', 'hello', '', 'refoo', 'General', '1'),
(20, 33, 'COM45230', NULL, NULL, 'yyy', NULL, 'Raised', NULL, NULL, '2020-03-11 05:00:51', 'uyy', '', 'hhh', 'Indexing', '20'),
(21, 33, 'COM76179', NULL, NULL, 'there are no issue', NULL, 'Raised', NULL, NULL, '2020-03-11 09:23:45', 'refjjj', '', 'ref001', 'Indexing', '20');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `id` int(11) NOT NULL,
  `customer_number` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `billing_address_first` varchar(255) DEFAULT NULL,
  `billing_address_sec` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `company_pan` varchar(255) DEFAULT NULL,
  `gstin` varchar(255) DEFAULT NULL,
  `tan` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `company_per_name` varchar(255) DEFAULT NULL,
  `company_per_designation` varchar(255) DEFAULT NULL,
  `company_per_email` varchar(255) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `depart_info` longtext NOT NULL,
  `dpi` int(11) DEFAULT 0,
  `colour` varchar(255) DEFAULT NULL,
  `gst_certificate` longtext DEFAULT NULL,
  `pan` longtext DEFAULT NULL,
  `tan_att` longtext DEFAULT NULL,
  `signed_contract` longtext DEFAULT NULL,
  `questionnaire` longtext DEFAULT NULL,
  `others` longtext DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `modify` timestamp NULL DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `joining_date` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT 0,
  `leaving_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customeradmincode` varchar(255) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`id`, `customer_number`, `company_name`, `billing_address_first`, `billing_address_sec`, `city`, `state`, `pincode`, `company_pan`, `gstin`, `tan`, `type`, `industry`, `company_per_name`, `company_per_designation`, `company_per_email`, `mobile`, `depart_info`, `dpi`, `colour`, `gst_certificate`, `pan`, `tan_att`, `signed_contract`, `questionnaire`, `others`, `date`, `modify`, `password`, `joining_date`, `username`, `location`, `flag`, `leaving_date`, `customeradmincode`, `profile_photo`) VALUES
(1, 'C000001', 'Testing - Prism Sales', 'R-11/203', 'Raj Nagar', 'Ghaziabad', 'Uttar Pradesh', 201301, 'ACLPA8472F', '', '', 'Individual/HUF', 'Services-Others', 'Priyank Agrawal', 'Partner', 'priyank.agrawal12@gmail.com', 9311413777, 'Purchase,Sales,Accounts & Finance,', 300, 'black&white', '', '', '', '', '', '', '2020-03-17 08:03:06', '2020-03-17 08:08:56', 'Admin@123', '2020-03-17', NULL, NULL, 0, '2020-03-17 08:03:06', '', NULL),
(2, 'C000002', 'Technosters', 'rashmi vihar colony', '', 'agra', 'up', 282001, 'xyk', 'xyz', 'xyz', 'Individual/HUF', 'Manufacturing', 'Manish kumar', 'web', 'akashrathore1999.ar@gmail.com', 7906277254, 'Store,Purchase,Sales,', 200, 'black&white', '', '', '', '', '', '', '2020-03-18 07:52:58', '2020-03-21 11:14:18', '91876074', '2020-03-18', NULL, NULL, 0, '2020-03-18 07:52:57', 'TECHCA0002', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_location`
--

CREATE TABLE `customer_location` (
  `id` int(11) NOT NULL,
  `address_line_one` varchar(255) NOT NULL,
  `address_line_two` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `pickup_frequency` int(255) NOT NULL,
  `loc_person_name` varchar(255) NOT NULL,
  `loc_person_mobile` varchar(255) NOT NULL,
  `loc_person_email` varchar(255) NOT NULL,
  `loc_per_designation` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_location`
--

INSERT INTO `customer_location` (`id`, `address_line_one`, `address_line_two`, `city`, `pincode`, `date`, `pickup_frequency`, `loc_person_name`, `loc_person_mobile`, `loc_person_email`, `loc_per_designation`, `company_name`, `company_id`) VALUES
(9, 'xyz', 'xy', 'xyz', 121212, '2020-03-11', 7, 'Vikrant', '7878787878', 'vikrant@gmail.com', 'xyz', 'Technosters', 2),
(12, 'Dhoom Manikpur', '', 'Dadri', 203207, '2020-03-11', 7, 'Dummy', '1234567890', 'dummy@gmail.com', 'Dummy', 'Testing - Prism Sales', 1),
(16, 'rashmi ', 'vihar', 'agra', 282001, '2020-03-15', 7, 'mahesh kumar', '7906277254', 'akashrathore1999.ar@gmail.com', 'web', 'Technosters', 2);

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deparment`
--

CREATE TABLE `deparment` (
  `id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deparment`
--

INSERT INTO `deparment` (`id`, `department`, `industry`, `flag`) VALUES
(1, 'Store', 'Manufacturing', 1),
(2, 'Purchase', 'Manufacturing', 1),
(5, 'Production', 'Manufacturing', 1),
(6, 'Assets', 'Manufacturing', 1),
(7, 'Quality', 'Manufacturing', 0),
(8, 'Sales', 'Manufacturing', 0),
(9, 'Accounts & Finance', 'Manufacturing', 0),
(10, 'Legal', 'Manufacturing', 0),
(11, 'Hr', 'Manufacturing', 0),
(12, 'Administration', 'Manufacturing', 0),
(13, 'Purchase', 'FMCG', 0),
(14, 'Sales', 'FMCG', 0),
(15, 'Marketing', 'FMCG\r\n', 0),
(16, 'Finance & Accounts', 'FMCG', 0),
(17, 'Hr', '\r\nFMCG\r\n\r\n', 0),
(18, 'Legal', 'FMCG', 0),
(19, 'Administration', 'FMCG', 0),
(20, 'Purchase', 'Services-Others', 0),
(21, 'Sales', 'Services-Others', 0),
(22, 'Accounts & Finance', 'Services-Others', 0),
(23, 'Legal', 'Services-Others', 0),
(24, 'Hr', 'Services-Others', 0);

-- --------------------------------------------------------

--
-- Table structure for table `document_info`
--

CREATE TABLE `document_info` (
  `id` int(11) NOT NULL,
  `file_no` text DEFAULT NULL,
  `document_no` text DEFAULT NULL,
  `attachment_no` text DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `file` longtext DEFAULT NULL,
  `size` double DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) NOT NULL DEFAULT 'indexing',
  `bill_report` text DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'Unbilled',
  `billing_month` varchar(255) DEFAULT NULL,
  `questionone` varchar(255) DEFAULT NULL,
  `questiontwo` varchar(255) DEFAULT NULL,
  `questionthree` varchar(255) DEFAULT NULL,
  `questionfour` varchar(255) DEFAULT NULL,
  `questionfive` varchar(255) DEFAULT NULL,
  `questionsix` varchar(255) DEFAULT NULL,
  `questionseven` varchar(255) DEFAULT NULL,
  `hit` int(11) DEFAULT 0,
  `staff_indexing_id` int(11) NOT NULL DEFAULT 0,
  `staff_quality_id` int(11) NOT NULL DEFAULT 0,
  `remark` longtext DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `customer_code` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `employee_code` varchar(255) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `vendor_code` varchar(255) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `pickup_date` varchar(255) DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT 0,
  `scheduling_id` int(11) DEFAULT 0,
  `pickup_form` varchar(255) DEFAULT NULL,
  `payment_paid` varchar(255) DEFAULT 'Unpaid',
  `remarks` varchar(255) DEFAULT NULL,
  `history_quality` varchar(255) DEFAULT NULL,
  `history_indexing` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document_info`
--

INSERT INTO `document_info` (`id`, `file_no`, `document_no`, `attachment_no`, `company_id`, `department`, `file`, `size`, `upload_date`, `status`, `bill_report`, `payment_status`, `billing_month`, `questionone`, `questiontwo`, `questionthree`, `questionfour`, `questionfive`, `questionsix`, `questionseven`, `hit`, `staff_indexing_id`, `staff_quality_id`, `remark`, `document_type`, `customer_code`, `customer_name`, `employee_code`, `employee_name`, `date_of_joining`, `invoice_date`, `invoice_number`, `vendor_code`, `vendor_name`, `pickup_date`, `star`, `scheduling_id`, `pickup_form`, `payment_paid`, `remarks`, `history_quality`, `history_indexing`) VALUES
(1, '00014000000', NULL, NULL, 1, 'Purchase', NULL, NULL, '2020-03-18 08:54:21', 'quality', NULL, 'Unbilled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18', 0, 7, NULL, 'Unpaid', NULL, 'history_quality', 'history_indexing'),
(2, '00014000001', NULL, NULL, 1, 'Purchase', NULL, NULL, '2020-03-18 08:54:27', 'indexing', NULL, 'Unbilled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18', 0, 7, NULL, 'Unpaid', NULL, 'history_quality', 'history_indexing'),
(3, '00014000002', NULL, NULL, 1, 'Purchase', NULL, NULL, '2020-03-18 08:54:29', 'indexing', NULL, 'Unbilled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18', 0, 7, NULL, 'Unpaid', NULL, 'history_quality', 'history_indexing'),
(4, '00014000003', NULL, NULL, 1, 'Sales', NULL, NULL, '2020-03-18 08:54:32', 'indexing', NULL, 'Unbilled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18', 0, 7, NULL, 'Unpaid', NULL, 'history_quality', 'history_indexing'),
(5, '00014000004', NULL, NULL, 1, 'Sales', NULL, NULL, '2020-03-18 08:54:34', 'indexing', NULL, 'Unbilled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18', 0, 7, NULL, 'Unpaid', NULL, 'history_quality', 'history_indexing'),
(6, '00014000000', '0000000001', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318023102.pdf?generation=1584527465461235&alt=media', 0.2408924102783203, '2020-03-18 10:31:08', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 5, 0, 0, 'sb thik hai ', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2020-03-20', 'ref90', '', 'MetaTechnology', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(56, '00014000000', '0000000002', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318023048.pdf?generation=1584597303272613&alt=media', 0.25955772399902344, '2020-03-19 05:55:07', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 1, 0, 0, 'update', 'Purchase', '', '', '', '', '0001-01-01', '2018-07-30', '3781', '', '', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(57, '00014000000', '0000000003', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022954.pdf?generation=1584597434539255&alt=media', 0.2410907745361328, '2020-03-19 05:57:18', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, 'done', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-27', '3726', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(58, '00014000000', '0000000004', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022931.pdf?generation=1584597500234474&alt=media', 0.24973487854003906, '2020-03-19 05:58:23', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 1, 0, 0, 'done', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-26', '3679', '', 'SMSN Continental Pvt. Ltd.', NULL, 1, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(59, '00014000000', '0000000005', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022918.pdf?generation=1584597609140648&alt=media', 0.15612220764160156, '2020-03-19 06:00:12', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, 'ok', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-24', 'STC/18-19/972', '', 'Shalimar Trading Company -FY 18-19', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(60, '00014000000', '0000000006', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022852.pdf?generation=1584597731779423&alt=media', 0.8991737365722656, '2020-03-19 06:02:15', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-24', '153', '', 'Dixit Enterprises', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(61, '00014000000', '0000000007', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022829.pdf?generation=1584597780249040&alt=media', 0.25749778747558594, '2020-03-19 06:03:03', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-23', '3620', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(62, '00014000000', '0000000008', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022815.pdf?generation=1584597827604160&alt=media', 0.8547344207763672, '2020-03-19 06:03:50', 'return_quality', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'no', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, 'okay update', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-23', '1223', '', 'Shivani Steels', NULL, 0, 0, NULL, 'Unpaid', 'typing error', 'history_quality', 'history_indexing'),
(63, '00014000000', '0000000009', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022744.pdf?generation=1584597927403320&alt=media', 0.1345806121826172, '2020-03-19 06:05:30', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, 'okay fine', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-21', '3569', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(64, '00014000000', '00000000010', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022727.pdf?generation=1584598018445821&alt=media', 1.5810880661010742, '2020-03-19 06:07:01', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 1, 0, 0, 'okay update', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-18', 'Sheet/5400', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(65, '00014000000', '0000000011', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022706.pdf?generation=1584598825009894&alt=media', 0.1415843963623047, '2020-03-19 06:20:27', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-16', '3457', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(66, '00014000000', '0000000012', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022648.pdf?generation=1584598873859328&alt=media', 0.2698688507080078, '2020-03-19 06:21:17', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, 'ok', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-13', '3382', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(67, '00014000000', '0000000013', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022627.pdf?generation=1584598928071581&alt=media', 0.1546926498413086, '2020-03-19 06:22:11', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, 'ok', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-12', 'Sheet/5240', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(68, '00014000000', '0000000014', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022546.pdf?generation=1584599236515228&alt=media', 0.16869735717773438, '2020-03-19 06:27:20', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, 'ok', 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-12', '3358', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(69, '00014000000', '0000000015', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022527.pdf?generation=1584599288142711&alt=media', 0.22500038146972656, '2020-03-19 06:28:11', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-12', '3349', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(70, '00014000000', '0000000016', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022509.pdf?generation=1584599336592983&alt=media', 0.25562477111816406, '2020-03-19 06:29:00', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-04', '3111', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(71, '00014000000', '0000000017', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022454.pdf?generation=1584599381458032&alt=media', 0.2660999298095703, '2020-03-19 06:29:45', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-04', '3110', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(72, '00014000000', '0000000018', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022425.pdf?generation=1584599489962370&alt=media', 0.16715145111083984, '2020-03-19 06:31:33', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 'Purchase', NULL, NULL, NULL, NULL, '0001-01-01', '2018-07-02', 'Sheet/4861', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(73, '00014000000', '0000000019', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/ADMIN(4)(5)(17)(2)(1)(3).pdf?generation=1584602741981074&alt=media', 0.03025054931640625, '2020-03-19 07:25:47', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-12-31', '2020-03-19', 'ref', '34689', 'vishnu kumar', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(74, '00014000000', '0000000020', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/SOFTDOCADMIN(1)(1)(2).pdf?generation=1584602891569572&alt=media', 0.012190818786621094, '2020-03-19 07:28:16', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-12-31', '2020-03-24', 'ref', 'cod90', 'manish kumar', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(75, '00014000000', '0000000021', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/akash(1)(2)(2).pdf?generation=1584604380968725&alt=media', 0.11750507354736328, '2020-03-19 07:53:06', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', NULL, NULL, NULL, NULL, '0001-12-31', '2020-03-18', 'ref', '90909', 'mahesh kumar', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(79, '00014000000', '0000000022', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/AkashRathore(2).pdf?generation=1584609584251409&alt=media', 0.1142730712890625, '2020-03-19 09:19:47', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 2, 0, 0, NULL, 'Vendor Registration', '', '', '', '', '0001-01-01', '0001-01-01', '', 'Gghhh', 'Ghhh', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(80, '00014000000', '0000000023', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/Privacy-Policy.pdf?generation=1584610161073783&alt=media', 0.10439682006835938, '2020-03-19 09:29:24', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2020-03-20', 'Ref', 'Code800', 'Akash', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(81, '00014000000', '0000000024', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/ADMIN(4)(5)(17)(2)(1)(1)(1).pdf?generation=1584611173424696&alt=media', 0.03025054931640625, '2020-03-19 09:46:17', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2020-03-14', '898989', 'code90', 'manish', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(86, '00014000000', '0000000025', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/20200318022405.pdf?generation=1584614274842763&alt=media', 1.438150405883789, '2020-03-19 10:37:57', 'quality_approved', NULL, 'Unbilled', 'MARCH , 2020', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-07-02', 'Sheet/4861', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', '', 'history_quality', 'history_indexing'),
(114, '00022000000', NULL, NULL, 2, 'Purchase', NULL, NULL, '2020-03-22 13:56:04', 'store', NULL, 'Unbilled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-22', 0, 15, NULL, 'Unpaid', NULL, NULL, 'history_indexing'),
(115, '00022000001', NULL, NULL, 2, 'Sales', NULL, NULL, '2020-03-22 13:56:09', 'store', NULL, 'Unbilled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-22', 0, 15, NULL, 'Unpaid', NULL, NULL, NULL),
(116, '00022000002', NULL, NULL, 2, 'Store', NULL, NULL, '2020-03-22 13:56:11', 'store', NULL, 'Unbilled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-22', 0, 15, NULL, 'Unpaid', NULL, NULL, NULL),
(122, '00014000003', '0000030001', '000001', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/Screenshot(11).png?generation=1585034080335949&alt=media', 0.1916351318359375, '2020-03-24 07:14:44', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Sales', '', 'mahesh', '', '', '0001-01-01', '2020-03-26', '', '', '', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(123, '00014000003', '0000030002', '000001', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/Screenshot(5).png?generation=1585038775877531&alt=media', 0.3292713165283203, '2020-03-24 08:32:59', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Sales', '', 'MetaFor', '', '', '0001-12-31', '2020-03-24', '9090', '', '', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(124, '00014000003', '0000030003', '000001', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/CUSTOMERADMINSOFTDOC.pdf_null?generation=1585039058939155&alt=media', 0.013729095458984375, '2020-03-24 08:37:41', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 'Sales', '', 'mahesh', '', '', '0001-12-31', '2020-03-19', '', '', '', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(125, '00014000003', '0000030004', '000001', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/CUSTOMERADMINSOFTDOC.pdf_C000001?generation=1585039483549211&alt=media', 0.013729095458984375, '2020-03-24 08:44:46', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 'Customer Registration', '9090', 'mahesh', '', '', '0001-12-31', '0001-12-31', '', '', '', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(126, '00014000003', '0000030005', '000001', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_CUSTOMERADMINSOFTDOC.pdf?generation=1585041417330586&alt=media', 0.013729095458984375, '2020-03-24 09:17:00', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 'Customer Registration', '9090', 'rakesh', '', '', '0001-12-31', '0001-12-31', '', '', '', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(129, '00014000003', '0000030006', '000001', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_Screenshot(2).png?generation=1585050399612850&alt=media', 0.0746011734008789, '2020-03-24 11:46:42', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Sales', '', 'Technosters', NULL, NULL, '0001-12-31', '2020-03-18', '8989', NULL, NULL, NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(130, '00014000003', '0000030006', '000002', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_SOFTDOCSUBADMINSTORE.pdf?generation=1585050478195305&alt=media', 0.011188507080078125, '2020-03-24 11:47:59', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 'Sales', '', 'Technosters', NULL, NULL, '0001-12-31', '2020-03-18', '8989', NULL, NULL, NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(131, '00014000003', '0000030006', '000003', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_SOFTDOCADMINSOFTDOC(2).pdf?generation=1585050481313142&alt=media', 0.011651992797851562, '2020-03-24 11:48:02', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Sales', '', 'Technosters', NULL, NULL, '0001-12-31', '2020-03-18', '8989', NULL, NULL, NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(132, '00014000003', '0000030006', '000004', 1, 'Sales', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_Screenshot_20200324-172317.jpg?generation=1585051302152487&alt=media', 0.11515235900878906, '2020-03-24 12:01:43', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Sales', '', 'Technosters', '', '', '0001-12-31', '2020-03-17', '8989', '', '', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(133, '00014000001', '0000010001', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022348.pdf?generation=1585204172179963&alt=media', 0.2512989044189453, '2020-03-26 06:29:36', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-29', '2980', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(134, '00014000001', '0000010002', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022318.pdf?generation=1585204255470420&alt=media', 0.25835227966308594, '2020-03-26 06:31:00', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-26', '2865', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(135, '00014000001', '0000010003', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022258.pdf?generation=1585205051142996&alt=media', 0.2563304901123047, '2020-03-26 06:44:14', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-27', '2932', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(136, '00014000001', '0000010004', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022216.pdf?generation=1585205136673726&alt=media', 1.063852310180664, '2020-03-26 06:45:41', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-25', 'Sheet/4597', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(137, '00014000001', '0000010005', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022155.pdf?generation=1585205202743280&alt=media', 0.2278585433959961, '2020-03-26 06:46:45', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-25', 'Sheet/4597', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(138, '00014000001', '0000010006', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022134.pdf?generation=1585205323733067&alt=media', 0.2572040557861328, '2020-03-26 06:48:46', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-22', '2804', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(139, '00014000001', '0000010007', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022115.pdf?generation=1585205380914872&alt=media', 0.25658607482910156, '2020-03-26 06:49:44', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-21', '2115', '', 'SMSN Continental Pvt. ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(140, '00014000001', '0000010008', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022049.pdf?generation=1585205441547110&alt=media', 0.26642799377441406, '2020-03-26 06:50:44', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-21', '2751', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(141, '00014000001', '0000010009', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022034.pdf?generation=1585205517514792&alt=media', 0.6740617752075195, '2020-03-26 06:52:01', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-21', '1111/2018-19', '', 'Vikrant Iron Store', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(142, '00014000001', '0000010010', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318022011.pdf?generation=1585205665347371&alt=media', 0.19363784790039062, '2020-03-26 06:54:29', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-20', '2735', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(143, '00014000001', '0000010011', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021953.pdf?generation=1585205725169510&alt=media', 0.27579307556152344, '2020-03-26 06:55:28', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-13', '2616', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(144, '00014000001', '0000010012', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021909.pdf?generation=1585205782679110&alt=media', 0.14389991760253906, '2020-03-26 06:56:25', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-11', '2505', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(145, '00014000001', '0000010013', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021851.pdf?generation=1585205833672797&alt=media', 0.25435447692871094, '2020-03-26 06:57:17', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-09', '2444', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(146, '00014000001', '0000010014', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021817.pdf?generation=1585205891913718&alt=media', 0.2747058868408203, '2020-03-26 06:58:15', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-08', '2403', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(147, '00014000001', '0000010015', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021752.pdf?generation=1585205985817210&alt=media', 1.2139291763305664, '2020-03-26 06:59:48', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-07', 'Sheet/3642', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(148, '00014000001', '0000010016', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021728.pdf?generation=1585206046870967&alt=media', 0.2519817352294922, '2020-03-26 07:00:49', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-06', '2301', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(149, '00014000001', '0000010017', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021649.pdf?generation=1585206099530269&alt=media', 0.2688426971435547, '2020-03-26 07:01:43', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-06', '2288', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(150, '00014000001', '0000010018', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021621.pdf?generation=1585206150515793&alt=media', 0.19604110717773438, '2020-03-26 07:02:34', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-05', '2235', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(151, '00014000001', '0000010019', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021603.pdf?generation=1585206262407986&alt=media', 0.2635784149169922, '2020-03-26 07:04:25', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-04', '2174', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(152, '00014000001', '0000010020', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021549.pdf?generation=1585206343957667&alt=media', 0.12115287780761719, '2020-03-26 07:05:47', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-06-04', 'SRE/17-18/162', '', 'Shri Ram Enterprises', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(153, '00014000001', '0000010021', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021508.pdf?generation=1585206425363298&alt=media', 0.3571176528930664, '2020-03-26 07:07:08', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-31', '2018-19/TI/00 20', '', 'Shree Bankey Bihari Enterprises', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(154, '00014000001', '0000010022', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021445.pdf?generation=1585206490449291&alt=media', 0.8422861099243164, '2020-03-26 07:08:13', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-31', '480', '', 'Maruti Steels', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(155, '00014000001', '0000010023', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021414.pdf?generation=1585206559790369&alt=media', 1.5000944137573242, '2020-03-26 07:09:22', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-30', 'Sheet/3282', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(156, '00014000001', '0000010024', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021353.pdf?generation=1585206615766012&alt=media', 1.1718578338623047, '2020-03-26 07:10:18', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-30', 'Sheet/3281', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(157, '00014000001', '0000010025', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021325.pdf?generation=1585206679278603&alt=media', 0.9124412536621094, '2020-03-26 07:11:22', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-31', '091', '', 'Dixit Enterprises', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(158, '00014000001', '0000010026', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021258.pdf?generation=1585206731447678&alt=media', 0.2666797637939453, '2020-03-26 07:12:14', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-28', '1923', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(159, '00014000001', '0000010027', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021234.pdf?generation=1585206794753362&alt=media', 0.7522897720336914, '2020-03-26 07:13:18', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-28', '1917', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(160, '00014000001', '0000010028', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021210.pdf?generation=1585206848954965&alt=media', 0.9208869934082031, '2020-03-26 07:14:12', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-26', '082', '', 'Dixit Enterprises', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(161, '00014000001', '0000010029', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021157.pdf?generation=1585206912364147&alt=media', 0.12096595764160156, '2020-03-26 07:15:16', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-25', 'SRE/17-18/121', '', 'Shri Ram Enterprises', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(162, '00014000001', '0000010030', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021114.pdf?generation=1585206989026496&alt=media', 0.21052169799804688, '2020-03-26 07:16:32', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-24', '1785', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(163, '00014000001', '0000010031', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021039.pdf?generation=1585207043022566&alt=media', 0.8749780654907227, '2020-03-26 07:17:26', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-23', '412', '', 'Maruti Steels', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(164, '00014000001', '0000010032', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318021016.pdf?generation=1585207092441263&alt=media', 0.26474571228027344, '2020-03-26 07:18:16', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-22', '1710', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(165, '00014000001', '0000010033', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020954.pdf?generation=1585207451958993&alt=media', 0.20196533203125, '2020-03-26 07:24:15', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-19', '1564', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(166, '00014000001', '0000010034', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020935.pdf?generation=1585207502577726&alt=media', 0.26660728454589844, '2020-03-26 07:25:05', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-16', '1454', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(167, '00014000001', '0000010035', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020912.pdf?generation=1585207563844130&alt=media', 0.2758007049560547, '2020-03-26 07:26:07', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-16', '1432', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(168, '00014000001', '0000010036', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020851.pdf?generation=1585207632411247&alt=media', 1.0362520217895508, '2020-03-26 07:27:16', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-15', 'Sheet/1502', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(169, '00014000001', '0000010037', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020822.pdf?generation=1585207682084880&alt=media', 0.26231956481933594, '2020-03-26 07:28:05', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-15', '1430', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(170, '00014000001', '0000010038', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020758.pdf?generation=1585207736466192&alt=media', 0.2690296173095703, '2020-03-26 07:28:59', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-15', '1392', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(171, '00014000001', '0000010039', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020740.pdf?generation=1585207793243661&alt=media', 0.3080482482910156, '2020-03-26 07:29:56', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-14', 'Sheet/2414', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(172, '00014000001', '0000010040', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020721.pdf?generation=1585207842048455&alt=media', 0.19610977172851562, '2020-03-26 07:30:45', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-10', '1231', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(173, '00014000001', '0000010041', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020706.pdf?generation=1585207888551017&alt=media', 0.20638656616210938, '2020-03-26 07:31:31', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-09', '1209', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(174, '00014000001', '0000010042', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020646.pdf?generation=1585207937773269&alt=media', 0.20011138916015625, '2020-03-26 07:32:22', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-08', '1161', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(175, '00014000001', '0000010043', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020625.pdf?generation=1585207988544938&alt=media', 0.201263427734375, '2020-03-26 07:33:11', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-08', '1159', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(176, '00014000001', '0000010044', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020602.pdf?generation=1585208034803446&alt=media', 0.18801498413085938, '2020-03-26 07:33:57', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-07', '1151', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(177, '00014000001', '0000010045', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020534.pdf?generation=1585208089544292&alt=media', 0.1618804931640625, '2020-03-26 07:34:52', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-05', '1049', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(178, '00014000001', '0000010046', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020508.pdf?generation=1585208148544314&alt=media', 0.33339595794677734, '2020-03-26 07:35:51', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-04', '12', '', 'Shri Bankey Bihari Enterprises', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(179, '00014000001', '0000010047', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020449.pdf?generation=1585208202445290&alt=media', 0.19197845458984375, '2020-03-26 07:36:46', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-02', '951', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(180, '00014000001', '0000010048', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020412.pdf?generation=1585208254481639&alt=media', 0.18461990356445312, '2020-03-26 07:37:38', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-01', '923', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(181, '00014000001', '0000010049', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020349.pdf?generation=1585208311771512&alt=media', 0.18371963500976562, '2020-03-26 07:38:34', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-05-01', '922', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(182, '00014000001', '0000010050', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020320.pdf?generation=1585208368377666&alt=media', 1.2805500030517578, '2020-03-26 07:39:31', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-28', 'Sheet/1932', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(183, '00014000001', '0000010051', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020256.pdf?generation=1585208438198151&alt=media', 1.0814752578735352, '2020-03-26 07:40:41', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-28', 'Sheet/1901', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(184, '00014000001', '0000010052', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020206.pdf?generation=1585208553286620&alt=media', 0.18508148193359375, '2020-03-26 07:42:36', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-27', '809', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(185, '00014000001', '0000010053', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020152.pdf?generation=1585208606364246&alt=media', 0.17047882080078125, '2020-03-26 07:43:29', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-25', '751', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(186, '00014000001', '0000010054', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020127.pdf?generation=1585208659897227&alt=media', 0.17264938354492188, '2020-03-26 07:44:23', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-25', '752', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(187, '00014000001', '0000010055', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020104.pdf?generation=1585208708367934&alt=media', 0.17411041259765625, '2020-03-26 07:45:12', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-24', '711', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(188, '00014000001', '0000010056', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020038.pdf?generation=1585208767089818&alt=media', 0.18499374389648438, '2020-03-26 07:46:10', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-24', '703', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(189, '00014000001', '0000010057', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318020010.pdf?generation=1585208815634571&alt=media', 0.17831802368164062, '2020-03-26 07:46:59', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-21', '612', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(190, '00014000001', '0000010058', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015944.pdf?generation=1585208868396017&alt=media', 0.16710567474365234, '2020-03-26 07:47:51', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-18', 'Sheet/1541', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(191, '00014000001', '0000010059', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015919.pdf?generation=1585208921185664&alt=media', 0.181915283203125, '2020-03-26 07:48:44', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-18', '523', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL);
INSERT INTO `document_info` (`id`, `file_no`, `document_no`, `attachment_no`, `company_id`, `department`, `file`, `size`, `upload_date`, `status`, `bill_report`, `payment_status`, `billing_month`, `questionone`, `questiontwo`, `questionthree`, `questionfour`, `questionfive`, `questionsix`, `questionseven`, `hit`, `staff_indexing_id`, `staff_quality_id`, `remark`, `document_type`, `customer_code`, `customer_name`, `employee_code`, `employee_name`, `date_of_joining`, `invoice_date`, `invoice_number`, `vendor_code`, `vendor_name`, `pickup_date`, `star`, `scheduling_id`, `pickup_form`, `payment_paid`, `remarks`, `history_quality`, `history_indexing`) VALUES
(192, '00014000001', '0000010060', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015854.pdf?generation=1585208995155274&alt=media', 0.06497764587402344, '2020-03-26 07:49:58', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-17', 'STC/18-19/135', '', 'Shalimar Trading Company', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(193, '00014000001', '0000010061', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015829.pdf?generation=1585209372574867&alt=media', 0.8233652114868164, '2020-03-26 07:56:15', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-17', '148', '', 'Maruti Steels', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(194, '00014000001', '0000010062', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015756.pdf?generation=1585209461271583&alt=media', 0.1305866241455078, '2020-03-26 07:57:44', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-12', 'STC/18-19/098', '', 'Shalimar Trading Company', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(195, '00014000001', '0000010063', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015721.pdf?generation=1585221396711994&alt=media', 0.24059677124023438, '2020-03-26 11:16:41', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-12', '15', '', 'ARL Infratech Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(196, '00014000001', '0000010064', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015611.pdf?generation=1585221447452076&alt=media', 0.1382160186767578, '2020-03-26 11:17:31', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-03', '82', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(197, '00014000001', '0000010065', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015632.pdf?generation=1585221502819121&alt=media', 0.1716632843017578, '2020-03-26 11:18:27', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-09', '030', '', 'Tirupati Agencies', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL),
(198, '00014000001', '0000010066', '000001', 1, 'Purchase', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/C000001_20200318015526.pdf?generation=1585221561685849&alt=media', 0.1409168243408203, '2020-03-26 11:19:25', 'indexing', NULL, 'Unbilled', 'MARCH , 2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Purchase', '', '', '', '', '0001-01-01', '2018-04-03', '81', '', 'SMSN Continental Pvt. Ltd.', NULL, 0, 0, NULL, 'Unpaid', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `title`, `description`) VALUES
(1, 'What is softdoc', 'Softdoc is document Management System...'),
(2, 'Is our document safe and Secure?', 'yes.............');

-- --------------------------------------------------------

--
-- Table structure for table `fileserial`
--

CREATE TABLE `fileserial` (
  `id` int(11) NOT NULL,
  `file_no` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `logfile`
--

CREATE TABLE `logfile` (
  `id` int(11) NOT NULL,
  `loginid` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `action` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logfile`
--

INSERT INTO `logfile` (`id`, `loginid`, `ip`, `logintime`, `action`, `user_id`, `role`) VALUES
(1, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-17 07:48:34', 'superadmin  has been login', 2, 'superadmin'),
(2, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-17 07:49:02', 'update profile by superadmin', 2, 'superadmin'),
(3, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-17 07:54:10', 'superadmin has been update photo', 2, 'superadmin'),
(4, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-17 07:55:59', 'superadmin  has been login', 2, 'superadmin'),
(5, 'admin@gmail.com', '127.0.0.1', '2020-03-17 07:58:08', 'softdoc admin has been login', 1, 'admin'),
(6, 'admin@gmail.com', '192.168.1.2', '2020-03-17 13:29:28', 'softdoc admin has been login', 1, 'admin'),
(7, 'admin@gmail.com', '127.0.0.1', '2020-03-17 07:59:42', 'softdoc admin has been login', 1, 'admin'),
(8, 'admin@gmail.com', '127.0.0.1', '2020-03-17 08:03:09', 'has been create customer', 1, 'admin'),
(9, 'pri.maverick@gmail.com', '127.0.0.1', '2020-03-17 08:05:55', 'customeradmin has been login', 1, 'customeradmin'),
(10, 'pri.maverick@gmail.com', '127.0.0.1', '2020-03-17 08:07:04', 'password change by customeradmin', 1, 'customeradmin'),
(11, 'admin@gmail.com', '127.0.0.1', '2020-03-17 08:07:48', 'Has been update customer', 1, 'admin'),
(12, 'admin@gmail.com', '127.0.0.1', '2020-03-17 08:08:56', 'Has been update customer', 1, 'admin'),
(13, 'admin@gmail.com', '127.0.0.1', '2020-03-17 08:11:26', 'Has been create Subadmin', 1, 'admin'),
(14, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-17 08:12:24', 'Subadmin Store has been login', 3, 'store'),
(15, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-17 08:13:04', 'Change password by subadmin store', 3, 'store'),
(16, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-17 08:13:21', 'Subadmin Store has been login', 3, 'store'),
(17, 'admin@gmail.com', '127.0.0.1', '2020-03-17 08:14:37', 'Has been create Subadmin', 1, 'admin'),
(18, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-17 08:15:20', 'Subadmin Indexing has been login', 4, 'indexing'),
(19, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-17 08:15:51', 'Subadmin Indexing change password', 4, 'indexing'),
(20, 'admin@gmail.com', '127.0.0.1', '2020-03-17 08:16:13', 'softdoc admin has been login', 1, 'admin'),
(21, 'admin@gmail.com', '127.0.0.1', '2020-03-17 08:17:14', 'Has been create Subadmin', 1, 'admin'),
(22, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-17 08:19:37', 'Subadmin Quality has been login', 5, 'quality'),
(23, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-17 08:20:04', 'Subadmin Quality change password', 5, 'quality'),
(24, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 08:23:35', 'customeradmin has been login', 1, 'customeradmin'),
(25, 'admin@gmail.com', '127.0.0.1', '2020-03-17 08:40:20', 'softdoc admin has been login', 1, 'admin'),
(26, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 08:42:16', 'customeradmin has been login', 1, 'customeradmin'),
(27, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 09:10:19', 'customeradmin has been login', 1, 'customeradmin'),
(28, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 09:11:51', 'create customer client by customer admin', 1, 'customeradmin'),
(29, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 09:13:57', 'create customer client by customer admin', 1, 'customeradmin'),
(30, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 09:20:02', 'customerclient has been login', 1, 'client'),
(31, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 09:20:33', 'customerclient complaint', 1, 'client'),
(32, 'pri.maverick@gmail.com', '127.0.0.1', '2020-03-17 09:22:32', 'customerclient has been login', 2, 'client'),
(33, 'pri.maverick@gmail.com', '127.0.0.1', '2020-03-17 09:23:01', 'customerclient complaint', 2, 'client'),
(34, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 09:23:24', 'update profile customerclient by customer admin', 0, 'customeradmin'),
(35, 'admin@gmail.com', '127.0.0.1', '2020-03-17 09:26:24', 'softdoc admin has been login', 1, 'admin'),
(36, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 09:29:35', 'customeradmin has been login', 1, 'customeradmin'),
(37, 'admin@gmail.com', '127.0.0.1', '2020-03-17 09:31:29', 'softdoc admin has been login', 1, 'admin'),
(38, 'admin@gmail.com', '127.0.0.1', '2020-03-17 09:31:42', 'Add location of Customer', 1, 'admin'),
(39, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-17 09:32:36', 'Subadmin Store has been login', 3, 'store'),
(40, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-17 09:35:15', 'Subadmin Store has been login', 3, 'store'),
(41, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-17 09:46:54', 'superadmin  has been login', 2, 'superadmin'),
(42, 'pri.maverick@gmail.com', '127.0.0.1', '2020-03-17 09:50:39', 'customerclient has been login', 2, 'client'),
(43, 'pri.maverick@gmail.com', '127.0.0.1', '2020-03-17 09:51:21', 'customerclient has been login', 2, 'client'),
(44, 'pri.maverick@gmail.com', '127.0.0.1', '2020-03-17 10:14:49', 'customerclient has been login', 2, 'client'),
(45, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-17 10:41:47', 'customeradmin has been login', 1, 'customeradmin'),
(46, 'admin@gmail.com', '192.168.1.2', '2020-03-17 16:16:48', 'softdoc admin has been login', 1, 'admin'),
(47, 'akashrathore1999.ar@gmail.com', '192.168.1.2', '2020-03-17 16:36:59', 'superadmin  has been login', 2, 'superadmin'),
(48, 'priyank.agrawal12@gmail.com', '192.168.1.2', '2020-03-17 16:44:32', 'customeradmin has been login', 1, 'customeradmin'),
(49, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-17 11:26:00', 'Subadmin Store has been login', 3, 'store'),
(50, 'softdoc.store@gmail.com', '192.168.1.2', '2020-03-17 17:01:04', 'Subadmin Store has been login', 3, 'store'),
(51, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-17 17:03:50', 'Subadmin Indexing has been login', 4, 'indexing'),
(52, 'softdoc.quality@gmail.com', '192.168.1.2', '2020-03-17 17:08:14', 'Subadmin Quality has been login', 5, 'quality'),
(53, 'admin@gmail.com', '192.168.1.2', '2020-03-17 17:28:53', 'softdoc admin has been login', 1, 'admin'),
(54, 'priyank.agrawal12@gmail.com', '192.168.1.2', '2020-03-17 17:38:43', 'customeradmin has been login', 1, 'customeradmin'),
(55, 'akashrathore1999.ar@gmail.com', '192.168.1.2', '2020-03-17 18:12:23', 'superadmin  has been login', 2, 'superadmin'),
(56, 'softdoc.store@gmail.com', '192.168.1.2', '2020-03-17 18:19:53', 'Subadmin Store has been login', 3, 'store'),
(57, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-17 18:35:11', 'Subadmin Indexing has been login', 4, 'indexing'),
(58, 'softdoc.quality@gmail.com', '192.168.1.2', '2020-03-17 18:37:54', 'Subadmin Quality has been login', 5, 'quality'),
(59, 'pri.maverick@gmail.com', '192.168.1.2', '2020-03-17 18:46:30', 'customerclient has been login', 2, 'client'),
(60, 'admin@gmail.com', '127.0.0.1', '2020-03-18 05:05:12', 'softdoc admin has been login', 1, 'admin'),
(61, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-18 05:06:26', 'Subadmin Quality has been login', 5, 'quality'),
(62, 'admin@gmail.com', '192.168.1.2', '2020-03-18 11:49:48', 'softdoc admin has been login', 1, 'admin'),
(63, 'priyank.agrawal12@gmail.com', '192.168.1.2', '2020-03-18 11:54:18', 'customeradmin has been login', 1, 'customeradmin'),
(64, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 11:57:43', 'Subadmin Indexing has been login', 4, 'indexing'),
(65, 'admin@gmail.com', '127.0.0.1', '2020-03-18 07:32:00', 'softdoc admin has been login', 1, 'admin'),
(66, 'dummy@gmail.com', '127.0.0.1', '2020-03-18 07:32:45', 'softdocadmin update location', 1, 'admin'),
(67, 'admin@gmail.com', '127.0.0.1', '2020-03-18 07:34:22', 'softdoc admin has been login', 1, 'admin'),
(68, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 07:34:42', 'Subadmin Store has been login', 3, 'store'),
(69, 'admin@gmail.com', '127.0.0.1', '2020-03-18 07:36:01', 'Add location of Customer', 1, 'admin'),
(70, 'admin@gmail.com', '127.0.0.1', '2020-03-18 07:37:04', 'softdocadmin delete location', 1, 'admin'),
(71, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 07:37:30', 'Subadmin Store has been login', 3, 'store'),
(72, 'admin@gmail.com', '127.0.0.1', '2020-03-18 07:38:22', 'Add location of Customer', 1, 'admin'),
(73, 'admin@gmail.com', '127.0.0.1', '2020-03-18 07:39:02', 'Add location of Customer', 1, 'admin'),
(74, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 07:39:12', 'Subadmin Store has been login', 3, 'store'),
(75, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 07:40:18', 'Subadmin Store has been login', 3, 'store'),
(76, 'admin@gmail.com', '127.0.0.1', '2020-03-18 07:53:00', 'has been create customer', 1, 'admin'),
(77, 'admin@gmail.com', '127.0.0.1', '2020-03-18 07:54:44', 'Add location of Customer', 1, 'admin'),
(78, 'admin@gmail.com', '192.168.1.2', '2020-03-18 13:26:42', 'softdoc admin has been login', 1, 'admin'),
(79, 'admin@gmail.com', '192.168.1.2', '2020-03-18 13:28:21', 'Add location of Customer', 1, 'admin'),
(80, 'admin@gmail.com', '192.168.1.2', '2020-03-18 13:42:04', 'Add location of Customer', 1, 'admin'),
(81, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:14:38', 'Add location of Customer', 1, 'admin'),
(82, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:22:08', 'Add location of Customer', 1, 'admin'),
(83, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:23:10', 'Add location of Customer', 1, 'admin'),
(84, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:23:54', 'softdoc admin has been login', 1, 'admin'),
(85, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 08:27:51', 'Subadmin Store has been login', 3, 'store'),
(86, 'admin@gmail.com', '192.168.1.2', '2020-03-18 14:01:52', 'Add location of Customer', 1, 'admin'),
(87, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 08:44:07', 'Subadmin Store has been login', 3, 'store'),
(88, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 08:46:11', 'Subadmin Store has been login', 3, 'store'),
(89, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:46:26', 'softdoc admin has been login', 1, 'admin'),
(90, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:46:56', 'softdocadmin delete location', 1, 'admin'),
(91, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:47:02', 'softdocadmin delete location', 1, 'admin'),
(92, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:47:09', 'softdocadmin delete location', 1, 'admin'),
(93, 'admin@gmail.com', '127.0.0.1', '2020-03-18 08:47:53', 'Add location of Customer', 1, 'admin'),
(94, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 09:21:08', 'Subadmin Store has been login', 3, 'store'),
(95, 'admin@gmail.com', '127.0.0.1', '2020-03-18 09:21:51', 'softdoc admin has been login', 1, 'admin'),
(96, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 09:25:51', 'Subadmin Indexing has been login', 4, 'indexing'),
(97, 'softdoc.store@gmail.com', '192.168.1.2', '2020-03-18 15:42:49', 'Subadmin Store has been login', 3, 'store'),
(98, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 10:25:56', 'Subadmin Store has been login', 3, 'store'),
(99, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 10:26:46', 'subadmin store send to indexing Team', 3, 'store'),
(100, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 10:27:11', 'Subadmin Indexing has been login', 4, 'indexing'),
(101, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 10:31:08', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(102, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 10:35:08', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(103, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 10:36:26', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(104, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 10:38:11', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(105, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 10:41:08', 'Subadmin Indexing has been login', 4, 'indexing'),
(106, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 16:30:13', 'Subadmin Indexing has been login', 4, 'indexing'),
(107, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 16:38:09', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(108, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 16:40:01', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(109, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 11:11:08', 'subadmin store send to indexing Team', 3, 'store'),
(110, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 16:42:03', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(111, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 16:42:59', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(112, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 16:53:57', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(113, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 16:59:18', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(114, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:14:32', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(115, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:16:14', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(116, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:21:17', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(117, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:21:21', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(118, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:50:02', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(119, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:52:48', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(120, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:53:37', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(121, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:54:34', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(122, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:56:15', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(123, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:56:19', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(124, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 17:58:10', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(125, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 12:55:38', 'Subadmin Indexing has been login', 4, 'indexing'),
(126, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 13:03:20', 'Subadmin Store has been login', 3, 'store'),
(127, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:00:05', 'Subadmin Indexing Hit attachment', 4, 'Indexing'),
(128, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:04:54', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(129, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:06:35', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(130, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:08:32', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(131, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:08:40', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(132, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:12:30', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(133, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:13:02', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(134, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:17:12', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(135, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 19:18:35', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(136, 'admin@gmail.com', '192.168.1.2', '2020-03-18 19:49:46', 'softdoc admin has been login', 1, 'admin'),
(137, 'admin@gmail.com', '192.168.1.2', '2020-03-18 19:50:16', 'softdocadmin delete location', 1, 'admin'),
(138, 'admin@gmail.com', '192.168.1.2', '2020-03-18 19:51:07', 'Add location of Customer', 1, 'admin'),
(139, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 20:23:14', 'Subadmin Indexing Hit attachment', 4, 'Indexing'),
(140, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-18 20:26:56', 'Subadmin Indexing has been login', 4, 'indexing'),
(141, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-18 17:21:01', 'Subadmin Store has been login', 3, 'store'),
(142, 'admin@gmail.com', '127.0.0.1', '2020-03-18 17:46:09', 'softdoc admin has been login', 1, 'admin'),
(143, 'admin@gmail.com', '127.0.0.1', '2020-03-18 17:49:48', 'Add location of Customer', 1, 'admin'),
(144, 'admin@gmail.com', '127.0.0.1', '2020-03-18 17:50:26', 'softdocadmin delete location', 1, 'admin'),
(145, 'admin@gmail.com', '127.0.0.1', '2020-03-18 17:50:43', 'softdocadmin delete location', 1, 'admin'),
(146, 'admin@gmail.com', '127.0.0.1', '2020-03-18 17:51:00', 'softdocadmin delete location', 1, 'admin'),
(147, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-18 23:24:16', 'Subadmin Indexing has been login', 4, 'indexing'),
(148, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 17:57:36', 'Subadmin Indexing has been login', 4, 'indexing'),
(149, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 17:59:54', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(150, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 17:59:59', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(151, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 18:00:02', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(152, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 18:00:48', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(153, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 18:01:08', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(154, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-18 18:01:34', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(155, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 02:22:23', 'Subadmin Indexing has been login', 4, 'indexing'),
(156, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-19 02:35:06', 'Subadmin Store has been login', 3, 'store'),
(157, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-19 02:36:05', 'subadmin store send to indexing Team', 3, 'store'),
(158, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 02:37:58', 'Subadmin Indexing has been login', 4, 'indexing'),
(159, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 02:39:16', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(160, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 02:40:22', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(161, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 02:51:42', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(162, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 08:29:38', 'Subadmin Indexing has been login', 4, 'indexing'),
(163, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 03:00:45', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(164, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 08:36:03', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(165, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 08:39:43', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(166, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 08:48:46', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(167, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 08:51:09', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(168, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 08:54:27', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(169, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:17:24', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(170, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:27:44', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(171, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:31:41', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(172, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:31:46', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(173, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:35:21', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(174, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:42:53', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(175, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:45:41', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(176, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:51:02', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(177, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 09:54:22', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(178, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 10:10:11', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(179, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 10:12:00', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(180, 'softdoc.indexing@gmail.com', '192.168.1.104', '2020-03-19 10:16:21', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(181, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 05:37:07', 'Subadmin Indexing has been login', 4, 'indexing'),
(182, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-19 05:40:57', 'superadmin  has been login', 2, 'superadmin'),
(183, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-19 05:42:12', 'superadmin delete file', 2, 'superadmin'),
(184, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 05:48:29', 'Subadmin Indexing has been login', 4, 'indexing'),
(185, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 05:53:31', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(186, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 05:55:07', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(187, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 05:57:18', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(188, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 05:58:23', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(189, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:00:12', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(190, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:02:15', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(191, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:03:04', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(192, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:03:50', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(193, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:05:30', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(194, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:07:02', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(195, 'admin@gmail.com', '127.0.0.1', '2020-03-19 06:14:20', 'softdoc admin has been login', 1, 'admin'),
(196, 'admin@gmail.com', '127.0.0.1', '2020-03-19 06:15:15', 'softdocadmin has been update photo', 1, 'admin'),
(197, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-19 06:18:08', 'Subadmin Store has been login', 3, 'store'),
(198, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:20:28', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(199, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:21:17', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(200, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:22:11', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(201, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 11:55:31', 'Subadmin Indexing has been login', 4, 'indexing'),
(202, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:27:20', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(203, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:28:11', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(204, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:29:00', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(205, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:29:45', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(206, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 06:31:33', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(207, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 12:55:47', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(208, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 12:58:16', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(209, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 13:23:06', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(210, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 13:43:08', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(211, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:17:29', 'Subadmin Indexing has been login', 4, 'indexing'),
(212, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 13:54:48', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(213, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:24:54', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(214, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:25:38', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(215, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 13:56:53', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(216, 'softdoc.quality@gmail.com', '192.168.1.2', '2020-03-19 13:58:32', 'Subadmin Quality has been login', 5, 'quality'),
(217, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:29:55', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(218, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:30:45', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(219, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:33:00', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(220, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:33:47', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(221, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:34:54', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(222, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:35:26', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(223, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 14:05:53', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(224, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:35:54', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(225, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:36:26', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(226, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:36:53', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(227, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:37:20', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(228, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:37:45', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(229, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:38:10', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(230, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:38:34', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(231, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 08:38:59', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(232, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 09:18:18', 'Subadmin Indexing has been login', 4, 'indexing'),
(233, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 09:19:47', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(234, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 09:24:02', 'Subadmin Indexing has been login', 4, 'indexing'),
(235, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 09:29:24', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(236, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 09:44:52', 'Subadmin Indexing has been login', 4, 'indexing'),
(237, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 09:46:17', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(238, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 15:31:27', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(239, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 15:33:09', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(240, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 15:41:39', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(241, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 10:13:44', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(242, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 10:36:46', 'Subadmin Indexing has been login', 4, 'indexing'),
(243, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 10:37:58', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(244, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 10:39:41', 'Subadmin Indexing has been send to quality team', 4, 'Indexing'),
(245, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-19 10:45:08', 'Subadmin Quality has been login', 5, 'quality'),
(246, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-19 10:47:31', 'Subadmin Quality has been login', 5, 'quality'),
(247, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-19 10:51:32', 'Subadmin Store has been login', 3, 'store'),
(248, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 10:58:46', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(249, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-19 11:06:33', 'Subadmin Store has been login', 3, 'store'),
(250, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-19 11:07:21', 'customeradmin has been login', 1, 'customeradmin'),
(251, 'admin@gmail.com', '127.0.0.1', '2020-03-19 11:18:46', 'softdoc admin has been login', 1, 'admin'),
(252, 'admin@gmail.com', '127.0.0.1', '2020-03-19 11:24:26', 'softdoc admin has been login', 1, 'admin'),
(253, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-19 11:32:16', 'superadmin  has been login', 2, 'superadmin'),
(254, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 12:26:40', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(255, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 12:37:01', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(256, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 18:17:05', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(257, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 18:20:37', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(258, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 12:55:50', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(259, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-19 12:59:38', 'customerclient has been login', 1, 'client'),
(260, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 13:09:00', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(261, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-19 13:37:07', 'Subadmin Quality has been login', 5, 'quality'),
(262, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 13:39:40', 'Subadmin Indexing has been login', 4, 'indexing'),
(263, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 13:40:26', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(264, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 13:41:21', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(265, 'admin@gmail.com', '192.168.1.2', '2020-03-19 19:21:32', 'softdoc admin has been login', 1, 'admin'),
(266, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 13:55:45', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(267, 'softdoc.quality@gmail.com', '192.168.1.2', '2020-03-19 19:27:19', 'Subadmin Quality has been login', 5, 'quality'),
(268, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-19 14:40:35', 'Subadmin Indexing has been login', 4, 'indexing'),
(269, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 20:11:26', 'Subadmin Indexing has been login', 4, 'indexing'),
(270, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 20:12:05', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(271, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 20:15:22', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(272, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 20:16:50', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(273, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-19 14:50:47', 'customerclient has been login', 1, 'client'),
(274, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 20:25:49', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(275, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-19 14:57:42', 'Subadmin Quality has been login', 5, 'quality'),
(276, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-19 20:31:16', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(277, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-19 15:03:05', 'customerclient has been login', 1, 'client'),
(278, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-19 15:07:42', 'customeradmin has been login', 1, 'customeradmin'),
(279, 'priyank.agrawal12@gmail.com', '192.168.1.2', '2020-03-19 20:41:00', 'customeradmin has been login', 1, 'customeradmin'),
(280, 'admin@gmail.com', '127.0.0.1', '2020-03-19 15:21:20', 'softdoc admin has been login', 1, 'admin'),
(281, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-19 15:26:58', 'superadmin  has been login', 2, 'superadmin'),
(282, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-19 18:20:58', 'customeradmin has been login', 1, 'customeradmin'),
(283, 'admin@gmail.com', '127.0.0.1', '2020-03-19 18:26:00', 'softdoc admin has been login', 1, 'admin'),
(284, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-19 18:29:42', 'customeradmin has been login', 1, 'customeradmin'),
(285, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-20 00:01:07', 'customeradmin has been login', 1, 'customeradmin'),
(286, 'admin@gmail.com', '192.168.1.105', '2020-03-20 00:18:02', 'softdoc admin has been login', 1, 'admin'),
(287, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-19 18:57:40', 'Subadmin Quality has been login', 5, 'quality'),
(288, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-19 18:58:46', 'Subadmin Quality has been login', 5, 'quality'),
(289, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 02:52:36', 'customeradmin has been login', 1, 'customeradmin'),
(290, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 02:58:40', 'customerclient has been login', 1, 'client'),
(291, 'admin@gmail.com', '192.168.1.105', '2020-03-20 08:57:51', 'softdoc admin has been login', 1, 'admin'),
(292, 'softdoc.quality@gmail.com', '192.168.1.105', '2020-03-20 09:09:49', 'Subadmin Quality has been login', 5, 'quality'),
(293, 'admin@gmail.com', '127.0.0.1', '2020-03-20 03:45:35', 'softdoc admin has been login', 1, 'admin'),
(294, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-20 04:00:32', 'Subadmin Quality has been login', 5, 'quality'),
(295, 'admin@gmail.com', '192.168.1.2', '2020-03-20 11:29:56', 'softdoc admin has been login', 1, 'admin'),
(296, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-20 06:08:48', 'Subadmin Quality has been login', 5, 'quality'),
(297, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 11:44:20', 'Subadmin Indexing has been login', 4, 'indexing'),
(298, 'softdoc.quality@gmail.com', '192.168.1.2', '2020-03-20 12:02:04', 'Subadmin Quality has been login', 5, 'quality'),
(299, 'priyank.agrawal12@gmail.com', '192.168.1.2', '2020-03-20 12:31:09', 'customerclient has been login', 1, 'client'),
(300, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 13:04:49', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(301, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 13:06:10', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(302, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 13:06:14', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(303, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 07:45:11', 'Subadmin Indexing has been login', 4, 'indexing'),
(304, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-20 07:45:57', 'Subadmin Quality has been login', 5, 'quality'),
(305, 'softdoc.quality@gmail.com', '192.168.1.2', '2020-03-20 13:18:01', 'Subadmin Quality has been login', 5, 'quality'),
(306, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 07:51:02', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(307, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 07:51:34', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(308, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 07:52:11', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(309, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 07:52:48', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(310, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 08:14:37', 'customerclient has been login', 1, 'client'),
(311, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 08:15:17', 'customerclient has been login', 1, 'client'),
(312, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 08:25:25', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(313, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 08:25:23', 'customeradmin has been login', 1, 'customeradmin'),
(314, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 08:25:50', 'customerclient has been login', 1, 'client'),
(315, 'admin@gmail.com', '127.0.0.1', '2020-03-20 08:26:38', 'softdoc admin has been login', 1, 'admin'),
(316, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 08:31:51', 'Subadmin Indexing has been login', 4, 'indexing'),
(317, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-20 08:43:35', 'Subadmin Quality has been login', 5, 'quality'),
(318, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 08:48:30', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(319, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 08:56:09', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(320, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 08:58:22', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(321, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 09:00:19', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(322, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 09:09:34', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(323, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 09:14:04', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(324, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-20 09:56:40', 'Subadmin Quality has been login', 5, 'quality'),
(325, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 09:57:14', 'Subadmin Indexing has been login', 4, 'indexing'),
(326, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 09:57:51', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(327, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 10:00:29', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(328, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 15:35:05', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(329, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 10:08:08', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(330, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 15:55:45', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(331, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 15:56:49', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(332, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 15:58:29', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(333, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 15:58:33', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(334, 'softdoc.indexing@gmail.com', '192.168.1.2', '2020-03-20 15:59:08', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(335, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 10:34:01', 'customeradmin has been login', 1, 'customeradmin'),
(336, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 10:35:02', 'customerclient has been login', 1, 'client'),
(337, 'priyank.agrawal12@gmail.com', '192.168.1.2', '2020-03-20 17:19:14', 'customerclient has been login', 1, 'client'),
(338, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 11:51:53', 'customerclient has been login', 1, 'client'),
(339, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 12:45:04', 'customeradmin has been login', 1, 'customeradmin'),
(340, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 13:05:01', 'customeradmin has been login', 1, 'customeradmin'),
(341, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-20 13:06:22', 'customerclient has been login', 1, 'client'),
(342, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-20 13:18:48', 'superadmin  has been login', 2, 'superadmin'),
(343, 'admin@gmail.com', '127.0.0.1', '2020-03-20 13:19:02', 'softdoc admin has been login', 1, 'admin'),
(344, 'softdoc.quality@gmail.com ', '127.0.0.1', '2020-03-20 16:11:11', 'Subadmin Quality has been login', 5, 'quality'),
(345, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-20 22:58:43', 'customerclient has been login', 1, 'client'),
(346, 'softdoc.quality@gmail.com', '192.168.1.105', '2020-03-20 23:28:12', 'Subadmin Quality has been login', 5, 'quality'),
(347, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-20 23:33:30', 'customerclient has been login', 1, 'client'),
(348, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 18:50:42', 'Subadmin Indexing has been login', 4, 'indexing'),
(349, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 18:51:30', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(350, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-20 18:53:30', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(351, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 00:37:41', 'Subadmin Indexing has been login', 4, 'indexing'),
(352, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 00:40:17', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(353, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 01:42:43', 'Subadmin Indexing has been login', 4, 'indexing'),
(354, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 09:56:42', 'Subadmin Indexing has been login', 4, 'indexing'),
(355, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 10:09:22', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(356, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 10:13:22', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(357, 'softdoc.quality@gmail.com', '192.168.1.105', '2020-03-21 10:15:30', 'Subadmin Quality has been login', 5, 'quality'),
(358, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 10:17:39', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(359, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 10:22:11', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(360, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 10:34:23', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(361, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 10:42:10', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(362, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 10:44:11', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(363, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-21 06:35:23', 'superadmin  has been login', 2, 'superadmin'),
(364, 'admin@gmail.com', '127.0.0.1', '2020-03-21 06:37:27', 'softdoc admin has been login', 1, 'admin'),
(365, 'admin@gmail.com', '127.0.0.1', '2020-03-21 07:16:16', 'Has been create Subadmin', 1, 'admin'),
(366, 'admin@gmail.com', '127.0.0.1', '2020-03-21 07:17:47', 'Has been delete softadmin', 1, 'admin'),
(367, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 07:36:02', 'customeradmin has been login', 1, 'customeradmin'),
(368, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-21 13:15:42', 'customeradmin has been login', 1, 'customeradmin'),
(369, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-21 08:01:01', 'Subadmin Store has been login', 3, 'store'),
(370, 'admin@gmail.com', '127.0.0.1', '2020-03-21 09:30:24', 'softdoc admin has been login', 1, 'admin'),
(371, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 10:24:19', 'customeradmin has been login', 1, 'customeradmin'),
(372, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 10:33:24', 'create customer client by customer admin', 1, 'customeradmin'),
(373, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 10:33:55', 'delete customer client by customer admin', 0, 'customeradmin'),
(374, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 10:46:15', 'customerclient has been login', 1, 'client'),
(375, 'admin@gmail.com', '127.0.0.1', '2020-03-21 10:55:51', 'customer client has been update photo', 1, 'client'),
(376, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 10:57:24', 'customerclient has been updateprofile', 1, 'client'),
(377, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 11:11:36', 'update profile customerclient by customer admin', 0, 'customeradmin'),
(378, 'admin@gmail.com', '127.0.0.1', '2020-03-21 11:14:19', 'Has been update customer', 1, 'admin'),
(379, 'vikrant@gmail.com', '127.0.0.1', '2020-03-21 11:27:19', 'softdocadmin update location', 1, 'admin'),
(380, 'softdoc.quality@gmail.com', '192.168.1.105', '2020-03-21 20:51:27', 'Subadmin Quality has been login', 5, 'quality'),
(381, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 21:21:55', 'Subadmin Indexing has been login', 4, 'indexing'),
(382, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 21:23:57', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(383, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 21:24:39', 'Subadmin Indexing has been send to quality team', 4, 'Indexing'),
(384, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 21:27:21', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(385, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 21:30:02', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(386, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 21:43:02', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(387, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 22:59:07', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(388, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 22:59:35', 'Subadmin Indexing has been send to quality team', 4, 'Indexing'),
(389, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-21 23:15:20', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(390, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 00:57:15', 'Subadmin Indexing has been login', 4, 'indexing'),
(391, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 19:55:32', 'customerclient has been login', 1, 'client'),
(392, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 19:56:38', 'customerclient has been updateprofile', 1, 'client'),
(393, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-22 01:31:35', 'customerclient has been login', 1, 'client'),
(394, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-21 20:06:37', 'customerclient has been login', 1, 'client'),
(395, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-22 04:06:12', 'customerclient has been login', 1, 'client'),
(396, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-22 09:43:30', 'customerclient has been login', 1, 'client'),
(397, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 04:24:06', 'Subadmin Indexing has been login', 4, 'indexing'),
(398, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:02:56', 'Subadmin Indexing has been login', 4, 'indexing'),
(399, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:05:42', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(400, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:05:47', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(401, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:18:25', 'Subadmin Indexing has been update document', 4, 'Indexing');
INSERT INTO `logfile` (`id`, `loginid`, `ip`, `logintime`, `action`, `user_id`, `role`) VALUES
(402, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:18:53', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(403, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:19:09', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(404, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:19:32', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(405, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:19:58', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(406, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:20:20', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(407, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:21:34', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(408, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:54:35', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(409, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:55:59', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(410, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 10:58:17', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(411, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:05:26', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(412, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:05:41', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(413, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:08:34', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(414, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:08:38', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(415, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:14:37', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(416, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:16:24', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(417, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:16:27', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(418, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:17:34', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(419, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:17:41', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(420, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:19:30', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(421, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:19:33', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(422, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:23:35', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(423, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-22 11:24:00', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(424, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:07:21', 'Subadmin Indexing has been login', 4, 'indexing'),
(425, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:10:08', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(426, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:10:58', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(427, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-22 06:12:48', 'Subadmin Quality has been login', 5, 'quality'),
(428, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:13:13', 'Subadmin Indexing has been send to quality team', 4, 'Indexing'),
(429, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:14:56', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(430, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:19:33', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(431, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:19:37', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(432, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:20:36', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(433, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:20:54', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(434, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:30:16', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(435, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:31:06', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(436, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:31:33', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(437, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:31:54', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(438, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:32:18', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(439, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 06:32:28', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(440, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-22 07:38:55', 'Subadmin Quality has been login', 5, 'quality'),
(441, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 07:39:57', 'Subadmin Indexing has been login', 4, 'indexing'),
(442, 'admin@gmail.com', '127.0.0.1', '2020-03-22 08:53:30', 'softdoc admin has been login', 1, 'admin'),
(443, 'admin@gmail.com', '127.0.0.1', '2020-03-22 08:55:43', 'Add location of Customer', 1, 'admin'),
(444, 'admin@gmail.com', '127.0.0.1', '2020-03-22 09:14:05', 'softdocadmin delete location', 1, 'admin'),
(445, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 13:15:22', 'Subadmin Indexing has been login', 4, 'indexing'),
(446, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 13:17:24', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(447, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 13:18:09', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(448, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 13:18:50', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(449, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-22 13:20:34', 'Subadmin Quality has been login', 5, 'quality'),
(450, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 13:21:19', 'Subadmin Indexing has been send to quality team', 4, 'Indexing'),
(451, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 13:26:32', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(452, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 13:27:32', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(453, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-22 13:39:37', 'Subadmin Store has been login', 3, 'store'),
(454, 'admin@gmail.com', '127.0.0.1', '2020-03-22 13:48:52', 'softdoc admin has been login', 1, 'admin'),
(455, 'admin@gmail.com', '127.0.0.1', '2020-03-22 13:54:27', 'Add location of Customer', 1, 'admin'),
(456, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-22 13:58:41', 'subadmin store send to indexing Team', 3, 'store'),
(457, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 14:01:10', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(458, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 14:01:14', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(459, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 14:01:18', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(460, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 14:01:52', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(461, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 14:03:33', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(462, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 14:03:37', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(463, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 14:05:28', 'Subadmin Indexing has been send to quality team', 4, 'Indexing'),
(464, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-22 14:09:39', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(465, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-22 14:11:15', 'customerclient has been login', 1, 'client'),
(466, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-22 14:17:39', 'customeradmin has been login', 2, 'customeradmin'),
(467, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-22 20:18:49', 'customerclient has been login', 1, 'client'),
(468, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-22 15:59:04', 'customeradmin has been login', 1, 'customeradmin'),
(469, 'admin@gmail.com', '127.0.0.1', '2020-03-22 16:16:55', 'softdoc admin has been login', 1, 'admin'),
(470, 'admin@gmail.com', '192.168.1.105', '2020-03-22 21:57:54', 'softdoc admin has been login', 1, 'admin'),
(471, 'admin@gmail.com', '192.168.1.105', '2020-03-22 21:59:27', 'payment status change by softdoc admin', 1, 'admin'),
(472, 'admin@gmail.com', '192.168.1.105', '2020-03-22 22:10:26', 'payment status change by softdoc admin', 1, 'admin'),
(473, 'admin@gmail.com', '127.0.0.1', '2020-03-22 16:56:39', 'payment status change by softdoc admin', 1, 'admin'),
(474, 'admin@gmail.com', '127.0.0.1', '2020-03-22 16:57:14', 'payment status change by softdoc admin', 1, 'admin'),
(475, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-22 17:04:09', 'customeradmin has been login', 1, 'customeradmin'),
(476, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-22 17:07:38', 'customerclient has been login', 1, 'client'),
(477, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-22 20:29:13', 'customerclient has been login', 1, 'client'),
(478, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-23 10:26:24', 'Subadmin Indexing has been login', 4, 'indexing'),
(479, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-23 05:00:29', 'customerclient has been login', 1, 'client'),
(480, 'admin@gmail.com', '127.0.0.1', '2020-03-23 06:30:34', 'softdoc admin has been login', 1, 'admin'),
(481, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-23 06:35:00', 'customerclient has been login', 1, 'client'),
(482, 'admin@gmail.com', '192.168.1.105', '2020-03-23 13:13:38', 'softdoc admin has been login', 1, 'admin'),
(483, 'akashrathore1999.ar@gmail.com', '192.168.1.105', '2020-03-23 13:34:13', 'superadmin  has been login', 2, 'superadmin'),
(484, 'softdoc.store@gmail.com', '192.168.1.105', '2020-03-23 14:06:19', 'Subadmin Store has been login', 3, 'store'),
(485, 'admin@gmail.com', '192.168.1.105', '2020-03-23 14:15:27', 'softdoc admin has been login', 1, 'admin'),
(486, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-23 14:23:38', 'Subadmin Indexing has been login', 4, 'indexing'),
(487, 'softdoc.quality@gmail.com', '192.168.1.105', '2020-03-23 14:26:23', 'Subadmin Quality has been login', 5, 'quality'),
(488, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-23 14:29:14', 'Subadmin Indexing has been send to Return quality team', 4, 'Indexing'),
(489, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-23 14:40:10', 'customeradmin has been login', 1, 'customeradmin'),
(490, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-23 10:03:46', 'customerclient has been login', 1, 'client'),
(491, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-23 10:24:06', 'superadmin  has been login', 2, 'superadmin'),
(492, 'admin@gmail.com', '192.168.1.105', '2020-03-23 16:29:05', 'softdoc admin has been login', 1, 'admin'),
(493, 'softdoc.store@gmail.com', '192.168.1.105', '2020-03-23 16:30:00', 'Subadmin Store has been login', 3, 'store'),
(494, 'priyank.agrawal12@gmail.com', '192.168.1.105', '2020-03-23 16:31:53', 'customeradmin has been login', 1, 'customeradmin'),
(495, 'admin@gmail.com', '127.0.0.1', '2020-03-23 11:49:15', 'softdoc admin has been login', 1, 'admin'),
(496, 'akashrathore1999.ar@gmail.com', '192.168.1.105', '2020-03-23 17:37:08', 'superadmin  has been login', 2, 'superadmin'),
(497, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-23 18:10:56', 'Subadmin Indexing has been login', 4, 'indexing'),
(498, 'admin@gmail.com', '127.0.0.1', '2020-03-24 05:16:03', 'softdoc admin has been login', 1, 'admin'),
(499, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-24 07:12:50', 'Subadmin Indexing has been login', 4, 'indexing'),
(500, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-24 07:14:44', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(501, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 14:00:21', 'Subadmin Indexing has been login', 4, 'indexing'),
(502, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 14:02:59', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(503, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 14:07:41', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(504, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 14:08:38', 'Subadmin Indexing Hit attachment', 4, 'Indexing'),
(505, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 14:14:46', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(506, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 14:17:19', 'Subadmin Indexing Hit attachment', 4, 'Indexing'),
(507, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 14:47:00', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(508, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 14:47:56', 'Subadmin Indexing Hit attachment', 4, 'Indexing'),
(509, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 16:05:13', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(510, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 16:05:16', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(511, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 16:06:18', 'Subadmin Indexing Hit attachment', 4, 'Indexing'),
(512, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 16:06:34', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(513, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 16:06:54', 'Subadmin Indexing  delete attachment', 4, 'Indexing'),
(514, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 17:14:20', 'Subadmin Indexing has been login', 4, 'indexing'),
(515, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 17:16:42', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(516, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 17:17:59', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(517, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 17:18:02', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(518, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 17:22:38', 'Subadmin Indexing Hit attachment', 4, 'Indexing'),
(519, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 17:27:25', 'Subadmin Indexing has been update document', 4, 'Indexing'),
(520, 'softdoc.indexing@gmail.com', '192.168.1.105', '2020-03-24 17:31:43', 'Subadmin Indexing has been attachment document', 4, 'Indexing'),
(521, 'softdoc.quality@gmail.com', '127.0.0.1', '2020-03-24 12:09:57', 'Subadmin Quality has been login', 5, 'quality'),
(522, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-26 06:25:48', 'Subadmin Store has been login', 3, 'store'),
(523, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-26 06:27:22', 'subadmin store send to indexing Team', 3, 'store'),
(524, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-26 06:27:36', 'subadmin store send to indexing Team', 3, 'store'),
(525, 'softdoc.store@gmail.com', '127.0.0.1', '2020-03-26 06:27:44', 'subadmin store send to indexing Team', 3, 'store'),
(526, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:28:09', 'Subadmin Indexing has been login', 4, 'indexing'),
(527, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:29:36', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(528, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:31:00', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(529, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:44:15', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(530, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:45:41', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(531, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:46:45', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(532, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:48:46', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(533, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:49:44', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(534, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:50:44', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(535, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:52:01', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(536, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:54:29', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(537, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:55:28', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(538, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:56:26', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(539, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:57:17', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(540, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:58:15', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(541, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 06:59:49', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(542, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:00:50', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(543, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:01:44', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(544, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:02:34', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(545, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:04:25', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(546, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:05:47', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(547, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:07:08', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(548, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:08:13', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(549, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:09:23', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(550, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:10:19', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(551, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:11:22', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(552, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:12:14', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(553, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:13:18', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(554, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:14:12', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(555, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:15:16', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(556, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:16:32', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(557, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:17:26', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(558, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:18:16', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(559, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:24:15', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(560, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:25:05', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(561, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:26:07', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(562, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:27:16', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(563, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:28:05', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(564, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:28:59', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(565, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:29:56', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(566, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:30:45', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(567, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:31:31', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(568, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:32:22', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(569, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:33:11', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(570, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:33:58', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(571, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:34:52', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(572, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:35:51', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(573, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:36:46', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(574, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:37:38', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(575, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:38:35', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(576, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:39:31', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(577, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:40:41', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(578, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:42:36', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(579, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:43:29', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(580, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:44:23', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(581, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:45:12', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(582, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:46:10', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(583, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:46:59', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(584, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:47:51', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(585, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:48:44', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(586, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:49:58', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(587, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:56:15', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(588, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 07:57:44', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(589, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 11:15:05', 'Subadmin Indexing has been login', 4, 'indexing'),
(590, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 11:16:41', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(591, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 11:17:31', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(592, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 11:18:27', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(593, 'softdoc.indexing@gmail.com', '127.0.0.1', '2020-03-26 11:19:25', 'Subadmin Indexing has been upload document', 4, 'Indexing'),
(594, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-03-26 11:20:08', 'customeradmin has been login', 1, 'customeradmin'),
(595, 'admin@gmail.com', '127.0.0.1', '2020-03-26 11:20:20', 'softdoc admin has been login', 1, 'admin'),
(596, 'akashrathore1999.ar@gmail.com', '127.0.0.1', '2020-03-26 11:20:41', 'superadmin  has been login', 2, 'superadmin'),
(597, 'akashrathore1999.ar@gmail.com', '192.168.1.105', '2020-04-08 15:45:27', 'update profile by superadmin', 2, 'superadmin'),
(598, 'priyank.agrawal12@gmail.com', '127.0.0.1', '2020-11-23 12:29:47', 'customeradmin has been login', 1, 'customeradmin'),
(599, 'priyank.agrawal12@gmail.com', '192.168.43.199', '2020-11-23 12:34:13', 'customeradmin has been login', 1, 'customeradmin');

-- --------------------------------------------------------

--
-- Table structure for table `scheduling`
--

CREATE TABLE `scheduling` (
  `id` int(11) NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `pickup_date` varchar(255) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `training` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `return_to` varchar(255) DEFAULT NULL,
  `return_contact` varchar(255) DEFAULT NULL,
  `return_images` varchar(255) DEFAULT NULL,
  `loc_id` varchar(255) DEFAULT NULL,
  `pickup_form` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scheduling`
--

INSERT INTO `scheduling` (`id`, `employee_name`, `employee_id`, `company_name`, `company_id`, `pickup_date`, `return_date`, `training`, `status`, `mobile`, `images`, `return_to`, `return_contact`, `return_images`, `loc_id`, `pickup_form`, `flag`) VALUES
(1, NULL, NULL, 'Testing - Prism Sales', '1', '2020-03-17', NULL, NULL, 'store', NULL, NULL, NULL, NULL, NULL, '1', NULL, 0),
(5, NULL, NULL, 'Technosters', '2', '2020-03-19', '2020-03-26', NULL, 'store', '9719929935', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/image3.jpg?generation=1584585296438006&alt=media', NULL, NULL, NULL, '10', 'dammy ', 1),
(7, NULL, NULL, 'Testing - Prism Sales', '1', '2020-03-18', '2020-03-25', NULL, 'store', '1234567890', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/image3(2).jpg?generation=1584598513502812&alt=media', NULL, NULL, NULL, '12', 'dummy', 1),
(8, NULL, NULL, 'Testing - Prism Sales', '1', '2020-03-25', NULL, NULL, 'store', NULL, NULL, NULL, NULL, NULL, '12', NULL, 0),
(15, NULL, NULL, 'Technosters', '2', '2020-03-22', '2020-03-29', NULL, 'store', '7906255555', 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/image3.jpg?generation=1584885360189267&alt=media', NULL, NULL, NULL, '16', 'agra', 1),
(16, NULL, NULL, 'Technosters', '2', '2020-03-29', NULL, NULL, 'store', NULL, NULL, NULL, NULL, NULL, '9', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sequence`
--

CREATE TABLE `sequence` (
  `id` int(11) NOT NULL,
  `x` int(6) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sequence`
--

INSERT INTO `sequence` (`id`, `x`) VALUES
(1, 000001),
(201301, 000002),
(282001, 000003);

-- --------------------------------------------------------

--
-- Table structure for table `softdoc_staff`
--

CREATE TABLE `softdoc_staff` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `softdoc_no` varchar(255) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `joining_date` varchar(255) DEFAULT NULL,
  `activation_date` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT 0,
  `leaving_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `staff_indexing_id` int(11) DEFAULT 0,
  `staff_quality_id` int(11) DEFAULT 0,
  `profile_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `softdoc_staff`
--

INSERT INTO `softdoc_staff` (`id`, `username`, `password`, `name`, `designation`, `mobile`, `email`, `location`, `softdoc_no`, `employee_id`, `joining_date`, `activation_date`, `department`, `role`, `flag`, `leaving_date`, `staff_indexing_id`, `staff_quality_id`, `profile_photo`) VALUES
(1, NULL, 'admin', 'Akash Rathore', 'web Developer', 7906277254, 'admin@gmail.com', 'mathura', NULL, 'EMP0009', '17 Mar 2020', '17 Mar 2020', NULL, 'admin', 0, '2020-03-17 07:16:14', 0, 0, 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/image3(2).jpg?generation=1584598513502812&alt=media'),
(2, NULL, '12345', 'Akash Rathore', 'Mathematices', 7906277254, 'akashrathore1999.ar@gmail.com', 'mathura', NULL, 'emp90', '20 Mar 2020', '17 Mar 2020', 'Hr', 'superadmin', 0, '2020-03-17 07:24:23', 0, 0, 'https://www.googleapis.com/download/storage/v1/b/softdoc-262410.appspot.com/o/logo.png?generation=1584431649001608&alt=media'),
(3, NULL, 'Store@123', 'Softdoc Store', 'Store Incharge', 1234567890, 'softdoc.store@gmail.com', NULL, 'SDSS000001', 'TEST001', '31 Mar 2020', '17 Mar 2020', 'Store', 'store', 0, '2020-03-17 08:11:22', 0, 0, NULL),
(4, NULL, 'Indexing@123', 'Softdoc Indexing', 'Indexing Incharge', 1234567890, 'softdoc.indexing@gmail.com', NULL, 'SDSS000002', 'TEST002', '31 Mar 2020', '17 Mar 2020', 'Indexing', 'indexing', 0, '2020-03-17 08:14:33', 0, 0, NULL),
(5, NULL, 'Quality@123', 'Softdoc Quality', 'Quality Hero', 1234567890, 'softdoc.quality@gmail.com', NULL, 'SDSS000003', 'TEST003', '31 Mar 2020', '17 Mar 2020', 'Quality', 'quality', 0, '2020-03-17 08:17:10', 0, 0, NULL),
(6, NULL, '18428956', 'TEST', 'test', 1234567890, 'test@gmail.com', NULL, 'SDSS000004', 'TEST', '31 Mar 2020', '21 Mar 2020', 'test', 'onsite', 1, '2020-03-21 07:17:47', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadminsequence`
--

CREATE TABLE `subadminsequence` (
  `id` int(11) NOT NULL,
  `x` int(6) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subadminsequence`
--

INSERT INTO `subadminsequence` (`id`, `x`) VALUES
(20901531, 000001),
(46914734, 000002),
(58506424, 000003),
(54792828, 000004),
(18428956, 000005);

-- --------------------------------------------------------

--
-- Table structure for table `system_report`
--

CREATE TABLE `system_report` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `billing_and_unbilling` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_report`
--

INSERT INTO `system_report` (`id`, `customer_id`, `document`, `department`, `billing_and_unbilling`, `size`) VALUES
(1, 'com001', 'pdf', 'HR', 'paid', 45),
(2, 'com002', 'doc', 'HR', 'Unpaid', 45);

-- --------------------------------------------------------

--
-- Table structure for table `web_details`
--

CREATE TABLE `web_details` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_details`
--

INSERT INTO `web_details` (`id`, `description`, `type`) VALUES
(1, 'We are a large multidisciplinary team of professionals that serve as the primary mental health service for students on a diverse campus of more than 35,000. Our staff includes counselors, psychiatrists, psychologists, social workers, master’s level and pre-doctoral level trainees, and post-masters fellows, as well as an administrative support staff.   We provide personal, academic, and career counseling, outreach, groups, assessments, and consultation.', 'privacy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_details`
--
ALTER TABLE `client_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complain_list`
--
ALTER TABLE `complain_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_location`
--
ALTER TABLE `customer_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deparment`
--
ALTER TABLE `deparment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_info`
--
ALTER TABLE `document_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileserial`
--
ALTER TABLE `fileserial`
  ADD PRIMARY KEY (`file_no`);

--
-- Indexes for table `logfile`
--
ALTER TABLE `logfile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheduling`
--
ALTER TABLE `scheduling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`x`);

--
-- Indexes for table `softdoc_staff`
--
ALTER TABLE `softdoc_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subadminsequence`
--
ALTER TABLE `subadminsequence`
  ADD PRIMARY KEY (`x`);

--
-- Indexes for table `system_report`
--
ALTER TABLE `system_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_details`
--
ALTER TABLE `web_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `client_details`
--
ALTER TABLE `client_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complain_list`
--
ALTER TABLE `complain_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_location`
--
ALTER TABLE `customer_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `deparment`
--
ALTER TABLE `deparment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `document_info`
--
ALTER TABLE `document_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fileserial`
--
ALTER TABLE `fileserial`
  MODIFY `file_no` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logfile`
--
ALTER TABLE `logfile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600;

--
-- AUTO_INCREMENT for table `scheduling`
--
ALTER TABLE `scheduling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sequence`
--
ALTER TABLE `sequence`
  MODIFY `x` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `softdoc_staff`
--
ALTER TABLE `softdoc_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subadminsequence`
--
ALTER TABLE `subadminsequence`
  MODIFY `x` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_report`
--
ALTER TABLE `system_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `web_details`
--
ALTER TABLE `web_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
