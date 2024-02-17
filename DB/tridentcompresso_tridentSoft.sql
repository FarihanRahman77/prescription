-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 24, 2023 at 01:49 AM
-- Server version: 10.5.19-MariaDB-cll-lve-log
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tridentcompresso_tridentSoft`
--

-- --------------------------------------------------------

--
-- Table structure for table `annual_run_hours`
--

CREATE TABLE `annual_run_hours` (
  `id` int(11) NOT NULL,
  `hour` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `annual_run_hours`
--

INSERT INTO `annual_run_hours` (`id`, `hour`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 500, NULL, NULL, NULL),
(2, 2000, NULL, NULL, NULL),
(3, 4000, NULL, NULL, NULL),
(4, 6000, NULL, NULL, NULL),
(5, 8000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `application_types`
--

CREATE TABLE `application_types` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `application_types`
--

INSERT INTO `application_types` (`id`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Chemical and Pharmaceutical Industry', NULL, NULL, NULL),
(2, 'Plastic Industry', NULL, NULL, NULL),
(3, 'Printing and Paper Industry', NULL, NULL, NULL),
(4, 'Non food packaging Industry', NULL, NULL, NULL),
(5, 'Food  packaging Industry', NULL, NULL, NULL),
(6, 'Environment Engineering', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('pre_filled','fillable') DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `deleted` enum('Yes','No') DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_date` varchar(50) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_date` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `status`, `deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted_by`, `deleted_date`, `created_at`, `updated_at`) VALUES
(1, 'Compressor', 'pre_filled', 'Inactive', 'Yes', 1, NULL, NULL, NULL, 1, '23-09-2023', '2023-04-05 00:55:43', '2023-09-23 10:23:17'),
(2, 'Dryer Refrigerant', 'fillable', 'Active', 'No', 1, NULL, 1, '05-10-2023', NULL, NULL, '2023-04-05 01:27:10', '2023-10-05 09:52:46'),
(3, 'Nitrogen Generator', 'fillable', 'Active', 'No', 1, NULL, NULL, NULL, NULL, NULL, '2023-04-05 01:30:23', '2023-04-05 01:30:23'),
(6, 'Piston Compressor', 'fillable', 'Inactive', 'Yes', 1, NULL, 1, '31-07-2023', 1, '03-08-2023', '2023-04-05 01:32:27', '2023-08-03 11:08:52'),
(7, 'Tools', 'fillable', 'Inactive', 'No', 1, NULL, 1, '23-07-2023', NULL, NULL, '2023-04-05 01:33:11', '2023-07-23 10:24:58'),
(17, 'Dryer India', 'pre_filled', 'Inactive', 'No', 1, NULL, 1, '31-07-2023', 1, '05-04-2023', '2023-04-05 03:44:04', '2023-07-31 08:30:11'),
(18, 'NO Test', 'fillable', 'Inactive', 'Yes', 1, NULL, NULL, NULL, 1, '01-06-2023', '2023-06-01 08:49:13', '2023-06-01 08:49:31'),
(19, 'Test Category', 'fillable', 'Inactive', 'Yes', 1, NULL, NULL, NULL, 1, '03-08-2023', '2023-07-31 08:31:38', '2023-08-03 11:09:02'),
(20, 'Screw Compressor', 'fillable', 'Active', 'No', 1, NULL, 1, '05-10-2023', NULL, NULL, '2023-10-05 08:06:52', '2023-10-05 08:08:29'),
(21, 'Water Injected Compressor', 'fillable', 'Active', 'No', 1, NULL, NULL, NULL, NULL, NULL, '2023-10-05 08:07:14', '2023-10-05 08:07:14'),
(22, 'Dryer Desiccant', 'fillable', 'Active', 'No', 1, NULL, NULL, NULL, NULL, NULL, '2023-10-05 09:53:09', '2023-10-05 09:53:09'),
(23, 'Test Category 4', 'fillable', 'Inactive', 'No', 1, NULL, 24, '18-10-2023', NULL, NULL, '2023-10-16 09:09:49', '2023-10-18 07:35:58'),
(24, 'test category 101', 'pre_filled', 'Inactive', 'No', 24, NULL, 24, '18-10-2023', NULL, NULL, '2023-10-18 07:35:30', '2023-10-18 07:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `id` bigint(20) NOT NULL,
  `reg_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `claim_serial` varchar(255) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `serial_key` varchar(255) DEFAULT NULL,
  `claim_reference` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `run_hour` bigint(20) DEFAULT NULL,
  `operating_hours_last_service` bigint(20) DEFAULT NULL,
  `claim_attachment` varchar(250) DEFAULT NULL,
  `comission_date` varchar(50) DEFAULT NULL,
  `failure_date` varchar(50) DEFAULT NULL,
  `work_done_date` varchar(50) DEFAULT NULL,
  `defect_details` longtext DEFAULT NULL,
  `defect_issue` longtext DEFAULT NULL,
  `defect_code` bigint(20) DEFAULT NULL,
  `oil_consumption` varchar(255) DEFAULT NULL,
  `ambient_temperature` varchar(255) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `service_by` varchar(255) DEFAULT NULL,
  `action_taken` varchar(255) DEFAULT NULL,
  `type` enum('saved','unsaved','completed','pending') NOT NULL,
  `grand_total` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `vat_percentage` float DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `claim_type` enum('Service','Claim') DEFAULT NULL,
  `engineer_id` bigint(20) DEFAULT NULL,
  `status` enum('Open','Approved','Denied','Active','Inactive') DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `updated_at` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `claims`
--

INSERT INTO `claims` (`id`, `reg_id`, `customer_id`, `claim_serial`, `year`, `serial_key`, `claim_reference`, `model`, `run_hour`, `operating_hours_last_service`, `claim_attachment`, `comission_date`, `failure_date`, `work_done_date`, `defect_details`, `defect_issue`, `defect_code`, `oil_consumption`, `ambient_temperature`, `currency`, `service_by`, `action_taken`, `type`, `grand_total`, `vat`, `vat_percentage`, `remarks`, `claim_type`, `engineer_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 40, 19, '000001', '2023', 'WC', 'bh564u56u56', 'GT_4894841', 550, 800, NULL, NULL, '2023-10-03', '2023-10-04', 'jsnfsn g', 'fsngfsngf', NULL, '50', '41', 'BDT', 'syed', 'gsfngfs ngfs', 'saved', 13000.00, 975.00, NULL, NULL, 'Claim', 1, 'Inactive', '2023-10-04 04:15:01', '2023-10-21 09:25:33'),
(2, 45, 6, '000002', '2023', 'WS', NULL, 'TYX-180', 890, NULL, NULL, '2023-09-02', NULL, '2023-10-04', NULL, NULL, NULL, NULL, NULL, NULL, '4', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 4, 'Active', '2023-10-04 04:19:19', '2023-10-04 04:19:19'),
(3, 45, 6, '000003', '2023', 'WS', NULL, 'TYX-180', 580, NULL, NULL, '2023-09-02', NULL, '2023-10-04', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 4, 'Active', '2023-10-04 04:24:18', '2023-10-04 04:24:18'),
(4, 45, 6, '000004', '2023', 'WS', NULL, 'TYX-180', 500, NULL, NULL, '2023-09-02', NULL, '2023-10-04', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 4, 'Active', '2023-10-04 04:43:11', '2023-10-04 04:43:11'),
(5, 45, 6, '000005', '2023', 'WS', NULL, 'TYX-180', 8972, NULL, NULL, '2023-09-02', NULL, '2023-10-04', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 4, 'Active', '2023-10-04 08:12:48', '2023-10-04 08:12:48'),
(6, 51, 30, '000006', '2023', 'WC', 'TWC-20230817/COOLIN FAN.01', 'TAS-100PMC_75KW_380V_IP55', 3879, 2000, NULL, NULL, '2023-08-17', '2023-09-17', 'Cooling fan motor and magnetic contactor burn.', 'Cooling fan motor and magnetic contactor burn.', NULL, '33', '35', 'BDT', 'SAYED AL HOSSAIN', 'Cooling fan motor and magnetic contactor replaced from Trident stock.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 1, 'Approved', '2023-10-07 05:45:29', '2023-12-13 06:44:16'),
(7, 59, 35, '000007', '2023', 'WC', 'TWC-20230916/Motor15kW.01', 'TAS-20HB', 148, 0, NULL, NULL, '2023-09-16', '2023-09-22', 'Main Motor Damage', 'Main Motor Damage', NULL, NULL, NULL, 'BDT', 'SAYED AL HOSSAIN', 'Main motor repaired from Trident stock.', 'saved', 1200.00, 90.00, NULL, NULL, 'Claim', 1, 'Inactive', '2023-10-10 05:40:03', '2023-12-13 06:23:17'),
(8, 105, 57, '000008', '2023', 'WS', NULL, 'TAS-30HB', 2045, NULL, NULL, '2022-11-20', NULL, '2023-10-10', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 4, 'Active', '2023-10-10 06:57:55', '2023-10-10 06:57:55'),
(9, 40, 19, '000009', '2023', 'WC', '979898', 'GT_4894841', 200, 550, NULL, NULL, '2023-10-18', '2023-10-27', 'yfyfyfyfyfyfy', '7776rftyffdjdgfxfgxgfxgfcjgcgfcgh', NULL, '200', '26', 'BDT', 'test provider', 'fuy fty fuyfyti', 'saved', NULL, NULL, NULL, NULL, 'Claim', 1, 'Inactive', '2023-10-16 05:07:09', '2023-10-31 05:13:00'),
(10, 113, 63, '000010', '2023', 'WS', NULL, 'TAS-75PMC', 4050, NULL, NULL, '2022-09-05', NULL, '2023-10-16', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-16 09:46:19', '2023-10-16 09:46:19'),
(11, 76, 43, '000011', '2023', 'WS', NULL, 'TAS-75PMC', 1990, NULL, NULL, '2023-03-12', NULL, '2023-10-16', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-16 10:11:44', '2023-10-16 10:11:44'),
(12, 49, 28, '000012', '2023', 'WS', NULL, 'TAS-60PMC', 2277, NULL, NULL, '2023-05-14', NULL, '2023-10-16', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-16 10:22:09', '2023-10-16 10:22:09'),
(13, 125, 70, '000013', '2023', 'WS', NULL, 'TAS-60PMC', 6110, NULL, NULL, '2022-09-29', NULL, '2023-10-16', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-16 10:36:19', '2023-10-16 10:36:19'),
(14, 96, 52, '000014', '2023', 'WS', NULL, 'AS-60PMC', 4823, NULL, NULL, '2022-04-27', NULL, '2023-10-16', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-16 10:49:45', '2023-10-16 10:49:45'),
(15, 105, 57, '000015', '2023', 'WS', NULL, 'TAS-30HB', 2045, NULL, NULL, '2022-11-20', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-17 04:51:20', '2023-10-17 04:51:20'),
(16, 116, 65, '000016', '2023', 'WC', 'test 3457', 'TAS-20HB', 500, 700, NULL, NULL, '2023-10-17', '2023-10-18', 'fuigiufdsa', 'hshgsfhgfd', NULL, '45', '26', 'BDT', 'test provider', 'done', 'saved', NULL, NULL, NULL, NULL, 'Claim', 1, 'Inactive', '2023-10-17 04:54:19', '2023-10-31 05:12:15'),
(17, 100, 54, '000017', '2023', 'WS', NULL, 'TAS-100HVF', 4001, NULL, NULL, '2022-09-06', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-17 05:00:35', '2023-10-17 05:00:35'),
(18, 59, 35, '000018', '2023', 'WC', 'TWC-20230916', 'TAS-20HB', 148, 0, NULL, NULL, '2023-09-16', '2023-09-18', 'Main Motor Damage', 'Main Motor Damage', NULL, '15', '35', 'BDT', 'SAYED ALL HOSSAIN', 'Main motor replaced', 'saved', 600.00, 45.00, NULL, NULL, 'Claim', 1, 'Open', '2023-10-17 05:12:37', '2023-10-17 06:30:51'),
(19, 124, 69, '000019', '2023', 'WC', 'TWC-20221105', 'TAS-50PMC_37KW_380V_IP55', 1541, 0, NULL, NULL, '2022-11-05', '2022-11-05', 'Cooling fan motor bearing problem', 'Cooling fan motor bearing problem', NULL, NULL, '35', 'BDT', 'SAYED ALL HOSSAIN', 'Cooling fan bearing replaced from Trident Stock. Warranty new cooling fan received on 03.01.2023 and settled 03.11.2023.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 1, 'Approved', '2023-10-17 06:29:00', '2023-11-26 06:03:11'),
(20, 129, 72, '000020', '2023', 'WS', NULL, 'TAC-75', 400, NULL, NULL, '2023-04-17', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 11, 'Active', '2023-10-17 07:51:42', '2023-10-17 07:51:42'),
(21, 90, 12, '000021', '2023', 'WC', 'TWC-20221115', 'TAS-175PMC', 922, 0, NULL, NULL, '2022-11-15', '2022-11-20', 'VFD burned', 'VFD burned', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'New VFD 160kW replaced', 'saved', NULL, NULL, NULL, NULL, 'Claim', 1, 'Open', '2023-10-17 08:38:42', '2023-10-21 06:28:14'),
(22, 125, 70, '000022', '2023', 'WC', 'TWC-20230526', 'TAS-60PMC_45KW_380V_IP55', 4510, 4000, NULL, NULL, '2023-05-26', '2023-05-29', 'Inverter Burnt', 'During normal operation Inverter Burnt', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'New VFD 55kW replaced from Trident stock.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 1, 'Approved', '2023-10-17 08:50:55', '2023-12-13 06:07:01'),
(23, 63, 37, '000023', '2023', 'WS', NULL, 'TAS-60PMC', 2426, NULL, NULL, '2022-08-29', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-17 09:04:51', '2023-10-17 09:04:51'),
(24, 63, 37, '000024', '2023', 'WS', NULL, 'TAS-60PMC', 4638, NULL, NULL, '2022-08-29', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-17 09:06:21', '2023-10-17 09:06:21'),
(25, 63, 37, '000025', '2023', 'WS', NULL, 'TAS-60PMC', 6521, NULL, NULL, '2022-08-29', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-17 09:13:40', '2023-10-17 09:13:40'),
(26, 123, 69, '000026', '2023', 'WC', 'TWC-20221128', 'TAS-50PMC_37KW_380V_IP55', 1899, 0, NULL, NULL, '2022-11-28', '2022-11-29', 'Cooling fan motor bearing & Cooling fan problem', 'Cooling fan motor bearing & Cooling fan problem', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Cooling fan motor bearing & Cooling fan replaced from Trident stock. Warranty new cooling fan received on 03.01.2023 and sattled payment 03.01.2023.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 1, 'Approved', '2023-10-17 09:17:09', '2023-11-26 07:12:26'),
(27, 66, 39, '000027', '2023', 'WS', NULL, 'TAS-100PMC', 1940, NULL, NULL, '2022-08-16', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-17 09:19:31', '2023-10-17 09:19:31'),
(28, 77, 43, '000028', '2023', 'WC', 'TWC-20230930', 'TYX-110', 2110, 0, NULL, NULL, '2023-09-30', '2023-10-01', 'Desiccant dryer dew point sensor problem', 'Desiccant dryer dew point sensor problem', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Desiccant dryer dew point sensor replaced', 'saved', NULL, NULL, NULL, NULL, 'Claim', 1, 'Open', '2023-10-17 09:32:16', '2023-10-26 09:38:01'),
(29, 71, 41, '000029', '2023', 'WS', NULL, 'TAS-40HB', 2067, NULL, NULL, '2023-01-07', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-17 09:38:37', '2023-10-17 09:38:37'),
(30, 71, 41, '000030', '2023', 'WS', NULL, 'TAS-40HB', 4098, NULL, NULL, '2023-01-07', NULL, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-17 09:41:50', '2023-10-17 09:41:50'),
(31, 49, 28, '000031', '2023', 'WS', NULL, 'TAS-60PMC', 2277, NULL, NULL, '2023-05-14', NULL, '2023-10-21', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-21 06:12:53', '2023-10-21 06:12:53'),
(32, 54, 32, '000032', '2023', 'WS', NULL, 'TAS-20PMC', 2067, NULL, NULL, '2023-01-01', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-23 06:11:32', '2023-10-23 06:11:32'),
(33, 63, 37, '000033', '2023', 'WS', NULL, 'TAS-60PMC', 2426, NULL, NULL, '2022-08-29', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-23 06:28:08', '2023-10-23 06:28:08'),
(34, 63, 37, '000034', '2023', 'WS', NULL, 'TAS-60PMC', 4638, NULL, NULL, '2022-08-29', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-23 06:29:56', '2023-10-23 06:29:56'),
(35, 125, 70, '000035', '2023', 'WS', NULL, 'TAS-60PMC', 2218, NULL, NULL, '2022-09-29', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-23 06:54:43', '2023-10-23 06:54:43'),
(36, 125, 70, '000036', '2023', 'WS', NULL, 'TAS-60PMC', 4304, NULL, NULL, '2022-09-29', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-23 06:56:26', '2023-10-23 06:56:26'),
(37, 79, 45, '000037', '2023', 'WS', NULL, 'TAS-40PMC', 2108, NULL, NULL, '2022-04-18', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-23 08:37:14', '2023-10-23 08:37:14'),
(38, 79, 45, '000038', '2023', 'WS', NULL, 'TAS-40PMC', 4088, NULL, NULL, '2022-04-18', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-10-23 08:39:00', '2023-10-23 08:39:00'),
(40, 90, 12, '000039', '2023', 'WS', NULL, 'TAS-175PMC', 2108, NULL, NULL, '2022-09-13', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '2000 Hours service completed', 'Service', 5, 'Active', '2023-10-23 09:33:12', '2023-10-23 09:33:12'),
(41, 90, 12, '000040', '2023', 'WS', NULL, 'TAS-175PMC', 3727, NULL, NULL, '2022-09-13', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '4000 Hours service completed.', 'Service', 5, 'Active', '2023-10-23 09:39:13', '2023-10-23 09:39:13'),
(42, 90, 12, '000041', '2023', 'WS', NULL, 'TAS-175PMC', 6602, NULL, NULL, '2022-09-13', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '6000 Hours service completed.', 'Service', 5, 'Active', '2023-10-23 09:44:19', '2023-10-23 09:44:19'),
(43, 96, 52, '000042', '2023', 'WS', NULL, 'AS-60PMC', 2115, NULL, NULL, '2022-04-27', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '2000hrs service compreted.', 'Service', 5, 'Active', '2023-10-23 09:51:47', '2023-10-23 09:51:47'),
(44, 100, 54, '000043', '2023', 'WS', NULL, 'TAS-100HVF', 2084, NULL, NULL, '2022-09-06', NULL, '2023-10-23', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '2000hrs service completed', 'Service', 5, 'Active', '2023-10-23 10:30:19', '2023-10-23 10:30:19'),
(45, 106, 58, '000044', '2023', 'WS', NULL, 'TAS-100PMC', 2315, NULL, NULL, '2022-06-29', NULL, '2023-10-25', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '2000 Hours service completed', 'Service', 5, 'Active', '2023-10-25 05:07:01', '2023-10-25 05:07:01'),
(46, 107, 58, '000045', '2023', 'WC', 'TWC-20230605', 'TAC-150', 6674, 8000, NULL, NULL, '2023-06-05', '2023-06-10', 'Dryer Condenser Leakage.', 'Dryer Condenser Leakage.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Dryer Condenser repairing', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Active', '2023-10-25 07:53:56', '2023-10-26 08:15:49'),
(47, 54, 32, '000046', '2023', 'WS', NULL, 'TAS-20PMC', 4165, NULL, NULL, '2023-01-01', NULL, '2023-10-31', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '4000 Hrs Service Completed.', 'Service', 5, 'Active', '2023-10-31 06:39:47', '2023-10-31 06:39:47'),
(48, 121, 68, '000047', '2023', 'WS', NULL, 'TAS-100PMC', 2054, NULL, NULL, '2022-10-12', NULL, '2023-11-01', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-11-01 08:53:11', '2023-11-01 08:53:11'),
(49, 121, 68, '000048', '2023', 'WS', NULL, 'TAS-100PMC', 3981, NULL, NULL, '2022-10-12', NULL, '2023-11-01', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-11-01 08:55:26', '2023-11-01 08:55:26'),
(50, 121, 68, '000049', '2023', 'WS', NULL, 'TAS-100PMC', 8503, NULL, NULL, '2022-10-12', NULL, '2023-11-01', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-11-01 09:05:01', '2023-11-01 09:05:01'),
(51, 117, 66, '000050', '2023', 'WS', NULL, 'TAS-75PMC', 2023, NULL, NULL, '2023-05-13', NULL, '2023-11-04', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-11-04 06:54:22', '2023-11-04 06:54:22'),
(52, 124, 69, '000051', '2023', 'WC', 'TWC-20231031', 'TAS-50PMC', 4734, 4000, NULL, NULL, '2023-10-31', '2023-11-07', 'Cooling Fan Abnormal Sound.', 'Cooling Fan Abnormal Sound.', NULL, NULL, '35', 'BDT', 'SAYED ALL HOSSAIN', 'Cooling fan replaced from Trident stock.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-11 06:20:13', '2023-11-11 06:20:13'),
(53, 112, 62, '000052', '2023', 'WS', NULL, 'TAS-100PMC', 2027, NULL, NULL, '2023-06-01', NULL, '2023-11-11', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 13, 'Active', '2023-11-11 08:22:27', '2023-11-11 08:22:27'),
(54, 63, 37, '000053', '2023', 'WS', NULL, 'TAS-60PMC', 8273, NULL, NULL, '2022-08-29', NULL, '2023-11-13', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 7, 'Active', '2023-11-13 04:52:21', '2023-11-13 04:52:21'),
(55, 108, 59, '000054', '2023', 'WS', NULL, 'TAS-100PMC', 2679, NULL, NULL, '2022-03-22', NULL, '2023-11-20', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '2000Hrs Service Completed', 'Service', 14, 'Active', '2023-11-20 04:10:39', '2023-11-20 04:10:39'),
(56, 108, 59, '000055', '2023', 'WS', NULL, 'TAS-100PMC', 4088, NULL, NULL, '2022-03-22', NULL, '2023-11-20', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, '4000Hrs Service Completed', 'Service', 7, 'Active', '2023-11-20 04:13:43', '2023-11-20 04:13:43'),
(57, 108, 59, '000056', '2023', 'WS', NULL, 'TAS-100PMC', 6060, NULL, NULL, '2022-03-22', NULL, '2023-11-20', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 5, 'Active', '2023-11-20 04:15:53', '2023-11-20 04:15:53'),
(58, 108, 59, '000057', '2023', 'WS', NULL, 'TAS-100PMC', 8016, NULL, NULL, '2022-03-22', NULL, '2023-11-20', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 14, 'Active', '2023-11-20 04:18:21', '2023-11-20 04:18:21'),
(59, 96, 52, '000058', '2023', 'WS', NULL, 'AS-60PMC', 6149, NULL, NULL, '2022-04-27', NULL, '2023-11-20', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 14, 'Active', '2023-11-20 04:37:01', '2023-11-20 04:37:01'),
(60, 98, 53, '000059', '2023', 'WS', NULL, 'TAS-30HB', 2200, NULL, NULL, '2023-05-16', NULL, '2023-11-20', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 7, 'Active', '2023-11-20 06:30:29', '2023-11-20 06:30:29'),
(61, 73, 41, '000060', '2023', 'WS', NULL, 'TAS-40HB_30KW_380V_IP55', 2575, NULL, NULL, '2023-05-12', NULL, '2023-11-21', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 15, 'Active', '2023-11-21 08:45:48', '2023-11-21 08:45:48'),
(62, 92, 50, '000061', '2023', 'WS', NULL, 'TAS-175PMC_132KW_380V_IP55', 1847, NULL, NULL, '2023-08-03', NULL, '2023-11-21', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 15, 'Active', '2023-11-21 08:53:30', '2023-11-21 08:53:30'),
(63, 90, 12, '000062', '2023', 'WS', NULL, 'TAS-175PMC_132KW_380V_IP55', 8330, NULL, NULL, '2022-09-13', NULL, '2023-11-21', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 15, 'Active', '2023-11-21 09:11:23', '2023-11-21 09:11:23'),
(64, 105, 57, '000063', '2023', 'WC', 'TWC-20230902', 'TAS-30HB_22KW_380V_IP55', 1899, 0, NULL, NULL, '2023-09-02', '2023-09-17', 'Airend abnormal sound.', 'Airend Problem', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Airend replaced from Trident stock. Warranty new airend received 18.11.2023', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Approved', '2023-11-22 10:31:48', '2023-11-26 05:45:43'),
(65, 105, 57, '000064', '2023', 'WC', 'TWC-20230829', 'TAS-30HB_22KW_380V_IP55', 1890, 0, NULL, NULL, '2023-08-29', '2023-09-01', 'Transformer Damage', 'Transformer Damage', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Transformer replaced from Trident stock.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Denied', '2023-11-22 10:40:13', '2023-12-13 06:05:27'),
(66, 67, 39, '000065', '2023', 'WC', 'TWC-20231107', 'TAC-150_(20 m³/min)_380V_50HZ', 3344, 2000, NULL, NULL, '2023-11-07', '2023-11-13', 'Dryer dew point high and Dryer compressor abnormal sound.', 'Dryer dew point high and Dryer compressor abnormal sound.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Dryer compressor replaced from Trident stock.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-23 06:46:55', '2023-11-23 06:46:55'),
(67, 108, 59, '000066', '2023', 'WC', 'TFR-20230224', 'TAS-100PMC_75KW_380V_IP55', 5300, 4000, NULL, NULL, '2023-02-24', '2023-03-10', 'The oil cooler leaking and oil is dropping.', 'The oil cooler leaking and oil is dropping.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Oil cooler assembly', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-23 08:06:59', '2023-11-23 08:06:59'),
(68, 96, 52, '000067', '2023', 'WC', 'TWC-20231010', 'AS-60PMC_45KW_380V_IP55', 5514, 4000, NULL, NULL, '2023-10-10', '2023-10-13', 'During normal operation Inverter Burnt.', 'During normal operation Inverter Burnt.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'New Inverter 55kW/75KW replaced fromTrident store. Problem solved.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-23 08:17:49', '2023-11-23 08:17:49'),
(69, 147, 37, '000068', '2023', 'WC', 'TWC-20220906', 'TAS-60 PMC_45KW_380V_IP55', 118, 0, NULL, NULL, '2022-09-06', '2022-10-06', 'Airend assembly mismach in size. Received from under warranty.', 'Airend assembly mismach in size. Received from under warranty.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Airend repair from local market.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-23 08:49:34', '2023-11-23 08:49:34'),
(70, 124, 69, '000069', '2023', 'WC', 'TWC-20231121', 'TAS-50PMC_37KW_380V_IP55', 4839, 4000, NULL, NULL, '2023-11-21', '2023-11-23', 'Airend to reclaimer vessel delivery line pipe oil leakage.', 'Airend to reclaimer vessel delivery line pipe oil leakage.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Airend to reclaimer vessel delivery line pipe replaced. Problem solved.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-23 10:16:04', '2023-11-23 10:16:04'),
(71, 67, 39, '000070', '2023', 'WC', 'TFR-20231113', 'TAC-150_(20 m³/min)_380V_50HZ', 3421, 2000, NULL, NULL, '2023-11-13', '2023-11-20', 'Dryer evaporator leakage.', 'Dryer evaporator repairing.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Dryer evaporator repairing.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-27 06:40:19', '2023-11-27 06:40:19'),
(72, 76, 43, '000071', '2023', 'WC', 'TFR-20231122', 'TAS-75PMC_55KW_380V_IP55', 2818, 2000, NULL, NULL, '2023-11-22', '2023-11-23', 'Transformer problem.', 'Transformer problem.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Transformer(GZ-Transformer JBK3-80,50 Hz, I/O=380V,O/P=220V), Fuse,Solenoid Valve and Techlon Tube replaced from trident stock. Problem solved.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-27 07:02:47', '2023-11-27 07:02:47'),
(73, 49, 28, '000072', '2023', 'WS', NULL, 'TAS-60PMC_45KW_380V_IP55', 3615, NULL, NULL, '2023-05-14', NULL, '2023-11-27', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, 'Oil temperature high advance 4000hrs service with oil replaced.', 'Service', 15, 'Active', '2023-11-27 07:13:25', '2023-11-27 07:13:25'),
(74, 106, 58, '000073', '2023', 'WC', 'TWC-20231030', 'TAS-100PMC_75KW_380V_IP55', 9495, 8000, NULL, NULL, '2023-10-30', '2023-11-21', 'Delivery pipe line leakage.', 'Delivery pipe line leakage.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Delivery pipe replaced from trident stock & Problem solved. (TAS-100PMC_75kW, 22040104, 380V/50Hz)', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-29 08:49:17', '2023-11-29 08:49:17'),
(75, 106, 58, '000074', '2023', 'WC', 'TWC-20230112', 'TAS-100PMC_75KW_380V_IP55', 4403, 2000, NULL, NULL, '2023-01-12', '2023-02-11', 'From the airend body air discharge side oil is leaking.', 'Airend repairing.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Airend repairing & Problem solved.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-11-29 08:57:44', '2023-11-29 08:57:44'),
(76, 139, 78, '000075', '2023', 'WC', 'TFR-20231202', 'TAS-20HB_15KW_380V_IP55', 87, 0, NULL, NULL, '2023-12-02', '2023-12-05', 'Airend does not rotate by hand and Bearing jam.', 'Airend does not rotate by hand and Bearing jam.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Airend repairing. Problem solve', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-06 03:32:39', '2023-12-06 03:32:39'),
(77, 88, 49, '000076', '2023', 'WC', 'TFR-20230711', 'TAS-30HB_22KW_380V_IP55', 515, 0, NULL, NULL, '2023-07-11', '2023-07-18', 'Main motor open phase & Magnetic Contactor problem.', 'Main motor open phase & Magnetic Contactor problem.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'New Magnetic Contactor replaced. Problem solved.(LC1E32---N) (TAS-30HB_22kW, 21110754, 380V/50Hz', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-06 05:23:48', '2023-12-06 05:23:48'),
(78, 50, 29, '000077', '2023', 'WC', 'TFR-20231121', 'TAS-75 PMC_55KW_380V_IP55', 1136, 0, NULL, NULL, '2023-11-21', '2023-11-23', 'During normal operation main magnetic contactor Tripped and found that the VFD was spark flash marks in the body.', 'During normal operation main magnetic contactor Tripped and found that the VFD was spark flash marks in the body.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'New VFD replaced from local market. Problem solved.(NZ200T-75GY1-4, Input: 3PH 380V 50HZ/60HZ, Output: 3PH 380V _150A _75kW, FREQ RANGE: 0.1-600Hz), S/N-ZC220802389839-229-A', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-06 05:28:09', '2023-12-06 05:28:09'),
(79, 147, 37, '000078', '2023', 'WC', 'TFR-20230808', 'TAS-60 PMC_45KW_380V_IP55', 6296, 4000, NULL, NULL, '2023-08-08', '2023-08-09', 'Airend to reclaimer vessel delivery line pipe oil leakage.', 'Airend to reclaimer vessel delivery line pipe oil leakage.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Airend to reclaimer vessel delivery line pipe replaced from trident stock. Problem solved.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-06 05:35:19', '2023-12-06 05:35:19'),
(80, 135, 76, '000079', '2023', 'WC', 'TFR-20231030', 'TAS-20HB_15KW_380V_IP55', 1, 0, NULL, NULL, '2023-11-06', '2023-11-06', 'Magnetic Contactor Brunt.', 'Magnetic Contactor Brunt.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'New Magnetic Contactor replaced. Problem solved.(E2501,32A,5.5KW)  (TAS-20HB_15kW, 23080325, 380V/50Hz)', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-07 08:33:19', '2023-12-07 08:33:19'),
(81, 49, 28, '000080', '2023', 'WC', 'TFR-20231120', 'TAS-60PMC_45KW_380V_IP55', 3615, 2000, NULL, NULL, '2023-11-20', '2023-11-21', 'Discharge temperature high and Oil Coking.', 'Discharge temperature high and Oil Coking.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'Air filter, Oil filter, Seperator & Oil replaced. Problem solved.', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-07 08:41:46', '2023-12-07 08:41:46'),
(82, 88, 49, '000081', '2023', 'WC', 'TFR-20231204', 'TAS-30HB_22KW_380V_IP55', 1804, 0, NULL, NULL, '2023-12-04', '2023-12-06', 'Main motor overload.', 'Main motor overload.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'New Magnetic Contactor replaced. Problem solved.(LC1E32---N_7.5KW & NXC--32_7.5KW) (TAS-30HB_22kW, 21110754, 380V/50Hz', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-07 08:47:11', '2023-12-07 08:47:11'),
(83, 151, 63, '000082', '2023', 'WC', 'TWC-20230527', 'TAC-120(16m³/min)_380V_50HZ', 2432, 2000, NULL, NULL, '2023-05-27', '2023-05-27', 'Magnetic Contactor Brunt.', 'Magnetic Contactor Brunt.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', 'New Magnetic Contactor replaced. Problem solved. (CHNT, NC1-12, 5.5KW, 380V)(TAC-120_2.6kW, 20220423, 380V/50Hz', 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-07 08:55:51', '2023-12-07 08:55:51'),
(84, 51, 30, '000083', '2023', 'WC', 'TFR-20231021', 'TAS-100PMC_75KW_380V_IP55', 4898, 4000, NULL, NULL, '2023-10-21', NULL, 'Inverter module card problem.', 'Inverter module card problem.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', NULL, 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-10 06:33:35', '2023-12-10 06:33:35'),
(85, 59, 35, '000084', '2023', 'WC', 'TFR-20231127', 'TAS-20HB_15KW_380V_IP55', 639, 0, NULL, NULL, '2023-11-27', NULL, 'Airend to reclaimer vessel delivery line pipe oil leakage.', 'Airend to reclaimer vessel delivery line pipe oil leakage.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', NULL, 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-10 06:42:03', '2023-12-10 06:42:03'),
(86, 101, 55, '000085', '2023', 'WC', 'TFR-20231129', 'TAS-200HB_160KW_380V_IP55', 2753, 2000, NULL, NULL, '2023-11-29', NULL, 'Air intake hose pipe damage.', 'Air intake hose pipe damage.', NULL, NULL, '34', 'BDT', 'SAYED ALL HOSSAIN', NULL, 'saved', NULL, NULL, NULL, NULL, 'Claim', 14, 'Open', '2023-12-10 06:49:21', '2023-12-10 06:49:21'),
(87, 57, 34, '000086', '2023', 'WS', NULL, 'TAS-30HB_22KW_380V_IP55', 1995, NULL, NULL, '2023-06-21', NULL, '2023-12-12', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 15, 'Active', '2023-12-12 06:47:09', '2023-12-12 06:47:09'),
(88, 52, 31, '000087', '2023', 'WS', NULL, 'TAS-100PMC_75KW_380V_IP55', 1967, NULL, NULL, '2023-04-12', NULL, '2023-12-13', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 14, 'Active', '2023-12-13 06:59:26', '2023-12-13 06:59:26'),
(89, 111, 61, '000088', '2023', 'WS', NULL, 'TAS-30HB_22KW_380V_IP55', 2042, NULL, NULL, '2023-03-16', NULL, '2023-12-20', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 13, 'Active', '2023-12-20 10:40:09', '2023-12-20 10:40:09'),
(90, 111, 61, '000089', '2023', 'WS', NULL, 'TAS-30HB_22KW_380V_IP55', 6331, NULL, NULL, '2023-03-16', NULL, '2023-12-20', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'saved', NULL, NULL, NULL, NULL, 'Service', 17, 'Active', '2023-12-20 10:42:17', '2023-12-20 10:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `claim_attachments`
--

CREATE TABLE `claim_attachments` (
  `id` bigint(20) NOT NULL,
  `claim_id` bigint(20) DEFAULT NULL,
  `claim_attachment` varchar(255) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `entry_by` bigint(20) DEFAULT NULL,
  `deleted` enum('Yes','No') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `claim_attachments`
--

INSERT INTO `claim_attachments` (`id`, `claim_id`, `claim_attachment`, `date`, `entry_by`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 28, '1697862528.pdf', '21-10-2023', 1, 'Yes', '2023-10-21 08:28:48', '2023-10-21 09:04:02'),
(2, 28, '1697862897.pdf', '21-10-2023', 1, 'Yes', '2023-10-21 08:34:57', '2023-10-21 09:03:16'),
(3, 28, '1697864668.pdf', '21-10-2023', 1, 'Yes', '2023-10-21 09:04:28', '2023-10-21 09:04:35'),
(4, 28, '1697864733.pdf', '21-10-2023', 1, 'No', '2023-10-21 09:05:33', '2023-10-21 09:05:33'),
(5, 26, '1697864939.pdf', '21-10-2023', 1, 'No', '2023-10-21 09:08:59', '2023-10-21 09:08:59'),
(6, 28, '1698035722.pdf', '23-10-2023', 1, 'Yes', '2023-10-23 08:35:22', '2023-10-23 08:35:38'),
(7, 46, '1698220671.pdf', '25-10-2023', 14, 'No', '2023-10-25 11:57:51', '2023-10-25 11:57:51'),
(8, 52, '1699683782.pdf', '11-11-2023', 14, 'No', '2023-11-11 11:23:02', '2023-11-11 11:23:02'),
(9, 64, '1700649287.pdf', '22-11-2023', 14, 'No', '2023-11-22 15:34:47', '2023-11-22 15:34:47'),
(10, 65, '1700649676.pdf', '22-11-2023', 14, 'No', '2023-11-22 15:41:16', '2023-11-22 15:41:16'),
(11, 66, '1700722194.pdf', '23-11-2023', 14, 'No', '2023-11-23 11:49:54', '2023-11-23 11:49:54'),
(12, 67, '1700727116.pdf', '23-11-2023', 14, 'No', '2023-11-23 13:11:56', '2023-11-23 13:11:56'),
(13, 68, '1700727522.pdf', '23-11-2023', 14, 'No', '2023-11-23 13:18:42', '2023-11-23 13:18:42'),
(14, 69, '1700729436.pdf', '23-11-2023', 14, 'No', '2023-11-23 13:50:36', '2023-11-23 13:50:36'),
(15, 70, '1700734628.pdf', '23-11-2023', 14, 'No', '2023-11-23 15:17:08', '2023-11-23 15:17:08'),
(16, 71, '1701067315.pdf', '27-11-2023', 14, 'No', '2023-11-27 11:41:55', '2023-11-27 11:41:55'),
(17, 72, '1701068650.pdf', '27-11-2023', 14, 'No', '2023-11-27 12:04:10', '2023-11-27 12:04:10'),
(18, 74, '1701247842.pdf', '29-11-2023', 14, 'No', '2023-11-29 13:50:42', '2023-11-29 13:50:42'),
(19, 75, '1701248315.pdf', '29-11-2023', 14, 'No', '2023-11-29 13:58:35', '2023-11-29 13:58:35'),
(20, 76, '1701833904.pdf', '06-12-2023', 14, 'No', '2023-12-06 08:38:24', '2023-12-06 08:38:24'),
(21, 77, '1701840284.pdf', '06-12-2023', 14, 'No', '2023-12-06 10:24:44', '2023-12-06 10:24:44'),
(22, 78, '1701840539.pdf', '06-12-2023', 14, 'No', '2023-12-06 10:28:59', '2023-12-06 10:28:59'),
(23, 79, '1701840952.pdf', '06-12-2023', 14, 'No', '2023-12-06 10:35:52', '2023-12-06 10:35:52'),
(24, 80, '1701938144.pdf', '07-12-2023', 14, 'No', '2023-12-07 13:35:44', '2023-12-07 13:35:44'),
(25, 81, '1701938542.pdf', '07-12-2023', 14, 'No', '2023-12-07 13:42:22', '2023-12-07 13:42:22'),
(26, 82, '1701938867.pdf', '07-12-2023', 14, 'No', '2023-12-07 13:47:47', '2023-12-07 13:47:47'),
(27, 83, '1701939394.pdf', '07-12-2023', 14, 'No', '2023-12-07 13:56:34', '2023-12-07 13:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `claim_products`
--

CREATE TABLE `claim_products` (
  `id` bigint(20) NOT NULL,
  `part_id` bigint(20) DEFAULT NULL,
  `qty` bigint(20) DEFAULT NULL,
  `claim_id` bigint(20) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `claim_products`
--

INSERT INTO `claim_products` (`id`, `part_id`, `qty`, `claim_id`, `unit_price`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 13, 1, 1, 13000.00, 13000.00, 'Active', '2023-10-04 04:15:01', '2023-10-04 04:15:01'),
(2, 17, 1, 2, 780.00, 780.00, 'Active', '2023-10-04 04:19:19', '2023-10-04 04:19:19'),
(3, 17, 1, 4, 780.00, 780.00, 'Active', '2023-10-04 04:43:11', '2023-10-04 04:43:11'),
(4, 17, 1, 5, 780.00, 780.00, 'Active', '2023-10-04 08:12:48', '2023-10-04 08:12:48'),
(5, 16, 1, 6, 800.00, 800.00, 'Active', '2023-10-07 05:45:29', '2023-10-07 05:45:29'),
(6, 18, 1, 6, 600.00, 600.00, 'Active', '2023-10-07 05:51:46', '2023-10-17 06:04:20'),
(7, 13, 1, 7, 600.00, 600.00, 'Active', '2023-10-10 05:40:03', '2023-10-11 06:17:41'),
(8, 19, 1, 7, 600.00, 600.00, 'Active', '2023-10-10 05:40:19', '2023-10-10 05:40:19'),
(9, 18, 1, 8, 600.00, 600.00, 'Active', '2023-10-10 06:57:55', '2023-10-10 06:57:55'),
(10, 13, 1, 9, 6000.00, 6000.00, 'Active', '2023-10-16 05:07:09', '2023-10-16 05:07:41'),
(11, 14, 1, 9, 6000.00, 6000.00, 'Active', '2023-10-16 05:07:09', '2023-10-16 05:07:09'),
(12, 51, 1, 10, 0.00, 0.00, 'Active', '2023-10-16 09:46:19', '2023-10-16 09:46:19'),
(13, 52, 1, 10, 0.00, 0.00, 'Active', '2023-10-16 09:46:19', '2023-10-16 09:46:19'),
(14, 53, 1, 10, 0.00, 0.00, 'Active', '2023-10-16 09:46:19', '2023-10-16 09:46:19'),
(15, 51, 1, 11, 0.00, 0.00, 'Active', '2023-10-16 10:11:44', '2023-10-16 10:11:44'),
(16, 52, 1, 11, 0.00, 0.00, 'Active', '2023-10-16 10:11:44', '2023-10-16 10:11:44'),
(17, 53, 1, 11, 0.00, 0.00, 'Active', '2023-10-16 10:11:44', '2023-10-16 10:11:44'),
(18, 45, 1, 12, 0.00, 0.00, 'Active', '2023-10-16 10:22:09', '2023-10-16 10:22:09'),
(19, 46, 1, 12, 0.00, 0.00, 'Active', '2023-10-16 10:22:09', '2023-10-16 10:22:09'),
(20, 45, 1, 13, 0.00, 0.00, 'Active', '2023-10-16 10:36:19', '2023-10-16 10:36:19'),
(21, 46, 1, 13, 0.00, 0.00, 'Active', '2023-10-16 10:36:19', '2023-10-16 10:36:19'),
(22, 79, 1, 13, 0.00, 0.00, 'Active', '2023-10-16 10:36:19', '2023-10-16 10:36:19'),
(23, 45, 1, 14, 0.00, 0.00, 'Active', '2023-10-16 10:49:45', '2023-10-16 10:49:45'),
(24, 46, 4, 14, 0.00, 0.00, 'Active', '2023-10-16 10:49:45', '2023-10-16 10:49:45'),
(25, 47, 1, 14, 0.00, 0.00, 'Active', '2023-10-16 10:49:45', '2023-10-16 10:49:45'),
(26, 28, 1, 15, 0.00, 0.00, 'Active', '2023-10-17 04:51:20', '2023-10-17 04:51:20'),
(27, 27, 1, 15, 0.00, 0.00, 'Active', '2023-10-17 04:51:20', '2023-10-17 04:51:20'),
(28, 18, 1, 16, 1600.00, 1600.00, 'Active', '2023-10-17 04:54:19', '2023-10-17 04:54:19'),
(29, 70, 1, 16, 5000.00, 5000.00, 'Active', '2023-10-17 04:54:19', '2023-10-17 04:54:19'),
(30, 57, 1, 17, 0.00, 0.00, 'Active', '2023-10-17 05:00:35', '2023-10-17 05:00:35'),
(31, 58, 1, 17, 0.00, 0.00, 'Active', '2023-10-17 05:00:35', '2023-10-17 05:00:35'),
(32, 59, 1, 17, 0.00, 0.00, 'Active', '2023-10-17 05:00:35', '2023-10-17 05:00:35'),
(33, 19, 1, 18, 600.00, 600.00, 'Active', '2023-10-17 05:12:37', '2023-10-17 06:30:51'),
(34, 18, 1, 20, 600.00, 600.00, 'Active', '2023-10-17 07:51:42', '2023-10-17 07:51:42'),
(35, 45, 1, 23, 0.00, 0.00, 'Active', '2023-10-17 09:04:51', '2023-10-17 09:04:51'),
(36, 46, 1, 23, 0.00, 0.00, 'Active', '2023-10-17 09:04:51', '2023-10-17 09:04:51'),
(37, 45, 1, 24, 0.00, 0.00, 'Active', '2023-10-17 09:06:21', '2023-10-17 09:06:21'),
(38, 46, 1, 24, 0.00, 0.00, 'Active', '2023-10-17 09:06:21', '2023-10-17 09:06:21'),
(39, 47, 1, 24, 0.00, 0.00, 'Active', '2023-10-17 09:06:21', '2023-10-17 09:06:21'),
(40, 45, 1, 25, 0.00, 0.00, 'Active', '2023-10-17 09:13:40', '2023-10-17 09:13:40'),
(41, 46, 1, 25, 0.00, 0.00, 'Active', '2023-10-17 09:13:40', '2023-10-17 09:13:40'),
(42, 79, 1, 25, 0.00, 0.00, 'Active', '2023-10-17 09:13:40', '2023-10-17 09:13:40'),
(43, 57, 2, 27, 0.00, 0.00, 'Active', '2023-10-17 09:19:31', '2023-10-17 09:19:31'),
(44, 58, 1, 27, 0.00, 0.00, 'Active', '2023-10-17 09:19:31', '2023-10-17 09:19:31'),
(45, 59, 1, 27, 0.00, 0.00, 'Active', '2023-10-17 09:19:31', '2023-10-17 09:19:31'),
(46, 79, 1, 27, 0.00, 0.00, 'Active', '2023-10-17 09:19:31', '2023-10-17 09:19:31'),
(47, 33, 1, 29, 0.00, 0.00, 'Active', '2023-10-17 09:38:37', '2023-10-17 09:38:37'),
(48, 34, 1, 29, 0.00, 0.00, 'Active', '2023-10-17 09:38:37', '2023-10-17 09:38:37'),
(49, 33, 1, 30, 0.00, 0.00, 'Active', '2023-10-17 09:41:50', '2023-10-17 09:41:50'),
(50, 34, 1, 30, 0.00, 0.00, 'Active', '2023-10-17 09:41:50', '2023-10-17 09:41:50'),
(51, 35, 1, 30, 0.00, 0.00, 'Active', '2023-10-17 09:41:50', '2023-10-17 09:41:50'),
(52, 20, 1, 32, 1500.00, 1500.00, 'Active', '2023-10-23 06:11:32', '2023-10-23 06:11:32'),
(53, 21, 1, 32, 1500.00, 1500.00, 'Active', '2023-10-23 06:11:32', '2023-10-23 06:11:32'),
(54, 45, 1, 33, 0.00, 0.00, 'Active', '2023-10-23 06:28:08', '2023-10-23 06:28:08'),
(55, 46, 1, 33, 0.00, 0.00, 'Active', '2023-10-23 06:28:08', '2023-10-23 06:28:08'),
(56, 45, 1, 34, 0.00, 0.00, 'Active', '2023-10-23 06:29:56', '2023-10-23 06:29:56'),
(57, 46, 1, 34, 0.00, 0.00, 'Active', '2023-10-23 06:29:56', '2023-10-23 06:29:56'),
(58, 47, 1, 34, 0.00, 0.00, 'Active', '2023-10-23 06:29:56', '2023-10-23 06:29:56'),
(59, 45, 1, 35, 0.00, 0.00, 'Active', '2023-10-23 06:54:43', '2023-10-23 06:54:43'),
(60, 46, 1, 35, 0.00, 0.00, 'Active', '2023-10-23 06:54:43', '2023-10-23 06:54:43'),
(61, 45, 1, 36, 0.00, 0.00, 'Active', '2023-10-23 06:56:26', '2023-10-23 06:56:26'),
(62, 46, 1, 36, 0.00, 0.00, 'Active', '2023-10-23 06:56:26', '2023-10-23 06:56:26'),
(63, 47, 1, 36, 0.00, 0.00, 'Active', '2023-10-23 06:56:26', '2023-10-23 06:56:26'),
(64, 33, 1, 37, 0.00, 0.00, 'Active', '2023-10-23 08:37:14', '2023-10-23 08:37:14'),
(65, 34, 1, 37, 0.00, 0.00, 'Active', '2023-10-23 08:37:14', '2023-10-23 08:37:14'),
(66, 33, 1, 38, 0.00, 0.00, 'Active', '2023-10-23 08:39:00', '2023-10-23 08:39:00'),
(67, 34, 1, 38, 0.00, 0.00, 'Active', '2023-10-23 08:39:00', '2023-10-23 08:39:00'),
(68, 35, 1, 38, 0.00, 0.00, 'Active', '2023-10-23 08:39:00', '2023-10-23 08:39:00'),
(69, 18, 1, 39, 600.00, 600.00, 'Active', '2023-10-23 08:48:12', '2023-10-23 08:48:12'),
(70, 80, 1, 40, 0.00, 0.00, 'Active', '2023-10-23 09:33:12', '2023-10-23 09:33:12'),
(71, 81, 1, 40, 0.00, 0.00, 'Active', '2023-10-23 09:33:12', '2023-10-23 09:33:12'),
(72, 80, 4, 41, 0.00, 0.00, 'Active', '2023-10-23 09:39:13', '2023-10-23 09:39:13'),
(73, 81, 1, 41, 0.00, 0.00, 'Active', '2023-10-23 09:39:13', '2023-10-23 09:39:13'),
(74, 82, 1, 41, 0.00, 0.00, 'Active', '2023-10-23 09:39:13', '2023-10-23 09:39:13'),
(75, 80, 1, 42, 0.00, 0.00, 'Active', '2023-10-23 09:44:19', '2023-10-23 09:44:19'),
(76, 81, 1, 42, 0.00, 0.00, 'Active', '2023-10-23 09:44:19', '2023-10-23 09:44:19'),
(77, 79, 1, 42, 0.00, 0.00, 'Active', '2023-10-23 09:44:19', '2023-10-23 09:44:19'),
(78, 45, 1, 43, 0.00, 0.00, 'Active', '2023-10-23 09:51:47', '2023-10-23 09:51:47'),
(79, 46, 1, 43, 0.00, 0.00, 'Active', '2023-10-23 09:51:47', '2023-10-23 09:51:47'),
(80, 57, 1, 44, 0.00, 0.00, 'Active', '2023-10-23 10:30:19', '2023-10-23 10:30:19'),
(81, 58, 1, 44, 0.00, 0.00, 'Active', '2023-10-23 10:30:19', '2023-10-23 10:30:19'),
(82, 57, 1, 45, 0.00, 0.00, 'Active', '2023-10-25 05:07:01', '2023-10-25 05:07:01'),
(83, 58, 1, 45, 0.00, 0.00, 'Active', '2023-10-25 05:07:01', '2023-10-25 05:07:01'),
(84, 20, 1, 47, 1500.00, 1500.00, 'Active', '2023-10-31 06:39:47', '2023-10-31 06:39:47'),
(85, 21, 1, 47, 1500.00, 1500.00, 'Active', '2023-10-31 06:39:47', '2023-10-31 06:39:47'),
(86, 22, 1, 47, 0.00, 0.00, 'Active', '2023-10-31 06:39:47', '2023-10-31 06:39:47'),
(87, 57, 1, 48, 0.00, 0.00, 'Active', '2023-11-01 08:53:11', '2023-11-01 08:53:11'),
(88, 58, 1, 48, 0.00, 0.00, 'Active', '2023-11-01 08:53:11', '2023-11-01 08:53:11'),
(89, 57, 1, 49, 0.00, 0.00, 'Active', '2023-11-01 08:55:26', '2023-11-01 08:55:26'),
(90, 58, 1, 49, 0.00, 0.00, 'Active', '2023-11-01 08:55:26', '2023-11-01 08:55:26'),
(91, 59, 1, 49, 0.00, 0.00, 'Active', '2023-11-01 08:55:26', '2023-11-01 08:55:26'),
(92, 57, 1, 50, 0.00, 0.00, 'Active', '2023-11-01 09:05:01', '2023-11-01 09:05:01'),
(93, 58, 1, 50, 0.00, 0.00, 'Active', '2023-11-01 09:05:01', '2023-11-01 09:05:01'),
(94, 59, 1, 50, 0.00, 0.00, 'Active', '2023-11-01 09:05:01', '2023-11-01 09:05:01'),
(95, 79, 1, 50, 0.00, 0.00, 'Active', '2023-11-01 09:05:01', '2023-11-01 09:05:01'),
(96, 77, 1, 50, 0.00, 0.00, 'Active', '2023-11-01 09:05:01', '2023-11-01 09:05:01'),
(97, 76, 1, 50, 0.00, 0.00, 'Active', '2023-11-01 09:05:01', '2023-11-01 09:05:01'),
(98, 78, 1, 50, 0.00, 0.00, 'Active', '2023-11-01 09:05:01', '2023-11-01 09:05:01'),
(99, 51, 1, 51, 0.00, 0.00, 'Active', '2023-11-04 06:54:22', '2023-11-04 06:54:22'),
(100, 52, 1, 51, 0.00, 0.00, 'Active', '2023-11-04 06:54:22', '2023-11-04 06:54:22'),
(101, 57, 1, 53, 0.00, 0.00, 'Active', '2023-11-11 08:22:27', '2023-11-11 08:22:27'),
(102, 58, 1, 53, 0.00, 0.00, 'Active', '2023-11-11 08:22:27', '2023-11-11 08:22:27'),
(103, 45, 1, 54, 0.00, 0.00, 'Active', '2023-11-13 04:52:21', '2023-11-13 04:52:21'),
(104, 46, 1, 54, 0.00, 0.00, 'Active', '2023-11-13 04:52:21', '2023-11-13 04:52:21'),
(105, 47, 1, 54, 0.00, 0.00, 'Active', '2023-11-13 04:52:21', '2023-11-13 04:52:21'),
(106, 73, 1, 54, 0.00, 0.00, 'Active', '2023-11-13 04:52:21', '2023-11-13 04:52:21'),
(107, 75, 1, 54, 0.00, 0.00, 'Active', '2023-11-13 04:52:21', '2023-11-13 04:52:21'),
(108, 74, 1, 54, 0.00, 0.00, 'Active', '2023-11-13 04:52:21', '2023-11-13 04:52:21'),
(109, 57, 1, 55, 0.00, 0.00, 'Active', '2023-11-20 04:10:39', '2023-11-20 04:10:39'),
(110, 58, 1, 55, 0.00, 0.00, 'Active', '2023-11-20 04:10:39', '2023-11-20 04:10:39'),
(111, 57, 1, 56, 0.00, 0.00, 'Active', '2023-11-20 04:13:43', '2023-11-20 04:13:43'),
(112, 58, 1, 56, 0.00, 0.00, 'Active', '2023-11-20 04:13:43', '2023-11-20 04:13:43'),
(113, 59, 1, 56, 0.00, 0.00, 'Active', '2023-11-20 04:13:43', '2023-11-20 04:13:43'),
(114, 57, 1, 57, 0.00, 0.00, 'Active', '2023-11-20 04:15:53', '2023-11-20 04:15:53'),
(115, 58, 1, 57, 0.00, 0.00, 'Active', '2023-11-20 04:15:53', '2023-11-20 04:15:53'),
(116, 79, 1, 57, 0.00, 0.00, 'Active', '2023-11-20 04:15:53', '2023-11-20 04:15:53'),
(117, 57, 1, 58, 0.00, 0.00, 'Active', '2023-11-20 04:18:21', '2023-11-20 04:18:21'),
(118, 58, 1, 58, 0.00, 0.00, 'Active', '2023-11-20 04:18:21', '2023-11-20 04:18:21'),
(119, 59, 1, 58, 0.00, 0.00, 'Active', '2023-11-20 04:18:21', '2023-11-20 04:18:21'),
(120, 45, 1, 59, 0.00, 0.00, 'Active', '2023-11-20 04:37:01', '2023-11-20 04:37:01'),
(121, 46, 1, 59, 0.00, 0.00, 'Active', '2023-11-20 04:37:01', '2023-11-20 04:37:01'),
(122, 79, 1, 59, 0.00, 0.00, 'Active', '2023-11-20 04:37:01', '2023-11-20 04:37:01'),
(123, 28, 1, 60, 0.00, 0.00, 'Active', '2023-11-20 06:30:29', '2023-11-20 06:30:29'),
(124, 27, 1, 60, 0.00, 0.00, 'Active', '2023-11-20 06:30:29', '2023-11-20 06:30:29'),
(125, 33, 1, 61, 0.00, 0.00, 'Active', '2023-11-21 08:45:48', '2023-11-21 08:45:48'),
(126, 34, 1, 61, 0.00, 0.00, 'Active', '2023-11-21 08:45:48', '2023-11-21 08:45:48'),
(127, 80, 1, 62, 0.00, 0.00, 'Active', '2023-11-21 08:53:30', '2023-11-21 08:53:30'),
(128, 81, 1, 62, 0.00, 0.00, 'Active', '2023-11-21 08:53:30', '2023-11-21 08:53:30'),
(129, 80, 1, 63, 0.00, 0.00, 'Active', '2023-11-21 09:11:23', '2023-11-21 09:11:23'),
(130, 81, 1, 63, 0.00, 0.00, 'Active', '2023-11-21 09:11:23', '2023-11-21 09:11:23'),
(131, 82, 1, 63, 0.00, 0.00, 'Active', '2023-11-21 09:11:23', '2023-11-21 09:11:23'),
(132, 45, 1, 73, 0.00, 0.00, 'Active', '2023-11-27 07:13:25', '2023-11-27 07:13:25'),
(133, 46, 1, 73, 0.00, 0.00, 'Active', '2023-11-27 07:13:25', '2023-11-27 07:13:25'),
(134, 47, 1, 73, 0.00, 0.00, 'Active', '2023-11-27 07:13:25', '2023-11-27 07:13:25'),
(135, 79, 1, 73, 0.00, 0.00, 'Active', '2023-11-27 07:13:25', '2023-11-27 07:13:25'),
(136, 28, 1, 87, 0.00, 0.00, 'Active', '2023-12-12 06:47:09', '2023-12-12 06:47:09'),
(137, 27, 1, 87, 0.00, 0.00, 'Active', '2023-12-12 06:47:09', '2023-12-12 06:47:09'),
(138, 57, 1, 88, 0.00, 0.00, 'Active', '2023-12-13 06:59:26', '2023-12-13 06:59:26'),
(139, 58, 1, 88, 0.00, 0.00, 'Active', '2023-12-13 06:59:26', '2023-12-13 06:59:26'),
(140, 28, 1, 89, 0.00, 0.00, 'Active', '2023-12-20 10:40:09', '2023-12-20 10:40:09'),
(141, 27, 1, 89, 0.00, 0.00, 'Active', '2023-12-20 10:40:09', '2023-12-20 10:40:09'),
(142, 28, 1, 90, 0.00, 0.00, 'Active', '2023-12-20 10:42:17', '2023-12-20 10:42:17'),
(143, 27, 1, 90, 0.00, 0.00, 'Active', '2023-12-20 10:42:17', '2023-12-20 10:42:17'),
(144, 29, 1, 90, 0.00, 0.00, 'Active', '2023-12-20 10:42:17', '2023-12-20 10:42:17'),
(145, 79, 1, 90, 0.00, 0.00, 'Active', '2023-12-20 10:42:17', '2023-12-20 10:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `post_code` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `company_name`, `email`, `phone`, `address`, `city`, `country`, `post_code`, `created_at`, `updated_at`) VALUES
(1, 'Mr JOY', 'Trident', 'joybaseit@gmail.com', '01712800947', 'mirpur 11', 'Dhaka', 'Bangladesh', 45646, '2023-06-12 07:08:55', '2023-06-12 07:08:55'),
(6, 'Farhan Prog', 'Trident Agency Ltd.-2test', 'superadmin@gmail.com', '01887922063', 'Ctgp', 'Chittagong', 'Bangladesh', 55554, '2023-07-06 11:33:29', '2023-10-16 09:05:05'),
(5, 'gfx g', 'gfdzf', 'gfd@fd.com', '01712800948', 'vczv', 'Dhaka', 'Bahrain', 1651, '2023-06-12 08:48:57', '2023-06-12 08:48:57'),
(4, 'gfx g', 'gfdzf', 'gfd@fd.com', '01712800948', 'vczv', 'Dhaka', 'Bahrain', 1651, '2023-06-12 08:46:04', '2023-06-12 08:46:04'),
(7, 'MD. SABBIR HUSSAIN', 'ADVANCED CHEMICAL INDUSTRIES LTD.', 'sabbir.hussain@aci-bd.com', '01717458949', 'HAJEEGONJ ROAD,GODNYL, NARAYANGONJ, BANGLADESH', 'NARAYANGONJ', 'Bangladesh', 1400, '2023-07-31 08:42:58', '2023-07-31 08:42:58'),
(8, 'Jony', 'Jony Enterprise', 'jony@gmail.com', '01445788963', 'Mirpur', 'Dhaka', 'Bangladesh', 1450, '2023-08-01 07:39:45', '2023-08-01 07:39:45'),
(9, 'MD. SAIFULLAH-AL-MAMUN', 'ABDULLAH BATTERY COMPANY(PVT) LTD.', 'saiful.mamun@hamko.com.bd', '8801777781972', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-08-03 10:22:47', '2023-08-03 10:22:47'),
(10, 'Sayed Al Hossain', 'Trident Agency Ltd.', 'sayed@tridentbd.com', '01777780911', 'Banani C/A', 'Dhaka', 'Bangladesh', 1213, '2023-08-03 11:58:50', '2023-08-06 09:38:29'),
(11, 'Sayed', 'Trident test2', 'sayed@tridentbd.com', '01777780911', 'awalcenter', 'Dhaka', 'Bangladesh', 1213, '2023-08-10 10:19:30', '2023-08-10 10:19:30'),
(12, 'MD. SAIFULLAH-AL-MAMUN', 'KHURSHED METAL INDUSTRIES LTD.', 'saiful.mamun@hamko.com.bd', '01911933907', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-08-21 08:01:06', '2023-08-21 08:01:06'),
(13, 'MD. SAIFULLAH-AL-MAMUN', 'KHURSHED METAL INDUSTRIES LTD.-1', 'saiful.mamun@hamko.com.bd', '01911933907', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-08-21 08:05:55', '2023-08-21 08:05:55'),
(14, 'MD. SABBIR HUSSAIN', 'KHURSHED METAL INDUSTRIES LTD.-1', 'saiful.mamun@hamko.com.bd', '01911933907', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-08-21 08:06:30', '2023-08-21 08:06:30'),
(15, 'MD. SABBIR HUSSAIN', 'KHURSHED METAL INDUSTRIES LTD.-1', 'sabbir.hussain@aci-bd.com', '01911933907', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-08-21 08:06:48', '2023-08-21 08:06:48'),
(16, 'MD. SABBIR HUSSAIN', 'xyz', 'sabbir.hussain@aci-bd.com', '01911933907', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-08-21 08:07:02', '2023-08-21 08:07:02'),
(17, 'MD. SABBIR HUSSAIN', 'xyz', 'sabbir.hussain@aci-bd.com', '01911933907', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-08-21 08:08:29', '2023-08-21 08:08:29'),
(18, 'gfx gk', 'gfdzfk', 'gfd@fd6.com', '01887455965', 'vczvk', 'Dhaka', 'Bangladesh', 16516, '2023-08-21 08:26:39', '2023-08-21 08:26:39'),
(19, 'testT', 'testT', 'testT@gmail.com', '01887955046', 'testT', 'Chittagong', 'Bangladesh', 4556123, '2023-08-22 20:17:27', '2023-08-22 20:17:27'),
(20, 'farhan Co', 'Farhan', 'farhan@gmail.com', '01774588963', 'ttt', 'Chittagong', 'Barbados', 65465465, '2023-08-22 21:01:26', '2023-08-22 21:01:26'),
(21, 'Farhan Prog', 'Farhan Prog', 'superadmin@gmail.comp', '01887922063', 'Ctgp', 'Chittagongp', 'Bangladesh', 55554, '2023-08-22 21:51:13', '2023-08-22 21:51:13'),
(22, 'tester', 'tester', 'tester@gmail.com', '01774577896', 'tester', 'Chittagong', 'Bangladesh', 65465, '2023-08-22 23:11:29', '2023-08-22 23:11:29'),
(23, 'Roaster P', 'Roaster', 'Roaster@gmail.com', '01775699356', 'Roaster', 'sylhet', 'Barbados', 4654, '2023-08-22 23:14:52', '2023-08-22 23:14:52'),
(24, 'test', 'xyz', 'test@gmail.com', '01911933907', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'Dhaka', 'Bangladesh', 9100, '2023-08-27 07:22:31', '2023-08-27 07:22:31'),
(25, 'MD. SAIFULLAH-AL-MAMUN', 'ABDULLAH BATTERY COMPANY(PVT) LTD.', 'saiful.mamun@hamko.com.bd', '01777781972', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-10-05 08:39:50', '2023-10-05 08:39:50'),
(26, 'MD. SAIFULLAH-AL-MAMUN', 'ABDULLAH BATTERY COMPANY(PVT) LTD.', 'saiful.mamun@hamko.com.bd', '01777781972', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-10-05 08:43:59', '2023-10-05 08:43:59'),
(27, 'MD. SABBIR HUSSAIN', 'ADVANCED CHEMICAL INDUSTRIES LIMITED', 'sabbir.hussain@aci-bd.com', '01717458949', '7, HAJEEGONJ ROAD, GODNYL NARAYANGANJ, BANGLADESH', 'NARAYANGONJ', 'Bangladesh', 1400, '2023-10-05 09:56:19', '2023-10-05 09:56:19'),
(28, 'MD. SABBIR HUSSAIN', 'ADVANCED CHEMICAL INDUSTRIES LTD.', 'sabbir.hussain@aci-bd.com', '01717458949', 'HAJEEGONJ ROAD,GODNYL, NARAYANGONJ, BANGLADESH', 'NARAYANGONJ', 'Bangladesh', 1400, '2023-10-05 10:00:45', '2023-10-05 10:00:45'),
(29, 'MD. EMDAD HOSSAIN', 'AKH KNITTING & DYEING LTD.', 'info@tridentbd.com', '01712260650', 'PHULBARIA, TETULJHORA, SAVAR, DHAKA, BANGLADESH', 'SAVAR', 'Bangladesh', 1340, '2023-10-05 10:16:35', '2023-10-05 10:16:35'),
(30, 'MD. KUMRUL HASAN', 'TUSHAR CERAMICS LTD.', 'kumrul01@gmail.com', '01844274305', 'SHARATOLA, MOHESHPUR, JHENADAH', 'JHENADAH', 'Bangladesh', 7340, '2023-10-07 09:36:05', '2023-10-07 09:36:05'),
(31, 'MD. ARIF', 'ALIB Composite Ltd.', 'mdarifkhan1258@gmail.com', '01999485730', 'VANARA, MOUCHAK,', 'GAZIPUR', 'Bangladesh', 1720, '2023-10-07 09:47:41', '2023-10-07 09:47:41'),
(32, 'KABIR HOSSAIN', 'AMAN FASHION & DESIGN LTD.', 'engkabir49@gmail.com', '01721201298', 'NOLAM, ASHULIA, SAVAR, DHAKA', 'SAVAR', 'Bangladesh', 1341, '2023-10-07 10:17:18', '2023-10-07 10:17:18'),
(33, 'MD. JAFOR', 'ARGON SPINNING MILLS LTD.', 'jaforiqbalkh@gmail.com', '01713049229', 'NIZAMPUR, HABIGONJ, BANGLADESH', 'HABIGONJ', 'Bangladesh', 3300, '2023-10-07 10:38:40', '2023-10-07 10:38:40'),
(34, 'MD. RAKIB', 'AYSHA AND GALEYA FASHIONS LTD.', 'smabulhasan@gmail.com', '01911350627', 'HARIKEN ROAD,DAULATPUR, GAZIPUR, BANGLADESH', 'GAZIPUR', 'Bangladesh', 1702, '2023-10-07 12:37:12', '2023-10-07 12:37:12'),
(35, 'MD.BIPLOP', 'B&T METER LTD.', 'ae.md.mojnumiabnt@gmail.com', '01912336377', 'KHALISHPUR, JHENAIDAH, BANGLADESH', 'JHENAIDAH', 'Bangladesh', 7300, '2023-10-07 13:17:25', '2023-10-07 13:17:25'),
(36, 'MD. SYDUZZAMAN', 'BEXIMCO LIMITED', 'tipu@beximtex.com', '01713049486', 'BEXIMCO INDUSTRIAL PARK,SARABO, KASHIMPUR, GAZIPUR, BANGLADESH.', 'KASHIMPUR', 'Bangladesh', 1703, '2023-10-08 08:51:43', '2023-10-08 08:51:43'),
(37, 'MD.RONY', 'BONAFIDE COMPOSITE TEXTILE MILLS LTD', 'ronibkml@gmail.com', '01721438741', 'FATEHPUR, ARAIHAZAR,NARAYANGONJ,BANGLADESH.', 'NARAYANGANJ', 'Bangladesh', 1441, '2023-10-08 09:25:34', '2023-11-23 13:40:43'),
(38, 'MD. AL-EMRAN', 'C2C PHARMA', 'alimran@c2cpharma.com.bd', '01955597804', 'YEARPUR, ASHULIA, BANGLADESH', 'ASHULIA', 'Bangladesh', 1341, '2023-10-08 09:56:52', '2023-10-08 09:56:52'),
(39, 'MD. SHAMIM', 'CONFIDENCE TEXWEAR LTD.', 'sakinahammed99@gmail.com', '01313010320', 'BAGHER BAZAR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 'Bangladesh', 1346, '2023-10-08 10:09:57', '2023-10-08 10:09:57'),
(40, 'SURANJON DAS', 'EOS TEXTILE MILLS LTD.', 'weaving@eostextile.com', '01711283019', 'PLOT 1-6,17-22 DHAKA EXPORT PROCESSING ZONE, SAVAR, DHAKA, BANGLADESH', 'SAVAR', 'Bangladesh', 1341, '2023-10-08 10:34:15', '2023-10-08 10:34:15'),
(41, 'H M A MANNAN', 'ESHANA NONWOVEN (IND.) LTD.', 'hmamannan36@gmail.com', '01911134013', 'PACHULAR,CITY BYPASS ROAD, TELIGATI ARONGGHATA, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9203, '2023-10-08 10:44:53', '2023-10-08 10:44:53'),
(42, 'MD. NAHID', 'FAIR ELECTRONICS LTD.', 'nahid.abdullah@fel.com.bd', '01777702114', 'VELANAGAR, NARSINGDI, BANGLADESH', 'NARSINGDI', 'Bangladesh', 1600, '2023-10-08 11:05:15', '2023-10-08 11:05:15'),
(43, 'MR. AQIB JAVED', 'GENERAL PHARMACEUTICALS LTD.', 'aqib.eng@generalpharma.com', '01844093953', 'KONABARI, GAZIPUR, BANGLADESH', 'KONABARI', 'Bangladesh', 1346, '2023-10-08 12:44:20', '2023-10-08 12:44:20'),
(44, 'MD. RAFIQUL ISLAM', 'GRIND TECH LTD.', 'rafiqul@grindtech-bd.com', '01708121266', 'JAINTAPUR, SYLHET, BANGLADESH.', 'JAINTAPUR', 'Bangladesh', 3156, '2023-10-08 12:59:52', '2023-10-08 12:59:52'),
(45, 'MD. EMAROT', 'HASAN FOODS LTD.', 'hasanfood.bd@gmail.com', '01711878073', 'PORABO,VULTA, RUPGONJ, NARAYANGONJ,BANGLADESH.', 'NARAYANGANJ', 'Bangladesh', 1461, '2023-10-08 13:19:26', '2023-10-08 13:19:26'),
(46, 'SHANTANU KAISER', 'HEAVEN TEXTILES MILLS', 'kaisertex28@gmail.com', '01712047956', 'RUPGONJ,NARAYANGONJ, BANGLADESH', 'NARAYANGONJ', 'Bangladesh', 1462, '2023-10-08 13:31:33', '2023-10-08 13:31:33'),
(47, 'MD. MARUF AHMED', 'HABIGONJ INDUSTRIAL PARK (PRAN-RFL)', 'pipprance@pipprangroup.com', '01704132325', 'SAYESTAGONJ, OLIPUR, HABIGONJ,BANGLADESH', 'HABIGONJ', 'Bangladesh', 3332, '2023-10-08 13:47:21', '2023-10-08 13:47:21'),
(48, 'MD. SHAHAJALAL BHUIYA', 'JABED AGRO FOOD LTD. LTD.', 'shahajalal.jafpl@gmail.com', '01784057088', 'BSCIC INDUSTRIAL AREA, JAMALPUR, BANGLADESH.', 'JAMALPUR', 'Bangladesh', 2000, '2023-10-08 14:10:00', '2023-10-08 14:10:00'),
(49, 'MD. IMRAN HOSSEN', 'JF & I PAKAGING (BD) LTD.', 'imraneee50@gmail.com', '01827165396', 'SOUTH SHAMPUR, HEMAYETPUR, SAVAR, BANGLADESH.', 'SAVAR', 'Bangladesh', 1340, '2023-10-08 14:26:46', '2023-10-08 14:26:46'),
(50, 'MD. SAIFULLAH-AL-MAMUN', 'KHURSHED METAL INDUSTRIES LTD.', 'saiful.mamun@hamko.com.bd', '01777781972', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 'Bangladesh', 9204, '2023-10-09 13:44:26', '2023-10-09 13:44:26'),
(51, 'TANMOY ACHARYA', 'LAXFO ELECTRONICS LTD.', 'tanmoy.acharya@laxfo.com', '01670562093', 'TAIYABPUR, ZIRABO, ASHULIA, BANGLADESH', 'ASHLIA', 'Bangladesh', 1341, '2023-10-10 07:19:01', '2023-10-10 07:19:01'),
(52, 'MD. ANISUR RAHMAN', 'MADANI FEED MILLS LTD.', 'madanisonsagroindustriesltd@gmail.com', '01923223170', 'CHIKNA, TRISHAL, MYMENSING,BANGLADESH.', 'MYMENSING', 'Bangladesh', 2220, '2023-10-10 07:46:50', '2023-10-10 07:46:50'),
(53, 'MD. ANAM HOSSAIN', 'MAX  INFRASTRUCTURE LTD.', 'anam.hossain@maxgroup-bd.com', '01700704805', 'MEGHSHIMUL, JAGIR, MANIKGANJ, BANGLADESH.', 'MANIKGANJ', 'Bangladesh', 1800, '2023-10-10 08:25:09', '2023-10-10 08:25:09'),
(54, 'MD. NASIM', 'MOHUBOR RAHMAN PARTICAL MILLS (PVT) LTD.', 'engr.nasimuloo@gmail.com', '01711427817', 'SAHEBGANG, RANGPUR, BANGLADESH.', 'RANGPUR', 'Bangladesh', 5403, '2023-10-10 08:59:25', '2023-10-10 08:59:25'),
(55, 'ENG. KAZI NAZRUL ISLAM', 'OLYMPIC CEMENT LTD.', 'gm.op@olympiccement.com', '01313439445', 'RUPATOLI, BARISAL, BANGLADESH', 'BARISAL', 'Bangladesh', 8207, '2023-10-10 09:31:59', '2023-10-10 09:31:59'),
(56, 'MD. YEASIN', 'PARAGON AGRO LTD.', 'yasinhamid1155@gmail.com', '01833222444', 'HAJINAGAR TEA ESTATE, KAJALDHARA, MOULVIBAZAR', 'MOULVIBAZAR', 'Bangladesh', 2334, '2023-10-10 09:44:18', '2023-10-10 09:44:18'),
(57, 'MD. FARUK HAOLADER', 'PIDILITE SPECIALITY CHEMICALS (BD)PVT.LTD.', 'engr.faruk@pidilite.com.bd', '01712654364', 'WEST MUKTERPUR, PANCHASHAR, MUNSHIGANJ, BANGLADESH.', 'MUNSHIGANJ', 'Bangladesh', 1500, '2023-10-10 09:50:07', '2023-10-10 09:50:07'),
(58, 'MD. IDRIS ALI', 'PRAN DAIRY LIMITED', 'pipprance@pipprangroup.com', '01704132633', 'BAGPARA PALASH, NARSHINGDI,BANGLADESH.', 'PALASH', 'Bangladesh', 1610, '2023-10-10 09:54:31', '2023-10-10 09:54:31'),
(59, 'MD.ABDUL MATIN', 'RATUL FABRICS LTD.', 'ambitionbd@gmail.com', '01936017130', 'ZOHARSANDA, ASHULIA, SAVAR, DHAKA.', 'DHAKA', 'Bangladesh', 1340, '2023-10-10 10:15:11', '2023-10-10 10:15:11'),
(60, 'ABDUL MATIN', 'RATUL KNITWEARS LTD.', 'ambitionbd@gmail.com', '01711693408', 'ZIRABO (PUKURPAR), ASHULIA, SAVAR, BANGLADESH.', 'DHAKA', 'Bangladesh', 1341, '2023-10-10 10:48:23', '2023-10-10 10:48:23'),
(61, 'MD. JONY', 'RONY KNIT COMPOSITE LTD.', 'jonyrkcl@gmail.com', '01914119882', 'TARABO, RUPGANJ, NARAYANGANJ, BANGLADESH', 'NARAYANGANJ', 'Bangladesh', 1402, '2023-10-10 12:46:00', '2023-10-10 12:46:00'),
(62, 'SUBASISH GHOSH', 'RR IMPERIAL ELECTRICALS LTD.', 's.ghosh@rr-imperial.com', '01755552564', 'SENPARA, KANCHPUR, SONARGAON, NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 'Bangladesh', 1441, '2023-10-10 12:57:02', '2023-10-10 12:57:02'),
(63, 'MD. MUNJURUL HAQUE', 'SA FORMULATION LTD.', 'munzurul.h51286@gmail.com', '01708800403', 'GIDHORIA, SREEPUR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 'Bangladesh', 1740, '2023-10-10 13:11:43', '2023-10-10 13:11:43'),
(64, 'MD. RASHEDUL ISLAM (RASEL)', 'XCLUSIVE PLASTIC & TIN CONTAINER MANUFACTURER', 'engineering@qpail.com', '01733176705', 'MAJUKHAN BAZAR, KALIGONJ ROAD, GAZIPUR, BANGLADESH.', 'GAZIPUR', 'Bangladesh', 1720, '2023-10-10 13:45:49', '2023-10-10 13:45:49'),
(65, 'SHAHADAT HOSSEN', 'SQUARE PHARMACEUTICALS LTD.', 'shahadat.hossain@squaregroup.com', '01713048536', 'CHEMICAL DIVISION, BSCIC I/E, PABNA, BANGLADESH.', 'PABNA', 'Bangladesh', 6602, '2023-10-10 13:58:29', '2023-10-10 13:58:29'),
(66, 'MD. KAZAL DHAR', 'SMILE APPARELS LTD.', 'kazal@smileapparels.net', '01718758869', 'JHALUPAZA, SEED STORE, BHALUKA, MYMENSING BANGLADESH.', 'MYMENSING', 'Bangladesh', 2240, '2023-10-10 14:11:19', '2023-10-10 14:11:19'),
(67, 'MD. SOBUJ', 'SARWAR TEX', 'sarwartex.hs@gmail.com', '01711531942', 'BORPA, RUPGANJ, NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 'Bangladesh', 1460, '2023-10-10 14:31:49', '2023-10-10 14:31:49'),
(68, 'MD. ANWAR', 'SHAH CEMENT INDUSTRIES LTD.', 'psu_maintenance@abulkhairgroup.com', '01842363755', 'MUKTERPUR, MUNSHIGANJ,BANGLADESH.', 'MUNSHIGANJ', 'Bangladesh', 1500, '2023-10-10 14:43:20', '2023-10-10 14:43:20'),
(69, 'ENG. MD. ATIQUR RAHMAN TALUKDER', 'SHAPLA FOOD LTD.', 'shaplafood@gmail.com', '01911088999', 'PLOT-A-110-111, TONGI, BSCIC, GAZIPUR', 'GAZIPUR', 'Bangladesh', 1710, '2023-10-10 15:00:51', '2023-10-10 15:00:51'),
(70, 'MD. NURUZZAMAN RONY', 'SHUNHUA TEXTILE IND. & ACCESSORIES LTD.', 'ronibkml@gmail.com', '01738115088', 'ARAIHAJAR,NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 'Bangladesh', 1450, '2023-10-11 08:08:34', '2023-10-11 08:08:34'),
(71, 'MD. EMDAD HOSSAIN', 'AKH KNITTING & DYEING LTD.', 'info@tridentbd.com', '01712260650', 'PHULBARIA, TETULJHORA, SAVAR, DHAKA, BANGLADESH', 'DHAKA', 'Bangladesh', 1340, '2023-10-12 13:30:45', '2023-10-12 13:30:45'),
(72, 'MD. SAIFULLAH MUNSUR.', 'SAJAN METAL INDUSTRIES LTD.', 'saifullah.smil@gmail.com', '01750151820', 'FATEPUR, ARAIHAZAR, NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 'Bangladesh', 1450, '2023-10-12 14:10:24', '2023-10-21 10:47:14'),
(73, 'New Customer', 'Test New Customer', 'customer@gmail.com', '01887922061', 'test', 'test', 'Bangladesh', 456, '2023-10-17 08:43:28', '2023-10-17 08:43:28'),
(74, 'MD. SHAMIM.', 'CONFIDENCE TEXWEAR LTD.', 'info@tridentbd.com', '01313010320', 'BAGHER BAZAR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 'Bangladesh', 1710, '2023-10-17 14:27:38', '2023-10-21 10:48:49'),
(75, 'MD. HASEM', 'SS STEEL LTD.', 'eee.hasemshak@gmail.com', '01710815770', 'BLOCK-B, PLOT-04,TONGI INDUSTRIAL AREA, GAZIPUR, BANGLADESH.', 'GAZIPUR', 'Bangladesh', 1710, '2023-10-25 10:16:35', '2023-10-25 10:16:35'),
(76, 'MD.FAZLEY RABBI', 'SHARIF WASHING PLANT', 'hasanrabbi589@gmail.com', '01882396607', 'JAMGORA, ASHULIA, SAVAR, DHAKA, BANGLADESH.', 'DHAKA', 'Bangladesh', 1340, '2023-11-13 10:34:15', '2023-11-13 10:34:15'),
(77, 'RANJON KUMAR ROY', 'PIDILITE SPECIALITY CHEMICALS (BD) PVT.LTD.', 'ranjon.kumar@pidilite.com.bd', '01703903301', 'JAMIRDIA HOBIRBARI, BHALUKA, MYMENSING, BANGLADESH.', 'MYMENSING', 'Bangladesh', 2240, '2023-11-13 13:50:25', '2023-11-13 13:50:25'),
(78, 'MD. RAHUL', 'PACIFIC CONSUMERS LTD.', 'engquddus@gmail.com', '01715064228', 'JONGSHION BAZAR, LAKSAM, COMILLA, BANGLADESH.', 'COMILLA', 'Bangladesh', 3570, '2023-11-13 14:04:11', '2023-11-13 14:04:11'),
(79, 'JONAYED', 'PRAN RFL (HOBIGANJ INDUSTRIES)', 'info@tridentbd.com', '018446040001', 'OLIPUR, HOBIGANJ, BANGLADESH', 'HOBIGANJ', 'Bangladesh', 3300, '2023-11-13 15:44:42', '2023-11-13 15:44:42'),
(80, 'JONAYED', 'PRAN RFL (HOBIGANJ INDUSTRIES)', 'info@tridentbd.com', '018446040001', 'OLIPUR, HOBIGANJ, BANGLADESH', 'HOBIGANJ', 'Bangladesh', 3300, '2023-11-13 15:49:55', '2023-11-13 15:49:55'),
(81, 'SRIKANTA SUTRADHAR', 'BASHUNDHARA INDUSTRIAL COMPLEX LTD.(BAG PLANT)', 'engr.srikanta@bashundhara.com', '01710772242', 'HAZARIBAGH, SOUTH KERANIGANJ, DHAKA, BANGLADESH.', 'DHAKA', 'Bangladesh', 1311, '2023-11-16 11:27:40', '2023-11-16 11:27:40'),
(82, 'MD. RANA HOSSAIN', 'ARMY PHARMA LTD.', 'ranaarmypharma@gmail.com', '01725891010', 'JOYDEBPUR, GAZIPUR, BANGLADESH', 'GAZIPUR', 'Bangladesh', 1700, '2023-11-21 14:19:11', '2023-11-21 14:19:11'),
(83, 'MD.SUMON', 'CLARON FIBREOPTICS (BD) PRIVATE LTD.', 'sumon060@gmail.com', '01723913483', 'BANGABANDHU HI-TECH CITY, KALIAKOIR,GAZIPUR.', 'KALIAKOIR', 'Bangladesh', 1750, '2023-11-28 10:56:52', '2023-11-28 10:56:52'),
(84, 'MD.SAHIN ALAM', 'KC SPINNING MILLS LTD.', 'shaheenkcsm@gmail.com', '01774432878', '117 GODNAIL,SIDDIRGONJ,NARAYANGONJ-1400', 'NARAYANGONJ', 'Bangladesh', 1400, '2023-12-20 15:10:25', '2023-12-20 15:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT '0',
  `designation` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `deleted` enum('Yes','No') DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `serial_no`, `designation`, `token`, `deleted`, `status`, `created_by`, `created_date`, `created_at`, `updated_at`) VALUES
(3, 'Md.Shafiuzzaman', '000002', 'Engineer', NULL, 'Yes', 'Inactive', 1, '01-10-2023', '2023-10-16 09:35:13', '2023-10-16 13:35:13'),
(2, 'Employee 1', '000001', 'Engineer 1', NULL, 'Yes', 'Inactive', 1, '29-09-2023', '2023-10-16 09:35:00', '2023-10-16 13:35:00'),
(5, 'Md.Shafiuzzaman', '000004', 'Service Engineer', 'ENG5fafd6ef933c952dac89cf0494', 'Yes', 'Inactive', 1, '16-10-2023', '2023-10-16 09:35:24', '2023-10-16 13:35:24'),
(4, 'MD Sabbir Hossain', '000003', 'Engineer', 'ENG45275312537d9998daae781374', 'Yes', 'Inactive', 1, '01-10-2023', '2023-10-16 09:35:20', '2023-10-16 13:35:20'),
(6, 'Md.Mominuzzaman', '000005', 'Service Engineer', 'ENG30de9402d3744bb49dd7faa21e', 'No', 'Active', 1, '16-10-2023', '2023-10-16 13:37:43', '2023-10-16 13:37:43'),
(7, 'Md. Habibulla miah', '000006', 'Sr. Assistant Engineer', 'ENG12c21520ccb261deb4d8368835', 'No', 'Active', 1, '17-10-2023', '2023-10-17 09:03:16', '2023-10-17 09:03:16'),
(8, 'Md. Rashed', '000007', 'Assistant Engineer', 'ENG661d85819a8291a6fb67352cd2', 'No', 'Active', 1, '17-10-2023', '2023-10-17 09:03:53', '2023-10-17 09:03:53'),
(9, 'Md. Kabir Hosen', '000008', 'Assistant Engineer', 'ENGf3a44f9433a292709d0c0d80d3', 'No', 'Active', 1, '17-10-2023', '2023-10-17 09:04:32', '2023-10-17 09:04:32'),
(10, 'Md.Shohanur Rahman', '000009', 'Assistant Engineer', 'ENGec90d69e93785ad2d873aa69f0', 'No', 'Active', 1, '17-10-2023', '2023-11-21 08:39:53', '2023-11-21 13:39:53'),
(11, 'Mahasin Sarkar', '000010', 'Assistant Engineer', 'ENG6bd3fe28e44842a6306304a104', 'No', 'Active', 1, '17-10-2023', '2023-10-17 09:06:17', '2023-10-17 09:06:17'),
(12, 'test employee 101', '000011', 'test designation1', 'ENGa83d81c51621002c5f3fae9f12', 'Yes', 'Inactive', 24, '18-10-2023', '2023-10-18 03:40:42', '2023-10-18 07:40:42'),
(13, 'Md.Monjurul Islam', '000012', 'Service Engineer', 'ENGcd6c15626abc1ed8a22cf9713b', 'No', 'Active', 13, '11-11-2023', '2023-11-11 13:02:01', '2023-11-11 13:02:01'),
(14, 'Md.Zahidul Hasan', '000013', 'Service Engineer', 'ENG4fc4ba5e4f0c57ffdcbe937ee6', 'No', 'Active', 13, '20-11-2023', '2023-11-20 08:38:14', '2023-11-20 08:38:14'),
(15, 'Md.Atikur Rahman', '000014', 'Sr.Service Engineer', 'ENG4f22cf8010c62cc197c3dcb270', 'No', 'Active', 13, '21-11-2023', '2023-11-21 13:39:23', '2023-11-21 13:39:23'),
(16, 'Md.Robiul Islam', '000015', 'Assistant Engineer', 'ENG90c5055c2e3a77749165f90abe', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:24:49', '2023-12-13 13:24:49'),
(17, 'Md.Anisur Rahman', '000016', 'Assistant Engineer', 'ENGb47a59bdc2c037d43232fc7a49', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:25:28', '2023-12-13 13:25:28'),
(18, 'Md.Mahabub Hossen', '000017', 'Sr.Service Engineer', 'ENG5a46bf50df2dfba399d988d420', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:26:15', '2023-12-13 13:26:15'),
(19, 'Md.Lutfar Rahman', '000018', 'Sr.Service Engineer', 'ENGc284e0f09c41eb22eb4bd1e7b0', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:26:48', '2023-12-13 13:26:48'),
(20, 'Md.Mahabubur Rahman', '000019', 'Sr.Service Engineer', 'ENG0f1a26bcbbcfa5e474fd67fe39', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:27:40', '2023-12-13 13:27:40'),
(21, 'Md.A.S. JUEL', '000020', 'Sr.Service Engineer', 'ENGa1f7e353a105b561cb530af5e3', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:29:20', '2023-12-13 13:29:20'),
(22, 'Md.Nazimudduaula', '000021', 'Sr.Service Engineer', 'ENG18f96634e729bb4ddc43127011', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:33:15', '2023-12-13 13:33:15'),
(23, 'Md.Zakirul Islam', '000022', 'Service Engineer', 'ENGea070f091b3b22ae970af7c925', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:36:17', '2023-12-13 13:36:17'),
(24, 'Md.Sohel Rana', '000023', 'Service Engineer', 'ENGba5e06c27c55dc595c4d4800ea', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:42:51', '2023-12-13 13:42:51'),
(25, 'Md.Jahidul Islam', '000024', 'Service Engineer', 'ENGb4eed0d0e69697c43224c13066', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:44:00', '2023-12-13 13:44:00'),
(26, 'Md.Asiqul Islam', '000025', 'Service Engineer', 'ENGd370d4f7dcb97f9debd8c2facb', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:51:49', '2023-12-13 13:51:49'),
(27, 'Md.Toriqul Islam', '000026', 'Service Engineer', 'ENG2ab4060397b70148eac8195c7a', 'No', 'Active', 13, '13-12-2023', '2023-12-13 13:52:41', '2023-12-13 13:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_04_105924_create_categories_table', 2),
(6, '2023_04_04_105943_create_products_table', 2),
(7, '2023_06_01_050033_create_customers_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `deleted` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`, `deleted`, `status`) VALUES
(2, 'App\\Models\\User', 23, 'No', 'Active'),
(2, 'App\\Models\\User', 24, 'No', 'Active'),
(6, 'App\\Models\\User', 1, 'No', 'Active'),
(6, 'App\\Models\\User', 22, 'No', 'Active'),
(7, 'App\\Models\\User', 12, 'No', 'Active'),
(8, 'App\\Models\\User', 2, 'No', 'Active'),
(8, 'App\\Models\\User', 14, 'No', 'Active'),
(9, 'App\\Models\\User', 2, 'No', 'Active'),
(9, 'App\\Models\\User', 13, 'No', 'Active'),
(9, 'App\\Models\\User', 25, 'No', 'Active'),
(9, 'App\\Models\\User', 26, 'No', 'Active'),
(9, 'App\\Models\\User', 27, 'No', 'Active'),
(9, 'App\\Models\\User', 28, 'No', 'Active'),
(10, 'App\\Models\\User', 2, 'No', 'Active'),
(10, 'App\\Models\\User', 16, 'No', 'Active'),
(10, 'App\\Models\\User', 25, 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `guard_name` varchar(255) NOT NULL,
  `deleted` enum('Yes','No') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `group_name`, `guard_name`, `deleted`, `status`, `created_at`, `updated_at`) VALUES
(1, 'User List', 'User', 'web', 'No', 'Active', '2023-10-04 22:11:14', '2023-10-04 22:30:11'),
(2, 'User Create', 'User', 'web', 'No', 'Active', '2023-10-04 22:30:03', '2023-10-04 22:31:32'),
(3, 'User Edit', 'User', 'web', 'No', 'Active', '2023-10-05 07:05:15', '2023-10-05 07:05:15'),
(4, 'User Delete', 'User', 'web', 'No', 'Active', '2023-10-05 07:06:58', '2023-10-05 07:06:58'),
(5, 'User', 'User', 'web', 'No', 'Active', '2023-10-05 09:26:02', '2023-10-05 09:26:02'),
(6, 'Registration List', 'Registration', 'web', 'No', 'Active', '2023-10-09 06:50:14', '2023-10-09 06:50:50'),
(7, 'Registration Edit', 'Registration', 'web', 'No', 'Active', '2023-10-09 06:51:01', '2023-10-09 06:51:01'),
(8, 'Registration Delete', 'Registration', 'web', 'No', 'Active', '2023-10-09 06:51:14', '2023-10-09 06:51:14'),
(9, 'Registration QR Code', 'Registration', 'web', 'No', 'Active', '2023-10-09 06:51:27', '2023-10-09 06:51:27'),
(10, 'Registration Details', 'Registration', 'web', 'No', 'Active', '2023-10-09 06:51:53', '2023-10-09 06:51:53'),
(11, 'Registration Attachment', 'Registration', 'web', 'No', 'Active', '2023-10-09 06:52:05', '2023-10-09 06:52:05'),
(12, 'Registration Create', 'Registration', 'web', 'No', 'Active', '2023-10-09 06:52:16', '2023-10-09 06:52:16'),
(13, 'Claim List', 'Claim', 'web', 'No', 'Active', '2023-10-09 06:52:38', '2023-10-09 06:52:38'),
(14, 'Claim Create', 'Claim', 'web', 'No', 'Active', '2023-10-09 06:52:46', '2023-10-09 06:52:46'),
(15, 'Claim Details', 'Claim', 'web', 'No', 'Active', '2023-10-09 06:52:56', '2023-10-09 06:52:56'),
(16, 'Claim Edit', 'Claim', 'web', 'No', 'Active', '2023-10-09 06:53:03', '2023-10-09 06:53:03'),
(17, 'Claim Delete', 'Claim', 'web', 'No', 'Active', '2023-10-09 06:53:10', '2023-10-09 06:53:10'),
(18, 'Claim Exel', 'Claim', 'web', 'No', 'Active', '2023-10-09 06:53:34', '2023-10-09 06:53:34'),
(19, 'Registration Exel', 'Registration', 'web', 'No', 'Active', '2023-10-09 06:53:54', '2023-10-09 06:53:54'),
(20, 'Service List', 'Service', 'web', 'No', 'Active', '2023-10-09 06:54:07', '2023-10-09 06:54:07'),
(21, 'Service Create', 'Service', 'web', 'No', 'Active', '2023-10-09 06:54:25', '2023-10-09 06:54:25'),
(22, 'Service Details', 'Service', 'web', 'No', 'Active', '2023-10-09 06:54:33', '2023-10-09 06:54:33'),
(23, 'Roles List', 'Roles', 'web', 'No', 'Active', '2023-10-09 06:55:19', '2023-10-09 06:55:19'),
(24, 'Roles Create', 'Roles', 'web', 'No', 'Active', '2023-10-09 06:55:27', '2023-10-09 06:55:27'),
(25, 'Roles Edit', 'Roles', 'web', 'No', 'Active', '2023-10-09 06:55:34', '2023-10-09 06:55:34'),
(26, 'Roles Delete', 'Roles', 'web', 'No', 'Active', '2023-10-09 06:55:41', '2023-10-09 06:55:41'),
(27, 'Permission List', 'Permission', 'web', 'No', 'Active', '2023-10-09 06:56:25', '2023-10-09 06:56:25'),
(28, 'Permission Create', 'Permission', 'web', 'No', 'Active', '2023-10-09 06:56:32', '2023-10-09 06:56:32'),
(29, 'Permission Edit', 'Permission', 'web', 'No', 'Active', '2023-10-09 06:56:39', '2023-10-09 06:56:39'),
(30, 'Permission Delete', 'Permission', 'web', 'No', 'Active', '2023-10-09 06:56:46', '2023-10-09 06:56:46'),
(33, 'Category List', 'Category', 'web', 'No', 'Active', '2023-10-09 06:58:36', '2023-10-09 06:58:36'),
(34, 'Category Create', 'Category', 'web', 'No', 'Active', '2023-10-09 06:58:43', '2023-10-09 06:58:43'),
(35, 'Category', 'Category', 'web', 'No', 'Active', '2023-10-09 06:58:49', '2023-10-09 06:58:49'),
(36, 'Category Edit', 'Category', 'web', 'No', 'Active', '2023-10-09 06:58:58', '2023-10-09 06:58:58'),
(37, 'Category Delete', 'Category', 'web', 'No', 'Active', '2023-10-09 06:59:05', '2023-10-09 06:59:05'),
(38, 'Product', 'Product', 'web', 'No', 'Active', '2023-10-09 06:59:25', '2023-10-09 06:59:25'),
(39, 'Product List', 'Product', 'web', 'No', 'Active', '2023-10-09 06:59:31', '2023-10-09 06:59:31'),
(40, 'Product Create', 'Product', 'web', 'No', 'Active', '2023-10-09 06:59:37', '2023-10-09 06:59:37'),
(41, 'Product Edit', 'Product', 'web', 'No', 'Active', '2023-10-09 06:59:44', '2023-10-09 06:59:44'),
(42, 'Product Delete', 'Product', 'web', 'No', 'Active', '2023-10-09 06:59:53', '2023-10-09 06:59:53'),
(43, 'Spare Parts', 'Spare Parts', 'web', 'No', 'Active', '2023-10-09 07:00:16', '2023-10-09 07:00:16'),
(44, 'Spare Parts List', 'Spare Parts', 'web', 'No', 'Active', '2023-10-09 07:00:22', '2023-10-09 07:00:22'),
(45, 'Spare Parts Create', 'Spare Parts', 'web', 'No', 'Active', '2023-10-09 07:00:29', '2023-10-09 07:00:29'),
(46, 'Spare Parts Edit', 'Spare Parts', 'web', 'No', 'Active', '2023-10-09 07:00:35', '2023-10-09 07:00:35'),
(47, 'Spare Parts Delete', 'Spare Parts', 'web', 'No', 'Active', '2023-10-09 07:00:41', '2023-10-09 07:00:41'),
(48, 'Employee', 'Employee', 'web', 'No', 'Active', '2023-10-09 07:00:52', '2023-10-09 07:00:52'),
(49, 'Employee Create', 'Employee', 'web', 'No', 'Active', '2023-10-09 07:00:58', '2023-10-09 07:00:58'),
(50, 'Employee List', 'Employee', 'web', 'No', 'Active', '2023-10-09 07:01:05', '2023-10-09 07:01:05'),
(51, 'Employee Edit', 'Employee', 'web', 'No', 'Active', '2023-10-09 07:01:19', '2023-10-09 07:01:19'),
(52, 'Employee Delete', 'Employee', 'web', 'No', 'Active', '2023-10-09 07:01:28', '2023-10-09 07:01:28'),
(53, 'Shop Setting', 'Shop Setting', 'web', 'No', 'Active', '2023-10-09 07:01:43', '2023-10-09 07:01:43'),
(54, 'Registration', 'Registration', 'web', 'No', 'Active', '2023-10-09 07:02:19', '2023-10-09 07:02:19'),
(55, 'Claim', 'Claim', 'web', 'No', 'Active', '2023-10-09 07:02:29', '2023-10-09 07:02:29'),
(56, 'Service', 'Service', 'web', 'No', 'Active', '2023-10-09 07:02:44', '2023-10-23 07:51:48'),
(57, 'Roles', 'Roles', 'web', 'No', 'Active', '2023-10-09 07:03:02', '2023-10-09 07:03:02'),
(58, 'Permission', 'Permission', 'web', 'No', 'Active', '2023-10-09 07:18:21', '2023-10-09 07:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ex_factory_date` varchar(50) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `model` text DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `deleted` enum('Yes','No') DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_date` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `ex_factory_date`, `category_id`, `serial_no`, `description`, `model`, `token`, `status`, `deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted_by`, `deleted_date`, `created_at`, `updated_at`) VALUES
(1, 'Test product', NULL, 1, '498494151518948485', NULL, 'GT_4894841', NULL, 'Inactive', 'Yes', 1, '05-04-2023', NULL, NULL, 1, '06-04-2023', '2023-04-05 04:50:48', '2023-04-05 23:24:29'),
(2, 'TRP Compressor', NULL, 1, '8974984515144', NULL, 'GT_4894841', NULL, 'Inactive', 'Yes', 1, '05-04-2023', NULL, NULL, 1, '03-08-2023', '2023-04-05 05:27:25', '2023-08-03 09:30:26'),
(3, 'RTY Air COMP', NULL, 1, '87356487542387', NULL, 'GT_4894841', NULL, 'Inactive', 'No', 1, '05-04-2023', NULL, NULL, NULL, NULL, '2023-04-05 05:27:50', '2023-05-31 15:30:30'),
(4, 'Tyrui Cooler', NULL, 2, '798989844', NULL, 'GT_4894841', NULL, 'Inactive', 'Yes', 1, '05-04-2023', NULL, NULL, 1, '03-08-2023', '2023-04-05 05:28:12', '2023-08-03 09:30:30'),
(5, 'RTYU Zend Dryer', NULL, 2, '4234534534534', NULL, 'GT_4894841', NULL, 'Inactive', 'Yes', 1, '05-04-2023', NULL, NULL, 1, '03-08-2023', '2023-04-05 05:28:33', '2023-08-03 09:30:21'),
(6, '6-RTF generator', NULL, 3, '7897989494', NULL, 'GT_4894841', NULL, 'Inactive', 'Yes', 1, '05-04-2023', NULL, NULL, 1, '03-08-2023', '2023-04-05 05:30:23', '2023-08-03 09:30:16'),
(7, 'TYRU Generator-450', NULL, 3, '34534253453453', NULL, 'GT_4894841', NULL, 'Inactive', 'Yes', 1, '05-04-2023', NULL, NULL, 1, '03-08-2023', '2023-04-05 05:30:38', '2023-08-03 09:30:12'),
(8, 'Walton RT gen', NULL, 3, '9858694', NULL, 'GT_4894841', NULL, 'Inactive', 'Yes', 1, '05-04-2023', NULL, NULL, 1, '03-08-2023', '2023-04-05 05:31:04', '2023-08-03 09:30:07'),
(9, 'TAC-75', NULL, 2, '20220423', NULL, NULL, NULL, 'Inactive', 'Yes', 1, '30-07-2023', NULL, NULL, 1, '03-08-2023', '2023-07-30 08:27:17', '2023-08-03 11:04:19'),
(10, 'TAS-175PMC_132kW-10A', NULL, 1, '22070041', NULL, NULL, NULL, 'Inactive', 'Yes', 1, '30-07-2023', NULL, NULL, 1, '03-08-2023', '2023-07-30 08:54:10', '2023-08-03 11:04:22'),
(11, 'TAC-150_3 kW', NULL, 2, '20220423', NULL, NULL, NULL, 'Inactive', 'Yes', 1, '30-07-2023', NULL, NULL, 1, '03-08-2023', '2023-07-30 09:27:38', '2023-08-03 11:04:26'),
(12, 'test producr', NULL, 19, '123456789', NULL, NULL, NULL, 'Inactive', 'Yes', 1, '31-07-2023', NULL, NULL, 1, '01-08-2023', '2023-07-31 08:32:06', '2023-08-01 06:49:37'),
(13, 'TAS-60PMC', '2023-05-01', 1, '22070025', NULL, 'TYX-182', NULL, 'Inactive', 'Yes', 1, '31-07-2023', NULL, NULL, 1, '05-10-2023', '2023-07-31 08:34:34', '2023-10-05 09:51:07'),
(14, 'Test Product', '2023-07-14', 2, '123456789', NULL, NULL, NULL, 'Inactive', 'Yes', 1, '01-08-2023', NULL, NULL, 1, '03-08-2023', '2023-08-01 06:49:59', '2023-08-03 09:30:02'),
(15, 'TYX-180', '2023-06-08', 2, 'HN221220', NULL, 'TYX-180', NULL, 'Inactive', 'Yes', 1, '03-08-2023', NULL, NULL, 1, '05-10-2023', '2023-08-03 10:38:08', '2023-10-05 09:51:13'),
(17, 'sayedtest', '2023-07-04', 1, '87654', NULL, '2356', NULL, 'Inactive', 'Yes', 1, '03-08-2023', NULL, NULL, 1, '05-10-2023', '2023-08-03 11:56:30', '2023-10-05 09:51:04'),
(18, 'Test Peoduct', '2023-10-05', 2, '123456', NULL, 'TP123', '583bc9f6a8e4219a4139c638cc', 'Inactive', 'Yes', 1, '05-10-2023', NULL, NULL, 1, '05-10-2023', '2023-10-05 08:28:06', '2023-10-05 09:50:59'),
(19, 'TAC-75', '2022-04-23', 20, '20220423', NULL, 'TAC-75_(10.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '05-10-2023', NULL, NULL, NULL, NULL, '2023-10-05 08:34:22', '2023-11-21 14:45:00'),
(20, 'TAC-75', '2022-04-23', 2, '20220423', NULL, 'TAC-75_(10.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '05-10-2023', NULL, NULL, NULL, NULL, '2023-10-05 08:41:36', '2023-11-21 14:44:46'),
(21, 'TYX-180', '2022-12-20', 22, 'HN221220', NULL, 'TYX-180_(18m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '05-10-2023', NULL, NULL, NULL, NULL, '2023-10-05 09:51:56', '2023-11-21 15:04:34'),
(22, 'TAS-60PMC', '2022-07-25', 20, '22070025', NULL, 'TAS-60PMC_45KW_380V_IP55', NULL, 'Active', 'No', 1, '05-10-2023', NULL, NULL, NULL, NULL, '2023-10-05 09:58:25', '2023-11-21 11:30:38'),
(23, 'TAS-75 PMC', '2023-04-03', 20, '23040309', NULL, 'TAS-75 PMC_55KW_380V_IP55', NULL, 'Active', 'No', 1, '05-10-2023', NULL, NULL, NULL, NULL, '2023-10-05 10:13:43', '2023-11-21 11:31:25'),
(24, 'TAS-100PMC', '2022-07-14', 20, '22070142', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 09:33:36', '2023-11-21 11:31:42'),
(25, 'TAS-100PMC', '2023-03-11', 20, '22120781', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 09:39:00', '2023-11-21 11:31:58'),
(26, 'TAC-150', '2023-03-11', 2, '20230102064', NULL, 'TAC-150_(18 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 10:01:46', '2023-11-21 14:59:45'),
(27, 'TAS-20PMC', '2022-12-01', 20, '22070748', NULL, 'TAS-20PMC_15KW_380V_IP55', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 10:10:22', '2023-11-21 11:29:58'),
(28, 'TAC-30', '2022-12-01', 2, '220725018', NULL, 'TAC-30_(3.8 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 10:11:39', '2023-11-21 15:00:03'),
(29, 'TAC-150', '2023-06-05', 2, '20220725014', NULL, 'TAC-150_(20 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 10:33:39', '2023-11-21 15:00:34'),
(30, 'TAS-30HB', '2023-06-21', 20, '23050169', NULL, 'TAS-30HB_22KW_380V_IP55', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 12:32:38', '2023-11-21 11:26:50'),
(31, 'TAC-50', '2023-01-05', 2, '20220725006', NULL, 'TAC-50(6.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 12:33:41', '2023-11-21 15:00:54'),
(32, 'TAS-20HB', '2023-02-06', 20, '22070308', NULL, 'TAS-20HB_15KW_380V_IP55', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 12:50:28', '2023-11-21 11:27:07'),
(33, 'TAC-30', '2023-07-26', 2, '20211217A', NULL, 'TAC-30_(3.8 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '07-10-2023', NULL, NULL, NULL, NULL, '2023-10-07 12:52:33', '2023-11-21 15:01:10'),
(34, 'TAS-125PMC', '2022-02-21', 20, '22100097', NULL, 'TAS-125PMC_90KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 08:46:24', '2023-11-21 11:27:35'),
(35, 'TYX-180', '2022-11-10', 22, '221017001', NULL, 'TYX-180_(0.13m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 08:48:15', '2023-11-21 15:03:39'),
(36, 'TAS-60PMC', '2022-07-29', 20, '22040102', NULL, 'TAS-60PMC', NULL, 'Inactive', 'Yes', 1, '08-10-2023', NULL, NULL, 1, '17-10-2023', '2023-10-08 09:15:50', '2023-10-17 14:05:53'),
(37, 'TAC-100', '2022-07-29', 2, '20220423', NULL, 'TAC-100_(13.5 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 09:16:36', '2023-11-21 14:44:33'),
(38, 'TAC-30', '2023-04-15', 2, '20220725002', NULL, 'TAC-30_(3.8 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 09:36:45', '2023-11-21 14:59:05'),
(39, 'TAS-100PMC', '2022-07-16', 20, 'ZY2112112957', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 09:59:12', '2023-11-21 11:22:20'),
(40, 'TAC-150', '2022-07-16', 2, '20220423', NULL, 'TAC-150_(20 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 10:02:47', '2023-11-21 14:44:20'),
(41, 'TAS-100PMC', '2023-01-15', 20, '22070142', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 10:14:05', '2023-11-21 11:22:35'),
(42, 'TAC-150', '2023-01-15', 2, '20220725015', NULL, 'TAC-150_(20 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 10:15:06', '2023-11-21 14:58:42'),
(43, 'TAC-400', '2023-06-30', 2, '20230530005', NULL, 'TAC-400_(45 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 10:28:22', '2023-11-21 14:58:01'),
(44, 'TAS-40HB', '2023-04-12', 20, '21110855', NULL, 'TAS-40HB_30KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 10:37:45', '2023-11-21 11:21:57'),
(45, 'TAC-75', '2023-04-12', 2, '20211217H', NULL, 'TAC-75_(10.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 10:38:23', '2023-11-21 14:57:26'),
(46, 'TAS-40HB', '2023-01-01', 20, '21110856', NULL, 'TAS-40HB_30KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 10:40:07', '2023-11-21 11:22:53'),
(47, 'TAC-75', '2023-01-01', 2, '20211217G', NULL, 'TAC-75_(10.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 10:40:46', '2023-11-21 14:57:44'),
(48, 'TYX-085', '2023-07-03', 22, 'HN221220', NULL, 'TYX-085_(8.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 11:02:30', '2023-11-21 14:57:06'),
(49, 'TAS-75PMC', '2023-02-12', 20, '22070042', NULL, 'TAS-75PMC_55KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 12:35:16', '2023-11-21 11:21:09'),
(50, 'TYX-110', '2023-02-12', 22, 'HN221220', NULL, 'TYX-110_(11 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 12:38:58', '2023-11-21 14:56:08'),
(51, 'TAS-20HB', '2023-04-12', 20, '22070309', NULL, 'TAS-20HB_15KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 12:55:06', '2023-11-21 11:20:54'),
(52, 'TAS-40PMC', '2022-03-18', 20, '211204477', NULL, 'TAS-40PMC_30KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 13:13:20', '2023-11-21 11:20:40'),
(53, 'TAS-75PMC', '2023-06-18', 20, '23051289', NULL, 'TAS-75PMC_55KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 13:25:48', '2023-11-21 11:20:22'),
(54, 'TAC-120', '2023-06-18', 2, '20230628003', NULL, 'TAC-120(16m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 13:27:12', '2023-11-21 14:54:36'),
(55, 'TAS-100PMC', '2022-04-23', 20, 'ZY2201113030', NULL, 'TAS-100PMC', NULL, 'Inactive', 'Yes', 1, '08-10-2023', NULL, NULL, 1, '08-10-2023', '2023-10-08 13:40:33', '2023-10-08 13:43:17'),
(56, 'TAC-150', '2022-04-23', 2, '20220423', NULL, 'TAC-150_(20 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 13:41:33', '2023-11-21 14:44:07'),
(57, 'TAS-100PMC', '2022-04-23', 20, '22040106', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 13:44:29', '2023-11-21 11:21:30'),
(58, 'TAS-60PMC', '2022-04-20', 20, '22040103', NULL, 'TAS-60PMC_45KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 13:59:48', '2023-11-21 11:20:01'),
(59, 'TAC-100', '2023-04-20', 2, '0220423', NULL, 'TAC-100_(13.5 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 14:00:50', '2023-11-21 14:54:08'),
(60, 'TAS-30HB', '2021-11-26', 20, '21110753', NULL, 'TAS-30HB_22KW_380V_IP55', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 14:22:09', '2023-11-21 11:19:39'),
(61, 'TAC-50', '2021-11-26', 2, '20211217D', NULL, 'TAC-50(6.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '08-10-2023', NULL, NULL, NULL, NULL, '2023-10-08 14:22:44', '2023-11-21 14:53:46'),
(62, 'TAS-30HB', '2021-11-18', 20, '21110754', NULL, 'TAS-30HB_22KW_380V_IP55', NULL, 'Active', 'No', 1, '09-10-2023', NULL, NULL, NULL, NULL, '2023-10-09 12:50:03', '2023-11-21 11:19:23'),
(63, 'TAC-50', '2021-12-18', 2, '20211217C', NULL, 'TAC-50(6.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '09-10-2023', NULL, NULL, NULL, NULL, '2023-10-09 12:51:04', '2023-11-21 14:53:28'),
(64, 'TAS-175PMC', '2022-07-16', 20, '22070041', NULL, 'TAS-175PMC_132KW_380V_IP55', NULL, 'Active', 'No', 1, '09-10-2023', NULL, NULL, NULL, NULL, '2023-10-09 13:04:25', '2023-11-21 11:19:08'),
(65, 'TAC-300', '2022-07-16', 2, '20220720001', NULL, 'TAC-300_(36 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '09-10-2023', NULL, NULL, NULL, NULL, '2023-10-09 13:06:20', '2023-11-21 14:53:11'),
(66, 'TAS-175PMC', '2023-05-16', 20, '23050264', NULL, 'TAS-175PMC_132KW_380V_IP55', NULL, 'Active', 'No', 1, '09-10-2023', NULL, NULL, NULL, NULL, '2023-10-09 13:30:08', '2023-11-21 11:18:55'),
(67, 'TAC-300', '2023-05-16', 2, '20230509001', NULL, 'TAC-300_(36 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '09-10-2023', NULL, NULL, NULL, NULL, '2023-10-09 13:32:17', '2023-11-21 14:52:53'),
(68, 'TAC-120', '2022-07-15', 2, '20220725012', NULL, 'TAC-120(16m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 07:10:22', '2023-11-21 14:50:53'),
(69, 'TAC-30', '2022-07-15', 2, '20220725001', NULL, 'TAC-30_(3.8 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 07:16:07', '2023-11-21 14:50:30'),
(70, 'AS-60PMC', '2021-12-16', 20, '21120448', NULL, 'AS-60PMC_45KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 07:32:31', '2023-11-21 11:18:13'),
(71, 'TAC-100', '2021-12-16', 2, '20211217E', NULL, 'TAC-100_(13.5 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 07:33:49', '2023-11-21 14:50:16'),
(72, 'TAS-30HB', '2022-07-16', 20, '22070059', NULL, 'TAS-30HB_22KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 07:57:27', '2023-11-21 11:17:38'),
(73, 'TAC-50', '2022-07-16', 2, '20220725005', NULL, 'TAC-50(6.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 08:02:36', '2023-11-21 14:49:59'),
(74, 'TAS-100HVF', '2022-07-04', 20, '22070439', NULL, 'TAS-100HVF_75KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 08:55:28', '2023-11-21 11:17:19'),
(75, 'TAS-200HB', '2022-07-07', 20, '22070760', NULL, 'TAS-200HB_160KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 09:20:29', '2023-11-21 11:16:52'),
(76, 'TAC-400', '2022-07-07', 2, '20220720002', NULL, 'TAC-400_(45 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 09:25:26', '2023-11-21 14:49:40'),
(77, 'TAS-20HB', '2021-11-17', 20, '21110751', NULL, 'TAS-20HB_15KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 09:39:55', '2023-11-21 11:15:52'),
(78, 'TAC-30', '2021-11-17', 2, '20211217B', NULL, 'TAC-30_(3.8 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 09:40:48', '2023-11-21 14:47:41'),
(79, 'TAS-30HB', '2022-07-05', 20, '22070057', NULL, 'TAS-30HB_22KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 09:42:50', '2023-11-21 11:15:38'),
(80, 'TAS-100PMC', '2022-04-23', 20, '22040104', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 09:49:54', '2023-11-21 11:15:08'),
(81, 'TAC-150', '2022-04-23', 2, '20220423', NULL, 'TAC-150_(20 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 09:50:51', '2023-11-21 14:43:52'),
(82, 'TAS-100PMC', '2021-12-09', 20, '21110933', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 10:04:41', '2023-11-21 11:14:55'),
(83, 'TAC-150', '2021-12-09', 2, '20211217F', NULL, 'TAC-150_(18 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 10:06:13', '2023-11-21 14:47:13'),
(84, 'TAS-40PMC', '2022-07-06', 20, '22070666', NULL, 'TAS-40PMC_30KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 10:43:40', '2023-11-21 11:14:32'),
(85, 'TAS-30HB', '2022-07-05', 20, '22070058', NULL, 'TAS-30HB_22KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 12:34:49', '2023-11-21 11:12:36'),
(86, 'TAS-100PMC', '2022-07-01', 20, '22070145', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 12:51:57', '2023-11-21 11:12:22'),
(87, 'TAS-100PMC', '2022-07-01', 20, '22070145', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 12:51:57', '2023-11-21 11:12:02'),
(88, 'TAS-75PMC', '2022-03-10', 20, '22031063', NULL, 'TAS-75PMC_55KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 13:05:16', '2023-11-21 11:11:47'),
(89, 'TAC-120', '2022-04-23', 2, '20220423', NULL, 'TAC-120(16m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 13:06:28', '2023-11-21 14:43:18'),
(90, 'TAS-50HB', '2022-07-04', 20, '22070437', NULL, 'TAS-50HB_37KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 13:40:46', '2023-11-21 11:11:21'),
(91, 'TAS-20HB', '2021-11-07', 20, '21110750', NULL, 'TAS-20HB_15KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 13:54:07', '2023-11-21 11:10:55'),
(92, 'TAS-75PMC', '2022-09-08', 20, '22090843', NULL, 'TAS-75PMC_55KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 14:04:45', '2023-11-21 11:10:23'),
(93, 'TAC-120', '2022-09-24', 2, '20220924001', NULL, 'TAC-120(16m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 14:07:04', '2023-11-21 14:36:04'),
(94, 'TAS-30HB', '2022-07-06', 20, '22070060', NULL, 'TAS-30HB_22KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 14:26:06', '2023-11-21 11:09:50'),
(95, 'TAC-50', '2022-07-25', 2, '20220725007', NULL, 'TAC-50(6.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 14:28:33', '2023-11-21 14:35:44'),
(96, 'TAS-100PMC', '2022-07-01', 20, '22070144', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 14:38:06', '2023-11-21 11:09:01'),
(97, 'TAC-150', '2022-07-25', 2, '20220725013', NULL, 'TAC-150_(20 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 14:39:21', '2023-11-21 14:33:24'),
(98, 'TAS-50PMC', '2022-04-09', 20, '22040090', NULL, 'TAS-50PMC_37KW_380V_IP55', NULL, 'Active', 'No', 1, '10-10-2023', NULL, NULL, NULL, NULL, '2023-10-10 14:56:27', '2023-11-21 11:08:41'),
(99, 'TAS-50PMC', '2022-04-09', 20, '22040091', NULL, 'TAS-50PMC_37KW_380V_IP55', NULL, 'Active', 'No', 1, '11-10-2023', NULL, NULL, NULL, NULL, '2023-10-11 07:37:46', '2023-11-21 11:07:56'),
(100, 'TAS-60PMC', '2022-07-02', 20, '22070024', NULL, 'TAS-60PMC_45KW_380V_IP55', NULL, 'Active', 'No', 1, '11-10-2023', NULL, NULL, NULL, NULL, '2023-10-11 08:03:14', '2023-11-21 11:07:27'),
(101, 'TAC-100', '2022-07-25', 2, '20220725010', NULL, 'TAC-100_(13.5 m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '11-10-2023', NULL, NULL, NULL, NULL, '2023-10-11 08:04:27', '2023-11-21 14:32:34'),
(102, 'TAC-120', '2023-05-15', 2, '20230515008', NULL, 'TAC-120(16m³/min)_380V_50HZ', NULL, 'Active', 'No', 1, '12-10-2023', NULL, NULL, NULL, NULL, '2023-10-12 13:23:45', '2023-11-21 14:31:05'),
(103, 'TAS-50PMC', '2021-12-08', 20, '21110862', NULL, 'TAS-50PMC_37KW_380V_IP55', NULL, 'Active', 'No', 1, '12-10-2023', NULL, NULL, NULL, NULL, '2023-10-12 14:06:28', '2023-11-21 11:05:34'),
(104, 'TAC-75', '2022-04-23', 2, '20220423', NULL, 'TAC-75_(10.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 1, '12-10-2023', NULL, NULL, NULL, NULL, '2023-10-12 14:07:27', '2023-11-21 12:09:56'),
(105, 'Test Xpert 44', '2023-10-16', 2, '123456', NULL, '44tx', NULL, 'Inactive', 'Yes', 1, '16-10-2023', NULL, NULL, 1, '17-10-2023', '2023-10-16 09:10:24', '2023-10-17 10:46:13'),
(106, 'TAS-100 PMC', '2022-04-01', 20, '22040105', NULL, 'TAS-100 PMC_75KW_380V_IP55', NULL, 'Active', 'No', 1, '17-10-2023', NULL, NULL, NULL, NULL, '2023-10-17 14:22:49', '2023-11-21 11:07:03'),
(107, 'test product 101', '2023-10-17', 2, '1234561', NULL, 'TP101', NULL, 'Inactive', 'Yes', 24, '18-10-2023', NULL, NULL, 24, '18-10-2023', '2023-10-18 07:36:42', '2023-10-18 07:37:15'),
(108, 'TAS-40PMC', '2023-03-09', 20, '23030993', NULL, 'TAS-40PMC_30KW_380V_IP55', NULL, 'Active', 'No', 14, '21-10-2023', NULL, NULL, NULL, NULL, '2023-10-21 10:44:53', '2023-11-21 11:06:24'),
(109, 'TAS-40HB', '2021-09-08', 20, '21090887', NULL, 'TAS-40HB_30KW_380V_IP55', NULL, 'Active', 'No', 16, '23-10-2023', NULL, NULL, NULL, NULL, '2023-10-23 09:34:26', '2023-11-21 11:02:11'),
(110, 'TAS-20HB', '2022-07-03', 20, '22070310', NULL, 'TAS-20HB_15KW_380V_IP55', NULL, 'Active', 'No', 16, '23-10-2023', NULL, NULL, NULL, NULL, '2023-10-23 09:38:02', '2023-11-21 11:01:37'),
(111, 'TAC-100', '2022-07-25', 2, '20220725011', NULL, 'TAC-100_(13.5 m³/min)_380V_50HZ', NULL, 'Active', 'No', 14, '25-10-2023', NULL, NULL, NULL, NULL, '2023-10-25 10:13:02', '2023-11-21 12:07:51'),
(112, 'TAS-20HB', '2023-08-03', 20, '23080325', NULL, 'TAS-20HB_15KW_380V_IP55', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 10:15:04', '2023-11-21 11:05:49'),
(113, 'TAC-30', '2023-07-28', 2, '20230728004', NULL, 'TAC-30_(3.8 m³/min)_220V_50HZ', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 10:16:57', '2023-11-21 12:06:12'),
(114, 'TAS-20HB', '2022-07-03', 20, '22070307', NULL, 'TAS-20HB_15KW_380V_IP55', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 13:44:18', '2023-11-21 11:02:42'),
(115, 'TAC-30', '2022-07-25', 2, '20220725004', NULL, 'TAC-30_(3.8 m³/min)_220V_50HZ', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 13:45:17', '2023-11-21 12:04:50'),
(116, 'TAS-20HB', '2022-07-03', 20, '22070310', NULL, 'TAS-20HB_15KW_380V_IP55', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 13:57:19', '2023-11-21 11:01:01'),
(117, 'TAC-30', '2022-07-25', 2, '20220725003', NULL, 'TAC-30_(3.8 m³/min)_220V_50HZ', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 13:58:13', '2023-11-21 12:03:08'),
(118, 'TAS-60HB', '2023-08-07', 20, '23080710', NULL, 'TAS-60HB_45KW_380V_IP55', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 14:16:54', '2023-11-21 11:04:38'),
(119, 'TAC-150', '2022-07-25', 2, '20220725016', NULL, 'TAC-150_(20 m³/min)_380V_50HZ', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 15:41:10', '2023-11-21 11:56:34'),
(120, 'TAC-150', '2022-07-25', 2, '20220725018', NULL, 'TAC-150_(20 m³/min)_380V_50HZ', NULL, 'Active', 'No', 14, '13-11-2023', NULL, NULL, NULL, NULL, '2023-11-13 15:48:04', '2023-11-21 11:55:50'),
(121, 'TAS-100PMC', '2022-07-01', 20, '22070145', NULL, 'TAS-100PMC_75KW_380V_IP55', NULL, 'Active', 'No', 14, '16-11-2023', NULL, NULL, NULL, NULL, '2023-11-16 11:23:39', '2023-11-21 10:59:36'),
(122, 'TAS-30PMC', '2023-05-03', 20, '23040374', NULL, 'TAS-30PMC_22KW_380V_IP55', NULL, 'Active', 'No', 14, '21-11-2023', NULL, NULL, NULL, NULL, '2023-11-21 13:57:52', '2023-11-21 13:57:52'),
(123, 'TYX-085', '2023-05-16', 22, 'HN230514', NULL, 'TYX-085_(8.5 m³/min)_220V_50HZ', NULL, 'Active', 'No', 14, '21-11-2023', NULL, NULL, NULL, NULL, '2023-11-21 14:12:51', '2023-11-21 14:28:48'),
(124, 'TAS-60 PMC', '2022-04-01', 20, '22040102', NULL, 'TAS-60 PMC_45KW_380V_IP55', NULL, 'Active', 'No', 14, '23-11-2023', NULL, NULL, NULL, NULL, '2023-11-23 13:33:21', '2023-11-23 13:33:21'),
(125, 'TAS-30HB', '2023-09-09', 20, '23090401', NULL, 'TAS-30HB_22KW_380V_IP55', NULL, 'Active', 'No', 13, '28-11-2023', NULL, NULL, NULL, NULL, '2023-11-28 10:49:47', '2023-11-28 10:49:47'),
(126, 'TAC-50', '2023-09-09', 2, '20230516001', NULL, 'TAC-50HB_(6.5m³/min)_220V_50HZ', NULL, 'Active', 'No', 13, '28-11-2023', NULL, NULL, NULL, NULL, '2023-11-28 10:51:52', '2023-11-28 10:51:52'),
(127, 'TAS-100PMC', '2023-11-29', 20, '22070143', NULL, 'TAS-100PMC_(11.2m³/min)_75KW_380V_IP55', NULL, 'Active', 'No', 13, '20-12-2023', NULL, NULL, NULL, NULL, '2023-12-20 15:03:35', '2023-12-20 15:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `guard_name` varchar(255) NOT NULL,
  `deleted` enum('Yes','No') DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `deleted`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Super Admin', 'web', 'No', 'Active', '2023-10-04 21:32:19', '2023-10-04 21:32:19'),
(2, 'Admin', 'web', 'No', 'Active', '2023-09-23 10:30:15', '2023-10-04 21:30:33'),
(7, 'Sales', 'web', 'No', 'Active', '2023-10-08 11:49:54', '2023-10-08 11:50:03'),
(8, 'Warranty Claims', 'web', 'No', 'Active', '2023-10-08 11:50:57', '2023-10-08 11:56:37'),
(9, 'Services', 'web', 'No', 'Active', '2023-10-08 11:52:13', '2023-10-23 07:51:07'),
(10, 'Engineer', 'web', 'No', 'Active', '2023-10-08 11:52:26', '2023-10-08 11:52:26'),
(11, 'Settings', 'web', 'No', 'Active', '2023-10-08 11:58:27', '2023-10-11 10:18:47');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `deleted` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`, `deleted`, `status`) VALUES
(1, 2, 'No', 'Active'),
(1, 6, 'No', 'Active'),
(1, 9, 'No', 'Active'),
(1, 10, 'No', 'Active'),
(2, 2, 'No', 'Active'),
(2, 6, 'No', 'Active'),
(2, 9, 'No', 'Active'),
(2, 10, 'No', 'Active'),
(3, 2, 'No', 'Active'),
(3, 6, 'No', 'Active'),
(3, 9, 'No', 'Active'),
(3, 10, 'No', 'Active'),
(4, 2, 'No', 'Active'),
(4, 6, 'No', 'Active'),
(4, 9, 'No', 'Active'),
(4, 10, 'No', 'Active'),
(5, 2, 'No', 'Active'),
(5, 6, 'No', 'Active'),
(5, 9, 'No', 'Active'),
(5, 10, 'No', 'Active'),
(6, 2, 'No', 'Active'),
(6, 6, 'No', 'Active'),
(6, 7, 'No', 'Active'),
(6, 8, 'No', 'Active'),
(6, 9, 'No', 'Active'),
(7, 2, 'No', 'Active'),
(7, 6, 'No', 'Active'),
(7, 7, 'No', 'Active'),
(7, 8, 'No', 'Active'),
(7, 9, 'No', 'Active'),
(8, 2, 'No', 'Active'),
(8, 6, 'No', 'Active'),
(8, 7, 'No', 'Active'),
(8, 8, 'No', 'Active'),
(8, 9, 'No', 'Active'),
(9, 2, 'No', 'Active'),
(9, 6, 'No', 'Active'),
(9, 7, 'No', 'Active'),
(9, 8, 'No', 'Active'),
(9, 9, 'No', 'Active'),
(10, 2, 'No', 'Active'),
(10, 6, 'No', 'Active'),
(10, 7, 'No', 'Active'),
(10, 8, 'No', 'Active'),
(10, 9, 'No', 'Active'),
(11, 2, 'No', 'Active'),
(11, 6, 'No', 'Active'),
(11, 7, 'No', 'Active'),
(11, 8, 'No', 'Active'),
(11, 9, 'No', 'Active'),
(12, 2, 'No', 'Active'),
(12, 6, 'No', 'Active'),
(12, 7, 'No', 'Active'),
(12, 8, 'No', 'Active'),
(12, 9, 'No', 'Active'),
(13, 2, 'No', 'Active'),
(13, 6, 'No', 'Active'),
(13, 8, 'No', 'Active'),
(13, 9, 'No', 'Active'),
(14, 2, 'No', 'Active'),
(14, 6, 'No', 'Active'),
(14, 8, 'No', 'Active'),
(14, 9, 'No', 'Active'),
(15, 2, 'No', 'Active'),
(15, 6, 'No', 'Active'),
(15, 8, 'No', 'Active'),
(15, 9, 'No', 'Active'),
(16, 2, 'No', 'Active'),
(16, 6, 'No', 'Active'),
(16, 8, 'No', 'Active'),
(16, 9, 'No', 'Active'),
(17, 2, 'No', 'Active'),
(17, 6, 'No', 'Active'),
(17, 8, 'No', 'Active'),
(17, 9, 'No', 'Active'),
(18, 2, 'No', 'Active'),
(18, 6, 'No', 'Active'),
(18, 8, 'No', 'Active'),
(18, 9, 'No', 'Active'),
(19, 2, 'No', 'Active'),
(19, 6, 'No', 'Active'),
(19, 7, 'No', 'Active'),
(19, 8, 'No', 'Active'),
(19, 9, 'No', 'Active'),
(20, 2, 'No', 'Active'),
(20, 6, 'No', 'Active'),
(20, 8, 'No', 'Active'),
(20, 9, 'No', 'Active'),
(21, 2, 'No', 'Active'),
(21, 6, 'No', 'Active'),
(21, 8, 'No', 'Active'),
(21, 9, 'No', 'Active'),
(22, 2, 'No', 'Active'),
(22, 6, 'No', 'Active'),
(22, 8, 'No', 'Active'),
(22, 9, 'No', 'Active'),
(23, 2, 'No', 'Active'),
(23, 6, 'No', 'Active'),
(23, 9, 'No', 'Active'),
(24, 2, 'No', 'Active'),
(24, 6, 'No', 'Active'),
(24, 9, 'No', 'Active'),
(25, 2, 'No', 'Active'),
(25, 6, 'No', 'Active'),
(25, 9, 'No', 'Active'),
(26, 2, 'No', 'Active'),
(26, 6, 'No', 'Active'),
(26, 9, 'No', 'Active'),
(27, 2, 'No', 'Active'),
(27, 6, 'No', 'Active'),
(27, 9, 'No', 'Active'),
(28, 2, 'No', 'Active'),
(28, 6, 'No', 'Active'),
(28, 9, 'No', 'Active'),
(29, 2, 'No', 'Active'),
(29, 6, 'No', 'Active'),
(29, 9, 'No', 'Active'),
(30, 2, 'No', 'Active'),
(30, 6, 'No', 'Active'),
(30, 9, 'No', 'Active'),
(33, 2, 'No', 'Active'),
(33, 6, 'No', 'Active'),
(33, 9, 'No', 'Active'),
(34, 2, 'No', 'Active'),
(34, 6, 'No', 'Active'),
(34, 9, 'No', 'Active'),
(35, 2, 'No', 'Active'),
(35, 6, 'No', 'Active'),
(35, 9, 'No', 'Active'),
(36, 2, 'No', 'Active'),
(36, 6, 'No', 'Active'),
(36, 9, 'No', 'Active'),
(37, 2, 'No', 'Active'),
(37, 6, 'No', 'Active'),
(38, 2, 'No', 'Active'),
(38, 6, 'No', 'Active'),
(38, 7, 'No', 'Active'),
(38, 8, 'No', 'Active'),
(38, 9, 'No', 'Active'),
(38, 10, 'No', 'Active'),
(39, 2, 'No', 'Active'),
(39, 6, 'No', 'Active'),
(39, 7, 'No', 'Active'),
(39, 8, 'No', 'Active'),
(39, 9, 'No', 'Active'),
(39, 10, 'No', 'Active'),
(40, 2, 'No', 'Active'),
(40, 6, 'No', 'Active'),
(40, 7, 'No', 'Active'),
(40, 8, 'No', 'Active'),
(40, 9, 'No', 'Active'),
(40, 10, 'No', 'Active'),
(41, 2, 'No', 'Active'),
(41, 6, 'No', 'Active'),
(41, 7, 'No', 'Active'),
(41, 8, 'No', 'Active'),
(41, 9, 'No', 'Active'),
(41, 10, 'No', 'Active'),
(42, 2, 'No', 'Active'),
(42, 6, 'No', 'Active'),
(42, 7, 'No', 'Active'),
(42, 8, 'No', 'Active'),
(42, 9, 'No', 'Active'),
(42, 10, 'No', 'Active'),
(43, 2, 'No', 'Active'),
(43, 6, 'No', 'Active'),
(43, 9, 'No', 'Active'),
(43, 10, 'No', 'Active'),
(44, 2, 'No', 'Active'),
(44, 6, 'No', 'Active'),
(44, 9, 'No', 'Active'),
(44, 10, 'No', 'Active'),
(45, 2, 'No', 'Active'),
(45, 6, 'No', 'Active'),
(45, 9, 'No', 'Active'),
(45, 10, 'No', 'Active'),
(46, 2, 'No', 'Active'),
(46, 6, 'No', 'Active'),
(46, 9, 'No', 'Active'),
(46, 10, 'No', 'Active'),
(47, 2, 'No', 'Active'),
(47, 6, 'No', 'Active'),
(47, 9, 'No', 'Active'),
(47, 10, 'No', 'Active'),
(48, 2, 'No', 'Active'),
(48, 6, 'No', 'Active'),
(48, 7, 'No', 'Active'),
(48, 9, 'No', 'Active'),
(49, 2, 'No', 'Active'),
(49, 6, 'No', 'Active'),
(49, 7, 'No', 'Active'),
(49, 9, 'No', 'Active'),
(50, 2, 'No', 'Active'),
(50, 6, 'No', 'Active'),
(50, 7, 'No', 'Active'),
(50, 9, 'No', 'Active'),
(51, 2, 'No', 'Active'),
(51, 6, 'No', 'Active'),
(51, 7, 'No', 'Active'),
(51, 9, 'No', 'Active'),
(52, 2, 'No', 'Active'),
(52, 6, 'No', 'Active'),
(52, 7, 'No', 'Active'),
(52, 9, 'No', 'Active'),
(53, 2, 'No', 'Active'),
(53, 6, 'No', 'Active'),
(53, 8, 'No', 'Active'),
(53, 9, 'No', 'Active'),
(53, 10, 'No', 'Active'),
(54, 2, 'No', 'Active'),
(54, 6, 'No', 'Active'),
(54, 7, 'No', 'Active'),
(54, 8, 'No', 'Active'),
(54, 9, 'No', 'Active'),
(55, 2, 'No', 'Active'),
(55, 6, 'No', 'Active'),
(55, 8, 'No', 'Active'),
(55, 9, 'No', 'Active'),
(56, 2, 'No', 'Active'),
(56, 6, 'No', 'Active'),
(56, 8, 'No', 'Active'),
(56, 9, 'No', 'Active'),
(57, 2, 'No', 'Active'),
(57, 6, 'No', 'Active'),
(57, 9, 'No', 'Active'),
(58, 2, 'No', 'Active'),
(58, 6, 'No', 'Active'),
(58, 9, 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `service_warrenties`
--

CREATE TABLE `service_warrenties` (
  `id` int(11) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `reg_id` varchar(255) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `registered_by` varchar(255) DEFAULT NULL,
  `instalation_date` date DEFAULT NULL,
  `warrenty_type` text DEFAULT NULL,
  `application_type` varchar(255) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `annual_run_hour` int(11) DEFAULT NULL,
  `estimited_first_service_date` date DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `post_code` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comission_form` text DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_warrenties`
--

INSERT INTO `service_warrenties` (`id`, `customer_id`, `category_id`, `product_id`, `reg_id`, `serial_no`, `registration_number`, `registered_by`, `instalation_date`, `warrenty_type`, `application_type`, `imei_number`, `annual_run_hour`, `estimited_first_service_date`, `token`, `expire_date`, `company_name`, `address`, `city`, `post_code`, `country`, `first_name`, `last_name`, `phone`, `email`, `comission_form`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(40, 19, 1, 1, '000014', '498494151518948485', 'WR-2023-000014', 'Admin', '2023-08-01', '1', '45465ghj', '645756756765', 500, '2023-08-31', NULL, '2024-08-01', 'testT', 'testT', 'Chittagong', 4556123, 'Bangladesh', 'testT', NULL, '01887955046', 'testT@gmail.com', '1692721075.pdf', 'Inactive', '2023-08-22 20:17:58', '2023-08-22 21:07:16', NULL),
(41, 20, 2, 9, '000015', '20220423', 'WR-2023-000015', 'Admin', '2023-08-22', '1', '45gdfsgdfg', '454645645', 500, '2023-09-30', NULL, '2024-08-22', 'Farhan', 'ttt', 'Chittagong', 65465465, 'Barbados', 'farhan Co', NULL, '01774588963', 'farhan@gmail.com', '1692723694.pdf', 'Inactive', '2023-08-22 21:01:36', '2023-10-05 09:56:49', NULL),
(42, 6, 1, 3, '000016', '87356487542387', 'WR-2023-000016', 'Admin', '2023-08-01', '2', 'rfewtertertert', '456123', 2000, '2023-09-30', NULL, '2025-08-01', 'Farhan Prog', 'Ctgp', 'Chittagongp', 55554, 'Bangladesh', 'Farhan Prog', NULL, '01887922063', 'superadmin@gmail.comp', '1692729041.pdf', 'Inactive', '2023-08-22 22:30:43', '2023-10-05 09:56:53', NULL),
(43, 6, 1, 13, '000017', '22070025', 'WR-2023-000017', 'Admin', '2023-08-01', '2', 'testiles', '4657987', 2000, '2023-10-01', NULL, '2025-08-01', 'xyz', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'Dhaka', 9100, 'Bangladesh', 'test', NULL, '01911933907', 'test@gmail.com', '1693106586.pdf', 'Inactive', '2023-08-27 07:23:12', '2023-10-05 09:56:59', NULL),
(44, 1, 1, 1, '000018', '498494151518948485', 'WR-2023-000018', 'Admin', '2023-09-01', '1', '12133', '6546546', 500, '2023-09-30', NULL, '2024-09-01', 'Trident', 'mirpur 11', 'Dhaka', 45646, 'Bangladesh', 'Mr JOY', NULL, '01712800947', 'joybaseit@gmail.com', '1694326601.pdf', 'Inactive', '2023-09-10 10:16:44', '2023-10-05 09:57:03', NULL),
(45, 6, 2, 15, '000019', 'HN221220', 'WR-2023-000019', 'Admin', '2023-09-02', '2', 'gfdgfdgdfgfd gfds g', '54654654654654', 500, '2023-09-30', '0d2661a57f9c4ed261261fcd9e', '2025-09-02', 'Trident Agency Ltd.-2test', 'Ctgp', 'Chittagongp', 55554, 'Bangladesh', 'Farhan Prog', NULL, '01887922063', 'superadmin@gmail.comp', '1696003986.pdf', 'Inactive', '2023-09-29 20:13:08', '2023-10-05 09:57:06', NULL),
(46, 25, 20, 19, '000020', '20220423', 'WR-2023-000020', 'Admin', '2022-08-27', '2', 'BATTERY', 'DRYER', 8000, '2022-11-27', 'WR54fca2e6488b1f7d3f721e53f6', '2024-08-27', 'ABDULLAH BATTERY COMPANY(PVT) LTD.', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 9204, 'Bangladesh', 'MD. SAIFULLAH-AL-MAMUN', NULL, '01777781972', 'saiful.mamun@hamko.com.bd', '1696480834.pdf', 'Inactive', '2023-10-05 08:40:37', '2023-10-10 09:08:56', NULL),
(47, 26, 2, 20, '000021', '20220423', 'WR-2023-000021', 'Admin', '2022-08-27', '2', 'BATTERY', 'DRYER REFRIGERANT', 6000, '2022-11-27', 'WR31ce7afbee7b90bca22c607a29', '2024-08-27', 'ABDULLAH BATTERY COMPANY(PVT) LTD.', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 9204, 'Bangladesh', 'MD. SAIFULLAH-AL-MAMUN', NULL, '01777781972', 'saiful.mamun@hamko.com.bd', '1696481047.pdf', 'Active', '2023-10-05 08:44:09', '2023-10-05 08:44:09', NULL),
(48, 27, 22, 21, '000022', 'HN221220', 'WR-2023-000022', 'Admin', '2023-04-01', '2', 'Pharmaceuticals', 'DRYER DESICCANT', 6000, '2023-07-01', 'WRcdbd4b790849a51a1663ee6325', '2025-04-01', 'ADVANCED CHEMICAL INDUSTRIES LIMITED', '7, HAJEEGONJ ROAD, GODNYL NARAYANGANJ, BANGLADESH', 'NARAYANGONJ', 1400, 'Bangladesh', 'MD. SABBIR HUSSAIN', NULL, '01717458949', 'sabbir.hussain@aci-bd.com', '1696485389.pdf', 'Active', '2023-10-05 09:56:31', '2023-10-05 09:56:31', NULL),
(49, 28, 20, 22, '000023', '22070025', 'WR-2023-000023', 'Admin', '2023-05-14', '2', 'Pharmaceuticals', '0011110104', 8000, '2023-08-14', 'WR34d37cda2b23c74f215829b73c', '2025-05-14', 'ADVANCED CHEMICAL INDUSTRIES LTD.', 'HAJEEGONJ ROAD,GODNYL, NARAYANGONJ, BANGLADESH', 'NARAYANGONJ', 1400, 'Bangladesh', 'MD. SABBIR HUSSAIN', NULL, '01717458949', 'sabbir.hussain@aci-bd.com', '1696485653.pdf', 'Active', '2023-10-05 10:00:55', '2023-10-05 10:00:55', NULL),
(50, 29, 20, 23, '000024', '23040309', 'WR-2023-000024', 'Admin', '2023-08-28', '2', 'KNITTING & DYEING', '0011110279', 6000, '2023-11-28', 'WRe8ff0c11e878b4db78d0cc7221', '2025-08-28', 'AKH KNITTING & DYEING LTD.', 'PHULBARIA, TETULJHORA, SAVAR, DHAKA, BANGLADESH', 'SAVAR', 1340, 'Bangladesh', 'MD. EMDAD HOSSAIN', NULL, '01712260650', 'info@tridentbd.com', '1696486604.pdf', 'Active', '2023-10-05 10:16:45', '2023-10-05 10:16:45', NULL),
(51, 30, 20, 24, '000025', '22070142', 'WR-2023-000025', 'Admin', '2023-02-15', '2', 'Ceramics', '0011110097', 8000, '2023-05-15', 'WR4a29fdf5e2fb1a30ce241c0c44', '2025-02-15', 'TUSHAR CERAMICS LTD.', 'SHARATOLA, MOHESHPUR, JHENADAH', 'JHENADAH', 7340, 'Bangladesh', 'MD. KUMRUL HASAN', NULL, '01844274305', 'kumrul01@gmail.com', '1696657050.pdf', 'Active', '2023-10-07 09:37:32', '2023-10-07 09:37:32', NULL),
(52, 31, 20, 25, '000026', '22120781', 'WR-2023-000026', 'Admin', '2023-04-12', '2', 'COMPOSITE', '0011110145', 8000, '2023-07-11', 'WRd961accd47929da71de8eb3b94', '2025-04-12', 'ALIB Composite Ltd.', 'VANARA, MOUCHAK,', 'GAZIPUR', 1720, 'Bangladesh', 'MD. ARIF', NULL, '01999485730', 'mdarifkhan1258@gmail.com', '1696657698.pdf', 'Active', '2023-10-07 09:48:22', '2023-10-07 09:48:22', NULL),
(53, 31, 2, 26, '000027', '20230102064', 'WR-2023-000027', 'Admin', '2023-04-12', '2', 'COMPOSITE', 'N/A', 8000, '2023-07-12', 'WR04d450cc687720f23340e462b5', '2025-04-12', 'ALIB Composite Ltd.', 'VANARA, MOUCHAK,', 'GAZIPUR', 1720, 'Bangladesh', 'MD. ARIF', NULL, '01999485730', 'mdarifkhan1258@gmail.com', '1696658858.pdf', 'Active', '2023-10-07 10:07:40', '2023-10-07 10:07:40', NULL),
(54, 32, 20, 27, '000028', '22070748', 'WR-2023-000028', 'Admin', '2023-01-01', '2', 'FASHION & DESIGN', '0011110106', 8000, '2023-04-01', 'WRa5cd108f71045674ae06292167', '2025-01-01', 'AMAN FASHION & DESIGN LTD.', 'NOLAM, ASHULIA, SAVAR, DHAKA', 'SAVAR', 1341, 'Bangladesh', 'KABIR HOSSAIN', NULL, '01721201298', 'engkabir49@gmail.com', '1696659448.pdf', 'Active', '2023-10-07 10:17:30', '2023-10-07 10:17:30', NULL),
(55, 32, 2, 28, '000029', '220725018', 'WR-2023-000029', 'Admin', '2023-01-01', '2', 'FASHION & DESIGN', 'N/A', 8000, '2023-04-01', 'WReb5eb1106b885bba57b07e6eab', '2025-01-01', 'AMAN FASHION & DESIGN LTD.', 'NOLAM, ASHULIA, SAVAR, DHAKA', 'SAVAR', 1341, 'Bangladesh', 'KABIR HOSSAIN', NULL, '01721201298', 'engkabir49@gmail.com', '1696659751.pdf', 'Active', '2023-10-07 10:22:33', '2023-10-07 10:22:33', NULL),
(56, 33, 2, 29, '000030', '20220725014', 'WR-2023-000030', 'Admin', '2023-07-05', '2', 'SPINNING MILLS', 'N/A', 8000, '2023-10-05', 'WRd051ccecd5de9b69576eee4a48', '2025-07-05', 'ARGON SPINNING MILLS LTD.', 'NIZAMPUR, HABIGONJ, BANGLADESH', 'HABIGONJ', 3300, 'Bangladesh', 'MD. JAFOR', NULL, '01713049229', 'jaforiqbalkh@gmail.com', '1696660732.pdf', 'Active', '2023-10-07 10:38:54', '2023-10-07 10:38:54', NULL),
(57, 34, 20, 30, '000031', '23050169', 'WR-2023-000031', 'Admin', '2023-06-21', '2', 'GARMENTS', '0011110305', 8000, '2023-09-21', 'WRb2c98a39421010490847129dc6', '2025-06-21', 'AYSHA AND GALEYA FASHIONS LTD.', 'HARIKEN ROAD,DAULATPUR, GAZIPUR, BANGLADESH', 'GAZIPUR', 1702, 'Bangladesh', 'MD. RAKIB', NULL, '01911350627', 'smabulhasan@gmail.com', '1696667863.pdf', 'Active', '2023-10-07 12:37:47', '2023-10-07 12:37:47', NULL),
(58, 34, 2, 31, '000032', '20220725006', 'WR-2023-000032', 'Admin', '2023-05-01', '2', 'GARMENTS', 'N/A', 8000, '2023-08-01', 'WRb2e4f449d2345a4225fbc58a33', '2025-05-01', 'AYSHA AND GALEYA FASHIONS LTD.', 'HARIKEN ROAD,DAULATPUR, GAZIPUR, BANGLADESH', 'GAZIPUR', 1702, 'Bangladesh', 'MD. RAKIB', NULL, '01911350627', 'smabulhasan@gmail.com', '1696668116.pdf', 'Active', '2023-10-07 12:41:58', '2023-10-07 12:41:58', NULL),
(59, 35, 20, 32, '000033', '22070308', 'WR-2023-000033', 'Admin', '2023-08-26', '2', 'MANUFACTURING', '001110112', 8000, '2023-11-26', 'WR37462e9b07cad7344737ef5284', '2025-08-26', 'B&T METER LTD.', 'KHALISHPUR, JHENAIDAH, BANGLADESH', 'JHENAIDAH', 7300, 'Bangladesh', 'MD.BIPLOP', NULL, '01912336377', 'ae.md.mojnumiabnt@gmail.com', '1696670256.pdf', 'Active', '2023-10-07 13:17:38', '2023-10-07 13:17:38', NULL),
(60, 35, 2, 33, '000034', '20211217A', 'WR-2023-000034', 'Admin', '2023-08-26', '2', 'MANUFACTURING', 'N/A', 8000, '2023-11-26', 'WR08d9aff66b9814db63412630df', '2025-08-26', 'B&T METER LTD.', 'KHALISHPUR, JHENAIDAH, BANGLADESH', 'JHENAIDAH', 7300, 'Bangladesh', 'MD.BIPLOP', NULL, '01912336377', 'ae.md.mojnumiabnt@gmail.com', '1696670340.pdf', 'Active', '2023-10-07 13:19:02', '2023-10-07 13:19:02', NULL),
(61, 36, 20, 34, '000035', '22100097', 'WR-2023-000035', 'Admin', '2022-12-10', '2', 'TEXTILES', '0011110178', 8000, '2023-03-10', 'WR843b9789a3006e52754137024b', '2024-12-10', 'BEXIMCO LIMITED', 'BEXIMCO INDUSTRIAL PARK,SARABO, KASHIMPUR, GAZIPUR, BANGLADESH.', 'KASHIMPUR', 1703, 'Bangladesh', 'MD. SYDUZZAMAN', NULL, '01713049486', 'tipu@beximtex.com', '1696740716.pdf', 'Active', '2023-10-08 08:51:58', '2023-10-08 08:51:58', NULL),
(62, 36, 22, 35, '000036', '221017001', 'WR-2023-000036', 'Admin', '2022-12-10', '2', 'TEXTILES', 'N/A', 8000, '2023-03-10', 'WR60c5e448ca530643d38c076e27', '2024-12-10', 'BEXIMCO LIMITED', 'BEXIMCO INDUSTRIAL PARK,SARABO, KASHIMPUR, GAZIPUR, BANGLADESH.', 'KASHIMPUR', 1703, 'Bangladesh', 'MD. SYDUZZAMAN', NULL, '01713049486', 'tipu@beximtex.com', '1696740821.pdf', 'Active', '2023-10-08 08:53:43', '2023-10-08 08:53:43', NULL),
(63, 37, 20, 36, '000037', 'ZY220318014', 'WR-2023-000037', 'Admin', '2022-08-29', '2', 'TEXTILES', '0011110040', 8000, '2022-11-29', 'WRccacc6a31fc7b784779b50ebc3', '2024-08-29', 'BONAFIDE COMPOSITE TEXTILE MILLS LTD', 'BARPA,NARAYANGANJ', 'NARAYANGANJ', 1441, 'Bangladesh', 'MD.RONY', NULL, '01721438741', 'ronibkml@gmail.com', '1696742744.pdf', 'Inactive', '2023-10-08 09:25:48', '2023-10-25 13:06:36', NULL),
(64, 37, 2, 37, '000038', '20220423', 'WR-2023-000038', 'Admin', '2022-08-29', '2', 'TEXTILES', 'N/A', 8000, '2022-11-29', 'WR0769790d13973ea73da2d434ca', '2024-08-29', 'BONAFIDE COMPOSITE TEXTILE MILLS LTD', 'BARPA,NARAYANGANJ', 'NARAYANGANJ', 1441, 'Bangladesh', 'MD.RONY', NULL, '01721438741', 'ronibkml@gmail.com', '1696742904.pdf', 'Active', '2023-10-08 09:28:25', '2023-10-08 09:28:25', NULL),
(65, 38, 2, 38, '000039', '20220725002', 'WR-2023-000039', 'Admin', '2023-05-11', '2', 'PHARMACEUTICALS', 'N/A', 8000, '2023-08-11', 'WR3242160a7506d683badcf4e44e', '2025-05-11', 'C2C PHARMA', 'YEARPUR, ASHULIA, BANGLADESH', 'ASHULIA', 1341, 'Bangladesh', 'MD. AL-EMRAN', NULL, '01955597804', 'alimran@c2cpharma.com.bd', '1696744625.pdf', 'Active', '2023-10-08 09:57:07', '2023-10-08 09:57:07', NULL),
(66, 39, 20, 39, '000040', 'ZY2112112957', 'WR-2023-000040', 'Admin', '2022-08-16', '2', 'TEXWEAR', '0011110037', 8000, '2022-11-16', 'WRf70b7c8e905ac14124bf757aa3', '2024-08-16', 'CONFIDENCE TEXWEAR LTD.', 'BAGHER BAZAR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 1346, 'Bangladesh', 'MD. SHAMIM', NULL, '01313010320', 'sakinahammed99@gmail.com', '1696745408.pdf', 'Inactive', '2023-10-08 10:10:10', '2023-10-17 14:05:19', NULL),
(67, 39, 2, 40, '000041', '20220423', 'WR-2023-000041', 'Admin', '2022-08-16', '2', 'TEXWEAR', 'N/A', 8000, '2022-11-16', 'WR0fb141d8f5380cff8554e379cb', '2024-08-16', 'CONFIDENCE TEXWEAR LTD.', 'BAGHER BAZAR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 1346, 'Bangladesh', 'MD. SHAMIM', NULL, '01313010320', 'sakinahammed99@gmail.com', '1696745551.pdf', 'Active', '2023-10-08 10:12:35', '2023-10-08 10:12:35', NULL),
(68, 30, 20, 41, '000042', '22070142', 'WR-2023-000042', 'Admin', '2023-02-15', '2', 'CERAMICS', '0011110097', 8000, '2023-05-15', 'WR4eb86a1fcc3e3108b521d00b0c', '2025-02-15', 'TUSHAR CERAMICS LTD.', 'SHARATOLA, MOHESHPUR, JHENADAH', 'JHENADAH', 7340, 'Bangladesh', 'MD. KUMRUL HASAN', NULL, '01844274305', 'kumrul01@gmail.com', '1696745851.pdf', 'Active', '2023-10-08 10:17:33', '2023-10-08 10:17:33', NULL),
(69, 30, 2, 42, '000043', '20220725015', 'WR-2023-000043', 'Admin', '2023-02-15', '2', 'CERAMICS', 'N/A', 8000, '2023-05-15', 'WR1a32d1a9ac346db7b6a3b427df', '2025-02-15', 'TUSHAR CERAMICS LTD.', 'SHARATOLA, MOHESHPUR, JHENADAH', 'JHENADAH', 7340, 'Bangladesh', 'MD. KUMRUL HASAN', NULL, '01844274305', 'kumrul01@gmail.com', '1696745947.pdf', 'Active', '2023-10-08 10:19:08', '2023-10-08 10:19:08', NULL),
(70, 40, 2, 43, '000044', '20230530005', 'WR-2023-000044', 'Admin', '2023-07-31', '2', 'TEXTILES', 'N/A', 8000, '2023-10-30', 'WR57380c86ad848f9143bd30b102', '2025-07-31', 'EOS TEXTILE MILLS LTD.', 'PLOT 1-6,17-22 DHAKA EXPORT PROCESSING ZONE, SAVAR, DHAKA, BANGLADESH', 'SAVAR', 1341, 'Bangladesh', 'SURANJON DAS', NULL, '01711283019', 'weaving@eostextile.com', '1696746867.pdf', 'Active', '2023-10-08 10:34:29', '2023-10-08 10:34:29', NULL),
(71, 41, 20, 46, '000045', '21110856', 'WR-2023-000045', 'Admin', '2023-01-07', '2', 'FABRICS', '0011110018', 8000, '2023-04-07', 'WR1c1481774112452ae7bdd09770', '2025-01-07', 'ESHANA NONWOVEN (IND.) LTD.', 'PACHULAR,CITY BYPASS ROAD, TELIGATI ARONGGHATA, KHULNA, BANGLADESH', 'KHULNA', 9203, 'Bangladesh', 'H M A MANNAN', NULL, '01911134013', 'hmamannan36@gmail.com', '1696747509.pdf', 'Active', '2023-10-08 10:45:11', '2023-10-08 10:45:11', NULL),
(72, 41, 2, 47, '000046', '20211217G', 'WR-2023-000046', 'Admin', '2023-01-07', '2', 'FABRICS', 'N/A', 8000, '2023-04-07', 'WRb88ddebb42b78f26b96876472a', '2025-01-07', 'ESHANA NONWOVEN (IND.) LTD.', 'PACHULAR,CITY BYPASS ROAD, TELIGATI ARONGGHATA, KHULNA, BANGLADESH', 'KHULNA', 9203, 'Bangladesh', 'H M A MANNAN', NULL, '01911134013', 'hmamannan36@gmail.com', '1696747596.pdf', 'Active', '2023-10-08 10:46:40', '2023-10-08 10:46:40', NULL),
(73, 41, 20, 44, '000047', '21110855', 'WR-2023-000047', 'Admin', '2023-05-12', '2', 'FABRICS', '0011110015', 8000, '2023-08-12', 'WRdddb1731b50695d933fd86d19b', '2025-05-12', 'ESHANA NONWOVEN (IND.) LTD.', 'PACHULAR,CITY BYPASS ROAD, TELIGATI ARONGGHATA, KHULNA, BANGLADESH', 'KHULNA', 9203, 'Bangladesh', 'H M A MANNAN', NULL, '01911134013', 'hmamannan36@gmail.com', '1696747732.pdf', 'Active', '2023-10-08 10:48:54', '2023-10-08 10:48:54', NULL),
(74, 41, 2, 45, '000048', '20211217H', 'WR-2023-000048', 'Admin', '2023-05-12', '2', 'FABRICS', 'N/A', 8000, '2023-08-12', 'WR90d770886cd1d9bced07afe816', '2025-05-12', 'ESHANA NONWOVEN (IND.) LTD.', 'PACHULAR,CITY BYPASS ROAD, TELIGATI ARONGGHATA, KHULNA, BANGLADESH', 'KHULNA', 9203, 'Bangladesh', 'H M A MANNAN', NULL, '01911134013', 'hmamannan36@gmail.com', '1696747811.pdf', 'Active', '2023-10-08 10:50:13', '2023-10-08 10:50:13', NULL),
(75, 42, 22, 48, '000049', 'HN221220', 'WR-2023-000049', 'Admin', '2023-08-03', '2', 'MANUFACTURING', 'N/A', 8000, '2023-10-03', 'WRffd624e231ce5a0457ad6083f6', '2025-08-03', 'FAIR ELECTRONICS LTD.', 'VELANAGAR, NARSINGDI, BANGLADESH', 'NARSINGDI', 1600, 'Bangladesh', 'MD. NAHID', NULL, '01777702114', 'nahid.abdullah@fel.com.bd', '1696748728.pdf', 'Active', '2023-10-08 11:05:30', '2023-10-08 11:05:30', NULL),
(76, 43, 20, 49, '000050', '22070042', 'WR-2023-000050', 'Admin', '2023-03-12', '2', 'PHARMACEUTICALS', '0011110101', 8000, '2023-06-12', 'WR94911d358a7e608f8cac0df59b', '2025-03-12', 'GENERAL PHARMACEUTICALS LTD.', 'KONABARI, GAZIPUR, BANGLADESH', 'KONABARI', 1346, 'Bangladesh', 'MR. AQIB JAVED', NULL, '01844093953', 'aqib.eng@generalpharma.com', '1696754677.pdf', 'Active', '2023-10-08 12:44:39', '2023-10-08 12:44:39', NULL),
(77, 43, 22, 50, '000051', 'HN221220', 'WR-2023-000051', 'Admin', '2023-03-12', '2', 'PHARMACEUTICALS', 'N/A', 8000, '2023-06-12', 'WRc192e4c853590a2245d210ed0a', '2025-03-12', 'GENERAL PHARMACEUTICALS LTD.', 'KONABARI, GAZIPUR, BANGLADESH', 'KONABARI', 1346, 'Bangladesh', 'MR. AQIB JAVED', NULL, '01844093953', 'aqib.eng@generalpharma.com', '1696754794.pdf', 'Active', '2023-10-08 12:46:37', '2023-10-08 12:46:37', NULL),
(78, 44, 20, 51, '000052', '22070309', 'WR-2023-000052', 'Admin', '2023-05-12', '2', 'TEA', '0011110132', 8000, '2023-05-12', 'WR969fe6757037aa071da3720f06', '2025-05-12', 'GRIND TECH LTD.', 'JAINTAPUR, SYLHET, BANGLADESH.', 'JAINTAPUR', 3156, 'Bangladesh', 'MD. RAFIQUL ISLAM', NULL, '01708121266', 'rafiqul@grindtech-bd.com', '1696755629.pdf', 'Active', '2023-10-08 13:00:31', '2023-10-08 13:00:31', NULL),
(79, 45, 20, 52, '000053', '211204477', 'WR-2023-000053', 'Admin', '2022-04-18', '2', 'FOODS', '0011110025', 8000, '2022-07-18', 'WR65b3b877e8b2d7f87bedfe98c8', '2024-04-18', 'HASAN FOODS LTD.', 'PORABO,VULTA, RUPGONJ, NARAYANGONJ,BANGLADESH.', 'NARAYANGANJ', 1461, 'Bangladesh', 'MD. EMAROT', NULL, '01711878073', 'hasanfood.bd@gmail.com', '1696756778.pdf', 'Active', '2023-10-08 13:19:40', '2023-10-08 13:19:40', NULL),
(80, 46, 20, 53, '000054', '23051289', 'WR-2023-000054', 'Admin', '2023-09-17', '2', 'TEXTILES', '0011110381', 8000, '2023-12-17', 'WRfcc445363e22db98af9f9d2d3a', '2025-09-17', 'HEAVEN TEXTILES MILLS', 'RUPGONJ,NARAYANGONJ, BANGLADESH', 'NARAYANGONJ', 1462, 'Bangladesh', 'SHANTANU KAISER', NULL, '01712047956', 'kaisertex28@gmail.com', '1696757505.pdf', 'Active', '2023-10-08 13:31:47', '2023-10-08 13:31:47', NULL),
(81, 46, 2, 54, '000055', '20230628003', 'WR-2023-000055', 'Admin', '2023-09-17', '2', 'TEXTILES', 'N/A', 8000, '2023-12-17', 'WRddcda8ceb2ccc26a68576661c0', '2025-09-17', 'HEAVEN TEXTILES MILLS', 'RUPGONJ,NARAYANGONJ, BANGLADESH', 'NARAYANGONJ', 1462, 'Bangladesh', 'SHANTANU KAISER', NULL, '01712047956', 'kaisertex28@gmail.com', '1696757602.pdf', 'Active', '2023-10-08 13:33:25', '2023-10-08 13:33:25', NULL),
(82, 47, 20, 57, '000056', '22040106', 'WR-2023-000056', 'Admin', '2022-07-19', '2', 'FOODS', '0011110029', 8000, '2022-10-19', 'WR6291e4272f204b66be7472ad51', '2024-07-19', 'HABIGONJ INDUSTRIAL PARK (PRAN-RFL)', 'SAYESTAGONJ, OLIPUR, HABIGONJ,BANGLADESH', 'HABIGONJ', 3332, 'Bangladesh', 'MD. MARUF AHMED', NULL, '01704132325', 'pipprance@pipprangroup.com', '1696758454.pdf', 'Active', '2023-10-08 13:47:36', '2023-10-08 13:47:36', NULL),
(83, 47, 2, 56, '000057', '20220423', 'WR-2023-000057', 'Admin', '2022-07-19', '2', 'FOODS', 'N/A', 8000, '2022-10-19', 'WR5b1ed118cc852fff8c4db0f935', '2024-07-19', 'HABIGONJ INDUSTRIAL PARK (PRAN-RFL)', 'SAYESTAGONJ, OLIPUR, HABIGONJ,BANGLADESH', 'HABIGONJ', 3332, 'Bangladesh', 'MD. MARUF AHMED', NULL, '01704132325', 'pipprance@pipprangroup.com', '1696758836.pdf', 'Active', '2023-10-08 13:54:02', '2023-10-08 13:54:02', NULL),
(84, 48, 20, 58, '000058', '22040103', 'WR-2023-000058', 'Admin', '2022-07-16', '2', 'FOODS', '0011110042', 8000, '2022-10-16', 'WR73e6925e60089a6a967d02a19e', '2024-07-16', 'JABED AGRO FOOD LTD. LTD.', 'BSCIC INDUSTRIAL AREA, JAMALPUR, BANGLADESH.', 'JAMALPUR', 2000, 'Bangladesh', 'MD. SHAHAJALAL BHUIYA', NULL, '01784057088', 'shahajalal.jafpl@gmail.com', '1696759813.pdf', 'Active', '2023-10-08 14:10:15', '2023-10-08 14:10:15', NULL),
(85, 48, 2, 59, '000059', '0220423', 'WR-2023-000059', 'Admin', '2022-07-16', '2', 'FOODS', 'N/A', 8000, '2022-10-16', 'WR8d0aa6790e8a1a2d85714b9902', '2024-07-16', 'JABED AGRO FOOD LTD. LTD.', 'BSCIC INDUSTRIAL AREA, JAMALPUR, BANGLADESH.', 'JAMALPUR', 2000, 'Bangladesh', 'MD. SHAHAJALAL BHUIYA', NULL, '01784057088', 'shahajalal.jafpl@gmail.com', '1696759917.pdf', 'Active', '2023-10-08 14:11:59', '2023-10-08 14:11:59', NULL),
(86, 49, 20, 60, '000060', '21110753', 'WR-2023-000060', 'Admin', '2022-12-11', '2', 'PAKAGING', '0011110017', 8000, '2023-06-11', 'WRbb615475733d63f2c37d459771', '2024-12-11', 'JF & I PAKAGING (BD) LTD.', 'SOUTH SHAMPUR, HEMAYETPUR, SAVAR, BANGLADESH.', 'SAVAR', 1340, 'Bangladesh', 'MD. IMRAN HOSSEN', NULL, '01827165396', 'imraneee50@gmail.com', '1696760824.pdf', 'Active', '2023-10-08 14:27:06', '2023-10-08 14:27:06', NULL),
(87, 49, 2, 61, '000061', '20211217D', 'WR-2023-000061', 'Admin', '2022-12-11', '2', 'PAKAGING', 'N/A', 8000, '2023-03-12', 'WR187e94398b2bec44f19055c5da', '2024-12-11', 'JF & I PAKAGING (BD) LTD.', 'SOUTH SHAMPUR, HEMAYETPUR, SAVAR, BANGLADESH.', 'SAVAR', 1340, 'Bangladesh', 'MD. IMRAN HOSSEN', NULL, '01827165396', 'imraneee50@gmail.com', '1696764016.pdf', 'Active', '2023-10-08 15:20:18', '2023-10-08 15:20:18', NULL),
(88, 49, 20, 62, '000062', '21110754', 'WR-2023-000062', 'Admin', '2022-12-11', '2', 'PAKAGING', '0011110022', 8000, '2023-03-11', 'WRc91666063377c346febb308b90', '2024-12-11', 'JF & I PAKAGING (BD) LTD.', 'SOUTH SHAMPUR, HEMAYETPUR, SAVAR, BANGLADESH.', 'SAVAR', 1340, 'Bangladesh', 'MD. IMRAN HOSSEN', NULL, '01827165396', 'imraneee50@gmail.com', '1696841678.pdf', 'Active', '2023-10-09 12:54:41', '2023-10-09 12:54:41', NULL),
(89, 49, 2, 63, '000063', '20211217C', 'WR-2023-000063', 'Admin', '2022-12-11', '2', 'PAKAGING', 'N/A', 8000, '2023-03-11', 'WR4fc5450929f64651825056f0a8', '2024-12-11', 'JF & I PAKAGING (BD) LTD.', 'SOUTH SHAMPUR, HEMAYETPUR, SAVAR, BANGLADESH.', 'SAVAR', 1340, 'Bangladesh', 'MD. IMRAN HOSSEN', NULL, '01827165396', 'imraneee50@gmail.com', '1696841759.pdf', 'Active', '2023-10-09 12:56:00', '2023-10-09 12:56:00', NULL),
(90, 12, 20, 64, '000064', '22070041', 'WR-2023-000064', 'Admin', '2022-09-13', '2', 'MANUFACTURING', '0011110095', 8000, '2022-12-13', 'WRc17db81b49d213ac3713c3862f', '2024-09-13', 'KHURSHED METAL INDUSTRIES LTD.', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 9204, 'Bangladesh', 'MD. SAIFULLAH-AL-MAMUN', NULL, '01911933907', 'saiful.mamun@hamko.com.bd', '1696842883.pdf', 'Active', '2023-10-09 13:14:56', '2023-10-09 13:14:56', NULL),
(91, 12, 2, 65, '000065', '20220720001', 'WR-2023-000065', 'Admin', '2022-07-16', '2', 'MANUFACTURING', 'N/A', 8000, '2022-10-16', 'WRb0a7aa523afcbb90fdd59f8fca', '2024-07-16', 'KHURSHED METAL INDUSTRIES LTD.', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 9204, 'Bangladesh', 'MD. SAIFULLAH-AL-MAMUN', NULL, '01911933907', 'saiful.mamun@hamko.com.bd', '1696843226.pdf', 'Active', '2023-10-09 13:20:29', '2023-10-09 13:20:29', NULL),
(92, 50, 20, 66, '000066', '23050264', 'WR-2023-000066', 'Admin', '2023-08-03', '2', 'MANUFACTURING', '0011110329', 8000, '2023-11-03', 'WRd62aa6ddef99dd048ec3c77701', '2025-08-03', 'KHURSHED METAL INDUSTRIES LTD.', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 9204, 'Bangladesh', 'MD. SAIFULLAH-AL-MAMUN', NULL, '01777781972', 'saiful.mamun@hamko.com.bd', '1696844732.pdf', 'Active', '2023-10-09 13:45:36', '2023-10-09 13:45:36', NULL),
(93, 12, 2, 67, '000067', '20230509001', 'WR-2023-000067', 'Admin', '2023-08-03', '2', 'MANUFACTURING', 'N/A', 8000, '2023-11-03', 'WR30a18f965681fd25d0ca526f67', '2025-08-03', 'ABDULLAH BATTERY COMPANY(PVT) LTD.', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 9204, 'Bangladesh', 'MD. SAIFULLAH-AL-MAMUN', NULL, '01777781972', 'saiful.mamun@hamko.com.bd', '1696844942.pdf', 'Active', '2023-10-09 13:49:04', '2023-10-12 13:20:14', NULL),
(94, 12, 2, 68, '000068', '20220725012', 'WR-2023-000068', 'Admin', '2023-04-05', '2', 'MANUFACTURING', 'N/A', 8000, '2023-07-05', 'WRae32620d81ec7b8ea429fdfcdb', '2025-04-05', 'KHURSHED METAL INDUSTRIES LTD.', 'BSCIC INDUSTRIAL ESTATE, SHIROMONY, KHULNA, BANGLADESH', 'KHULNA', 9204, 'Bangladesh', 'MD. SAIFULLAH-AL-MAMUN', NULL, '01911933907', 'saiful.mamun@hamko.com.bd', '1696907632.pdf', 'Active', '2023-10-10 07:13:55', '2023-10-10 07:13:55', NULL),
(95, 51, 2, 69, '000069', '20220725001', 'WR-2023-000069', 'Admin', '2023-07-12', '2', 'ELECTRONICS', 'N/A', 8000, '2023-10-12', 'WRdc38708dbad321c781569fc71b', '2025-07-12', 'LAXFO ELECTRONICS LTD.', 'TAIYABPUR, ZIRABO, ASHULIA, BANGLADESH', 'ASHLIA', 1341, 'Bangladesh', 'TANMOY ACHARYA', NULL, '01670562093', 'tanmoy.acharya@laxfo.com', '1696907949.pdf', 'Active', '2023-10-10 07:19:11', '2023-10-10 07:19:11', NULL),
(96, 52, 20, 70, '000070', '21120448', 'WR-2023-000070', 'Admin', '2022-04-27', '2', 'Coil factory', '0011110026', 8000, '2022-07-27', 'WRc6a286773e7d61b06f49295616', '2024-04-27', 'MADANI FEED MILLS LTD.', 'CHIKNA, TRISHAL, MYMENSING,BANGLADESH.', 'MYMENSING', 2220, 'Bangladesh', 'MD. ANISUR RAHMAN', NULL, '01923223170', 'madanisonsagroindustriesltd@gmail.com', '1696909699.pdf', 'Active', '2023-10-10 07:48:21', '2023-10-10 07:48:21', NULL),
(97, 52, 2, 71, '000071', '20211217E', 'WR-2023-000071', 'Admin', '2022-04-27', '2', 'Coil factory', 'N/A', 8000, '2022-07-27', 'WR86728fa55768125b4f9fc8c17a', '2024-04-27', 'MADANI FEED MILLS LTD.', 'CHIKNA, TRISHAL, MYMENSING,BANGLADESH.', 'MYMENSING', 2220, 'Bangladesh', 'MD. ANISUR RAHMAN', NULL, '01923223170', 'madanisonsagroindustriesltd@gmail.com', '1696909849.pdf', 'Active', '2023-10-10 07:50:51', '2023-10-10 07:50:51', NULL),
(98, 53, 20, 72, '000072', '22070059', 'WR-2023-000072', 'Admin', '2023-05-16', '2', 'MANUFACTURING', '0011110123', 8000, '2023-08-16', 'WR99994336fe07c6410969fe578b', '2025-05-16', 'MAX  INFRASTRUCTURE LTD.', 'MEGHSHIMUL, JAGIR, MANIKGANJ, BANGLADESH.', 'MANIKGANJ', 1800, 'Bangladesh', 'MD. ANAM HOSSAIN', NULL, '01700704805', 'anam.hossain@maxgroup-bd.com', '1696912000.pdf', 'Active', '2023-10-10 08:26:42', '2023-10-10 08:26:42', NULL),
(99, 53, 2, 73, '000073', '20220725005', 'WR-2023-000073', 'Admin', '2023-05-16', '2', 'MANUFACTURING', 'N/A', 8000, '2023-08-16', 'WR001c1b548d2bb25e4c64de1814', '2025-05-16', 'MAX  INFRASTRUCTURE LTD.', 'MEGHSHIMUL, JAGIR, MANIKGANJ, BANGLADESH.', 'MANIKGANJ', 1800, 'Bangladesh', 'MD. ANAM HOSSAIN', NULL, '01700704805', 'anam.hossain@maxgroup-bd.com', '1696912131.pdf', 'Active', '2023-10-10 08:28:53', '2023-10-10 08:28:53', NULL),
(100, 54, 20, 74, '000074', '22070439', 'WR-2023-000074', 'Admin', '2022-09-06', '2', 'MANUFACTURING', '0011110083', 8000, '2022-12-06', 'WRa3585ce0fb1f9c3539dee3ed12', '2024-09-06', 'MOHUBOR RAHMAN PARTICAL MILLS (PVT) LTD.', 'SAHEBGANG, RANGPUR, BANGLADESH.', 'RANGPUR', 5403, 'Bangladesh', 'MD. NASIM', NULL, '01711427817', 'engr.nasimuloo@gmail.com', '1696914702.pdf', 'Active', '2023-10-10 09:11:44', '2023-10-10 09:11:44', NULL),
(101, 55, 20, 75, '000075', '22070760', 'WR-2023-000075', 'Admin', '2022-12-27', '2', 'CEMENT FACTORY', '0011110093', 8000, '2023-03-27', 'WR5abdb4d7b8158e7544d76345e6', '2024-12-27', 'OLYMPIC CEMENT LTD.', 'RUPATOLI, BARISAL, BANGLADESH', 'BARISAL', 8207, 'Bangladesh', 'ENG. KAZI NAZRUL ISLAM', NULL, '01313439445', 'gm.op@olympiccement.com', '1696916072.pdf', 'Active', '2023-10-10 09:34:34', '2023-10-10 09:34:34', NULL),
(102, 55, 2, 76, '000076', '20220720002', 'WR-2023-000076', 'Admin', '2022-12-27', '2', 'CEMENT FACTORY', 'N/A', 8000, '2023-03-27', 'WRd71f64c068cf98606ae85670f4', '2024-12-27', 'OLYMPIC CEMENT LTD.', 'RUPATOLI, BARISAL, BANGLADESH', 'BARISAL', 8207, 'Bangladesh', 'ENG. KAZI NAZRUL ISLAM', NULL, '01313439445', 'gm.op@olympiccement.com', '1696916238.pdf', 'Active', '2023-10-10 09:37:20', '2023-10-10 09:37:20', NULL),
(103, 56, 20, 77, '000077', '21110751', 'WR-2023-000077', 'Admin', '2022-06-17', '2', 'AGRO', '0011110008', 8000, '2022-09-17', 'WRc5d946e67493ce4926b9066e2f', '2024-06-17', 'PARAGON AGRO LTD.', 'HAJINAGAR TEA ESTATE, KAJALDHARA, MOULVIBAZAR', 'MOULVIBAZAR', 2334, 'Bangladesh', 'MD. YEASIN', NULL, '01833222444', 'yasinhamid1155@gmail.com', '1696916669.pdf', 'Active', '2023-10-10 09:44:31', '2023-10-10 09:44:31', NULL),
(104, 56, 2, 78, '000078', '20211217B', 'WR-2023-000078', 'Admin', '2022-06-17', '2', 'AGRO', 'N/A', 8000, '2022-09-17', 'WR6057b8bef578afc14699f6ed26', '2024-06-17', 'PARAGON AGRO LTD.', 'HAJINAGAR TEA ESTATE, KAJALDHARA, MOULVIBAZAR', 'MOULVIBAZAR', 2334, 'Bangladesh', 'MD. YEASIN', NULL, '01833222444', 'yasinhamid1155@gmail.com', '1696916739.pdf', 'Active', '2023-10-10 09:45:42', '2023-10-10 09:45:42', NULL),
(105, 57, 20, 79, '000079', '22070057', 'WR-2023-000077', 'Admin', '2022-11-20', '2', 'CHEMICALS FACTORY', '0011110125', 8000, '2023-02-20', 'WR07f66a33e550c05a58905d2dec', '2024-11-20', 'PIDILITE SPECIALITY CHEMICALS (BD)PVT.LTD.', 'WEST MUKTERPUR, PANCHASHAR, MUNSHIGANJ, BANGLADESH.', 'MUNSHIGANJ', 1500, 'Bangladesh', 'MD. FARUK HAOLADER', NULL, '01712654364', 'engr.faruk@pidilite.com.bd', '1696917074.pdf', 'Active', '2023-10-10 09:51:17', '2023-10-10 09:51:17', NULL),
(106, 58, 20, 80, '000080', '22040104', 'WR-2023-000080', 'Admin', '2022-06-29', '2', 'FOODS', '0011110038', 8000, '2022-09-29', 'WRbaebabe3fba1c156fe33586a0a', '2024-06-29', 'PRAN DAIRY LIMITED', 'BAGPARA PALASH, NARSHINGDI,BANGLADESH.', 'PALASH', 1610, 'Bangladesh', 'MD. IDRIS ALI', NULL, '01704132633', 'pipprance@pipprangroup.com', '1696917280.pdf', 'Active', '2023-10-10 09:54:45', '2023-10-10 09:54:45', NULL),
(107, 58, 2, 81, '000081', '20220423', 'WR-2023-000081', 'Admin', '2022-06-29', '2', 'FOODS', 'N/A', 8000, '2022-09-19', 'WR8d00005c04ede598c3cb1fb203', '2024-06-29', 'PRAN DAIRY LIMITED', 'BAGPARA PALASH, NARSHINGDI,BANGLADESH.', 'PALASH', 1610, 'Bangladesh', 'MD. IDRIS ALI', NULL, '01704132633', 'pipprance@pipprangroup.com', '1696918132.pdf', 'Active', '2023-10-10 10:08:54', '2023-10-10 10:08:54', NULL),
(108, 59, 20, 82, '000082', '21110933', 'WR-2023-000081', 'Admin', '2022-03-22', '2', 'GARMENTS', '0011110024', 8000, '2022-06-22', 'WR3cbe205bb99c5f66884e16e1ae', '2024-03-22', 'RATUL FABRICS LTD.', 'ZOHARSANDA, ASHULIA, SAVAR, DHAKA.', 'DHAKA', 1340, 'Bangladesh', 'MD.ABDUL MATIN', NULL, '01936017130', 'ambitionbd@gmail.com', '1696918877.pdf', 'Active', '2023-10-10 10:21:19', '2023-10-10 10:21:19', NULL),
(109, 59, 2, 83, '000083', '20211217F', 'WR-2023-000083', 'Admin', '2022-03-22', '2', 'GARMENTS', 'N/A', 8000, '2022-06-22', 'WR4543f87aa6a683ad79fb0ace2c', '2024-03-22', 'RATUL FABRICS LTD.', 'ZOHARSANDA, ASHULIA, SAVAR, DHAKA.', 'DHAKA', 1340, 'Bangladesh', 'MD.ABDUL MATIN', NULL, '01936017130', 'ambitionbd@gmail.com', '1696919761.pdf', 'Active', '2023-10-10 10:36:03', '2023-10-10 10:36:03', NULL),
(110, 60, 20, 84, '000084', '22070666', 'WR-2023-000084', 'Admin', '2022-08-29', '2', 'GARMENTS', '0011110109', 8000, '2022-11-29', 'WR8263240cd2165ec3cee80cc672', '2024-08-29', 'RATUL KNITWEARS LTD.', 'ZIRABO (PUKURPAR), ASHULIA, SAVAR, BANGLADESH.', 'DHAKA', 1341, 'Bangladesh', 'ABDUL MATIN', NULL, '01711693408', 'ambitionbd@gmail.com', '1696920575.pdf', 'Active', '2023-10-10 10:49:38', '2023-10-10 10:49:38', NULL),
(111, 61, 20, 85, '000085', '22070058', 'WR-2023-000085', 'Admin', '2023-03-16', '2', 'GARMENTS', '0011110124', 8000, '2023-06-16', 'WRa938c8944f321a4b6c29bb68b5', '2025-03-16', 'RONY KNIT COMPOSITE LTD.', 'TARABO, RUPGANJ, NARAYANGANJ, BANGLADESH', 'NARAYANGANJ', 1402, 'Bangladesh', 'MD. JONY', NULL, '01914119882', 'jonyrkcl@gmail.com', '1696927682.pdf', 'Active', '2023-10-10 12:48:04', '2023-10-10 12:48:04', NULL),
(112, 62, 20, 87, '000086', '22070145', 'WR-2023-000086', 'Admin', '2023-06-01', '2', 'CABLE FACTORY', '0011110100', 8000, '2023-09-01', 'WRef3dedf775fea5dd99cf7fd74f', '2025-06-01', 'RR IMPERIAL ELECTRICALS LTD.', 'SENPARA, KANCHPUR, SONARGAON, NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 1441, 'Bangladesh', 'SUBASISH GHOSH', NULL, '01755552564', 's.ghosh@rr-imperial.com', '1696928392.pdf', 'Active', '2023-10-10 12:59:54', '2023-10-10 12:59:54', NULL),
(113, 63, 20, 88, '000087', '22031063', 'WR-2023-000087', 'Admin', '2022-09-05', '2', 'Coil factory', '0011110030', 8000, '2022-12-05', 'WR46ed3f39a775b1de534de8208b', '2024-09-05', 'SA FORMULATION LTD.', 'GIDHORIA, SREEPUR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 1740, 'Bangladesh', 'MD. MUNJURUL HAQUE', NULL, '01708800403', 'munzurul.h51286@gmail.com', '1696929200.pdf', 'Inactive', '2023-10-10 13:13:22', '2023-12-06 14:17:14', NULL),
(114, 63, 2, 89, '000088', '20220423', 'WR-2023-000088', 'Admin', '2022-04-23', '2', 'Coil factory', 'N/A', 8000, '2022-07-23', 'WRef5d43ff167964986f00df2b2d', '2024-04-23', 'SA FORMULATION LTD.', 'GIDHORIA, SREEPUR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 1740, 'Bangladesh', 'MD. MUNJURUL HAQUE', NULL, '01708800403', 'munzurul.h51286@gmail.com', '1696929377.pdf', 'Inactive', '2023-10-10 13:16:19', '2023-12-06 14:17:26', NULL),
(115, 64, 20, 90, '000089', '22070437', 'WR-2023-000089', 'Admin', '2023-09-10', '2', 'PLASTIC & TIN CONTAINER', '0011110129', 8000, '2023-12-10', 'WR86017933b1a85b5f1fecfe2e49', '2025-09-10', 'XCLUSIVE PLASTIC & TIN CONTAINER MANUFACTURER', 'MAJUKHAN BAZAR, KALIGONJ ROAD, GAZIPUR, BANGLADESH.', 'GAZIPUR', 1720, 'Bangladesh', 'MD. RASHEDUL ISLAM (RASEL)', NULL, '01733176705', 'engineering@qpail.com', '1696931458.pdf', 'Active', '2023-10-10 13:47:00', '2023-10-10 13:47:00', NULL),
(116, 65, 20, 91, '000090', '21110750', 'WR-2023-000090', 'Admin', '2022-05-23', '2', 'PHARMACEUTICALS', '0011110005', 8000, '2022-08-23', 'WR2c9383ba3501da13ef58a41d41', '2024-05-23', 'SQUARE PHARMACEUTICALS LTD.', 'CHEMICAL DIVISION, BSCIC I/E, PABNA, BANGLADESH.', 'PABNA', 6602, 'Bangladesh', 'SHAHADAT HOSSEN', NULL, '01713048536', 'shahadat.hossain@squaregroup.com', '1696931991.pdf', 'Active', '2023-10-10 13:59:52', '2023-10-10 13:59:52', NULL),
(117, 66, 20, 92, '000091', '22090843', 'WR-2023-000091', 'Admin', '2023-05-13', '2', 'APPARELS', '0011110146', 8000, '2023-08-13', 'WR9b446344699b6cf42589cf3b9d', '2025-05-13', 'SMILE APPARELS LTD.', 'JHALUPAZA, SEED STORE, BHALUKA, MYMENSING BANGLADESH.', 'MYMENSING', 2240, 'Bangladesh', 'MD. KAZAL DHAR', NULL, '01718758869', 'kazal@smileapparels.net', '1696932742.pdf', 'Active', '2023-10-10 14:12:24', '2023-10-10 14:12:24', NULL),
(118, 66, 2, 93, '000092', '20220924001', 'WR-2023-000092', 'Admin', '2022-09-24', '2', 'APPARELS', '0011110146', 8000, '2022-12-24', 'WR536b3ef92c52e798a805c17869', '2024-09-24', 'SMILE APPARELS LTD.', 'JHALUPAZA, SEED STORE, BHALUKA, MYMENSING BANGLADESH.', 'MYMENSING', 2240, 'Bangladesh', 'MD. KAZAL DHAR', NULL, '01718758869', 'kazal@smileapparels.net', '1696933366.pdf', 'Active', '2023-10-10 14:22:48', '2023-10-10 14:22:48', NULL),
(119, 67, 20, 94, '000093', '22070060', 'WR-2023-000093', 'Admin', '2023-06-01', '2', 'DIGITAL PRINT FACTORY', '0011110120', 8000, '2023-09-01', 'WR98fc49043e1fe31b958c1a7ab1', '2025-06-01', 'SARWAR TEX', 'BORPA, RUPGANJ, NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 1460, 'Bangladesh', 'MD. SOBUJ', NULL, '01711531942', 'sarwartex.hs@gmail.com', '1696933977.pdf', 'Active', '2023-10-10 14:32:59', '2023-10-10 14:32:59', NULL),
(120, 67, 2, 95, '000094', '20220725007', 'WR-2023-000094', 'Admin', '2023-06-01', '2', 'DIGITAL PRINT FACTORY', 'N/A', 8000, '2023-09-01', 'WRedc54cb3e667157bda4c2455c9', '2025-06-01', 'SARWAR TEX', 'BORPA, RUPGANJ, NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 1460, 'Bangladesh', 'MD. SOBUJ', NULL, '01711531942', 'sarwartex.hs@gmail.com', '1696934098.pdf', 'Active', '2023-10-10 14:35:00', '2023-10-10 14:35:00', NULL),
(121, 68, 20, 96, '000095', '22070144', 'WR-2023-000095', 'Admin', '2022-10-12', '2', 'CEMENT FACTORY', '0011110099', 8000, '2023-01-12', 'WR2e02c17e41922fc640948c2079', '2024-10-12', 'SHAH CEMENT INDUSTRIES LTD.', 'MUKTERPUR, MUNSHIGANJ,BANGLADESH.', 'MUNSHIGANJ', 1500, 'Bangladesh', 'MD. ANWAR', NULL, '01842363755', 'psu_maintenance@abulkhairgroup.com', '1696934666.pdf', 'Active', '2023-10-10 14:44:27', '2023-10-10 14:44:27', NULL),
(122, 68, 2, 97, '000096', '20220725013', 'WR-2023-000096', 'Admin', '2022-10-12', '2', 'CEMENT FACTORY', 'N/A', 8000, '2023-01-12', 'WR5cebeab81ea33591e2a71bdf0b', '2024-10-12', 'SHAH CEMENT INDUSTRIES LTD.', 'MUKTERPUR, MUNSHIGANJ,BANGLADESH.', 'MUNSHIGANJ', 1500, 'Bangladesh', 'MD. ANWAR', NULL, '01842363755', 'psu_maintenance@abulkhairgroup.com', '1696934769.pdf', 'Active', '2023-10-10 14:46:11', '2023-10-10 14:46:11', NULL),
(123, 69, 20, 98, '000097', '22040090', 'WR-2023-000097', 'Admin', '2022-06-14', '2', 'FOOD FACTORY', '0011110039', 8000, '2022-09-14', 'WR1cc7abefae06c1dbeb9e0513a6', '2024-06-14', 'SHAPLA FOOD LTD.', 'PLOT-A-110-111, TONGI, BSCIC, GAZIPUR', 'GAZIPUR', 1710, 'Bangladesh', 'ENG. MD. ATIQUR RAHMAN TALUKDER', NULL, '01911088999', 'shaplafood@gmail.com', '1696935746.pdf', 'Active', '2023-10-10 15:02:28', '2023-10-10 15:02:28', NULL),
(124, 69, 20, 99, '000098', '22040091', 'WR-2023-000098', 'Admin', '2022-06-14', '2', 'FOOD FACTORY', '0011110041', 8000, '2022-09-14', 'WR8eb2dec0a32a2120616d240e7b', '2024-06-14', 'SHAPLA FOOD LTD.', 'PLOT-A-110-111, TONGI, BSCIC, GAZIPUR', 'GAZIPUR', 1710, 'Bangladesh', 'ENG. MD. ATIQUR RAHMAN TALUKDER', NULL, '01911088999', 'shaplafood@gmail.com', '1696995758.pdf', 'Active', '2023-10-11 07:42:40', '2023-10-11 07:42:40', NULL),
(125, 70, 20, 100, '000099', '22070024', 'WR-2023-000099', 'Admin', '2022-09-29', '2', 'TEXTILE', '0011110103', 8000, '2022-12-29', 'WRbe45b16ef7671b4e7af53a3559', '2024-09-29', 'SHUNHUA TEXTILE IND. & ACCESSORIES LTD.', 'ARAIHAJAR,NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 1450, 'Bangladesh', 'MD. NURUZZAMAN RONY', NULL, '01738115088', 'ronibkml@gmail.com', '1696997451.pdf', 'Active', '2023-10-11 08:10:52', '2023-10-11 08:10:52', NULL),
(126, 70, 2, 101, '000100', '20220725010', 'WR-2023-000100', 'Admin', '2022-09-29', '2', 'TEXTILE', 'N/A', 8000, '2022-12-29', 'WR072f61aef91ee63b38fc4ab631', '2024-09-29', 'SHUNHUA TEXTILE IND. & ACCESSORIES LTD.', 'ARAIHAJAR,NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 1450, 'Bangladesh', 'MD. NURUZZAMAN RONY', NULL, '01738115088', 'ronibkml@gmail.com', '1696997575.pdf', 'Active', '2023-10-11 08:12:57', '2023-10-11 08:12:57', NULL),
(127, 71, 2, 102, '000101', '20230515008', 'WR-2023-000101', 'Admin', '2023-08-28', '2', 'GARMENTS', 'N/A', 8000, '2023-11-28', 'WR1f7de41e776c3d0ae64f1a82a8', '2025-08-28', 'AKH KNITTING & DYEING LTD.', 'PHULBARIA, TETULJHORA, SAVAR, DHAKA, BANGLADESH', 'DHAKA', 1340, 'Bangladesh', 'MD. EMDAD HOSSAIN', NULL, '01712260650', 'info@tridentbd.com', '1697103093.pdf', 'Active', '2023-10-12 13:31:38', '2023-10-12 13:31:38', NULL),
(128, 72, 20, 103, '000102', '21110862', 'WR-2023-000102', 'Admin', '2023-04-17', '2', 'METAL INDUSTRIES', '0011110027', 8000, '2023-07-17', 'WRe1cc9bc21ffd862c958386b86f', '2025-04-17', 'SAJAN METAL INDUSTRIES LTD.', 'FATEPUR, ARAIHAZAR, NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 1450, 'Bangladesh', 'MD. SAIFULLAH MUNSUR', NULL, '01750151820', 'saifullah.smil@gmail.com', '1697105500.pdf', 'Active', '2023-10-12 14:11:42', '2023-10-12 14:11:42', NULL),
(129, 72, 2, 104, '000103', '20220423', 'WR-2023-000103', 'Admin', '2023-04-17', '2', 'METAL INDUSTRIES', 'N/A', 8000, '2023-07-17', 'WR9118993ca30f959eea44588bc8', '2025-04-17', 'SAJAN METAL INDUSTRIES LTD.', 'FATEPUR, ARAIHAZAR, NARAYANGANJ, BANGLADESH.', 'NARAYANGANJ', 1450, 'Bangladesh', 'MD. SAIFULLAH MUNSUR', NULL, '01750151820', 'saifullah.smil@gmail.com', '1697105647.pdf', 'Active', '2023-10-12 14:14:11', '2023-10-12 14:14:11', NULL),
(130, 6, 2, 81, '000104', '20220423', 'WR-2023-000104', 'Admin', '2023-10-15', '1', 'Test Application', '123456', 500, '2023-11-01', 'WRac4ba6eb487c4ae0f18bc44d68', '2024-10-15', 'Trident Agency Ltd.-2test', 'Ctgp', 'Chittagongp', 55554, 'Bangladesh', 'Farhan Prog', NULL, '01887922063', 'superadmin@gmail.comp', '1697432620.pdf', 'Inactive', '2023-10-16 09:03:43', '2023-10-16 09:05:15', NULL),
(131, 73, 2, 28, '000105', '220725018', 'WR-2023-000105', 'Admin', '2023-10-03', '1', 'Test Application', '123456', 500, '2023-11-03', 'WRa00a1daa3b40d0c04c3de02951', '2024-10-03', 'Trident Agency Ltd.-2test', 'Ctgp', 'Chittagong', 55554, 'Bangladesh', 'Farhan Prog', NULL, '01887922063', 'superadmin@gmail.com', '1697517478.pdf', 'Inactive', '2023-10-17 08:38:01', '2023-10-17 08:43:53', NULL),
(132, 74, 20, 106, '000106', '22040105', 'WR-2023-000106', 'Admin', '2022-08-16', '2', 'GARMENTS', '0011110037', 8000, '2022-11-16', 'WRe85afcca533116d77086aeab68', '2024-08-16', 'CONFIDENCE TEXWEAR LTD.', 'BAGHER BAZAR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 1710, 'Bangladesh', 'MD. SHAMIM', NULL, '01313010320', 'info@tridentbd.com', '1697538485.pdf', 'Active', '2023-10-17 14:28:07', '2023-10-17 14:28:07', NULL),
(133, 52, 20, 109, '000107', '21090887', 'WR-2023-000107', 'SHOHEL RANA', '2023-10-11', '2', 'Feed', 'N/A', 8000, '2024-01-11', 'WR56a29692c98f7857f36a29d4a4', '2025-10-11', 'MADANI FEED MILLS LTD.', 'CHIKNA, TRISHAL, MYMENSING,BANGLADESH.', 'MYMENSING', 2220, 'Bangladesh', 'MD. ANISUR RAHMAN', NULL, '01923223170', 'madanisonsagroindustriesltd@gmail.com', '1698226599.pdf', 'Active', '2023-10-25 13:36:42', '2023-10-25 13:36:42', NULL),
(134, 75, 2, 111, '000108', '20220725011', 'WR-2023-000108', 'MOMINUZZAMAN', '2023-09-16', '2', 'STILL MILLS', 'N/A', 8000, '2023-12-16', 'WR9c2b2a15a0c4709ea3ed577f75', '2025-09-16', 'SS STEEL LTD.', 'BLOCK-B, PLOT-04,TONGI INDUSTRIAL AREA, GAZIPUR, BANGLADESH.', 'GAZIPUR', 1710, 'Bangladesh', 'MD. HASEM', NULL, '01710815770', 'eee.hasemshak@gmail.com', '1698226985.pdf', 'Active', '2023-10-25 13:43:07', '2023-10-25 13:43:07', NULL),
(135, 76, 20, 112, '000109', '23080325', 'WR-2023-000109', 'MOMINUZZAMAN', '2023-11-06', '2', 'TEXTILE', '0011110534', 8000, '2024-02-06', 'WR9521c8349e0f7a3aa5b3afe397', '2025-11-06', 'SHARIF WASHING PLANT', 'JAMGORA, ASHULIA, SAVAR, DHAKA, BANGLADESH.', 'DHAKA', 1340, 'Bangladesh', 'MD.FAZLEY RABBI', NULL, '01882396607', 'hasanrabbi589@gmail.com', '1699853725.pdf', 'Active', '2023-11-13 10:35:27', '2023-11-13 10:35:27', NULL),
(136, 76, 2, 113, '000110', '20230728004', 'WR-2023-000110', 'MOMINUZZAMAN', '2023-11-06', '2', 'TEXTILE', 'N/A', 8000, '2024-02-06', 'WR620d0d47acce4353f86da57331', '2025-11-06', 'SHARIF WASHING PLANT', 'JAMGORA, ASHULIA, SAVAR, DHAKA, BANGLADESH.', 'DHAKA', 1340, 'Bangladesh', 'MD.FAZLEY RABBI', NULL, '01882396607', 'hasanrabbi589@gmail.com', '1699864896.pdf', 'Active', '2023-11-13 13:41:38', '2023-11-13 13:41:38', NULL),
(137, 77, 20, 114, '000111', '22070307', 'WR-2023-000111', 'MOMINUZZAMAN', '2023-10-19', '2', 'CHEMICALS FACTORY', '0011110111', 8000, '2024-01-19', 'WR3c7881ee425c7890e691d96fa4', '2025-10-19', 'PIDILITE SPECIALITY CHEMICALS (BD) PVT.LTD.', 'JAMIRDIA HOBIRBARI, BHALUKA, MYMENSING, BANGLADESH.', 'MYMENSING', 2240, 'Bangladesh', 'RANJON KUMAR ROY', NULL, '01703903301', 'ranjon.kumar@pidilite.com.bd', '1699865501.pdf', 'Active', '2023-11-13 13:51:43', '2023-11-13 13:51:43', NULL),
(138, 77, 2, 115, '000112', '20220725004', 'WR-2023-000112', 'MOMINUZZAMAN', '2023-10-19', '2', 'CHEMICALS FACTORY', 'N/A', 8000, '2024-01-19', 'WRa18682376a79d9e9ea3b560136', '2025-10-19', 'PIDILITE SPECIALITY CHEMICALS (BD) PVT.LTD.', 'JAMIRDIA HOBIRBARI, BHALUKA, MYMENSING, BANGLADESH.', 'MYMENSING', 2240, 'Bangladesh', 'RANJON KUMAR ROY', NULL, '01703903301', 'ranjon.kumar@pidilite.com.bd', '1699865635.pdf', 'Active', '2023-11-13 13:53:57', '2023-11-13 13:53:57', NULL),
(139, 78, 20, 116, '000113', '22070310', 'WR-2023-000113', 'MOMINUZZAMAN', '2023-09-03', '2', 'FOOD FACTORY', '0011110113', 8000, '2023-12-03', 'WRc0562b01fce3eb762c4a8cd3ed', '2025-09-03', 'PACIFIC CONSUMERS LTD.', 'JONGSHION BAZAR, LAKSAM, COMILLA, BANGLADESH.', 'COMILLA', 3570, 'Bangladesh', 'MD. RAHUL', NULL, '01715064228', 'engquddus@gmail.com', '1699866300.pdf', 'Active', '2023-11-13 14:05:03', '2023-11-13 14:05:03', NULL),
(140, 78, 2, 117, '000114', '20220725003', 'WR-2023-000114', 'MOMINUZZAMAN', '2023-09-03', '2', 'FOOD FACTORY', 'N/A', 8000, '2023-12-03', 'WR7f94a0f8478239eb4ff1933621', '2025-09-03', 'PACIFIC CONSUMERS LTD.', 'JONGSHION BAZAR, LAKSAM, COMILLA, BANGLADESH.', 'COMILLA', 3570, 'Bangladesh', 'MD. RAHUL', NULL, '01715064228', 'engquddus@gmail.com', '1699866406.pdf', 'Active', '2023-11-13 14:07:01', '2023-11-13 14:07:01', NULL),
(141, 75, 20, 118, '000115', '23080710', 'WR-2023-000115', 'MOMINUZZAMAN', '2023-11-03', '2', 'STEEL INDUSTRIES', '0011110550', 8000, '2024-02-03', 'WR078ee069430e74933be4e5d7ca', '2025-11-03', 'SS STEEL LTD.', 'BLOCK-B, PLOT-04,TONGI INDUSTRIAL AREA, GAZIPUR, BANGLADESH.', 'GAZIPUR', 1710, 'Bangladesh', 'MD. HASEM', NULL, '01710815770', 'eee.hasemshak@gmail.com', '1699867307.pdf', 'Active', '2023-11-13 14:21:49', '2023-11-13 14:21:49', NULL),
(142, 79, 2, 119, '000116', '20220725016', 'WR-2023-000116', 'MOMINUZZAMAN', '2023-10-25', '2', 'FOOD FACTORY', 'N/A', 8000, '2024-01-25', 'WRfea0b30fb23b80b4c29bdc0aa2', '2025-10-25', 'PRAN RFL (HOBIGANJ INDUSTRIES)', 'OLIPUR, HOBIGANJ, BANGLADESH', 'HOBIGANJ', 3300, 'Bangladesh', 'JONAYED', NULL, '018446040001', 'info@tridentbd.com', '1699872386.pdf', 'Active', '2023-11-13 15:46:28', '2023-11-13 15:46:28', NULL),
(143, 80, 2, 120, '000117', '20220725018', 'WR-2023-000117', 'MOMINUZZAMAN', '2023-10-25', '2', 'FOOD FACTORY', 'N/A', 8000, '2024-01-25', 'WR8a393ff11fea8f40acd1598c4e', '2025-10-25', 'PRAN RFL (HOBIGANJ INDUSTRIES)', 'OLIPUR, HOBIGANJ, BANGLADESH', 'HOBIGANJ', 3300, 'Bangladesh', 'JONAYED', NULL, '018446040001', 'info@tridentbd.com', '1699872664.pdf', 'Active', '2023-11-13 15:51:06', '2023-11-13 15:51:06', NULL),
(144, 81, 20, 121, '000118', '22070145', 'WR-2023-000118', 'MOMINUZZAMAN', '2023-11-12', '2', 'BAG MANUFACTUTING', '0011110094', 8000, '2024-02-12', 'WRe2400dbc97b2d3d114898454d1', '2025-11-12', 'BASHUNDHARA INDUSTRIAL COMPLEX LTD.(BAG PLANT)', 'HAZARIBAGH, SOUTH KERANIGANJ, DHAKA, BANGLADESH.', 'DHAKA', 1311, 'Bangladesh', 'SRIKANTA SUTRADHAR', NULL, '01710772242', 'engr.srikanta@bashundhara.com', '1700116145.pdf', 'Active', '2023-11-16 11:29:10', '2023-11-16 11:29:10', NULL),
(145, 82, 20, 122, '000119', '23040374', 'WR-2023-000119', 'MOMINUZZAMAN', '2023-11-19', '2', 'PHARMACEUTICALS', '0011110299', 8000, '2024-02-19', 'WR82be98d51efe3fddde31c2c35c', '2025-11-19', 'ARMY PHARMA LTD.', 'JOYDEBPUR, GAZIPUR, BANGLADESH', 'GAZIPUR', 1700, 'Bangladesh', 'MD. RANA HOSSAIN', NULL, '01725891010', 'ranaarmypharma@gmail.com', '1700558458.pdf', 'Active', '2023-11-21 14:21:00', '2023-11-21 14:21:00', NULL),
(146, 82, 22, 123, '000120', 'HN230514', 'WR-2023-000120', 'MOMINUZZAMAN', '2023-11-19', '2', 'PHARMACEUTICALS', 'N/A', 8000, '2024-02-19', 'WR801a097a2cc5a163d810091f29', '2025-11-19', 'ARMY PHARMA LTD.', 'JOYDEBPUR, GAZIPUR, BANGLADESH', 'GAZIPUR', 1700, 'Bangladesh', 'MD. RANA HOSSAIN', NULL, '01725891010', 'ranaarmypharma@gmail.com', '1700558741.pdf', 'Active', '2023-11-21 14:25:43', '2023-11-21 14:25:43', NULL),
(147, 37, 20, 124, '000121', '22040102', 'WR-2023-000121', 'MOMINUZZAMAN', '2022-08-29', '2', 'MANUFACTURING', '0011110040', 8000, '2022-11-29', 'WR45270143d271de42f6763e3797', '2024-08-29', 'BONAFIDE COMPOSITE TEXTILE MILLS LTD', 'FATEHPUR, ARAIHAZAR,NARAYANGONJ,BANGLADESH.', 'NARAYANGANJ', 1441, 'Bangladesh', 'MD.RONY', NULL, '01721438741', 'ronibkml@gmail.com', '1700728951.pdf', 'Active', '2023-11-23 13:42:33', '2023-11-23 13:42:33', NULL),
(148, 83, 20, 125, '000122', '23090401', 'WR-2023-000122', 'MD SHAFIUZZAMAN', '2023-11-16', '2', 'FIBEROPTICS', '0011110582', 8000, '2024-02-16', 'WR396feca2dc8f91fd2a9af424d2', '2025-11-16', 'CLARON FIBREOPTICS (BD) PRIVATE LTD.', 'BANGABANDHU HI-TECH CITY, KALIAKOIR,GAZIPUR.', 'KALIAKOIR', 1750, 'Bangladesh', 'MD.SUMON', NULL, '01723913483', 'sumon060@gmail.com', '1701151028.pdf', 'Active', '2023-11-28 10:57:11', '2023-11-28 10:57:11', NULL),
(149, 83, 2, 126, '000123', '20230516001', 'WR-2023-000123', 'MD SHAFIUZZAMAN', '2023-11-16', '2', 'FIBEROPTICS', 'N/A', 8000, '2024-02-16', 'WR0973a48b83a79e34f156b0d665', '2025-11-16', 'CLARON FIBREOPTICS (BD) PRIVATE LTD.', 'BANGABANDHU HI-TECH CITY, KALIAKOIR,GAZIPUR.', 'KALIAKOIR', 1750, 'Bangladesh', 'MD.SUMON', NULL, '01723913483', 'sumon060@gmail.com', '1701151394.pdf', 'Active', '2023-11-28 11:03:16', '2023-11-28 11:03:16', NULL),
(150, 63, 20, 88, '000124', '22031063', 'WR-2023-000124', 'Admin', '2022-09-05', '2', 'Coil factory', '0011110030', 8000, '2022-12-05', 'WR89c510c8da814ab3d1648f3b53', '2024-09-05', 'SA FORMULATION LTD.', 'GIDHORIA, SREEPUR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 1740, 'Bangladesh', 'MD. MUNJURUL HAQUE', NULL, '01708800403', 'munzurul.h51286@gmail.com', '1701928533.pdf', 'Active', '2023-12-07 10:55:35', '2023-12-07 10:55:35', NULL),
(151, 63, 2, 89, '000125', '20220423', 'WR-2023-000125', 'Admin', '2022-09-05', '2', 'Coil factory', 'N/A', 8000, '2022-12-05', 'WRdaef62bd11ec8a52791259843d', '2024-09-05', 'SA FORMULATION LTD.', 'GIDHORIA, SREEPUR, GAZIPUR,BANGLADESH.', 'GAZIPUR', 1740, 'Bangladesh', 'MD. MUNJURUL HAQUE', NULL, '01708800403', 'munzurul.h51286@gmail.com', '1701928742.pdf', 'Active', '2023-12-07 10:59:05', '2023-12-07 10:59:05', NULL),
(152, 84, 20, 127, '000126', '22070143', 'WR-2023-000126', 'MD SHAFIUZZAMAN', '2023-12-16', '2', 'TEXTILES', '0011110098', 8000, '2024-03-16', 'WR5dd5e2d0d660b53522c2ba060f', '2025-12-16', 'KC SPINNING MILLS LTD.', '117 GODNAIL,SIDDIRGONJ,NARAYANGONJ-1400', 'NARAYANGONJ', 1400, 'Bangladesh', 'MD.SAHIN ALAM', NULL, '01774432878', 'shaheenkcsm@gmail.com', '1703067046.pdf', 'Active', '2023-12-20 15:10:51', '2023-12-20 15:10:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_settings`
--

CREATE TABLE `shop_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `report_header` text DEFAULT NULL,
  `report_footer` text DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shop_settings`
--

INSERT INTO `shop_settings` (`id`, `name`, `address`, `email`, `phone`, `fax`, `report_header`, `report_footer`, `created_at`, `updated_at`) VALUES
(1, 'Trident Agency Ltd', 'Awal Centre (9th floor), 34 Kamal Ataturk Avenue, Banani C/A, Dhaka-1213.', 'info@tridentbd.com', '+8801777781066, +8801777780911', '8802222275381', NULL, NULL, NULL, '2023-10-31 07:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `spare_parts`
--

CREATE TABLE `spare_parts` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `opening_qty` bigint(20) DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `spare_parts`
--

INSERT INTO `spare_parts` (`id`, `name`, `product_code`, `category_id`, `model`, `unit`, `purchase_price`, `sale_price`, `opening_qty`, `remarks`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Test7896', NULL, 7, 'Test56', 'Piece', 500.00, 2500.00, 10, 'test note', NULL, 'Inactive', '2023-07-17 04:31:15', '2023-07-18 18:31:36'),
(2, 'Test', NULL, 7, 'Test56', 'Piece', 500.00, 2500.00, 10, 'test note', NULL, 'Inactive', '2023-07-17 04:31:35', '2023-07-18 18:34:54'),
(3, 'Test', NULL, 7, 'Test56', 'Piece', 500.00, 2500.00, 10, 'test note', NULL, 'Inactive', '2023-07-17 04:31:51', '2023-07-18 18:45:50'),
(4, 'Test', NULL, 7, 'Test56', 'Piece', 500.00, 2500.00, 10, 'test note', NULL, 'Inactive', '2023-07-17 04:33:01', '2023-07-18 18:47:16'),
(5, 'Test', NULL, 7, 'Test56', 'Piece', 500.00, 2500.00, 10, 'test note', NULL, 'Inactive', '2023-07-17 04:34:45', '2023-07-18 18:47:47'),
(6, 'test88', NULL, 7, 'CH-586', 'piece', 500.00, 2500.00, 5, 'test noters', NULL, 'Inactive', '2023-07-17 04:35:24', '2023-10-07 05:55:08'),
(7, 'test887', NULL, 7, 'CH-586', 'piece', 500.00, 2500.00, 5, 'test noters', NULL, 'Inactive', '2023-07-17 04:36:09', '2023-10-07 05:55:11'),
(8, 'Test557', NULL, 7, '432432', 'Nos', 50.00, 400.00, 2, 'trt', NULL, 'Inactive', '2023-07-17 04:49:44', '2023-10-07 05:55:14'),
(9, 'Scrue', NULL, 7, 'CH-586', 'Piece', 2.50, 15.00, 250, 'scrue for compressor', NULL, 'Inactive', '2023-07-17 05:18:25', '2023-07-18 18:39:36'),
(10, 'Scrue1', NULL, 7, 'CH-586', 'Piece', 2.50, 15.00, 250, 'scrue for compressor', NULL, 'Inactive', '2023-07-17 05:18:55', '2023-07-18 18:39:14'),
(11, 'Scrue11', NULL, 7, 'CH-586', 'Piece', 2.50, 15.00, 250, 'scrue for compressor', NULL, 'Inactive', '2023-07-17 05:19:33', '2023-07-18 18:35:52'),
(12, 'Pure Care Gear Lubricant / 20L', '100014655', 17, 'CH-586', 'NOS', 1500.00, 4500.00, 10, NULL, NULL, 'Inactive', '2023-07-26 09:50:43', '2023-10-07 05:55:19'),
(13, 'Air Filter Element', 'AF0103745', 1, '01777780911', '1', 13000.00, 13000.00, 1, NULL, NULL, 'Inactive', '2023-07-31 06:03:13', '2023-10-17 04:29:38'),
(14, 'Oil filter Cartridge', 'OF0203745', 1, 'TAL37-45HP', '6000', 6000.00, 6000.00, 0, NULL, NULL, 'Inactive', '2023-07-31 06:05:03', '2023-10-17 04:29:45'),
(15, 'Spare Part 1', '145896', 2, 'SP01', 'Nos', 500.00, 890.00, 1, 'fs hs hgf h', NULL, 'Inactive', '2023-09-29 16:19:28', '2023-10-07 05:55:29'),
(16, 'Spare Parts 2', '45005', 2, 'SP45', 'NOS', 450.00, 800.00, 25, 'sh hgs hgfs hgf hgfdh gfd hgfh', '2752a1343c6a422437f4317772', 'Inactive', '2023-09-29 16:21:49', '2023-10-07 05:55:33'),
(17, 'Trident Air Compressors', '014578', 3, 'DB123', 'NOS', 500.00, 420.00, 20, NULL, 'SPff6fac81c2543a967152a67341', 'Inactive', '2023-10-03 04:02:59', '2023-10-07 05:55:39'),
(18, 'COOLING FAN WITH MOTOR', 'CF015075100', 20, 'TAS-100PMC_75kW (3500 W, 380V/50Hz, 8.0 A, 1440 r/min, IP54, F, No: 2022-3-24)', '1', 500.00, 600.00, 2, NULL, 'SP917676cc30189d02bfcb81a645', 'Active', '2023-10-07 05:51:08', '2023-10-07 05:53:12'),
(19, 'MOTOR_20HB_15kW', 'MOTOR_20HB_15kW', 20, 'TAS-20HB_15kW', '1', 500.00, 600.00, 2, 'above', 'SP252ca5fdf9a5c3c778efea66e1', 'Active', '2023-10-10 05:38:05', '2023-10-23 04:02:59'),
(20, 'Air Fitler Element', 'AF01011520', 20, 'TAS-20HB/ PMC 15kW', '1', 1000.00, 1500.00, 48, NULL, 'SP48fdf298cf596040c50ffbebf8', 'Active', '2023-10-12 05:28:29', '2023-10-12 05:28:29'),
(21, 'Oil Fitler', 'OF01011520', 20, 'TAS-20HB/ PMC 15kW', '1', 1000.00, 1500.00, 38, NULL, 'SPec68b00b0ee227c02d3bdeea97', 'Active', '2023-10-12 05:32:16', '2023-10-12 05:32:16'),
(22, 'Air Oil Separator', 'SP01011520', 20, 'TAS-20HB/ PMC 15kW', '1', 0.00, 0.00, 22, NULL, 'SP1b49be9cc3106113f8c90d0937', 'Active', '2023-10-12 05:33:00', '2023-10-12 05:33:00'),
(23, 'Intake Valve', 'IV0701520', 20, 'TAS-20HB/ PMC 15kW', '1', 0.00, 0.00, 10, NULL, 'SP27fc36ed7e2820e7628eab2658', 'Active', '2023-10-12 05:33:33', '2023-10-12 05:33:33'),
(24, 'Minimum Pressure Valve', 'MP0801520', 20, 'TAS-20HB/ PMC 15kW', '1', 0.00, 0.00, 10, NULL, 'SPe358d3126cbde0f4bc9965e960', 'Active', '2023-10-12 05:35:34', '2023-10-12 05:35:34'),
(25, 'Temperature Sensor', 'TS0401520', 20, 'TAS-20HB/ PMC 15kW', '1', 0.00, 0.00, 10, NULL, 'SPd2bdbea06c1da2ff0321f31119', 'Active', '2023-10-12 05:35:57', '2023-10-12 05:35:57'),
(26, 'Pressure Sensor', 'PS05015160', 20, 'TAS-20HB/PMC -TAS200HB/PMC   15kW-160 kW', '1', 0.00, 0.00, 41, NULL, 'SPf023272e78f54559129e1cd237', 'Active', '2023-10-12 05:39:12', '2023-10-12 05:39:12'),
(27, 'Oil Filter', 'OF01012230', 20, 'TAS-30HB/PMC   22kW', '1', 0.00, 0.00, 22, NULL, 'SPaedf951c2d05f5dc89e2c5ebb2', 'Active', '2023-10-12 05:49:47', '2023-10-12 05:49:47'),
(28, 'Air Filter Element', 'AF01012230', 20, 'TAS-30HB/ PMC   22kW', '1', 0.00, 0.00, 35, NULL, 'SPda2adfbacf542b66a1d7125411', 'Active', '2023-10-14 14:47:02', '2023-10-15 06:20:38'),
(29, 'Air Oil Separator', 'SP01012230', 20, 'TAS-30HB/ PMC   22kW', '1', 0.00, 0.00, 14, NULL, 'SPd0936c5b328f175c842f913c07', 'Active', '2023-10-16 04:17:33', '2023-10-16 04:17:33'),
(30, 'Intake Valve', 'IV0702230', 20, 'TAS-30HB/ PMC   22kW', '1', 0.00, 0.00, 7, NULL, 'SPed4cb74e8761fa49cf17eebf4a', 'Active', '2023-10-16 04:20:25', '2023-10-16 04:20:25'),
(31, 'Minimum Pressure Valve', 'MP0802230', 20, 'TAS-30HB/ PMC   22kW', '1', 0.00, 0.00, 7, NULL, 'SP261be80664155ccabb9fb50710', 'Active', '2023-10-16 04:21:16', '2023-10-16 04:21:16'),
(32, 'Temperature Sensor', 'TS0402230', 20, 'TAS-30HB/ PMC   22kW', '1', 0.00, 0.00, 7, NULL, 'SP1462cde7ca132209c9e90f81e3', 'Active', '2023-10-16 04:22:04', '2023-10-16 04:22:04'),
(33, 'Air Filter Element', 'AF01013040', 20, 'TAS-40HB/ PMC   30kW', '1', 0.00, 0.00, 35, NULL, 'SP61f9a678b9bda37933a5574562', 'Active', '2023-10-16 04:46:26', '2023-10-16 04:46:26'),
(34, 'Oil Fitler', 'OF01013040', 20, 'TAS-40HB/ PMC   30kW', '1', 0.00, 0.00, 20, NULL, 'SP3bd50a4bd82095dd209b57f4d6', 'Active', '2023-10-16 04:47:08', '2023-10-16 04:47:08'),
(35, 'Air Oil Separator', 'SP01013040', 20, 'TAS-40HB/ PMC   30kW', '1', 0.00, 0.00, 14, NULL, 'SP5268042139b3df7b5560133e11', 'Active', '2023-10-16 04:47:35', '2023-10-16 04:47:35'),
(36, 'Intake Valve', 'IV0703040', 20, 'TAS-40HB/ PMC   30kW', '1', 0.00, 0.00, 7, NULL, 'SP132454166b646019d6bbb326f1', 'Active', '2023-10-16 04:48:08', '2023-10-16 04:48:08'),
(37, 'Minimum Pressure Valve', 'MP0803040', 20, 'TAS-40HB/ PMC   30kW', '1', 0.00, 0.00, 7, NULL, 'SP2c056f75e4e366de43d6dca84e', 'Active', '2023-10-16 04:48:34', '2023-10-16 04:48:34'),
(38, 'Temperature Sensor', 'TS0403040', 20, 'TAS-40HB/ PMC   30kW', '1', 0.00, 0.00, 7, NULL, 'SPec8f3b01f3d0a3417369dad8fa', 'Active', '2023-10-16 04:48:57', '2023-10-16 04:48:57'),
(39, 'Air Filter Element', 'AF01013750', 20, 'TAS-50HB/ PMC   37kW', '1', 0.00, 0.00, 20, NULL, 'SP1f8078559b0285e43a0ee5dc7e', 'Active', '2023-10-16 04:51:21', '2023-10-16 04:51:21'),
(40, 'Oil Filter', 'OF01013750', 20, 'TAS-50HB/ PMC   37kW', '1', 0.00, 0.00, 20, NULL, 'SP390def1e585e9f10087639bc40', 'Active', '2023-10-16 04:51:50', '2023-10-16 04:51:50'),
(41, 'Air Oil Separator', 'SP01013750', 20, 'TAS-50HB/ PMC   37kW', '1', 0.00, 0.00, 12, NULL, 'SP5ee98c376104f3e7c2ebefad7c', 'Active', '2023-10-16 04:52:19', '2023-10-16 04:52:19'),
(42, 'Intake Valve', 'IV0703750', 20, 'TAS-50HB/ PMC   37kW', '1', 0.00, 0.00, 6, NULL, 'SPfd6866f023a078ba3ece602096', 'Active', '2023-10-16 04:52:55', '2023-10-16 04:52:55'),
(43, 'Minimum Pressure Valve', 'MP0803750', 20, 'TAS-50HB/ PMC   37kW', '1', 0.00, 0.00, 6, NULL, 'SP20fcbc0bb9363fa20c569ed56a', 'Active', '2023-10-16 04:53:20', '2023-10-16 04:53:20'),
(44, 'Temperature Sensor', 'TS0403750', 20, 'TAS-50HB/ PMC   37kW', '1', 0.00, 0.00, 6, NULL, 'SP2b59b6b4263f332be36ed317f8', 'Active', '2023-10-16 04:53:42', '2023-10-16 04:53:42'),
(45, 'Air Filter Element', 'AF01014560', 20, 'TAS-60HB/ PMC    45kW', '1', 0.00, 0.00, 22, NULL, 'SP1ec04649695124d84f20394291', 'Active', '2023-10-16 05:01:51', '2023-10-16 05:01:51'),
(46, 'Oil Filter', 'OF01014560', 20, 'TAS-60HB/ PMC    45kW', '1', 0.00, 0.00, 20, NULL, 'SPb414759c34744af73bc80afbdf', 'Active', '2023-10-16 05:02:15', '2023-10-16 05:02:15'),
(47, 'Air Oil Separator', 'SP01014560', 20, 'TAS-60HB/ PMC    45kW', '1', 0.00, 0.00, 22, NULL, 'SP8c02b0c2816be9cbd033b1b40a', 'Active', '2023-10-16 05:03:10', '2023-10-16 05:03:10'),
(48, 'Intake Valve', 'IV0704560', 20, 'TAS-60HB/ PMC    45kW', '1', 0.00, 0.00, 6, NULL, 'SPf4712358aa00bdf351c2fdc5ec', 'Active', '2023-10-16 05:03:31', '2023-10-16 05:03:31'),
(49, 'Minimum Pressure Valve', 'MP0804560', 20, 'TAS-60HB/ PMC    45kW', '1', 0.00, 0.00, 6, NULL, 'SP9e42ac99c6a04841109f550271', 'Active', '2023-10-16 05:03:56', '2023-10-16 05:03:56'),
(50, 'Temperature Sensor', 'TS0404560', 20, 'TAS-60HB/ PMC    45kW', '1', 0.00, 0.00, 7, NULL, 'SP24fc1aff75b9f55c907e98bd57', 'Active', '2023-10-16 05:04:29', '2023-10-16 05:04:29'),
(51, 'Air Filter Element', 'AF01015575', 20, 'TAS-75HB/ PMC   55kW', '1', 0.00, 0.00, 20, NULL, 'SP76d42a4d7c3d972d7234ef7d0f', 'Active', '2023-10-16 05:06:45', '2023-10-16 05:06:45'),
(52, 'Oil Filter', 'OF01015575', 20, 'TAS-75HB/ PMC   55kW', '1', 0.00, 0.00, 25, NULL, 'SPf2ebbe1e9cc30f0be18d4c9e38', 'Active', '2023-10-16 05:07:54', '2023-10-16 05:07:54'),
(53, 'Air Oil Separator', 'SP01015575', 20, 'TAS-75HB/ PMC   55kW', '1', 0.00, 0.00, 20, NULL, 'SPbf846a3951ae663e8c66809f9e', 'Active', '2023-10-16 05:08:28', '2023-10-16 05:08:28'),
(54, 'Intake Valve', 'IV0705575', 20, 'TAS-75HB/ PMC   55kW', '1', 0.00, 0.00, 7, NULL, 'SP1a899820cabefa6fe956cd9c98', 'Active', '2023-10-16 05:08:54', '2023-10-16 05:08:54'),
(55, 'Minimum Pressure Valve', 'MP0805575', 20, 'TAS-75HB/ PMC   55kW', '1', 0.00, 0.00, 7, NULL, 'SPea6319e48eac07921696b18ee7', 'Active', '2023-10-16 05:09:25', '2023-10-16 05:09:25'),
(56, 'Temperature Sensor', 'TS0405575', 20, 'TAS-75HB/ PMC   55kW', '1', 0.00, 0.00, 5, NULL, 'SP7fd7cfe48a0fd6e71e9a7e3a5b', 'Active', '2023-10-16 05:09:56', '2023-10-16 05:09:56'),
(57, 'Air Filter Element', 'AF010175100', 20, 'TAS-100HB/ PMC   75kW', '1', 0.00, 0.00, 75, NULL, 'SP57ef85d5d7978cfa75431932c5', 'Active', '2023-10-16 05:10:37', '2023-10-16 05:10:37'),
(58, 'Oil Filter', 'OF010175100', 20, 'TAS-100HB/ PMC   75kW', '1', 0.00, 0.00, 30, NULL, 'SP4f3b78237a972adcf0ec510ee7', 'Active', '2023-10-16 05:10:57', '2023-10-16 05:10:57'),
(59, 'Air Oil Separator', 'SP010175100', 20, 'TAS-100HB/ PMC   75kW', '1', 0.00, 0.00, 25, NULL, 'SPc3c18196e4c84a5c3bd6b477ec', 'Active', '2023-10-16 05:11:18', '2023-10-16 05:11:18'),
(60, 'test spare', '45678ts', 2, 'ts-123', 'NOS', 500.00, 850.00, 100, NULL, 'SP2af75ad68320163af041b61068', 'Inactive', '2023-10-16 05:11:37', '2023-10-17 04:30:29'),
(61, 'Intake Valve', 'IV07075100', 20, 'TAS-100HB/ PMC   75kW', '1', 0.00, 0.00, 8, NULL, 'SP03947bcbfdf7a4a1693628cdf7', 'Active', '2023-10-16 05:11:42', '2023-10-16 05:11:42'),
(62, 'Minimum Pressure Valve', 'MP08075100', 20, 'TAS-100HB/ PMC   75kW', '1', 0.00, 0.00, 8, NULL, 'SPe042195efe3654fba367febeff', 'Active', '2023-10-16 05:12:08', '2023-10-16 05:12:08'),
(63, 'Temperature Sensor', 'TS04075100', 20, 'TAS-100HB/ PMC   75kW', '1', 0.00, 0.00, 5, NULL, 'SP509e61be6aa0fe805daac5e29c', 'Active', '2023-10-16 05:12:35', '2023-10-16 05:12:35'),
(64, 'Water Separator Element', 'TAF-35Q', 2, 'Water Separator TAC-35C', '1', 0.00, 0.00, 6, NULL, 'SPd2b1303febb3e06b5ab9f7df0e', 'Active', '2023-10-16 06:09:45', '2023-10-16 06:09:45'),
(65, 'Pre Filter Element', 'TAF-35P', 2, 'Pre Filter TAC-35T', '1', 0.00, 0.00, 6, NULL, 'SPb77ad8d0fff0a000e69f548948', 'Active', '2023-10-16 06:14:20', '2023-10-16 06:14:20'),
(66, 'Oil Removal Filter Element', 'TAF-35S', 2, 'Pre Filter TAC-35A', '1', 0.00, 0.00, 6, NULL, 'SP66f642d91652504b2378583220', 'Active', '2023-10-16 06:15:00', '2023-10-16 06:15:00'),
(67, 'Water Separator Element', 'TAF-60Q', 2, 'Pre Filter TAC-60C', '1', 0.00, 0.00, 8, NULL, 'SP73be44286f3de412a061286e78', 'Active', '2023-10-16 06:15:51', '2023-10-16 06:15:51'),
(68, 'Pre Filter Element', 'TAF-60P', 2, 'Pre Filter TAC-60T', '1', 0.00, 0.00, 8, NULL, 'SP09987aea2267e7245c5d104362', 'Active', '2023-10-16 06:16:19', '2023-10-16 06:16:19'),
(69, 'Oil Removal Filter Element', 'TAF-60S', 2, 'Pre Filter TAC-60A', '1', 0.00, 0.00, 8, NULL, 'SP5f559bc669f893a0d4aaa4475b', 'Active', '2023-10-16 06:16:38', '2023-10-16 06:16:38'),
(70, 'Water Separator Element', 'TAF-120Q', 2, 'Pre Filter TAC-120C', '1', 0.00, 0.00, 8, NULL, 'SPccab9c0016c0c1b11034a014d6', 'Active', '2023-10-16 06:17:14', '2023-10-16 06:17:14'),
(71, 'Pre Filter Element', 'TAF-120P', 2, 'Pre Filter TAC-120T', '1', 0.00, 0.00, 8, NULL, 'SP727195658d8ae65979298f4e17', 'Active', '2023-10-16 06:17:33', '2023-10-16 06:17:33'),
(72, 'Oil Removal Filter Element', 'TAF-120S', 2, 'Pre Filter TAC-120A', '1', 0.00, 0.00, 8, NULL, 'SPe353aa2fcdaeefbd1e56953eee', 'Active', '2023-10-16 06:17:55', '2023-10-16 06:17:55'),
(73, 'Water Separator Element', 'TAF-150Q', 2, 'Pre Filter TAC-150C', '1', 0.00, 0.00, 7, NULL, 'SPbaab47bba0a7ea0c8c91b39a4c', 'Active', '2023-10-16 06:18:18', '2023-10-16 06:18:18'),
(74, 'Pre Filter Element', 'TAF-150P', 2, 'Pre Filter TAC-150T', '1', 0.00, 0.00, 7, NULL, 'SPb9a6a6d26c3178c0388b324482', 'Active', '2023-10-16 06:18:37', '2023-10-16 06:18:37'),
(75, 'Oil Removal Filter Element', 'TAF-150S', 2, 'Pre Filter TAC-150A', '1', 0.00, 0.00, 7, NULL, 'SP81c94b231891e1397c1d36b4b0', 'Active', '2023-10-16 06:18:51', '2023-10-16 06:18:51'),
(76, 'Water Separator Element', 'TAF-200Q', 2, 'Pre Filter TAC-200C', '1', 0.00, 0.00, 30, NULL, 'SPf459688b413cfbbe41c3cbbf03', 'Active', '2023-10-16 06:19:16', '2023-10-16 10:05:02'),
(77, 'Pre Filter Element', 'TAF-200P', 2, 'Pre Filter TAC-200T', '1', 0.00, 0.00, 6, NULL, 'SP3cae46a90794767eff73c4f2ba', 'Active', '2023-10-16 06:20:50', '2023-10-16 06:20:50'),
(78, 'Oil Removal Filter Element', 'TAF-200S', 2, 'Pre Filter TAC-200A', '1', 0.00, 0.00, 6, NULL, 'SP808ad0f5019be6b3a7b42549fe', 'Active', '2023-10-16 06:21:07', '2023-10-16 06:21:07'),
(79, 'CompTech 6000Hr Lubricant', 'TSCO080523-20L', 20, 'CompTech 6000Hr Lubricant All Air Compressor', '1', 0.00, 0.00, 4290, NULL, 'SPe888b6a5029abfe598f2d6ec38', 'Active', '2023-10-16 10:32:35', '2023-10-16 10:32:35'),
(80, 'Air Filter Element', 'AF0101132160', 20, 'TAS-175HB/ PMC 132 kW', '1', 0.00, 0.00, 5, NULL, 'SP59891685af1a4e928b347d6a29', 'Active', '2023-10-17 09:59:31', '2023-10-18 04:25:36'),
(81, 'Oil Filter Element', 'OF0101132160', 20, 'TAS-175HB/ PMC 132 kW', '1', 0.00, 0.00, 5, NULL, 'SP1c8b372a87b33e307f8a074eec', 'Active', '2023-10-17 09:59:49', '2023-10-18 04:25:15'),
(82, 'Air Oil Separator', 'SP0101132160', 20, 'TAS-175HB/ PMC 132 kW', '1', 0.00, 0.00, 5, NULL, 'SP58faefcb6cc8a6e4c43e1a39a6', 'Active', '2023-10-17 10:00:05', '2023-10-18 04:24:38'),
(83, 'test spare product', '101', 2, 'TSP10', 'NOS', 100.00, 250.00, 10, 'test note', 'SP34e879dcf542e361ceaf0f3a63', 'Inactive', '2023-10-18 03:38:16', '2023-10-18 03:39:05'),
(84, 'Air Filter Element', 'AF010190125', 20, 'TAS-125HB/ PMC   90kW', '1', 0.00, 0.00, 0, NULL, 'SPec6c7b4356a8a1afe8ef69b70c', 'Active', '2023-10-23 06:33:08', '2023-10-23 06:33:08'),
(85, 'Oil Filter Element', 'OF010190125', 20, 'TAS-125HB/ PMC   90kW', '1', 0.00, 0.00, 0, NULL, 'SP1d17b231cf2b1e8236379ec2a9', 'Active', '2023-10-23 06:33:24', '2023-10-23 06:33:24'),
(86, 'Air Oil Separator', 'SP010190125', 20, 'TAS-125HB/ PMC   90kW', '1', 0.00, 0.00, 0, NULL, 'SP64db784b0dd297626a30536406', 'Active', '2023-10-23 06:33:47', '2023-10-23 06:33:47'),
(87, 'Coupling', 'CP01305575', 20, 'TAS-75HB/ PMC    55kW', '1', 0.00, 0.00, 1, NULL, 'SP46fb343407a03d3bdf909f98c5', 'Active', '2023-10-31 05:44:39', '2023-10-31 05:44:39'),
(88, 'Coupling Ring', 'CR01405575', 20, 'TAS-75HB/ PMC    55kW', '1', 0.00, 0.00, 1, NULL, 'SPdc2814d73d2bedb292778da3ec', 'Active', '2023-10-31 05:45:09', '2023-10-31 05:45:09'),
(89, 'Cooling Fan', 'CF01505575', 20, 'TAS-75HB/ PMC    55kW', '1', 0.00, 0.00, 1, NULL, 'SP1cdd058c942b58aba686b44f38', 'Active', '2023-10-31 05:45:40', '2023-10-31 05:45:40'),
(90, 'Auto Drain Trap', 'ADT01615160', 20, 'TAS-15HB/ PMC-  TAS-200HB/ PMC    15kw - 160kW', '1', 0.00, 0.00, 1, NULL, 'SP3be7c5552babadd155b5d7281c', 'Active', '2023-10-31 05:49:27', '2023-10-31 05:57:03'),
(91, 'Touch Screen Controller', 'MAM6080', 20, 'MAM6080M (B)(10)-W-I     TAS-75HB/ PMC    55kw', '1', 0.00, 0.00, 1, NULL, 'SP82ce047cfdff10b05580b39b83', 'Active', '2023-10-31 05:53:54', '2023-10-31 05:53:54'),
(92, 'Non-Return Valve', 'NV0605575', 20, 'TAS-75HB/ PMC    55kw', '1', 0.00, 0.00, 1, NULL, 'SPca1d892f5eca34ca153a0c7bdf', 'Active', '2023-10-31 05:54:37', '2023-10-31 05:54:37'),
(93, 'Delivery Pipe', '01200-24100PMC', 20, 'TAS-100HB/ PMC', '1', 0.00, 0.00, 1, NULL, 'SP62a0336046670deee297ad3c52', 'Active', '2023-10-31 10:02:29', '2023-10-31 10:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `qty` bigint(20) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 6, 222, '2023-07-17 05:19:33', '2023-09-17 07:21:40'),
(2, 7, 1, '2023-07-18 18:23:52', '2023-09-16 07:30:30'),
(3, 8, -1, '2023-07-18 18:48:10', '2023-08-21 04:19:31'),
(4, 12, -1, '2023-07-26 09:50:43', '2023-09-17 07:31:30'),
(5, 12, 10, '2023-07-26 09:53:20', '2023-07-26 09:53:20'),
(6, 13, -9, '2023-07-31 06:03:13', '2023-10-16 05:07:09'),
(7, 14, -1, '2023-07-31 06:05:03', '2023-10-16 05:07:09'),
(8, 14, 0, '2023-07-31 06:05:34', '2023-07-31 06:05:34'),
(9, 15, 1, '2023-09-29 16:19:28', '2023-09-29 16:19:28'),
(10, 16, 21, '2023-09-29 16:21:49', '2023-10-07 05:45:29'),
(11, 17, 15, '2023-10-03 04:02:59', '2023-10-04 08:12:48'),
(12, 17, 20, '2023-10-04 08:22:55', '2023-10-04 08:22:55'),
(13, 18, -2, '2023-10-07 05:51:08', '2023-10-23 08:48:12'),
(14, 18, 2, '2023-10-07 05:53:12', '2023-10-07 05:53:12'),
(15, 19, 1, '2023-10-10 05:38:05', '2023-10-17 05:12:37'),
(16, 13, 1, '2023-10-11 09:08:06', '2023-10-11 09:08:06'),
(17, 20, 46, '2023-10-12 05:28:29', '2023-10-31 06:39:47'),
(18, 21, 36, '2023-10-12 05:32:16', '2023-10-31 06:39:47'),
(19, 22, 21, '2023-10-12 05:33:00', '2023-10-31 06:39:47'),
(20, 23, 10, '2023-10-12 05:33:33', '2023-10-12 05:33:33'),
(21, 24, 10, '2023-10-12 05:35:34', '2023-10-12 05:35:34'),
(22, 25, 10, '2023-10-12 05:35:57', '2023-10-12 05:35:57'),
(23, 26, 41, '2023-10-12 05:39:12', '2023-10-12 05:39:12'),
(24, 27, 17, '2023-10-12 05:49:47', '2023-12-20 10:42:17'),
(25, 28, 5, '2023-10-14 14:47:02', '2023-12-20 10:42:17'),
(26, 28, 35, '2023-10-15 06:20:38', '2023-10-15 06:20:38'),
(27, 29, 13, '2023-10-16 04:17:33', '2023-12-20 10:42:17'),
(28, 30, 7, '2023-10-16 04:20:25', '2023-10-16 04:20:25'),
(29, 31, 7, '2023-10-16 04:21:16', '2023-10-16 04:21:16'),
(30, 32, 7, '2023-10-16 04:22:04', '2023-10-16 04:22:04'),
(31, 33, 30, '2023-10-16 04:46:26', '2023-11-21 08:45:48'),
(32, 34, 15, '2023-10-16 04:47:08', '2023-11-21 08:45:48'),
(33, 35, 12, '2023-10-16 04:47:35', '2023-10-23 08:39:00'),
(34, 36, 7, '2023-10-16 04:48:08', '2023-10-16 04:48:08'),
(35, 37, 7, '2023-10-16 04:48:34', '2023-10-16 04:48:34'),
(36, 38, 7, '2023-10-16 04:48:57', '2023-10-16 04:48:57'),
(37, 39, 20, '2023-10-16 04:51:21', '2023-10-16 04:51:21'),
(38, 40, 20, '2023-10-16 04:51:50', '2023-10-16 04:51:50'),
(39, 41, 12, '2023-10-16 04:52:19', '2023-10-16 04:52:19'),
(40, 42, 6, '2023-10-16 04:52:55', '2023-10-16 04:52:55'),
(41, 43, 6, '2023-10-16 04:53:20', '2023-10-16 04:53:20'),
(42, 44, 6, '2023-10-16 04:53:42', '2023-10-16 04:53:42'),
(43, 45, 8, '2023-10-16 05:01:51', '2023-11-27 07:13:25'),
(44, 46, 3, '2023-10-16 05:02:15', '2023-11-27 07:13:25'),
(45, 47, 16, '2023-10-16 05:03:10', '2023-11-27 07:13:25'),
(46, 48, 6, '2023-10-16 05:03:31', '2023-10-16 05:03:31'),
(47, 49, 6, '2023-10-16 05:03:56', '2023-10-16 05:03:56'),
(48, 50, 7, '2023-10-16 05:04:29', '2023-10-16 05:04:29'),
(49, 51, 17, '2023-10-16 05:06:45', '2023-11-04 06:54:22'),
(50, 52, 22, '2023-10-16 05:07:54', '2023-11-04 06:54:22'),
(51, 53, 18, '2023-10-16 05:08:28', '2023-10-16 10:11:44'),
(52, 54, 7, '2023-10-16 05:08:54', '2023-10-16 05:08:54'),
(53, 55, 7, '2023-10-16 05:09:25', '2023-10-16 05:09:25'),
(54, 56, 5, '2023-10-16 05:09:56', '2023-10-16 05:09:56'),
(55, 57, 61, '2023-10-16 05:10:37', '2023-12-13 06:59:26'),
(56, 58, 17, '2023-10-16 05:10:57', '2023-12-13 06:59:26'),
(57, 59, 19, '2023-10-16 05:11:18', '2023-11-20 04:18:21'),
(58, 60, 12, '2023-10-16 05:11:37', '2023-10-16 05:11:37'),
(59, 61, 8, '2023-10-16 05:11:42', '2023-10-16 05:11:42'),
(60, 62, 8, '2023-10-16 05:12:08', '2023-10-16 05:12:08'),
(61, 63, 5, '2023-10-16 05:12:35', '2023-10-16 05:12:35'),
(62, 64, 6, '2023-10-16 06:09:45', '2023-10-16 06:09:45'),
(63, 65, 6, '2023-10-16 06:14:20', '2023-10-16 06:14:20'),
(64, 66, 6, '2023-10-16 06:15:00', '2023-10-16 06:15:00'),
(65, 67, 8, '2023-10-16 06:15:51', '2023-10-16 06:15:51'),
(66, 68, 8, '2023-10-16 06:16:19', '2023-10-16 06:16:19'),
(67, 69, 8, '2023-10-16 06:16:38', '2023-10-16 06:16:38'),
(68, 70, 7, '2023-10-16 06:17:14', '2023-10-17 04:54:19'),
(69, 71, 8, '2023-10-16 06:17:33', '2023-10-16 06:17:33'),
(70, 72, 8, '2023-10-16 06:17:55', '2023-10-16 06:17:55'),
(71, 73, 6, '2023-10-16 06:18:18', '2023-11-13 04:52:21'),
(72, 74, 6, '2023-10-16 06:18:37', '2023-11-13 04:52:21'),
(73, 75, 6, '2023-10-16 06:18:51', '2023-11-13 04:52:21'),
(74, 76, 5, '2023-10-16 06:19:16', '2023-11-01 09:05:01'),
(75, 77, 5, '2023-10-16 06:20:50', '2023-11-01 09:05:01'),
(76, 78, 5, '2023-10-16 06:21:07', '2023-11-01 09:05:01'),
(77, 76, 8, '2023-10-16 10:01:11', '2023-10-16 10:01:11'),
(78, 76, 20, '2023-10-16 10:01:58', '2023-10-16 10:01:58'),
(79, 76, 30, '2023-10-16 10:05:02', '2023-10-16 10:05:02'),
(80, 79, 4281, '2023-10-16 10:32:35', '2023-12-20 10:42:17'),
(81, 60, 100, '2023-10-17 04:25:50', '2023-10-17 04:25:50'),
(82, 80, -3, '2023-10-17 09:59:31', '2023-11-21 09:11:23'),
(83, 81, 0, '2023-10-17 09:59:49', '2023-11-21 09:11:23'),
(84, 82, 3, '2023-10-17 10:00:05', '2023-11-21 09:11:23'),
(85, 83, 10, '2023-10-18 03:38:16', '2023-10-18 03:38:16'),
(86, 83, 10, '2023-10-18 03:38:40', '2023-10-18 03:38:40'),
(87, 82, 5, '2023-10-18 04:24:38', '2023-10-18 04:24:38'),
(88, 81, 5, '2023-10-18 04:25:15', '2023-10-18 04:25:15'),
(89, 80, 5, '2023-10-18 04:25:36', '2023-10-18 04:25:36'),
(90, 19, 2, '2023-10-23 04:02:59', '2023-10-23 04:02:59'),
(91, 84, 0, '2023-10-23 06:33:08', '2023-10-23 06:33:08'),
(92, 85, 0, '2023-10-23 06:33:24', '2023-10-23 06:33:24'),
(93, 86, 0, '2023-10-23 06:33:47', '2023-10-23 06:33:47'),
(94, 87, 1, '2023-10-31 05:44:39', '2023-10-31 05:44:39'),
(95, 88, 1, '2023-10-31 05:45:09', '2023-10-31 05:45:09'),
(96, 89, 1, '2023-10-31 05:45:40', '2023-10-31 05:45:40'),
(97, 90, 1, '2023-10-31 05:49:27', '2023-10-31 05:49:27'),
(98, 91, 1, '2023-10-31 05:53:54', '2023-10-31 05:53:54'),
(99, 92, 1, '2023-10-31 05:54:37', '2023-10-31 05:54:37'),
(100, 90, 1, '2023-10-31 05:57:03', '2023-10-31 05:57:03'),
(101, 93, 1, '2023-10-31 10:02:29', '2023-10-31 10:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `deleted` enum('Yes','No') DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `address`, `designation`, `role`, `image`, `email_verified_at`, `password`, `status`, `created_by`, `created_date`, `deleted`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', 1777780911, NULL, NULL, 'Super Admin', NULL, NULL, '$2y$10$mybzvk1pwtErPaKEf/H4y.p8gzLBPaMifzh7N4xF0m75ojjRNj0lq', 'Active', NULL, NULL, 'No', NULL, '2023-04-03 23:02:32', '2023-12-11 09:30:08'),
(13, 'MD SHAFIUZZAMAN', 'shafiuzzaman@tridentbd.com', 1777780938, 'Awal Center (9th Floor), 34 Kemal Ataturk, Banani C/A, Dhaka-1213.', 'Service Engineer', 'Services', NULL, NULL, '$2y$10$aTKBOENxAK73C1FDG.93TuACRRwQP5DFv92czKYnDWy1dJYWccFOa', 'Active', 1, '2023-10-17 09:58:24', 'No', NULL, '2023-10-17 13:58:24', '2023-10-23 08:01:48'),
(14, 'MOMINUZZAMAN', 'trident.momin@gmail.com', 1777780927, 'Awal Center (9th Floor), 34 Kemal Ataturk, Banani C/A, Dhaka-1213.', 'Service Engineer', 'Warranty Claims', NULL, NULL, '$2y$10$wK.Ep9Y2SqQvG7DIlxwboesOsiNXtG.Rsak81ILuawoOZ2hgswP8a', 'Active', 1, '2023-10-17 10:30:11', 'No', NULL, '2023-10-17 14:30:11', '2023-10-21 09:34:48'),
(16, 'SHOHEL RANA', 'trident.shohel@gmail.com', 1777780930, 'Awal Center (9th Floor), 34 Kemal Ataturk, Banani C/A, Dhaka-1213.', 'Sr. Service Engineer', NULL, NULL, NULL, '$2y$10$ZmHxvCe0Pj0xLPLH2h7T0e32QpRV0cCHBvnOAAebP25kKMSNCPSOy', 'Active', 1, '2023-10-17 10:46:37', 'No', NULL, '2023-10-17 14:46:37', '2023-10-17 14:46:37'),
(22, 'Farhan Prog', 'superadmin@gmail.com', 1887922064, 'Ctgp', 'Super Admin', 'Super Admin', NULL, NULL, '$2y$10$hF28Zdjxtfp9PtOJoiJUYORlI3YFmkbq.YzKaybU1kfOFncwyKrYq', 'Active', 1, '2023-10-17 11:03:56', 'No', NULL, '2023-10-17 15:03:56', '2023-10-17 15:05:09'),
(23, 'test user', 'testuser@gmail.com', 1554788963, 'dhaka', 'test', 'Admin', NULL, NULL, '$2y$10$FGt6YShn.V54fO5vhrt9PubKg8e8J.VIiSEwKLoSrzqIhdqH3cwju', 'Active', 1, '2023-10-18 03:28:25', 'No', NULL, '2023-10-18 07:28:25', '2023-10-18 07:30:35'),
(24, 'test User 1', 'testuser1@gmail.com', 1447855963, 'dhaka', 'Manager', 'Admin', NULL, NULL, '$2y$10$DuWLlIM1MhUkJITx/XO1OOedNP2qc/ZhGhJ0AJVu0R8P0xlRjbEm.', 'Active', 1, '2023-10-18 03:32:54', 'No', NULL, '2023-10-18 07:32:54', '2023-10-18 07:32:54'),
(25, 'MD LITON ALI', 'trident.litonali@gmail.com', 1777780936, 'Awal Center (9th Floor), 34 Kemal Ataturk, Banani C/A, Dhaka-1213.', 'Service Engineer', 'Services', NULL, NULL, '$2y$10$MtOvn0MNaaUbeM1FwOVq.esSA45rsWNpu3QgXqmB8pgu.NuukVR9W', 'Active', 1, '2023-10-21 06:45:17', 'No', NULL, '2023-10-21 10:45:17', '2023-10-21 10:49:59'),
(26, 'LUTFAR RAHMAN', 'lutfar@tridentbd.com', 1777781066, 'Awal Center (9th Floor), 34 Kemal Ataturk, Banani C/A, Dhaka-1213.', 'Manager Maintenance', 'Services', NULL, NULL, '$2y$10$4b0WUJsm2HGzPamet6SPYO34WkxwBLnuO2wlrE/66UwZRoFwew9K6', 'Active', 1, '2023-10-23 04:05:14', 'No', NULL, '2023-10-23 08:05:14', '2023-10-23 08:05:14'),
(27, 'SALMAN RANA', 'salman@tridentbd.com', 1777780909, 'Awal Center (9th Floor), 34 Kemal Ataturk, Banani C/A, Dhaka-1213.', 'Manager', 'Services', NULL, NULL, '$2y$10$d2Gd7qGXcFrPO4Mgk6Bgbe3/dRhtg0YLT6E9eI4ALd03lQ8v/TMwa', 'Active', 1, '2023-10-23 04:49:34', 'No', NULL, '2023-10-23 08:49:34', '2023-10-23 08:49:34'),
(28, 'MAHBUBUL ALAM', 'mahbub@tridentbd.com', 1777781000, 'Awal Center (9th Floor), 34 Kemal Ataturk, Banani C/A, Dhaka-1213.', 'General Manager', 'Services', NULL, NULL, '$2y$10$kjHokFYNVmAWLdHJh53q6O2MAEyywl4Vg9yYzYXf0fUCFNYeB9SLO', 'Active', 1, '2023-10-23 04:54:23', 'No', NULL, '2023-10-23 08:54:23', '2023-10-23 08:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `warrenty_customers`
--

CREATE TABLE `warrenty_customers` (
  `id` bigint(20) NOT NULL,
  `reg_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `end_date` varchar(100) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `updated_at` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `warrenty_customers`
--

INSERT INTO `warrenty_customers` (`id`, `reg_id`, `customer_id`, `created_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 41, 20, '22-08-2023', NULL, '2023-08-22 17:01:36', '2023-08-22 17:01:36'),
(2, 42, 6, '22-08-2023', '22-08-2023', '2023-08-22 18:30:43', '2023-08-22 18:30:43'),
(3, 42, 1, '22-08-2023', '22-08-2023', '2023-08-22 18:35:06', '2023-08-22 18:35:06'),
(4, 42, 7, '22-08-2023', '22-08-2023', '2023-08-22 19:01:55', '2023-08-22 19:04:58'),
(5, 42, 10, '22-08-2023', '22-08-2023', '2023-08-22 19:04:58', '2023-08-22 19:10:46'),
(6, 42, 6, '22-08-2023', '22-08-2023', '2023-08-22 19:10:46', '2023-08-22 19:11:29'),
(7, 42, 22, '22-08-2023', NULL, '2023-08-22 19:11:29', '2023-08-22 19:11:29'),
(8, 42, 23, '22-08-2023', '22-08-2023', '2023-08-22 19:14:52', '2023-08-22 19:18:47'),
(9, 42, 6, '22-08-2023', NULL, '2023-08-22 19:18:47', '2023-08-22 19:18:47'),
(10, 43, 24, '27-08-2023', '07-09-2023', '2023-08-27 03:23:12', '2023-09-07 16:59:26'),
(11, 43, 6, '07-09-2023', NULL, '2023-09-07 16:59:26', '2023-09-07 16:59:26'),
(12, 44, 1, '10-09-2023', NULL, '2023-09-10 06:16:44', '2023-09-10 06:16:44'),
(13, 45, 6, '29-09-2023', NULL, '2023-09-29 16:13:08', '2023-09-29 16:13:08'),
(14, 46, 25, '05-10-2023', NULL, '2023-10-05 04:40:37', '2023-10-05 04:40:37'),
(15, 47, 26, '05-10-2023', NULL, '2023-10-05 04:44:09', '2023-10-05 04:44:09'),
(16, 48, 27, '05-10-2023', NULL, '2023-10-05 05:56:31', '2023-10-05 05:56:31'),
(17, 49, 28, '05-10-2023', NULL, '2023-10-05 06:00:55', '2023-10-05 06:00:55'),
(18, 50, 29, '05-10-2023', NULL, '2023-10-05 06:16:45', '2023-10-05 06:16:45'),
(19, 51, 30, '07-10-2023', NULL, '2023-10-07 05:37:32', '2023-10-07 05:37:32'),
(20, 52, 31, '07-10-2023', NULL, '2023-10-07 05:48:22', '2023-10-07 05:48:22'),
(21, 53, 31, '07-10-2023', NULL, '2023-10-07 06:07:40', '2023-10-07 06:07:40'),
(22, 54, 32, '07-10-2023', NULL, '2023-10-07 06:17:30', '2023-10-07 06:17:30'),
(23, 55, 32, '07-10-2023', NULL, '2023-10-07 06:22:33', '2023-10-07 06:22:33'),
(24, 56, 33, '07-10-2023', NULL, '2023-10-07 06:38:54', '2023-10-07 06:38:54'),
(25, 57, 34, '07-10-2023', NULL, '2023-10-07 08:37:47', '2023-10-07 08:37:47'),
(26, 58, 34, '07-10-2023', NULL, '2023-10-07 08:41:58', '2023-10-07 08:41:58'),
(27, 59, 35, '07-10-2023', NULL, '2023-10-07 09:17:38', '2023-10-07 09:17:38'),
(28, 60, 35, '07-10-2023', NULL, '2023-10-07 09:19:02', '2023-10-07 09:19:02'),
(29, 61, 36, '08-10-2023', NULL, '2023-10-08 04:51:58', '2023-10-08 04:51:58'),
(30, 62, 36, '08-10-2023', NULL, '2023-10-08 04:53:43', '2023-10-08 04:53:43'),
(31, 63, 37, '08-10-2023', NULL, '2023-10-08 05:25:48', '2023-10-08 05:25:48'),
(32, 64, 37, '08-10-2023', NULL, '2023-10-08 05:28:25', '2023-10-08 05:28:25'),
(33, 65, 38, '08-10-2023', NULL, '2023-10-08 05:57:07', '2023-10-08 05:57:07'),
(34, 66, 39, '08-10-2023', NULL, '2023-10-08 06:10:10', '2023-10-08 06:10:10'),
(35, 67, 39, '08-10-2023', NULL, '2023-10-08 06:12:35', '2023-10-08 06:12:35'),
(36, 68, 30, '08-10-2023', NULL, '2023-10-08 06:17:33', '2023-10-08 06:17:33'),
(37, 69, 30, '08-10-2023', NULL, '2023-10-08 06:19:08', '2023-10-08 06:19:08'),
(38, 70, 40, '08-10-2023', NULL, '2023-10-08 06:34:29', '2023-10-08 06:34:29'),
(39, 71, 41, '08-10-2023', NULL, '2023-10-08 06:45:11', '2023-10-08 06:45:11'),
(40, 72, 41, '08-10-2023', NULL, '2023-10-08 06:46:40', '2023-10-08 06:46:40'),
(41, 73, 41, '08-10-2023', NULL, '2023-10-08 06:48:54', '2023-10-08 06:48:54'),
(42, 74, 41, '08-10-2023', NULL, '2023-10-08 06:50:13', '2023-10-08 06:50:13'),
(43, 75, 42, '08-10-2023', NULL, '2023-10-08 07:05:30', '2023-10-08 07:05:30'),
(44, 76, 43, '08-10-2023', NULL, '2023-10-08 08:44:39', '2023-10-08 08:44:39'),
(45, 77, 43, '08-10-2023', NULL, '2023-10-08 08:46:37', '2023-10-08 08:46:37'),
(46, 78, 44, '08-10-2023', NULL, '2023-10-08 09:00:31', '2023-10-08 09:00:31'),
(47, 79, 45, '08-10-2023', NULL, '2023-10-08 09:19:40', '2023-10-08 09:19:40'),
(48, 80, 46, '08-10-2023', NULL, '2023-10-08 09:31:47', '2023-10-08 09:31:47'),
(49, 81, 46, '08-10-2023', NULL, '2023-10-08 09:33:25', '2023-10-08 09:33:25'),
(50, 82, 47, '08-10-2023', NULL, '2023-10-08 09:47:36', '2023-10-08 09:47:36'),
(51, 83, 47, '08-10-2023', NULL, '2023-10-08 09:54:02', '2023-10-08 09:54:02'),
(52, 84, 48, '08-10-2023', NULL, '2023-10-08 10:10:15', '2023-10-08 10:10:15'),
(53, 85, 48, '08-10-2023', NULL, '2023-10-08 10:11:59', '2023-10-08 10:11:59'),
(54, 86, 49, '08-10-2023', NULL, '2023-10-08 10:27:06', '2023-10-08 10:27:06'),
(55, 87, 49, '08-10-2023', NULL, '2023-10-08 11:20:18', '2023-10-08 11:20:18'),
(56, 88, 49, '09-10-2023', NULL, '2023-10-09 08:54:41', '2023-10-09 08:54:41'),
(57, 89, 49, '09-10-2023', NULL, '2023-10-09 08:56:00', '2023-10-09 08:56:00'),
(58, 90, 12, '09-10-2023', NULL, '2023-10-09 09:14:56', '2023-10-09 09:14:56'),
(59, 91, 12, '09-10-2023', NULL, '2023-10-09 09:20:29', '2023-10-09 09:20:29'),
(60, 92, 50, '09-10-2023', NULL, '2023-10-09 09:45:36', '2023-10-09 09:45:36'),
(61, 93, 25, '09-10-2023', '12-10-2023', '2023-10-09 09:49:04', '2023-10-12 09:20:14'),
(62, 94, 12, '10-10-2023', NULL, '2023-10-10 03:13:55', '2023-10-10 03:13:55'),
(63, 95, 51, '10-10-2023', NULL, '2023-10-10 03:19:11', '2023-10-10 03:19:11'),
(64, 96, 52, '10-10-2023', NULL, '2023-10-10 03:48:21', '2023-10-10 03:48:21'),
(65, 97, 52, '10-10-2023', NULL, '2023-10-10 03:50:51', '2023-10-10 03:50:51'),
(66, 98, 53, '10-10-2023', NULL, '2023-10-10 04:26:42', '2023-10-10 04:26:42'),
(67, 99, 53, '10-10-2023', NULL, '2023-10-10 04:28:53', '2023-10-10 04:28:53'),
(68, 100, 54, '10-10-2023', NULL, '2023-10-10 05:11:44', '2023-10-10 05:11:44'),
(69, 101, 55, '10-10-2023', NULL, '2023-10-10 05:34:34', '2023-10-10 05:34:34'),
(70, 102, 55, '10-10-2023', NULL, '2023-10-10 05:37:20', '2023-10-10 05:37:20'),
(71, 103, 56, '10-10-2023', NULL, '2023-10-10 05:44:31', '2023-10-10 05:44:31'),
(72, 104, 56, '10-10-2023', NULL, '2023-10-10 05:45:42', '2023-10-10 05:45:42'),
(73, 105, 57, '10-10-2023', NULL, '2023-10-10 05:51:17', '2023-10-10 05:51:17'),
(74, 106, 58, '10-10-2023', NULL, '2023-10-10 05:54:45', '2023-10-10 05:54:45'),
(75, 107, 58, '10-10-2023', NULL, '2023-10-10 06:08:54', '2023-10-10 06:08:54'),
(76, 108, 59, '10-10-2023', NULL, '2023-10-10 06:21:19', '2023-10-10 06:21:19'),
(77, 109, 59, '10-10-2023', NULL, '2023-10-10 06:36:03', '2023-10-10 06:36:03'),
(78, 110, 60, '10-10-2023', NULL, '2023-10-10 06:49:38', '2023-10-10 06:49:38'),
(79, 111, 61, '10-10-2023', NULL, '2023-10-10 08:48:04', '2023-10-10 08:48:04'),
(80, 112, 62, '10-10-2023', NULL, '2023-10-10 08:59:54', '2023-10-10 08:59:54'),
(81, 113, 63, '10-10-2023', NULL, '2023-10-10 09:13:22', '2023-10-10 09:13:22'),
(82, 114, 63, '10-10-2023', NULL, '2023-10-10 09:16:19', '2023-10-10 09:16:19'),
(83, 115, 64, '10-10-2023', NULL, '2023-10-10 09:51:00', '2023-10-10 09:51:00'),
(84, 116, 65, '10-10-2023', NULL, '2023-10-10 09:59:52', '2023-10-10 09:59:52'),
(85, 117, 66, '10-10-2023', NULL, '2023-10-10 10:12:24', '2023-10-10 10:12:24'),
(86, 118, 66, '10-10-2023', NULL, '2023-10-10 10:22:48', '2023-10-10 10:22:48'),
(87, 119, 67, '10-10-2023', NULL, '2023-10-10 10:32:59', '2023-10-10 10:32:59'),
(88, 120, 67, '10-10-2023', NULL, '2023-10-10 10:35:00', '2023-10-10 10:35:00'),
(89, 121, 68, '10-10-2023', NULL, '2023-10-10 10:44:27', '2023-10-10 10:44:27'),
(90, 122, 68, '10-10-2023', NULL, '2023-10-10 10:46:11', '2023-10-10 10:46:11'),
(91, 123, 69, '10-10-2023', NULL, '2023-10-10 11:02:28', '2023-10-10 11:02:28'),
(92, 124, 69, '11-10-2023', NULL, '2023-10-11 03:42:40', '2023-10-11 03:42:40'),
(93, 125, 70, '11-10-2023', NULL, '2023-10-11 04:10:52', '2023-10-11 04:10:52'),
(94, 126, 70, '11-10-2023', NULL, '2023-10-11 04:12:57', '2023-10-11 04:12:57'),
(95, 93, 12, '12-10-2023', NULL, '2023-10-12 09:20:14', '2023-10-12 09:20:14'),
(96, 127, 71, '12-10-2023', NULL, '2023-10-12 09:31:38', '2023-10-12 09:31:38'),
(97, 128, 72, '12-10-2023', NULL, '2023-10-12 10:11:42', '2023-10-12 10:11:42'),
(98, 129, 72, '12-10-2023', NULL, '2023-10-12 10:14:11', '2023-10-12 10:14:11'),
(99, 130, 6, '16-10-2023', NULL, '2023-10-16 05:03:43', '2023-10-16 05:03:43'),
(100, 131, 6, '17-10-2023', '17-10-2023', '2023-10-17 04:38:01', '2023-10-17 04:43:28'),
(101, 131, 73, '17-10-2023', NULL, '2023-10-17 04:43:28', '2023-10-17 04:43:28'),
(102, 132, 74, '17-10-2023', NULL, '2023-10-17 10:28:07', '2023-10-17 10:28:07'),
(103, 133, 52, '25-10-2023', NULL, '2023-10-25 09:36:42', '2023-10-25 09:36:42'),
(104, 134, 75, '25-10-2023', NULL, '2023-10-25 09:43:07', '2023-10-25 09:43:07'),
(105, 135, 76, '13-11-2023', NULL, '2023-11-13 05:35:27', '2023-11-13 05:35:27'),
(106, 136, 76, '13-11-2023', NULL, '2023-11-13 08:41:38', '2023-11-13 08:41:38'),
(107, 137, 77, '13-11-2023', NULL, '2023-11-13 08:51:43', '2023-11-13 08:51:43'),
(108, 138, 77, '13-11-2023', NULL, '2023-11-13 08:53:57', '2023-11-13 08:53:57'),
(109, 139, 78, '13-11-2023', NULL, '2023-11-13 09:05:03', '2023-11-13 09:05:03'),
(110, 140, 78, '13-11-2023', NULL, '2023-11-13 09:07:01', '2023-11-13 09:07:01'),
(111, 141, 75, '13-11-2023', NULL, '2023-11-13 09:21:49', '2023-11-13 09:21:49'),
(112, 142, 79, '13-11-2023', NULL, '2023-11-13 10:46:28', '2023-11-13 10:46:28'),
(113, 143, 80, '13-11-2023', NULL, '2023-11-13 10:51:06', '2023-11-13 10:51:06'),
(114, 144, 81, '16-11-2023', NULL, '2023-11-16 06:29:10', '2023-11-16 06:29:10'),
(115, 145, 82, '21-11-2023', NULL, '2023-11-21 09:21:00', '2023-11-21 09:21:00'),
(116, 146, 82, '21-11-2023', NULL, '2023-11-21 09:25:43', '2023-11-21 09:25:43'),
(117, 147, 37, '23-11-2023', NULL, '2023-11-23 08:42:33', '2023-11-23 08:42:33'),
(118, 148, 83, '28-11-2023', NULL, '2023-11-28 05:57:11', '2023-11-28 05:57:11'),
(119, 149, 83, '28-11-2023', NULL, '2023-11-28 06:03:16', '2023-11-28 06:03:16'),
(120, 150, 63, '07-12-2023', NULL, '2023-12-07 05:55:35', '2023-12-07 05:55:35'),
(121, 151, 63, '07-12-2023', NULL, '2023-12-07 05:59:05', '2023-12-07 05:59:05'),
(122, 152, 84, '20-12-2023', NULL, '2023-12-20 10:10:51', '2023-12-20 10:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `warrenty_types`
--

CREATE TABLE `warrenty_types` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warrenty_types`
--

INSERT INTO `warrenty_types` (`id`, `type`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Standard 1 Year', 1, NULL, NULL, NULL),
(2, 'Standard 2 Years', 2, NULL, NULL, NULL),
(3, 'Standard 3 Years\r\n', 3, NULL, NULL, NULL),
(4, 'Standard 4 Years\r\n', 4, NULL, NULL, NULL),
(5, 'Standard 5 Years\r\n', 5, NULL, NULL, NULL),
(6, 'Standard 6 Years\r\n', 6, NULL, NULL, NULL),
(7, 'Standard 7 Years\r\n', 7, NULL, NULL, NULL),
(8, 'Standard 8 Years\r\n', 8, NULL, NULL, NULL),
(9, 'Standard 9 Years\r\n', 9, NULL, NULL, NULL),
(10, 'Standard 10 Years\r\n', 10, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annual_run_hours`
--
ALTER TABLE `annual_run_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application_types`
--
ALTER TABLE `application_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claims`
--
ALTER TABLE `claims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claim_attachments`
--
ALTER TABLE `claim_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claim_products`
--
ALTER TABLE `claim_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING HASH;

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING HASH;

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `service_warrenties`
--
ALTER TABLE `service_warrenties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_settings`
--
ALTER TABLE `shop_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spare_parts`
--
ALTER TABLE `spare_parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warrenty_customers`
--
ALTER TABLE `warrenty_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warrenty_types`
--
ALTER TABLE `warrenty_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annual_run_hours`
--
ALTER TABLE `annual_run_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `application_types`
--
ALTER TABLE `application_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `claim_attachments`
--
ALTER TABLE `claim_attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `claim_products`
--
ALTER TABLE `claim_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `service_warrenties`
--
ALTER TABLE `service_warrenties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `shop_settings`
--
ALTER TABLE `shop_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `spare_parts`
--
ALTER TABLE `spare_parts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `warrenty_customers`
--
ALTER TABLE `warrenty_customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `warrenty_types`
--
ALTER TABLE `warrenty_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
