-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 07, 2024 at 11:57 AM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 8.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elemantra`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `mobile`, `password`, `email_verified_at`, `mobile_verified_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ad_elemantra', 'elemantra@ele.com', '9000000000', '$2y$10$NGaY5XNNUsPXid8xZe2/3u56KpsCSUpHzXi1OTwh3nw6y0BA/2ILC', '2023-10-23 02:55:06', '2023-10-23 02:55:06', 1, '2023-10-23 02:55:06', '2024-01-03 08:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `area_of_works`
--

CREATE TABLE `area_of_works` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `area_of_works`
--

INSERT INTO `area_of_works` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'all area', 1, '2023-10-17 01:59:23', '2023-10-17 01:59:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `budget_ranges`
--

CREATE TABLE `budget_ranges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min` int(11) NOT NULL COMMENT 'min amount range of budget',
  `max` int(11) NOT NULL COMMENT 'max amount range of budget',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `budget_ranges`
--

INSERT INTO `budget_ranges` (`id`, `name`, `min`, `max`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Above 1000-10000', 10005, 10000545, 1, NULL, '2024-01-03 10:13:33', '2024-01-03 10:13:33'),
(2, '10k-50k', 10000, 50000, 1, NULL, '2024-01-13 08:55:29', NULL),
(3, '50k-99k', 50000, 99000, 1, NULL, '2024-01-30 16:38:15', NULL),
(4, '5 lakhs-10 lakhs', 500000, 1000000, 1, '2023-11-21 11:51:32', '2024-01-13 08:54:23', NULL),
(5, 'Above', 1000000, 1500000, 1, '2023-12-19 11:17:41', '2024-01-03 07:36:45', '2024-01-03 07:36:45'),
(6, 'Above 1000000-1500000', 1000000, 1500000, 1, '2023-12-19 11:18:28', '2024-01-03 10:34:16', '2024-01-03 10:34:16'),
(7, '10 lakhs - 20 lakhs', 1000001, 2000000, 1, '2024-01-13 08:52:53', '2024-01-13 08:54:01', NULL),
(8, '20 lakhs-30 lakhs', 2000000, 30000000, 1, '2024-01-13 08:55:12', '2024-01-13 08:55:12', NULL),
(9, '1 lakh -5 lakhs', 100000, 500000, 1, '2024-01-13 08:56:19', '2024-01-13 08:56:19', NULL),
(10, '30 lakhs and above', 3000000, 10000000, 1, '2024-01-13 08:57:04', '2024-01-13 08:57:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elemantra_notifications`
--

CREATE TABLE `elemantra_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0-All,1-individual',
  `interface_type` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0-all,1-hire_work,2-find_work',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-active,0-inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `elemantra_notifications`
--

INSERT INTO `elemantra_notifications` (`id`, `title`, `description`, `user_id`, `type`, `interface_type`, `status`, `created_at`, `updated_at`) VALUES
(6, 'New Project Alert!', 'A new project has been added. Apply quickly and find your dream work!', NULL, '0', '2', 1, '2024-01-23 11:41:59', '2024-01-23 11:41:59'),
(7, 'New Project Alert for Individual Contractors!', 'A new project has been added. Apply quickly and find your dream work!', NULL, '0', '2', 1, '2024-01-23 13:54:38', '2024-01-23 13:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_supports`
--

CREATE TABLE `help_supports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `app_interface` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci COMMENT 'user entered text here',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `support_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0-requested,1-solved',
  `requested_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_supports`
--

INSERT INTO `help_supports` (`id`, `user_id`, `app_interface`, `feedback`, `remark`, `support_status`, `requested_at`, `resolved_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 31, 'hireWork', 'Category change', NULL, '0', '2024-01-20 08:40:41', NULL, '2024-01-20 14:10:41', '2024-01-20 14:10:41', NULL),
(2, 28, 'hireWork', NULL, NULL, '0', '2024-01-20 10:09:06', NULL, '2024-01-20 15:39:06', '2024-01-20 15:39:06', NULL),
(3, 1, 'hireWork', NULL, NULL, '0', '2024-01-22 06:12:49', NULL, '2024-01-22 11:42:49', '2024-01-22 11:42:49', NULL),
(4, 41, 'findWork', 'I need boq for this project', NULL, '0', '2024-01-22 13:44:10', NULL, '2024-01-22 19:14:10', '2024-01-22 19:14:10', NULL),
(5, 8, 'hireWork', NULL, NULL, '0', '2024-01-23 18:44:05', NULL, '2024-01-24 00:14:05', '2024-01-24 00:14:05', NULL),
(6, 45, 'hireWork', NULL, NULL, '0', '2024-01-26 10:26:24', NULL, '2024-01-26 15:56:24', '2024-01-26 15:56:24', NULL),
(7, 72, 'findWork', NULL, NULL, '0', '2024-01-26 13:05:53', NULL, '2024-01-26 18:35:53', '2024-01-26 18:35:53', NULL),
(8, 68, 'findWork', NULL, NULL, '0', '2024-01-30 12:00:04', NULL, '2024-01-30 17:30:04', '2024-01-30 17:30:04', NULL),
(9, 94, 'findWork', 'pls give lead (work p. o. p false ceiling &interiors full house', NULL, '0', '2024-01-31 05:32:55', NULL, '2024-01-31 11:02:55', '2024-01-31 11:02:55', NULL),
(10, 20, NULL, 'T', NULL, '0', '2024-01-31 13:07:21', NULL, '2024-01-31 18:37:21', '2024-01-31 18:37:21', NULL),
(11, 102, 'findWork', NULL, NULL, '0', '2024-01-31 16:13:20', NULL, '2024-01-31 21:43:20', '2024-01-31 21:43:20', NULL),
(12, 61, 'findWork', NULL, NULL, '0', '2024-02-03 14:22:53', NULL, '2024-02-03 19:52:53', '2024-02-03 19:52:53', NULL),
(13, 74, NULL, NULL, NULL, '0', '2024-02-05 06:35:54', NULL, '2024-02-05 12:05:54', '2024-02-05 12:05:54', NULL),
(14, 113, 'hireWork', 'very nice platform', NULL, '0', '2024-02-05 19:49:44', NULL, '2024-02-06 01:19:44', '2024-02-06 01:19:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `work_type_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Demolition', 1, '2023-11-21 12:15:59', '2023-11-21 12:15:59', NULL),
(2, 1, 'Civil', 1, '2023-11-21 12:16:13', '2023-11-21 12:16:13', NULL),
(3, 2, '5A Switch & Socket - New', 1, '2023-11-21 12:16:38', '2024-01-17 07:49:39', '2024-01-17 07:49:39'),
(4, 3, 'False Ceiling', 1, '2023-11-21 12:17:10', '2024-01-04 08:21:05', NULL),
(5, 3, 'POP', 1, '2023-11-21 12:17:23', '2023-11-21 12:17:23', NULL),
(6, 6, 'Carpentry', 1, '2023-11-21 12:17:56', '2024-01-04 08:22:33', '2024-01-04 08:22:33'),
(7, 4, 'PAINT', 1, '2023-11-21 12:18:17', '2024-01-03 06:17:11', '2024-01-03 06:17:11'),
(8, 4, 'Polish', 1, '2023-11-21 12:18:31', '2024-01-08 10:27:08', '2024-01-08 10:27:08'),
(9, 4, 'Duco', 1, '2023-11-21 12:18:44', '2024-01-03 06:17:23', '2024-01-03 06:17:23'),
(10, 4, 'Lamination', 1, '2023-11-21 12:19:08', '2023-11-21 12:19:08', NULL),
(11, 5, 'Plumbing', 1, '2023-11-21 12:19:29', '2024-01-13 08:36:03', '2024-01-13 08:36:03'),
(12, 5, 'Demolition', 1, '2023-11-21 12:19:50', '2023-11-21 12:19:50', NULL),
(13, 2, 'Demolition dfd', 1, '2023-11-21 12:21:30', '2023-12-26 10:49:31', '2023-12-26 10:49:31'),
(14, 9, 'Test', 1, '2023-12-28 12:56:28', '2024-01-04 08:20:44', '2024-01-04 08:20:44'),
(15, 12, 'Demolition', 1, '2024-01-04 06:49:12', '2024-01-04 06:49:12', NULL),
(16, 12, 'Civil', 1, '2024-01-04 06:49:30', '2024-01-04 06:49:30', NULL),
(17, 3, 'Demolition', 1, '2024-01-04 08:22:00', '2024-01-04 08:22:00', NULL),
(18, 10, 'Carpentry', 1, '2024-01-04 08:23:33', '2024-01-17 06:01:39', '2024-01-17 06:01:39'),
(19, 2, 'Electrical', 1, '2024-01-04 08:24:09', '2024-01-08 10:18:31', '2024-01-08 10:18:31'),
(20, 4, 'Polish', 1, '2024-01-04 10:11:02', '2024-01-04 10:11:02', NULL),
(21, 4, 'PU', 1, '2024-01-04 10:11:12', '2024-01-04 10:11:12', NULL),
(22, 4, 'Duco', 1, '2024-01-04 10:11:34', '2024-01-04 10:11:34', NULL),
(23, 2, 'Light Point', 1, '2024-01-04 10:23:09', '2024-01-17 07:49:49', '2024-01-17 07:49:49'),
(24, 2, '15 A Switch & Socket - New', 1, '2024-01-04 10:23:45', '2024-01-17 07:50:31', '2024-01-17 07:50:31'),
(25, 2, 'Fan Point', 1, '2024-01-04 10:23:59', '2024-01-17 07:50:59', '2024-01-17 07:50:59'),
(26, 2, 'AC Point', 1, '2024-01-04 10:24:10', '2024-01-17 07:51:09', '2024-01-17 07:51:09'),
(27, 2, 'Secondary point', 1, '2024-01-04 10:24:28', '2024-01-17 07:50:40', '2024-01-17 07:50:40'),
(28, 2, 'Secondary point', 1, '2024-01-04 10:24:28', '2024-01-04 10:27:18', '2024-01-04 10:27:18'),
(29, 2, 'Circuit wiring', 1, '2024-01-04 10:24:38', '2024-01-17 07:50:51', '2024-01-17 07:50:51'),
(30, 2, 'Telephone wiring', 1, '2024-01-04 10:24:54', '2024-01-17 07:50:24', '2024-01-17 07:50:24'),
(31, 2, 'Internet wiring', 1, '2024-01-04 10:25:04', '2024-01-17 07:50:13', '2024-01-17 07:50:13'),
(32, 2, 'Cable wiring', 1, '2024-01-04 10:25:32', '2024-01-17 07:50:07', '2024-01-17 07:50:07'),
(33, 2, 'Speaker wiring', 1, '2024-01-04 10:25:43', '2024-01-17 07:50:01', '2024-01-17 07:50:01'),
(34, 2, 'Light fixing', 1, '2024-01-04 10:25:52', '2024-01-17 07:49:55', '2024-01-17 07:49:55'),
(35, 2, 'DB Dressing', 1, '2024-01-04 10:26:01', '2024-01-17 07:49:32', '2024-01-17 07:49:32'),
(36, 9, 'Mezzanine floor', 1, '2024-01-04 10:27:42', '2024-01-04 10:27:42', NULL),
(37, 9, 'I beam', 1, '2024-01-04 10:27:59', '2024-01-04 10:27:59', NULL),
(38, 9, 'Staircase-straight', 1, '2024-01-04 10:28:12', '2024-01-17 07:33:49', '2024-01-17 07:33:49'),
(39, 9, 'Staircase', 1, '2024-01-04 10:28:25', '2024-01-17 07:33:41', NULL),
(40, 9, 'Collapsible gate', 1, '2024-01-04 10:28:40', '2024-01-04 10:28:40', NULL),
(41, 9, 'Rolling shutter', 1, '2024-01-04 10:28:54', '2024-01-04 10:28:54', NULL),
(42, 9, 'Safety door grill', 1, '2024-01-04 10:29:08', '2024-01-04 10:29:08', NULL),
(43, 6, 'Paneling with framing', 1, '2024-01-04 10:30:40', '2024-01-04 10:30:40', NULL),
(44, 6, 'Partition', 1, '2024-01-04 10:30:54', '2024-01-04 10:30:54', NULL),
(45, 6, 'Ply ceiling', 1, '2024-01-04 10:31:08', '2024-01-19 15:22:36', '2024-01-19 15:22:36'),
(46, 6, 'Ceiling', 1, '2024-01-04 10:31:20', '2024-01-04 10:31:20', NULL),
(47, 6, 'Rafter Ceiling', 1, '2024-01-04 10:31:32', '2024-01-19 15:22:26', '2024-01-19 15:22:26'),
(48, 6, 'Wardrobe', 1, '2024-01-04 10:31:48', '2024-01-04 10:31:48', NULL),
(49, 6, 'Bed', 1, '2024-01-04 10:32:02', '2024-01-04 10:32:02', NULL),
(50, 6, 'Carcass Storage', 1, '2024-01-04 10:32:15', '2024-01-04 10:32:15', NULL),
(51, 6, 'New Door', 1, '2024-01-04 10:32:27', '2024-01-19 15:25:05', '2024-01-19 15:25:05'),
(52, 6, 'Ply Door Frame', 1, '2024-01-04 10:32:39', '2024-01-19 15:24:57', '2024-01-19 15:24:57'),
(53, 6, 'Teakwood Door Frame', 1, '2024-01-04 10:32:53', '2024-01-19 15:24:48', '2024-01-19 15:24:48'),
(54, 6, 'Sliding door', 1, '2024-01-04 10:33:06', '2024-01-19 15:24:26', '2024-01-19 15:24:26'),
(55, 6, 'Sliding folding door', 1, '2024-01-04 10:33:17', '2024-01-19 15:24:20', '2024-01-19 15:24:20'),
(56, 6, 'Headboard', 1, '2024-01-04 10:33:29', '2024-01-04 10:33:29', NULL),
(57, 6, 'Bed Side table', 1, '2024-01-04 10:33:42', '2024-01-19 15:54:55', '2024-01-19 15:54:55'),
(58, 6, 'Study Table', 1, '2024-01-04 10:33:58', '2024-01-19 15:54:49', '2024-01-19 15:54:49'),
(59, 6, 'Wall Shelves', 1, '2024-01-04 10:34:12', '2024-01-04 10:34:12', NULL),
(60, 6, 'Shutters', 1, '2024-01-04 10:34:31', '2024-01-19 16:22:50', NULL),
(61, 6, 'Inside Drawers', 1, '2024-01-04 10:34:44', '2024-01-04 10:34:44', NULL),
(62, 6, 'Kitchen Basket', 1, '2024-01-04 10:34:57', '2024-01-04 10:34:57', NULL),
(63, 6, 'Glass Partition', 1, '2024-01-04 10:35:13', '2024-01-19 16:02:11', '2024-01-19 16:02:11'),
(64, 6, 'Glass Doors', 1, '2024-01-04 10:35:26', '2024-01-19 15:24:13', '2024-01-19 15:24:13'),
(65, 6, 'Glass + Aluminium Partition', 1, '2024-01-04 10:35:49', '2024-01-19 16:02:03', '2024-01-19 16:02:03'),
(66, 6, 'Director Table', 1, '2024-01-04 10:54:33', '2024-01-19 15:54:43', '2024-01-19 15:54:43'),
(67, 6, 'Table tops', 1, '2024-01-04 10:54:50', '2024-01-19 15:55:02', '2024-01-19 15:55:02'),
(68, 6, 'Free standing workstation with keyboard trays', 1, '2024-01-04 10:55:04', '2024-01-19 16:10:53', '2024-01-19 16:10:53'),
(69, 6, 'CP/MDF Molding', 1, '2024-01-04 10:55:20', '2024-01-19 16:15:06', '2024-01-19 16:15:06'),
(70, 6, 'Wooden Flooring', 1, '2024-01-04 10:55:31', '2024-01-19 16:11:50', '2024-01-19 16:11:50'),
(71, 6, 'Refurbishment', 1, '2024-01-04 10:56:08', '2024-01-06 09:36:30', '2024-01-06 09:36:30'),
(72, 6, 'Change shutters only', 1, '2024-01-06 09:36:41', '2024-01-19 16:23:11', '2024-01-19 16:23:11'),
(73, 6, 'Change finish only', 1, '2024-01-06 09:36:55', '2024-01-19 16:26:08', '2024-01-19 16:26:08'),
(74, 6, 'Bed laminate change', 1, '2024-01-06 09:37:06', '2024-01-19 16:27:23', '2024-01-19 16:27:23'),
(75, 6, 'Bed add fabric only', 1, '2024-01-06 09:37:17', '2024-01-19 16:30:33', '2024-01-19 16:30:33'),
(76, 6, 'Metal skirting profile', 1, '2024-01-06 09:37:26', '2024-01-19 16:30:24', '2024-01-19 16:30:24'),
(77, 10, 'Wardrobe', 1, '2024-01-06 09:38:26', '2024-01-06 09:38:26', NULL),
(78, 10, 'Bed', 1, '2024-01-06 09:38:34', '2024-01-06 09:38:34', NULL),
(79, 10, 'Carcass Storage', 1, '2024-01-06 09:38:45', '2024-01-06 09:38:45', NULL),
(80, 10, 'Bed Side table', 1, '2024-01-06 09:38:57', '2024-01-19 15:54:36', '2024-01-19 15:54:36'),
(81, 10, 'Study Table', 1, '2024-01-06 09:39:05', '2024-01-19 15:54:26', '2024-01-19 15:54:26'),
(82, 10, 'Inside Drawers', 1, '2024-01-06 09:39:13', '2024-01-06 09:39:13', NULL),
(83, 5, 'Bathroom Plumbing', 1, '2024-01-06 09:40:02', '2024-01-06 09:40:02', NULL),
(84, 5, 'Kitchen Plumbing', 1, '2024-01-06 09:40:10', '2024-01-06 09:40:10', NULL),
(85, 5, 'Sanitary fixture', 1, '2024-01-06 09:40:31', '2024-01-13 08:35:41', '2024-01-13 08:35:41'),
(86, 4, 'Paint', 1, '2024-01-08 10:27:38', '2024-01-08 10:27:38', NULL),
(87, 2, 'Electricals', 1, '2024-01-17 07:48:34', '2024-01-17 07:48:34', NULL),
(88, 12, 'Other (Please mention in description)', 1, '2024-01-19 14:50:40', '2024-01-19 14:50:40', NULL),
(89, 10, 'Other (Please mention in description)', 1, '2024-01-19 14:54:32', '2024-01-19 14:54:32', NULL),
(90, 9, 'Other (Please mention in description)', 1, '2024-01-19 14:54:42', '2024-01-19 14:54:42', NULL),
(91, 6, 'Other (Please mention in description)', 1, '2024-01-19 14:54:52', '2024-01-19 14:54:52', NULL),
(92, 5, 'Other (Please mention in description)', 1, '2024-01-19 14:55:05', '2024-01-19 14:55:05', NULL),
(93, 4, 'Other (Please mention in description)', 1, '2024-01-19 14:55:31', '2024-01-19 14:55:31', NULL),
(94, 3, 'Other (Please mention in description)', 1, '2024-01-19 14:56:04', '2024-01-19 14:56:04', NULL),
(95, 2, 'Other (Please mention in description)', 1, '2024-01-19 14:56:20', '2024-01-19 14:56:20', NULL),
(96, 6, 'Door', 1, '2024-01-19 15:24:01', '2024-01-19 15:24:01', NULL),
(97, 6, 'Door Frame', 1, '2024-01-19 15:24:39', '2024-01-19 15:24:39', NULL),
(98, 6, 'Table', 1, '2024-01-19 15:53:31', '2024-01-19 15:53:31', NULL),
(99, 6, 'Flooring', 1, '2024-01-19 16:11:40', '2024-01-19 16:11:40', NULL),
(100, 6, 'Molding', 1, '2024-01-19 16:15:35', '2024-01-19 16:15:35', NULL),
(101, 6, 'Refurbishment', 1, '2024-01-19 16:27:36', '2024-01-19 16:27:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_brand_specifications`
--

CREATE TABLE `item_brand_specifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `brand_specification` text COLLATE utf8mb4_unicode_ci,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_brand_specifications`
--

INSERT INTO `item_brand_specifications` (`id`, `work_type_id`, `item_id`, `item_category_id`, `item_detail_id`, `name`, `description`, `details`, `brand_specification`, `unit_id`, `rate`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, 'NA', 'Demolition', NULL, NULL, 1, 35, 1, '2023-11-21 12:41:48', '2023-11-21 12:41:48', NULL),
(2, 1, 2, 2, 2, 'Bricks - 1st class well  burnt good quality |  cement - Ultratech,  Ambuja, Birla', 'Providing and laying 9\" (250 MM) brick partition wall with \r\ngood quality bricks well burnt 1st class in cement mortar 1:\r\n4 (1 cement : 4 coarse sand) including providing 2 nos of \r\n6mm dia MS round bars at every IV course including \r\nscaffolding, curing, raking out joints etc. complete.', NULL, NULL, 1, 210, 1, '2023-11-21 12:42:29', '2023-11-21 12:42:29', NULL),
(3, 2, 3, 3, 3, 'Wire - Havells,  Finolex, Ploycab |  Conduit -  Precision, Presto', 'NOTE - The rates include fixingof switch / socket in \r\nposition, effecting proper connections testing and \r\ncommissioning of lighting fixtures and fans including \r\nlamps, control gear, power factor improvement capacitor \r\nand all fixing accessories that may be required to check.', NULL, NULL, 4, 850, 1, '2023-11-21 12:43:24', '2024-01-04 07:01:51', '2024-01-04 07:01:51'),
(4, 2, 13, 4, 4, 'Wire - Havells,  Finolex, Ploycab |  Conduit -  Precision, Presto', 'Electrical Wiring', NULL, NULL, 4, 500, 1, '2023-11-21 12:44:47', '2023-11-21 12:44:47', NULL),
(5, 3, 4, 5, 5, 'Saint Gobain,  Lafarge, Indian  gypsum', '12.5mm thick gypsum board, with Saint Gobain or \r\nIndia Gyspum Channel including all material, labour, \r\ntransportation etc | Ceiling Channel and Intermediate \r\nChannel at 900mm c/c & Ceiling Section at 450mm \r\nc/c', NULL, NULL, 1, 150, 1, '2023-11-21 12:50:01', '2024-01-04 07:01:55', '2024-01-04 07:01:55'),
(6, 3, 5, 6, 6, 'India gypsum  board', '12.5mm thick gypsum board, with local A Grade \r\nChannel including all material, labour, transportation \r\netc', NULL, NULL, 1, 200, 1, '2023-11-21 12:50:45', '2024-01-04 07:02:11', '2024-01-04 07:02:11'),
(7, 6, 6, 7, 7, 'Mirror - Saint  gobain/Modiguard', 'commercial ply + ply framing \r\n+ 5mm clear mirror', NULL, NULL, 1, 750, 1, '2023-11-21 12:51:51', '2024-01-04 07:02:07', '2024-01-04 07:02:07'),
(8, 6, 6, 8, 8, 'India gypsum sheet', 'commercial ply + ply framing \r\n+ 12.5mm Gypsum shee', NULL, NULL, 1, 700, 1, '2023-11-21 12:52:30', '2024-01-04 07:02:04', '2024-01-04 07:02:04'),
(9, 4, 7, 9, 9, 'Asian paints', 'Painting with acrylic emulsion on ceiling, to \r\ngive an even shade – Two or more coats on \r\nnew work including preparation of surface. \r\n(_putty+_primer+_paint) as per requirement', NULL, NULL, 1, 35, 1, '2023-11-21 12:53:13', '2023-11-21 12:53:13', NULL),
(10, 4, 8, 10, 10, 'NA', 'NA', NULL, NULL, 1, 120, 1, '2023-11-21 12:53:49', '2024-01-04 07:02:00', '2024-01-04 07:02:00'),
(11, 4, 9, 11, 11, 'NA', 'NA', NULL, NULL, 1, 450, 1, '2023-11-21 12:54:10', '2023-11-21 12:54:10', NULL),
(12, 4, 10, 12, 12, 'NA', 'NA', NULL, NULL, 1, 450, 1, '2023-11-21 12:54:28', '2023-11-21 12:54:28', NULL),
(13, 5, 11, 13, 13, 'NA', 'all plumbing concealed wall \r\nand floor CPVC and UPVC \r\npipes and chipping and \r\nreplastering work', NULL, NULL, 4, 35000, 1, '2023-11-21 12:55:15', '2023-11-21 12:55:15', NULL),
(15, 6, 43, 65, 16, '512376289120408', 'ygurwihr', NULL, NULL, 1, 132, 1, '2024-01-05 11:46:38', '2024-01-05 12:42:28', '2024-01-05 12:42:28'),
(16, 12, 15, 18, 17, 'N/A', 'Demolish the 4\" brick wall completely', NULL, NULL, 1, 20, 1, '2024-01-06 06:58:25', '2024-01-06 06:58:25', NULL),
(17, 12, 16, 49, 33, 'N/A', 'Laying marble (18mm thick) of approved color, shade and size on the platform as per drawing / flooring pattern, matching of grain, laid on a levelled, neat cement base with adhesive of approved make (laterite) grouted of matching color pigment to match the shade of stone and protection of floor to be taken into account(cement concrete base taken into account in the civil works )', NULL, NULL, 1, 150, 1, '2024-01-06 07:02:18', '2024-01-06 07:02:18', NULL),
(18, 3, 17, 139, 34, 'N/A', 'Demolition of the existing false ceiling present in the living room', NULL, NULL, 3, 10, 1, '2024-01-06 07:08:45', '2024-01-06 07:08:45', NULL),
(19, 3, 5, 131, 35, 'India gypsum board', '12.5mm thick gypsum board, with local A Grade Channel including all material, labor, transportation etc.', NULL, NULL, 1, 150, 1, '2024-01-06 07:11:16', '2024-01-06 07:11:16', NULL),
(20, 3, 5, 132, 36, 'India gypsum board', '12.5mm thick gypsum board, with local A Grade Channel including all material, labor, transportation etc.', NULL, NULL, 1, 100, 1, '2024-01-06 07:21:27', '2024-01-06 07:21:27', NULL),
(21, 3, 5, 133, 37, 'Ramco', '8mm thick Ramco Hilux, with local A Grade Channel including all material, labor, transportation etc.', NULL, NULL, 1, 175, 1, '2024-01-06 07:22:20', '2024-01-06 07:22:20', NULL),
(22, 3, 5, 134, NULL, 'Ramco', '8mm thick Ramco Hilux, with local A Grade Channel including all material, labour, transportation etc', NULL, NULL, 1, 120, 1, '2024-01-06 07:23:03', '2024-01-06 07:23:03', NULL),
(23, 3, 5, 135, 39, 'Saint Gobain', 'Providing and applying 12-25  mm thick POP punning on wall /ceiling including scrapping and hacking the existing finished surface and applying plaster of paris in proper line and levels etc.', NULL, NULL, 1, 36, 1, '2024-01-06 07:24:02', '2024-01-06 07:24:02', NULL),
(24, 3, 5, 135, 39, 'Hitech, Diamond or equivalent local', 'Providing and applying 12-25  mm thick POP punning on wall /ceiling including scrapping and hacking the existing finished surface and applying plaster of paris in proper line and levels etc.', NULL, NULL, 1, 30, 1, '2024-01-06 07:24:53', '2024-01-06 07:24:53', NULL),
(25, 3, 5, 136, 40, 'Saint Gobain', 'Providing and applying 12-25  mm thick POP punning on wall /ceiling including scrapping and hacking the existing finished surface and applying plaster of paris in proper line and levels etc.', NULL, NULL, 2, 20, 1, '2024-01-06 07:26:30', '2024-01-06 07:26:30', NULL),
(26, 3, 5, 136, 40, 'Hitech, Diamond or equivalent local', 'Providing and applying 12-25  mm thick POP punning on wall /ceiling including scrapping and hacking the existing finished surface and applying plaster of paris in proper line and levels etc.', NULL, NULL, 2, 18, 1, '2024-01-06 07:27:10', '2024-01-06 07:27:10', NULL),
(27, 3, 5, 137, 41, 'N/A', 'N/A', NULL, NULL, 2, 15, 1, '2024-01-06 07:27:49', '2024-01-06 07:28:07', NULL),
(28, 3, 5, 138, 42, 'N/A', 'N/A', NULL, NULL, 2, 20, 1, '2024-01-06 07:28:38', '2024-01-06 07:28:38', NULL),
(29, 3, 4, 5, 43, 'Saint Gobain, Lafarge, Indian gypsum', '12.5mm thick gypsum board, with Saint Gobain or India Gypsum Channel including all material, labor, transportation etc. Ceiling Channel and Intermediate Channel at 900mm c/c & Ceiling Section at 450mm c/c', NULL, NULL, 1, 100, 1, '2024-01-06 07:34:39', '2024-01-06 07:34:53', NULL),
(30, 3, 4, 5, 44, 'Saint Gobain, Lafarge, Indian gypsum', '12.5mm thick gypsum board, with local A Grade Channel including all material, labor, transportation etc. \r\nCeiling Channel and Intermediate Channel at 900mm c/c & Ceiling Section at 450mm c/c', NULL, NULL, 1, 75, 1, '2024-01-06 07:35:41', '2024-01-06 07:35:41', NULL),
(31, 3, 4, 141, 45, 'Saint Gobain, Lafarge, Indian gypsum', '12.5mm thick gypsum board, with local A Grade Channel including all material, labor, transportation etc.\r\n Ceiling Channel and Intermediate Channel at 900mm c/c & Ceiling Section at 450mm c/c', NULL, NULL, 1, 50, 1, '2024-01-06 07:36:55', '2024-01-06 07:36:55', NULL),
(32, 3, 4, 142, 46, 'Ramco', '8mm Ramco Hilux board, with local A Grade Channel including all material, labor, transportation etc. \r\nCeiling Channel and Intermediate Channel at 900mm c/c & Ceiling Section at 450mm c/c', NULL, NULL, 1, 120, 1, '2024-01-06 07:38:01', '2024-01-06 07:38:01', NULL),
(33, 3, 4, 143, 47, 'Vox/similar brand', 'Enter description', NULL, NULL, 1, 100, 1, '2024-01-06 07:38:43', '2024-01-06 07:38:43', NULL),
(34, 3, 4, 144, 48, 'N/A', 'Enter Description', NULL, NULL, 3, 75, 1, '2024-01-06 07:39:30', '2024-01-06 07:39:30', NULL),
(35, 6, 48, 81, 50, 'Veneer Finish', 'MR ply + Inside laminate + finish Veneer (Includes 4 pencil drawers, Handles of base rate Rs.1000/pc)', NULL, NULL, 1, 1750, 1, '2024-01-13 06:43:16', '2024-01-13 06:43:16', NULL),
(36, 4, 86, 192, 51, 'Asian paints', 'Painting with interior finish Luster on walls , to give an even shade – Two or more coats on new work including preparation of surface. (putty+_primer+_paint) as per requirement', NULL, NULL, 1, 40, 1, '2024-01-13 06:47:17', '2024-01-13 06:47:17', NULL),
(37, 6, 55, 105, 52, 'N/A', 'MR ply + finish laminate from both sides', NULL, NULL, 1, 1100, 1, '2024-01-13 06:55:14', '2024-01-13 06:55:14', NULL),
(38, 5, 83, 193, 53, 'N/A', 'all plumbing concealed wall and floor CPVC and UPVC pipes and chipping and replastering work', NULL, NULL, 1, 25000, 1, '2024-01-13 08:27:50', '2024-01-13 08:27:50', NULL),
(39, 5, 83, 193, 54, 'N/A', 'cp fitting and sanitary ware fixing in a bathroom  (only fitting charges)', NULL, NULL, 1, 8000, 1, '2024-01-13 08:31:27', '2024-01-13 08:31:27', NULL),
(40, 5, 84, 195, 55, 'N/A', 'all plumbing concealed wall and floor CPVC and UPVC pipes and chipping and replastering work', NULL, NULL, 1, 150000, 1, '2024-01-13 08:33:30', '2024-01-13 08:33:30', NULL),
(41, 5, 84, 195, 56, 'N/A', 'cp fitting and sanitary ware fixing (only fitting charges)', NULL, NULL, 1, 1500, 1, '2024-01-13 08:34:10', '2024-01-13 08:34:10', NULL),
(42, 5, 12, 198, 58, 'N/A', 'Removal of Sanitary Fittings  and Concealed Supply and drainage lines from given locations', NULL, NULL, 1, 1000, 1, '2024-01-13 08:39:13', '2024-01-13 08:39:13', NULL),
(43, 5, 12, 197, 57, 'N/A', 'Removal of Sanitary Fittings  and Concealed Supply and drainage lines from given locations', NULL, NULL, 1, 2000, 1, '2024-01-13 08:39:55', '2024-01-13 08:39:55', NULL),
(44, 4, 86, 200, 67, 'Asian paints', 'Painting with acrylic emulsion on ceiling, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', NULL, NULL, 1, 27, 1, '2024-01-13 08:48:02', '2024-01-13 08:48:02', NULL),
(45, 4, 86, 199, 68, 'Asian paints', 'Painting with royal luxury emulsion on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', NULL, NULL, 1, 35, 1, '2024-01-13 08:48:55', '2024-01-13 08:48:55', NULL),
(46, 4, 86, 201, 69, 'Asian paints', 'Painting with royal Aspira on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', NULL, NULL, 1, 45, 1, '2024-01-13 08:49:34', '2024-01-13 08:49:34', NULL),
(47, 4, 86, 202, NULL, 'Asian paints', 'Painting with royal Shyne on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', NULL, NULL, 1, 35, 1, '2024-01-13 08:50:02', '2024-01-13 08:50:02', NULL),
(48, 2, 87, 210, 116, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'NOTE - The rates include fixing of switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', NULL, NULL, 4, 625, 1, '2024-01-17 07:54:45', '2024-01-17 07:54:45', NULL),
(49, 2, 87, 211, 117, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', NULL, NULL, 4, 850, 1, '2024-01-17 07:55:33', '2024-01-17 07:55:33', NULL),
(50, 2, 87, 212, 118, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'NOTE - The rates include fixing of switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', NULL, NULL, 4, 1000, 1, '2024-01-17 07:56:25', '2024-01-17 07:56:25', NULL),
(51, 12, 16, 34, 93, 'Bricks - 1st class well burnt good quality | cement - Ultratech, Ambuja, Birla', 'Providing and laying 4\" (100 MM) brick partition wall with good quality bricks well burnt 1st class in cement mortar 1:4 (1 cement : 4 coarse sand) including providing 2 nos of 6mm dia MS round bars at every IV course including scaffolding, curing, raking out joints etc. complete.', NULL, NULL, 1, 110, 1, '2024-01-17 07:58:30', '2024-01-17 07:58:30', NULL),
(52, 12, 16, 34, 94, 'Bricks - 1st class well burnt good quality | cement - Ultratech, Ambuja, Birla', 'Providing and laying 6\" (150 MM) brick partition wall with good quality bricks well burnt 1st class in cement mortar 1:4 (1 cement : 4 coarse sand) including providing 2 nos of 6mm dia MS round bars at every IV course including scaffolding, curing, raking out joints etc. complete.', NULL, NULL, 1, 175, 1, '2024-01-17 07:59:18', '2024-01-17 07:59:18', NULL),
(53, 12, 16, 34, 95, 'Bricks - 1st class well burnt good quality | cement - Ultratech, Ambuja, Birla', 'Providing and laying 9\" (250 MM) brick partition wall with good quality bricks well burnt 1st class in cement mortar 1:4 (1 cement : 4 coarse sand) including providing 2 nos of 6mm dia MS round bars at every IV course including scaffolding, curing, raking out joints etc. complete.', NULL, NULL, 1, 170, 1, '2024-01-17 08:00:03', '2024-01-17 08:00:03', NULL),
(54, 12, 16, 37, 96, 'Siporex Blocks', 'Providing and laying 4\" (100 MM) Siporex partition wall with good quality  blocks 1st class in cement mortar 1:4 (1 cement : 4 coarse sand) including providing 2 nos of 6mm dia MS round bars at every IV course including scaffolding, curing, raking out joints etc. complete.', NULL, NULL, 1, 140, 1, '2024-01-17 08:00:43', '2024-01-17 08:00:43', NULL),
(55, 12, 16, 37, 97, 'Siporex Blocks', 'Providing and laying 6\" (150 MM) Siporex partition wall with good quality  blocks 1st class in cement mortar 1:4 (1 cement : 4 coarse sand) including providing 2 nos of 6mm dia MS round bars at every IV course including scaffolding, curing, raking out joints etc. complete.', NULL, NULL, 1, 1, 1, '2024-01-17 08:01:21', '2024-01-17 08:01:21', NULL),
(56, 12, 16, 37, 98, 'Siporex Blocks', 'Providing and laying 9\" (250 MM) Siporex partition wall with good quality  blocks 1st class in cement mortar 1:4 (1 cement : 4 coarse sand) including providing 2 nos of 6mm dia MS round bars at every IV course including scaffolding, curing, raking out joints etc. complete.', NULL, NULL, 1, 1, 1, '2024-01-17 08:02:03', '2024-01-17 08:02:03', NULL),
(57, 12, 16, 38, 99, 'cement - Ultratech, Ambuja, Birla', 'Providing and laying 12-25 mm thick cement plaster of mis 1 : 4 (1 cement : 4 sand with 50% coarse sand & 50% fine sand) to all type of RCC / brick surface in line, level and plumb including providing  wiremesh at all junctions of walls and ceilings etc. complete.', NULL, NULL, 1, 120, 1, '2024-01-17 08:02:50', '2024-01-17 08:02:50', NULL),
(58, 9, 36, 203, 123, 'N/A', 'Enter item description and specification', NULL, NULL, 1, 1, 1, '2024-01-17 08:10:01', '2024-01-17 08:10:01', NULL),
(59, 9, 37, 204, 124, 'N/A', 'Enter item description and specification', NULL, NULL, 1, 1, 1, '2024-01-17 08:10:32', '2024-01-17 08:10:32', NULL),
(60, 9, 39, 205, 125, 'N/A', 'Enter item description and specification', NULL, NULL, 1, 1, 1, '2024-01-17 08:11:01', '2024-01-17 08:11:01', NULL),
(61, 9, 39, 206, 126, 'N/A', 'Enter item description and specification', NULL, NULL, 1, 1, 1, '2024-01-17 08:11:31', '2024-01-17 08:11:31', NULL),
(62, 9, 40, 207, 127, 'N/A', 'Enter item description and specification', NULL, NULL, 1, 1, 1, '2024-01-17 08:12:08', '2024-01-17 08:12:08', NULL),
(63, 9, 41, 208, 128, '21 gauge', 'Motorized', NULL, NULL, 1, 1, 1, '2024-01-17 08:12:51', '2024-01-17 08:12:51', NULL),
(64, 6, 43, 64, 130, 'N/A', 'MR ply + ply framing + finish laminate', NULL, NULL, 1, 1, 1, '2024-01-17 08:16:03', '2024-01-17 08:16:03', NULL),
(65, 6, 43, 65, 134, 'N/A', 'MR ply + ply framing + finish Veneer', NULL, NULL, 1, 1, 1, '2024-01-17 08:19:47', '2024-01-17 08:19:47', NULL),
(66, 6, 43, 66, 135, 'Mirror - Saint gobain/Modiguard', 'MR ply + ply framing + 5mm clear mirror', NULL, NULL, 1, 1, 1, '2024-01-17 08:20:34', '2024-01-17 08:20:34', NULL),
(67, 6, 96, 244, 141, 'Specify Brand in Description', 'MR ply + finish laminate from both sides', NULL, NULL, 1, 1, 1, '2024-01-19 17:31:43', '2024-01-19 17:31:43', NULL),
(68, 6, 96, 244, 142, 'Please specify in description', 'MR ply + finish veneer from both sides', NULL, NULL, 1, 1, 1, '2024-01-19 17:34:46', '2024-01-19 17:34:46', NULL),
(69, 2, 87, 210, 201, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail\r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 4, 1, 1, '2024-01-20 12:06:48', '2024-01-29 13:13:45', NULL),
(70, 2, 87, 211, 202, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'NOTE - The rates include fixing of switch / socket in position, effecting proper connections testing.\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 4, 1, 1, '2024-01-20 12:07:23', '2024-01-29 13:41:37', NULL),
(71, 2, 87, 212, 203, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail\r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 4, 1, 1, '2024-01-20 12:08:02', '2024-01-29 13:14:03', NULL),
(72, 2, 87, 213, 204, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail\r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 4, 1, 1, '2024-01-20 12:08:40', '2024-01-29 13:14:27', NULL),
(73, 2, 87, 214, 205, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail\r\n\r\n(mention if the BOQ includes Material Cost, Installation Charges etc)', NULL, NULL, 4, 1, 1, '2024-01-20 12:09:15', '2024-01-29 13:15:04', NULL),
(74, 2, 87, 280, 206, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail\r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 4, 1, 1, '2024-01-20 12:09:55', '2024-01-29 13:11:45', NULL),
(75, 2, 87, 281, 207, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail\r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 2, 1, 1, '2024-01-20 12:10:32', '2024-01-29 13:11:00', NULL),
(76, 2, 87, 281, 208, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail \r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 2, 1, 1, '2024-01-20 12:11:09', '2024-01-29 12:28:02', NULL),
(77, 2, 87, 281, 209, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail \r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 2, 1, 1, '2024-01-20 12:11:42', '2024-01-29 12:24:36', NULL),
(78, 2, 87, 282, NULL, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Electrical Wiring', NULL, NULL, 2, 1, 1, '2024-01-20 12:12:30', '2024-01-20 12:12:30', NULL),
(79, 2, 87, 283, 211, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail \r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 2, 1, 1, '2024-01-20 12:13:08', '2024-01-29 12:23:01', NULL),
(80, 2, 87, 284, 212, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail \r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 2, 1, 1, '2024-01-20 12:13:46', '2024-01-29 12:20:37', NULL),
(81, 2, 87, 285, 213, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 'Please enter the work description in detail\r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 2, 1, 1, '2024-01-20 12:14:32', '2024-01-29 12:17:05', NULL),
(82, 2, 87, 286, 214, 'specify in description', 'Please enter the work description in detail \r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 3, 1, 1, '2024-01-20 12:15:26', '2024-01-29 12:20:15', NULL),
(83, 2, 87, 286, 215, 'specify in description', 'Please enter the work description in detail \r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 2, 1, 1, '2024-01-20 12:16:04', '2024-01-29 12:18:35', NULL),
(84, 2, 87, 286, 216, 'specify in description', 'Please enter the work description in detail \r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 3, 1, 1, '2024-01-20 12:16:47', '2024-01-29 12:18:16', NULL),
(85, 2, 87, 287, 217, 'N/A', 'Please enter the work description in detail \r\n\r\n(mention if the BOQ includes Material Cost)', NULL, NULL, 3, 1, 1, '2024-01-20 12:17:23', '2024-01-29 12:17:46', NULL),
(86, 4, 86, 202, 70, 'Asian Paints', 'Painting with royal Shyne on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', NULL, NULL, 1, 45, 1, '2024-01-21 16:46:21', '2024-01-21 16:46:21', NULL),
(87, 4, 20, 185, 62, 'Specify brand in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:00:37', '2024-01-21 17:00:37', NULL),
(88, 4, 20, 186, 63, 'Specify brand in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:01:10', '2024-01-21 17:01:10', NULL),
(89, 4, 21, 189, 64, 'Specify brand detail in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:01:51', '2024-01-21 17:01:51', NULL),
(90, 4, 21, 190, 65, 'Specify brand detail in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:02:35', '2024-01-21 17:02:35', NULL),
(91, 4, 21, 191, 66, 'Specify brand detail in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:03:06', '2024-01-21 17:03:06', NULL),
(92, 4, 10, 182, 59, 'Specify brand detail in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:07:41', '2024-01-21 17:07:41', NULL),
(93, 4, 10, 184, 61, 'Specify brand detail in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:08:21', '2024-01-21 17:08:21', NULL),
(94, 4, 10, 183, 60, 'Specify brand detail in description', 'Enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:08:56', '2024-01-21 17:08:56', NULL),
(95, 4, 22, 187, 218, 'Specify brand detail in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:10:47', '2024-01-21 17:10:47', NULL),
(96, 4, 22, 188, 219, 'Specify brand detail in description', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:11:23', '2024-01-21 17:11:23', NULL),
(97, 4, 93, 289, 220, 'Other (Please mention in description)', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:21:02', '2024-01-21 17:21:02', NULL),
(98, 5, 12, 197, 57, 'Please mention in description', 'Removal of Sanitary Fittings  and Concealed Supply and drainage lines from given locations', NULL, NULL, 1, 1, 1, '2024-01-21 17:48:22', '2024-01-21 17:48:22', NULL),
(99, 5, 12, 198, 58, 'Please mention in description', 'Removal of Sanitary Fittings  and Concealed Supply and drainage lines from given locations', NULL, NULL, 1, 1, 1, '2024-01-21 17:49:09', '2024-01-21 17:49:09', NULL),
(100, 5, 92, 290, 221, 'Other (Please mention in description)', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-21 17:50:40', '2024-01-21 17:50:40', NULL),
(101, 3, 94, 294, 222, 'N/A', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-23 13:44:53', '2024-01-23 13:44:53', NULL),
(102, 3, 17, 292, 225, 'N/A', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-23 13:45:18', '2024-01-23 13:45:18', NULL),
(103, 3, 5, 291, 224, 'N/A', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-23 13:45:43', '2024-01-23 13:45:43', NULL),
(104, 3, 4, 293, 223, 'N/A', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-23 13:46:08', '2024-01-23 13:46:08', NULL),
(105, 10, 89, 295, 226, 'N/A', 'Please enter description', NULL, NULL, 3, 1, 1, '2024-01-23 13:54:19', '2024-01-23 13:54:19', NULL),
(106, 6, 48, 80, 227, 'N/A', 'Please enter Description', NULL, NULL, 1, 1, 1, '2024-01-23 20:38:58', '2024-01-23 20:38:58', NULL),
(107, 6, 91, 237, 229, 'N/A', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-24 16:42:59', '2024-01-24 16:42:59', NULL),
(108, 12, 88, 236, 230, 'N/A', 'Please enter description', NULL, NULL, 1, 1, 1, '2024-01-24 21:29:01', '2024-01-24 21:29:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `work_type_id`, `item_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1, 'Floor PCC', 1, '2023-11-21 12:20:24', '2024-01-04 08:20:15', '2024-01-04 08:20:15'),
(2, 1, 2, 'Siporex wall - 9\"', 1, '2023-11-21 12:20:46', '2023-11-21 12:20:46', NULL),
(3, 1, 3, '5A Switch &  Socket - New', 1, '2023-11-21 12:21:09', '2023-11-21 12:21:09', NULL),
(4, 2, 13, 'Electrical', 1, '2023-11-21 12:21:52', '2023-11-21 12:21:52', NULL),
(5, 1, 4, 'Gypsum Board  Ceiling', 1, '2023-11-21 12:22:30', '2023-11-21 12:22:30', NULL),
(6, 2, 5, 'POP Partition', 1, '2023-11-21 12:22:59', '2024-01-04 08:20:37', '2024-01-04 08:20:37'),
(7, 4, 6, 'Panelling with framing', 1, '2023-11-21 12:23:23', '2024-01-04 08:20:34', '2024-01-04 08:20:34'),
(8, 4, 6, 'Partition', 1, '2023-11-21 12:23:52', '2024-01-04 08:20:32', '2024-01-04 08:20:32'),
(9, 1, 7, 'Premium Emulsion  (Plastic Paint)', 1, '2023-11-21 12:24:25', '2023-11-21 12:24:25', NULL),
(10, 8, 8, 'Melamine', 1, '2023-11-21 12:24:42', '2023-11-21 12:24:42', NULL),
(11, 9, 9, 'Matt', 1, '2023-11-21 12:24:56', '2023-12-28 12:49:08', '2023-12-28 12:49:08'),
(12, 5, 10, 'Clear', 1, '2023-11-21 12:33:13', '2024-01-04 08:20:29', '2024-01-04 08:20:29'),
(13, 6, 11, 'Bathroom Plumbing', 1, '2023-11-21 12:33:39', '2024-01-04 08:20:26', '2024-01-04 08:20:26'),
(14, 4, 12, 'Bathroom Plumbing', 1, '2023-11-21 12:33:56', '2024-01-04 08:20:24', '2024-01-04 08:20:24'),
(15, 6, 6, 'test df', 1, '2023-12-26 11:24:24', '2023-12-26 12:10:49', '2023-12-26 12:10:49'),
(16, 6, 6, 'test', 1, '2023-12-27 04:45:17', '2024-01-04 08:20:21', '2024-01-04 08:20:21'),
(17, 9, 14, 'Test1', 1, '2023-12-28 12:56:44', '2024-01-04 08:20:18', '2024-01-04 08:20:18'),
(18, 12, 15, 'Brickwall', 1, '2024-01-04 10:57:32', '2024-01-04 10:57:32', NULL),
(19, 12, 15, 'RCC', 1, '2024-01-04 10:57:54', '2024-01-04 10:57:54', NULL),
(20, 12, 15, 'Plaster', 1, '2024-01-04 10:58:10', '2024-01-04 10:58:10', NULL),
(21, 12, 15, 'Wall tiles', 1, '2024-01-04 10:58:26', '2024-01-04 10:58:26', NULL),
(22, 12, 15, 'Floor tiles', 1, '2024-01-04 10:58:39', '2024-01-04 10:58:39', NULL),
(23, 12, 15, 'Floor PCC', 1, '2024-01-04 10:58:54', '2024-01-04 10:58:54', NULL),
(24, 12, 15, 'Granite frames', 1, '2024-01-04 10:59:08', '2024-01-04 10:59:08', NULL),
(25, 12, 15, 'Floor marble/granite', 1, '2024-01-04 10:59:26', '2024-01-04 10:59:26', NULL),
(26, 12, 15, 'Wall marble/granite', 1, '2024-01-04 10:59:40', '2024-01-04 10:59:40', NULL),
(27, 12, 15, 'Wall skirting', 1, '2024-01-04 10:59:57', '2024-01-04 10:59:57', NULL),
(28, 12, 15, 'Kitchen platform', 1, '2024-01-04 11:00:10', '2024-01-04 11:00:10', NULL),
(29, 12, 15, 'Brickbat', 1, '2024-01-04 11:00:25', '2024-01-04 11:00:25', NULL),
(30, 12, 15, 'Tancha work', 1, '2024-01-04 11:00:37', '2024-01-04 11:00:37', NULL),
(31, 12, 15, 'Additional Labor', 1, '2024-01-04 11:00:56', '2024-01-19 14:46:30', '2024-01-19 14:46:30'),
(32, 12, 16, 'Brickwall - 4\"', 1, '2024-01-04 11:01:29', '2024-01-17 06:29:16', '2024-01-17 06:29:16'),
(33, 12, 16, 'Brickwall - 6\"', 1, '2024-01-04 11:01:41', '2024-01-17 06:29:08', '2024-01-17 06:29:08'),
(34, 12, 16, 'Brickwall', 1, '2024-01-04 11:02:04', '2024-01-17 06:28:43', NULL),
(35, 12, 16, 'Siporex wall - 4\"', 1, '2024-01-04 11:02:21', '2024-01-17 06:32:21', '2024-01-17 06:32:21'),
(36, 12, 16, 'Siporex wall - 6\"', 1, '2024-01-04 11:02:38', '2024-01-17 06:32:13', '2024-01-17 06:32:13'),
(37, 12, 16, 'Siporex wall', 1, '2024-01-04 11:02:53', '2024-01-17 06:31:59', NULL),
(38, 12, 16, 'Plaster', 1, '2024-01-04 11:03:11', '2024-01-04 11:03:11', NULL),
(39, 12, 16, 'Wall tiles', 1, '2024-01-04 11:03:28', '2024-01-04 11:03:28', NULL),
(40, 12, 16, 'Floor tiles', 1, '2024-01-04 11:03:48', '2024-01-04 11:03:48', NULL),
(41, 12, 16, 'Wall tile Skirting', 1, '2024-01-04 11:04:06', '2024-01-04 11:04:06', NULL),
(42, 12, 16, 'Floor PCC', 1, '2024-01-04 11:04:23', '2024-01-04 11:04:23', NULL),
(43, 12, 16, 'Granite frames', 1, '2024-01-04 11:04:39', '2024-01-04 11:04:39', NULL),
(44, 12, 16, 'Marble frames', 1, '2024-01-04 11:04:55', '2024-01-04 11:04:55', NULL),
(45, 12, 16, 'Floor Laying', 1, '2024-01-04 11:05:18', '2024-01-17 06:40:42', NULL),
(46, 12, 16, 'Wall marble/granite / Tiles', 1, '2024-01-04 11:05:40', '2024-01-17 06:42:36', '2024-01-17 06:42:36'),
(47, 12, 16, 'Wall laying', 1, '2024-01-04 11:06:06', '2024-01-17 06:42:57', NULL),
(48, 12, 16, 'Wall marble skirting', 1, '2024-01-04 11:38:15', '2024-01-04 11:38:15', NULL),
(49, 12, 16, 'Kitchen platform', 1, '2024-01-04 11:38:34', '2024-01-04 11:38:34', NULL),
(50, 12, 16, 'Brickbat', 1, '2024-01-04 11:39:00', '2024-01-04 11:39:00', NULL),
(51, 12, 16, 'Waterproofing', 1, '2024-01-04 11:39:16', '2024-01-04 11:39:16', NULL),
(52, 12, 16, 'Floor Marble Polishing', 1, '2024-01-04 11:39:30', '2024-01-17 06:18:37', '2024-01-17 06:18:37'),
(53, 12, 16, 'Diamond Floor Marble Polishing', 1, '2024-01-04 11:39:54', '2024-01-17 06:19:10', '2024-01-17 06:19:10'),
(54, 12, 16, 'Wall Marble Polishing', 1, '2024-01-04 11:40:11', '2024-01-17 06:19:03', '2024-01-17 06:19:03'),
(55, 12, 16, 'Marble Polishing', 1, '2024-01-04 11:40:30', '2024-01-17 06:18:52', NULL),
(56, 12, 16, 'Cutting works', 1, '2024-01-04 11:40:44', '2024-01-17 06:15:59', NULL),
(57, 12, 16, 'Marble Chemical Coating', 1, '2024-01-04 11:40:59', '2024-01-04 11:40:59', NULL),
(58, 12, 16, 'White marble sealer coating (Inside)', 1, '2024-01-04 11:41:17', '2024-01-04 11:41:17', NULL),
(59, 12, 16, 'White marble sealer coating (outside)', 1, '2024-01-04 11:41:36', '2024-01-04 11:41:36', NULL),
(60, 12, 16, 'Floor tiles Joint', 1, '2024-01-05 09:17:29', '2024-01-05 09:17:29', NULL),
(61, 12, 16, 'Tiles top chemical coating', 1, '2024-01-05 09:17:58', '2024-01-05 09:17:58', NULL),
(62, 12, 16, 'Box making', 1, '2024-01-05 09:18:15', '2024-01-05 09:18:15', NULL),
(63, 12, 16, 'Marble fixing on Walls', 1, '2024-01-05 09:18:41', '2024-01-05 09:18:41', NULL),
(64, 6, 43, 'Laminate Finish', 1, '2024-01-05 09:20:00', '2024-01-05 09:20:11', NULL),
(65, 6, 43, 'Veneer Finish', 1, '2024-01-05 09:20:53', '2024-01-05 09:20:53', NULL),
(66, 6, 43, 'Mirror Finish', 1, '2024-01-05 09:56:23', '2024-01-05 09:56:23', NULL),
(67, 6, 43, 'Back painted glass', 1, '2024-01-05 09:56:50', '2024-01-05 09:56:50', NULL),
(68, 6, 43, 'Gypsum Board Finish', 1, '2024-01-05 09:57:10', '2024-01-05 09:57:10', NULL),
(69, 6, 43, 'MDF', 1, '2024-01-05 09:57:30', '2024-01-05 09:57:30', NULL),
(70, 6, 43, 'ACP', 1, '2024-01-05 09:58:13', '2024-01-05 09:58:13', NULL),
(71, 6, 44, 'Laminate Finish', 1, '2024-01-05 09:58:42', '2024-01-19 16:57:10', '2024-01-19 16:57:10'),
(72, 6, 44, 'Veneer Finish', 1, '2024-01-05 09:59:16', '2024-01-19 16:57:18', '2024-01-19 16:57:18'),
(73, 6, 44, 'Gypsum Board Finish', 1, '2024-01-05 09:59:35', '2024-01-19 16:57:29', '2024-01-19 16:57:29'),
(74, 6, 44, 'MDF', 1, '2024-01-05 09:59:54', '2024-01-19 16:57:01', '2024-01-19 16:57:01'),
(75, 6, 45, 'Laminate Finish', 1, '2024-01-05 10:00:11', '2024-01-05 10:00:11', NULL),
(76, 6, 45, 'Veneer Finish', 1, '2024-01-05 10:00:28', '2024-01-05 10:00:28', NULL),
(77, 6, 46, 'ACP', 1, '2024-01-05 10:01:03', '2024-01-05 10:01:03', NULL),
(78, 6, 47, 'Laminate Finish', 1, '2024-01-05 10:01:26', '2024-01-05 10:01:26', NULL),
(79, 6, 47, 'Veneer Finish', 1, '2024-01-05 10:01:44', '2024-01-05 10:01:44', NULL),
(80, 6, 48, 'Laminate Finish', 1, '2024-01-05 10:02:08', '2024-01-05 10:02:08', NULL),
(81, 6, 48, 'Veneer Finish', 1, '2024-01-05 10:02:26', '2024-01-05 10:02:26', NULL),
(82, 6, 48, 'MDF Finish', 1, '2024-01-05 10:02:45', '2024-01-05 10:02:45', NULL),
(83, 6, 48, 'Backpainted glass', 1, '2024-01-05 10:03:08', '2024-01-05 10:03:08', NULL),
(84, 6, 49, 'Laminate Finish', 1, '2024-01-05 10:03:37', '2024-01-05 10:03:37', NULL),
(85, 6, 49, 'Veneer Finish', 1, '2024-01-05 10:04:27', '2024-01-05 10:04:27', NULL),
(86, 6, 49, 'MDF Finish', 1, '2024-01-05 10:04:49', '2024-01-05 10:04:49', NULL),
(87, 6, 49, 'Fabric Finish', 1, '2024-01-05 10:05:06', '2024-01-05 10:05:06', NULL),
(88, 6, 50, 'Laminate Finish', 1, '2024-01-05 10:05:35', '2024-01-05 10:05:35', NULL),
(89, 6, 50, 'Prelam finish', 1, '2024-01-05 10:06:04', '2024-01-05 10:06:04', NULL),
(90, 6, 50, 'Veneer Finish', 1, '2024-01-05 10:06:20', '2024-01-05 10:06:20', NULL),
(91, 6, 50, 'MDF Finish', 1, '2024-01-05 10:26:39', '2024-01-05 10:26:39', NULL),
(92, 6, 50, 'Backpainted glass', 1, '2024-01-05 10:26:59', '2024-01-05 10:26:59', NULL),
(93, 6, 51, 'Laminate Finish', 1, '2024-01-05 10:27:16', '2024-01-05 10:27:16', NULL),
(94, 6, 51, 'Veneer Finish', 1, '2024-01-05 10:27:34', '2024-01-05 10:27:34', NULL),
(95, 6, 51, 'MDF Finish', 1, '2024-01-05 10:27:55', '2024-01-05 10:27:55', NULL),
(96, 6, 52, 'Laminate Finish', 1, '2024-01-05 10:37:53', '2024-01-05 10:37:53', NULL),
(97, 6, 52, 'Veneer Finish', 1, '2024-01-05 10:38:10', '2024-01-05 10:38:10', NULL),
(98, 6, 52, 'MDF Finish', 1, '2024-01-05 10:38:27', '2024-01-05 10:38:27', NULL),
(99, 6, 53, 'Laminate Finish', 1, '2024-01-05 10:38:43', '2024-01-05 10:38:43', NULL),
(100, 6, 53, 'Veneer Finish', 1, '2024-01-05 10:38:59', '2024-01-05 10:38:59', NULL),
(101, 6, 53, 'Melamine Polish', 1, '2024-01-05 10:39:15', '2024-01-05 10:39:15', NULL),
(102, 6, 54, 'Laminate Finish', 1, '2024-01-05 10:39:31', '2024-01-05 10:39:31', NULL),
(103, 6, 54, 'Veneer Finish', 1, '2024-01-05 10:39:48', '2024-01-05 10:39:48', NULL),
(104, 6, 54, 'MDF Finish', 1, '2024-01-05 10:40:11', '2024-01-05 10:40:11', NULL),
(105, 6, 55, 'Laminate Finish', 1, '2024-01-05 10:42:36', '2024-01-05 10:42:36', NULL),
(106, 6, 55, 'Veneer Finish', 1, '2024-01-05 11:00:16', '2024-01-05 11:00:16', NULL),
(107, 6, 55, 'MDF Finish', 1, '2024-01-05 11:00:38', '2024-01-05 11:00:38', NULL),
(108, 6, 56, 'Fabric Finish', 1, '2024-01-05 11:07:44', '2024-01-05 11:07:44', NULL),
(109, 6, 57, 'Laminate Finish', 1, '2024-01-05 11:08:02', '2024-01-05 11:08:02', NULL),
(110, 6, 57, 'Veneer Finish', 1, '2024-01-05 11:11:42', '2024-01-05 11:11:42', NULL),
(111, 6, 57, 'MDF Finish', 1, '2024-01-05 11:12:01', '2024-01-05 11:12:01', NULL),
(112, 6, 58, 'Laminate Finish', 1, '2024-01-05 11:12:33', '2024-01-05 11:12:33', NULL),
(113, 6, 58, 'Veneer Finish', 1, '2024-01-05 11:13:01', '2024-01-05 11:13:01', NULL),
(114, 6, 58, 'MDF Finish', 1, '2024-01-05 11:13:39', '2024-01-05 11:13:39', NULL),
(115, 6, 59, 'Laminate Finish', 1, '2024-01-05 11:13:59', '2024-01-05 11:13:59', NULL),
(116, 6, 59, 'Veneer Finish', 1, '2024-01-05 11:14:16', '2024-01-05 11:14:16', NULL),
(117, 6, 59, 'MDF Finish', 1, '2024-01-05 11:14:33', '2024-01-05 11:14:33', NULL),
(118, 6, 60, 'Laminate Finish', 1, '2024-01-05 11:16:40', '2024-01-05 11:16:40', NULL),
(119, 6, 60, 'Veneer Finish', 1, '2024-01-05 11:19:32', '2024-01-05 11:19:32', NULL),
(120, 6, 60, 'Back painted glass', 1, '2024-01-05 11:23:33', '2024-01-05 11:23:33', NULL),
(121, 6, 61, 'Inside laminate', 1, '2024-01-05 11:29:18', '2024-01-05 11:29:18', NULL),
(122, 6, 61, 'Veneer Finish', 1, '2024-01-05 11:39:28', '2024-01-05 11:39:28', NULL),
(123, 6, 62, 'SS Perforated', 1, '2024-01-05 11:39:50', '2024-01-05 11:39:50', NULL),
(124, 6, 62, 'SS Jali', 1, '2024-01-05 12:43:08', '2024-01-05 12:43:08', NULL),
(125, 6, 63, '8mm Toughened glass', 1, '2024-01-05 12:43:58', '2024-01-05 12:43:58', NULL),
(126, 6, 63, '10mm toughened glass', 1, '2024-01-05 12:44:23', '2024-01-05 12:44:23', NULL),
(127, 6, 63, '12mm toughened glass', 1, '2024-01-05 12:44:55', '2024-01-05 12:44:55', NULL),
(128, 6, 64, '8mm Toughened glass', 1, '2024-01-05 12:46:24', '2024-01-05 12:46:24', NULL),
(129, 6, 64, '10mm toughened glass', 1, '2024-01-05 12:47:09', '2024-01-05 12:47:09', NULL),
(130, 6, 64, '12mm toughened glass', 1, '2024-01-05 12:47:33', '2024-01-05 12:47:33', NULL),
(131, 3, 5, 'POP Partition', 1, '2024-01-06 07:04:11', '2024-01-06 07:04:11', NULL),
(132, 3, 5, 'POP Partition dhar', 1, '2024-01-06 07:04:30', '2024-01-06 07:04:30', NULL),
(133, 3, 5, 'Hilux Partition', 1, '2024-01-06 07:04:46', '2024-01-06 07:04:46', NULL),
(134, 3, 5, 'Hilux Partition dhar', 1, '2024-01-06 07:05:00', '2024-01-06 07:05:00', NULL),
(135, 3, 5, 'POP Punning', 1, '2024-01-06 07:05:16', '2024-01-06 07:05:16', NULL),
(136, 3, 5, 'POP Punning dhar', 1, '2024-01-06 07:05:35', '2024-01-06 07:05:35', NULL),
(137, 3, 5, 'Skirting groove', 1, '2024-01-06 07:06:10', '2024-01-06 07:06:10', NULL),
(138, 3, 5, 'Wall Groove', 1, '2024-01-06 07:06:28', '2024-01-06 07:06:28', NULL),
(139, 3, 17, 'False Ceiling', 1, '2024-01-06 07:06:56', '2024-01-06 07:06:56', NULL),
(140, 3, 4, 'Gypsum Board Ceiling', 1, '2024-01-06 07:29:40', '2024-01-06 07:31:14', '2024-01-06 07:31:14'),
(141, 3, 4, 'Gypsum Board Cove', 1, '2024-01-06 07:29:57', '2024-01-06 07:29:57', NULL),
(142, 3, 4, 'Hilux Board ceiling', 1, '2024-01-06 07:30:15', '2024-01-06 07:30:15', NULL),
(143, 3, 4, 'PVC ceiling', 1, '2024-01-06 07:30:30', '2024-01-06 07:30:30', NULL),
(144, 3, 4, 'Light Gala cutting', 1, '2024-01-06 07:30:47', '2024-01-06 07:30:47', NULL),
(145, 6, 65, '8mm Toughened glass', 1, '2024-01-06 09:29:24', '2024-01-06 09:29:24', NULL),
(146, 6, 65, '10mm toughened glass', 1, '2024-01-06 09:29:53', '2024-01-06 09:29:53', NULL),
(147, 6, 65, '12mm toughened glass', 1, '2024-01-06 09:30:17', '2024-01-06 09:30:17', NULL),
(148, 6, 66, 'Prelam Board', 1, '2024-01-06 09:30:39', '2024-01-06 09:30:39', NULL),
(149, 6, 66, 'Laminate Finish', 1, '2024-01-06 09:30:56', '2024-01-06 09:30:56', NULL),
(150, 6, 66, 'Veneer Finish', 1, '2024-01-06 09:31:27', '2024-01-06 09:31:27', NULL),
(151, 6, 66, 'MDF Finish', 1, '2024-01-06 09:31:45', '2024-01-06 09:31:45', NULL),
(152, 6, 66, 'Corian Finish', 1, '2024-01-06 09:32:17', '2024-01-06 09:32:17', NULL),
(153, 6, 67, 'Prelam Board', 1, '2024-01-06 09:32:36', '2024-01-06 09:32:36', NULL),
(154, 6, 67, 'Laminate Finish', 1, '2024-01-06 09:32:54', '2024-01-06 09:32:54', NULL),
(155, 6, 67, 'Veneer Finish', 1, '2024-01-06 09:33:07', '2024-01-06 09:33:07', NULL),
(156, 6, 67, 'MDF Finish', 1, '2024-01-06 09:33:19', '2024-01-06 09:33:19', NULL),
(157, 6, 67, 'Corian Finish', 1, '2024-01-06 09:33:37', '2024-01-06 09:33:37', NULL),
(158, 6, 67, 'Stone Finish', 1, '2024-01-06 09:34:00', '2024-01-06 09:34:00', NULL),
(159, 6, 68, 'Prelam Board', 1, '2024-01-06 09:34:19', '2024-01-06 09:34:19', NULL),
(160, 6, 68, 'Laminate Finish', 1, '2024-01-06 09:34:34', '2024-01-06 09:34:34', NULL),
(161, 6, 68, 'Veneer Finish', 1, '2024-01-06 09:34:55', '2024-01-06 09:34:55', NULL),
(162, 6, 68, 'Veneer Finish', 1, '2024-01-06 09:35:08', '2024-01-06 09:35:08', NULL),
(163, 6, 70, 'N/A', 1, '2024-01-06 09:35:28', '2024-01-06 09:35:28', NULL),
(164, 6, 69, 'CP Wood/MDF', 1, '2024-01-06 09:35:42', '2024-01-06 09:35:42', NULL),
(165, 2, 3, 'New 5A Switch & Socket from DB on wall (include the price for wire and conduits, chipping and replastering on wall)', 1, '2024-01-08 10:05:26', '2024-01-08 10:25:39', '2024-01-08 10:25:39'),
(166, 2, 23, 'New 5A Switch (Light)  points from DB on wall (include the price for wire and conduits, chipping and replastering on wall)', 1, '2024-01-08 10:06:33', '2024-01-08 10:25:42', '2024-01-08 10:25:42'),
(167, 2, 24, 'New 15A Switch & Socket from DB on wall (include the price for wire and conduits, chipping and replastering on wall)', 1, '2024-01-08 10:07:26', '2024-01-08 10:25:46', '2024-01-08 10:25:46'),
(168, 2, 25, 'New fan point (include the price for wire and conduits, chipping and replastering on wall)', 1, '2024-01-08 10:08:18', '2024-01-08 10:25:49', '2024-01-08 10:25:49'),
(169, 2, 26, 'New AC  point (include the price for wire and conduits, chipping and replastering on wall)', 1, '2024-01-08 10:10:27', '2024-01-08 10:25:03', '2024-01-08 10:25:03'),
(170, 2, 27, 'Secondary looping point', 1, '2024-01-08 10:10:48', '2024-01-08 10:25:27', '2024-01-08 10:25:27'),
(171, 2, 29, 'Circuit Wiring 1.5 mm', 1, '2024-01-08 10:11:16', '2024-01-08 10:25:30', '2024-01-08 10:25:30'),
(172, 2, 29, 'Circuit Wiring 2.5 mm', 1, '2024-01-08 10:11:37', '2024-01-08 10:25:24', '2024-01-08 10:25:24'),
(173, 2, 29, 'Circuit Wiring 4 mm', 1, '2024-01-08 10:11:55', '2024-01-08 10:25:34', '2024-01-08 10:25:34'),
(174, 2, 30, 'Telephone Wiring 4 pair (includes wiring and conduits)', 1, '2024-01-08 10:12:21', '2024-01-08 10:25:21', '2024-01-08 10:25:21'),
(175, 2, 31, 'Internet Wiring CAT-6 (includes wiring & conduits) LAN cable', 1, '2024-01-08 10:13:00', '2024-01-08 10:25:18', '2024-01-08 10:25:18'),
(176, 2, 32, 'TV Cable Wiring RJ-6 (includes wiring and conduits )', 1, '2024-01-08 10:13:29', '2024-01-08 10:25:13', '2024-01-08 10:25:13'),
(177, 2, 33, 'Speaker Cabling of Oxygen Make', 1, '2024-01-08 10:13:49', '2024-01-08 10:25:10', '2024-01-08 10:25:10'),
(178, 2, 34, 'Standard Light Fixing', 1, '2024-01-08 10:14:06', '2024-01-08 10:25:06', '2024-01-08 10:25:06'),
(179, 2, 34, 'Profile and strip lights fixing', 1, '2024-01-08 10:14:20', '2024-01-08 10:24:56', '2024-01-08 10:24:56'),
(180, 2, 34, 'Decorative lights fixing', 1, '2024-01-08 10:14:36', '2024-01-08 10:24:48', '2024-01-08 10:24:48'),
(181, 2, 35, 'DB Dressing', 1, '2024-01-08 10:15:10', '2024-01-08 10:24:52', '2024-01-08 10:24:52'),
(182, 4, 10, 'Clear Lamination', 1, '2024-01-08 10:28:10', '2024-01-08 10:28:10', NULL),
(183, 4, 10, 'Colour Lamintaion', 1, '2024-01-08 10:28:31', '2024-01-08 10:28:31', NULL),
(184, 4, 10, 'Marble finish lamination', 1, '2024-01-08 10:28:54', '2024-01-08 10:28:54', NULL),
(185, 4, 20, 'Melamine Polish', 1, '2024-01-08 10:29:20', '2024-01-08 10:29:20', NULL),
(186, 4, 20, 'French Polish', 1, '2024-01-08 10:29:44', '2024-01-08 10:29:44', NULL),
(187, 4, 22, 'Matt', 1, '2024-01-08 10:30:07', '2024-01-08 10:30:07', NULL),
(188, 4, 22, 'Metallic', 1, '2024-01-08 10:30:29', '2024-01-08 10:30:29', NULL),
(189, 4, 21, 'Clear', 1, '2024-01-08 10:31:02', '2024-01-08 10:31:02', NULL),
(190, 4, 21, 'Colour', 1, '2024-01-08 10:31:22', '2024-01-08 10:31:22', NULL),
(191, 4, 21, 'Metallic', 1, '2024-01-08 10:31:40', '2024-01-08 10:31:40', NULL),
(192, 4, 86, 'Interior Finish Lustre', 1, '2024-01-13 06:46:03', '2024-01-13 06:46:03', NULL),
(193, 5, 83, 'Bathroom Plumbing', 1, '2024-01-13 08:26:45', '2024-01-13 08:29:41', NULL),
(194, 5, 83, 'N/A', 1, '2024-01-13 08:29:24', '2024-01-13 08:29:24', NULL),
(195, 5, 84, 'Kitchen Plumbing', 1, '2024-01-13 08:32:00', '2024-01-13 08:32:00', NULL),
(196, 5, 85, 'Only Sanitary Fixture', 1, '2024-01-13 08:34:59', '2024-01-13 08:35:35', '2024-01-13 08:35:35'),
(197, 5, 12, 'Bathroom Demolition', 1, '2024-01-13 08:36:48', '2024-01-13 08:36:48', NULL),
(198, 5, 12, 'Kitchen Demolition', 1, '2024-01-13 08:37:07', '2024-01-13 08:37:43', NULL),
(199, 4, 86, 'Royal Matt', 1, '2024-01-13 08:44:47', '2024-01-13 08:44:47', NULL),
(200, 4, 86, 'Premium Emulsion (Plastic Paint)', 1, '2024-01-13 08:45:05', '2024-01-13 08:45:05', NULL),
(201, 4, 86, 'Royal Aspira', 1, '2024-01-13 08:45:25', '2024-01-13 08:45:25', NULL),
(202, 4, 86, 'Royal Shyne', 1, '2024-01-13 08:45:39', '2024-01-13 08:45:39', NULL),
(203, 9, 36, 'N/A', 1, '2024-01-17 07:23:11', '2024-01-17 07:23:11', NULL),
(204, 9, 37, 'N/A', 1, '2024-01-17 07:33:16', '2024-01-17 07:33:16', NULL),
(205, 9, 39, 'Straight', 1, '2024-01-17 07:34:13', '2024-01-17 07:34:13', NULL),
(206, 9, 39, 'Circular', 1, '2024-01-17 07:34:29', '2024-01-17 07:34:29', NULL),
(207, 9, 40, 'N/A', 1, '2024-01-17 07:37:31', '2024-01-17 07:37:31', NULL),
(208, 9, 41, 'N/A', 1, '2024-01-17 07:37:52', '2024-01-17 07:37:52', NULL),
(209, 9, 42, 'N/A', 1, '2024-01-17 07:38:09', '2024-01-17 07:38:09', NULL),
(210, 2, 87, '5A Switch & Socket - New', 1, '2024-01-17 07:48:59', '2024-01-17 07:48:59', NULL),
(211, 2, 87, 'Light Point', 1, '2024-01-17 07:49:17', '2024-01-17 07:49:17', NULL),
(212, 2, 87, '15 A Switch & Socket - New', 1, '2024-01-17 07:51:37', '2024-01-17 07:51:37', NULL),
(213, 2, 87, 'Fan Point', 1, '2024-01-17 07:51:52', '2024-01-17 07:51:52', NULL),
(214, 2, 87, 'AC Point', 1, '2024-01-17 07:52:08', '2024-01-17 07:52:08', NULL),
(215, 10, 77, 'N/A', 1, '2024-01-17 08:04:00', '2024-01-17 08:04:00', NULL),
(216, 10, 78, 'N/A', 1, '2024-01-17 08:04:17', '2024-01-19 15:34:01', '2024-01-19 15:34:01'),
(217, 10, 79, 'N/A', 1, '2024-01-17 08:04:28', '2024-01-17 08:04:28', NULL),
(218, 10, 80, 'N/A', 1, '2024-01-17 08:04:43', '2024-01-17 08:04:43', NULL),
(219, 10, 81, 'N/A', 1, '2024-01-17 08:04:57', '2024-01-17 08:04:57', NULL),
(220, 10, 82, 'N/A', 1, '2024-01-17 08:05:12', '2024-01-17 08:05:12', NULL),
(221, 12, 15, 'Other (Please mention in description)', 1, '2024-01-19 14:57:10', '2024-01-19 14:57:10', NULL),
(222, 12, 16, 'Other (Please mention in description)', 1, '2024-01-19 14:57:22', '2024-01-19 14:57:22', NULL),
(223, 10, 77, 'Other (Please mention in description)', 1, '2024-01-19 14:57:53', '2024-01-19 15:39:06', '2024-01-19 15:39:06'),
(224, 10, 78, 'Other (Please mention in description)', 1, '2024-01-19 14:58:05', '2024-01-19 15:33:31', '2024-01-19 15:33:31'),
(225, 10, 79, 'Other (Please mention in description)', 1, '2024-01-19 15:05:46', '2024-01-19 15:05:46', NULL),
(226, 10, 80, 'Other (Please mention in description)', 1, '2024-01-19 15:10:26', '2024-01-19 15:10:26', NULL),
(227, 10, 81, 'Other (Please mention in description)', 1, '2024-01-19 15:10:41', '2024-01-19 15:10:41', NULL),
(228, 10, 82, 'Other (Please mention in description)', 1, '2024-01-19 15:11:00', '2024-01-19 15:11:00', NULL),
(229, 9, 36, 'Other (Please mention in description)', 1, '2024-01-19 15:11:38', '2024-01-19 15:11:38', NULL),
(230, 9, 37, 'Other (Please mention in description)', 1, '2024-01-19 15:11:50', '2024-01-19 15:11:50', NULL),
(231, 9, 39, 'Other (Please mention in description)', 1, '2024-01-19 15:12:55', '2024-01-19 15:12:55', NULL),
(232, 9, 40, 'Other (Please mention in description)', 1, '2024-01-19 15:13:07', '2024-01-19 15:13:07', NULL),
(233, 9, 41, 'Other (Please mention in description)', 1, '2024-01-19 15:13:20', '2024-01-19 15:13:20', NULL),
(234, 9, 42, 'Other (Please mention in description)', 1, '2024-01-19 15:13:36', '2024-01-19 15:13:36', NULL),
(235, 9, 90, 'N/A', 1, '2024-01-19 15:13:57', '2024-01-19 15:13:57', NULL),
(236, 12, 88, 'N/A', 1, '2024-01-19 15:14:17', '2024-01-19 15:14:17', NULL),
(237, 6, 91, 'N/A', 1, '2024-01-19 15:20:04', '2024-01-19 15:20:04', NULL),
(238, 6, 43, 'Other (Please mention in description)', 1, '2024-01-19 15:20:30', '2024-01-19 15:20:30', NULL),
(239, 6, 44, 'Other (Please mention in description)', 1, '2024-01-19 15:20:42', '2024-01-19 15:20:42', NULL),
(240, 6, 45, 'Other (Please mention in description)', 1, '2024-01-19 15:21:00', '2024-01-19 15:21:00', NULL),
(241, 6, 46, 'Other (Please mention in description)', 1, '2024-01-19 15:21:18', '2024-01-19 15:21:18', NULL),
(242, 6, 46, 'Rafter Ceiling', 1, '2024-01-19 15:23:00', '2024-01-19 15:23:00', NULL),
(243, 6, 46, 'Ply Ceiling', 1, '2024-01-19 15:23:22', '2024-01-19 15:23:22', NULL),
(244, 6, 96, 'New Door', 1, '2024-01-19 15:26:03', '2024-01-19 15:26:03', NULL),
(245, 6, 96, 'Sliding Door', 1, '2024-01-19 15:26:31', '2024-01-19 15:26:31', NULL),
(246, 6, 96, 'Sliding Folding Door', 1, '2024-01-19 15:27:01', '2024-01-19 15:27:01', NULL),
(247, 6, 96, 'Glass Door', 1, '2024-01-19 15:27:49', '2024-01-19 15:27:49', NULL),
(248, 6, 96, 'Other (Please mention in description)', 1, '2024-01-19 15:28:19', '2024-01-19 15:28:19', NULL),
(249, 6, 97, 'Teakwood Door Frame', 1, '2024-01-19 15:28:52', '2024-01-19 15:28:52', NULL),
(250, 6, 97, 'Ply Door Frame', 1, '2024-01-19 15:29:23', '2024-01-19 15:29:23', NULL),
(251, 6, 97, 'Other (Please mention in description)', 1, '2024-01-19 15:30:00', '2024-01-19 15:30:00', NULL),
(252, 6, 91, 'N/A', 1, '2024-01-19 15:30:16', '2024-01-19 15:30:16', NULL),
(253, 6, 48, 'Other (Please mention in description)', 1, '2024-01-19 15:32:30', '2024-01-19 15:32:30', NULL),
(254, 6, 49, 'Other (Please mention in description)', 1, '2024-01-19 15:33:10', '2024-01-19 15:33:10', NULL),
(255, 6, 46, 'ACP sheet', 1, '2024-01-19 15:35:35', '2024-01-19 15:35:35', NULL),
(256, 6, 98, 'Study Table', 1, '2024-01-19 15:56:01', '2024-01-19 15:56:01', NULL),
(257, 6, 98, 'Bed Side Table', 1, '2024-01-19 15:56:54', '2024-01-19 15:56:54', NULL),
(258, 6, 98, 'Director Table', 1, '2024-01-19 15:57:30', '2024-01-19 15:57:30', NULL),
(259, 6, 98, 'Table Tops', 1, '2024-01-19 15:58:04', '2024-01-19 15:58:04', NULL),
(260, 6, 98, 'Free Standing Work Station', 1, '2024-01-19 15:58:56', '2024-01-19 15:58:56', NULL),
(261, 6, 44, 'Glass Partition', 1, '2024-01-19 16:03:01', '2024-01-19 16:03:01', NULL),
(262, 6, 44, 'Glass + Aluminum Partition', 1, '2024-01-19 16:03:54', '2024-01-19 16:03:54', NULL),
(263, 6, 44, 'Other (Please mention in description)', 1, '2024-01-19 16:04:09', '2024-01-19 16:56:39', '2024-01-19 16:56:39'),
(264, 6, 99, 'Wooden Flooring', 1, '2024-01-19 16:12:14', '2024-01-19 16:12:14', NULL),
(265, 6, 99, 'Other (Please mention in description)', 1, '2024-01-19 16:12:38', '2024-01-19 16:12:38', NULL),
(266, 6, 100, 'CP Wood Molding', 1, '2024-01-19 16:16:09', '2024-01-19 16:16:09', NULL),
(267, 6, 100, 'MDF Molding', 1, '2024-01-19 16:16:38', '2024-01-19 16:16:38', NULL),
(268, 6, 56, 'Other (Please mention in description)', 1, '2024-01-19 16:19:44', '2024-01-19 16:19:44', NULL),
(269, 6, 98, 'Other (Please mention in description)', 1, '2024-01-19 16:20:06', '2024-01-19 16:20:06', NULL),
(270, 6, 60, 'Other (Please mention in description)', 1, '2024-01-19 16:24:20', '2024-01-19 16:24:20', NULL),
(271, 6, 60, 'MDF Finish', 1, '2024-01-19 16:25:13', '2024-01-19 16:25:13', NULL),
(272, 6, 62, 'Other (Please mention in description)', 1, '2024-01-19 16:25:53', '2024-01-19 16:25:53', NULL),
(273, 6, 101, 'Change shutters only', 1, '2024-01-19 16:28:09', '2024-01-19 16:28:09', NULL),
(274, 6, 101, 'Bed laminate change', 1, '2024-01-19 16:28:29', '2024-01-19 16:28:29', NULL),
(275, 6, 101, 'Change finish only', 1, '2024-01-19 16:28:56', '2024-01-19 16:28:56', NULL),
(276, 6, 101, 'Bed add fabric only', 1, '2024-01-19 16:29:39', '2024-01-19 16:29:39', NULL),
(277, 6, 101, 'Metal skirting profile', 1, '2024-01-19 16:30:02', '2024-01-19 16:30:02', NULL),
(278, 6, 59, 'Other (Please mention in description)', 1, '2024-01-19 16:31:57', '2024-01-19 16:31:57', NULL),
(279, 6, 101, 'Other (Please mention in description)', 1, '2024-01-19 16:32:17', '2024-01-19 16:32:17', NULL),
(280, 2, 87, 'Secondary point', 1, '2024-01-20 11:53:04', '2024-01-20 11:53:04', NULL),
(281, 2, 87, 'Circuit Wiring', 1, '2024-01-20 11:53:34', '2024-01-20 11:53:34', NULL),
(282, 2, 87, 'Telephone', 1, '2024-01-20 11:53:55', '2024-01-20 11:53:55', NULL),
(283, 2, 87, 'Internet wiring', 1, '2024-01-20 11:54:13', '2024-01-20 11:54:13', NULL),
(284, 2, 87, 'Cable wiring', 1, '2024-01-20 11:54:43', '2024-01-20 11:54:43', NULL),
(285, 2, 87, 'Speaker wiring', 1, '2024-01-20 11:54:57', '2024-01-20 11:54:57', NULL),
(286, 2, 87, 'Light fixing', 1, '2024-01-20 11:55:20', '2024-01-20 11:55:20', NULL),
(287, 2, 87, 'DB Dressing', 1, '2024-01-20 11:55:36', '2024-01-20 11:55:36', NULL),
(288, 2, 87, 'Other (Please mention in description)', 1, '2024-01-20 12:05:31', '2024-01-20 12:05:31', NULL),
(289, 4, 93, 'Other (Please mention in description)', 1, '2024-01-21 17:17:17', '2024-01-21 17:17:17', NULL),
(290, 5, 92, 'Other (Please mention in description)', 1, '2024-01-21 17:49:42', '2024-01-21 17:49:42', NULL),
(291, 3, 5, 'Other (Please mention in description)', 1, '2024-01-23 13:42:01', '2024-01-23 13:42:01', NULL),
(292, 3, 17, 'Other (Please mention in description)', 1, '2024-01-23 13:42:18', '2024-01-23 13:42:18', NULL),
(293, 3, 4, 'Other (Please mention in description)', 1, '2024-01-23 13:42:34', '2024-01-23 13:42:34', NULL),
(294, 3, 94, 'N/A', 1, '2024-01-23 13:42:59', '2024-01-24 16:46:10', '2024-01-24 16:46:10'),
(295, 10, 89, 'N/A', 1, '2024-01-23 13:53:19', '2024-01-23 13:53:19', NULL),
(296, 3, 94, 'N/A', 1, '2024-01-24 16:46:51', '2024-01-24 16:46:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_details`
--

CREATE TABLE `item_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_details`
--

INSERT INTO `item_details` (`id`, `work_type_id`, `item_id`, `item_category_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'PCC thickness of 12mm to  100mm', 1, '2023-11-21 12:34:36', '2023-11-21 12:34:36', NULL),
(2, 1, 2, 2, '9\" inch siporex with 4\" lintel  band wherever necessary', 1, '2023-11-21 12:34:56', '2023-11-21 12:34:56', NULL),
(3, 2, 3, 3, 'new 5A Switch & Socket from DB on wall include the price for wire and  conduits, chipping and replastering on wall is included', 1, '2023-11-21 12:35:22', '2024-01-04 07:02:19', '2024-01-04 07:02:19'),
(4, 2, 13, 4, 'Removal of Existing Light and fan  fittings', 1, '2023-11-21 12:35:48', '2023-11-21 12:35:48', NULL),
(5, 3, 4, 5, 'IGL -Saint Gobain  Board/Gyproc+ India Gypsum  GI Frame', 1, '2023-11-21 12:36:52', '2024-01-04 07:02:38', '2024-01-04 07:02:38'),
(6, 3, 5, 6, 'Gypsum Board + local A  Grade channel', 1, '2023-11-21 12:37:09', '2024-01-04 07:02:35', '2024-01-04 07:02:35'),
(7, 6, 6, 7, 'Mirror Finish', 1, '2023-11-21 12:37:32', '2024-01-04 07:02:32', '2024-01-04 07:02:32'),
(8, 6, 6, 8, 'Gypsum Board Finish', 1, '2023-11-21 12:38:04', '2024-01-04 07:02:29', '2024-01-04 07:02:29'),
(9, 4, 7, 9, '2 Primer + 1  Putty + 2 PE', 1, '2023-11-21 12:38:34', '2023-11-21 12:38:34', NULL),
(10, 4, 8, 10, 'NA', 1, '2023-11-21 12:38:56', '2024-01-04 07:02:25', '2024-01-04 07:02:25'),
(11, 4, 9, 11, 'NA', 1, '2023-11-21 12:39:57', '2023-11-21 12:39:57', NULL),
(12, 4, 10, 12, 'NA', 1, '2023-11-21 12:40:14', '2023-12-27 05:21:24', '2023-12-27 05:21:24'),
(13, 5, 11, 13, 'Internal Concealed work (1 WC+  1Shower and divertor + 1 Basin + 1  Geyser)', 1, '2023-11-21 12:40:35', '2023-12-27 05:21:19', '2023-12-27 05:21:19'),
(14, 5, 12, 14, 'CP fitting work (1 WC+ 1Shower  and divertor + 1 Basin + 1 Geyser) df', 1, '2023-11-21 12:40:53', '2024-01-04 07:02:22', '2024-01-04 07:02:22'),
(15, 9, 14, 17, 'Testing', 1, '2023-12-28 12:57:04', '2023-12-28 12:57:43', '2023-12-28 12:57:43'),
(16, 6, 43, 65, 'asdajdh', 1, '2024-01-05 11:45:04', '2024-01-05 12:42:35', '2024-01-05 12:42:35'),
(17, 12, 15, 18, '4\"', 1, '2024-01-06 06:50:28', '2024-01-06 06:50:28', NULL),
(18, 12, 15, 18, '6\"', 1, '2024-01-06 06:50:46', '2024-01-06 06:50:46', NULL),
(19, 12, 15, 18, '9\"', 1, '2024-01-06 06:51:07', '2024-01-06 06:51:07', NULL),
(20, 12, 15, 19, 'N/A', 1, '2024-01-06 06:51:37', '2024-01-06 06:51:37', NULL),
(21, 12, 15, 20, 'N/A', 1, '2024-01-06 06:52:09', '2024-01-06 06:52:09', NULL),
(22, 12, 15, 21, 'N/A', 1, '2024-01-06 06:52:25', '2024-01-06 06:52:25', NULL),
(23, 12, 15, 22, 'N/A', 1, '2024-01-06 06:52:54', '2024-01-06 06:52:54', NULL),
(24, 12, 15, 23, 'N/A', 1, '2024-01-06 06:53:15', '2024-01-06 06:53:26', NULL),
(25, 12, 15, 24, 'N/A', 1, '2024-01-06 06:53:45', '2024-01-06 06:53:45', NULL),
(26, 12, 15, 25, 'N/A', 1, '2024-01-06 06:54:00', '2024-01-06 06:54:00', NULL),
(27, 12, 15, 26, 'N/A', 1, '2024-01-06 06:54:17', '2024-01-06 06:54:17', NULL),
(28, 12, 15, 27, 'N/A', 1, '2024-01-06 06:54:32', '2024-01-06 06:54:32', NULL),
(29, 12, 15, 28, 'N/A', 1, '2024-01-06 06:54:49', '2024-01-06 06:54:49', NULL),
(30, 12, 15, 29, 'N/A', 1, '2024-01-06 06:55:11', '2024-01-06 06:55:11', NULL),
(31, 12, 15, 30, 'N/A', 1, '2024-01-06 06:55:29', '2024-01-06 06:55:29', NULL),
(32, 12, 15, 31, 'N/A', 1, '2024-01-06 06:55:45', '2024-01-06 06:55:45', NULL),
(33, 12, 16, 49, 'Fully Modular Kitchen - Granite/Marble', 1, '2024-01-06 07:00:23', '2024-01-06 07:00:23', NULL),
(34, 3, 17, 139, 'Removal of Existing false ceiling', 1, '2024-01-06 07:07:22', '2024-01-06 07:07:22', NULL),
(35, 3, 5, 131, 'Gypsum Board + local A Grade channel', 1, '2024-01-06 07:10:07', '2024-01-06 07:10:07', NULL),
(36, 3, 5, 132, 'Gypsum Board + local A Grade channel', 1, '2024-01-06 07:17:26', '2024-01-06 07:17:26', NULL),
(37, 3, 5, 133, 'Hilux Board + local A Grade  channel', 1, '2024-01-06 07:17:46', '2024-01-06 07:17:46', NULL),
(38, 3, 5, 134, 'Hilux Board + local A Grade  channel', 1, '2024-01-06 07:18:04', '2024-01-06 07:18:04', NULL),
(39, 3, 5, 135, 'POP Punning (Plum) 12-25mm thick', 1, '2024-01-06 07:18:28', '2024-01-06 07:18:28', NULL),
(40, 3, 5, 136, 'POP Punning (Plum) 12-25mm thick', 1, '2024-01-06 07:19:24', '2024-01-06 07:19:24', NULL),
(41, 3, 5, 137, 'N/A', 1, '2024-01-06 07:19:48', '2024-01-06 07:19:48', NULL),
(42, 3, 5, 138, 'N/A', 1, '2024-01-06 07:20:06', '2024-01-06 07:20:06', NULL),
(43, 3, 4, 5, 'IGL -Saint Gobain Board/Gyproc+ India Gypsum GI Frame', 1, '2024-01-06 07:31:41', '2024-01-06 07:31:41', NULL),
(44, 3, 4, 5, 'Saint Gobain/Gyproc Board + local A Grade  channel', 1, '2024-01-06 07:32:05', '2024-01-06 07:32:05', NULL),
(45, 3, 4, 141, 'Gypsum cove', 1, '2024-01-06 07:32:26', '2024-01-06 07:32:26', NULL),
(46, 3, 4, 142, 'Hilux Board + local A Grade  channel', 1, '2024-01-06 07:32:43', '2024-01-06 07:32:43', NULL),
(47, 3, 4, 143, 'PVC ceiling + local A grade channel', 1, '2024-01-06 07:33:01', '2024-01-06 07:33:01', NULL),
(48, 3, 4, 144, 'N/A', 1, '2024-01-06 07:33:18', '2024-01-06 07:33:18', NULL),
(49, 2, 3, 165, 'Wire - Havells, Finolex, Ploycab | Conduit - Precision, Presto', 1, '2024-01-08 10:15:56', '2024-01-08 10:15:56', NULL),
(50, 6, 48, 81, '-', 1, '2024-01-13 06:42:17', '2024-01-13 06:42:17', NULL),
(51, 4, 86, 192, '2 Primer + 2 Putty + 2 PE', 1, '2024-01-13 06:46:30', '2024-01-13 06:46:30', NULL),
(52, 6, 55, 105, '-', 1, '2024-01-13 06:54:17', '2024-01-13 06:54:17', NULL),
(53, 5, 83, 193, 'Internal Concealed work (1 WC+ 1Shower and divertor + 1 Basin + 1 Geyser)', 1, '2024-01-13 08:27:10', '2024-01-13 08:30:25', NULL),
(54, 5, 83, 193, 'CP fitting work (1 WC+ 1Shower and divertor + 1 Basin + 1 Geyser)', 1, '2024-01-13 08:30:03', '2024-01-13 08:30:40', NULL),
(55, 5, 84, 195, 'Internal Concealed work (1 Basin + 1 Geyser)', 1, '2024-01-13 08:32:23', '2024-01-13 08:32:23', NULL),
(56, 5, 84, 195, 'CP fitting work (1 Basin + 1 Geyser)', 1, '2024-01-13 08:32:43', '2024-01-13 08:32:43', NULL),
(57, 5, 12, 197, 'N/A', 1, '2024-01-13 08:37:29', '2024-01-13 08:37:29', NULL),
(58, 5, 12, 198, 'N/A', 1, '2024-01-13 08:38:05', '2024-01-13 08:38:05', NULL),
(59, 4, 10, 182, 'N/A', 1, '2024-01-13 08:41:21', '2024-01-13 08:41:21', NULL),
(60, 4, 10, 183, 'N/A', 1, '2024-01-13 08:41:45', '2024-01-13 08:41:45', NULL),
(61, 4, 10, 184, 'N/A', 1, '2024-01-13 08:41:59', '2024-01-13 08:41:59', NULL),
(62, 4, 20, 185, 'N/A', 1, '2024-01-13 08:42:21', '2024-01-13 08:42:21', NULL),
(63, 4, 20, 186, 'N/A', 1, '2024-01-13 08:42:34', '2024-01-13 08:42:34', NULL),
(64, 4, 21, 189, 'N/A', 1, '2024-01-13 08:43:32', '2024-01-13 08:43:32', NULL),
(65, 4, 21, 190, 'N/A', 1, '2024-01-13 08:43:50', '2024-01-13 08:43:50', NULL),
(66, 4, 21, 191, 'N/A', 1, '2024-01-13 08:44:06', '2024-01-13 08:44:06', NULL),
(67, 4, 86, 200, '2 Primer + 1 Putty + 2 PE', 1, '2024-01-13 08:46:10', '2024-01-13 08:46:10', NULL),
(68, 4, 86, 199, '2 Primer + 1 Putty + 2 RLE', 1, '2024-01-13 08:46:32', '2024-01-13 08:46:32', NULL),
(69, 4, 86, 201, '2 Primer + 3 Putty + 3 RA', 1, '2024-01-13 08:46:54', '2024-01-13 08:46:54', NULL),
(70, 4, 86, 202, '2 Primer + 1 Putty + 2 RLE', 1, '2024-01-13 08:47:12', '2024-01-13 08:47:12', NULL),
(71, 12, 16, 63, 'Marble', 1, '2024-01-17 06:12:13', '2024-01-17 06:12:13', NULL),
(72, 12, 16, 62, 'Marble', 1, '2024-01-17 06:12:36', '2024-01-17 06:12:36', NULL),
(73, 12, 16, 61, 'N/A', 1, '2024-01-17 06:13:32', '2024-01-17 06:13:32', NULL),
(74, 12, 16, 60, 'N/A', 1, '2024-01-17 06:14:00', '2024-01-17 06:14:00', NULL),
(75, 12, 16, 59, 'N/A', 1, '2024-01-17 06:14:26', '2024-01-17 06:14:26', NULL),
(76, 12, 16, 58, 'N/A', 1, '2024-01-17 06:14:48', '2024-01-17 06:14:48', NULL),
(77, 12, 16, 57, 'N/A', 1, '2024-01-17 06:15:17', '2024-01-17 06:15:17', NULL),
(78, 12, 16, 56, 'Marble', 1, '2024-01-17 06:15:42', '2024-01-17 06:15:42', NULL),
(79, 12, 16, 56, 'Granite', 1, '2024-01-17 06:16:20', '2024-01-17 06:16:20', NULL),
(80, 12, 16, 55, 'Floor Marble Polishing', 1, '2024-01-17 06:16:43', '2024-01-17 06:19:39', NULL),
(81, 12, 16, 54, 'N/A', 1, '2024-01-17 06:17:31', '2024-01-17 06:17:31', NULL),
(82, 12, 16, 53, 'N/A', 1, '2024-01-17 06:17:53', '2024-01-17 06:17:53', NULL),
(83, 12, 16, 55, 'Diamond Floor Marble Polishing', 1, '2024-01-17 06:20:07', '2024-01-17 06:20:07', NULL),
(84, 12, 16, 55, 'Wall Marble Polishing', 1, '2024-01-17 06:20:45', '2024-01-17 06:20:45', NULL),
(85, 12, 16, 55, 'Skirting Marble Polishing', 1, '2024-01-17 06:21:08', '2024-01-17 06:21:08', NULL),
(86, 12, 16, 51, 'N/A', 1, '2024-01-17 06:21:48', '2024-01-17 06:21:48', NULL),
(87, 12, 16, 50, 'brick bat coba (4\")', 1, '2024-01-17 06:23:42', '2024-01-17 06:23:42', NULL),
(88, 12, 16, 50, 'brick bat coba (6\")', 1, '2024-01-17 06:24:10', '2024-01-17 06:24:10', NULL),
(89, 12, 16, 50, 'brick bat coba (9\")', 1, '2024-01-17 06:24:30', '2024-01-17 06:24:30', NULL),
(90, 12, 16, 50, 'brick bat coba (12\")', 1, '2024-01-17 06:24:54', '2024-01-17 06:24:54', NULL),
(91, 12, 16, 49, 'Semi - Modular', 1, '2024-01-17 06:26:20', '2024-01-17 06:26:20', NULL),
(92, 12, 16, 49, 'Fully Modular Kitchen', 1, '2024-01-17 06:26:42', '2024-01-17 06:26:42', NULL),
(93, 12, 16, 34, '4\"', 1, '2024-01-17 06:30:04', '2024-01-17 06:30:04', NULL),
(94, 12, 16, 34, '6\"', 1, '2024-01-17 06:30:35', '2024-01-17 06:30:35', NULL),
(95, 12, 16, 34, '9\"', 1, '2024-01-17 06:31:15', '2024-01-17 06:31:15', NULL),
(96, 12, 16, 37, '4\"', 1, '2024-01-17 06:32:47', '2024-01-17 06:32:47', NULL),
(97, 12, 16, 37, '6\"', 1, '2024-01-17 06:33:12', '2024-01-17 06:33:12', NULL),
(98, 12, 16, 37, '9\"', 1, '2024-01-17 06:33:33', '2024-01-17 06:33:33', NULL),
(99, 12, 16, 38, '12-25 mm thickness', 1, '2024-01-17 06:34:48', '2024-01-17 06:34:48', NULL),
(100, 12, 16, 39, 'Upto ( 4\' x 2\' ) tiles laying', 1, '2024-01-17 06:35:23', '2024-01-17 06:35:23', NULL),
(101, 12, 16, 39, 'Above ( 4\' x 2\' ) tiles laying', 1, '2024-01-17 06:36:06', '2024-01-17 06:36:06', NULL),
(102, 12, 16, 39, 'As per design', 1, '2024-01-17 06:36:26', '2024-01-17 06:36:26', NULL),
(103, 12, 16, 40, 'Upto( 4\' x 2\' ) tiles laying', 1, '2024-01-17 06:36:49', '2024-01-17 06:36:49', NULL),
(104, 12, 16, 40, 'Above ( 4\' x 2\' ) tiles laying', 1, '2024-01-17 06:37:08', '2024-01-17 06:37:08', NULL),
(105, 12, 16, 41, 'As per design', 1, '2024-01-17 06:37:42', '2024-01-17 06:37:42', NULL),
(106, 12, 16, 42, '50-75mm average thickness', 1, '2024-01-17 06:38:13', '2024-01-17 06:38:13', NULL),
(107, 12, 16, 43, 'Single patti', 1, '2024-01-17 06:38:43', '2024-01-17 06:38:43', NULL),
(108, 12, 16, 43, 'Double Patti', 1, '2024-01-17 06:39:02', '2024-01-17 06:39:02', NULL),
(109, 12, 16, 44, 'Single patti', 1, '2024-01-17 06:39:20', '2024-01-17 06:39:20', NULL),
(110, 12, 16, 44, 'Double Patti', 1, '2024-01-17 06:39:38', '2024-01-17 06:39:38', NULL),
(111, 12, 16, 45, 'Marble', 1, '2024-01-17 06:41:07', '2024-01-17 06:41:07', NULL),
(112, 12, 16, 45, 'Granite', 1, '2024-01-17 06:41:24', '2024-01-17 06:41:24', NULL),
(113, 12, 16, 47, 'Tiles', 1, '2024-01-17 06:43:18', '2024-01-17 06:43:18', NULL),
(114, 12, 16, 47, 'Marble', 1, '2024-01-17 06:43:40', '2024-01-17 06:43:40', NULL),
(115, 12, 16, 47, 'Granite', 1, '2024-01-17 06:43:57', '2024-01-17 06:43:57', NULL),
(116, 2, 87, 210, 'new 5A Switch & Socket from DB on wall (include the price for wire and conduits, chipping and replastering on wall )', 1, '2024-01-17 07:52:43', '2024-01-20 12:19:07', '2024-01-20 12:19:07'),
(117, 2, 87, 211, 'new 5A Switch (Light)  points from DB on wall (include the price for wire and conduits, chipping and replastering on wall)', 1, '2024-01-17 07:53:12', '2024-01-20 12:18:56', '2024-01-20 12:18:56'),
(118, 2, 87, 212, 'new 15A Switch & Socket from DB on wall (include the price for wire and conduits, chipping and replastering on wall)', 1, '2024-01-17 07:53:56', '2024-01-20 12:18:43', '2024-01-20 12:18:43'),
(119, 10, 77, 215, 'Laminate Finish', 1, '2024-01-17 08:05:34', '2024-01-17 08:05:34', NULL),
(120, 10, 77, 215, 'Veneer Finish', 1, '2024-01-17 08:05:53', '2024-01-17 08:05:53', NULL),
(121, 10, 77, 215, 'HDHMR+ PU finish', 1, '2024-01-17 08:06:11', '2024-01-17 08:06:11', NULL),
(122, 10, 77, 215, 'Backpainted glass', 1, '2024-01-17 08:06:34', '2024-01-17 08:06:34', NULL),
(123, 9, 36, 203, 'MS finish', 1, '2024-01-17 08:06:58', '2024-01-17 08:06:58', NULL),
(124, 9, 37, 204, 'MS finish', 1, '2024-01-17 08:07:17', '2024-01-17 08:07:17', NULL),
(125, 9, 39, 205, 'MS finish', 1, '2024-01-17 08:07:33', '2024-01-17 08:07:33', NULL),
(126, 9, 39, 206, 'MS finish', 1, '2024-01-17 08:07:46', '2024-01-17 08:07:46', NULL),
(127, 9, 40, 207, 'MS finish', 1, '2024-01-17 08:08:05', '2024-01-17 08:08:05', NULL),
(128, 9, 41, 208, 'MS finish', 1, '2024-01-17 08:08:30', '2024-01-17 08:08:30', NULL),
(129, 9, 42, 209, 'Black powder coating', 1, '2024-01-17 08:08:55', '2024-01-17 08:08:55', NULL),
(130, 6, 43, 64, 'N/A', 1, '2024-01-17 08:13:41', '2024-01-17 08:13:41', NULL),
(131, 6, 43, 66, 'Mirror - Saint gobain/Modiguard', 1, '2024-01-17 08:14:09', '2024-01-17 08:14:24', '2024-01-17 08:14:24'),
(132, 6, 44, 71, 'N/A', 1, '2024-01-17 08:14:55', '2024-01-17 08:14:55', NULL),
(133, 6, 45, 75, 'N/A', 1, '2024-01-17 08:15:16', '2024-01-17 08:15:16', NULL),
(134, 6, 43, 65, 'N/A', 1, '2024-01-17 08:16:37', '2024-01-17 08:16:37', NULL),
(135, 6, 43, 66, 'N/A', 1, '2024-01-17 08:17:02', '2024-01-17 08:17:02', NULL),
(136, 6, 43, 67, 'N/A', 1, '2024-01-17 08:17:23', '2024-01-17 08:17:23', NULL),
(137, 6, 46, 243, 'Laminate Finish', 1, '2024-01-19 16:37:57', '2024-01-19 16:37:57', NULL),
(138, 6, 46, 243, 'Veneer Finish', 1, '2024-01-19 16:38:28', '2024-01-19 16:38:28', NULL),
(139, 6, 46, 242, 'Veneer Finish', 1, '2024-01-19 16:39:00', '2024-01-19 16:39:00', NULL),
(140, 6, 46, 242, 'Laminate Finish', 1, '2024-01-19 16:39:19', '2024-01-19 16:39:19', NULL),
(141, 6, 96, 244, 'Laminate Finish', 1, '2024-01-19 16:40:04', '2024-01-19 16:40:04', NULL),
(142, 6, 96, 244, 'Veneer Finish', 1, '2024-01-19 16:40:29', '2024-01-19 16:40:29', NULL),
(143, 6, 96, 244, 'MDF Finish', 1, '2024-01-19 16:42:59', '2024-01-19 16:42:59', NULL),
(144, 6, 96, 245, 'Laminate Finish', 1, '2024-01-19 16:43:29', '2024-01-19 16:43:29', NULL),
(145, 6, 96, 245, 'Veneer Finish', 1, '2024-01-19 16:43:48', '2024-01-19 16:43:48', NULL),
(146, 6, 96, 245, 'MDF Finish', 1, '2024-01-19 16:44:15', '2024-01-19 16:44:15', NULL),
(147, 6, 96, 246, 'Laminate Finish', 1, '2024-01-19 16:44:48', '2024-01-19 16:44:48', NULL),
(148, 6, 96, 246, 'Veneer Finish', 1, '2024-01-19 16:52:11', '2024-01-19 16:52:11', NULL),
(149, 6, 96, 246, 'MDF Finish', 1, '2024-01-19 16:52:40', '2024-01-19 16:52:40', NULL),
(150, 6, 96, 247, '8mm Toughened glass', 1, '2024-01-19 16:53:47', '2024-01-19 16:53:47', NULL),
(151, 6, 96, 247, '10mm Toughened glass', 1, '2024-01-19 16:54:14', '2024-01-19 16:54:14', NULL),
(152, 6, 96, 247, '12mm Toughened glass', 1, '2024-01-19 16:54:39', '2024-01-19 16:54:39', NULL),
(153, 6, 44, 261, '8mm Toughened glass', 1, '2024-01-19 16:55:42', '2024-01-19 16:55:42', NULL),
(154, 6, 44, 261, '10mm Toughened glass', 1, '2024-01-19 16:56:03', '2024-01-19 16:56:03', NULL),
(155, 6, 44, 261, '12mm Toughened glass', 1, '2024-01-19 16:56:27', '2024-01-19 16:56:27', NULL),
(156, 6, 44, 239, 'Other (Please mention in description)', 1, '2024-01-19 16:57:52', '2024-01-19 16:57:52', NULL),
(157, 6, 44, 262, '8mm Toughened glass', 1, '2024-01-19 16:58:32', '2024-01-19 16:58:32', NULL),
(158, 6, 44, 262, '10mm Toughened glass', 1, '2024-01-19 16:58:48', '2024-01-19 16:58:48', NULL),
(159, 6, 44, 262, '12mm Toughened glass', 1, '2024-01-19 16:59:07', '2024-01-19 16:59:07', NULL),
(160, 6, 97, 249, 'Melamine Polish', 1, '2024-01-19 16:59:54', '2024-01-19 16:59:54', NULL),
(161, 6, 97, 249, 'Veneer Finish', 1, '2024-01-19 17:00:13', '2024-01-19 17:00:13', NULL),
(162, 6, 97, 249, 'Laminate Finish', 1, '2024-01-19 17:00:29', '2024-01-19 17:00:29', NULL),
(163, 6, 97, 250, 'Veneer Finish', 1, '2024-01-19 17:00:55', '2024-01-19 17:00:55', NULL),
(164, 6, 97, 250, 'Laminate Finish', 1, '2024-01-19 17:01:21', '2024-01-19 17:01:21', NULL),
(165, 6, 97, 250, 'MDF Finish', 1, '2024-01-19 17:01:42', '2024-01-19 17:01:42', NULL),
(166, 6, 97, 251, 'Other (Please mention in description)', 1, '2024-01-19 17:02:01', '2024-01-19 17:02:01', NULL),
(167, 6, 98, 256, 'Veneer Finish', 1, '2024-01-19 17:02:45', '2024-01-19 17:02:45', NULL),
(168, 6, 98, 256, 'Laminate Finish', 1, '2024-01-19 17:04:38', '2024-01-19 17:04:38', NULL),
(169, 6, 98, 256, 'MDF Finish', 1, '2024-01-19 17:04:54', '2024-01-19 17:04:54', NULL),
(170, 6, 98, 257, 'Veneer Finish', 1, '2024-01-19 17:05:08', '2024-01-19 17:05:08', NULL),
(171, 6, 98, 257, 'MDF Finish', 1, '2024-01-19 17:05:26', '2024-01-19 17:05:26', NULL),
(172, 6, 98, 257, 'Laminate Finish', 1, '2024-01-19 17:05:44', '2024-01-19 17:05:44', NULL),
(173, 6, 98, 258, 'Veneer Finish', 1, '2024-01-19 17:06:03', '2024-01-19 17:06:03', NULL),
(174, 6, 98, 258, 'Laminate Finish', 1, '2024-01-19 17:06:22', '2024-01-19 17:06:22', NULL),
(175, 6, 98, 258, 'MDF Finish', 1, '2024-01-19 17:06:45', '2024-01-19 17:06:45', NULL),
(176, 6, 98, 258, 'Prelam board', 1, '2024-01-19 17:07:27', '2024-01-19 17:11:40', NULL),
(177, 6, 98, 258, 'Corian Finish', 1, '2024-01-19 17:07:52', '2024-01-19 17:07:52', NULL),
(178, 6, 98, 259, 'Veneer Finish', 1, '2024-01-19 17:08:28', '2024-01-19 17:08:28', NULL),
(179, 6, 98, 259, 'Laminate Finish', 1, '2024-01-19 17:08:44', '2024-01-19 17:08:44', NULL),
(180, 6, 98, 259, 'MDF Finish', 1, '2024-01-19 17:09:03', '2024-01-19 17:09:03', NULL),
(181, 6, 98, 259, 'Corian Finish', 1, '2024-01-19 17:09:20', '2024-01-19 17:09:20', NULL),
(182, 6, 98, 259, 'Stone Finish', 1, '2024-01-19 17:09:43', '2024-01-19 17:09:43', NULL),
(183, 6, 98, 259, 'Prelam board', 1, '2024-01-19 17:10:05', '2024-01-19 17:11:18', NULL),
(184, 6, 98, 260, 'Prelam Board', 1, '2024-01-19 17:10:48', '2024-01-19 17:11:01', NULL),
(185, 6, 98, 260, 'Veneer Finish', 1, '2024-01-19 17:11:56', '2024-01-19 17:11:56', NULL),
(186, 6, 98, 260, 'Laminate Finish', 1, '2024-01-19 17:12:18', '2024-01-19 17:12:18', NULL),
(187, 6, 98, 260, 'MDF Finish', 1, '2024-01-19 17:12:35', '2024-01-19 17:12:35', NULL),
(188, 6, 98, 269, 'Other (Please mention in description)', 1, '2024-01-19 17:13:43', '2024-01-19 17:13:43', NULL),
(189, 6, 101, 273, 'Laminate Finish', 1, '2024-01-19 17:14:15', '2024-01-19 17:14:15', NULL),
(190, 6, 101, 273, 'Veneer Finish', 1, '2024-01-19 17:14:35', '2024-01-19 17:14:35', NULL),
(191, 6, 101, 273, 'MDF Finish', 1, '2024-01-19 17:23:36', '2024-01-19 17:23:36', NULL),
(192, 6, 101, 273, 'Textured/Patterned MDF finish', 1, '2024-01-19 17:24:15', '2024-01-19 17:24:15', NULL),
(193, 6, 101, 275, 'Laminate Finish', 1, '2024-01-19 17:24:56', '2024-01-19 17:24:56', NULL),
(194, 6, 101, 275, 'Veneer Finish', 1, '2024-01-19 17:25:12', '2024-01-19 17:25:30', NULL),
(195, 6, 101, 275, 'MDF Finish', 1, '2024-01-19 17:25:46', '2024-01-19 17:25:46', NULL),
(196, 6, 101, 275, 'Textured/Patterned MDF finish', 1, '2024-01-19 17:26:09', '2024-01-19 17:26:09', NULL),
(197, 6, 101, 274, 'Laminate Finish', 1, '2024-01-19 17:26:43', '2024-01-19 17:26:43', NULL),
(198, 6, 101, 274, 'MDF Finish', 1, '2024-01-19 17:27:03', '2024-01-19 17:27:03', NULL),
(199, 6, 101, 276, 'Fabric Finish', 1, '2024-01-19 17:27:31', '2024-01-19 17:27:31', NULL),
(200, 6, 101, 277, 'SS Finish', 1, '2024-01-19 17:28:06', '2024-01-19 17:28:06', NULL),
(201, 2, 87, 210, 'New 5A Switch & Socket from DB on wall (price for wire and conduits, chipping and replastering on wall is included)', 1, '2024-01-20 11:57:12', '2024-01-20 11:57:12', NULL),
(202, 2, 87, 211, 'New 5A Switch (Light) points from DB on wall (price for wire and conduits, chipping and replastering on wall is included)', 1, '2024-01-20 11:58:09', '2024-01-20 11:58:09', NULL),
(203, 2, 87, 212, 'New 15A Switch & Socket from DB on wall (price for wire and conduits, chipping and replastering on wall is included', 1, '2024-01-20 11:58:51', '2024-01-20 11:58:51', NULL),
(204, 2, 87, 213, 'New fan point (price for wire and conduits, chipping and replastering on wall is included)', 1, '2024-01-20 12:00:19', '2024-01-20 12:00:19', NULL),
(205, 2, 87, 214, 'New AC  point (price for wire and conduits, chipping and replastering on wall is included)', 1, '2024-01-20 12:00:58', '2024-01-20 12:00:58', NULL),
(206, 2, 87, 280, 'secondary looping point', 1, '2024-01-20 12:01:15', '2024-01-20 12:01:15', NULL),
(207, 2, 87, 281, 'Circuit Wiring 1.5 mm', 1, '2024-01-20 12:01:33', '2024-01-20 12:01:33', NULL),
(208, 2, 87, 281, 'Circuit Wiring 2.5 mm', 1, '2024-01-20 12:01:52', '2024-01-20 12:01:52', NULL),
(209, 2, 87, 281, 'Circuit Wiring 4 mm', 1, '2024-01-20 12:02:10', '2024-01-20 12:02:10', NULL),
(210, 2, 87, 282, 'Telephone Wiring 4 pair (inlcudes wiring and conduits)', 1, '2024-01-20 12:02:41', '2024-01-20 12:02:41', NULL),
(211, 2, 87, 283, 'Internet Wiring CAT-6 (inlcudes wiring & conduits) LAN cable', 1, '2024-01-20 12:03:00', '2024-01-20 12:03:00', NULL),
(212, 2, 87, 284, 'TV Cable Wiring RJ-6 (includes wiring and conduits )', 1, '2024-01-20 12:03:20', '2024-01-20 12:03:20', NULL),
(213, 2, 87, 285, 'Speaker Cabling of Oxygen Make', 1, '2024-01-20 12:03:38', '2024-01-20 12:03:38', NULL),
(214, 2, 87, 286, 'Standard Light Fixing', 1, '2024-01-20 12:03:57', '2024-01-20 12:03:57', NULL),
(215, 2, 87, 286, 'Profile and strip lights fixing', 1, '2024-01-20 12:04:14', '2024-01-20 12:04:14', NULL),
(216, 2, 87, 286, 'Decorative lights fixing', 1, '2024-01-20 12:04:34', '2024-01-20 12:04:34', NULL),
(217, 2, 87, 287, '(Please mention in description)', 1, '2024-01-20 12:04:57', '2024-01-20 12:04:57', NULL),
(218, 4, 22, 187, 'N/A', 1, '2024-01-21 17:09:50', '2024-01-21 17:09:50', NULL),
(219, 4, 22, 188, 'N/A', 1, '2024-01-21 17:10:07', '2024-01-21 17:10:07', NULL),
(220, 4, 93, 289, 'Other (Please mention in description)', 1, '2024-01-21 17:20:29', '2024-01-21 17:20:29', NULL),
(221, 5, 92, 290, 'Other (Please mention in description)', 1, '2024-01-21 17:50:03', '2024-01-21 17:50:03', NULL),
(222, 3, 94, 294, 'N/A', 1, '2024-01-23 13:43:19', '2024-01-23 13:43:19', NULL),
(223, 3, 4, 293, 'N/A', 1, '2024-01-23 13:43:36', '2024-01-23 13:43:36', NULL),
(224, 3, 5, 291, 'N/A', 1, '2024-01-23 13:43:55', '2024-01-23 13:43:55', NULL),
(225, 3, 17, 292, 'N/A', 1, '2024-01-23 13:44:11', '2024-01-23 13:44:11', NULL),
(226, 10, 89, 295, 'N/A', 1, '2024-01-23 13:53:37', '2024-01-23 13:53:37', NULL),
(227, 6, 48, 80, 'N/A', 1, '2024-01-23 20:37:53', '2024-01-23 20:37:53', NULL),
(228, 6, 48, 82, 'N/A', 1, '2024-01-23 20:38:12', '2024-01-23 20:38:12', NULL),
(229, 6, 91, 237, 'N/A', 1, '2024-01-24 16:42:11', '2024-01-24 16:42:11', NULL),
(230, 12, 88, 236, 'N/A', 1, '2024-01-24 21:28:16', '2024-01-24 21:28:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `labour_work_descriptions`
--

CREATE TABLE `labour_work_descriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_type_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_roles_table', 1),
(2, '2014_10_12_000001_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_10_12_063049_create_user_companies_table', 1),
(7, '2023_10_12_063740_create_property_types_table', 1),
(8, '2023_10_12_064606_create_work_types_table', 1),
(9, '2023_10_12_064721_create_user_project_samples_table', 1),
(10, '2023_10_12_064812_create_user_project_sample_images_table', 1),
(11, '2023_10_12_083001_create_use_otps_table', 1),
(12, '2023_10_12_121357_create_user_property_types_table', 1),
(13, '2023_10_12_122231_create_user_work_types_table', 1),
(14, '2023_10_14_115611_create_work_professions_table', 1),
(15, '2023_10_14_115748_create_role_work_professions_table', 1),
(16, '2023_10_14_121057_create_project_types_table', 1),
(17, '2023_10_16_100217_create_budget_ranges_table', 1),
(18, '2023_10_16_114626_create_units_table', 1),
(19, '2023_10_17_115833_create_items_table', 1),
(20, '2023_10_17_115927_create_item_categories_table', 1),
(21, '2023_10_17_125558_create_area_of_works_table', 1),
(22, '2023_10_23_060756_create_item_details_table', 1),
(23, '2023_10_23_060936_create_item_brand_specifications_table', 1),
(24, '2023_10_23_070134_create_admins_table', 1),
(25, '2023_10_25_110714_create_labour_work_descriptions_table', 1),
(26, '2023_10_26_045037_create_project_individual_contractors_table', 1),
(27, '2023_10_26_045419_create_project_work_types_table', 1),
(28, '2023_10_26_060641_create_project_work_requests_table', 1),
(29, '2023_10_26_071915_create_project_addresses_table', 1),
(30, '2023_10_26_074338_create_project_work_request_images_table', 1),
(31, '2023_10_27_061001_create_project_work_type_applications_table', 1),
(32, '2023_10_27_061646_create_project_work_request_applications_table', 1),
(33, '2023_10_31_045510_create_review_categories_table', 1),
(34, '2023_10_31_074607_create_review_users_table', 1),
(35, '2023_10_31_075959_create_review_ratings_table', 1),
(36, '2023_11_02_051133_create_project_labour_contractors_table', 1),
(37, '2023_11_02_075816_create_project_labour_applications_table', 1),
(38, '2023_11_21_123118_add_some_col_to_item_brand_specifications', 2),
(39, '2023_11_21_152041_add_some_col_to_item_brand_specifications', 3),
(40, '2023_11_22_112720_create_user_kycs_table', 4),
(41, '2023_11_22_134622_create_onboard_steps_table', 5),
(44, '2023_11_22_153548_add_some_col_to_users', 6),
(45, '2023_11_23_115224_add_some_col_to_users', 7),
(46, '2023_11_24_172922_create_verification_remarks_table', 8),
(47, '2023_11_25_124014_create_help_supports_table', 9),
(48, '2023_11_30_111002_add_some_col_to_user_kycs', 10),
(49, '2023_12_04_162511_add_some_col_to_users', 11),
(50, '2023_12_04_180455_create_elemantra_notifications_table', 11),
(51, '2023_12_05_171158_add_some_col_to_review_users', 12),
(52, '2023_12_05_181114_add_some_col_to_elemantra_notifications', 13),
(53, '2023_12_06_112454_add_some_col_to_elemantra_notifications', 14),
(54, '2023_12_26_162236_add_some_col_to_item_categories', 15);

-- --------------------------------------------------------

--
-- Table structure for table `onboard_steps`
--

CREATE TABLE `onboard_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-active,0-inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `onboard_steps`
--

INSERT INTO `onboard_steps` (`id`, `name`, `title`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'step 1', 'Call and Form', 'Put the details of what kind of vendor - Call and Form  - Minutes of the meeting, Person who spoke to vendor details', 1, '2023-11-22 10:01:05', NULL, NULL),
(2, 'step 2', 'Site visits', 'Site visits ( old project images and description, new project images and description) - Name of the person who did site visit and minutes of the meeting If yes, proceed to step 3. If no, terminate the onboarding', 1, '2023-11-22 10:01:05', NULL, NULL),
(3, 'step 3', 'Meeting', 'Meeting ( Share the details of Elemantra rate card) ,If yes, proceed for further steps(further discussion on rate card). If not, terminate. , Check for all images, project details, documents and checklists are filled', 1, '2023-11-22 10:01:05', NULL, NULL),
(4, 'step 4', 'Confirm the vendor', 'confirm the vendor for onboarding process', 1, '2023-11-22 10:01:05', NULL, NULL),
(5, 'step 5', 'Offline KYC', 'MoU(offline), Aadhar card(offline), PAN card(offline), Firm/company letter(offline) - else, auto populate from user login in the front end', 1, '2023-11-22 10:01:05', NULL, NULL),
(6, 'step 6', 'Rate Vendor', 'Rating the vendor( Geetika has to share the rating list)', 1, '2023-11-22 10:01:05', NULL, NULL),
(7, 'step 7', 'Confirm Details', 'Confirm the details provided by you to onboard the vendor with Elemantra - success screen', 1, '2023-11-22 10:01:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth-token', '7eccdcf21d8d2e3929d7d55ebc234504d95d80fabbe1d395658bd410bbcebdbd', '[\"*\"]', '2024-01-10 11:21:48', NULL, '2024-01-04 11:23:16', '2024-01-10 11:21:48'),
(2, 'App\\Models\\User', 1, 'auth-token', 'ea30d0f9e059c03c321b67e52f18db03649e3b9a0ded2c94e7420f203ecd24ac', '[\"*\"]', '2024-01-05 02:54:48', NULL, '2024-01-05 02:54:26', '2024-01-05 02:54:48'),
(3, 'App\\Models\\User', 2, 'auth-token', '06bfb22c59a11ade4f7394031eb06d0907e69fd60e22a0788da57d26097b65f1', '[\"*\"]', '2024-01-06 11:06:43', NULL, '2024-01-05 09:52:17', '2024-01-06 11:06:43'),
(4, 'App\\Models\\User', 3, 'auth-token', 'a4c3b11025266acfddc5058462d6edf6c921f485e97bfe988590cd89586bea97', '[\"*\"]', '2024-01-08 12:05:40', NULL, '2024-01-05 09:52:56', '2024-01-08 12:05:40'),
(5, 'App\\Models\\User', 4, 'auth-token', 'fda4b9df32558e0d74fd0dda25da12595d844bb65d40e670456a5a05cfb1f318', '[\"*\"]', '2024-01-23 17:48:46', NULL, '2024-01-05 10:48:04', '2024-01-23 17:48:46'),
(6, 'App\\Models\\User', 5, 'auth-token', 'a2715b8980ca3605a5efc1b6721d0b81b3402ed0929e62a42e3712056c67c45b', '[\"*\"]', '2024-01-26 00:26:23', NULL, '2024-01-06 07:26:59', '2024-01-26 00:26:23'),
(7, 'App\\Models\\User', 6, 'auth-token', '51403ca867bf3065d9b5f785009d399b7b02aea2a12dad4fb19901f0e0f185c9', '[\"*\"]', '2024-01-08 06:21:19', NULL, '2024-01-06 11:12:25', '2024-01-08 06:21:19'),
(8, 'App\\Models\\User', 7, 'auth-token', '26568b27d3fd5ba47ecdc9e324d8fa9318777f3ea3869960fdcf4a0953c03cdc', '[\"*\"]', '2024-01-09 05:01:37', NULL, '2024-01-07 09:16:30', '2024-01-09 05:01:37'),
(9, 'App\\Models\\User', 2, 'auth-token', '3235e747e7149d5cd2565011df3d57f1f151c941bb115701e82bdcb659d263d9', '[\"*\"]', '2024-01-08 06:21:41', NULL, '2024-01-08 06:21:33', '2024-01-08 06:21:41'),
(10, 'App\\Models\\User', 8, 'auth-token', '41473291f994d7137b96b94df450e303d5cf4d8ad243bb4e097ffa4191ee6776', '[\"*\"]', '2024-01-24 00:37:15', NULL, '2024-01-08 09:12:01', '2024-01-24 00:37:15'),
(11, 'App\\Models\\User', 1, 'auth-token', '284ac35127c072abbd1d7afa1eb836a2be7dc04a32bbc9b5ac6f10ce2066b4de', '[\"*\"]', '2024-01-09 11:08:36', NULL, '2024-01-08 10:22:21', '2024-01-09 11:08:36'),
(12, 'App\\Models\\User', 3, 'auth-token', '60139466051558edfe8b24876c0f46be371d3d4f14876fa9b3a16d71c1c6f224', '[\"*\"]', '2024-01-17 04:32:50', NULL, '2024-01-08 12:07:28', '2024-01-17 04:32:50'),
(13, 'App\\Models\\User', 7, 'auth-token', '5a16baaa533e26128bc1aaca03bc9ae381533ed15750eef36b3fb7ccacbab9f2', '[\"*\"]', '2024-01-09 15:25:12', NULL, '2024-01-09 05:23:59', '2024-01-09 15:25:12'),
(14, 'App\\Models\\User', 9, 'auth-token', '190270488941f7673f28c45514703e6eeab57f20060b3bba2cbacb07dbe28244', '[\"*\"]', '2024-01-13 06:42:16', NULL, '2024-01-10 11:22:50', '2024-01-13 06:42:16'),
(15, 'App\\Models\\User', 6, 'auth-token', '1847a9fbcd5b07cb9513688d30dbf67c6d2dab45dcc355821e6f9872ebc14d9c', '[\"*\"]', '2024-01-13 06:34:51', NULL, '2024-01-11 09:41:00', '2024-01-13 06:34:51'),
(16, 'App\\Models\\User', 1, 'auth-token', '1a119dc5ad19bab0eeaec11cd74c2d87f0d16319096b55e54ff757f0b27d0b07', '[\"*\"]', '2024-01-13 06:00:48', NULL, '2024-01-13 06:00:03', '2024-01-13 06:00:48'),
(17, 'App\\Models\\User', 10, 'auth-token', 'c93b90a65191a6c13556bc859cf2f4b09cf6fab1c97dfab12ee135577693f63e', '[\"*\"]', '2024-01-13 06:01:26', NULL, '2024-01-13 06:01:23', '2024-01-13 06:01:26'),
(18, 'App\\Models\\User', 1, 'auth-token', 'ac5a413efa956df6024d8251cf00b5964c9e9080efe85e33144a698d4c24490d', '[\"*\"]', '2024-01-13 07:30:03', NULL, '2024-01-13 06:06:34', '2024-01-13 07:30:03'),
(19, 'App\\Models\\User', 7, 'auth-token', '312bcbd417dc230514963979f736d97a2c18f5b74d0e1e7343d6917215980547', '[\"*\"]', '2024-01-13 14:11:23', NULL, '2024-01-13 06:30:07', '2024-01-13 14:11:23'),
(20, 'App\\Models\\User', 11, 'auth-token', 'a9a6d42fb0f48d6d1aff89f7eb8f802ff96b391f555db8d05156952867c46f98', '[\"*\"]', '2024-01-13 07:48:14', NULL, '2024-01-13 06:30:41', '2024-01-13 07:48:14'),
(21, 'App\\Models\\User', 2, 'auth-token', '2df0f3c23f13a7fb79f8c948efa36c2fc3cb51d885c2a4788aa70c60002c1dc7', '[\"*\"]', '2024-01-13 08:38:21', NULL, '2024-01-13 06:35:17', '2024-01-13 08:38:21'),
(22, 'App\\Models\\User', 9, 'auth-token', 'ac6346be52182a9171289dc643d4e1602d319d85a0291467b87ae93f37b66c42', '[\"*\"]', '2024-01-13 06:43:26', NULL, '2024-01-13 06:43:04', '2024-01-13 06:43:26'),
(23, 'App\\Models\\User', 12, 'auth-token', '1818b31a5760a330feee6a278553f613cc311066a944d7d20b5735035a2055a0', '[\"*\"]', '2024-01-13 07:09:00', NULL, '2024-01-13 06:44:44', '2024-01-13 07:09:00'),
(24, 'App\\Models\\User', 12, 'auth-token', '0f256ec4eed9557ef3ff2c5000ab1783f634313845dbc2fd639c36e2b1a10493', '[\"*\"]', '2024-01-13 07:24:00', NULL, '2024-01-13 07:10:32', '2024-01-13 07:24:00'),
(25, 'App\\Models\\User', 13, 'auth-token', 'b805b5fbae374e62fd57b561b00470a6b83c332325236e621fef7c2438c81ef7', '[\"*\"]', '2024-01-13 08:24:49', NULL, '2024-01-13 07:24:23', '2024-01-13 08:24:49'),
(26, 'App\\Models\\User', 14, 'auth-token', '7b40cc7aa7a4e12965254c4af8511298f909c50f82e6e07d5256e8b15d4c35d1', '[\"*\"]', '2024-01-13 07:53:52', NULL, '2024-01-13 07:30:35', '2024-01-13 07:53:52'),
(27, 'App\\Models\\User', 1, 'auth-token', '19175cb4d330acd760c2e6531739824e99a15718a2b14b75f6d1acb52b280856', '[\"*\"]', '2024-01-13 08:57:54', NULL, '2024-01-13 07:54:03', '2024-01-13 08:57:54'),
(28, 'App\\Models\\User', 1, 'auth-token', '41ca2f1638705f572f3e9bfc64ad4e1bbd5d64371250f618322862cbf4eee849', '[\"*\"]', '2024-01-17 12:08:37', NULL, '2024-01-13 08:21:06', '2024-01-17 12:08:37'),
(29, 'App\\Models\\User', 11, 'auth-token', '1aaf9cf5702159516b8a02463a604b8ebe956bbd7505d9d3dd004c1b84ffc24e', '[\"*\"]', '2024-01-13 09:00:11', NULL, '2024-01-13 08:53:36', '2024-01-13 09:00:11'),
(30, 'App\\Models\\User', 14, 'auth-token', 'a02fe8c72c0c5cbd2376377bb11ef3edc8fdc99615293ac80f6b7ae74b18a254', '[\"*\"]', '2024-01-13 13:56:42', NULL, '2024-01-13 08:58:03', '2024-01-13 13:56:42'),
(31, 'App\\Models\\User', 11, 'auth-token', '6464638f39495c19717068c33dce35bc86377aae6f61327c479562b962ac3aa9', '[\"*\"]', '2024-01-13 09:02:10', NULL, '2024-01-13 09:02:07', '2024-01-13 09:02:10'),
(32, 'App\\Models\\User', 11, 'auth-token', '43e8b40d2ce63da7b38218f424fe9e3b367daad3fcc8a81a874cb1dd7c99daad', '[\"*\"]', '2024-01-13 09:14:27', NULL, '2024-01-13 09:14:00', '2024-01-13 09:14:27'),
(33, 'App\\Models\\User', 15, 'auth-token', 'c5244e237b7e56baa87cff9ac78401aea56c81215891e19912738510bd8bc112', '[\"*\"]', '2024-01-13 09:17:44', NULL, '2024-01-13 09:15:00', '2024-01-13 09:17:44'),
(34, 'App\\Models\\User', 11, 'auth-token', '1f3e534ec2e870408052f47584b863647b676964a42ae57d61132b8711db4d5c', '[\"*\"]', '2024-01-13 09:19:33', NULL, '2024-01-13 09:17:55', '2024-01-13 09:19:33'),
(35, 'App\\Models\\User', 11, 'auth-token', '4a3e08e55a32912b852900e0d33ab0314a0a34e32e33116903bb933443583392', '[\"*\"]', '2024-01-13 11:53:21', NULL, '2024-01-13 11:24:10', '2024-01-13 11:53:21'),
(36, 'App\\Models\\User', 15, 'auth-token', '3e44470efe537278a4f65ae84959355185bb2d495cac483f56650e3b5d705f0c', '[\"*\"]', '2024-01-13 11:55:45', NULL, '2024-01-13 11:53:38', '2024-01-13 11:55:45'),
(37, 'App\\Models\\User', 11, 'auth-token', '7857bf0cfb2bfcc6c72e4cd4ace0c572d0897ec2ff3186f848ff8f10e775105c', '[\"*\"]', '2024-01-14 06:03:47', NULL, '2024-01-13 11:55:58', '2024-01-14 06:03:47'),
(38, 'App\\Models\\User', 12, 'auth-token', '296e98b293ac19f4f57d279ca1853577a1b33482468da9ba49249540b4bff5bd', '[\"*\"]', '2024-01-16 13:09:16', NULL, '2024-01-13 12:11:14', '2024-01-16 13:09:16'),
(39, 'App\\Models\\User', 1, 'auth-token', '26139b7a08ddd0d26e40f890c73df1eb0eea285303aa4b489e3dec6a0af90093', '[\"*\"]', '2024-01-17 05:58:31', NULL, '2024-01-13 13:59:17', '2024-01-17 05:58:31'),
(40, 'App\\Models\\User', 15, 'auth-token', '2a02cc48c7855b6503fc2e28375aeeffff540af5181f6149905da6e662b3c4c3', '[\"*\"]', '2024-01-14 06:07:59', NULL, '2024-01-14 06:05:05', '2024-01-14 06:07:59'),
(41, 'App\\Models\\User', 11, 'auth-token', 'c431355159bb463e60d505564d2720ee1c230817671ea00ef7dd1ec620fd012c', '[\"*\"]', '2024-01-14 17:41:14', NULL, '2024-01-14 06:08:20', '2024-01-14 17:41:14'),
(42, 'App\\Models\\User', 15, 'auth-token', '3a8a8c35471c4f98e82f917ec3ec30174cf6775bcfe2cc201536b752c7c6e8af', '[\"*\"]', '2024-01-14 17:46:27', NULL, '2024-01-14 17:42:00', '2024-01-14 17:46:27'),
(43, 'App\\Models\\User', 11, 'auth-token', '1d3659be0d5422ce03e5c1020fdef7dc9c70ef7bd1adc5b1b4d3e591adc40526', '[\"*\"]', '2024-01-14 17:51:28', NULL, '2024-01-14 17:46:38', '2024-01-14 17:51:28'),
(44, 'App\\Models\\User', 2, 'auth-token', '658882e14569a3a4164e024ef824c771fd6bd375111efe390f4387130c25a379', '[\"*\"]', '2024-01-16 07:33:19', NULL, '2024-01-16 07:17:54', '2024-01-16 07:33:19'),
(45, 'App\\Models\\User', 11, 'auth-token', '32925afa25359b0fc3ba5facbdc0e049475b3b968d5527d1b264a2470bc2b6bb', '[\"*\"]', '2024-01-16 11:51:10', NULL, '2024-01-16 08:01:20', '2024-01-16 11:51:10'),
(46, 'App\\Models\\User', 1, 'auth-token', '4dd98c7943e938563709f17efedc7b80257f2d3d0436f0a99b636dde2ab24f50', '[\"*\"]', '2024-01-16 09:02:12', NULL, '2024-01-16 09:01:40', '2024-01-16 09:02:12'),
(47, 'App\\Models\\User', 15, 'auth-token', 'f17bbfdf93352678643683c497a0bef289c6442c48a6342d9df5cd6bac3e2a73', '[\"*\"]', '2024-01-16 11:54:16', NULL, '2024-01-16 11:51:21', '2024-01-16 11:54:16'),
(48, 'App\\Models\\User', 11, 'auth-token', '057c8b7bb6251c8e896251769533a74588e9a4a3d5a773845f41710dc4b07609', '[\"*\"]', '2024-01-17 07:07:44', NULL, '2024-01-17 03:21:51', '2024-01-17 07:07:44'),
(49, 'App\\Models\\User', 2, 'auth-token', '0858344437eda7778b32baa2175413966c8ecdf3c6a199e0e66e9001f89a1483', '[\"*\"]', '2024-01-18 03:54:47', NULL, '2024-01-17 03:30:20', '2024-01-18 03:54:47'),
(50, 'App\\Models\\User', 16, 'auth-token', 'd1569c20964531ea2086b59a009642ad360e7bffad41b389650957a44ad93706', '[\"*\"]', '2024-01-17 05:27:01', NULL, '2024-01-17 05:16:34', '2024-01-17 05:27:01'),
(51, 'App\\Models\\User', 16, 'auth-token', '30a05423c056f421993ba133052def5f5e804982b9d08ec77d270c8e72a877ce', '[\"*\"]', '2024-01-17 06:00:25', NULL, '2024-01-17 05:59:05', '2024-01-17 06:00:25'),
(52, 'App\\Models\\User', 14, 'auth-token', '26503554b63e8523f722725f308a4b7add296e94d3e2bb72bbf821593c0e9f3a', '[\"*\"]', '2024-01-17 06:00:43', NULL, '2024-01-17 06:00:37', '2024-01-17 06:00:43'),
(53, 'App\\Models\\User', 14, 'auth-token', '3c70b22bc4dbedbd7180f437c8e910777fc02ec68372bfe34ee9e73a87da5929', '[\"*\"]', '2024-01-17 06:01:58', NULL, '2024-01-17 06:01:52', '2024-01-17 06:01:58'),
(54, 'App\\Models\\User', 16, 'auth-token', '24ccd4deb4a3f8e19b15075cb2307c1a84931b6d5e1c12a8e74a92884e927172', '[\"*\"]', '2024-01-17 06:21:18', NULL, '2024-01-17 06:09:08', '2024-01-17 06:21:18'),
(55, 'App\\Models\\User', 14, 'auth-token', '6fe510e9df70afca2a8457f8bba836a8e12688717165c254690804334ef6f482', '[\"*\"]', '2024-01-17 06:48:48', NULL, '2024-01-17 06:20:28', '2024-01-17 06:48:48'),
(56, 'App\\Models\\User', 17, 'auth-token', 'e12713b5f0f6d3548fa636dd05cb6b3d6a02b38543e1e24fbeb083d04d620f80', '[\"*\"]', '2024-01-17 06:21:57', NULL, '2024-01-17 06:21:04', '2024-01-17 06:21:57'),
(57, 'App\\Models\\User', 13, 'auth-token', 'b4f9a56e44445b7e1ecf857c958f1bcd11ff72b784fa013b51b250bb431c855f', '[\"*\"]', '2024-01-17 07:03:25', NULL, '2024-01-17 06:22:56', '2024-01-17 07:03:25'),
(58, 'App\\Models\\User', 18, 'auth-token', 'ab1f1a2c0b86d84b3a9cbb58eaeb3f262d0a49b82b0f31741ad79cc54341cd48', '[\"*\"]', '2024-01-17 08:08:41', NULL, '2024-01-17 07:06:18', '2024-01-17 08:08:41'),
(59, 'App\\Models\\User', 15, 'auth-token', 'f625969a02fa60bd737a7032e6e9851f51a39f0c796800ccd602d64a9129e2f4', '[\"*\"]', '2024-01-17 07:10:45', NULL, '2024-01-17 07:08:16', '2024-01-17 07:10:45'),
(60, 'App\\Models\\User', 11, 'auth-token', 'a36d79d5923866a6eb9559ca65a0a84535f28a7ef3b654bd91516182f27d231a', '[\"*\"]', '2024-01-17 07:11:30', NULL, '2024-01-17 07:11:02', '2024-01-17 07:11:30'),
(61, 'App\\Models\\User', 14, 'auth-token', '1ffd93c381839ee24379d4d8a81a6785e2d19122c61b0c8a0acd8257e98c8d98', '[\"*\"]', '2024-01-17 12:10:04', NULL, '2024-01-17 07:24:35', '2024-01-17 12:10:04'),
(62, 'App\\Models\\User', 16, 'auth-token', 'c5b954f5c972d2633decd30c06e8b7e53af02bd2aadcc553b4ebedea27268758', '[\"*\"]', '2024-01-17 10:11:51', NULL, '2024-01-17 07:45:22', '2024-01-17 10:11:51'),
(63, 'App\\Models\\User', 19, 'auth-token', 'f3f51114d56cfaf2544c6ad40cdfc9e124b855d8f274d7b0943fac29cad3592a', '[\"*\"]', '2024-01-17 10:09:49', NULL, '2024-01-17 08:09:16', '2024-01-17 10:09:49'),
(64, 'App\\Models\\User', 20, 'auth-token', '03e864e3b65618ba34fff8fdb7e31d077f46f96ccd7f0fcfc4ca21cfe0f02ec1', '[\"*\"]', '2024-01-17 10:11:50', NULL, '2024-01-17 10:10:25', '2024-01-17 10:11:50'),
(65, 'App\\Models\\User', 18, 'auth-token', '1e21125c44f64949c37051d34f324450d8b8f0553b46f0a13684ffeb06d62b5f', '[\"*\"]', '2024-01-17 12:41:08', NULL, '2024-01-17 10:12:29', '2024-01-17 12:41:08'),
(66, 'App\\Models\\User', 16, 'auth-token', 'd6ce77d1e131014da719b51c0c432f55e205da9da9624d9002f708b96856cfe1', '[\"*\"]', '2024-01-17 10:13:40', NULL, '2024-01-17 10:13:16', '2024-01-17 10:13:40'),
(67, 'App\\Models\\User', 14, 'auth-token', '8804ed429baa3b7f48f4f4b1f3d452e7ce9eea4393342c2edc4a332dceb777fe', '[\"*\"]', '2024-01-19 04:05:06', NULL, '2024-01-17 11:25:40', '2024-01-19 04:05:06'),
(68, 'App\\Models\\User', 15, 'auth-token', 'fb935c9be957e5077b08d552f9c608625abe667d753c4ad7d0996ff60afec2cd', '[\"*\"]', '2024-01-17 11:44:51', NULL, '2024-01-17 11:41:58', '2024-01-17 11:44:51'),
(69, 'App\\Models\\User', 11, 'auth-token', '2379e60ce4a048636f0e4449a2398d03ad9d7ccbdc72a725737340f21d56abf6', '[\"*\"]', '2024-01-18 10:46:11', NULL, '2024-01-17 11:45:05', '2024-01-18 10:46:11'),
(70, 'App\\Models\\User', 18, 'auth-token', '2c49e8edaacc98e280d55ee1b2d5bc0cae735fb5e58be09411563d91523c5d3e', '[\"*\"]', '2024-01-17 12:11:48', NULL, '2024-01-17 12:08:54', '2024-01-17 12:11:48'),
(71, 'App\\Models\\User', 14, 'auth-token', '5e53ac80661d7592063ac50932f4a5a1360db907ae77ce7cadfde7fd402c41c9', '[\"*\"]', '2024-01-17 13:50:25', NULL, '2024-01-17 12:13:22', '2024-01-17 13:50:25'),
(72, 'App\\Models\\User', 16, 'auth-token', '9fedd3b1254db751a5fd258b0d8df90686bc3b160eaedceaf2cfad413b9d201d', '[\"*\"]', '2024-01-18 05:56:08', NULL, '2024-01-17 12:43:16', '2024-01-18 05:56:08'),
(73, 'App\\Models\\User', 21, 'auth-token', '01e4eb5447b4097118e2ca237927fc57571cb124413d405603042ad4e761d2bd', '[\"*\"]', '2024-01-18 00:41:39', NULL, '2024-01-17 23:45:26', '2024-01-18 00:41:39'),
(74, 'App\\Models\\User', 16, 'auth-token', 'd393df5b93223ea0cc266a59c510fcd4c3e3ff69b2b128ea592dd0391f799989', '[\"*\"]', '2024-01-17 23:53:36', NULL, '2024-01-17 23:53:24', '2024-01-17 23:53:36'),
(75, 'App\\Models\\User', 1, 'auth-token', '961109f544f8d782cccc002c254fa9545c1ea073814d8b6b26044b5346ae49c0', '[\"*\"]', '2024-01-17 23:54:10', NULL, '2024-01-17 23:54:07', '2024-01-17 23:54:10'),
(76, 'App\\Models\\User', 18, 'auth-token', '5f63265debf46d26101751cb55b62156d8036f00eb382fa28f05902f9f659848', '[\"*\"]', '2024-01-18 01:27:13', NULL, '2024-01-17 23:56:52', '2024-01-18 01:27:13'),
(77, 'App\\Models\\User', 14, 'auth-token', 'c6a943bfd71d1211fd0519abb5fdfad27a803a055b9b116dd2f69bdbf5a7fe50', '[\"*\"]', '2024-01-18 04:04:08', NULL, '2024-01-18 04:03:48', '2024-01-18 04:04:08'),
(78, 'App\\Models\\User', 18, 'auth-token', '7a9b7195be59275db776535546ede54dd580c57f99fcd6b00ced87500f7384cb', '[\"*\"]', '2024-01-18 06:11:37', NULL, '2024-01-18 04:04:21', '2024-01-18 06:11:37'),
(79, 'App\\Models\\User', 7, 'auth-token', '746d1f456e57e3857ad2dbc76afccde81670dca499b8b8e33c50a72c2f5942e4', '[\"*\"]', '2024-01-18 10:54:04', NULL, '2024-01-18 05:44:46', '2024-01-18 10:54:04'),
(80, 'App\\Models\\User', 18, 'auth-token', 'd91d74c4fd88158d9dde05a42604fb40f5df57b34080d1e70a31b38c62cb06fd', '[\"*\"]', '2024-01-18 06:33:18', NULL, '2024-01-18 05:56:31', '2024-01-18 06:33:18'),
(81, 'App\\Models\\User', 1, 'auth-token', 'da7d935cc496347a8d334a40140d7ffdca4f34c50c708d72434ba82be181a5fa', '[\"*\"]', '2024-01-18 06:29:07', NULL, '2024-01-18 06:11:53', '2024-01-18 06:29:07'),
(82, 'App\\Models\\User', 22, 'auth-token', '70f48cb9a5e8fb8cce239c724495a79f05f0aa93d859c39374737d2d07304e06', '[\"*\"]', '2024-01-18 06:36:27', NULL, '2024-01-18 06:30:18', '2024-01-18 06:36:27'),
(83, 'App\\Models\\User', 20, 'auth-token', 'da174bf9ebe7f1deeb33eaf3b67a2e0e261a56447ceda08bad2fd0612046d742', '[\"*\"]', '2024-01-18 06:33:47', NULL, '2024-01-18 06:33:43', '2024-01-18 06:33:47'),
(84, 'App\\Models\\User', 1, 'auth-token', '00b4473f40ab389895e19b0735ab833d4549eb1b5d903451826810bde0957fd4', '[\"*\"]', '2024-01-18 08:10:21', NULL, '2024-01-18 06:36:42', '2024-01-18 08:10:21'),
(85, 'App\\Models\\User', 18, 'auth-token', 'ecd7bc56e03737066acc7840b489eb8c0569e08dbaf99c6e927d1e29542bd0e2', '[\"*\"]', '2024-01-18 07:50:57', NULL, '2024-01-18 07:23:13', '2024-01-18 07:50:57'),
(86, 'App\\Models\\User', 1, 'auth-token', '37f73ca05fd6dfa15baf97e912782d03dd01d7d1f2a2c852031e01386a6535bf', '[\"*\"]', '2024-01-18 07:52:37', NULL, '2024-01-18 07:52:34', '2024-01-18 07:52:37'),
(87, 'App\\Models\\User', 16, 'auth-token', '2d394b9246ead091bb2072982df458d4325b93095a320acefc33b9be8b3915db', '[\"*\"]', '2024-01-18 07:53:02', NULL, '2024-01-18 07:52:51', '2024-01-18 07:53:02'),
(88, 'App\\Models\\User', 19, 'auth-token', 'c3a93e4e39661f274c0095e583f7deda00af78418bfd718025446b8c0f9032ef', '[\"*\"]', '2024-01-18 07:53:22', NULL, '2024-01-18 07:53:15', '2024-01-18 07:53:22'),
(89, 'App\\Models\\User', 20, 'auth-token', 'ea044dc5ffadf61d0f705234029ae57f641c66cf1492fcddbfc64681bc784322', '[\"*\"]', '2024-01-18 07:53:37', NULL, '2024-01-18 07:53:33', '2024-01-18 07:53:37'),
(90, 'App\\Models\\User', 18, 'auth-token', '8525919526ade105b73b551ccfb1b1e9ef81be7fce08d4a72a168011667fc838', '[\"*\"]', '2024-01-18 09:47:11', NULL, '2024-01-18 07:53:59', '2024-01-18 09:47:11'),
(91, 'App\\Models\\User', 18, 'auth-token', '4156a2d03f6f5a992393c621cf3fc11ba11ab8b939bba23662be17f28f3e233d', '[\"*\"]', '2024-01-18 08:26:25', NULL, '2024-01-18 08:10:48', '2024-01-18 08:26:25'),
(92, 'App\\Models\\User', 1, 'auth-token', '86045ec899fdfde273cf58df285de8508ce9d56ccecb9b3f32f5c0ecdbe3f5b9', '[\"*\"]', '2024-01-18 08:28:12', NULL, '2024-01-18 08:26:36', '2024-01-18 08:28:12'),
(93, 'App\\Models\\User', 1, 'auth-token', '382f38503bd38d502e9b8c812231ce223160de04bf884e5dcacb0cb2b7fd1c79', '[\"*\"]', '2024-01-18 09:30:41', NULL, '2024-01-18 08:34:46', '2024-01-18 09:30:41'),
(94, 'App\\Models\\User', 18, 'auth-token', '69d7f8f0a0c9de4f949b47b14e9a4d61cbdd2ab334c492a13b9fe558c8e4fccb', '[\"*\"]', '2024-01-18 13:40:59', NULL, '2024-01-18 09:30:58', '2024-01-18 13:40:59'),
(95, 'App\\Models\\User', 16, 'auth-token', 'cb9bc50b7613e594ed134f045f61d44b8f122ccdd3ed099dc9abd9db4b065719', '[\"*\"]', '2024-01-18 09:51:21', NULL, '2024-01-18 09:48:21', '2024-01-18 09:51:21'),
(96, 'App\\Models\\User', 19, 'auth-token', '3a4f7fae70dd1e72ac8c8b3e19f6f5047e6a799c747217317323721942f44953', '[\"*\"]', '2024-01-18 09:52:32', NULL, '2024-01-18 09:51:51', '2024-01-18 09:52:32'),
(97, 'App\\Models\\User', 16, 'auth-token', '81fd0f5cce3078fbc4013c4b342da04b0c8922a869ae5fec1525a0a826c9e533', '[\"*\"]', '2024-01-18 09:53:23', NULL, '2024-01-18 09:52:52', '2024-01-18 09:53:23'),
(98, 'App\\Models\\User', 19, 'auth-token', '213e279d5870192a84a4c07dc48e3b170f66b2ae26faa196f2cf49170296df56', '[\"*\"]', '2024-01-18 10:08:21', NULL, '2024-01-18 09:53:45', '2024-01-18 10:08:21'),
(99, 'App\\Models\\User', 18, 'auth-token', '458a608d1158250ee056e802a87d101a7d9631ebe892b13f96deee89fa312fa7', '[\"*\"]', '2024-01-18 10:23:42', NULL, '2024-01-18 10:08:42', '2024-01-18 10:23:42'),
(100, 'App\\Models\\User', 23, 'auth-token', '7446fbd8a688d7bcdf73d7ee99622cf1e65bd812092f570ed8f32475814ef8da', '[\"*\"]', '2024-01-18 10:24:53', NULL, '2024-01-18 10:24:47', '2024-01-18 10:24:53'),
(101, 'App\\Models\\User', 24, 'auth-token', '44cf095233721bff3e0e2fb6e296c5728c529a96d561043d791c7b90e238f946', '[\"*\"]', '2024-01-18 10:27:05', NULL, '2024-01-18 10:25:26', '2024-01-18 10:27:05'),
(102, 'App\\Models\\User', 25, 'auth-token', 'cbe4f0ff1cc64b9571aae6e68652cd3cf11c5f4df19f60de0009448976d29b7a', '[\"*\"]', '2024-01-18 10:58:40', NULL, '2024-01-18 10:28:11', '2024-01-18 10:58:40'),
(103, 'App\\Models\\User', 15, 'auth-token', '1e9ef735c16cf2dab165af15b5beb870e16cc01eb3e320d8f7b0f79af5b42203', '[\"*\"]', '2024-01-18 10:51:46', NULL, '2024-01-18 10:46:19', '2024-01-18 10:51:46'),
(104, 'App\\Models\\User', 15, 'auth-token', '06d207fb729f866bbf10e3246977e431563605175f5b9f2fe58cb689ffc69908', '[\"*\"]', '2024-01-18 10:52:22', NULL, '2024-01-18 10:52:07', '2024-01-18 10:52:22'),
(105, 'App\\Models\\User', 11, 'auth-token', 'd63d4ad4d42d08f13f18754908f42e061f40362334b1bf9f8a20b989333a7671', '[\"*\"]', '2024-01-26 09:10:20', NULL, '2024-01-18 10:52:36', '2024-01-26 09:10:20'),
(106, 'App\\Models\\User', 18, 'auth-token', '14334f21e3ebf02651ac2a5b7d94d368ba90d276a542b67721841c386e00896b', '[\"*\"]', '2024-01-18 11:08:40', NULL, '2024-01-18 10:59:05', '2024-01-18 11:08:40'),
(107, 'App\\Models\\User', 24, 'auth-token', '941f1fec1bd31b254df4078379ae44b30e38396ab4912b0a28fb41efa33d9121', '[\"*\"]', '2024-01-19 12:57:17', NULL, '2024-01-18 11:08:59', '2024-01-19 12:57:17'),
(108, 'App\\Models\\User', 1, 'auth-token', '908a236e9e59472200fb6d9872d8234d7881454dfb5b7b32a0a45db3cb62efc8', '[\"*\"]', NULL, NULL, '2024-01-19 04:06:10', '2024-01-19 04:06:10'),
(109, 'App\\Models\\User', 1, 'auth-token', '1cbb09f5a64c7f227b5636e2f3bc968d16c3f222aa476cc0a9e73f27c072d0db', '[\"*\"]', NULL, NULL, '2024-01-19 04:06:41', '2024-01-19 04:06:41'),
(110, 'App\\Models\\User', 1, 'auth-token', '51cd44a8cf9320b150f1c74331512d35803b66d516e5377f55a74e0900579369', '[\"*\"]', NULL, NULL, '2024-01-19 04:06:50', '2024-01-19 04:06:50'),
(111, 'App\\Models\\User', 1, 'auth-token', '3ff40fac5f1dcd3f8c30a8b9e8ec8ab2e51dad90ebab54a4b1925ca8929b8b56', '[\"*\"]', NULL, NULL, '2024-01-19 04:09:08', '2024-01-19 04:09:08'),
(112, 'App\\Models\\User', 1, 'auth-token', 'a6bdca7f290e0c24d57f6161fa4964a8d00161e2a453c39d04ec3d72545bb412', '[\"*\"]', '2024-01-19 04:35:00', NULL, '2024-01-19 04:10:54', '2024-01-19 04:35:00'),
(113, 'App\\Models\\User', 1, 'auth-token', '3a0c93b9d9ed2ccedac79f0c8f41713e62a8150e4a6a08bb3f4c2109325b2399', '[\"*\"]', NULL, NULL, '2024-01-19 04:45:55', '2024-01-19 04:45:55'),
(114, 'App\\Models\\User', 1, 'auth-token', '79c9efdb0062bbed2226514cc07f2a11174dc9bf60212f57a7df08b0f14a4ee9', '[\"*\"]', '2024-01-19 13:46:11', NULL, '2024-01-19 12:56:31', '2024-01-19 13:46:11'),
(115, 'App\\Models\\User', 19, 'auth-token', '32080df05550d7005b30e6efed7feaa1e0472bf9ef12c6655df1019d31471035', '[\"*\"]', '2024-01-19 12:57:29', NULL, '2024-01-19 12:57:28', '2024-01-19 12:57:29'),
(116, 'App\\Models\\User', 18, 'auth-token', '2b10a05b0b23bb34d57f15779d7d3a83d6033d67ba88ab08f1123be1200ea9c7', '[\"*\"]', '2024-01-19 13:38:05', NULL, '2024-01-19 12:58:47', '2024-01-19 13:38:05'),
(117, 'App\\Models\\User', 24, 'auth-token', '2d89d7fc4568c5061b4a90f381ebb34f342b07546a10eb39b4ba7a789349c461', '[\"*\"]', '2024-01-19 13:46:21', NULL, '2024-01-19 13:38:20', '2024-01-19 13:46:21'),
(118, 'App\\Models\\User', 24, 'auth-token', '49dd3a1f411bd5578c342386e78047f46a62c07cc5c561dc8639bf9773c24142', '[\"*\"]', '2024-01-19 15:27:31', NULL, '2024-01-19 13:46:27', '2024-01-19 15:27:31'),
(119, 'App\\Models\\User', 1, 'auth-token', '6fe7ffda10f041078614a1da7945dcb1e180e95472b398731cdca8e21c6711b9', '[\"*\"]', '2024-01-19 16:00:06', NULL, '2024-01-19 15:27:51', '2024-01-19 16:00:06'),
(120, 'App\\Models\\User', 16, 'auth-token', '3c487e812d994751a3fa7c93029909cbe88f9e6560709e2de06a4c041daa32ea', '[\"*\"]', '2024-01-19 18:53:22', NULL, '2024-01-19 15:41:54', '2024-01-19 18:53:22'),
(121, 'App\\Models\\User', 18, 'auth-token', 'cc6d25dc3859938dcd5d730441612cb6f1c7979cbbd32d6dd158c1b2488a581f', '[\"*\"]', '2024-01-19 17:43:15', NULL, '2024-01-19 16:00:18', '2024-01-19 17:43:15'),
(122, 'App\\Models\\User', 18, 'auth-token', '9c426744b471c4646c84b37d788b76da92054e45965df4b706b65c1d7e72e291', '[\"*\"]', '2024-01-19 16:31:23', NULL, '2024-01-19 16:02:17', '2024-01-19 16:31:23'),
(123, 'App\\Models\\User', 1, 'auth-token', 'ff0db3dce25a2b2148a0f4db824711073b1371ec9183d8b39f361ada424c38b1', '[\"*\"]', '2024-01-19 16:23:33', NULL, '2024-01-19 16:21:36', '2024-01-19 16:23:33'),
(124, 'App\\Models\\User', 20, 'auth-token', 'b8a63ed77811ca82bef8385a65a22f085ba7c9d6ed08aeefa13a61f28d3a55e7', '[\"*\"]', '2024-01-19 16:32:34', NULL, '2024-01-19 16:31:33', '2024-01-19 16:32:34'),
(125, 'App\\Models\\User', 1, 'auth-token', '4d139423ad1f2f68ccc131ce1598d587e8ff45053c0cfa82392e9d126e43291c', '[\"*\"]', '2024-01-19 17:45:44', NULL, '2024-01-19 17:45:31', '2024-01-19 17:45:44'),
(126, 'App\\Models\\User', 1, 'auth-token', '8459327bd4694740b95fc5e9168cb8745edbdf088637e204e80f4729dfcd1a07', '[\"*\"]', '2024-01-19 17:52:16', NULL, '2024-01-19 17:51:06', '2024-01-19 17:52:16'),
(127, 'App\\Models\\User', 18, 'auth-token', 'f3a873dc735e1d002b6665d45aa0029cd1898c13fd040adfab0ed5e265b83ef3', '[\"*\"]', '2024-01-19 18:48:52', NULL, '2024-01-19 17:52:35', '2024-01-19 18:48:52'),
(128, 'App\\Models\\User', 16, 'auth-token', 'bebce1c553c24b6ba4b41366501b01ee99330b3e352e9c2c78bc2f048759a5cc', '[\"*\"]', '2024-01-19 18:49:31', NULL, '2024-01-19 18:49:16', '2024-01-19 18:49:31'),
(129, 'App\\Models\\User', 18, 'auth-token', '1bc74a53b9bf0427e45f440195941ba18f0839628b1a358671e23ebb33a94cdd', '[\"*\"]', '2024-01-19 19:00:53', NULL, '2024-01-19 18:50:28', '2024-01-19 19:00:53'),
(130, 'App\\Models\\User', 16, 'auth-token', '43fc71a3ccbdfdff013f4e61a6f53a0d35868274593eb8d5473a899b175d635e', '[\"*\"]', '2024-01-19 19:10:17', NULL, '2024-01-19 19:01:14', '2024-01-19 19:10:17'),
(131, 'App\\Models\\User', 18, 'auth-token', '965687feb3b9d09d63eed6ef7d859ea1a74951b7e7d96f6270a43c62969d9bb6', '[\"*\"]', '2024-01-19 19:54:24', NULL, '2024-01-19 19:10:29', '2024-01-19 19:54:24'),
(132, 'App\\Models\\User', 26, 'auth-token', 'ecc2f474a1788fb61c2c538b99aa1d5c6f7558283dfd5351263a9551e9280b5e', '[\"*\"]', '2024-01-30 12:34:40', NULL, '2024-01-19 20:02:03', '2024-01-30 12:34:40'),
(133, 'App\\Models\\User', 18, 'auth-token', '5244ddc0fffdf4c2a7f187903d1ea9ee7f825eb1f7179a9eadcf2561077eaf44', '[\"*\"]', '2024-01-22 05:30:57', NULL, '2024-01-20 06:58:47', '2024-01-22 05:30:57'),
(134, 'App\\Models\\User', 2, 'auth-token', '1db09fc26428bc290a56eff9829e555127241e15b2ced9866c88c4e57ff09c33', '[\"*\"]', '2024-01-20 10:24:29', NULL, '2024-01-20 10:24:29', '2024-01-20 10:24:29'),
(135, 'App\\Models\\User', 27, 'auth-token', '42a1976dc5316257971844786e7d1c0ab035691c0a6f3342927ffae0e304d2f7', '[\"*\"]', NULL, NULL, '2024-01-20 11:14:41', '2024-01-20 11:14:41'),
(136, 'App\\Models\\User', 28, 'auth-token', '6a2cd31232a47308de017c529d218566bac7bdf490c5231a3f5b74d4f4617d0f', '[\"*\"]', '2024-01-20 12:46:28', NULL, '2024-01-20 12:31:18', '2024-01-20 12:46:28'),
(137, 'App\\Models\\User', 29, 'auth-token', 'f76b3f622af466a0e42d52554df4dd7bb38aa4cd99c135421eeb8800377af5bb', '[\"*\"]', '2024-01-23 15:55:58', NULL, '2024-01-20 12:41:08', '2024-01-23 15:55:58'),
(138, 'App\\Models\\User', 28, 'auth-token', 'c9a9209b241b74ca0ab52484a774fff2b10e16b861bbb2c529a88d1a3c73faf5', '[\"*\"]', '2024-01-20 15:39:06', NULL, '2024-01-20 12:47:14', '2024-01-20 15:39:06'),
(139, 'App\\Models\\User', 30, 'auth-token', 'e32af88852d1f53583d67c825591b81b76bfa9dd99e727917ac2d4e5c19dfad3', '[\"*\"]', '2024-01-24 18:23:33', NULL, '2024-01-20 12:48:58', '2024-01-24 18:23:33'),
(140, 'App\\Models\\User', 31, 'auth-token', 'c72b266552c21adb5c286ac0927964bd39e301bd7acd26f18af18b75fdda48db', '[\"*\"]', '2024-01-20 14:08:03', NULL, '2024-01-20 13:39:07', '2024-01-20 14:08:03'),
(141, 'App\\Models\\User', 32, 'auth-token', 'afe3f3f81519cd6836702b49d1a141fde26619daafc59e6244c424ec82d4092a', '[\"*\"]', '2024-01-20 14:06:54', NULL, '2024-01-20 13:41:35', '2024-01-20 14:06:54'),
(142, 'App\\Models\\User', 31, 'auth-token', '602ec354ec7b3c868784de8797a12fecebc267a1b895d9af7fb9a78be644ea99', '[\"*\"]', '2024-01-20 14:14:59', NULL, '2024-01-20 14:09:12', '2024-01-20 14:14:59'),
(143, 'App\\Models\\User', 32, 'auth-token', 'a48ab04268468763dc95809831801de58973202a7d4a43615f4708ddb580af04', '[\"*\"]', '2024-01-20 14:26:01', NULL, '2024-01-20 14:09:26', '2024-01-20 14:26:01'),
(144, 'App\\Models\\User', 31, 'auth-token', 'ada7bb4c5260171771d131739e51f7ac90db3c8155ba02ee791037a4c09a40ea', '[\"*\"]', '2024-01-20 14:34:32', NULL, '2024-01-20 14:26:24', '2024-01-20 14:34:32'),
(145, 'App\\Models\\User', 2, 'auth-token', 'f7a72326f70e4524494469a6114e9c986cba7cef60a2e4f4a7ee63591a26ede9', '[\"*\"]', '2024-01-20 14:30:13', NULL, '2024-01-20 14:30:00', '2024-01-20 14:30:13'),
(146, 'App\\Models\\User', 33, 'auth-token', '0ed8aa8fd54d94c3ed58d8e85b9ac28fef49a94560868faecb2200f0af99519d', '[\"*\"]', '2024-01-20 14:33:02', NULL, '2024-01-20 14:31:36', '2024-01-20 14:33:02'),
(147, 'App\\Models\\User', 34, 'auth-token', '744ffd9ef3812e1342d0904efd798a6bf382ff7f29d730cb0e15559b5e0067be', '[\"*\"]', '2024-02-07 14:36:20', NULL, '2024-01-20 14:42:50', '2024-02-07 14:36:20'),
(148, 'App\\Models\\User', 32, 'auth-token', '4b5e42795db0d686563be310d11121efc46d550bd1c660a9a380eaaba2958544', '[\"*\"]', '2024-01-23 15:55:37', NULL, '2024-01-20 14:58:36', '2024-01-23 15:55:37'),
(149, 'App\\Models\\User', 35, 'auth-token', 'a5d75d7bf3042000d0ff2964f2143e6ccf708d8a335ce7e417c94c4389477400', '[\"*\"]', '2024-01-31 17:30:48', NULL, '2024-01-20 17:55:59', '2024-01-31 17:30:48'),
(150, 'App\\Models\\User', 36, 'auth-token', 'd8f488dc34463899ba38abc6c22cde979ade677b23154613fe8748586a12450b', '[\"*\"]', '2024-01-21 23:25:03', NULL, '2024-01-21 23:24:10', '2024-01-21 23:25:03'),
(151, 'App\\Models\\User', 16, 'auth-token', '69aef8a596480b3803648df19299cda6b98cb0362c0607fa3adae3929cb2e9c2', '[\"*\"]', '2024-01-22 05:31:29', NULL, '2024-01-22 05:31:22', '2024-01-22 05:31:29'),
(152, 'App\\Models\\User', 16, 'auth-token', '30dfb2979099df3e66571e073ab23fdfba20a77063d4230ca479289b0c814af4', '[\"*\"]', '2024-01-22 05:39:25', NULL, '2024-01-22 05:31:56', '2024-01-22 05:39:25'),
(153, 'App\\Models\\User', 1, 'auth-token', '2d2b3a32d8a1ea9ede67b52c83543ff9c1f93cf87d39bed8ad058781e5366658', '[\"*\"]', '2024-01-22 10:13:52', NULL, '2024-01-22 09:16:27', '2024-01-22 10:13:52'),
(154, 'App\\Models\\User', 7, 'auth-token', 'e9b51a41a4053058b3f5e1786864509d45ebd4c48e820f5ec7048b421bab0af6', '[\"*\"]', '2024-02-06 08:32:05', NULL, '2024-01-22 10:14:01', '2024-02-06 08:32:05'),
(155, 'App\\Models\\User', 1, 'auth-token', '25d0c81506b46de3700b47a92c443a1369f68ca888948a99a0d6fa12fdc8b6d9', '[\"*\"]', '2024-01-22 12:24:35', NULL, '2024-01-22 11:00:33', '2024-01-22 12:24:35'),
(156, 'App\\Models\\User', 16, 'auth-token', 'cd1d2f4bf3095422de7823df2193b1e67a4dffbb9c43d9fcced7136392b35018', '[\"*\"]', '2024-01-22 11:10:26', NULL, '2024-01-22 11:09:02', '2024-01-22 11:10:26'),
(157, 'App\\Models\\User', 24, 'auth-token', 'd1dffb2cba78d29de86d1ba5d37bcb8c04e5d1ed710fad17b934ab496b73e021', '[\"*\"]', NULL, NULL, '2024-01-22 11:09:04', '2024-01-22 11:09:04'),
(158, 'App\\Models\\User', 16, 'auth-token', 'f667c41c23392d19338ec75b37f031a599ef80d2f0cf3e935d4e38042fa792f0', '[\"*\"]', NULL, NULL, '2024-01-22 11:09:05', '2024-01-22 11:09:05'),
(159, 'App\\Models\\User', 37, 'auth-token', '7cf1be6efddd66b5b392348574cee9cafe3b7e9b3ff1e704911bf787c7b9bc0c', '[\"*\"]', '2024-02-06 16:57:37', NULL, '2024-01-22 11:36:34', '2024-02-06 16:57:37'),
(160, 'App\\Models\\User', 23, 'auth-token', '788cca0615548e98c19081c9e15c002444e321c013591b68505dd8caccc969e6', '[\"*\"]', '2024-01-22 13:27:10', NULL, '2024-01-22 11:37:04', '2024-01-22 13:27:10'),
(161, 'App\\Models\\User', 24, 'auth-token', '98407726d73ddedb5bdcb04173ceeb64cfddc5c0e14a9d60951b38e0e9fc1cf8', '[\"*\"]', '2024-01-22 12:36:35', NULL, '2024-01-22 11:56:21', '2024-01-22 12:36:35'),
(162, 'App\\Models\\User', 38, 'auth-token', 'd9aab43d2f8dd7013e6b70e151bcb2ded041e21ec825e477e651769ff3b9537b', '[\"*\"]', '2024-01-25 10:47:42', NULL, '2024-01-22 12:23:09', '2024-01-25 10:47:42'),
(163, 'App\\Models\\User', 23, 'auth-token', '732373174ddca36d12e76145c6b99a253a69a8af499c8cfec31f95f10d07837e', '[\"*\"]', '2024-01-22 12:31:06', NULL, '2024-01-22 12:24:47', '2024-01-22 12:31:06'),
(164, 'App\\Models\\User', 16, 'auth-token', 'd6d6402b0d8971c96eaafdc16f9e4afdde385296ef9992792351450acd2d93d1', '[\"*\"]', '2024-01-22 12:38:48', NULL, '2024-01-22 12:31:21', '2024-01-22 12:38:48'),
(165, 'App\\Models\\User', 22, 'auth-token', 'd3b9437c9e281715825c016026bc508e8e45727fdba224b90c8fbdedb042ce03', '[\"*\"]', '2024-01-22 13:21:02', NULL, '2024-01-22 12:36:44', '2024-01-22 13:21:02'),
(166, 'App\\Models\\User', 18, 'auth-token', '4a504b3cbd5b67d7e5347beb516e53b39c6bf72d2ac58670f9e7bce9d9c8a2e3', '[\"*\"]', '2024-01-22 13:03:27', NULL, '2024-01-22 12:39:04', '2024-01-22 13:03:27'),
(167, 'App\\Models\\User', 22, 'auth-token', '4fa5cf2dbbd98ac10687c1a0d037d18bf14a55e413c29a2f575b63307bef7431', '[\"*\"]', '2024-01-22 13:05:41', NULL, '2024-01-22 13:05:28', '2024-01-22 13:05:41'),
(168, 'App\\Models\\User', 23, 'auth-token', '10b0eb86630722c7fbaa2953230e765677c4646e449cc21491ef9f14a9deb608', '[\"*\"]', '2024-01-22 15:32:24', NULL, '2024-01-22 13:05:55', '2024-01-22 15:32:24'),
(169, 'App\\Models\\User', 24, 'auth-token', '98cdc389e153188dbb6b9a60f1617c48f6e346a2d479672878ba3df4e2f806e2', '[\"*\"]', '2024-01-22 13:30:40', NULL, '2024-01-22 13:21:22', '2024-01-22 13:30:40'),
(170, 'App\\Models\\User', 22, 'auth-token', '61614bf7635ac4c3f3d28000be17ba275d23e57eca08caf80703c8fe9807b8f7', '[\"*\"]', '2024-01-22 13:39:32', NULL, '2024-01-22 13:30:11', '2024-01-22 13:39:32'),
(171, 'App\\Models\\User', 23, 'auth-token', '6707436f7452199a68f8816836eb7cdc86378053c3748ef3494d813a105c5e16', '[\"*\"]', '2024-01-22 16:28:20', NULL, '2024-01-22 15:13:37', '2024-01-22 16:28:20'),
(172, 'App\\Models\\User', 28, 'auth-token', '7a88ea677cb6593ce7b1d2e9858f925336cd1389a8af72746510174444b96012', '[\"*\"]', '2024-01-23 18:18:17', NULL, '2024-01-22 15:41:00', '2024-01-23 18:18:17'),
(173, 'App\\Models\\User', 22, 'auth-token', '6301f12b3e305f0b4caf907f720be76fe154121c0e6703461f0ef26a19ed971a', '[\"*\"]', '2024-01-22 16:53:50', NULL, '2024-01-22 15:58:33', '2024-01-22 16:53:50'),
(174, 'App\\Models\\User', 16, 'auth-token', 'ec8c61af8b3691bbc7f0c404944a6a94a14883ae2813126dc789aa2c965858e3', '[\"*\"]', '2024-01-22 16:05:45', NULL, '2024-01-22 15:59:16', '2024-01-22 16:05:45'),
(175, 'App\\Models\\User', 39, 'auth-token', '4cb48da686f7b54eee909f57aba766b7fa42ea0d5a92cb307da1fac960198f2e', '[\"*\"]', '2024-01-29 12:04:47', NULL, '2024-01-22 16:11:12', '2024-01-29 12:04:47'),
(176, 'App\\Models\\User', 16, 'auth-token', '3fb88c3f9e3a151c3b7a75e3aacb707630df9c0ea201fd82dbdcb376ce3c6303', '[\"*\"]', '2024-01-22 17:00:30', NULL, '2024-01-22 16:21:27', '2024-01-22 17:00:30'),
(177, 'App\\Models\\User', 18, 'auth-token', '7a776ee6f1c5e46958a27dab144146f2c2df639475a1bfa1f3ffdd3f8eec53f8', '[\"*\"]', '2024-01-22 17:54:19', NULL, '2024-01-22 16:40:12', '2024-01-22 17:54:19'),
(178, 'App\\Models\\User', 16, 'auth-token', '82109ec13827d727379515111494002cfdfb296a666ce58aef88abf925da95c9', '[\"*\"]', '2024-01-22 16:55:02', NULL, '2024-01-22 16:54:08', '2024-01-22 16:55:02'),
(179, 'App\\Models\\User', 14, 'auth-token', 'e73ea817811b6746581b9a0f4926c062e5e292639ac7a9151e90a8ac59aed0ca', '[\"*\"]', '2024-01-22 17:04:46', NULL, '2024-01-22 17:00:42', '2024-01-22 17:04:46'),
(180, 'App\\Models\\User', 18, 'auth-token', 'c3e1c19c17936bfb37eeee1085e921264f5bfc803bd003ce6a64dcb36ee3a699', '[\"*\"]', '2024-01-22 18:57:55', NULL, '2024-01-22 17:05:05', '2024-01-22 18:57:55'),
(181, 'App\\Models\\User', 2, 'auth-token', 'f701153d4c274492e168f9ccd7d48f90c68828e36804efcd3a56c1dbc010a91a', '[\"*\"]', '2024-01-23 10:26:05', NULL, '2024-01-22 17:46:02', '2024-01-23 10:26:05'),
(182, 'App\\Models\\User', 16, 'auth-token', '393a73242516e972bc83f8418214d0d22cbadf0e2d671cd079edaee9012b7969', '[\"*\"]', '2024-01-23 13:51:33', NULL, '2024-01-22 17:55:21', '2024-01-23 13:51:33'),
(183, 'App\\Models\\User', 40, 'auth-token', '273643396e22e68e45e2e5ea8ea2602a4912613562538d686812046a7ba9afd4', '[\"*\"]', '2024-02-04 15:06:40', NULL, '2024-01-22 18:47:50', '2024-02-04 15:06:40'),
(184, 'App\\Models\\User', 16, 'auth-token', '2fc0382cefa94d95fe558ab1e6d405ec1596b3150caa2b358611e80f33207311', '[\"*\"]', '2024-01-23 12:37:22', NULL, '2024-01-22 18:58:07', '2024-01-23 12:37:22'),
(185, 'App\\Models\\User', 41, 'auth-token', '3aef371ce69cd423502b2f9602e9851cc55460b72a990e68825570d1c6838f51', '[\"*\"]', '2024-02-03 22:04:26', NULL, '2024-01-22 19:00:40', '2024-02-03 22:04:26'),
(186, 'App\\Models\\User', 42, 'auth-token', 'c69595726a82f893ad9b18433f7cd4501b02322c737fe4ba99dcbbfb0829c03f', '[\"*\"]', '2024-01-22 20:11:37', NULL, '2024-01-22 20:01:47', '2024-01-22 20:11:37'),
(187, 'App\\Models\\User', 43, 'auth-token', '9b1153c4dafb68e3ea9813521d840c363c14b0f4893f38aac7ab872dbe96ba31', '[\"*\"]', '2024-01-27 18:48:15', NULL, '2024-01-22 20:04:10', '2024-01-27 18:48:15'),
(188, 'App\\Models\\User', 44, 'auth-token', 'f4a33215f0f19b7727d4dbc5d67af922154c9c40cd66315f5bb4803e4ae45b17', '[\"*\"]', '2024-02-04 00:05:25', NULL, '2024-01-22 21:32:24', '2024-02-04 00:05:25'),
(189, 'App\\Models\\User', 45, 'auth-token', '09ae18ffc7f0daf0ebfbc659d49de2a8ee1f98ff6e09561b24aed642664522a4', '[\"*\"]', '2024-02-06 22:09:43', NULL, '2024-01-22 21:49:10', '2024-02-06 22:09:43'),
(190, 'App\\Models\\User', 46, 'auth-token', 'cb7af4893a888d070dcfc4514d250b163f8370ddad560e83296f98ffe760a32d', '[\"*\"]', '2024-02-07 17:06:49', NULL, '2024-01-22 21:53:21', '2024-02-07 17:06:49'),
(191, 'App\\Models\\User', 47, 'auth-token', 'a508ea37ddb0709f0699cd9e26daa4bfaeb163d161fdef0f58cffa6e7a2b8a02', '[\"*\"]', '2024-01-22 22:32:13', NULL, '2024-01-22 22:29:12', '2024-01-22 22:32:13'),
(192, 'App\\Models\\User', 48, 'auth-token', '57e71c0a4e5d618ccd662f0e0604c31515f180341e3c19b4402fefe1a0ac5a54', '[\"*\"]', '2024-01-23 10:37:04', NULL, '2024-01-23 10:28:10', '2024-01-23 10:37:04'),
(193, 'App\\Models\\User', 49, 'auth-token', '1df20f4bc176a640452135b23e293347e81a0727ee0b53969902cf0721d69c72', '[\"*\"]', '2024-01-28 19:21:23', NULL, '2024-01-23 10:32:03', '2024-01-28 19:21:23'),
(194, 'App\\Models\\User', 2, 'auth-token', '13b96bd88b5351aeeef73cbd7becef4fa8742052db06708a53f25ebc9c2e30ab', '[\"*\"]', '2024-01-23 10:56:33', NULL, '2024-01-23 10:56:30', '2024-01-23 10:56:33'),
(195, 'App\\Models\\User', 48, 'auth-token', 'ceb215a84f22ea5be292c372a26dde08a6bd2f1b38732f07a7aae86cf13c7142', '[\"*\"]', '2024-01-23 12:10:29', NULL, '2024-01-23 11:37:38', '2024-01-23 12:10:29'),
(196, 'App\\Models\\User', 50, 'auth-token', '391252dd7e2ae8372e68de7659a0ffda925a6974697987262a3ce6ecf6f035f5', '[\"*\"]', '2024-01-30 14:21:35', NULL, '2024-01-23 12:08:22', '2024-01-30 14:21:35'),
(197, 'App\\Models\\User', 48, 'auth-token', 'd5b50248df378407fcea2d7d75abcd1c4b03c62c2c0e9cab86737fbdef314de7', '[\"*\"]', '2024-01-23 13:56:19', NULL, '2024-01-23 12:30:05', '2024-01-23 13:56:19'),
(198, 'App\\Models\\User', 16, 'auth-token', '97a4a7eb12a6443044cc0f5cc1717d89c3607d1bfc8ce33dc9b47e64a5095a9c', '[\"*\"]', '2024-01-23 15:28:58', NULL, '2024-01-23 13:34:57', '2024-01-23 15:28:58'),
(199, 'App\\Models\\User', 2, 'auth-token', '1f24cbb6c5b50632c54864e133aa453e9fbf7596512cec5e369d74f4b2bc2343', '[\"*\"]', '2024-01-24 11:41:40', NULL, '2024-01-23 13:56:42', '2024-01-24 11:41:40'),
(200, 'App\\Models\\User', 51, 'auth-token', '2587f1c5a11ab9fab7a6253741597f088748f84e95eb15235fa1d6ed10c8fb6f', '[\"*\"]', '2024-02-07 11:51:15', NULL, '2024-01-23 14:17:16', '2024-02-07 11:51:15'),
(201, 'App\\Models\\User', 52, 'auth-token', '30f839f7cff062e27c68d7f4d6955c40b341eea647c5031facf710f1e7f2d258', '[\"*\"]', '2024-02-07 17:08:34', NULL, '2024-01-23 14:42:17', '2024-02-07 17:08:34'),
(202, 'App\\Models\\User', 53, 'auth-token', 'a2be1f6363012fc713fc548ced22d40b03570a3d337f88a7fe7b03418bbf57ce', '[\"*\"]', '2024-01-23 15:59:57', NULL, '2024-01-23 15:57:01', '2024-01-23 15:59:57'),
(203, 'App\\Models\\User', 53, 'auth-token', '150776e83f7680c4c6c834f5095b25876b1a884afa52ee37c369c0f4b36a2261', '[\"*\"]', '2024-01-23 18:51:55', NULL, '2024-01-23 16:04:46', '2024-01-23 18:51:55'),
(204, 'App\\Models\\User', 16, 'auth-token', '31a449a3a56e17ee66c61eff0432052e4f75059aabcc3bd9de6b17aa98929021', '[\"*\"]', '2024-01-23 16:26:06', NULL, '2024-01-23 16:26:05', '2024-01-23 16:26:06'),
(205, 'App\\Models\\User', 16, 'auth-token', 'd89cad9b18affa2321451c790bd44371377db5a6afe24df026360696515ba1db', '[\"*\"]', '2024-01-23 16:54:36', NULL, '2024-01-23 16:36:57', '2024-01-23 16:54:36'),
(206, 'App\\Models\\User', 54, 'auth-token', 'b31f7bced7345c6c997ac67bb8bd50b15b6fff9d917c65b5b712e02dacd865f7', '[\"*\"]', '2024-02-06 22:56:51', NULL, '2024-01-23 16:57:08', '2024-02-06 22:56:51'),
(207, 'App\\Models\\User', 16, 'auth-token', '4cbed8d022bb7a5bf02436c8801b3c62df3c3de2d357bc1000c7cbd2364f3a6c', '[\"*\"]', '2024-01-23 17:01:27', NULL, '2024-01-23 16:57:28', '2024-01-23 17:01:27'),
(208, 'App\\Models\\User', 1, 'auth-token', '9edac4bb7be87a5d382d0c86101db69e781a1b0a20757d1c3c963f6369dc27b7', '[\"*\"]', '2024-01-23 17:17:49', NULL, '2024-01-23 17:17:27', '2024-01-23 17:17:49'),
(209, 'App\\Models\\User', 1, 'auth-token', 'f5c3a21de94b98f5430bc1adb3508119fa6daa74ac95154e5edfc5c358b7cc3c', '[\"*\"]', '2024-01-23 17:20:29', NULL, '2024-01-23 17:19:49', '2024-01-23 17:20:29'),
(210, 'App\\Models\\User', 16, 'auth-token', '02dc7d94d0ddd4cc9678fd9aa23d4f5f5b96c0abe28409bd4aa547d33ad5ed24', '[\"*\"]', '2024-01-23 18:52:51', NULL, '2024-01-23 17:51:23', '2024-01-23 18:52:51'),
(211, 'App\\Models\\User', 16, 'auth-token', '98e4515ec04b7d98e448b8ee35a03a24c9369fafe7b9f6f368f2133413b52c3c', '[\"*\"]', '2024-01-23 17:55:53', NULL, '2024-01-23 17:55:52', '2024-01-23 17:55:53'),
(212, 'App\\Models\\User', 16, 'auth-token', '8e82039903f297c3795dc69a7fb0ad7de9748615f1fae81c716f05f696ef9795', '[\"*\"]', '2024-01-23 18:05:23', NULL, '2024-01-23 18:05:09', '2024-01-23 18:05:23'),
(213, 'App\\Models\\User', 55, 'auth-token', 'b27780df86050e5fa220aba373a709612d5c1385611deff9c1850cd53081d291', '[\"*\"]', '2024-01-24 16:35:58', NULL, '2024-01-23 18:19:09', '2024-01-24 16:35:58'),
(214, 'App\\Models\\User', 1, 'auth-token', '85162e49e4404de1017098e12173ac856a0e2d8fb79fa4c4f7e5115065e1797a', '[\"*\"]', '2024-01-23 18:22:32', NULL, '2024-01-23 18:22:31', '2024-01-23 18:22:32'),
(215, 'App\\Models\\User', 32, 'auth-token', 'ff390738fbd6c9f6dfddeea69b3dd5786a1c82395b6e97001065cca5e79364aa', '[\"*\"]', '2024-01-24 07:16:55', NULL, '2024-01-23 18:52:27', '2024-01-24 07:16:55'),
(216, 'App\\Models\\User', 16, 'auth-token', '736beb113f44693f9d75cafa43ab37710fc7f2ce7df7d501c45d1b2bd41c08e8', '[\"*\"]', '2024-01-23 19:04:20', NULL, '2024-01-23 18:54:56', '2024-01-23 19:04:20'),
(217, 'App\\Models\\User', 16, 'auth-token', '5889196637d4cf46f7b05c0b45ec28fab3c4ea94a720aec25aa0d8bf8e71ec73', '[\"*\"]', '2024-01-23 19:57:44', NULL, '2024-01-23 19:57:21', '2024-01-23 19:57:44'),
(218, 'App\\Models\\User', 56, 'auth-token', '188e36bbb0e95b5bbf978a3dd6802dc7b457a0ff47585f46a941bfa849fea112', '[\"*\"]', '2024-01-23 22:33:38', NULL, '2024-01-23 22:30:40', '2024-01-23 22:33:38'),
(219, 'App\\Models\\User', 57, 'auth-token', 'fc44c4eb3eb717173e1da81328304a77b94b6e872b96ff60508c6ca771bfec39', '[\"*\"]', '2024-01-23 23:47:30', NULL, '2024-01-23 23:46:42', '2024-01-23 23:47:30'),
(220, 'App\\Models\\User', 58, 'auth-token', '43bcbe94b25e77a728c9f7d08d95b10bf61011c9f8725a4717af16e31cf2a0df', '[\"*\"]', '2024-01-24 00:09:28', NULL, '2024-01-23 23:50:58', '2024-01-24 00:09:28'),
(221, 'App\\Models\\User', 57, 'auth-token', '8051f5d481c7de4ea6c5461d4f83c95ce59d4bf6927ec6ed43cec4baa4757907', '[\"*\"]', '2024-01-24 00:10:51', NULL, '2024-01-24 00:10:46', '2024-01-24 00:10:51'),
(222, 'App\\Models\\User', 58, 'auth-token', '0e36abd02de7ef90bf73a2e4045e7e1ca8cb1efe27bb3ba332a88831254a5969', '[\"*\"]', '2024-01-24 00:42:36', NULL, '2024-01-24 00:11:12', '2024-01-24 00:42:36'),
(223, 'App\\Models\\User', 8, 'auth-token', '0438dcc217c9f0154f88087ea852334eeffb40fd2891c404f35e015526525f06', '[\"*\"]', '2024-01-24 00:47:42', NULL, '2024-01-24 00:38:06', '2024-01-24 00:47:42'),
(224, 'App\\Models\\User', 57, 'auth-token', '3eb9ae35dc49f9b0f95951de03e71b947c863b05174fb14aeb4aba3d5b6e5ea5', '[\"*\"]', '2024-01-24 00:43:41', NULL, '2024-01-24 00:43:09', '2024-01-24 00:43:41'),
(225, 'App\\Models\\User', 59, 'auth-token', 'aa5f31c3dcc5d687c506361f5b970c4f56faf14d962ef3b61680b526c8396449', '[\"*\"]', '2024-01-24 00:54:16', NULL, '2024-01-24 00:48:15', '2024-01-24 00:54:16'),
(226, 'App\\Models\\User', 60, 'auth-token', 'ef5ef2d13c995f88dff01cc0263a8ab7392f693c1d6bf3914be8bea2e00d79ca', '[\"*\"]', '2024-01-24 15:05:29', NULL, '2024-01-24 00:55:22', '2024-01-24 15:05:29'),
(227, 'App\\Models\\User', 53, 'auth-token', '20c4ca8a34d84eeb64a61df106c983de19269e9ba07ecd7c099da955ddcaaa93', '[\"*\"]', '2024-01-24 07:18:20', NULL, '2024-01-24 07:17:07', '2024-01-24 07:18:20'),
(228, 'App\\Models\\User', 32, 'auth-token', '4b3a1a31f1f78898cdd656b9403bd7453eca2f117144e87352a5818617a8e37f', '[\"*\"]', '2024-01-24 17:08:06', NULL, '2024-01-24 07:18:41', '2024-01-24 17:08:06'),
(229, 'App\\Models\\User', 16, 'auth-token', '010597f675b989abcb83e1a5e96df51eb367bd26a1ec7c2c0fad8c329f877a56', '[\"*\"]', '2024-01-24 10:08:58', NULL, '2024-01-24 10:08:42', '2024-01-24 10:08:58'),
(230, 'App\\Models\\User', 24, 'auth-token', 'a7cb45399a1999f071ead2554bd5be6e4282abee8d1cce66333a3b790a5bcfae', '[\"*\"]', '2024-01-24 10:20:38', NULL, '2024-01-24 10:19:59', '2024-01-24 10:20:38'),
(231, 'App\\Models\\User', 16, 'auth-token', '35cadeb735f641e771cf950f4164424ac299672bbda3b128735b358fc53faff1', '[\"*\"]', '2024-01-24 10:20:55', NULL, '2024-01-24 10:20:53', '2024-01-24 10:20:55'),
(232, 'App\\Models\\User', 1, 'auth-token', '2c934951fc0f6cdbcd39d47ce6a66260cd546cee54adee910f22f7c34d9f7d5c', '[\"*\"]', '2024-01-24 10:21:26', NULL, '2024-01-24 10:21:21', '2024-01-24 10:21:26'),
(233, 'App\\Models\\User', 25, 'auth-token', 'e0077fc66182509d48616ce786364bb898342dd732b642ef460f7e50c04a09a0', '[\"*\"]', '2024-01-24 10:25:19', NULL, '2024-01-24 10:23:03', '2024-01-24 10:25:19'),
(234, 'App\\Models\\User', 1, 'auth-token', 'fcb2f88c1485e959a2c2498f342ca316faa4d08b41e659a6542436bcdfa1e25d', '[\"*\"]', '2024-01-24 10:25:31', NULL, '2024-01-24 10:25:30', '2024-01-24 10:25:31'),
(235, 'App\\Models\\User', 48, 'auth-token', '73e37664f14bd8afcd3dc6c30be3672326e4a8334bd1b0c398819327e0f60783', '[\"*\"]', '2024-01-24 15:23:40', NULL, '2024-01-24 11:41:55', '2024-01-24 15:23:40'),
(236, 'App\\Models\\User', 1, 'auth-token', '264053f32210001aacc543e2c91c498ab847432c79fd3ccf27eb11d2a66e1262', '[\"*\"]', '2024-01-24 13:38:26', NULL, '2024-01-24 13:38:11', '2024-01-24 13:38:26'),
(237, 'App\\Models\\User', 18, 'auth-token', '5275a2644477bd4202345df6658ed06851dc9f1c5d8ba32deb0d22968619c8ba', '[\"*\"]', '2024-01-25 11:42:48', NULL, '2024-01-24 13:39:08', '2024-01-25 11:42:48'),
(238, 'App\\Models\\User', 8, 'auth-token', 'faf9def265a50815c1163b505e1429dedfcc1ae043dc78021b5b461425117b19', '[\"*\"]', '2024-02-06 08:49:23', NULL, '2024-01-24 15:06:11', '2024-02-06 08:49:23'),
(239, 'App\\Models\\User', 2, 'auth-token', 'b3fcf009ce4128e8c0bf9abcb46244409f799d9a4a4ccfb231b955950fb37e0e', '[\"*\"]', '2024-01-24 16:33:35', NULL, '2024-01-24 15:24:04', '2024-01-24 16:33:35'),
(240, 'App\\Models\\User', 57, 'auth-token', '31c1a74b763cea2ab689f37f288097554cbc39b30f1ee42f480f30d98966f956', '[\"*\"]', '2024-01-24 16:24:13', NULL, '2024-01-24 16:24:13', '2024-01-24 16:24:13'),
(241, 'App\\Models\\User', 58, 'auth-token', 'f8355898488f3f7aaf03d33620430e9e47b5e252bd676ec1f3c634a9d3f5de1d', '[\"*\"]', '2024-01-24 16:24:36', NULL, '2024-01-24 16:24:35', '2024-01-24 16:24:36'),
(242, 'App\\Models\\User', 48, 'auth-token', '525a42efd84b1330825271baba632ce9b4553c859ffe38cd1878c8fcb15574e4', '[\"*\"]', '2024-01-24 16:34:25', NULL, '2024-01-24 16:34:00', '2024-01-24 16:34:25'),
(243, 'App\\Models\\User', 2, 'auth-token', '413fdc9a71e0f37175ca3653739e15c17d38d148f20ddb5ba105833987063059', '[\"*\"]', '2024-01-24 16:34:42', NULL, '2024-01-24 16:34:35', '2024-01-24 16:34:42'),
(244, 'App\\Models\\User', 48, 'auth-token', 'f941f551bda8315585977c5867beddc541789df9980c3c01c35e6e3d05f4b2a6', '[\"*\"]', '2024-01-24 16:49:08', NULL, '2024-01-24 16:35:30', '2024-01-24 16:49:08'),
(245, 'App\\Models\\User', 2, 'auth-token', '21e6641b13f05a094a4ae68f43ac22baed56af92d8b46b2d9f0f74a70460e035', '[\"*\"]', '2024-01-24 17:02:22', NULL, '2024-01-24 16:49:18', '2024-01-24 17:02:22'),
(246, 'App\\Models\\User', 1, 'auth-token', 'b444e08795811bb31f05f5859414a28f33ddd80a1af02ac83c2faff66d416856', '[\"*\"]', '2024-01-25 11:08:37', NULL, '2024-01-24 16:52:08', '2024-01-25 11:08:37'),
(247, 'App\\Models\\User', 57, 'auth-token', 'b11dc28ac94327f5ce878a21e0e54ccfd720f756b3c8a6c783797ecd31b83d42', '[\"*\"]', '2024-01-25 18:52:31', NULL, '2024-01-24 16:59:38', '2024-01-25 18:52:31'),
(248, 'App\\Models\\User', 48, 'auth-token', '427db651c60194460e39d403fb81894e82ae5585d0115494e5c54288eea99d19', '[\"*\"]', '2024-01-24 17:04:07', NULL, '2024-01-24 17:03:32', '2024-01-24 17:04:07'),
(249, 'App\\Models\\User', 53, 'auth-token', '730f809e4bbd193d14c71cb2f68706f4f2d441ff2b8d2f4647af8ec2e4a65289', '[\"*\"]', '2024-01-24 17:11:40', NULL, '2024-01-24 17:08:18', '2024-01-24 17:11:40'),
(250, 'App\\Models\\User', 32, 'auth-token', '572d967918db377279b0021497fcd12bcd814080823e8b2012b8a9837dd98733', '[\"*\"]', '2024-01-25 07:47:05', NULL, '2024-01-24 17:12:02', '2024-01-25 07:47:05'),
(251, 'App\\Models\\User', 61, 'auth-token', 'f3a93be56f31d9eff89dd7f96ff461fa26f8a40a18eabf45fc75c4b38a479555', '[\"*\"]', '2024-02-07 07:14:09', NULL, '2024-01-24 20:06:43', '2024-02-07 07:14:09'),
(252, 'App\\Models\\User', 62, 'auth-token', '49184b113d9a7f5191800d37228d200c305eaa9ecff2c89951d41a377fcd73a3', '[\"*\"]', '2024-01-25 10:51:05', NULL, '2024-01-24 20:30:24', '2024-01-25 10:51:05'),
(253, 'App\\Models\\User', 2, 'auth-token', '59a12964d6dc82738b8e4e65b0c67cfd91c1f9ec647720975a4abf999a932494', '[\"*\"]', '2024-01-25 11:57:02', NULL, '2024-01-24 20:48:19', '2024-01-25 11:57:02');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(254, 'App\\Models\\User', 63, 'auth-token', '93b907b6f8ae0b55f00666a7c50d979c5af2f2eb3de70ba4b3deea9f0da119f2', '[\"*\"]', '2024-01-30 17:32:32', NULL, '2024-01-24 20:50:16', '2024-01-30 17:32:32'),
(255, 'App\\Models\\User', 64, 'auth-token', 'fd5d39eacfda13477e9769462c595112db63712938679e69116555ce211e5362', '[\"*\"]', '2024-02-03 22:12:07', NULL, '2024-01-24 22:38:01', '2024-02-03 22:12:07'),
(256, 'App\\Models\\User', 53, 'auth-token', '8e36bd61749fd8e56cc009c085fc12ff1d111477ac5e78ea6c09fcaa767d4ae1', '[\"*\"]', '2024-01-25 07:47:41', NULL, '2024-01-25 07:47:23', '2024-01-25 07:47:41'),
(257, 'App\\Models\\User', 32, 'auth-token', 'a5a9c6f0635a8edec4f7ffabbaa077d0ca7880324c06e70178ecbd41be0ccaee', '[\"*\"]', '2024-01-26 10:21:47', NULL, '2024-01-25 07:48:01', '2024-01-26 10:21:47'),
(258, 'App\\Models\\User', 65, 'auth-token', '501d4d78cbcd823cdbf7b9899af3275b8c868454c9ce029de3b68d6221ecdd2e', '[\"*\"]', '2024-01-25 08:15:24', NULL, '2024-01-25 08:13:21', '2024-01-25 08:15:24'),
(259, 'App\\Models\\User', 48, 'auth-token', '75368d5716cd188c32f18c2160bf3726e64cfae515090885868342990863aac7', '[\"*\"]', '2024-01-25 12:08:34', NULL, '2024-01-25 11:57:12', '2024-01-25 12:08:34'),
(260, 'App\\Models\\User', 2, 'auth-token', 'e19aa53600ab224d4b87db1207874c3a4bbedeb24ed985e2e0ddaadfa1d3981e', '[\"*\"]', '2024-01-25 16:30:50', NULL, '2024-01-25 12:08:44', '2024-01-25 16:30:50'),
(261, 'App\\Models\\User', 66, 'auth-token', '8bada4dc75b42a8e3433e6c14d0227377783bb198eac190390abde2d4863aaa1', '[\"*\"]', '2024-02-01 14:23:17', NULL, '2024-01-25 13:40:21', '2024-02-01 14:23:17'),
(262, 'App\\Models\\User', 23, 'auth-token', '1177072665ab4d0b51cdf358a9fc7c01b6fa878a3420d0a01e4f988be6904116', '[\"*\"]', '2024-01-25 15:47:11', NULL, '2024-01-25 15:28:06', '2024-01-25 15:47:11'),
(263, 'App\\Models\\User', 67, 'auth-token', '1b527921da1a82e28e30975df8b067e6bc0986f02ffc24377a89e4af51c32e22', '[\"*\"]', '2024-01-25 17:10:12', NULL, '2024-01-25 16:57:11', '2024-01-25 17:10:12'),
(264, 'App\\Models\\User', 68, 'auth-token', '86ac2637fe5feb4b1df5650712227ab453af85d976e17dd6a32dc72c09c602a9', '[\"*\"]', '2024-01-30 17:31:27', NULL, '2024-01-25 17:20:35', '2024-01-30 17:31:27'),
(265, 'App\\Models\\User', 69, 'auth-token', '8b339ce7c2d9cd488b4a31d1c33128b094e0544876bf6c8440fcdbe99368ff06', '[\"*\"]', '2024-02-01 09:31:14', NULL, '2024-01-25 18:47:14', '2024-02-01 09:31:14'),
(266, 'App\\Models\\User', 70, 'auth-token', 'e329b873c01e666da0efcc01b690f16304b3d5d88cb6b865839f8c4bfb4740bb', '[\"*\"]', '2024-01-26 22:41:07', NULL, '2024-01-25 19:10:12', '2024-01-26 22:41:07'),
(267, 'App\\Models\\User', 71, 'auth-token', '93fbfd2e4c99b6550c101c6a5c3505b43209a31d81836abbc1d7dab2959713f9', '[\"*\"]', '2024-01-25 23:09:40', NULL, '2024-01-25 22:38:14', '2024-01-25 23:09:40'),
(268, 'App\\Models\\User', 72, 'auth-token', '175bf3ce1f206be70ba5ae0e9469e2634a975cdedd9f829e9fc71968a7c25a4f', '[\"*\"]', '2024-02-04 10:59:51', NULL, '2024-01-26 09:35:52', '2024-02-04 10:59:51'),
(269, 'App\\Models\\User', 53, 'auth-token', 'a64d4eadc7d1af00561a24adf65b35040452dfdfadbd25cd6a124c384930b4c8', '[\"*\"]', '2024-01-26 10:24:37', NULL, '2024-01-26 10:22:03', '2024-01-26 10:24:37'),
(270, 'App\\Models\\User', 32, 'auth-token', '093eea3063f4fe4937aada0d8995e1744c662a8eb0c9a4422f4b6dab1de7ed12', '[\"*\"]', '2024-01-26 18:11:40', NULL, '2024-01-26 10:24:59', '2024-01-26 18:11:40'),
(271, 'App\\Models\\User', 73, 'auth-token', 'f51d5bf4774acc24b2a295fd925bbb3c5077d121a21c032af45b7cf794963c6d', '[\"*\"]', '2024-01-26 14:14:53', NULL, '2024-01-26 14:09:52', '2024-01-26 14:14:53'),
(272, 'App\\Models\\User', 53, 'auth-token', '721699c73e86140f628d709138c5fb4c76ddda1c48723e4c72469eb6f1472504', '[\"*\"]', '2024-01-26 18:12:20', NULL, '2024-01-26 18:11:51', '2024-01-26 18:12:20'),
(273, 'App\\Models\\User', 32, 'auth-token', 'd3ae666ce2609a726412b7dfac2a1b528fb45c716c652d8f4fe5def7d35d45b1', '[\"*\"]', '2024-01-29 14:35:43', NULL, '2024-01-26 18:12:39', '2024-01-29 14:35:43'),
(274, 'App\\Models\\User', 55, 'auth-token', '0b061ab462b132bccb1743e2c4c8a9a3ef5d0ff2acacddad66c130a57ad627ac', '[\"*\"]', '2024-01-27 13:46:15', NULL, '2024-01-27 13:41:46', '2024-01-27 13:46:15'),
(275, 'App\\Models\\User', 74, 'auth-token', 'd866d7376ab381a1d61d77f01d96484b3a5e24ef910356ae95529db4e7e40c2c', '[\"*\"]', '2024-02-06 10:20:51', NULL, '2024-01-27 14:10:34', '2024-02-06 10:20:51'),
(276, 'App\\Models\\User', 75, 'auth-token', '78a277f67ff8021b3a15a6c41a795c3127bf773123171ebea80b55fb4d172bda', '[\"*\"]', '2024-01-27 17:06:11', NULL, '2024-01-27 16:25:49', '2024-01-27 17:06:11'),
(277, 'App\\Models\\User', 76, 'auth-token', '236a49308050b6cb598047c0c6496aa9d84919639d9a740c741f2e82d35d2170', '[\"*\"]', '2024-01-27 16:26:37', NULL, '2024-01-27 16:26:37', '2024-01-27 16:26:37'),
(278, 'App\\Models\\User', 75, 'auth-token', '483418a067473e8edd43e53cf6e1733b22ebb4ddc36720f3d888b793424bca12', '[\"*\"]', '2024-01-28 16:15:33', NULL, '2024-01-27 17:06:47', '2024-01-28 16:15:33'),
(279, 'App\\Models\\User', 77, 'auth-token', '562d72904c06095c5316dce631ac75af85c91e9efe4de376f89edbdb17d0ba7d', '[\"*\"]', '2024-02-05 16:46:46', NULL, '2024-01-27 18:00:05', '2024-02-05 16:46:46'),
(280, 'App\\Models\\User', 78, 'auth-token', 'c3ae057d05ce3216e0faa87ba96134f588e181e263d863c7903d1280757671c6', '[\"*\"]', '2024-01-27 18:38:29', NULL, '2024-01-27 18:34:53', '2024-01-27 18:38:29'),
(281, 'App\\Models\\User', 79, 'auth-token', '32ee18be9e4bd39b1ac8a2a913da5b4f3a5ab94a44810a005da996746bfac9e8', '[\"*\"]', '2024-01-27 20:19:48', NULL, '2024-01-27 20:18:41', '2024-01-27 20:19:48'),
(282, 'App\\Models\\User', 80, 'auth-token', 'fcaa29b9d25ffb27bfd41aab4b4e27d57e7bbf6d8352f8155ffbfdf1102e0c19', '[\"*\"]', '2024-01-27 20:33:17', NULL, '2024-01-27 20:32:49', '2024-01-27 20:33:17'),
(283, 'App\\Models\\User', 81, 'auth-token', '527e36539c82cf0c3ce6c192e1abcb45855cbd035364048e5c8f916af957cb46', '[\"*\"]', '2024-01-27 22:27:39', NULL, '2024-01-27 22:21:20', '2024-01-27 22:27:39'),
(284, 'App\\Models\\User', 81, 'auth-token', '345b009934ab2e9622b15ca6e8819f0ef5eb77a3e5804786919d7795e42e1540', '[\"*\"]', '2024-01-28 10:58:29', NULL, '2024-01-27 22:38:08', '2024-01-28 10:58:29'),
(285, 'App\\Models\\User', 82, 'auth-token', '6df0a15f8d134cecf66f202b0c43029129427eddd3217754e0ad4290f451fd99', '[\"*\"]', '2024-01-28 11:47:40', NULL, '2024-01-28 11:02:03', '2024-01-28 11:47:40'),
(286, 'App\\Models\\User', 83, 'auth-token', '6f5c9eb21afda8654651d2cb86f053293c84a9724b1ffd52376d467b6207628f', '[\"*\"]', '2024-01-28 11:52:37', NULL, '2024-01-28 11:48:42', '2024-01-28 11:52:37'),
(287, 'App\\Models\\User', 82, 'auth-token', 'f75ac5de10e1ec8a3f272c01383187dbba57dc5218f6844cc486cd39c24b6d86', '[\"*\"]', '2024-01-28 11:54:14', NULL, '2024-01-28 11:52:51', '2024-01-28 11:54:14'),
(288, 'App\\Models\\User', 83, 'auth-token', '7e2c9cc73b96f39d307370ce9a62e7d71c10b1784dfb1d6b54067b198073692f', '[\"*\"]', '2024-01-28 11:56:20', NULL, '2024-01-28 11:54:28', '2024-01-28 11:56:20'),
(289, 'App\\Models\\User', 82, 'auth-token', 'fd5dd53bfb08e4829eb8d1870d993b2dd0c16430720413143c38f23ad9eb710c', '[\"*\"]', '2024-01-28 11:57:35', NULL, '2024-01-28 11:57:01', '2024-01-28 11:57:35'),
(290, 'App\\Models\\User', 83, 'auth-token', '557fe1720953974dc173bfa136a3270d825fc481430bb18057d8102bbf40c3fd', '[\"*\"]', '2024-01-28 14:15:56', NULL, '2024-01-28 11:57:50', '2024-01-28 14:15:56'),
(291, 'App\\Models\\User', 83, 'auth-token', '4df7a3e236a76b70c387617ba1044207b3bdaaa5dcf2612f83b06b91a1fd26df', '[\"*\"]', '2024-01-28 14:17:13', NULL, '2024-01-28 14:16:08', '2024-01-28 14:17:13'),
(292, 'App\\Models\\User', 82, 'auth-token', '780ff5f540e6077e4ea52c401582a5ecdc73191adbbe7d6f8880f9121bdd0c74', '[\"*\"]', '2024-01-28 14:37:55', NULL, '2024-01-28 14:37:54', '2024-01-28 14:37:55'),
(293, 'App\\Models\\User', 81, 'auth-token', '25d9d9906f33615041b7e6b0be017a8539dfdea34677db454463ac8c6af7e0c4', '[\"*\"]', '2024-01-28 14:52:11', NULL, '2024-01-28 14:44:55', '2024-01-28 14:52:11'),
(294, 'App\\Models\\User', 83, 'auth-token', '8458f11371dd7707eb11f8a94183141fdc2a60c234f422f8f892074e147245f1', '[\"*\"]', '2024-01-28 15:42:23', NULL, '2024-01-28 14:52:43', '2024-01-28 15:42:23'),
(295, 'App\\Models\\User', 84, 'auth-token', 'ecf715aa32b9b970aa00f13cdb2959c0606f72921457b6b20c14c2516b7288bb', '[\"*\"]', '2024-01-28 15:26:52', NULL, '2024-01-28 15:25:52', '2024-01-28 15:26:52'),
(296, 'App\\Models\\User', 85, 'auth-token', 'f515038073750e75c7bd8395046db937b8c2d0112dc3622b382daa0d20aa29a1', '[\"*\"]', '2024-01-28 15:45:03', NULL, '2024-01-28 15:44:13', '2024-01-28 15:45:03'),
(297, 'App\\Models\\User', 85, 'auth-token', '7ebcdc275ba5b08b8c91e711de2d2ca85768218d38b5f1f744ad3a359ba3d90f', '[\"*\"]', '2024-01-28 17:07:01', NULL, '2024-01-28 15:46:55', '2024-01-28 17:07:01'),
(298, 'App\\Models\\User', 83, 'auth-token', '2fd79d5fbb6d5db1b1bb2bf1715655242eba91262672884faa2ed5bee0d713cd', '[\"*\"]', '2024-01-28 17:08:20', NULL, '2024-01-28 17:07:19', '2024-01-28 17:08:20'),
(299, 'App\\Models\\User', 82, 'auth-token', '7c46b1a846966516521977de178fc0c6da0049f6b57429b469677c4219fba898', '[\"*\"]', '2024-01-28 17:11:21', NULL, '2024-01-28 17:08:37', '2024-01-28 17:11:21'),
(300, 'App\\Models\\User', 81, 'auth-token', '74e74bc58855a1e55683a661cffe08b73eba1e95a622a4cc46ec83f3dc800d6b', '[\"*\"]', '2024-01-28 17:13:58', NULL, '2024-01-28 17:11:56', '2024-01-28 17:13:58'),
(301, 'App\\Models\\User', 83, 'auth-token', '1c1de0fa9e93ddba5ab1aa64ca9876e326951d045395738ae9ea8a0b3ff72387', '[\"*\"]', '2024-01-28 17:15:07', NULL, '2024-01-28 17:14:38', '2024-01-28 17:15:07'),
(302, 'App\\Models\\User', 81, 'auth-token', '0005303baccfd51220afe4346ea1fb059ccc175ac68369f63002a74d4bb6a0b8', '[\"*\"]', '2024-01-28 17:17:59', NULL, '2024-01-28 17:15:26', '2024-01-28 17:17:59'),
(303, 'App\\Models\\User', 83, 'auth-token', '3c6905c23286dbe580acaacfddc03b7cf3264be9306d6002ebbeed7a0e4a96c3', '[\"*\"]', '2024-01-28 17:19:34', NULL, '2024-01-28 17:18:12', '2024-01-28 17:19:34'),
(304, 'App\\Models\\User', 81, 'auth-token', '57c0ff5ff8ed03ed84dda510f703224030091268a452ea5d5e405a0a7e176801', '[\"*\"]', '2024-01-28 17:20:33', NULL, '2024-01-28 17:20:00', '2024-01-28 17:20:33'),
(305, 'App\\Models\\User', 86, 'auth-token', 'ee5731d67e15c92af81be5da1eba9dd5f12007c53ee75408463759b6eadfc1b9', '[\"*\"]', '2024-01-28 17:23:49', NULL, '2024-01-28 17:23:04', '2024-01-28 17:23:49'),
(306, 'App\\Models\\User', 83, 'auth-token', 'ffd8a992aa99112ed490c82031783b7691149ad31b669e8a22bcd44d892a8491', '[\"*\"]', '2024-01-28 17:28:41', NULL, '2024-01-28 17:24:05', '2024-01-28 17:28:41'),
(307, 'App\\Models\\User', 86, 'auth-token', 'f8203d30aea46b38f57ae039c88150a7b51f5541a53ef27b26c454830b5491ee', '[\"*\"]', '2024-01-28 17:32:55', NULL, '2024-01-28 17:28:56', '2024-01-28 17:32:55'),
(308, 'App\\Models\\User', 87, 'auth-token', '7f20f736d6de1501ddf74822dabd4b6f907cd37dc87a3ee529705d9a371f71a3', '[\"*\"]', '2024-01-28 17:34:11', NULL, '2024-01-28 17:33:37', '2024-01-28 17:34:11'),
(309, 'App\\Models\\User', 87, 'auth-token', '5060eea4616d98ae405efc77261035fcf0dceea42f42612ef8c2e0791f19ea84', '[\"*\"]', '2024-01-28 22:40:23', NULL, '2024-01-28 17:34:42', '2024-01-28 22:40:23'),
(310, 'App\\Models\\User', 88, 'auth-token', '6224bb2b9f8f638c68e3eda9d4e63ba441a40b891d5ed2679a4d343a6665e02b', '[\"*\"]', '2024-01-28 18:07:57', NULL, '2024-01-28 18:07:22', '2024-01-28 18:07:57'),
(311, 'App\\Models\\User', 11, 'auth-token', '3df6e169e6f9811dee2cbd778bdfd8759dcc7b4cd1a2536a50aa6a73823aace6', '[\"*\"]', '2024-01-30 16:17:41', NULL, '2024-01-28 20:19:44', '2024-01-30 16:17:41'),
(312, 'App\\Models\\User', 82, 'auth-token', '0d3bbcec030a6725a9b837cd7276d60a5062d71a8eace05944b6befbb08f2b1f', '[\"*\"]', '2024-01-29 12:33:53', NULL, '2024-01-28 22:41:05', '2024-01-29 12:33:53'),
(313, 'App\\Models\\User', 89, 'auth-token', '0f573344d57f0ab4b92b75fbb7af6d8ec5fb872c066fe1b1575968f675418d56', '[\"*\"]', '2024-01-29 01:29:18', NULL, '2024-01-29 01:28:42', '2024-01-29 01:29:18'),
(314, 'App\\Models\\User', 90, 'auth-token', 'a9851b02e54176c2329f221be2631a0860308c5289cd9945cb74bff1ae8e7c82', '[\"*\"]', '2024-01-29 09:06:48', NULL, '2024-01-29 08:38:32', '2024-01-29 09:06:48'),
(315, 'App\\Models\\User', 91, 'auth-token', 'b3e040c287a5cef6afe5431a91b37ba885960e5dc785c1d2605d14b12b1f9465', '[\"*\"]', '2024-01-29 09:43:48', NULL, '2024-01-29 09:41:38', '2024-01-29 09:43:48'),
(316, 'App\\Models\\User', 92, 'auth-token', '14c0427fb9b9ba8f1e7822f26255cd4e64283e7452bc59e162447de23a2d0a84', '[\"*\"]', '2024-01-29 10:29:16', NULL, '2024-01-29 10:28:56', '2024-01-29 10:29:16'),
(317, 'App\\Models\\User', 53, 'auth-token', '9b6b01359ec9a8cd5f4e8e88264f90141cf07319a673bd73d4822cf3073356be', '[\"*\"]', '2024-01-29 14:36:02', NULL, '2024-01-29 14:35:55', '2024-01-29 14:36:02'),
(318, 'App\\Models\\User', 32, 'auth-token', '9deb3bdb82499e92a3f2ad4c9aaf3bbb86a0322ead87a2da55e487db16ea5d36', '[\"*\"]', '2024-02-06 07:15:45', NULL, '2024-01-29 14:36:22', '2024-02-06 07:15:45'),
(319, 'App\\Models\\User', 93, 'auth-token', 'c78347c842ddb620fab9243af2e2e69729d218499af43475f6a6013f619771da', '[\"*\"]', '2024-01-30 20:11:15', NULL, '2024-01-29 17:33:56', '2024-01-30 20:11:15'),
(320, 'App\\Models\\User', 94, 'auth-token', '8315046533cc94cab5fbac33242263ed966624bb68ac466d08e636c660b2b3a0', '[\"*\"]', '2024-02-07 13:00:25', NULL, '2024-01-29 17:49:23', '2024-02-07 13:00:25'),
(321, 'App\\Models\\User', 95, 'auth-token', '9a274957284fca3377fe7367647e42b23f21e5026cb7317f273388fa05dc5a84', '[\"*\"]', '2024-01-29 18:29:45', NULL, '2024-01-29 18:24:42', '2024-01-29 18:29:45'),
(322, 'App\\Models\\User', 96, 'auth-token', '70942165c324014f26ed88d22b662d4b3b3488ed6d7f3a65fe43d47e8475dd9e', '[\"*\"]', '2024-02-02 02:27:34', NULL, '2024-01-29 19:27:22', '2024-02-02 02:27:34'),
(323, 'App\\Models\\User', 97, 'auth-token', '142674c39e75d3098962af1714dd377369d7def77d8f88f276de45ea5bf83e79', '[\"*\"]', '2024-01-29 20:27:35', NULL, '2024-01-29 20:19:20', '2024-01-29 20:27:35'),
(324, 'App\\Models\\User', 98, 'auth-token', '83c56abe42b46f4aac5043af49fc6566060965b0f372b33732094553199cf17f', '[\"*\"]', '2024-01-30 07:37:13', NULL, '2024-01-30 07:35:27', '2024-01-30 07:37:13'),
(325, 'App\\Models\\User', 55, 'auth-token', 'fdc50d0d50a320a12d5f5b553b5d151c36720782a0c48da76d9a27a71660b6e1', '[\"*\"]', '2024-01-30 14:06:47', NULL, '2024-01-30 14:06:25', '2024-01-30 14:06:47'),
(326, 'App\\Models\\User', 28, 'auth-token', 'b8e3e2446e9ac0e547be9d19c4c94e8ce9ec3753f5642fc74f635bd1d461d74f', '[\"*\"]', '2024-01-30 14:21:00', NULL, '2024-01-30 14:07:08', '2024-01-30 14:21:00'),
(327, 'App\\Models\\User', 28, 'auth-token', '429b5f6b00051a8b6fd1f1bba6fffd8fca2f88abfb91f90512bf4990c05b3433', '[\"*\"]', '2024-01-30 14:24:13', NULL, '2024-01-30 14:21:24', '2024-01-30 14:24:13'),
(328, 'App\\Models\\User', 48, 'auth-token', '3931570a7f0d2661f2699a5307f8f3eed8feac27b6ae46e1ccffbb32160ad4bc', '[\"*\"]', '2024-02-02 17:15:28', NULL, '2024-01-30 14:21:57', '2024-02-02 17:15:28'),
(329, 'App\\Models\\User', 28, 'auth-token', 'a38b95b03a36d1edf245dcc4d2b0b228255c163343ab428992417214103756c6', '[\"*\"]', '2024-02-06 17:26:07', NULL, '2024-01-30 15:04:17', '2024-02-06 17:26:07'),
(330, 'App\\Models\\User', 11, 'auth-token', 'bd23aeaa9151e5a5f91bda4f1d404f2f6eb87681ecfb5aa31695a1d9f40846c1', '[\"*\"]', '2024-01-30 16:17:59', NULL, '2024-01-30 16:17:52', '2024-01-30 16:17:59'),
(331, 'App\\Models\\User', 15, 'auth-token', '269ce86eeb0bd8447c4586ab0fddc0447f192cdeb4a8ee0eac0eef4f8d83cdf6', '[\"*\"]', '2024-02-01 11:48:01', NULL, '2024-01-30 16:18:07', '2024-02-01 11:48:01'),
(332, 'App\\Models\\User', 99, 'auth-token', '124e02c59fd74b9dce90b7f1122b75ec7df1bb85e10a14d0929bb8a904fcfb7b', '[\"*\"]', '2024-01-30 16:40:18', NULL, '2024-01-30 16:36:13', '2024-01-30 16:40:18'),
(333, 'App\\Models\\User', 100, 'auth-token', '60d30721e8f19cca3a06527308ab0b8e0e563555798cc4bd7a598b7b9385940d', '[\"*\"]', '2024-01-30 17:18:31', NULL, '2024-01-30 17:16:18', '2024-01-30 17:18:31'),
(334, 'App\\Models\\User', 101, 'auth-token', '2dac723c5780f47ebe1a445d35390ec0cf8cab0c21c11433012cab2bf3705604', '[\"*\"]', '2024-01-31 04:34:17', NULL, '2024-01-30 17:43:42', '2024-01-31 04:34:17'),
(335, 'App\\Models\\User', 93, 'auth-token', 'f1fa4e69921c6bf7e9098806b21c42344f53622fd94f0bdacfe2b71d7d0b9fb8', '[\"*\"]', '2024-01-30 20:21:07', NULL, '2024-01-30 20:15:15', '2024-01-30 20:21:07'),
(336, 'App\\Models\\User', 102, 'auth-token', '959af4e5fd236f2402c4e305c89d5430bdc3a02b4d785724ec63c5fa8ba43b7e', '[\"*\"]', '2024-02-07 10:55:02', NULL, '2024-01-31 12:43:57', '2024-02-07 10:55:02'),
(337, 'App\\Models\\User', 103, 'auth-token', 'b0e61db8bba5309c2b3543bad1172818a809233a337a411128f1bbce7eebd997', '[\"*\"]', '2024-01-31 17:12:40', NULL, '2024-01-31 17:12:19', '2024-01-31 17:12:40'),
(338, 'App\\Models\\User', 104, 'auth-token', 'ecbcd7be5daa929f4d0190a07def8660406da13b248a543628de1114b0081fa4', '[\"*\"]', '2024-01-31 17:27:13', NULL, '2024-01-31 17:19:20', '2024-01-31 17:27:13'),
(339, 'App\\Models\\User', 20, 'auth-token', '5fd1814b6eb2dbe4b489236990ebaa3e4c0e7c8b5fa79fe41ca8b2c66d6cf9aa', '[\"*\"]', '2024-01-31 18:37:57', NULL, '2024-01-31 18:37:09', '2024-01-31 18:37:57'),
(340, 'App\\Models\\User', 105, 'auth-token', 'bb50c37d988fed7d8987b81f02c2c9e68e34880e59235816142fb4d2971b8039', '[\"*\"]', '2024-01-31 18:56:08', NULL, '2024-01-31 18:55:28', '2024-01-31 18:56:08'),
(341, 'App\\Models\\User', 11, 'auth-token', '9adf08388279b518832a171c541ea5eaa86d9c845cb49b7d46391063afded8b6', '[\"*\"]', '2024-02-01 11:52:24', NULL, '2024-02-01 11:48:30', '2024-02-01 11:52:24'),
(342, 'App\\Models\\User', 30, 'auth-token', '38c8b116512a92c7202d7dec414db255c825349afed06eb2c3e73460226b091e', '[\"*\"]', '2024-02-01 11:53:47', NULL, '2024-02-01 11:52:37', '2024-02-01 11:53:47'),
(343, 'App\\Models\\User', 15, 'auth-token', 'd7a01217156b61395c0421cd38aa3e709a038282cd5f244e5f6f154442afcd15', '[\"*\"]', '2024-02-01 17:56:26', NULL, '2024-02-01 11:53:55', '2024-02-01 17:56:26'),
(344, 'App\\Models\\User', 106, 'auth-token', '81abb15878c1e5610abe67b53756892e7c7552150d7da937ecd01b1de00de61b', '[\"*\"]', '2024-02-01 14:53:24', NULL, '2024-02-01 14:51:02', '2024-02-01 14:53:24'),
(345, 'App\\Models\\User', 15, 'auth-token', 'dfc6c3513ad4f46c439adbd3a17553107d041c2db0cc550caeb56377c8987bce', '[\"*\"]', '2024-02-01 17:56:45', NULL, '2024-02-01 17:56:40', '2024-02-01 17:56:45'),
(346, 'App\\Models\\User', 11, 'auth-token', 'a3977aeeebfa021117ae40f66d1a18b56ff53f81001dbcdc61de3089f34895fa', '[\"*\"]', '2024-02-06 08:28:49', NULL, '2024-02-01 17:57:00', '2024-02-06 08:28:49'),
(347, 'App\\Models\\User', 107, 'auth-token', 'd8aad640a663c8c5307bde39be2783c52d739d40ec0ca68983019ed6a0eb9ace', '[\"*\"]', '2024-02-02 16:29:27', NULL, '2024-02-02 16:28:21', '2024-02-02 16:29:27'),
(348, 'App\\Models\\User', 2, 'auth-token', 'b4d6a78c851436272c26c6795194b1a6087c632de9374e4a1f436d96e227d870', '[\"*\"]', '2024-02-02 17:16:04', NULL, '2024-02-02 17:15:57', '2024-02-02 17:16:04'),
(349, 'App\\Models\\User', 22, 'auth-token', '238f15764c597d7717ffefa07126d236321d952ef5313f08b615d8c9325e18a1', '[\"*\"]', '2024-02-02 17:46:56', NULL, '2024-02-02 17:46:52', '2024-02-02 17:46:56'),
(350, 'App\\Models\\User', 22, 'auth-token', '4c265d43cea37da16cf671df3962c5f492bb37b2eb2720d340178a0fe0c260b5', '[\"*\"]', '2024-02-07 10:56:25', NULL, '2024-02-02 17:47:18', '2024-02-07 10:56:25'),
(351, 'App\\Models\\User', 68, 'auth-token', '5c5ca457cdc3d06572c10c9ee8f2e003e4b25c109a4c63040b6bb66122fd71d5', '[\"*\"]', '2024-02-06 15:20:14', NULL, '2024-02-02 19:54:43', '2024-02-06 15:20:14'),
(352, 'App\\Models\\User', 108, 'auth-token', '8135c6da10ba4a523c16abe1d0ad7095243fa683d2fe837d8a52c415e9a7f27a', '[\"*\"]', '2024-02-03 09:20:32', NULL, '2024-02-02 20:18:05', '2024-02-03 09:20:32'),
(353, 'App\\Models\\User', 109, 'auth-token', 'ce2aebcf6bcb767cd87698383e73cbaf047c443d514d7d82d3428e3b9aec1fa9', '[\"*\"]', '2024-02-03 11:23:50', NULL, '2024-02-03 11:22:10', '2024-02-03 11:23:50'),
(354, 'App\\Models\\User', 110, 'auth-token', '95d2b8b9114eeb418bd6e4bfcd1b26f437e4b72295d27b4561f4c8fea0ca9192', '[\"*\"]', '2024-02-04 22:02:59', NULL, '2024-02-03 13:19:17', '2024-02-04 22:02:59'),
(355, 'App\\Models\\User', 98, 'auth-token', '6958f80b179c3ae2ca7f7b46c13bbb6e16322246a7ed1326dbc73944880bfa88', '[\"*\"]', '2024-02-03 20:33:46', NULL, '2024-02-03 20:31:43', '2024-02-03 20:33:46'),
(356, 'App\\Models\\User', 111, 'auth-token', '9fc19882986cb0fc140d2525fcee57fbce976a3d4aeb9c42eab9cea78d28d9da', '[\"*\"]', '2024-02-05 13:05:21', NULL, '2024-02-05 13:00:20', '2024-02-05 13:05:21'),
(357, 'App\\Models\\User', 112, 'auth-token', '9b13708db3774ad3addc01ae5c4edd8454d22a81875dbbbd18344f5855e64eb7', '[\"*\"]', '2024-02-06 17:55:30', NULL, '2024-02-05 17:11:53', '2024-02-06 17:55:30'),
(358, 'App\\Models\\User', 113, 'auth-token', '6c217f7cc75ee991b3ad37ad91f8b673bbfc8377916b0dcab8f093e0d7ed62e8', '[\"*\"]', '2024-02-07 02:21:56', NULL, '2024-02-05 20:02:03', '2024-02-07 02:21:56'),
(359, 'App\\Models\\User', 114, 'auth-token', 'ca780c2b202fda61ca0f7560cf59595bdb6e63856473dc0c542a51519c37ab9b', '[\"*\"]', '2024-02-05 20:50:36', NULL, '2024-02-05 20:45:16', '2024-02-05 20:50:36'),
(360, 'App\\Models\\User', 115, 'auth-token', 'fccc5a8c786cbac4ed9e1ff0048f149f5ff0ff715c84f05258c63db208116ea7', '[\"*\"]', '2024-02-05 22:59:00', NULL, '2024-02-05 22:50:25', '2024-02-05 22:59:00'),
(361, 'App\\Models\\User', 116, 'auth-token', '1551a7609e70a386464c8c70523b011cd2d6073ec5578d0bfdaaac69fc2832c1', '[\"*\"]', '2024-02-06 00:27:10', NULL, '2024-02-06 00:24:16', '2024-02-06 00:27:10'),
(362, 'App\\Models\\User', 117, 'auth-token', '0e7cb629e99a5821bc05ab83a759c546bfe8ee3629d6d8c4b353010bd7ff2c80', '[\"*\"]', '2024-02-06 08:33:15', NULL, '2024-02-06 08:29:16', '2024-02-06 08:33:15'),
(363, 'App\\Models\\User', 118, 'auth-token', '1a6b8078f67e664b660952b1e1e3205c0c25e372d4c783c0ba418f6be66206d9', '[\"*\"]', '2024-02-07 08:17:29', NULL, '2024-02-06 08:31:26', '2024-02-07 08:17:29'),
(364, 'App\\Models\\User', 119, 'auth-token', '24e36e124b69952c91d52e2d591379656d12923a5cb45e974ea630fc38d5401e', '[\"*\"]', '2024-02-06 08:36:24', NULL, '2024-02-06 08:34:59', '2024-02-06 08:36:24'),
(365, 'App\\Models\\User', 120, 'auth-token', 'eedf2891b938893c8a80c8b76b8b0bb34986dd2598ab8afc32838d0289f7d91c', '[\"*\"]', '2024-02-06 21:37:56', NULL, '2024-02-06 08:36:42', '2024-02-06 21:37:56'),
(366, 'App\\Models\\User', 121, 'auth-token', '6367a746d8716f55a1162344d908b5690263f78a210cbf4dc9c7164fa4b98973', '[\"*\"]', '2024-02-07 09:16:43', NULL, '2024-02-06 08:36:44', '2024-02-07 09:16:43'),
(367, 'App\\Models\\User', 122, 'auth-token', 'ea17c8394a6ecd2dfbe1600de1daeceeaef5b28918f417bb2415c75693963d03', '[\"*\"]', '2024-02-07 16:35:47', NULL, '2024-02-06 08:37:00', '2024-02-07 16:35:47'),
(368, 'App\\Models\\User', 123, 'auth-token', '4567ee18cdb94cf7141579948f3d414359cfe7e4f4f0ca39eeb56a17f548eba1', '[\"*\"]', '2024-02-06 08:43:02', NULL, '2024-02-06 08:39:25', '2024-02-06 08:43:02'),
(369, 'App\\Models\\User', 124, 'auth-token', 'c071c6ad19bfe28a690e807b2052ea9eb4d70969b4d3eeb81c7078273f98086f', '[\"*\"]', '2024-02-06 09:26:12', NULL, '2024-02-06 08:39:48', '2024-02-06 09:26:12'),
(370, 'App\\Models\\User', 125, 'auth-token', '4ee5692643fca0723e2207ab468aaf28085558bc6bf6fc521ac0f4893cf616d3', '[\"*\"]', '2024-02-06 09:05:34', NULL, '2024-02-06 08:43:39', '2024-02-06 09:05:34'),
(371, 'App\\Models\\User', 126, 'auth-token', '83d3bd0a8b37f60f2fa052c1e0ff6f2e9e81acf0f46a66103bb131f2c981bf84', '[\"*\"]', '2024-02-06 08:58:14', NULL, '2024-02-06 08:44:56', '2024-02-06 08:58:14'),
(372, 'App\\Models\\User', 117, 'auth-token', 'f0813e2cd309db41aa4880cb0d29ac9327a743005b910fd7a8dd700dc2393ce3', '[\"*\"]', '2024-02-06 08:55:37', NULL, '2024-02-06 08:49:11', '2024-02-06 08:55:37'),
(373, 'App\\Models\\User', 127, 'auth-token', 'a2d3befd79138ca06c0c6f91de344a6f0fcdbf2273ebdcb1a4ef944d180d0591', '[\"*\"]', '2024-02-07 15:09:10', NULL, '2024-02-06 08:49:36', '2024-02-07 15:09:10'),
(374, 'App\\Models\\User', 60, 'auth-token', 'e43b364452f6e6f437931e04bf6be4b006e1c003515a4d4a3b9463c6f7007536', '[\"*\"]', '2024-02-06 08:50:06', NULL, '2024-02-06 08:49:50', '2024-02-06 08:50:06'),
(375, 'App\\Models\\User', 128, 'auth-token', 'f5931a61f7821c44d896e2745a7e4d932fb61c64442a52c8e5499516b3b57a6b', '[\"*\"]', '2024-02-06 22:01:11', NULL, '2024-02-06 08:50:57', '2024-02-06 22:01:11'),
(376, 'App\\Models\\User', 117, 'auth-token', 'c2b6317f97ddff65b85d148a5fd6125237764b74dffbe1b3d32a6af1da1f6f0d', '[\"*\"]', '2024-02-06 08:59:37', NULL, '2024-02-06 08:56:06', '2024-02-06 08:59:37'),
(377, 'App\\Models\\User', 117, 'auth-token', 'd43a374153c43c82d4dba4c8902fd64edad0add7eb5ba15aa877799f95b1635b', '[\"*\"]', '2024-02-06 09:00:44', NULL, '2024-02-06 09:00:03', '2024-02-06 09:00:44'),
(378, 'App\\Models\\User', 129, 'auth-token', '47df952a411586420c4d5cddf30eba756dbb141a99ce6aa9408ca2e9f48e81d9', '[\"*\"]', '2024-02-07 14:30:10', NULL, '2024-02-06 10:30:50', '2024-02-07 14:30:10'),
(379, 'App\\Models\\User', 124, 'auth-token', '07e9ec5ff9112a98383c3220c414c04eaf9ab37c74db1ee7d43a8de51493e532', '[\"*\"]', '2024-02-06 16:01:06', NULL, '2024-02-06 11:21:20', '2024-02-06 16:01:06'),
(380, 'App\\Models\\User', 130, 'auth-token', 'a596ff437fcde1d5a7facc7a9aead16802b70a53474f25b24657707adba4c54f', '[\"*\"]', '2024-02-06 11:56:02', NULL, '2024-02-06 11:53:38', '2024-02-06 11:56:02'),
(381, 'App\\Models\\User', 131, 'auth-token', '3adf943bb09ee11bde793730deafb25858663a1ccc0b86c61ac0466edbd117c2', '[\"*\"]', '2024-02-06 12:13:42', NULL, '2024-02-06 12:12:51', '2024-02-06 12:13:42'),
(382, 'App\\Models\\User', 132, 'auth-token', '4b6d315f79a37c89ce94a69c5d51519ef047b88d7ea13fee3f5b5d29d6917e1a', '[\"*\"]', '2024-02-06 16:10:10', NULL, '2024-02-06 12:51:32', '2024-02-06 16:10:10'),
(383, 'App\\Models\\User', 133, 'auth-token', '671863b5d7eabbd4a1920111bb5199f5bad3babb483b5d2dbd09b65e680bb258', '[\"*\"]', '2024-02-06 17:03:14', NULL, '2024-02-06 17:02:30', '2024-02-06 17:03:14'),
(384, 'App\\Models\\User', 134, 'auth-token', '65b2decc36daa37a3416570a461458b6a34e230184966e08b7965375ea672101', '[\"*\"]', '2024-02-07 13:23:48', NULL, '2024-02-07 13:11:19', '2024-02-07 13:23:48'),
(385, 'App\\Models\\User', 135, 'auth-token', '2ceb6c6e4dbd874e16362e06a3441f75aa5eb7472c7eabdec4d63dc74e4517b3', '[\"*\"]', '2024-02-07 13:34:19', NULL, '2024-02-07 13:31:35', '2024-02-07 13:34:19'),
(386, 'App\\Models\\User', 136, 'auth-token', '34b23d0fc7f89340c850b303379598621dcfa3f3249d2800dceedd12a642bd68', '[\"*\"]', '2024-02-07 13:38:02', NULL, '2024-02-07 13:35:24', '2024-02-07 13:38:02'),
(387, 'App\\Models\\User', 137, 'auth-token', '1be88430c3e51bfeb55f7cfbaeb7605f1ee1614288192b595017146a284a65cc', '[\"*\"]', '2024-02-07 13:59:50', NULL, '2024-02-07 13:37:07', '2024-02-07 13:59:50'),
(388, 'App\\Models\\User', 138, 'auth-token', '9221e234fdef7d353e774d0949ebd3fe6d78b560058b540ba5dd2475449cc461', '[\"*\"]', '2024-02-07 14:16:02', NULL, '2024-02-07 13:52:37', '2024-02-07 14:16:02'),
(389, 'App\\Models\\User', 139, 'auth-token', '528c668b7331721e778272209bb6592aa9ce7f1937bf136050d5286f603d9936', '[\"*\"]', '2024-02-07 17:19:16', NULL, '2024-02-07 17:10:17', '2024-02-07 17:19:16'),
(390, 'App\\Models\\User', 140, 'auth-token', '22c0727f1709c6439aa2988ee7eea06b27e38ffe5f997ecbf643d81e0401c58b', '[\"*\"]', '2024-02-07 17:24:53', NULL, '2024-02-07 17:23:30', '2024-02-07 17:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `project_addresses`
--

CREATE TABLE `project_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `project_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bldg_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_addresses`
--

INSERT INTO `project_addresses` (`id`, `project_type`, `project_id`, `project_type_id`, `address`, `room_no`, `bldg_no`, `city`, `latitude`, `longitude`, `pincode`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App\\Models\\ProjectIndividualContractor', 1, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 12:26:36', '2024-01-23 12:26:36', NULL),
(2, 'App\\Models\\ProjectIndividualContractor', 2, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 12:32:46', '2024-01-23 12:32:46', NULL),
(3, 'App\\Models\\ProjectIndividualContractor', 3, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 13:27:52', '2024-01-23 13:27:52', NULL),
(4, 'App\\Models\\ProjectIndividualContractor', 4, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 13:31:35', '2024-01-23 13:31:35', NULL),
(5, 'App\\Models\\ProjectIndividualContractor', 5, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 13:33:22', '2024-01-23 13:33:22', NULL),
(6, 'App\\Models\\ProjectIndividualContractor', 6, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 13:45:22', '2024-01-23 13:45:22', NULL),
(7, 'App\\Models\\ProjectIndividualContractor', 7, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 13:47:47', '2024-01-23 13:47:47', NULL),
(8, 'App\\Models\\ProjectIndividualContractor', 8, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 13:49:40', '2024-01-23 13:49:40', NULL),
(9, 'App\\Models\\ProjectIndividualContractor', 9, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', 'Elemantra Projects', 'Kanchpada', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 13:51:41', '2024-01-23 13:51:41', NULL),
(10, 'App\\Models\\ProjectLabourContractor', 1, 3, 'Neo Corporate Plaza, Ramchandra Lane, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', 'Neo Corporate Plaza', 'Mumbai', '19.189542', '72.8404805', NULL, '2024-01-23 16:32:36', '2024-01-23 16:32:36', NULL),
(11, 'App\\Models\\ProjectIndividualContractor', 10, 2, 'Neo Corporate Plaza, Ramchandra Lane, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', 'Neo Corporate Plaza', 'Mumbai', '19.189542', '72.8404805', NULL, '2024-01-23 16:33:54', '2024-01-23 16:33:54', NULL),
(12, 'App\\Models\\ProjectLabourContractor', 2, 3, 'Neo Corporate Plaza, Ramchandra Lane, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', 'Neo Corporate Plaza', 'Mumbai', '19.189542', '72.8404805', NULL, '2024-01-23 16:36:26', '2024-01-23 16:36:26', NULL),
(13, 'App\\Models\\ProjectLabourContractor', 3, 3, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', 'Neo Corporate Plaza', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 16:37:32', '2024-01-23 16:37:32', NULL),
(14, 'App\\Models\\ProjectLabourContractor', 4, 3, 'Neo Corporate Plaza, Ramchandra Lane, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', 'Neo Corporate Plaza', 'Mumbai', '19.189542', '72.8404805', NULL, '2024-01-23 16:38:48', '2024-01-23 16:38:48', NULL),
(15, 'App\\Models\\ProjectLabourContractor', 5, 3, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', 'Neo Corporate Plaza', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 16:39:55', '2024-01-23 16:39:55', NULL),
(16, 'App\\Models\\ProjectLabourContractor', 6, 3, 'Neo Corporate Plaza, Ramchandra Lane, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', 'Neo Corporate Plaza', 'Mumbai', '19.189542', '72.8404805', NULL, '2024-01-23 16:44:11', '2024-01-23 16:44:11', NULL),
(17, 'App\\Models\\ProjectLabourContractor', 7, 3, 'Neo Corporate Plaza, Ramchandra Lane, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', 'Neo Corporate Plaza', 'Mumbai', '19.189542', '72.8404805', NULL, '2024-01-23 16:45:11', '2024-01-23 16:45:11', NULL),
(18, 'App\\Models\\ProjectIndividualContractor', 11, 1, 'Runwal Bliss E Wing Jasmine, Saikrupa Society, Indira Nagar, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'A Wing', 'Mumbai', '19.1326871', '72.9352028', NULL, '2024-01-23 17:07:41', '2024-01-24 18:23:33', NULL),
(19, 'App\\Models\\ProjectIndividualContractor', 12, 2, 'Neo Corporate Plaza, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra, India', '310', '310', 'Mumbai', '19.1897295', '72.8401933', NULL, '2024-01-23 18:26:05', '2024-01-23 18:26:05', NULL),
(20, 'App\\Models\\ProjectIndividualContractor', 13, 2, 'Goregaon West, Mumbai, Maharashtra, India', '303', 'Rustomjee Ozone', 'Mumbai', '19.1635793', '72.8458804', NULL, '2024-01-23 18:27:22', '2024-01-23 18:27:22', NULL),
(21, 'App\\Models\\ProjectIndividualContractor', 14, 2, 'Runwal Bliss - A Wing, IVY Tower, Ram Nagar, Kanjur Village, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'Runwall Bliss A Wing', 'Mumbai', '19.1339422', '72.9349715', NULL, '2024-01-23 20:29:45', '2024-01-23 20:29:45', NULL),
(22, 'App\\Models\\ProjectIndividualContractor', 15, 2, 'Runwal Bliss - A Wing, IVY Tower, Ram Nagar, Kanjur Village, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'runwal', 'Mumbai', '19.1339422', '72.9349715', NULL, '2024-01-23 23:57:38', '2024-01-23 23:57:38', NULL),
(23, 'App\\Models\\ProjectIndividualContractor', 16, 1, 'Runwal Bliss - A Wing, IVY Tower, Ram Nagar, Kanjur Village, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'runwal bliss A wing', 'Mumbai', '19.1339422', '72.9349715', NULL, '2024-01-24 00:18:31', '2024-01-24 16:21:10', NULL),
(24, 'App\\Models\\ProjectTurnkeyContractor', 1, 1, 'Sion, Mumbai, Maharashtra, India', '2002', 'xyz', 'Mumbai', '19.0390214', '72.86189519999999', NULL, '2024-01-24 00:57:45', '2024-01-24 00:57:45', NULL),
(25, 'App\\Models\\ProjectIndividualContractor', 17, 2, 'Kanjurmarg East, Mumbai, Maharashtra, India', '123', '12345', 'Mumbai', '19.1293739', '72.9330185', NULL, '2024-01-24 10:38:01', '2024-01-24 10:38:01', NULL),
(26, 'App\\Models\\ProjectIndividualContractor', 18, 2, 'Runwal Bliss - A Wing, IVY Tower, Ram Nagar, Kanjur Village, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'Runwal Bliss', 'Mumbai', '19.1339422', '72.9349715', NULL, '2024-01-24 16:15:27', '2024-01-24 16:15:27', NULL),
(27, 'App\\Models\\ProjectIndividualContractor', 19, 2, 'Runwal Bliss - A Wing, IVY Tower, Ram Nagar, Kanjur Village, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'Runwal Bliss - Awing', 'Mumbai', '19.1339422', '72.9349715', NULL, '2024-01-24 16:23:13', '2024-01-24 16:23:13', NULL),
(28, 'App\\Models\\ProjectIndividualContractor', 20, 2, 'L&T Emerald Isle Powai, Saki Vihar Road, New Mhada Colony, Savarkar Nagar, Chandivali, Powai, Mumbai, Maharashtra, India', '8', '803', 'Mumbai', '19.1226543', '72.8930846', NULL, '2024-01-24 16:34:07', '2024-01-24 16:34:07', NULL),
(29, 'App\\Models\\ProjectIndividualContractor', 21, 2, 'Mulund West, Mumbai, Maharashtra, India', '405', 'Jigesh Patil', 'Mumbai', '19.1725542', '72.942537', NULL, '2024-01-24 16:36:24', '2024-01-24 16:36:24', NULL),
(30, 'App\\Models\\ProjectIndividualContractor', 22, 2, 'Runwal Bliss - A Wing, IVY Tower, Ram Nagar, Kanjur Village, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'Runwal Bliss - A Wing', 'Mumbai', '19.1339422', '72.9349715', NULL, '2024-01-24 16:43:43', '2024-01-24 16:43:43', NULL),
(31, 'App\\Models\\ProjectIndividualContractor', 23, 2, 'Runwal Bliss - A Wing, IVY Tower, Ram Nagar, Kanjur Village, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'Runwal Bliss - A Wing', 'Mumbai', '19.1339422', '72.9349715', NULL, '2024-01-24 16:52:15', '2024-01-24 16:52:15', NULL),
(32, 'App\\Models\\ProjectIndividualContractor', 24, 2, 'Runwal Bliss - A Wing, IVY Tower, Ram Nagar, Kanjur Village, Kanjurmarg East, Mumbai, Maharashtra, India', '2002', 'Runwal Bliss - A wing', 'Mumbai', '19.1339422', '72.9349715', NULL, '2024-01-24 17:04:11', '2024-01-24 17:04:11', NULL),
(33, 'App\\Models\\ProjectIndividualContractor', 25, 2, 'Ghatkopar, Sindhu Wadi, Ghatkopar East, Mumbai, Maharashtra, India', '123', '1234', 'Mumbai', '19.0790239', '72.9080122', NULL, '2024-01-25 12:52:32', '2024-01-25 12:52:32', NULL),
(34, 'App\\Models\\ProjectTurnkeyContractor', 2, 1, 'Mumbai Central, Mumbai, Maharashtra, India', 'testing', '344', 'Mumbai', '18.9690247', '72.8205292', NULL, '2024-01-27 16:39:37', '2024-01-27 16:39:37', NULL),
(35, 'App\\Models\\ProjectTurnkeyContractor', 3, 1, 'Mumbai, Maharashtra, India', 'jauw', 'hwuw', 'Mumbai', '19.0759837', '72.8776559', NULL, '2024-01-27 22:27:39', '2024-01-27 23:09:13', NULL),
(36, 'App\\Models\\ProjectLabourContractor', 8, 3, 'Bhayandar, Mira Bhayandar, Maharashtra, India', '001/111', 'sonam patek', 'Mira Bhayandar', '19.2990485', '72.8547727', NULL, '2024-01-28 11:04:15', '2024-01-28 11:04:15', NULL),
(37, 'App\\Models\\ProjectLabourContractor', 9, 3, 'Malad, Reserve Bank of India Staff Quarters, Raheja Township, Malad East, Mumbai, Maharashtra, India', '001/40', 'bdjjdbbdj', 'Mumbai', '19.1874459', '72.8483689', NULL, '2024-01-28 17:17:46', '2024-01-28 17:17:46', NULL),
(38, 'App\\Models\\ProjectLabourContractor', 10, 3, 'Delhi Sarai Rohilla Railway Station, Guru Gobind Singh Marg, Railway Officers Colony, Sarai Rohilla, New Delhi, Delhi, India', 'test', 'test', 'New Delhi', '28.6633025', '77.1860118', NULL, '2024-01-29 08:46:47', '2024-01-29 08:46:47', NULL),
(39, 'App\\Models\\ProjectIndividualContractor', 26, 2, 'Khar West, Mumbai, Maharashtra, India', '101', 'Aura', 'Mumbai', '19.0699819', '72.8338084', NULL, '2024-01-30 14:08:57', '2024-01-30 14:08:57', NULL),
(40, 'App\\Models\\ProjectLabourContractor', 11, 3, 'Andheri East, Mumbai, Maharashtra, India', '123', '123', 'Mumbai', '19.1178548', '72.8631304', NULL, '2024-02-01 11:50:15', '2024-02-01 11:50:15', NULL),
(41, 'App\\Models\\ProjectLabourContractor', 12, 3, 'Borivali, Mumbai, Maharashtra, India', '35', '456', 'Mumbai', '19.2307329', '72.856673', NULL, '2024-02-06 08:40:13', '2024-02-06 08:40:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_individual_contractors`
--

CREATE TABLE `project_individual_contractors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'additional information about project',
  `property_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_other` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if property_type store other id then other endterd field store here',
  `budget_range_id` bigint(20) UNSIGNED DEFAULT NULL,
  `budget_min` int(11) DEFAULT NULL COMMENT 'if project type skilled labour then budget min amount will store here',
  `budget_max` int(11) DEFAULT NULL COMMENT 'if project type skilled labour then budget max amount will store here',
  `start_date` date DEFAULT NULL COMMENT 'tentative start date of project',
  `handover_date` date DEFAULT NULL COMMENT 'expected hand over date of project',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `project_status` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0-pending,1-live,2-application,3-assigned',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `live_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_individual_contractors`
--

INSERT INTO `project_individual_contractors` (`id`, `user_id`, `project_type_id`, `name`, `description`, `property_type_id`, `property_other`, `budget_range_id`, `budget_min`, `budget_max`, `start_date`, `handover_date`, `status`, `project_status`, `created_at`, `updated_at`, `live_at`, `deleted_at`) VALUES
(1, 50, 2, 'Elemantra Carpenter Hiring', NULL, 3, 'Residential and Commercial Projects', 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '1', '2024-01-23 12:26:36', '2024-01-23 12:28:26', '2024-01-23 12:28:26', NULL),
(2, 50, 2, 'Elemantra Carpenters Hiring', NULL, 1, NULL, 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '1', '2024-01-23 12:32:46', '2024-01-23 12:38:02', '2024-01-23 12:38:02', NULL),
(3, 50, 2, 'Elemantra Electrician Hiring', NULL, 1, NULL, 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '2', '2024-01-23 13:27:52', '2024-01-23 14:19:59', '2024-01-23 13:30:42', NULL),
(4, 50, 2, 'Elemantra Civil Hiring', NULL, 1, NULL, 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '2', '2024-01-23 13:31:35', '2024-02-06 11:25:15', '2024-01-23 13:32:20', NULL),
(5, 50, 2, 'Elemantra POP Contractor Hiring', NULL, 1, NULL, 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '2', '2024-01-23 13:33:22', '2024-01-26 10:05:27', '2024-01-23 13:34:41', NULL),
(6, 50, 2, 'Elemantra Painter Hiring', NULL, 1, NULL, 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '1', '2024-01-23 13:45:22', '2024-01-23 13:46:27', '2024-01-23 13:46:27', NULL),
(7, 50, 2, 'Elemantra Plumber Hiring', NULL, 1, NULL, 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '1', '2024-01-23 13:47:47', '2024-01-23 13:48:15', '2024-01-23 13:48:15', NULL),
(8, 50, 2, 'Elemantra Fabrication Contractor Hiring', NULL, 1, NULL, 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '1', '2024-01-23 13:49:40', '2024-01-23 13:50:24', '2024-01-23 13:50:24', NULL),
(9, 50, 2, 'Elemantra Modular Contractor Hiring', NULL, 1, NULL, 2, 10000, 50000, '2024-01-23', '2024-02-29', 1, '1', '2024-01-23 13:51:41', '2024-01-23 13:53:17', '2024-01-23 13:53:17', NULL),
(10, 28, 2, 'Elemantra', NULL, 1, NULL, 9, 100000, 500000, '2024-02-01', '2024-02-29', 1, '2', '2024-01-23 16:33:54', '2024-01-26 01:27:21', '2024-01-23 16:35:28', NULL),
(11, 30, 2, 'Moushmi', NULL, 1, NULL, 8, 2000000, 30000000, '2024-01-23', '2024-03-15', 1, '2', '2024-01-23 17:07:41', '2024-01-26 17:07:24', '2024-01-23 18:16:30', NULL),
(12, 30, 2, 'Elemantra projects pvt ltd', NULL, 1, NULL, 3, 20000, 30000, '2024-01-24', '2024-01-31', 1, '1', '2024-01-23 18:26:05', '2024-01-24 18:22:47', '2024-01-24 18:22:47', NULL),
(13, 30, 2, 'Vivek garg residence', NULL, 1, NULL, 8, 2000000, 30000000, '2023-08-24', '2024-01-22', 1, '2', '2024-01-23 18:27:22', '2024-02-06 08:41:35', '2024-01-24 18:22:41', NULL),
(14, 8, 2, 'Runwal Bliss Carpentry', NULL, 1, NULL, 9, 100000, 500000, '2024-01-24', '2024-03-31', 1, '1', '2024-01-23 20:29:45', '2024-01-23 20:47:18', '2024-01-23 20:43:47', '2024-01-23 20:47:18'),
(15, 8, 2, 'painting', NULL, 1, NULL, 2, 10000, 50000, '2024-01-24', '2024-02-29', 1, '3', '2024-01-23 23:57:38', '2024-01-24 00:08:51', '2024-01-23 23:59:26', NULL),
(16, 8, 2, 'carpenter', NULL, 1, NULL, 9, 100000, 500000, '2024-01-25', '2024-03-31', 1, '2', '2024-01-24 00:18:31', '2024-01-25 13:17:14', '2024-01-24 00:27:42', NULL),
(18, 8, 2, 'Painting', NULL, 1, NULL, 9, 100000, 500000, '2024-02-29', '2024-03-31', 1, '2', '2024-01-24 16:15:27', '2024-01-25 17:34:03', '2024-01-24 16:20:25', NULL),
(19, 8, 2, 'Carpenter', NULL, 1, NULL, 9, 100000, 500000, '2024-01-25', '2024-03-31', 1, '0', '2024-01-24 16:23:13', '2024-01-24 16:23:13', NULL, NULL),
(20, 30, 2, 'Mr.Anil Jain Residence', NULL, 1, NULL, 10, 3000000, 10000000, '2024-01-24', '2024-05-21', 1, '2', '2024-01-24 16:34:07', '2024-02-01 11:52:01', '2024-01-24 18:22:31', NULL),
(21, 30, 2, 'Jigesh Patel', NULL, 1, NULL, 10, 3000000, 10000000, '2024-02-01', '2024-06-30', 1, '2', '2024-01-24 16:36:24', '2024-02-05 17:18:21', '2024-01-24 18:22:59', NULL),
(22, 8, 2, 'POP / Gypsum', NULL, 1, NULL, 3, 20000, 30000, '2024-01-25', '2024-02-29', 1, '2', '2024-01-24 16:43:43', '2024-02-01 18:45:01', '2024-01-24 16:48:42', NULL),
(23, 8, 2, 'Electrician', NULL, 1, NULL, 9, 100000, 500000, '2024-01-25', '2024-02-29', 1, '2', '2024-01-24 16:52:15', '2024-02-06 01:04:48', '2024-01-24 16:59:03', NULL),
(24, 8, 2, 'Civil', NULL, 1, NULL, 2, 10000, 50000, '2024-01-24', '2024-01-31', 1, '0', '2024-01-24 17:04:11', '2024-01-24 17:04:11', NULL, NULL),
(26, 28, 2, 'Test', NULL, 1, NULL, 2, 10000, 50000, '2024-01-30', '2024-02-15', 1, '0', '2024-01-30 14:08:57', '2024-01-30 14:21:49', NULL, '2024-01-30 14:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `project_labour_applications`
--

CREATE TABLE `project_labour_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_labour_contractor_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `application_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0-pending/applied ,1-meet,2-assigned',
  `meet_at` timestamp NULL DEFAULT NULL COMMENT 'if request meet true then it store timestamp',
  `assigned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_labour_applications`
--

INSERT INTO `project_labour_applications` (`id`, `project_labour_contractor_id`, `user_id`, `role_id`, `application_status`, `meet_at`, `assigned_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 59, 3, '0', NULL, NULL, '2024-01-24 00:49:53', '2024-01-24 00:49:53', NULL),
(2, 1, 83, 3, '0', NULL, NULL, '2024-01-28 11:50:06', '2024-01-28 11:50:06', NULL),
(3, 8, 83, 3, '2', '2024-01-28 11:53:56', '2024-01-28 11:57:20', '2024-01-28 11:50:44', '2024-01-28 11:57:20', NULL),
(4, 9, 86, 3, '0', NULL, NULL, '2024-01-28 17:29:15', '2024-01-28 17:29:15', NULL),
(5, 7, 117, 3, '0', NULL, NULL, '2024-02-06 08:29:42', '2024-02-06 08:29:42', NULL),
(6, 7, 118, 3, '0', NULL, NULL, '2024-02-06 08:32:14', '2024-02-06 08:32:14', NULL),
(7, 7, 119, 3, '0', NULL, NULL, '2024-02-06 08:35:22', '2024-02-06 08:35:22', NULL),
(8, 12, 125, 3, '0', NULL, NULL, '2024-02-06 08:45:01', '2024-02-06 08:45:01', NULL),
(9, 7, 128, 3, '0', NULL, NULL, '2024-02-06 09:15:29', '2024-02-06 09:15:29', NULL),
(10, 12, 121, 3, '0', NULL, NULL, '2024-02-06 09:18:55', '2024-02-06 09:18:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_labour_contractors`
--

CREATE TABLE `project_labour_contractors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `work_type_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'additional information about project',
  `working_days` int(11) NOT NULL COMMENT 'no of working days',
  `rate` double NOT NULL COMMENT 'rate per day',
  `total_rate` double NOT NULL COMMENT 'total rate working days * per day',
  `start_date` date DEFAULT NULL COMMENT 'tentative start date of project',
  `handover_date` date DEFAULT NULL COMMENT 'expected hand over date of project',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `project_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1-live,2-application,3-assigned',
  `live_at` timestamp NULL DEFAULT NULL,
  `assigned_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL COMMENT 'when user assigned timestamp store here',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_labour_contractors`
--

INSERT INTO `project_labour_contractors` (`id`, `user_id`, `project_type_id`, `work_type_id`, `name`, `description`, `working_days`, `rate`, `total_rate`, `start_date`, `handover_date`, `status`, `project_status`, `live_at`, `assigned_user_id`, `assigned_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 28, 3, 6, 'Elemantra', 'Need carpenters for Interior Design Work', 10, 1000, 10000, '2024-01-28', '2024-02-08', 1, '2', '2024-01-23 16:32:36', NULL, NULL, '2024-01-23 16:32:36', '2024-01-24 00:49:53', NULL),
(2, 28, 3, 3, 'Elemantra', 'Need POP work to be done', 10, 1000, 10000, '2024-01-28', '2024-02-09', 1, '1', '2024-01-23 16:36:26', NULL, NULL, '2024-01-23 16:36:26', '2024-01-23 16:36:26', NULL),
(3, 28, 3, 4, 'Elemantra', 'Paint work to be done', 7, 1100, 7700, '2024-01-26', '2024-02-06', 1, '1', '2024-01-23 16:37:32', NULL, NULL, '2024-01-23 16:37:32', '2024-01-23 16:37:32', NULL),
(4, 28, 3, 5, 'Elemantra', 'bathroom plumbing work', 3, 900, 2700, '2024-01-28', '2024-01-31', 1, '1', '2024-01-23 16:38:48', NULL, NULL, '2024-01-23 16:38:48', '2024-01-23 16:38:48', NULL),
(5, 28, 3, 9, 'Elemantra', 'fabrication workers needed', 8, 1200, 9600, '2024-02-01', '2024-02-09', 1, '1', '2024-01-23 16:39:55', NULL, NULL, '2024-01-23 16:39:55', '2024-01-23 16:39:55', NULL),
(6, 28, 3, 10, 'Elemantra', 'workers required for modular work', 5, 1000, 5000, '2024-01-25', '2024-01-31', 1, '1', '2024-01-23 16:44:11', NULL, NULL, '2024-01-23 16:44:11', '2024-01-23 16:44:11', NULL),
(7, 28, 3, 12, 'Elemantra', 'civil workers required', 15, 900, 13500, '2024-02-01', '2024-02-15', 1, '2', '2024-01-23 16:45:11', NULL, NULL, '2024-01-23 16:45:11', '2024-02-06 08:29:42', NULL),
(8, 82, 3, 6, 'vikas dham', 'hshsndndn', 2, 1, 2, '2024-01-08', '2024-01-31', 1, '3', '2024-01-28 11:04:15', 83, '2024-01-28 11:57:20', '2024-01-28 11:04:15', '2024-01-28 11:57:20', NULL),
(9, 81, 3, 4, 'bla bla', 'ghdbb', 2, 3, 6, '2024-01-10', '2024-01-25', 1, '2', '2024-01-28 17:17:46', NULL, NULL, '2024-01-28 17:17:46', '2024-01-28 17:29:15', NULL),
(10, 90, 3, 2, 'test', 'test', 2, 900, 1800, '2024-01-30', '2024-01-31', 1, '1', '2024-01-29 08:46:47', NULL, NULL, '2024-01-29 08:46:47', '2024-01-29 08:47:18', '2024-01-29 08:47:18'),
(11, 11, 3, 6, '1st Feb test', 'panelling ka kaam hai', 10, 1000, 10000, '2024-02-08', '2024-02-15', 1, '1', '2024-02-01 11:50:15', NULL, NULL, '2024-02-01 11:50:15', '2024-02-01 11:50:15', NULL),
(12, 122, 3, 12, 'q124', 'inlay', 5, 1200, 6000, '2024-02-15', '2024-02-20', 1, '2', '2024-02-06 08:40:13', NULL, NULL, '2024-02-06 08:40:13', '2024-02-06 08:45:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_turnkey_contractors`
--

CREATE TABLE `project_turnkey_contractors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'additional information about project',
  `property_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_other` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if property_type store other id then other endterd field store here',
  `budget_range_id` bigint(20) UNSIGNED DEFAULT NULL,
  `budget_min` int(11) DEFAULT NULL COMMENT 'if project type skilled labour then budget min amount will store here',
  `budget_max` int(11) DEFAULT NULL COMMENT 'if project type skilled labour then budget max amount will store here',
  `start_date` date DEFAULT NULL COMMENT 'tentative start date of project',
  `handover_date` date DEFAULT NULL COMMENT 'expected hand over date of project',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `project_status` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0-pending,1-live,2-application,3-assigned',
  `assigned_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `live_at` timestamp NULL DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL COMMENT 'when user assigned timestamp store here',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_turnkey_contractors`
--

INSERT INTO `project_turnkey_contractors` (`id`, `user_id`, `project_type_id`, `name`, `description`, `property_type_id`, `property_other`, `budget_range_id`, `budget_min`, `budget_max`, `start_date`, `handover_date`, `status`, `project_status`, `assigned_user_id`, `live_at`, `assigned_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 60, 1, 'Ak', NULL, 1, NULL, 4, 500000, 1000000, '2024-01-25', '2024-03-08', 1, '0', NULL, NULL, NULL, '2024-01-24 00:57:45', '2024-01-24 00:57:45', NULL),
(2, 75, 1, 'Testing', NULL, 1, NULL, 4, 500000, 1000000, '2024-01-31', '2024-02-01', 1, '0', NULL, NULL, NULL, '2024-01-27 16:39:37', '2024-01-27 16:39:37', NULL),
(3, 81, 1, 'Namaste', NULL, 2, NULL, 3, 20000, 30000, '2024-01-25', '2024-01-26', 1, '0', NULL, NULL, NULL, '2024-01-27 22:27:39', '2024-01-27 23:09:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE `project_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'this will name in snake case or diffent uniqueness',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_types`
--

INSERT INTO `project_types` (`id`, `name`, `description`, `type`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Turnkey Contractor', NULL, 'turnkey_contractor', 1, NULL, NULL, NULL),
(2, 'Individual Contractor', NULL, 'individual_contractor', 1, NULL, NULL, NULL),
(3, 'Skilled Labour', NULL, 'skilled_labour', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_work_requests`
--

CREATE TABLE `project_work_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_request_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'store unique id current timestamp code',
  `project_work_type_id` bigint(20) UNSIGNED NOT NULL,
  `project_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `project_type_id` bigint(20) UNSIGNED NOT NULL,
  `area_of_work_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `other_item_detail` text COLLATE utf8mb4_unicode_ci,
  `item_brand_specification_id` bigint(20) UNSIGNED DEFAULT NULL,
  `other_item_brand_specification` text COLLATE utf8mb4_unicode_ci,
  `item_description` text COLLATE utf8mb4_unicode_ci,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_size` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `floor_plan_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'floor plan file path stored here file pdf',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_work_requests`
--

INSERT INTO `project_work_requests` (`id`, `unique_request_id`, `project_work_type_id`, `project_type`, `project_id`, `project_type_id`, `area_of_work_id`, `item_id`, `item_category_id`, `item_detail_id`, `other_item_detail`, `item_brand_specification_id`, `other_item_brand_specification`, `item_description`, `unit_id`, `area_size`, `quantity`, `floor_plan_file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1705993088', 1, 'App\\Models\\ProjectIndividualContractor', 1, 2, NULL, 91, 237, NULL, 'Full time hiring', NULL, 'Full time hiring', 'Hum full-time hire karne ke liye carpenters dhoond rahe hain. Apply kare apne rates ke saath.', 1, NULL, 100, NULL, '2024-01-23 12:28:08', '2024-01-23 12:28:08', NULL),
(2, '1705993675', 2, 'App\\Models\\ProjectIndividualContractor', 2, 2, NULL, 91, 237, NULL, 'Full time work', NULL, 'Full time work', 'Full time carpenters chaiye jo Elemantra ke saath jud jaaye. Aap rate me per day ka rate/salary daaliye and apply kijiye.', 1, 0, 30, NULL, '2024-01-23 12:37:55', '2024-01-23 12:39:34', NULL),
(3, '1705996837', 3, 'App\\Models\\ProjectIndividualContractor', 3, 2, NULL, 87, 288, NULL, 'All Items', NULL, 'All Brands', 'Full time electricians chaiye jo Elemantra ke saath jud jaaye. Aap Rate me per day ka rate/salary daaliye and apply kijiye.', 1, NULL, 30, NULL, '2024-01-23 13:30:37', '2024-01-23 13:30:37', NULL),
(4, '1705996936', 4, 'App\\Models\\ProjectIndividualContractor', 4, 2, NULL, 16, 222, NULL, 'All Items', NULL, 'All Brands', 'Full time Civil contractors chaiye jo Elemantra ke saath jud jaaye. Aap rate me per day ka rate/salary daaliye and apply kijiye.', 1, NULL, 30, NULL, '2024-01-23 13:32:16', '2024-01-23 13:32:16', NULL),
(5, '1705997077', 5, 'App\\Models\\ProjectIndividualContractor', 5, 2, NULL, 5, 131, NULL, 'All Items', NULL, 'All Brands', 'Full time POP Contractors chaiye jo Elemantra ke saath jud jaaye. Aap rate me per day ka rate/salary daaliye and apply kijiye.', 1, NULL, 30, NULL, '2024-01-23 13:34:37', '2024-01-23 13:34:37', NULL),
(6, '1705997780', 6, 'App\\Models\\ProjectIndividualContractor', 6, 2, NULL, 93, 289, 220, NULL, 97, NULL, 'Full time painters chaiye jo Elemantra ke saath jud jaaye. Aap rate me per day ka rate/salary daaliye and apply kijiye.', 1, NULL, 30, NULL, '2024-01-23 13:46:20', '2024-01-23 13:46:20', NULL),
(7, '1705997891', 7, 'App\\Models\\ProjectIndividualContractor', 7, 2, NULL, 92, 290, 221, NULL, 100, NULL, 'Full time plumbers chaiye jo Elemantra ke saath jud jaaye. Aap rate me per day ka rate/salary daaliye and apply kijiye.', 1, NULL, 30, NULL, '2024-01-23 13:48:11', '2024-01-23 13:48:11', NULL),
(8, '1705998018', 8, 'App\\Models\\ProjectIndividualContractor', 8, 2, NULL, 90, 235, NULL, 'All Items', NULL, 'All Brands', 'Full time fabrication contractors chaiye jo Elemantra ke saath jud jaaye. Aap rate me per day ka rate/salary daaliye and apply kijiye.', 1, NULL, 30, NULL, '2024-01-23 13:50:18', '2024-01-23 13:50:18', NULL),
(9, '1705998184', 9, 'App\\Models\\ProjectIndividualContractor', 9, 2, NULL, 77, 215, NULL, 'All Items', NULL, 'All Brands', 'Full time Modular contractors chaiye jo Elemantra ke saath jud jaaye. Aap rate me per day ka rate/salary daaliye and apply kijiye.', 1, NULL, 30, NULL, '2024-01-23 13:53:04', '2024-01-23 13:59:51', '2024-01-23 13:59:51'),
(10, '1705998615', 10, 'App\\Models\\ProjectIndividualContractor', 9, 2, NULL, 89, 295, NULL, 'All Items', NULL, 'All Brands', 'Full time Modular contractors chaiye jo Elemantra ke saath jud jaaye. Aap rate me per day ka rate/salary daaliye and apply kijiye.', 1, NULL, 30, NULL, '2024-01-23 14:00:15', '2024-01-23 14:00:15', NULL),
(11, '1706007857', 11, 'App\\Models\\ProjectIndividualContractor', 10, 2, NULL, 87, 281, 207, NULL, 75, NULL, 'Electrical Wiring', 2, 0, 10, NULL, '2024-01-23 16:34:17', '2024-01-30 14:24:09', NULL),
(12, '1706007876', 11, 'App\\Models\\ProjectIndividualContractor', 10, 2, NULL, 87, 213, 204, NULL, 72, NULL, 'NOTE - The rates include fixingof fan in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, 0, 2, NULL, '2024-01-23 16:34:36', '2024-01-30 14:23:45', NULL),
(13, '1706007914', 11, 'App\\Models\\ProjectIndividualContractor', 10, 2, NULL, 87, 286, 216, NULL, 84, NULL, NULL, 3, 0, 2, NULL, '2024-01-23 16:35:14', '2024-01-30 14:23:57', NULL),
(14, '1706009908', 12, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 15, 18, 17, NULL, NULL, NULL, NULL, 1, NULL, 100, NULL, '2024-01-23 17:08:28', '2024-01-23 17:08:28', NULL),
(15, '1706009947', 12, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 16, 37, 97, NULL, 55, NULL, 'Providing and laying 6\" (150 MM) Siporex partition wall with good quality  blocks 1st class in cement mortar 1:4 (1 cement : 4 coarse sand) including providing 2 nos of 6mm dia MS round bars at every IV course including scaffolding, curing, raking out joints etc. complete.', 1, NULL, 100, NULL, '2024-01-23 17:09:07', '2024-01-23 17:09:07', NULL),
(16, '1706009988', 12, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 16, 38, 99, NULL, 57, NULL, 'Providing and laying 12-25 mm thick cement plaster of mis 1 : 4 (1 cement : 4 sand with 50% coarse sand & 50% fine sand) to all type of RCC / brick surface in line, level and plumb including providing  wiremesh at all junctions of walls and ceilings etc. complete.', 1, NULL, 200, NULL, '2024-01-23 17:09:48', '2024-01-23 17:09:48', NULL),
(17, '1706010042', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 210, 201, NULL, 69, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, NULL, 45, NULL, '2024-01-23 17:10:42', '2024-01-23 17:10:42', NULL),
(18, '1706010122', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 211, 202, NULL, 70, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, NULL, 60, NULL, '2024-01-23 17:12:02', '2024-01-23 17:12:02', NULL),
(19, '1706010144', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 212, 203, NULL, 71, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, NULL, 5, NULL, '2024-01-23 17:12:24', '2024-01-23 17:12:24', NULL),
(20, '1706010206', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 213, 204, NULL, 72, NULL, 'NOTE - The rates include fixingof fan in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, NULL, 4, NULL, '2024-01-23 17:13:26', '2024-01-23 17:13:26', NULL),
(21, '1706010236', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 280, 206, NULL, 74, NULL, 'Electrical Wiring', 4, NULL, 30, NULL, '2024-01-23 17:13:56', '2024-01-23 17:13:56', NULL),
(22, '1706010268', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 281, 207, NULL, 75, NULL, 'Electrical Wiring', 2, NULL, 650, NULL, '2024-01-23 17:14:28', '2024-01-23 17:14:28', NULL),
(23, '1706010291', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 281, 208, NULL, 76, NULL, 'Electrical Wiring', 2, NULL, 550, NULL, '2024-01-23 17:14:51', '2024-01-23 17:14:51', NULL),
(24, '1706010320', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 281, 209, NULL, 77, NULL, 'Electrical Wiring', 2, NULL, 200, NULL, '2024-01-23 17:15:20', '2024-01-23 17:15:20', NULL),
(25, '1706010371', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 283, 211, NULL, NULL, NULL, NULL, 2, NULL, 300, NULL, '2024-01-23 17:16:11', '2024-01-23 17:16:11', NULL),
(26, '1706010401', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 287, 217, NULL, 85, NULL, 'Includes wire, DB Box and labor. Excludes MCB', 3, NULL, 1, NULL, '2024-01-23 17:16:41', '2024-01-23 17:16:41', NULL),
(27, '1706010433', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 286, 214, NULL, NULL, NULL, NULL, 3, NULL, 60, NULL, '2024-01-23 17:17:13', '2024-01-23 17:17:13', NULL),
(28, '1706013855', 14, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 4, 5, 43, NULL, 29, NULL, '12.5mm thick gypsum board, with Saint Gobain or India Gypsum Channel including all material, labor, transportation etc. Ceiling Channel and Intermediate Channel at 900mm c/c & Ceiling Section at 450mm c/c', 1, NULL, 750, NULL, '2024-01-23 18:14:15', '2024-01-23 18:14:15', NULL),
(29, '1706013956', 13, 'App\\Models\\ProjectIndividualContractor', 11, 2, NULL, 87, 210, 201, NULL, 69, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, NULL, 50, NULL, '2024-01-23 18:15:56', '2024-01-23 18:15:56', NULL),
(30, '1706022803', 15, 'App\\Models\\ProjectIndividualContractor', 14, 2, NULL, 86, 202, 70, NULL, 86, NULL, 'Painting with royal Shyne on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', 1, 690, 690, NULL, '2024-01-23 20:43:23', '2024-01-23 20:43:23', NULL),
(31, '1706034517', 16, 'App\\Models\\ProjectIndividualContractor', 15, 2, NULL, 86, 202, 70, NULL, 86, NULL, 'Painting with royal Shyne on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', 1, 600, 500, NULL, '2024-01-23 23:58:37', '2024-01-23 23:58:37', NULL),
(32, '1706035895', 17, 'App\\Models\\ProjectIndividualContractor', 16, 2, NULL, 48, 80, 227, NULL, 106, NULL, 'Please enter Description', 1, 50, 200, NULL, '2024-01-24 00:21:35', '2024-01-24 00:36:54', '2024-01-24 00:36:54'),
(33, '1706036155', 17, 'App\\Models\\ProjectIndividualContractor', 16, 2, NULL, 48, 80, 227, NULL, 106, NULL, 'Please enter Description', 1, 200, 60, NULL, '2024-01-24 00:25:55', '2024-01-24 00:25:55', NULL),
(34, '1706036213', 18, 'App\\Models\\ProjectIndividualContractor', 16, 2, NULL, 86, 202, 70, NULL, 86, NULL, 'Painting with royal Shyne on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', 1, 600, 3000, NULL, '2024-01-24 00:26:53', '2024-01-24 00:26:53', NULL),
(35, '1706038139', 19, 'App\\Models\\ProjectTurnkeyContractor', 1, 1, NULL, 87, 210, 201, NULL, 69, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, 600, 20, NULL, '2024-01-24 00:58:59', '2024-01-24 00:58:59', NULL),
(36, '1706038169', 20, 'App\\Models\\ProjectTurnkeyContractor', 1, 1, NULL, 20, 185, 62, NULL, 87, NULL, 'Please enter description', 1, 600, 600, NULL, '2024-01-24 00:59:29', '2024-01-24 00:59:29', NULL),
(37, '1706072980', 21, 'App\\Models\\ProjectIndividualContractor', 17, 2, NULL, 96, 248, NULL, 'Na', NULL, 'na', 'null', 1, 0, 200, NULL, '2024-01-24 10:39:40', '2024-01-24 15:24:34', NULL),
(38, '1706090106', 21, 'App\\Models\\ProjectIndividualContractor', 17, 2, NULL, 50, 90, NULL, 'all', NULL, 'all', NULL, 3, NULL, 100, NULL, '2024-01-24 15:25:06', '2024-01-24 15:25:06', NULL),
(39, '1706093184', 22, 'App\\Models\\ProjectIndividualContractor', 18, 2, NULL, 86, 202, 70, NULL, 86, NULL, 'Painting with royal Shyne on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', 1, 700, 690, NULL, '2024-01-24 16:16:24', '2024-01-24 16:16:24', NULL),
(40, '1706093208', 22, 'App\\Models\\ProjectIndividualContractor', 18, 2, NULL, 86, 202, 70, NULL, 86, NULL, 'Painting with royal Shyne on walls, to give an even shade – Two or more coats on new work including preparation of surface. (_putty+_primer+_paint) as per requirement', 1, 700, 2070, NULL, '2024-01-24 16:16:48', '2024-01-24 16:16:48', NULL),
(41, '1706093383', 22, 'App\\Models\\ProjectIndividualContractor', 18, 2, NULL, 20, 185, 62, NULL, 87, NULL, 'Door Frames & Door Edges.', 1, 700, 1, NULL, '2024-01-24 16:19:43', '2024-01-24 16:19:43', NULL),
(42, '1706093801', 23, 'App\\Models\\ProjectIndividualContractor', 19, 2, NULL, 96, 244, 141, NULL, 67, NULL, 'Main Door With Laminate finish with door frame.', 1, 700, 1, NULL, '2024-01-24 16:26:41', '2024-01-24 16:26:41', NULL),
(43, '1706093888', 21, 'App\\Models\\ProjectIndividualContractor', 17, 2, NULL, 59, 117, NULL, 'all', NULL, 'all', NULL, 3, NULL, 100, NULL, '2024-01-24 16:28:08', '2024-01-24 16:28:08', NULL),
(44, '1706093907', 24, 'App\\Models\\ProjectIndividualContractor', 17, 2, NULL, 87, 212, 203, NULL, 71, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, NULL, 100, NULL, '2024-01-24 16:28:27', '2024-01-24 16:28:27', NULL),
(45, '1706093921', 24, 'App\\Models\\ProjectIndividualContractor', 17, 2, NULL, 87, 280, 206, NULL, 74, NULL, 'Electrical Wiring', 4, NULL, 100, NULL, '2024-01-24 16:28:41', '2024-01-24 16:28:41', NULL),
(46, '1706093937', 24, 'App\\Models\\ProjectIndividualContractor', 17, 2, NULL, 87, 287, 217, NULL, 85, NULL, 'Includes wire, DB Box and labor. Excludes MCB', 3, NULL, 100, NULL, '2024-01-24 16:28:57', '2024-01-24 16:28:57', NULL),
(47, '1706093953', 24, 'App\\Models\\ProjectIndividualContractor', 17, 2, NULL, 87, 284, 212, NULL, 80, NULL, 'Electrical Wiring', 2, NULL, 100, NULL, '2024-01-24 16:29:13', '2024-01-24 16:29:13', NULL),
(48, '1706094663', 25, 'App\\Models\\ProjectIndividualContractor', 12, 2, NULL, 50, 88, NULL, 'Carcass storage', NULL, 'Timex ply', NULL, 1, NULL, 72, NULL, '2024-01-24 16:41:03', '2024-01-24 16:41:03', NULL),
(49, '1706094716', 26, 'App\\Models\\ProjectIndividualContractor', 13, 2, NULL, 16, 39, 100, NULL, NULL, 'normal tile', NULL, 1, NULL, 250, NULL, '2024-01-24 16:41:56', '2024-01-24 16:41:56', NULL),
(50, '1706094862', 27, 'App\\Models\\ProjectIndividualContractor', 22, 2, NULL, 4, 5, 44, NULL, 30, NULL, '12.5mm thick gypsum board, with local A Grade Channel including all material, labor, transportation etc. \r\nCeiling Channel and Intermediate Channel at 900mm c/c & Ceiling Section at 450mm c/c', 1, 700, 400, NULL, '2024-01-24 16:44:22', '2024-01-24 16:44:22', NULL),
(51, '1706094884', 27, 'App\\Models\\ProjectIndividualContractor', 22, 2, NULL, 4, 141, 45, NULL, 31, NULL, '12.5mm thick gypsum board, with local A Grade Channel including all material, labor, transportation etc.\r\n Ceiling Channel and Intermediate Channel at 900mm c/c & Ceiling Section at 450mm c/c', 1, 700, 120, NULL, '2024-01-24 16:44:44', '2024-01-24 16:44:44', NULL),
(52, '1706094949', 27, 'App\\Models\\ProjectIndividualContractor', 22, 2, NULL, 5, 135, 39, NULL, 24, NULL, 'Providing and applying 12-25  mm thick POP punning on wall /ceiling including scrapping and hacking the existing finished surface and applying plaster of paris in proper line and levels etc.', 1, 700, 500, NULL, '2024-01-24 16:45:49', '2024-01-24 16:45:49', NULL),
(53, '1706095008', 27, 'App\\Models\\ProjectIndividualContractor', 22, 2, NULL, 4, 144, 48, NULL, 34, NULL, 'Light Gala Cutting', 3, 700, 32, NULL, '2024-01-24 16:46:48', '2024-01-24 16:46:48', NULL),
(54, '1706095081', 27, 'App\\Models\\ProjectIndividualContractor', 22, 2, NULL, 5, 291, 224, NULL, 103, NULL, 'POP wall moudling & Ceiling corner moulding', 2, 700, 124, NULL, '2024-01-24 16:48:01', '2024-01-24 16:48:01', NULL),
(55, '1706095109', 27, 'App\\Models\\ProjectIndividualContractor', 22, 2, NULL, 5, 138, 42, NULL, 28, NULL, 'N/A', 2, 700, 30, NULL, '2024-01-24 16:48:29', '2024-01-24 16:48:29', NULL),
(56, '1706095358', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 210, 201, NULL, 69, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, 700, 35, NULL, '2024-01-24 16:52:38', '2024-01-24 16:52:38', NULL),
(57, '1706095426', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 211, 202, NULL, 70, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, 700, 45, NULL, '2024-01-24 16:53:46', '2024-01-24 16:53:46', NULL),
(58, '1706095458', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 212, 203, NULL, 71, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, 700, 10, NULL, '2024-01-24 16:54:18', '2024-01-24 16:54:18', NULL),
(59, '1706095473', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 213, 204, NULL, 72, NULL, 'NOTE - The rates include fixingof fan in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, 700, 5, NULL, '2024-01-24 16:54:33', '2024-01-24 16:54:33', NULL),
(60, '1706095499', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 214, 205, NULL, 73, NULL, 'NOTE - The rates does not include fixing of AC', 4, 700, 4, NULL, '2024-01-24 16:54:59', '2024-01-24 16:54:59', NULL),
(61, '1706095540', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 281, 207, NULL, 75, NULL, 'Electrical Wiring', 2, 700, 400, NULL, '2024-01-24 16:55:40', '2024-01-24 16:55:40', NULL),
(62, '1706095555', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 281, 208, NULL, 76, NULL, 'Electrical Wiring', 2, 700, 300, NULL, '2024-01-24 16:55:55', '2024-01-24 16:55:55', NULL),
(63, '1706095575', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 281, 209, NULL, 77, NULL, 'Electrical Wiring', 2, 700, 300, NULL, '2024-01-24 16:56:15', '2024-01-24 16:56:15', NULL),
(64, '1706095603', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 283, 211, NULL, 79, NULL, 'Electrical Wiring', 2, 700, 200, NULL, '2024-01-24 16:56:43', '2024-01-24 16:56:43', NULL),
(65, '1706095656', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 286, 214, NULL, 82, NULL, 'Electrical Wiring', 3, 700, 40, NULL, '2024-01-24 16:57:36', '2024-01-24 16:57:36', NULL),
(66, '1706095676', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 286, 215, NULL, 83, NULL, 'Electrical wiring', 2, 700, 200, NULL, '2024-01-24 16:57:56', '2024-01-24 16:57:56', NULL),
(67, '1706095715', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 286, 216, NULL, 84, NULL, 'Decorative light Fixing', 3, 700, 4, NULL, '2024-01-24 16:58:35', '2024-01-24 16:58:35', NULL),
(68, '1706095733', 28, 'App\\Models\\ProjectIndividualContractor', 23, 2, NULL, 87, 287, 217, NULL, 85, NULL, 'Includes wire, DB Box and labor. Excludes MCB', 3, 700, 1, NULL, '2024-01-24 16:58:53', '2024-01-24 16:58:53', NULL),
(69, '1706096083', 29, 'App\\Models\\ProjectIndividualContractor', 24, 2, NULL, 15, 18, 18, NULL, NULL, NULL, NULL, 1, 700, 50, NULL, '2024-01-24 17:04:43', '2024-01-24 17:04:43', NULL),
(70, '1706096139', 29, 'App\\Models\\ProjectIndividualContractor', 24, 2, NULL, 15, 30, 31, NULL, NULL, NULL, NULL, 1, 700, 50, NULL, '2024-01-24 17:05:39', '2024-01-24 17:05:39', NULL),
(71, '1706096169', 29, 'App\\Models\\ProjectIndividualContractor', 24, 2, NULL, 15, 28, 29, NULL, NULL, NULL, NULL, 2, 700, 3, NULL, '2024-01-24 17:06:09', '2024-01-24 17:06:09', NULL),
(72, '1706096249', 29, 'App\\Models\\ProjectIndividualContractor', 24, 2, NULL, 16, 38, 99, NULL, 57, NULL, 'Providing and laying 12-25 mm thick cement plaster of mis 1 : 4 (1 cement : 4 sand with 50% coarse sand & 50% fine sand) to all type of RCC / brick surface in line, level and plumb including providing  wiremesh at all junctions of walls and ceilings etc. complete.', 1, 700, 20, NULL, '2024-01-24 17:07:29', '2024-01-24 17:07:29', NULL),
(73, '1706096282', 29, 'App\\Models\\ProjectIndividualContractor', 24, 2, NULL, 16, 49, 92, NULL, NULL, NULL, NULL, 1, 700, 14, NULL, '2024-01-24 17:08:02', '2024-01-24 17:08:02', NULL),
(74, '1706096303', 29, 'App\\Models\\ProjectIndividualContractor', 24, 2, NULL, 16, 39, 100, NULL, NULL, NULL, NULL, 1, 700, 100, NULL, '2024-01-24 17:08:23', '2024-01-24 17:08:23', NULL),
(75, '1706096321', 29, 'App\\Models\\ProjectIndividualContractor', 24, 2, NULL, 16, 40, 103, NULL, NULL, NULL, NULL, 1, 700, 20, NULL, '2024-01-24 17:08:41', '2024-01-24 17:08:41', NULL),
(76, '1706099670', 30, 'App\\Models\\ProjectIndividualContractor', 21, 2, NULL, 87, 210, 201, NULL, 69, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, NULL, 1400, NULL, '2024-01-24 18:04:30', '2024-01-24 18:04:30', NULL),
(77, '1706099752', 31, 'App\\Models\\ProjectIndividualContractor', 20, 2, NULL, 87, 210, 201, NULL, 69, NULL, 'NOTE - The rates include fixingof switch / socket in position, effecting proper connections testing and commissioning of lighting fixtures and fans including lamps, control gear, power factor improvement capacitor and all fixing accessories that may be required to check.', 4, NULL, 80, NULL, '2024-01-24 18:05:52', '2024-01-24 18:05:52', NULL),
(78, '1706100512', 32, 'App\\Models\\ProjectIndividualContractor', 20, 2, NULL, 16, 49, 91, NULL, NULL, 'semi modular', NULL, 1, NULL, 5, NULL, '2024-01-24 18:18:32', '2024-01-24 18:18:32', NULL),
(79, '1706100664', 33, 'App\\Models\\ProjectIndividualContractor', 20, 2, NULL, 43, 64, NULL, 'Laminate finish', 64, NULL, 'MR ply + ply framing + finish laminate', 1, NULL, 100, NULL, '2024-01-24 18:21:04', '2024-01-24 18:21:04', NULL),
(80, '1706100734', 33, 'App\\Models\\ProjectIndividualContractor', 20, 2, NULL, 48, 80, 227, NULL, 106, NULL, 'Please enter Description', 1, NULL, 145, NULL, '2024-01-24 18:22:14', '2024-01-24 18:22:14', NULL),
(81, '1706167458', 34, 'App\\Models\\ProjectIndividualContractor', 25, 2, NULL, 43, 65, 134, NULL, 65, NULL, 'MR ply + ply framing + finish Veneer', 1, NULL, 100, NULL, '2024-01-25 12:54:18', '2024-01-25 12:54:18', NULL),
(82, '1706358291', 35, 'App\\Models\\ProjectTurnkeyContractor', 2, 1, NULL, 20, 185, NULL, 'techno', NULL, 'think', NULL, 1, NULL, 200, NULL, '2024-01-27 17:54:51', '2024-01-27 17:54:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_work_request_applications`
--

CREATE TABLE `project_work_request_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_work_type_application_id` bigint(20) UNSIGNED NOT NULL,
  `project_work_request_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `rate` int(11) NOT NULL DEFAULT '0',
  `rate_total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_work_request_applications`
--

INSERT INTO `project_work_request_applications` (`id`, `project_work_type_application_id`, `project_work_request_id`, `user_id`, `project_type`, `project_id`, `rate`, `rate_total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 51, 'App\\Models\\ProjectIndividualContractor', 3, 900, 27000, '2024-01-23 14:19:53', '2024-01-23 14:19:53', NULL),
(2, 2, 28, 55, 'App\\Models\\ProjectIndividualContractor', 11, 75, 56250, '2024-01-23 18:20:16', '2024-01-23 18:20:16', NULL),
(3, 3, 31, 58, 'App\\Models\\ProjectIndividualContractor', 15, 60, 30000, '2024-01-24 00:01:14', '2024-01-24 00:04:26', NULL),
(4, 4, 17, 51, 'App\\Models\\ProjectIndividualContractor', 11, 600, 27000, '2024-01-24 00:13:22', '2024-01-24 00:13:22', NULL),
(5, 4, 18, 51, 'App\\Models\\ProjectIndividualContractor', 11, 600, 36000, '2024-01-24 00:13:53', '2024-01-24 00:13:53', NULL),
(6, 4, 19, 51, 'App\\Models\\ProjectIndividualContractor', 11, 800, 4000, '2024-01-24 00:14:18', '2024-01-24 00:14:18', NULL),
(7, 4, 20, 51, 'App\\Models\\ProjectIndividualContractor', 11, 950, 3800, '2024-01-24 00:14:32', '2024-01-24 00:14:32', NULL),
(8, 4, 21, 51, 'App\\Models\\ProjectIndividualContractor', 11, 400, 12000, '2024-01-24 00:15:04', '2024-01-24 00:15:19', NULL),
(9, 4, 22, 51, 'App\\Models\\ProjectIndividualContractor', 11, 42, 27300, '2024-01-24 00:16:26', '2024-01-24 00:16:26', NULL),
(10, 4, 23, 51, 'App\\Models\\ProjectIndividualContractor', 11, 48, 26400, '2024-01-24 00:17:00', '2024-01-24 00:17:00', NULL),
(11, 4, 24, 51, 'App\\Models\\ProjectIndividualContractor', 11, 55, 11000, '2024-01-24 00:17:30', '2024-01-24 00:17:30', NULL),
(12, 4, 25, 51, 'App\\Models\\ProjectIndividualContractor', 11, 43, 12900, '2024-01-24 00:17:54', '2024-01-24 00:17:54', NULL),
(13, 4, 26, 51, 'App\\Models\\ProjectIndividualContractor', 11, 4800, 4800, '2024-01-24 00:18:28', '2024-01-24 00:18:28', NULL),
(14, 4, 27, 51, 'App\\Models\\ProjectIndividualContractor', 11, 100, 6000, '2024-01-24 00:19:08', '2024-01-24 00:19:08', NULL),
(15, 4, 29, 51, 'App\\Models\\ProjectIndividualContractor', 11, 600, 30000, '2024-01-24 00:19:33', '2024-01-24 00:19:33', NULL),
(16, 5, 34, 58, 'App\\Models\\ProjectIndividualContractor', 16, 70, 210000, '2024-01-24 00:30:08', '2024-01-24 00:34:06', NULL),
(17, 6, 33, 32, 'App\\Models\\ProjectIndividualContractor', 16, 550, 33000, '2024-01-24 10:54:11', '2024-01-24 10:54:11', NULL),
(18, 7, 37, 48, 'App\\Models\\ProjectIndividualContractor', 17, 100, 20000, '2024-01-24 16:35:45', '2024-01-24 16:35:45', NULL),
(19, 7, 38, 48, 'App\\Models\\ProjectIndividualContractor', 17, 100, 10000, '2024-01-24 16:36:19', '2024-01-24 16:36:19', NULL),
(20, 7, 43, 48, 'App\\Models\\ProjectIndividualContractor', 17, 100, 10000, '2024-01-24 16:36:30', '2024-01-24 16:36:30', NULL),
(21, 8, 44, 48, 'App\\Models\\ProjectIndividualContractor', 17, 100, 10000, '2024-01-24 16:43:13', '2024-01-24 16:43:13', NULL),
(22, 8, 45, 48, 'App\\Models\\ProjectIndividualContractor', 17, 100, 10000, '2024-01-24 16:43:24', '2024-01-24 16:43:24', NULL),
(23, 8, 46, 48, 'App\\Models\\ProjectIndividualContractor', 17, 100, 10000, '2024-01-24 16:44:30', '2024-01-24 16:44:30', NULL),
(24, 8, 47, 48, 'App\\Models\\ProjectIndividualContractor', 17, 100, 10000, '2024-01-24 16:44:37', '2024-01-24 16:44:37', NULL),
(25, 9, 12, 61, 'App\\Models\\ProjectIndividualContractor', 10, 1100, 2200, '2024-01-24 20:26:43', '2024-01-30 14:23:45', NULL),
(26, 10, 76, 51, 'App\\Models\\ProjectIndividualContractor', 21, 600, 840000, '2024-01-24 20:39:12', '2024-01-24 20:39:12', NULL),
(27, 11, 77, 51, 'App\\Models\\ProjectIndividualContractor', 20, 625, 50000, '2024-01-24 20:39:53', '2024-01-24 20:39:53', NULL),
(28, 12, 50, 63, 'App\\Models\\ProjectIndividualContractor', 22, 120, 48000, '2024-01-24 21:18:39', '2024-01-24 21:18:39', NULL),
(29, 12, 51, 63, 'App\\Models\\ProjectIndividualContractor', 22, 100, 12000, '2024-01-24 21:19:02', '2024-01-24 21:19:02', NULL),
(30, 12, 52, 63, 'App\\Models\\ProjectIndividualContractor', 22, 35, 17500, '2024-01-24 21:19:20', '2024-01-24 21:19:20', NULL),
(31, 12, 53, 63, 'App\\Models\\ProjectIndividualContractor', 22, 50, 1600, '2024-01-24 21:19:44', '2024-01-24 21:19:44', NULL),
(32, 12, 54, 63, 'App\\Models\\ProjectIndividualContractor', 22, 80, 9920, '2024-01-24 21:20:13', '2024-01-24 21:20:13', NULL),
(33, 12, 55, 63, 'App\\Models\\ProjectIndividualContractor', 22, 30, 900, '2024-01-24 21:21:15', '2024-01-24 21:21:15', NULL),
(34, 13, 5, 63, 'App\\Models\\ProjectIndividualContractor', 5, 1000, 30000, '2024-01-24 21:22:05', '2024-01-24 21:22:05', NULL),
(35, 14, 28, 63, 'App\\Models\\ProjectIndividualContractor', 11, 120, 90000, '2024-01-24 21:22:35', '2024-01-24 21:22:35', NULL),
(36, 15, 80, 64, 'App\\Models\\ProjectIndividualContractor', 20, 1750, 253750, '2024-01-24 22:48:24', '2024-01-24 22:48:24', NULL),
(37, 16, 33, 64, 'App\\Models\\ProjectIndividualContractor', 16, 1600, 96000, '2024-01-25 13:17:00', '2024-01-25 13:17:00', NULL),
(38, 9, 11, 61, 'App\\Models\\ProjectIndividualContractor', 10, 60, 600, '2024-01-25 16:50:52', '2024-01-30 14:24:09', NULL),
(39, 17, 40, 68, 'App\\Models\\ProjectIndividualContractor', 18, 55, 113850, '2024-01-25 17:32:21', '2024-01-25 17:32:21', NULL),
(40, 17, 39, 68, 'App\\Models\\ProjectIndividualContractor', 18, 55, 37950, '2024-01-25 17:32:48', '2024-01-25 17:32:48', NULL),
(41, 17, 41, 68, 'App\\Models\\ProjectIndividualContractor', 18, 3000, 3000, '2024-01-25 17:33:57', '2024-01-25 17:33:57', NULL),
(42, 18, 50, 41, 'App\\Models\\ProjectIndividualContractor', 22, 75, 30000, '2024-01-25 19:42:15', '2024-01-25 19:42:15', NULL),
(43, 18, 51, 41, 'App\\Models\\ProjectIndividualContractor', 22, 75, 9000, '2024-01-25 19:42:29', '2024-01-25 19:42:29', NULL),
(44, 18, 52, 41, 'App\\Models\\ProjectIndividualContractor', 22, 30, 15000, '2024-01-25 19:42:51', '2024-01-25 19:42:51', NULL),
(45, 18, 54, 41, 'App\\Models\\ProjectIndividualContractor', 22, 75, 9300, '2024-01-25 19:43:16', '2024-01-25 19:43:16', NULL),
(46, 19, 11, 71, 'App\\Models\\ProjectIndividualContractor', 10, 350, 3500, '2024-01-25 23:07:55', '2024-01-30 14:24:09', NULL),
(47, 9, 13, 61, 'App\\Models\\ProjectIndividualContractor', 10, 300, 600, '2024-01-26 01:27:17', '2024-01-30 14:23:57', NULL),
(48, 20, 76, 61, 'App\\Models\\ProjectIndividualContractor', 21, 1800, 2520000, '2024-01-26 01:29:35', '2024-01-26 01:29:35', NULL),
(49, 21, 5, 72, 'App\\Models\\ProjectIndividualContractor', 5, 60, 1800, '2024-01-26 10:04:32', '2024-01-26 10:04:32', NULL),
(50, 22, 28, 72, 'App\\Models\\ProjectIndividualContractor', 11, 145, 108750, '2024-01-26 10:11:00', '2024-01-26 10:11:00', NULL),
(51, 23, 56, 61, 'App\\Models\\ProjectIndividualContractor', 23, 1250, 43750, '2024-01-26 16:09:05', '2024-01-26 16:10:30', NULL),
(52, 23, 57, 61, 'App\\Models\\ProjectIndividualContractor', 23, 1100, 49500, '2024-01-26 16:09:40', '2024-01-26 16:10:43', NULL),
(53, 23, 58, 61, 'App\\Models\\ProjectIndividualContractor', 23, 1800, 18000, '2024-01-26 16:09:51', '2024-01-26 16:11:00', NULL),
(54, 23, 59, 61, 'App\\Models\\ProjectIndividualContractor', 23, 1100, 5500, '2024-01-26 16:10:17', '2024-01-26 16:10:17', NULL),
(55, 23, 60, 61, 'App\\Models\\ProjectIndividualContractor', 23, 2500, 10000, '2024-01-26 16:11:13', '2024-01-26 16:11:51', NULL),
(56, 23, 61, 61, 'App\\Models\\ProjectIndividualContractor', 23, 40, 16000, '2024-01-26 16:12:17', '2024-01-26 17:00:14', NULL),
(57, 23, 62, 61, 'App\\Models\\ProjectIndividualContractor', 23, 60, 18000, '2024-01-26 16:12:29', '2024-01-26 16:59:46', NULL),
(58, 23, 63, 61, 'App\\Models\\ProjectIndividualContractor', 23, 70, 21000, '2024-01-26 16:12:40', '2024-01-26 16:17:26', NULL),
(59, 23, 64, 61, 'App\\Models\\ProjectIndividualContractor', 23, 80, 16000, '2024-01-26 16:12:56', '2024-01-26 16:12:56', NULL),
(60, 23, 65, 61, 'App\\Models\\ProjectIndividualContractor', 23, 100, 4000, '2024-01-26 16:13:13', '2024-01-26 16:13:13', NULL),
(61, 23, 66, 61, 'App\\Models\\ProjectIndividualContractor', 23, 25, 5000, '2024-01-26 16:14:03', '2024-01-26 16:14:24', NULL),
(62, 23, 67, 61, 'App\\Models\\ProjectIndividualContractor', 23, 250, 1000, '2024-01-26 16:14:42', '2024-01-26 16:14:42', NULL),
(63, 23, 68, 61, 'App\\Models\\ProjectIndividualContractor', 23, 12000, 12000, '2024-01-26 16:15:08', '2024-01-26 16:15:08', NULL),
(64, 24, 77, 61, 'App\\Models\\ProjectIndividualContractor', 20, 1800, 144000, '2024-01-26 17:02:24', '2024-01-26 17:03:12', NULL),
(65, 25, 17, 61, 'App\\Models\\ProjectIndividualContractor', 11, 1800, 81000, '2024-01-26 17:04:14', '2024-01-26 17:04:14', NULL),
(66, 25, 18, 61, 'App\\Models\\ProjectIndividualContractor', 11, 1100, 66000, '2024-01-26 17:04:22', '2024-01-26 17:04:22', NULL),
(67, 25, 19, 61, 'App\\Models\\ProjectIndividualContractor', 11, 2100, 10500, '2024-01-26 17:04:42', '2024-01-26 17:04:42', NULL),
(68, 25, 20, 61, 'App\\Models\\ProjectIndividualContractor', 11, 1100, 4400, '2024-01-26 17:04:49', '2024-01-26 17:04:49', NULL),
(69, 25, 21, 61, 'App\\Models\\ProjectIndividualContractor', 11, 650, 19500, '2024-01-26 17:05:02', '2024-01-26 17:05:15', NULL),
(70, 25, 22, 61, 'App\\Models\\ProjectIndividualContractor', 11, 60, 39000, '2024-01-26 17:05:30', '2024-01-26 17:05:30', NULL),
(71, 25, 23, 61, 'App\\Models\\ProjectIndividualContractor', 11, 90, 49500, '2024-01-26 17:05:51', '2024-01-26 17:05:51', NULL),
(72, 25, 24, 61, 'App\\Models\\ProjectIndividualContractor', 11, 120, 24000, '2024-01-26 17:06:17', '2024-01-26 17:06:17', NULL),
(73, 25, 25, 61, 'App\\Models\\ProjectIndividualContractor', 11, 80, 24000, '2024-01-26 17:06:28', '2024-01-26 17:06:28', NULL),
(74, 25, 26, 61, 'App\\Models\\ProjectIndividualContractor', 11, 12000, 12000, '2024-01-26 17:06:37', '2024-01-26 17:06:37', NULL),
(75, 25, 27, 61, 'App\\Models\\ProjectIndividualContractor', 11, 100, 6000, '2024-01-26 17:06:44', '2024-01-26 17:06:44', NULL),
(76, 25, 29, 61, 'App\\Models\\ProjectIndividualContractor', 11, 1800, 90000, '2024-01-26 17:07:17', '2024-01-26 17:07:17', NULL),
(77, 26, 79, 32, 'App\\Models\\ProjectIndividualContractor', 20, 225, 22500, '2024-01-26 18:13:25', '2024-01-26 18:13:25', NULL),
(78, 26, 80, 32, 'App\\Models\\ProjectIndividualContractor', 20, 550, 79750, '2024-01-26 18:14:20', '2024-01-26 18:14:20', NULL),
(79, 27, 54, 72, 'App\\Models\\ProjectIndividualContractor', 22, 60, 7440, '2024-01-26 18:32:13', '2024-01-26 18:32:13', NULL),
(80, 28, 79, 11, 'App\\Models\\ProjectIndividualContractor', 20, 1000, 100000, '2024-02-01 11:51:29', '2024-02-01 11:51:29', NULL),
(81, 28, 80, 11, 'App\\Models\\ProjectIndividualContractor', 20, 3000, 435000, '2024-02-01 11:51:52', '2024-02-01 11:51:52', NULL),
(82, 27, 51, 72, 'App\\Models\\ProjectIndividualContractor', 22, 70, 8400, '2024-02-01 18:43:09', '2024-02-01 18:45:58', NULL),
(83, 27, 50, 72, 'App\\Models\\ProjectIndividualContractor', 22, 70, 28000, '2024-02-01 18:43:30', '2024-02-01 18:46:21', NULL),
(84, 27, 52, 72, 'App\\Models\\ProjectIndividualContractor', 22, 30, 15000, '2024-02-01 18:44:10', '2024-02-01 18:44:10', NULL),
(85, 27, 53, 72, 'App\\Models\\ProjectIndividualContractor', 22, 35, 1120, '2024-02-01 18:44:22', '2024-02-01 18:44:22', NULL),
(86, 27, 55, 72, 'App\\Models\\ProjectIndividualContractor', 22, 10, 300, '2024-02-01 18:44:57', '2024-02-01 18:44:57', NULL),
(87, 29, 76, 112, 'App\\Models\\ProjectIndividualContractor', 21, 450, 630000, '2024-02-05 17:18:15', '2024-02-05 17:18:15', NULL),
(88, 30, 2, 113, 'App\\Models\\ProjectIndividualContractor', 2, 1200, 36000, '2024-02-05 21:13:19', '2024-02-05 21:13:19', NULL),
(89, 31, 1, 113, 'App\\Models\\ProjectIndividualContractor', 1, 1500, 150000, '2024-02-05 21:14:16', '2024-02-05 21:14:16', NULL),
(90, 32, 79, 113, 'App\\Models\\ProjectIndividualContractor', 20, 1200, 120000, '2024-02-05 21:14:53', '2024-02-05 21:14:53', NULL),
(91, 33, 77, 112, 'App\\Models\\ProjectIndividualContractor', 20, 600, 48000, '2024-02-06 00:53:45', '2024-02-06 00:53:45', NULL),
(92, 34, 17, 112, 'App\\Models\\ProjectIndividualContractor', 11, 600, 27000, '2024-02-06 00:54:54', '2024-02-06 00:54:54', NULL),
(93, 35, 56, 112, 'App\\Models\\ProjectIndividualContractor', 23, 450, 15750, '2024-02-06 00:58:10', '2024-02-06 00:58:10', NULL),
(94, 35, 57, 112, 'App\\Models\\ProjectIndividualContractor', 23, 650, 29250, '2024-02-06 00:58:29', '2024-02-06 00:58:29', NULL),
(95, 35, 58, 112, 'App\\Models\\ProjectIndividualContractor', 23, 750, 7500, '2024-02-06 00:58:44', '2024-02-06 00:58:44', NULL),
(96, 35, 59, 112, 'App\\Models\\ProjectIndividualContractor', 23, 600, 3000, '2024-02-06 00:59:03', '2024-02-06 00:59:03', NULL),
(97, 35, 60, 112, 'App\\Models\\ProjectIndividualContractor', 23, 1000, 4000, '2024-02-06 00:59:15', '2024-02-06 00:59:15', NULL),
(98, 35, 61, 112, 'App\\Models\\ProjectIndividualContractor', 23, 40, 16000, '2024-02-06 00:59:44', '2024-02-06 01:02:51', NULL),
(99, 35, 62, 112, 'App\\Models\\ProjectIndividualContractor', 23, 45, 13500, '2024-02-06 01:00:36', '2024-02-06 01:02:34', NULL),
(100, 35, 63, 112, 'App\\Models\\ProjectIndividualContractor', 23, 55, 16500, '2024-02-06 01:02:16', '2024-02-06 01:02:16', NULL),
(101, 35, 64, 112, 'App\\Models\\ProjectIndividualContractor', 23, 30, 6000, '2024-02-06 01:03:14', '2024-02-06 01:03:14', NULL),
(102, 35, 65, 112, 'App\\Models\\ProjectIndividualContractor', 23, 100, 4000, '2024-02-06 01:03:34', '2024-02-06 01:03:34', NULL),
(103, 35, 66, 112, 'App\\Models\\ProjectIndividualContractor', 23, 80, 16000, '2024-02-06 01:03:55', '2024-02-06 01:03:55', NULL),
(104, 35, 67, 112, 'App\\Models\\ProjectIndividualContractor', 23, 250, 1000, '2024-02-06 01:04:12', '2024-02-06 01:04:12', NULL),
(105, 35, 68, 112, 'App\\Models\\ProjectIndividualContractor', 23, 1500, 1500, '2024-02-06 01:04:41', '2024-02-06 01:04:41', NULL),
(106, 32, 80, 113, 'App\\Models\\ProjectIndividualContractor', 20, 12000, 1740000, '2024-02-06 01:16:27', '2024-02-06 01:16:27', NULL),
(107, 36, 49, 122, 'App\\Models\\ProjectIndividualContractor', 13, 160, 40000, '2024-02-06 08:41:27', '2024-02-06 08:41:27', NULL),
(108, 37, 4, 124, 'App\\Models\\ProjectIndividualContractor', 4, 20000, 600000, '2024-02-06 11:25:09', '2024-02-06 15:59:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_work_request_images`
--

CREATE TABLE `project_work_request_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_work_request_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'path stored here',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_work_types`
--

CREATE TABLE `project_work_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `project_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `work_type_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL COMMENT 'when user assigend then timestamp store here',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_work_types`
--

INSERT INTO `project_work_types` (`id`, `project_type`, `project_id`, `project_type_id`, `work_type_id`, `assigned_user_id`, `assigned_at`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App\\Models\\ProjectIndividualContractor', 1, 2, 6, NULL, NULL, 1, '2024-01-23 12:28:08', '2024-01-23 12:28:08', NULL),
(2, 'App\\Models\\ProjectIndividualContractor', 2, 2, 6, NULL, NULL, 1, '2024-01-23 12:37:55', '2024-01-23 12:37:55', NULL),
(3, 'App\\Models\\ProjectIndividualContractor', 3, 2, 2, NULL, NULL, 1, '2024-01-23 13:30:37', '2024-01-23 13:30:37', NULL),
(4, 'App\\Models\\ProjectIndividualContractor', 4, 2, 12, NULL, NULL, 1, '2024-01-23 13:32:16', '2024-01-23 13:32:16', NULL),
(5, 'App\\Models\\ProjectIndividualContractor', 5, 2, 3, NULL, NULL, 1, '2024-01-23 13:34:37', '2024-01-23 13:34:37', NULL),
(6, 'App\\Models\\ProjectIndividualContractor', 6, 2, 4, NULL, NULL, 1, '2024-01-23 13:46:20', '2024-01-23 13:46:20', NULL),
(7, 'App\\Models\\ProjectIndividualContractor', 7, 2, 5, NULL, NULL, 1, '2024-01-23 13:48:11', '2024-01-23 13:48:11', NULL),
(8, 'App\\Models\\ProjectIndividualContractor', 8, 2, 9, NULL, NULL, 1, '2024-01-23 13:50:18', '2024-01-23 13:50:18', NULL),
(9, 'App\\Models\\ProjectIndividualContractor', 9, 2, 10, NULL, NULL, 1, '2024-01-23 13:53:04', '2024-01-23 13:59:51', '2024-01-23 13:59:51'),
(10, 'App\\Models\\ProjectIndividualContractor', 9, 2, 10, NULL, NULL, 1, '2024-01-23 14:00:15', '2024-01-23 14:00:15', NULL),
(11, 'App\\Models\\ProjectIndividualContractor', 10, 2, 2, NULL, NULL, 1, '2024-01-23 16:34:17', '2024-01-23 16:34:17', NULL),
(12, 'App\\Models\\ProjectIndividualContractor', 11, 2, 12, NULL, NULL, 1, '2024-01-23 17:08:28', '2024-01-23 17:08:28', NULL),
(13, 'App\\Models\\ProjectIndividualContractor', 11, 2, 2, NULL, NULL, 1, '2024-01-23 17:10:42', '2024-01-23 17:10:42', NULL),
(14, 'App\\Models\\ProjectIndividualContractor', 11, 2, 3, NULL, NULL, 1, '2024-01-23 18:14:15', '2024-01-23 18:14:15', NULL),
(15, 'App\\Models\\ProjectIndividualContractor', 14, 2, 4, NULL, NULL, 1, '2024-01-23 20:43:23', '2024-01-23 20:43:23', NULL),
(16, 'App\\Models\\ProjectIndividualContractor', 15, 2, 4, 58, '2024-01-24 00:08:50', 1, '2024-01-23 23:58:37', '2024-01-24 00:08:51', NULL),
(17, 'App\\Models\\ProjectIndividualContractor', 16, 2, 6, NULL, NULL, 1, '2024-01-24 00:21:35', '2024-01-24 00:21:35', NULL),
(18, 'App\\Models\\ProjectIndividualContractor', 16, 2, 4, 58, '2024-01-24 00:34:48', 1, '2024-01-24 00:26:53', '2024-01-24 00:34:48', NULL),
(19, 'App\\Models\\ProjectTurnkeyContractor', 1, 1, 2, NULL, NULL, 1, '2024-01-24 00:58:59', '2024-01-24 00:58:59', NULL),
(20, 'App\\Models\\ProjectTurnkeyContractor', 1, 1, 4, NULL, NULL, 1, '2024-01-24 00:59:29', '2024-01-24 00:59:29', NULL),
(21, 'App\\Models\\ProjectIndividualContractor', 17, 2, 6, NULL, NULL, 1, '2024-01-24 10:39:40', '2024-01-24 10:39:40', NULL),
(22, 'App\\Models\\ProjectIndividualContractor', 18, 2, 4, NULL, NULL, 1, '2024-01-24 16:16:24', '2024-01-24 16:16:24', NULL),
(23, 'App\\Models\\ProjectIndividualContractor', 19, 2, 6, NULL, NULL, 1, '2024-01-24 16:26:41', '2024-01-24 16:26:41', NULL),
(24, 'App\\Models\\ProjectIndividualContractor', 17, 2, 2, NULL, NULL, 1, '2024-01-24 16:28:27', '2024-01-24 16:28:27', NULL),
(25, 'App\\Models\\ProjectIndividualContractor', 12, 2, 6, NULL, NULL, 1, '2024-01-24 16:41:03', '2024-01-24 16:41:03', NULL),
(26, 'App\\Models\\ProjectIndividualContractor', 13, 2, 12, NULL, NULL, 1, '2024-01-24 16:41:56', '2024-01-24 16:41:56', NULL),
(27, 'App\\Models\\ProjectIndividualContractor', 22, 2, 3, NULL, NULL, 1, '2024-01-24 16:44:22', '2024-01-24 16:44:22', NULL),
(28, 'App\\Models\\ProjectIndividualContractor', 23, 2, 2, NULL, NULL, 1, '2024-01-24 16:52:38', '2024-01-24 16:52:38', NULL),
(29, 'App\\Models\\ProjectIndividualContractor', 24, 2, 12, NULL, NULL, 1, '2024-01-24 17:04:43', '2024-01-24 17:04:43', NULL),
(30, 'App\\Models\\ProjectIndividualContractor', 21, 2, 2, NULL, NULL, 1, '2024-01-24 18:04:30', '2024-01-24 18:04:30', NULL),
(31, 'App\\Models\\ProjectIndividualContractor', 20, 2, 2, NULL, NULL, 1, '2024-01-24 18:05:52', '2024-01-24 18:05:52', NULL),
(32, 'App\\Models\\ProjectIndividualContractor', 20, 2, 12, NULL, NULL, 1, '2024-01-24 18:18:32', '2024-01-24 18:18:32', NULL),
(33, 'App\\Models\\ProjectIndividualContractor', 20, 2, 6, NULL, NULL, 1, '2024-01-24 18:21:04', '2024-01-24 18:21:04', NULL),
(34, 'App\\Models\\ProjectIndividualContractor', 25, 2, 6, NULL, NULL, 1, '2024-01-25 12:54:18', '2024-01-25 12:54:18', NULL),
(35, 'App\\Models\\ProjectTurnkeyContractor', 2, 1, 4, NULL, NULL, 1, '2024-01-27 17:54:51', '2024-01-27 17:54:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_work_type_applications`
--

CREATE TABLE `project_work_type_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_work_type_id` bigint(20) UNSIGNED NOT NULL,
  `project_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total` int(11) NOT NULL DEFAULT '0' COMMENT 'user applied requests sum here',
  `over_all_total` int(11) NOT NULL DEFAULT '0' COMMENT 'totalmultiply by quantity applied requests sum here',
  `application_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0-pending/applied ,1-meet,2-assigned',
  `meet_at` timestamp NULL DEFAULT NULL COMMENT 'if request meet true then it store timestamp',
  `applied_at` timestamp NULL DEFAULT NULL COMMENT 'timestamp store when user apply or apply api call',
  `assigned_at` timestamp NULL DEFAULT NULL COMMENT 'when user assigend then timestamp store here',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_work_type_applications`
--

INSERT INTO `project_work_type_applications` (`id`, `project_work_type_id`, `project_type`, `project_id`, `user_id`, `role_id`, `sub_total`, `over_all_total`, `application_status`, `meet_at`, `applied_at`, `assigned_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'App\\Models\\ProjectIndividualContractor', 3, 51, 2, 900, 27000, '0', NULL, '2024-01-23 14:19:59', NULL, '2024-01-23 14:19:53', '2024-01-23 14:19:59', NULL),
(2, 14, 'App\\Models\\ProjectIndividualContractor', 11, 55, 2, 75, 56250, '1', '2024-01-23 18:23:43', '2024-01-23 18:20:19', NULL, '2024-01-23 18:20:16', '2024-01-23 18:23:43', NULL),
(3, 16, 'App\\Models\\ProjectIndividualContractor', 15, 58, 2, 60, 30000, '2', '2024-01-24 00:03:37', '2024-01-24 00:01:22', '2024-01-24 00:08:50', '2024-01-24 00:01:14', '2024-01-24 00:08:51', NULL),
(4, 13, 'App\\Models\\ProjectIndividualContractor', 11, 51, 2, 9038, 201200, '0', NULL, '2024-01-24 00:19:36', NULL, '2024-01-24 00:13:22', '2024-01-24 00:19:36', NULL),
(5, 18, 'App\\Models\\ProjectIndividualContractor', 16, 58, 2, 70, 210000, '2', '2024-01-24 00:33:45', '2024-01-24 00:30:12', '2024-01-24 00:34:48', '2024-01-24 00:30:08', '2024-01-24 00:34:48', NULL),
(6, 17, 'App\\Models\\ProjectIndividualContractor', 16, 32, 2, 550, 33000, '0', NULL, '2024-01-24 10:54:23', NULL, '2024-01-24 10:54:11', '2024-01-24 10:54:23', NULL),
(7, 21, 'App\\Models\\ProjectIndividualContractor', 17, 48, 2, 300, 40000, '0', NULL, '2024-01-24 16:36:35', NULL, '2024-01-24 16:35:45', '2024-01-24 16:36:35', NULL),
(8, 24, 'App\\Models\\ProjectIndividualContractor', 17, 48, 2, 400, 40000, '0', NULL, '2024-01-24 16:44:40', NULL, '2024-01-24 16:43:13', '2024-01-24 16:44:40', NULL),
(9, 11, 'App\\Models\\ProjectIndividualContractor', 10, 61, 2, 1460, 3400, '0', NULL, '2024-01-26 01:27:21', NULL, '2024-01-24 20:26:43', '2024-01-30 14:24:09', NULL),
(10, 30, 'App\\Models\\ProjectIndividualContractor', 21, 51, 2, 600, 840000, '0', NULL, '2024-01-24 20:40:39', NULL, '2024-01-24 20:39:12', '2024-01-24 20:40:39', NULL),
(11, 31, 'App\\Models\\ProjectIndividualContractor', 20, 51, 2, 625, 50000, '0', NULL, '2024-01-24 20:40:49', NULL, '2024-01-24 20:39:53', '2024-01-24 20:40:49', NULL),
(12, 27, 'App\\Models\\ProjectIndividualContractor', 22, 63, 2, 415, 89920, '0', NULL, NULL, NULL, '2024-01-24 21:18:39', '2024-01-24 21:21:15', NULL),
(13, 5, 'App\\Models\\ProjectIndividualContractor', 5, 63, 2, 1000, 30000, '0', NULL, NULL, NULL, '2024-01-24 21:22:05', '2024-01-24 21:22:05', NULL),
(14, 14, 'App\\Models\\ProjectIndividualContractor', 11, 63, 2, 120, 90000, '0', NULL, NULL, NULL, '2024-01-24 21:22:35', '2024-01-24 21:22:35', NULL),
(15, 33, 'App\\Models\\ProjectIndividualContractor', 20, 64, 2, 1750, 253750, '0', NULL, NULL, NULL, '2024-01-24 22:48:24', '2024-01-24 22:48:24', NULL),
(16, 17, 'App\\Models\\ProjectIndividualContractor', 16, 64, 2, 1600, 96000, '0', NULL, '2024-01-25 13:17:14', NULL, '2024-01-25 13:17:00', '2024-01-25 13:17:14', NULL),
(17, 22, 'App\\Models\\ProjectIndividualContractor', 18, 68, 2, 3110, 154800, '0', NULL, '2024-01-25 17:34:03', NULL, '2024-01-25 17:32:21', '2024-01-25 17:34:03', NULL),
(18, 27, 'App\\Models\\ProjectIndividualContractor', 22, 41, 2, 255, 63300, '0', NULL, NULL, NULL, '2024-01-25 19:42:15', '2024-01-25 19:43:16', NULL),
(19, 11, 'App\\Models\\ProjectIndividualContractor', 10, 71, 2, 350, 3500, '0', NULL, NULL, NULL, '2024-01-25 23:07:55', '2024-01-30 14:24:09', NULL),
(20, 30, 'App\\Models\\ProjectIndividualContractor', 21, 61, 2, 1800, 2520000, '0', NULL, '2024-01-26 01:29:37', NULL, '2024-01-26 01:29:35', '2024-01-26 01:29:37', NULL),
(21, 5, 'App\\Models\\ProjectIndividualContractor', 5, 72, 2, 60, 1800, '0', NULL, '2024-01-26 10:05:27', NULL, '2024-01-26 10:04:32', '2024-01-26 10:05:27', NULL),
(22, 14, 'App\\Models\\ProjectIndividualContractor', 11, 72, 2, 145, 108750, '0', NULL, '2024-01-26 10:11:03', NULL, '2024-01-26 10:11:00', '2024-01-26 10:11:03', NULL),
(23, 28, 'App\\Models\\ProjectIndividualContractor', 23, 61, 2, 20375, 219750, '0', NULL, '2024-01-26 17:00:42', NULL, '2024-01-26 16:09:05', '2024-01-26 17:00:42', NULL),
(24, 31, 'App\\Models\\ProjectIndividualContractor', 20, 61, 2, 1800, 144000, '0', NULL, '2024-01-26 17:02:27', NULL, '2024-01-26 17:02:24', '2024-01-26 17:03:12', NULL),
(25, 13, 'App\\Models\\ProjectIndividualContractor', 11, 61, 2, 21000, 425900, '0', NULL, '2024-01-26 17:07:24', NULL, '2024-01-26 17:04:14', '2024-01-26 17:07:24', NULL),
(26, 33, 'App\\Models\\ProjectIndividualContractor', 20, 32, 2, 775, 102250, '0', NULL, NULL, NULL, '2024-01-26 18:13:25', '2024-01-26 18:14:20', NULL),
(27, 27, 'App\\Models\\ProjectIndividualContractor', 22, 72, 2, 275, 60260, '0', NULL, '2024-02-01 18:45:01', NULL, '2024-01-26 18:32:13', '2024-02-01 18:46:21', NULL),
(28, 33, 'App\\Models\\ProjectIndividualContractor', 20, 11, 2, 4000, 535000, '0', NULL, '2024-02-01 11:52:01', NULL, '2024-02-01 11:51:29', '2024-02-01 11:52:01', NULL),
(29, 30, 'App\\Models\\ProjectIndividualContractor', 21, 112, 2, 450, 630000, '0', NULL, '2024-02-05 17:18:21', NULL, '2024-02-05 17:18:15', '2024-02-05 17:18:21', NULL),
(30, 2, 'App\\Models\\ProjectIndividualContractor', 2, 113, 2, 1200, 36000, '0', NULL, NULL, NULL, '2024-02-05 21:13:19', '2024-02-05 21:13:19', NULL),
(31, 1, 'App\\Models\\ProjectIndividualContractor', 1, 113, 2, 1500, 150000, '0', NULL, NULL, NULL, '2024-02-05 21:14:16', '2024-02-05 21:14:16', NULL),
(32, 33, 'App\\Models\\ProjectIndividualContractor', 20, 113, 2, 13200, 1860000, '0', NULL, NULL, NULL, '2024-02-05 21:14:53', '2024-02-06 01:16:27', NULL),
(33, 31, 'App\\Models\\ProjectIndividualContractor', 20, 112, 2, 600, 48000, '0', NULL, NULL, NULL, '2024-02-06 00:53:45', '2024-02-06 00:53:45', NULL),
(34, 13, 'App\\Models\\ProjectIndividualContractor', 11, 112, 2, 600, 27000, '0', NULL, NULL, NULL, '2024-02-06 00:54:54', '2024-02-06 00:54:54', NULL),
(35, 28, 'App\\Models\\ProjectIndividualContractor', 23, 112, 2, 5550, 134000, '0', NULL, '2024-02-06 01:04:48', NULL, '2024-02-06 00:58:10', '2024-02-06 01:04:48', NULL),
(36, 26, 'App\\Models\\ProjectIndividualContractor', 13, 122, 2, 160, 40000, '0', NULL, '2024-02-06 08:41:35', NULL, '2024-02-06 08:41:27', '2024-02-06 08:41:35', NULL),
(37, 4, 'App\\Models\\ProjectIndividualContractor', 4, 124, 2, 20000, 600000, '0', NULL, '2024-02-06 11:25:15', NULL, '2024-02-06 11:25:09', '2024-02-06 15:59:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Residential', 1, NULL, NULL, NULL),
(2, 'Commercial', 1, NULL, NULL, NULL),
(3, 'Other', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review_categories`
--

CREATE TABLE `review_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'type for internal use',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review_categories`
--

INSERT INTO `review_categories` (`id`, `name`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Quality Of Work', NULL, '2023-10-30 20:01:23', NULL, NULL),
(2, 'Timely Completion of work', NULL, '2023-10-30 20:02:03', NULL, NULL),
(3, 'Vendors and workers behaviour and attitude', NULL, '2023-10-30 07:30:00', NULL, NULL),
(4, 'Team Strength', NULL, '2023-10-30 20:02:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review_ratings`
--

CREATE TABLE `review_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review_user_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `review_by_user` bigint(20) UNSIGNED DEFAULT NULL,
  `review_category_id` bigint(20) UNSIGNED NOT NULL,
  `rating` double NOT NULL DEFAULT '0' COMMENT 'store rating here by 5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review_ratings`
--

INSERT INTO `review_ratings` (`id`, `review_user_id`, `user_id`, `review_by_user`, `review_category_id`, `rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 58, 8, 1, 5, '2024-01-24 00:38:42', '2024-01-24 00:38:42', NULL),
(2, 1, 58, 8, 2, 5, '2024-01-24 00:38:42', '2024-01-24 00:38:42', NULL),
(3, 1, 58, 8, 3, 1, '2024-01-24 00:38:42', '2024-01-24 00:40:09', NULL),
(4, 1, 58, 8, 4, 1.5, '2024-01-24 00:38:42', '2024-01-24 00:40:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review_users`
--

CREATE TABLE `review_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `review_by_user` bigint(20) UNSIGNED DEFAULT NULL,
  `review_by_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'this field only store when admin added fake review to perticular user',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'brief about vendor skill ',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review_users`
--

INSERT INTO `review_users` (`id`, `user_id`, `review_by_user`, `review_by_name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 58, 8, NULL, NULL, 1, '2024-01-24 00:38:42', '2024-01-24 00:38:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'this field store name as in snake case',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `role`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Turnkey Contractor', 'turnkey_contractor', 1, NULL, NULL, NULL),
(2, 'Individual Contractor', 'individual_contractor', 1, NULL, NULL, NULL),
(3, 'Labour', 'labour', 1, NULL, NULL, NULL),
(4, 'Designer', 'designer', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_work_professions`
--

CREATE TABLE `role_work_professions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `work_profession_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'store in small case',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `unit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sqft', 'sqft', 1, NULL, NULL, NULL),
(2, 'Rft', 'rft', 1, NULL, NULL, NULL),
(3, 'Nos', 'nos', 1, NULL, NULL, NULL),
(4, 'Per Point', 'per point', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'profile photo path here',
  `oauth_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-no, 1-yes',
  `current_work` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'is selected hire for work or find work default set for app purpose',
  `elemantra_verification` enum('0','1','2') COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '0-not applied,1-pending/applied ,2-verified',
  `verification_step` int(11) DEFAULT NULL COMMENT 'default null if requested for verififcation then it will be onboard step current id after verified then it store 0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `uuid` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'app playerid store here for one signal push notification',
  `verification_requested_at` timestamp NULL DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `alt_phone`, `email`, `email_verified_at`, `password`, `remember_token`, `role_id`, `profile`, `oauth_login`, `current_work`, `elemantra_verification`, `verification_step`, `status`, `uuid`, `verification_requested_at`, `verified_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test', '9111111111', NULL, NULL, NULL, '$2y$10$Jucw7OZ/U33O5KiLq0b15urk2bPdVWgHOjcF.ZK0R2dTg71iR1PMC', NULL, 1, 'public/profile/1_profile.png', 0, 'hireWork', '0', NULL, 1, 'eaf06b7c-11a2-456a-9508-972206cc7be8', NULL, NULL, '2024-01-04 11:23:16', '2024-01-24 16:52:09', NULL),
(2, 'Shashank', '9920280114', NULL, NULL, NULL, '$2y$10$nTZg8GFTN.PdGQOGyQTr2e3Fpd4MJFLsgtxQf/t5gippuxVQni63.', NULL, 4, NULL, 0, NULL, '0', NULL, 1, 'f059f8a2-47d1-4cce-a558-53321eeea172', NULL, NULL, '2024-01-05 09:52:17', '2024-02-02 17:15:58', NULL),
(3, 'Chandana S', '8792853707', NULL, NULL, NULL, '$2y$10$GIibHj2FdX6EVlFEdvXu6OPw8epC3ulcj86va3dR1eSv1AdwvS6fG', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, '975e5a7d-8c24-4feb-8582-31a241744b5b', NULL, NULL, '2024-01-05 09:52:56', '2024-01-13 04:46:50', NULL),
(4, 'test', '9769965692', NULL, NULL, NULL, '$2y$10$79lScIz9bEjGjy/vIkNf8uLuXYNNcTQPiGw04lPgi1m9k1R5JMRuy', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, 'd9185134-7b8d-4c31-8219-ea26ceaba2d0', NULL, NULL, '2024-01-05 10:48:04', '2024-01-05 10:48:16', NULL),
(5, 'Dipti Sane', NULL, NULL, 'dipti.sane@elemantra.in', '2024-01-06 07:26:59', NULL, NULL, 1, NULL, 1, 'hireWork', '0', NULL, 1, '0c9826b7-1d92-4900-999a-8d25a4c7662f', NULL, NULL, '2024-01-06 07:26:59', '2024-01-20 12:39:25', NULL),
(6, 'Manohar', '9582365423', NULL, 'xyz@gmail.com', NULL, '$2y$10$9u8yhsOUnustY5PH.i1Kze/R9h9zyXj3H/poka.pAhnjP1I9W4Ywe', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, 'd94e3c30-9706-492b-ba0e-e9d7d8fde6de', NULL, NULL, '2024-01-06 11:12:25', '2024-01-11 09:41:01', NULL),
(7, 'Sunay Shah', '9821581999', NULL, NULL, NULL, '$2y$10$px4SMrB7rpRR.D.9EKC3kOAcG13QX7teWu14IVWTnoYZhgKYQ8SYS', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, 'ea03f5c5-bfc6-44ab-a24a-8dc22ec1aa12', NULL, NULL, '2024-01-07 09:16:30', '2024-01-18 05:44:46', NULL),
(8, 'Arpit Vishwakarma', '8976601017', NULL, 'arpit848@gmail.com', NULL, '$2y$10$OkOXFivFVf2zmlwd7QtPU.9B.kJWlj/U6tIP6kU7TPSfoqYveQgHC', NULL, 1, 'public/profile/8_profile.jpeg', 0, 'hireWork', '0', NULL, 1, 'e331f646-32f8-4ae2-bcdb-d6ceec29eaae', NULL, NULL, '2024-01-08 09:12:01', '2024-01-24 17:11:54', NULL),
(10, 'shyam', '9222222222', NULL, NULL, NULL, '$2y$10$ijiDaY2QIAlJBHPLRzKFh.ikAzr5zAyJ9fMR5XZremQ/m1IDhl2mq', NULL, 3, NULL, 0, NULL, '0', NULL, 1, 'a656109a-0ced-4ed7-b287-bdfe19bea6af', NULL, NULL, '2024-01-13 06:01:23', '2024-01-13 06:01:26', '2024-01-13 06:04:07'),
(11, 'Shreyans _ Indi', '9167119131', NULL, NULL, NULL, '$2y$10$mGALGNCLBe6KxQblVar3JuWKRQaRMlb5cwLY/w/nSalj1Axn1Bf1K', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '5a90b41c-7af1-4ff1-9d91-530cc13802ca', NULL, NULL, '2024-01-13 06:30:41', '2024-02-01 11:50:42', NULL),
(14, 'human life', NULL, NULL, 'srishyama01@gmail.com', '2024-01-13 07:30:35', NULL, NULL, 4, NULL, 1, NULL, '0', NULL, 1, 'c09fb178-d312-4ffa-a9b8-c43736be4e35', NULL, NULL, '2024-01-13 07:30:35', '2024-01-22 17:00:43', NULL),
(15, 'shreyans', NULL, NULL, 'shreyansnitin1@gmail.com', '2024-01-13 09:15:00', NULL, NULL, 1, NULL, 1, 'hireWork', '0', NULL, 1, '5a90b41c-7af1-4ff1-9d91-530cc13802ca', NULL, NULL, '2024-01-13 09:15:00', '2024-02-01 11:54:08', NULL),
(16, 'Testing', '9999999991', NULL, NULL, NULL, '$2y$10$/E0D6TR8bLtcuJSmsKH5BeNhLBOcgoLyel81kM8OCcqyuwEVVTv5a', NULL, 1, NULL, 0, 'hireWork', '1', 1, 1, '4ad939d1-215a-4db5-888c-2e85b0f590ee', '2024-01-22 17:56:31', NULL, '2024-01-17 05:16:33', '2024-01-24 10:20:53', NULL),
(17, 'Omkar More 13', NULL, NULL, 'ommmore13@gmail.com', '2024-01-17 06:21:04', NULL, NULL, 1, NULL, 1, 'hireWork', '0', NULL, 1, 'a0797773-e628-4ea4-b22d-f14fb224e0d0', NULL, NULL, '2024-01-17 06:21:04', '2024-01-17 06:21:52', NULL),
(18, 'Testing', '9999999992', NULL, NULL, NULL, '$2y$10$cDeWsbsFrNOvxZZqsOhmZu.Ij9vpdcYPYbHJNgAdKS/regx9XPb9G', NULL, 4, 'public/profile/18_profile.jpeg', 0, NULL, '0', NULL, 1, 'b482eaea-6481-43dc-974a-7dc523465e94', NULL, NULL, '2024-01-17 07:06:18', '2024-01-24 13:39:09', NULL),
(19, 'P Test', '9999999993', NULL, NULL, NULL, '$2y$10$Ve5AoYexbVoufQ8gH97D5O0BsCFe2..MYgE7cdv814JGNZUH31.fC', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, 'f7f799ab-e166-4430-8637-1ce6bf025539', NULL, NULL, '2024-01-17 08:09:16', '2024-01-18 10:08:17', NULL),
(20, 'testing 02', '9999999994', NULL, NULL, NULL, '$2y$10$t88HrnTmZyqPFH0rAxnFNOjTLR9DGiiPhW.Q2yaDssgTIdG1Cz99G', NULL, 3, NULL, 0, NULL, '0', NULL, 1, '1c16f632-3ccf-4d03-a46b-39c18fcbd329', NULL, NULL, '2024-01-17 10:10:25', '2024-01-31 18:37:09', NULL),
(21, 'Shyamprasad Prajapati', NULL, NULL, 'shyamaprajapati01@gmail.com', '2024-01-17 23:45:26', NULL, NULL, 1, NULL, 1, 'hireWork', '0', NULL, 1, 'e5565a40-d874-4e10-8373-78b88364ecdf', NULL, NULL, '2024-01-17 23:45:26', '2024-01-17 23:51:20', NULL),
(22, 'ICtest', '8888888888', NULL, NULL, NULL, '$2y$10$kI/8pHeq5ySe9QfK7xxyEOkMtApeQW.Hr03kklnc.rwiSvEb/B0t2', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, '1c16f632-3ccf-4d03-a46b-39c18fcbd329', NULL, NULL, '2024-01-18 06:30:18', '2024-02-02 17:46:52', NULL),
(23, 'Testing', '9999999996', NULL, NULL, NULL, '$2y$10$NJrb1jmVwhFN7u69.PoaN.NvCkDUef/yIiJ.h0b2I2Ip3uY5zvqa2', NULL, 4, 'public/profile/23_profile.jpeg', 0, NULL, '0', NULL, 1, 'af700f4f-f4f8-40c0-82b8-3cd13a33e94a', NULL, NULL, '2024-01-18 10:24:47', '2024-01-25 15:28:07', NULL),
(24, 'Testing', '8888888881', NULL, NULL, NULL, '$2y$10$Y2FHoQ5o1Sel0npsJNPg2usqQRx92ouhE1DPkE7yrh4NznMoJakSe', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, '4ad939d1-215a-4db5-888c-2e85b0f590ee', NULL, NULL, '2024-01-18 10:25:26', '2024-01-24 10:20:01', NULL),
(25, 'Testing', '7777777771', NULL, NULL, NULL, '$2y$10$3sGy3MiGzgb9CAKvOnu4Ve0oTufnX7wdG5RigaEr32HbfTkF2vdfG', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, '4ad939d1-215a-4db5-888c-2e85b0f590ee', NULL, NULL, '2024-01-18 10:28:10', '2024-01-24 10:23:03', NULL),
(26, 'Ikram Ansari', '9833936382', '7700900588', 'ansikram87@gmail.com', NULL, '$2y$10$1frYpwzGxek9lqER0DWFiutHAqdB/c5UU0a/xbSj38JnN.V5DLeVC', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '6ec4f270-eec3-440f-a257-acbf0e70c86b', NULL, NULL, '2024-01-19 20:02:03', '2024-01-19 20:03:20', NULL),
(27, 'suraj vishwakarma', '8355957677', NULL, 'suraj.vishwakarma@elemantra.in', NULL, '$2y$10$HSlxM3psqFcS0HtrAUMZT.aB6AQr8Y4aUuofe37dUhff4txoBVXIq', NULL, 1, NULL, 0, NULL, '0', NULL, 1, NULL, NULL, NULL, '2024-01-20 11:14:41', '2024-01-20 11:14:41', NULL),
(28, 'Chandana Shivamadappa', NULL, NULL, 'chanbear1321@gmail.com', '2024-01-20 12:31:18', NULL, NULL, 1, NULL, 1, 'hireWork', '0', NULL, 1, '83b6aadb-8716-4496-92f0-7c9139cab797', NULL, NULL, '2024-01-20 12:31:18', '2024-01-30 15:04:30', NULL),
(29, 'Shahid Khan', '9892015879', NULL, 'k4khanshahid@gmail.com', NULL, '$2y$10$x5ZyCmQdMBsNKj17kwEB.ua9C2arM9MWR1eyCe8xWjxN1RFNl8DLK', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, '8c48e961-4fde-4cb9-870c-5f7e36c16253', NULL, NULL, '2024-01-20 12:41:08', '2024-01-20 13:31:16', NULL),
(30, 'Sudhakar Padmashali', '6362536261', NULL, NULL, NULL, '$2y$10$bz2D3omkHDUGjFQxwRQxiOiQ7m2sw/Gg/IVGid5QsoybKikv9I6dC', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, '5a90b41c-7af1-4ff1-9d91-530cc13802ca', NULL, NULL, '2024-01-20 12:48:58', '2024-02-01 11:52:38', NULL),
(32, 'ramniwas suthar', '9352321508', '8079069799', 'ramniwassuthar082@gmail.com', NULL, '$2y$10$xcaZlAKd/o7Ik5MJT/PwFOjxgeyesQTFt4oVYSR/VpibEknnQskDW', NULL, 2, 'public/profile/32_profile.jpeg', 0, 'findWork', '2', 7, 1, '6dd5fd05-2d53-4dbb-9bdc-70ca8a4c022b', '2024-01-20 14:13:08', NULL, '2024-01-20 13:41:35', '2024-02-06 07:15:12', NULL),
(33, 'Shashank Bansal', NULL, NULL, 'shashank.bansal@elemantra.in', '2024-01-20 14:31:36', NULL, NULL, 1, NULL, 1, 'findWork', '0', NULL, 1, '27413a7a-2030-46cd-b88c-622b3ae36f0c', NULL, NULL, '2024-01-20 14:31:36', '2024-01-20 14:32:12', NULL),
(34, 'Santosh maurya', '8828060675', '8603585110', NULL, NULL, '$2y$10$RRVEQlkrF/YISvBC5PT8PuBe7xnT.V8d.D7nSOl5.O5oOFYSCQXDW', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, '9c414d95-aeee-4a9f-afec-afe3e3ebf619', NULL, NULL, '2024-01-20 14:42:50', '2024-01-30 13:21:34', NULL),
(35, 'Niraj singh', '7045485028', '9372549027', 'neerajsingh7045@gmail.com', NULL, '$2y$10$1UHGyMkCj0CAzQoAFAJLwem3R47efm8.6nazkXQ7UhuS8XTGaRrUW', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '4e072f55-1778-4ad8-bf3b-f7ea16c3dfc4', NULL, NULL, '2024-01-20 17:55:59', '2024-01-31 17:27:26', NULL),
(36, 'umang shethia', '9594179494', NULL, NULL, NULL, '$2y$10$Kyyp0jiOkVqKUDqLLRAbmeeaohGqj173cXhrB6ezgAPRjg11cG.py', NULL, 4, NULL, 0, NULL, '0', NULL, 1, 'a9a7638b-e117-462a-be64-e6d84a44b344', NULL, NULL, '2024-01-21 23:24:10', '2024-01-21 23:24:11', NULL),
(37, 'ummedaram', '9082066490', '7378284958', 'umedaram104@gmail.com', NULL, '$2y$10$DkVxiLZil5.hczOj0M2s3uJe/3dJaOliDzRw6zPhacbjTYD9VjrJO', NULL, 1, 'public/profile/37_profile.jpeg', 0, 'hireWork', '1', 1, 1, '6481f2bb-33f2-49a0-93ae-aec4b4506723', '2024-01-23 18:20:34', NULL, '2024-01-22 11:36:34', '2024-01-23 18:20:58', NULL),
(38, 'dharmesh sapariya', '9769439740', NULL, 'dhrmshsapariya@gmail.com', NULL, '$2y$10$o4EVzgb7dqAiBV1xyboPUubAjZMIjxTiyWZFZUp4doaNBRZqvwUaC', NULL, 4, NULL, 0, NULL, '0', NULL, 1, '231af984-e906-4a25-ac49-4e8dd4443a57', NULL, NULL, '2024-01-22 12:23:09', '2024-01-22 12:23:09', NULL),
(39, 'Afsaruddin shaikh', '9867312856', '8108543173', NULL, NULL, '$2y$10$UPN54m6OLCHYv.bL6pttzuQOicDdBixnq1ipwcD481glYCZiy3D3e', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '14e2ab27-4bfe-425f-8ce5-1e32897485dd', NULL, NULL, '2024-01-22 16:11:12', '2024-01-22 16:34:22', NULL),
(40, 'SSK Enterprises', '9870748711', '8668325882', 'sskalel@rediffmail.com', NULL, '$2y$10$HIfDthvXfBZDxSjdI5yG8OETkrPNEwqLtmslRLp8Gfx5nxzH6XqUC', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '3639b367-bd0f-43a9-af3b-c3a87438da27', NULL, NULL, '2024-01-22 18:47:50', '2024-01-22 18:52:55', NULL),
(41, 'Mohammad Ayyub Khan', '9967862342', NULL, 'ayyub.khan91@gmail.com', NULL, '$2y$10$yCKiDUAHSXB1Jfj5cceloew/Iut21Q3HtLmQ9OZ054ZRYdQAvxnKu', NULL, 2, NULL, 0, 'findWork', '1', 1, 1, '71ab27ae-9a41-4d5f-8162-d8d5963735b5', '2024-01-22 19:09:48', NULL, '2024-01-22 19:00:40', '2024-01-22 19:14:31', NULL),
(42, 'Rupesh Kumar Sharma', '9967268099', '7715087779', 'r.kumarcivilcont1828@gmail.com', NULL, '$2y$10$R9hZRpRBkNv5NB9bFyudeu3TTqkAEZdB6Xi0m9gKku873bmCpfdDK', NULL, 1, NULL, 0, 'hireWork', '1', 1, 1, 'c8ee8594-8894-4455-9b5d-fff569400cd4', '2024-01-22 20:11:11', NULL, '2024-01-22 20:01:47', '2024-01-22 20:11:11', NULL),
(43, 'Vishal Singh', '7420990440', '8485027188', 'vss786845@gmail.com', NULL, '$2y$10$5r3Wpmzx9PxD6Ng1PqEutudlFOdsW13RrWjAC6tm39G2EhyBsFguO', NULL, 2, NULL, 0, NULL, '0', NULL, 1, '0912b1e2-d05b-441e-be07-61e16a36e27d', NULL, NULL, '2024-01-22 20:04:10', '2024-01-27 18:48:15', NULL),
(44, 'Riyaz khan', '9920612114', '9987171486', 'rk4962853@gmail.com', NULL, '$2y$10$ahCCuXonRcq9Z503ohkID.rLC5okljc.dH.0/TVPlGZpM/WjKvGU.', NULL, 1, NULL, 0, NULL, '0', NULL, 1, '1a3229f8-7cc4-499c-9f92-ef3073505045', NULL, NULL, '2024-01-22 21:32:24', '2024-01-22 21:48:24', NULL),
(45, 'vikas tiwari', '8953654087', '9321625125', 'pbelectric18@gmail.com', NULL, '$2y$10$rwG2xgdIMEt3JCM/l1SqbuVSKjTDJhz1le9vDmQihasbiLGChz.Le', NULL, 2, 'public/profile/45_profile.jpeg', 0, 'findWork', '0', NULL, 1, '5f39bd1c-b6df-430a-8fd6-1db6432c5c95', NULL, NULL, '2024-01-22 21:49:10', '2024-01-27 10:56:01', NULL),
(46, 'Mayank varia', '9820010408', '9820010494', 'mayank_818@yahoo.com', NULL, '$2y$10$RenY1aObH1Qym1xvtFCeJeM4pPW491tjA2OuOL/epBV9FYrsPIeOa', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, 'e2811e5e-5fb9-441e-aded-4f3eddbe54ed', NULL, NULL, '2024-01-22 21:53:21', '2024-02-07 17:02:30', NULL),
(47, 'Sitaram Kumawat', '9768039580', NULL, NULL, NULL, '$2y$10$jFUWW.JmbSjmiF74dhjHj.0BQXUZIhPO2cZkota/olZS9UIeWFYdm', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, '6cb68277-20ef-4926-abd1-1e1bbb23a533', NULL, NULL, '2024-01-22 22:29:12', '2024-01-22 22:30:43', NULL),
(48, 'Shashank Test IC', '9082789905', NULL, NULL, NULL, '$2y$10$U9UNl57W4cl/j6OJ7vlk..1Sr/4683W84.O9jDu3qQrmdoLpey67m', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, 'f059f8a2-47d1-4cce-a558-53321eeea172', NULL, NULL, '2024-01-23 10:28:10', '2024-01-30 14:21:57', NULL),
(49, 'Wasiq Ansari', '8082714858', '9833179331', 'wasiqansari166@gmail.com', NULL, '$2y$10$qJM4//kYKxaokhlBvdP0q.ZnVGtjSwGhVTl5sXejSmg6aLGeICkiW', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '93893d45-6159-4e6a-a53b-e47e6450f5d4', NULL, NULL, '2024-01-23 10:32:03', '2024-01-23 10:33:09', NULL),
(50, 'Support Elemantra', NULL, NULL, 'support@elemantra.in', '2024-01-23 12:08:22', NULL, NULL, 1, 'public/profile/50_profile.jpeg', 1, 'hireWork', '0', NULL, 1, 'f059f8a2-47d1-4cce-a558-53321eeea172', NULL, NULL, '2024-01-23 12:08:22', '2024-01-25 14:42:28', NULL),
(51, 'Naushad Ansari', '7700033405', '8828074032', 'superelectricianservices@gmail.com', NULL, '$2y$10$HoCZ90XHg96OapB3/DzUt.gvmc0l6o8wqSYfo9R9Dwr7PaGzsV.F2', NULL, 2, 'public/profile/51_profile.jpeg', 0, 'findWork', '2', 7, 1, '9f14ea9f-dd29-4fbd-ba84-0e5298dc0535', '2024-01-24 08:16:11', NULL, '2024-01-23 14:17:16', '2024-01-26 11:25:57', NULL),
(52, 'FATEH SINGH', '9769015663', '8619695518', 'fatehbarmer@gmail.com', NULL, '$2y$10$ippXAWj3sX0r3HRV/aukBuuAmYQc2HEeB7rAi/VLik4i4RklAjsSC', NULL, 1, NULL, 0, 'hireWork', '1', 1, 1, 'e5ff8471-591c-4746-8291-aef2c43dbcb2', '2024-01-23 21:09:57', NULL, '2024-01-23 14:42:17', '2024-01-23 21:20:18', NULL),
(53, 'Ramniwas Suthar', '8079069799', NULL, 'ramniwasparwa@gmail.com', '2024-01-23 15:57:01', NULL, NULL, 1, NULL, 1, 'findWork', '2', 7, 1, '6dd5fd05-2d53-4dbb-9bdc-70ca8a4c022b', '2024-01-24 17:10:49', NULL, '2024-01-23 15:57:01', '2024-01-26 18:11:58', NULL),
(54, 'Dipak Sharma', '9022422022', NULL, 'deepaksharma9222@gmail.com', NULL, '$2y$10$7CU6wU0WSWTAv9IyGGLZTel82o.VegJuLph8VBHYVU3mSpmuEndHW', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '9e1bf18d-69a8-4213-86fd-0dfde76ff3dc', NULL, NULL, '2024-01-23 16:57:08', '2024-01-23 17:00:31', NULL),
(55, 'Chandana', NULL, NULL, 'chandana012@gmail.com', '2024-01-23 18:19:09', NULL, NULL, 2, NULL, 1, 'hireWork', '0', NULL, 1, '83b6aadb-8716-4496-92f0-7c9139cab797', NULL, NULL, '2024-01-23 18:19:09', '2024-01-30 14:06:39', NULL),
(56, 'Asif Dilavar Shaikh', '9699622178', '8779219017', 'shaikhasifdilawar@gmail.com', NULL, '$2y$10$Y5zGIwg3Xr1Moz2HKJ1hu.XUdfUl2DxZd9tSm/QX7/I2yEDjCifPq', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '83e42717-f82b-4492-a8bf-4e7eb6c9e093', NULL, NULL, '2024-01-23 22:30:40', '2024-01-23 22:33:01', NULL),
(57, 'Kiran', NULL, NULL, 'kiran202529@gmail.com', '2024-01-23 23:46:42', NULL, NULL, 2, NULL, 1, 'findWork', '0', NULL, 1, 'ae0e6def-908a-4e3c-b366-7d3b52f2561c', NULL, NULL, '2024-01-23 23:46:42', '2024-01-24 16:59:40', NULL),
(58, 'kiran', '6393109911', NULL, NULL, NULL, '$2y$10$x6X1UclFZUz4W8cqHf.NJO/rpagRigqQZTi6b8d2gPg4GWJPxgqEG', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, 'ae0e6def-908a-4e3c-b366-7d3b52f2561c', NULL, NULL, '2024-01-23 23:50:58', '2024-01-24 00:41:58', NULL),
(59, 'Arpit Vishwakarma', NULL, NULL, 'vishwakarmaarpit1996@gmail.com', '2024-01-24 00:48:15', NULL, NULL, 3, NULL, 1, NULL, '0', NULL, 1, 'e331f646-32f8-4ae2-bcdb-d6ceec29eaae', NULL, NULL, '2024-01-24 00:48:15', '2024-01-24 00:48:27', NULL),
(60, 'Arpit vishwakarma', NULL, NULL, 'arpit.vishwakarma@elemantra.in', '2024-01-24 00:55:22', NULL, NULL, 4, NULL, 1, NULL, '0', NULL, 1, 'e331f646-32f8-4ae2-bcdb-d6ceec29eaae', NULL, NULL, '2024-01-24 00:55:22', '2024-01-24 00:55:22', NULL),
(61, 'Shahnawaz Shaikh', '9967310812', '8828537701', 'shahnawaz.shaikhelc@gmail.com', NULL, '$2y$10$o6D3xdbVHoO48xNxg2hCKeCcjj5WYrxuCdGmHUXFPreJ2t1kHGJh6', NULL, 2, NULL, 0, 'findWork', '1', 1, 1, '01c5ea81-c745-4a87-b54b-e1cf1822f50f', '2024-01-24 20:17:59', NULL, '2024-01-24 20:06:43', '2024-01-25 01:36:05', NULL),
(62, 'vedprakash jaiswal', '9892924015', '9821610057', 'vc9821610057@gmail.com', NULL, '$2y$10$KY/mMt/NyKBh31ISs3ZXieSNDfy7A8.rbf/7Oq.98wLdgnMfYpADC', NULL, 1, NULL, 0, 'findWork', '1', 1, 1, '548119a0-67f3-4e37-b9f1-44cabc8c9455', '2024-01-25 10:42:17', NULL, '2024-01-24 20:30:24', '2024-01-25 10:50:42', NULL),
(63, 'Mukim Khan', '9819741798', '8657608987', 'recafe111@gmail.com', NULL, '$2y$10$u2/9iyKMyzzBKiSy5haJLeo.5i0J3aVHyzZMmE5A5OvY3qPDxCQnm', NULL, 2, NULL, 0, 'findWork', '1', 1, 1, 'fdc2c75a-29de-4dd5-a36a-5a0b8ec0f636', '2024-01-24 21:24:34', NULL, '2024-01-24 20:50:16', '2024-01-28 10:58:29', NULL),
(64, 'sunil sahani', '9987357413', '9960171894', NULL, NULL, '$2y$10$Q76YNmMTV4B3E/Bk5EID3uE3eYm2bR65dTwm60CXHo92yu2Fg099W', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '0a1c8d10-a16f-4270-a28a-3f457085232a', NULL, NULL, '2024-01-24 22:38:01', '2024-01-24 22:42:48', NULL),
(65, 'Ramlalit Prajapati', '7666191673', '9307828577', 'aprajapatiramlalit@320gmail.com', NULL, '$2y$10$BJ38mevZxFm17nIxaWvaZ.cmTPBW4pKiETh1/j5EOS/ArvjBTwM3G', NULL, 2, NULL, 0, NULL, '0', NULL, 1, NULL, NULL, NULL, '2024-01-25 08:13:21', '2024-01-25 08:13:21', NULL),
(66, 'Rambhadurgupta', '7715985668', '8369299964', 'rambhadurgupta111@gmail.com', NULL, '$2y$10$sPfqDRqZ2MFXUiWFROT1GOiEb69cbDldVw36cOdw700fsiZ7Dnm3y', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '8a50fa6b-8616-4dc4-8895-b6cbed2c7956', NULL, NULL, '2024-01-25 13:40:21', '2024-02-01 14:22:30', NULL),
(67, 'anirudh civil contractor', '7977172738', NULL, NULL, NULL, '$2y$10$vjpNRunwxm5qTEazRGzpg.ncuTKF4cO7ea9lITFpKt2C6lRr0fiLC', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '39cb178e-c599-41e1-b976-74c87c329120', NULL, NULL, '2024-01-25 16:57:11', '2024-01-25 16:59:26', NULL),
(68, 'Ramesh Sahani', '9594605280', '9029375459', 'rameshsahani06@gmail.com', NULL, '$2y$10$aGELHJ.TGo76yacAiDwGYeahhuwAN5np8zwltrRzhT61dzkB83JQK', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '1159a0d3-4b71-45c8-878a-4aecdae4518b', NULL, NULL, '2024-01-25 17:20:35', '2024-02-02 19:55:38', NULL),
(69, 'dimpal vishwakarma', NULL, NULL, 'dimpal2003v@gmail.com', '2024-01-25 18:47:14', NULL, NULL, 3, NULL, 1, NULL, '0', NULL, 1, '07013647-89a8-4bd7-b8ec-be417ad87708', NULL, NULL, '2024-01-25 18:47:14', '2024-01-25 18:47:17', NULL),
(70, 'sachin gupta', NULL, NULL, 'sachin.gupta.654@gmail.com', '2024-01-25 19:10:12', NULL, NULL, 2, NULL, 1, 'hireWork', '0', NULL, 1, 'd38482ef-b168-488e-819c-fe9cd50a8a7e', NULL, NULL, '2024-01-25 19:10:12', '2024-01-25 19:13:31', NULL),
(71, 'Dhananjay singh', '9167597541', '9987848920', 'dhananjaysingh198923@gmail.com', NULL, '$2y$10$7rJfIL1oY74bSTdTd0M91.aFyb60TMPlG7X.9Ar4.CoZJ7jnNSXlq', NULL, 2, NULL, 0, 'findWork', '1', 1, 1, 'e20aa88e-74df-4e43-abc2-abd0909a929b', '2024-01-25 22:52:40', NULL, '2024-01-25 22:38:14', '2024-01-25 22:52:40', NULL),
(72, 'Majibullah khan', '9322014153', NULL, 'kmajibullah43@gmail.com', NULL, '$2y$10$bGWkiggrz15Tdz07JoUDbubqFtrHEMPFAaEUKhb6SNPNHHTAAe6eq', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '71d5c8c8-ddd4-49b6-bc31-068d3963d8c7', NULL, NULL, '2024-01-26 09:35:52', '2024-02-03 16:01:46', NULL),
(73, 'ravi vishwakarma', '8850926568', '8419821277', 'rvkarma632000@gmail.com', NULL, '$2y$10$zc7RLmtVDHjstKIVStmKt.Z5QQ4d1by12l.mKixMKsdiicbKOQwPK', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, 'd235f7e8-7a0c-41dc-bcab-75ca343d38ae', NULL, NULL, '2024-01-26 14:09:52', '2024-01-26 14:14:21', NULL),
(74, 'Zeeshan Rahman', '9608355027', '8804868355', 'zeeshan.rahman.960@gmail.com', NULL, '$2y$10$5HYVZXvG1JiWHHLNFTct1eFXUlinjU7t4W3fGelZGuLfaArDxBQAe', NULL, 4, NULL, 0, NULL, '0', NULL, 1, '07bcf756-c9bb-4ddc-9453-fea194c642f8', NULL, NULL, '2024-01-27 14:10:34', '2024-01-27 14:10:35', NULL),
(75, 'atul yadav', '9369124454', '8299059343', NULL, NULL, '$2y$10$ovv1wBE/.Ao.uPLRmzrtt.4m3I04bNuTHZeH02Baxn3FPer1ZFH22', NULL, 4, NULL, 0, NULL, '0', NULL, 1, 'c7a89a04-fb41-4108-98bf-362ec650fbb6', NULL, NULL, '2024-01-27 16:25:49', '2024-01-27 16:25:49', NULL),
(76, 'Ajay Naik', NULL, NULL, 'ajnaik1992@gmail.com', '2024-01-27 16:26:37', NULL, NULL, 2, NULL, 1, NULL, '0', NULL, 1, NULL, NULL, NULL, '2024-01-27 16:26:37', '2024-01-27 16:26:37', NULL),
(77, 'Akram Khan', '9930688782', '9930699156', 'intecinterior00@gmail.com', NULL, '$2y$10$7rAwRilSn23i12pCnzLhvOSEUJq8PMXaHOlLMbMfk7dq5YsFOnDKC', NULL, 4, 'public/profile/77_profile.jpeg', 0, NULL, '0', NULL, 1, 'd6b261a5-f2bb-43eb-8b33-bd01848c8a8f', NULL, NULL, '2024-01-27 18:00:05', '2024-01-27 18:01:34', NULL),
(78, 'Shyam Giri', '9869148182', NULL, NULL, NULL, '$2y$10$4lbH3vMBQBA.49tvGw9FqeJJ/kjsP1XGqwIHfn4yuSK8TmX.GzTI6', NULL, 1, NULL, 0, NULL, '0', NULL, 1, '161cc20a-4455-4b8d-8658-43fe6d9e6523', NULL, NULL, '2024-01-27 18:34:53', '2024-01-27 18:37:56', NULL),
(79, 'Deendayal kushwah', '9680369048', '8503837232', 'deendyalkushwah830@gmail.com', NULL, '$2y$10$mtM7Mc1Hp/HoH4Nw0SGuWuFizOEGpzIDk4I7J9X4d4X4tSLhsrzq6', NULL, 3, NULL, 0, NULL, '0', NULL, 1, 'a549ef0a-13eb-4261-aec6-33d70fca2b8b', NULL, NULL, '2024-01-27 20:18:41', '2024-01-27 20:18:50', NULL),
(80, 'shashikant Darveshi', '9420566709', '9420559609', '9420566709shashi@gmall.com', NULL, '$2y$10$8wvywQPYnQW8RMRumUBP6ORQwvZfAy5hB1hhFnL/L8isgMyGylEXe', NULL, 3, NULL, 0, NULL, '0', NULL, 1, 'd9a77f78-94a2-42da-bf18-08b4eac483b1', NULL, NULL, '2024-01-27 20:32:49', '2024-01-27 20:33:17', NULL),
(81, 'Rijul', '8104494899', NULL, NULL, NULL, '$2y$10$q.tp7vwLUTQDPQ3Pr79St.G.wFIGuQJKNMyLo5HXrsJmDBGL6vwS6', NULL, 4, NULL, 0, NULL, '0', NULL, 1, 'aa06945a-24a8-4b6f-9ea9-0c6361fc8bd8', NULL, NULL, '2024-01-27 22:21:20', '2024-01-27 22:38:08', NULL),
(82, 'IT_SE_08_Rijul tiwari', NULL, NULL, 'rijul.202384101@vcet.edu.in', '2024-01-28 11:02:03', NULL, NULL, 4, NULL, 1, NULL, '0', NULL, 1, 'aa06945a-24a8-4b6f-9ea9-0c6361fc8bd8', NULL, NULL, '2024-01-28 11:02:03', '2024-01-28 11:02:03', NULL),
(83, '08_Rijul tiwari', NULL, NULL, 'tiwaririjul7@gmail.com', '2024-01-28 11:48:42', NULL, NULL, 3, NULL, 1, NULL, '1', 1, 1, 'aa06945a-24a8-4b6f-9ea9-0c6361fc8bd8', '2024-01-28 11:51:52', NULL, '2024-01-28 11:48:42', '2024-01-28 11:51:52', NULL),
(84, 'usman', '7007673168', NULL, 'khanusmanakhmal2015@gmail.com', NULL, '$2y$10$SWUO8nELra1Kb03DmBg0UO6m30kvK2RKxE9qky3whGfpINkC/0rCi', NULL, 4, NULL, 0, NULL, '0', NULL, 1, '15fd0570-f95c-4995-b948-5f2fd8ed6e45', NULL, NULL, '2024-01-28 15:25:52', '2024-01-28 15:25:53', NULL),
(85, 'Rijul Tiwari', NULL, NULL, 'tiwaririjul10@gmail.com', '2024-01-28 15:44:13', NULL, NULL, 2, NULL, 1, 'hireWork', '0', NULL, 1, 'aa06945a-24a8-4b6f-9ea9-0c6361fc8bd8', NULL, NULL, '2024-01-28 15:44:13', '2024-01-28 17:07:00', NULL),
(86, 'Rijul Tiwari', NULL, NULL, 'tiwaririjul0@gmail.com', '2024-01-28 17:23:04', NULL, NULL, 3, NULL, 1, NULL, '0', NULL, 1, 'aa06945a-24a8-4b6f-9ea9-0c6361fc8bd8', NULL, NULL, '2024-01-28 17:23:04', '2024-01-28 17:23:12', NULL),
(87, 'Rijul Tiwari', NULL, NULL, 'tiwaririjul6@gmail.com', '2024-01-28 17:33:37', NULL, NULL, 2, NULL, 1, 'findWork', '0', NULL, 1, 'aa06945a-24a8-4b6f-9ea9-0c6361fc8bd8', NULL, NULL, '2024-01-28 17:33:37', '2024-01-28 17:52:09', NULL),
(88, 'rafatullah khan', '9222364028', '8169638933', 'khanrafatullah82@gmail.com', NULL, '$2y$10$c8N75MLgOOQHcJVTCcgz0uP.9bwKZVWfPhYDD6/oNAyEOFogAmQ8m', NULL, 2, NULL, 0, NULL, '0', NULL, 1, NULL, NULL, NULL, '2024-01-28 18:07:22', '2024-01-28 18:07:22', NULL),
(89, 'Sanjay', '8157915958', '9544629015', 'sanjaynj086@gmail.com', NULL, '$2y$10$OSZ7g65g53atUvOH6Q6NTem38MvWYodC/x0aQQg25vunklb.29Uyu', NULL, 4, NULL, 0, NULL, '0', NULL, 1, 'ca4a3d86-0caf-44c6-8bb3-443d352a7623', NULL, NULL, '2024-01-29 01:28:42', '2024-01-29 01:28:43', NULL),
(90, 'Aarhan', '7042985676', NULL, NULL, NULL, '$2y$10$/BLJ2aPc/Qq6YuUc.5petu313vHLHjk/MJCARWej96IKSTN5l3P/u', NULL, 4, NULL, 0, NULL, '0', NULL, 1, '95150609-88c1-4b54-9d3d-5b2f1643c914', NULL, NULL, '2024-01-29 08:38:32', '2024-01-29 08:38:33', NULL),
(91, 'Deepanshu Roy', '8448958728', NULL, 'deepanshusharma84489@gmail.com', NULL, '$2y$10$jEC7V7ZpfjNaJj.3nRgzyexlANyAXl1J8fWKueVzfKYJ4RT4cI6ju', NULL, 4, NULL, 0, NULL, '0', NULL, 1, '3239241b-183b-4509-9886-2089f4efdd49', NULL, NULL, '2024-01-29 09:41:38', '2024-01-29 09:41:39', NULL),
(92, 'Tessy', '8078130211', NULL, NULL, NULL, '$2y$10$vsft/GRmYUxXkwhyrSP6LOCX.RPJxEv/EHg0BgsS9HiVMFJvdlKAq', NULL, 4, NULL, 0, NULL, '0', NULL, 1, 'd7346c04-05f2-42c2-8c4e-3d2555d7607c', NULL, NULL, '2024-01-29 10:28:56', '2024-01-29 10:28:57', NULL),
(93, 'Surendra Chaudhary', '9773852822', '7972538796', 'chaudhary.painters@gmail.com', NULL, '$2y$10$JH6PxgFENHlfuJitOjuAGe3rD1MQyJCe2iXQJmu3fUWy/7ougUb46', NULL, 4, 'public/profile/93_profile.jpeg', 0, NULL, '0', NULL, 1, '3e0b3a0f-6472-438c-8202-971246f302be', NULL, NULL, '2024-01-29 17:33:56', '2024-01-30 20:20:09', NULL),
(94, 'Rehan khan', '8080034434', '7820841956', 'naiemkhan.ik@gmail.com', NULL, '$2y$10$gfKztQi7cBPkgEryGVAks.Sn3e5yzwVcZBEOYAKr1vATdeK7bz6xO', NULL, 2, NULL, 0, 'hireWork', '1', 3, 1, '2afbcf2e-2c09-4204-a7a5-ee89e6ac0768', '2024-01-29 18:17:53', NULL, '2024-01-29 17:49:23', '2024-02-07 13:00:24', NULL),
(95, 'pratik Enterprises', '9892638430', '8591264289', 'guptanilesh851@gmail.com', NULL, '$2y$10$jWhEY7j5BICS8s8xg4xcjODxwLO4U3RA2Bq1Skiy1hAYxGvh0YXAK', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, 'd93fd36f-1c1f-4baf-bad1-ab31433f64a8', NULL, NULL, '2024-01-29 18:24:42', '2024-01-29 18:28:03', NULL),
(96, 'arjun Singh', '8629948171', '9321327213', 'arjunsinghdangi280@gmail.com', NULL, '$2y$10$eVuyiN0kbHL/YI2OwCPfVu7mbYveLinKU1YqjvMVN2cQZxb8PSnQm', NULL, 3, NULL, 0, NULL, '0', NULL, 1, '8a7d9139-be95-41b9-b515-efff200f4971', NULL, NULL, '2024-01-29 19:27:22', '2024-01-29 19:27:39', NULL),
(97, 'Abhishek saroj', '9867694291', NULL, 'sarojenterprises9867@gmail.com', NULL, '$2y$10$hJmby.TaNaLM19ffvlUSnOiUkUm2q5UMCQAR.NpKjl/FAvw/bSWuu', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, 'ea37dfd5-5e64-42dd-918f-1cf16826c140', NULL, NULL, '2024-01-29 20:19:20', '2024-01-29 20:24:56', NULL),
(98, 'RAHUL VISHWAKARMA', '9004692113', '8286171015', 'rahulvishwakarma004@gmail.com', NULL, '$2y$10$Pju5VQtEY/8egQw39bQJbOFVGSqCe1NIkeOgLehWxYBlzRAPynW8.', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, '0dac48af-b84a-4ea5-8da2-677a2ba004c2', NULL, NULL, '2024-01-30 07:35:27', '2024-02-03 20:32:18', NULL),
(99, 'Jitendra Kumar verma', '8692038408', '9167552027', 'jitureeta12@gmail.com', NULL, '$2y$10$l3NIBxK/QMxyLaVYwhR6p.Ud9QPySutrlHFNC9ePDkaIPz8WKjsae', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, '449ee65e-939f-4848-bbc8-a179605adfa2', NULL, NULL, '2024-01-30 16:36:13', '2024-01-30 16:40:07', NULL),
(100, 'Usman khan', '9594361987', '9321668481', 'khanusman7788@gmail.com', NULL, '$2y$10$5r0vBhulJpF7L/Esqfi7seyi3ZmjPJACip69BOgpzyXVDCKRRZhnO', NULL, 2, NULL, 0, NULL, '0', NULL, 1, NULL, NULL, NULL, '2024-01-30 17:16:18', '2024-01-30 17:16:18', NULL),
(101, 'sarfaraz siddiqui', '9594116364', NULL, 'sarfarazas40@gmail.com', NULL, '$2y$10$o9P5uHf7R3tj8BLeYfsXGO3/kdDCIE2U8SmBaYY90vwn1GePngmJC', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, 'af74f661-dc9f-4f07-9dcd-b9c9a1a3d27a', NULL, NULL, '2024-01-30 17:43:42', '2024-01-30 17:47:53', NULL),
(102, 'MOHAMMAD NOORALAM', '9623752524', NULL, 'mnalam6186@gmail.com', NULL, '$2y$10$lgaLjMp1exhTaYv.hlmxoOyEq/pBzDF5MIb7whfMY6Stl60FOfpfC', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, 'c6fdcd17-7a3e-45b5-8444-6d54270df815', NULL, NULL, '2024-01-31 12:43:57', '2024-01-31 12:52:31', NULL),
(103, 'Nishant bhatia', '8875666749', NULL, 'nishantbhatia109@gmail.com', NULL, '$2y$10$ZUZe96RSMgfuMIJ.A688AO4aPlNPe8O2IM/L9JOulCcXKSvWXfnIm', NULL, 3, NULL, 0, NULL, '0', NULL, 1, 'd371c7a6-75aa-4d73-9a7a-b73475712bd9', NULL, NULL, '2024-01-31 17:12:19', '2024-01-31 17:12:29', NULL),
(104, 'sarvesh kumar', '9878118475', '7091004948', 'mr.sarvesh9878118475@gmail.com', NULL, '$2y$10$B8.e1Pzm8oT/8x.1Mh02YuVOGZueE4XenGaqjgu1/HsAGcnOCj98.', NULL, 3, NULL, 0, NULL, '0', NULL, 1, '5248e3f7-8b85-4d6d-a831-16290b527622', NULL, NULL, '2024-01-31 17:19:20', '2024-01-31 17:19:30', NULL),
(105, 'Binni panchal', '6351835929', NULL, 'binnypanchal1112@gmail.com', NULL, '$2y$10$iwB3WFnitQMp808kNgM4ou8QTN2YWA2CnEz1ZxOOV/Cuqr8CvBCN.', NULL, 4, NULL, 0, NULL, '0', NULL, 1, '083dddde-54ba-4d15-bf67-a98e24baa7c6', NULL, NULL, '2024-01-31 18:55:28', '2024-01-31 18:55:29', NULL),
(106, 'Simhachalam Bonu', '7993567830', NULL, 'simhachalam1508@gmail.com', NULL, '$2y$10$wZ.zkHMI3wLccXC8D0zYSeh3LjchmuYPW8baj/qGCrSQnHHIit3E.', NULL, 2, NULL, 0, NULL, '0', NULL, 1, 'cc58f1b5-6839-455b-910e-e59e1f380031', NULL, NULL, '2024-02-01 14:51:02', '2024-02-01 14:53:03', NULL),
(107, 'Aryan Tyagi', '9819492631', NULL, NULL, NULL, '$2y$10$a1br2G0OmsF0KMs1uFv67.Jvo5k4YYCzCzY7vdMZQSnCAosbmkhfq', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '9c236631-0196-4089-826a-9f25949b36e4', NULL, NULL, '2024-02-02 16:28:21', '2024-02-02 16:29:27', NULL),
(108, 'PRMOD KUMAR', '9616250951', '9555984462', 'prmodkumar372@gmail.com', NULL, '$2y$10$iVjN3BDpQxY1tqTx3prUqeYPXXo2IjWb./nlYE8i4wDimgxwpt0Fq', NULL, 2, 'public/profile/108_profile.jpeg', 0, 'hireWork', '1', 1, 1, '5d35d63e-0137-4651-b57e-63cdc8efaced', '2024-02-02 20:50:19', NULL, '2024-02-02 20:18:05', '2024-02-02 20:53:05', NULL),
(109, 'Kailash suthar', '8003021954', '9664311715', 'kailashmandan786@gmail.com', NULL, '$2y$10$v09KOWabg4nxIWdG4UAmUO6brK7mG0Yyyy7j81njs8Abu8In/Byie', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, 'd94b4c91-9876-4b59-8c2f-8114479318ff', NULL, NULL, '2024-02-03 11:22:10', '2024-02-03 11:23:49', NULL),
(110, 'piyush kalena', '8828608240', NULL, NULL, NULL, '$2y$10$Mghb3ZMQ6PG/AT9cewaeee6zdjQYMjG3UX.umNMWlPQpqSy.79ca.', NULL, 1, NULL, 0, 'hireWork', '1', 1, 1, '7ff19e26-a9e2-4d9d-9b2b-7b40f0742436', '2024-02-03 16:55:59', NULL, '2024-02-03 13:19:17', '2024-02-03 16:55:59', NULL),
(111, 'Rakesh jangid', '8424849686', '8080873732', 'rakeshjangid1510@gmail.com', NULL, '$2y$10$TZOuS9ffw8wRz2Qc5X8ZLejRm5ZwiMAakF9H.rKtE0rDYEXZPhN2K', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, 'ad3e2269-e3ba-473e-ad05-f12d264a5e66', NULL, NULL, '2024-02-05 13:00:20', '2024-02-05 13:04:28', NULL),
(112, 'kuldeep maurya', '9033200373', '9033200365', NULL, NULL, '$2y$10$qQKFroxpmHxNuUolnhDMNuHvfesFi2gwwv/L1TnRk6R95jerXetUC', NULL, 2, NULL, 0, 'findWork', '1', 1, 1, 'b185806f-3ace-4ffe-9b51-71aab6838773', '2024-02-05 17:14:57', NULL, '2024-02-05 17:11:53', '2024-02-06 17:55:26', NULL),
(113, 'chhotu', '8149900376', '8733896360', 'chhotuinfra29@gmail.com', NULL, '$2y$10$uUMcF.5V5p/UdNC75731pect7lNGW4OQRvjPiYxzPFtxw3mz60t4m', NULL, 2, 'public/profile/113_profile.jpeg', 0, 'findWork', '1', 1, 1, 'cb428918-2def-4bed-808f-59ed88fa8e51', '2024-02-06 01:13:28', NULL, '2024-02-05 20:02:03', '2024-02-07 02:21:17', NULL),
(114, 'neeraj sharma', '8657256910', '9372656347', NULL, NULL, '$2y$10$naO9FUca/iahX5SfBtvWJ.AhiJesdv./XDbIqN/Dop9cYp7FIld5S', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '905ba49b-f50e-4357-919b-c39440be2c5b', NULL, NULL, '2024-02-05 20:45:16', '2024-02-05 20:50:28', NULL),
(115, 'Rajkumar Sharma', NULL, NULL, 'raj.kitchencon@gmail.com', '2024-02-05 22:50:25', NULL, NULL, 4, NULL, 1, NULL, '0', NULL, 1, '22d7afa8-51ef-4097-8c0c-fec887f4ff59', NULL, NULL, '2024-02-05 22:50:25', '2024-02-05 22:50:25', NULL),
(116, 'ankaj', '8076769586', '7217853515', 'ak0284399@gmail.com', NULL, '$2y$10$ejX7UnOqcea4WBc19s9ZIOk5N2V5PPjPY52GoM/1palssVTD6bpny', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '724b3115-40ed-49ed-a80f-00b825d3cc98', NULL, NULL, '2024-02-06 00:24:16', '2024-02-06 00:26:12', NULL),
(117, 'Shreyans Upadhye', NULL, NULL, 'pgp18.shreyans@spjimr.org', '2024-02-06 08:29:16', NULL, NULL, 3, NULL, 1, NULL, '0', NULL, 1, '5a90b41c-7af1-4ff1-9d91-530cc13802ca', NULL, NULL, '2024-02-06 08:29:16', '2024-02-06 08:29:24', NULL),
(118, 'Munshi Mandal', NULL, NULL, 'munshimandal847452@gmail.com', '2024-02-06 08:31:26', NULL, NULL, 3, NULL, 1, NULL, '0', NULL, 1, 'a2f1f35f-91d1-4bed-8dc3-f832eda57cdb', NULL, NULL, '2024-02-06 08:31:26', '2024-02-06 08:31:46', NULL),
(119, 'Suraj singh', NULL, NULL, 'singhsuraj89847@gmail.com', '2024-02-06 08:34:59', NULL, NULL, 3, NULL, 1, NULL, '0', NULL, 1, '6dea2fb3-da2b-40bf-8b8f-0b5f468f4e42', NULL, NULL, '2024-02-06 08:34:59', '2024-02-06 08:35:04', NULL),
(120, 'Manoj Kumar', NULL, NULL, 'manojk62708@gmail.com', '2024-02-06 08:36:42', NULL, NULL, 3, 'public/profile/120_profile.jpeg', 1, NULL, '0', NULL, 1, '350126d2-9995-4f7d-8e40-ffae5f6821ba', NULL, NULL, '2024-02-06 08:36:42', '2024-02-06 21:36:36', NULL),
(121, 'pappu kumar', '7322061986', '9798068992', 'pappukumar9065489726@gmail.com', NULL, '$2y$10$XinIlkEun4A3DE6ljOR1TORS8l/Hif4PIxwcC5hiSKSebLouE3LGu', NULL, 3, NULL, 0, NULL, '0', NULL, 1, 'ce029d9c-cec6-44f8-b2d4-1bcec67c432c', NULL, NULL, '2024-02-06 08:36:44', '2024-02-06 08:37:17', NULL),
(122, 'Krishna Kumar Bind', NULL, NULL, 'bindkrishnakumar594@gmail.com', '2024-02-06 08:37:00', NULL, NULL, 2, NULL, 1, 'findWork', '0', NULL, 1, '8e55c5a7-0ab5-4bb5-9373-5df4d34d7dca', NULL, NULL, '2024-02-06 08:37:00', '2024-02-07 16:35:46', NULL),
(123, 'ketan Solanki', '9323186091', NULL, NULL, NULL, '$2y$10$Ex4q.cMT8BVvpF.53C5YRu/idSwypsGnNnppG4iWNWZW0zY6zdV8K', NULL, 3, NULL, 0, NULL, '0', NULL, 1, '3ca273c8-a829-4159-88f9-d838db0bdbf7', NULL, NULL, '2024-02-06 08:39:25', '2024-02-06 08:39:36', NULL),
(124, 'umashankar paswan', '7632839742', NULL, 'umashankarpaswan535@gmail.com', NULL, '$2y$10$QzHYW6Zt.lkEwqjQuhzerOHWeBOeXHblZgdUaI6F.N6MVodVNzBuG', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, 'ac313b7c-cfd1-4221-959c-fe17b5f9369e', NULL, NULL, '2024-02-06 08:39:48', '2024-02-06 15:58:58', NULL),
(125, 'Md Kalam', NULL, NULL, 'mdk587785@gmail.com', '2024-02-06 08:43:39', NULL, NULL, 3, NULL, 1, NULL, '0', NULL, 1, '975cce78-95ce-40a3-9a11-7512a2259855', NULL, NULL, '2024-02-06 08:43:39', '2024-02-06 08:43:49', NULL),
(126, 'sanjay sahan', '8295853741', NULL, NULL, NULL, '$2y$10$xmtkAfYfY9bzg.IrMAGtbefeqM/jZi5dV14Gf0XWtKv8E1aPxdVci', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, 'bbf07213-a1e6-4248-9616-47bf308a970e', NULL, NULL, '2024-02-06 08:44:56', '2024-02-06 08:45:26', NULL),
(127, 'sharwan lal', '7738457613', NULL, NULL, NULL, '$2y$10$HdtZQ/0quGpO/cvs0OyBJuWTlDhb.vBsJbahEDj4zrh4z4OYLrBuq', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, '4c916441-0f26-4417-9b9f-e225dced06f5', NULL, NULL, '2024-02-06 08:49:36', '2024-02-06 08:51:49', NULL),
(128, 'brajkishor kumar', '7404305031', NULL, NULL, NULL, '$2y$10$0BRJUMYGEiRTFybXL7UGiOjSDexURnQc3.hSNX9QeIH14TIVZQfva', NULL, 3, NULL, 0, NULL, '0', NULL, 1, '59c70cfa-a409-4c79-8f16-ce76aead231a', NULL, NULL, '2024-02-06 08:50:57', '2024-02-06 08:51:12', NULL),
(129, 'AJEET RANA', '8178323044', NULL, 'arenterprises8178@gmail.com', NULL, '$2y$10$Xjtm5zwua0iDB65mD4h7MuOmrhe9d.Nf2GLD/ssjO61E9wIjCU6xS', NULL, 2, 'public/profile/129_profile.jpeg', 0, 'findWork', '0', NULL, 1, '89dacdce-6634-4606-9989-8b1927e21f87', NULL, NULL, '2024-02-06 10:30:50', '2024-02-06 10:46:57', NULL),
(130, 'Md Salauddin', '7561975857', NULL, NULL, NULL, '$2y$10$bAOcMiF/Qh5B6wrOZsw9gOvhzm0RMY84OV2nWLq2UV2DR7aeREAwG', NULL, 3, NULL, 0, NULL, '0', NULL, 1, '6b9f61af-3e1e-4bc4-9587-f2ca836c0b6f', NULL, NULL, '2024-02-06 11:53:38', '2024-02-06 11:53:44', NULL),
(131, 'Atul Roy', '9871361150', '8864809591', 'atul37832731@gmail.com', NULL, '$2y$10$H1GQ2UIJMM6rSTyknpF9F.JKYLsoe0ROtlkE0TFBEdykH0M4OQugO', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, '280947a4-e7f1-4699-9ca7-5dd6c1629638', NULL, NULL, '2024-02-06 12:12:51', '2024-02-06 12:13:33', NULL),
(132, 'arjun dattatray bhor', '9021239919', '9665997634', 'vastuinterior2020@gmail.com', NULL, '$2y$10$bVIbh0O8QIlBnp31DmHI/eaneADGREIwm4MvI9EweEwjFVHFBQOCe', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '5a308bb3-8a7e-428c-8841-3043d4648071', NULL, NULL, '2024-02-06 12:51:32', '2024-02-06 12:53:20', NULL),
(133, 'ramgopal', '6261912537', '7049223444', 'rjatavram@gmail.com', NULL, '$2y$10$Q7jvP0Z1dN6kuq57tmt3t.xGZMshWV/W9jlPoRsCBArlUBy3hg3t6', NULL, 3, NULL, 0, NULL, '0', NULL, 1, 'c08eead4-db8f-4502-891b-e1a4835a91c0', NULL, NULL, '2024-02-06 17:02:29', '2024-02-06 17:02:48', NULL),
(134, 'phoolchand vishwkarma', '9930110617', '9559320053', 'phoolchandvishwkarma87@gmail.com', NULL, '$2y$10$/x/jsM8RornLldmiTOBa7uAeBhHA7FmRf68ZsuP61tpn4lK0360li', NULL, 2, NULL, 0, 'hireWork', '0', NULL, 1, '5a6c0243-b22d-45fa-82d8-fa6353d4aa30', NULL, NULL, '2024-02-07 13:11:19', '2024-02-07 13:20:06', NULL),
(135, 'mujibar Shaikh', '9833226335', NULL, 'hsinteriors96@gmail.com', NULL, '$2y$10$HqyPK6CXMcHH719QdMOu4eR/uyqUgOhFGOBAuEwVAHnCqQK70VcEW', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, '73e4d88e-3758-4ef7-88ec-7991370d733b', NULL, NULL, '2024-02-07 13:31:35', '2024-02-07 13:33:14', NULL),
(136, 'swapnil naik', '9769001408', NULL, 'swapnil.contractorbhai@gmail.com', NULL, '$2y$10$xIDNRX0khzJtA2TqoiFTdu4FjXIXUl9jZqrTsgffLU7dkOeEFJ9q.', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '42689d48-a87c-4956-b87d-74eb60cc42ab', NULL, NULL, '2024-02-07 13:35:24', '2024-02-07 13:37:33', NULL),
(137, 'alok rai', '9594181332', NULL, 'alokrai2237@gmail.com', NULL, '$2y$10$gbKaCpfcGk9PDol.vV.ATe9mexdgM1OwGY3RLqQ4AqHUm4tf.hGyW', NULL, 1, NULL, 0, 'findWork', '0', NULL, 1, '56bd3972-24ad-4df0-9a5c-125ed91d4f22', NULL, NULL, '2024-02-07 13:37:07', '2024-02-07 13:49:26', NULL),
(138, 'lal bhadur sharma', '9769087110', '9029909245', 'sonubhai07820@gmail.com', NULL, '$2y$10$4farwv/8LCgkTbL36JQCjOYSYRuEvdP9WAbm..GL8m2HyAyzbDsG2', NULL, 1, NULL, 0, 'hireWork', '0', NULL, 1, 'bcc77232-1d9c-4b13-a7c8-47ff1c1fe4d7', NULL, NULL, '2024-02-07 13:52:37', '2024-02-07 14:03:39', NULL),
(139, 'pramod bahe', '8717939804', NULL, 'bahepramod6@gmail.com', NULL, '$2y$10$4pg.05pSnXultYw2iJyLNugUIDIKU0ERrBJd4/QeEVshegGuLRgcS', NULL, 2, NULL, 0, 'findWork', '0', NULL, 1, '31fa19c3-5cd3-4605-8a92-50cb2f596561', NULL, NULL, '2024-02-07 17:10:17', '2024-02-07 17:10:57', NULL),
(140, 'Mahesh gorana', '7045493697', '9324764230', 'gorana.mahesh@gmail.com', NULL, '$2y$10$Vd6aXH9kl5ieMJEirMXDU.tgvV801TKsKKrbKio/EJBysYOSWzGv6', NULL, 1, NULL, 0, NULL, '0', NULL, 1, NULL, NULL, NULL, '2024-02-07 17:23:30', '2024-02-07 17:23:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_companies`
--

CREATE TABLE `user_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `work_recommendation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_companies`
--

INSERT INTO `user_companies` (`id`, `user_id`, `name`, `gst`, `address`, `about`, `work_recommendation`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 'Elemantra', NULL, '310, Neo Corporate Plaza, 2, Ramchandra Ln, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra 400064', NULL, NULL, 1, '2024-01-06 07:30:06', '2024-01-06 07:30:06', NULL),
(2, 5, 'Elemantra', NULL, '310, Neo Corporate Plaza, 2, Ramchandra Ln, Malad, Navy Colony, Kanchpada, Malad West, Mumbai, Maharashtra 400064', NULL, NULL, 1, '2024-01-06 07:30:23', '2024-01-06 07:30:23', NULL),
(3, 7, 'Elemantra', NULL, 'Malad West', NULL, NULL, 1, '2024-01-07 09:16:54', '2024-01-07 09:16:54', NULL),
(4, 8, 'House interiors', NULL, 'Jai Maharashtra Nagar, Sion Koliwada Antophill Church, Sm Road , Mumbai 400037', NULL, NULL, 1, '2024-01-08 09:13:37', '2024-01-20 11:13:09', NULL),
(5, 17, 'vgghh', NULL, 'fsgs', 'xvgdhd', NULL, 1, '2024-01-17 06:21:21', '2024-01-17 06:21:21', NULL),
(6, 19, 'Test', '845431215518', 'sai', 'sai', 'public/work_recommendation//19_Test.pdf', 1, '2024-01-17 08:09:48', '2024-01-17 08:09:48', NULL),
(7, 21, 'test', 'abc12345nxnx', 'dombivali', 'zhah', NULL, 1, '2024-01-17 23:50:53', '2024-01-17 23:50:53', NULL),
(8, 22, 'test', NULL, 'dombivali', 'test', NULL, 1, '2024-01-18 06:30:38', '2024-01-18 06:30:38', NULL),
(9, 1, 'abc', 'agb132426364', 'gsgd', 'sbdj', NULL, 1, '2024-01-18 06:56:43', '2024-01-18 06:56:43', NULL),
(10, 26, 'M/s. A I Enterprise', NULL, 'Tardeo tulsiwadi Mumbai central.', NULL, NULL, 1, '2024-01-19 20:03:01', '2024-01-19 20:03:01', NULL),
(11, 28, 'Elemantra', NULL, '310, Neo Corporate Plaza, 2, Malad West, Mumbai, Maharashtra', NULL, NULL, 1, '2024-01-20 12:31:54', '2024-01-20 12:31:54', NULL),
(12, 29, 'Elemantra Group', NULL, '15, 1st floor, hanuman building, sunder galli, byculla (w), mumbai 400 011.', 'We are here to transform your space with our expert interior contracting services. From concept to completion, we specialize in creating bespoke interiors that seamlessly blend functionality and aesthetics. Our team of skilled professionals ensures meticulous attention to detail, delivering projects on time and within budget. Elevate your surroundings with our innovative designs, quality craftsmanship, and a commitment to exceeding your expectations. Experience the perfect fusion of style and functionality with our comprehensive interior contracting solutions.\n\nWe assuring that Elmantra Group will try to provide you the best service Please join us to make your dream home in a better way...', NULL, 1, '2024-01-20 13:03:02', '2024-01-20 13:03:02', NULL),
(13, 32, 'Naman interior', 'no', 'khar road East jawahar chal mumbai Maharashtra', 'trunkey carpenter contractor', NULL, 1, '2024-01-20 13:43:43', '2024-01-26 18:03:08', NULL),
(14, 35, 'crown connections', NULL, 'Mount Mary step Bandra West Mumbai', 'electrical work', NULL, 1, '2024-01-20 17:58:20', '2024-01-20 17:58:20', NULL),
(15, 37, 'Shri aainath enterprise', NULL, 'Andheri East', 'carpenter', NULL, 1, '2024-01-22 11:37:56', '2024-01-22 11:37:56', NULL),
(16, 39, 'creative carpenter & interior work', NULL, 'Kisan nagar bhathwadi Nirmal kunj 2 floor no30 Thane West road no 16 maharashtra thane west', 'carpenter furniture pop civil work painting work electric work  fabrication & wallpaper carpet', 'public/work_recommendation//39_creative carpenter & interior work.jpg', 1, '2024-01-22 16:18:41', '2024-01-22 16:18:41', NULL),
(17, 40, 'SSK Enterprises', '27AUCPK7128H', '903, Rashi Heights, Sec-10, Kopara, Kharghar', NULL, NULL, 1, '2024-01-22 18:52:18', '2024-01-22 18:52:18', NULL),
(18, 41, 'H.K interior', NULL, 'jogeshwari west mahada colony', 'I do p.o.p false ceiling punning work, wallpaper customized wallpaper 3d,5d glass films,carpets', 'public/work_recommendation//41_H.K interior.jpg', 1, '2024-01-22 19:04:18', '2024-01-22 19:04:18', NULL),
(19, 42, 'R Kumar', '27BYZPS9110B', 'A 303, Nishant CHSL, Chandan Park near Jesal park, Bhayander east', NULL, NULL, 1, '2024-01-22 20:03:23', '2024-01-22 20:03:23', NULL),
(20, 44, 'Riyaz khan pop gypsum ceiling work', NULL, 'Shop No. 3, Rd Number Q, near Odyssey It Park, Ambika Nagar No 3, Thane West, Thane, Maharashtra 400604', 'Gypsum ceiling, wall gypsum pop, grid ceiling, pvc ceiling work, itc.', 'public/work_recommendation//44_Riyaz khan pop gypsum ceiling work.pdf', 1, '2024-01-22 21:50:40', '2024-01-22 21:50:40', NULL),
(21, 45, 'pb electrical service', NULL, 'all electrical work', 'good', NULL, 1, '2024-01-22 21:51:28', '2024-01-22 21:51:28', NULL),
(22, 46, 'navkar Electric Contractor', NULL, 'borivali west mumbai 400092', 'all types electric work', NULL, 1, '2024-01-22 21:54:28', '2024-01-22 21:54:28', NULL),
(23, 51, 'Super Electrician Service', NULL, 'Bhagat Singh Nagar No.1 New Link Road Goregaon West Mumbai Maharashtra 400104 india', 'Building your dream home or revitalizing your current space? Look no further than Super Electrician Service, your one-stop shop for all things electrical! We\'re not just electricians; we\'re the architects of your electrical future, weaving expertise, innovation, and a touch of magic into every project we undertake.\n\nFull Wiring, Masterfully Done:\n\nWhether you\'re starting from scratch or tackling a major renovation, Super Electrician Service brings your vision to life with meticulous full wiring. From meticulously laying the groundwork with the main service panel to flawlessly installing outlets, switches, and lighting fixtures, we leave no detail unseen. Our seasoned professionals ensure safety, efficiency, and adherence to the latest codes and standards, guaranteeing electrical systems that stand the test of time.\n\nRewiring and Upgrades: Powering Up Your Potential:\n\nDoes your aging home whisper tales of outdated wiring? Let Super Electrician Service breathe new life into your electrical infrastructure. We expertly assess your existing system, diagnose any flaws, and meticulously rewire, ensuring your home seamlessly handles the demands of modern appliances and technology. Say goodbye to flickering lights and tripped breakers; welcome a safe and reliable electrical haven.\n\nHome Automation: Where Dreams Meet Reality:\n\nSupercharge your lifestyle with the future of smart living. We seamlessly integrate cutting-edge home automation systems, transforming your home into a connected masterpiece. Imagine adjusting lighting with your voice, monitoring security remotely, or setting automatic schedules for appliances – all at your fingertips. We guide you through every step, customizing a system that perfectly aligns with your needs and desires.\n\nBeyond the Wires: The Super Electrician Service Difference:\n\nWhat sets us apart? It\'s the Super Electrician Service philosophy:\n\nUnwavering Expertise: Our team boasts years of experience and extensive knowledge, tackling any electrical challenge with confidence and finesse.\nImpeccable Quality: We never compromise on materials or workmanship, using only the best brands and adhering to the highest standards.\nCrystal Clear Communication: We believe in open dialogue, keeping you informed and involved throughout every step of the project.\nUnmatched Dedication: Your satisfaction is our ultimate goal. We go the extra mile to ensure your electrical dreams become reality.\nReady to Experience the Super Electrician Service Difference?\n\nContact us today for a free consultation! We\'ll discuss your project, assess your needs, and provide a tailored solution that exceeds your expectations. With Super Electrician Service, you\'re not just getting electricians; you\'re getting partners in powering up your dreams, both residentially and commercially.\n\nRemember, Super Electrician Service: Electrifying Your Life, One Spark at a Time!', NULL, 1, '2024-01-23 14:18:28', '2024-01-24 01:07:17', NULL),
(24, 53, 'Naman interior', NULL, 'khar road East jawahar chal mumbai Maharashtra', 'trunkey carpenter contractor', NULL, 1, '2024-01-23 15:58:05', '2024-01-23 15:58:05', NULL),
(25, 54, 'Sejalintroriar', NULL, 'gala no B15 Jay ambe sewashmeti bhabrekar nagar kandiwali west', NULL, NULL, 1, '2024-01-23 16:58:53', '2024-01-23 16:58:53', NULL),
(26, 52, 'FATEH SINGH', '27DAIPS1462P', 'pump house Andheri East Mumbai', 'pump house Andheri East', 'public/work_recommendation//52_FATEH SINGH.pdf', 1, '2024-01-23 21:18:33', '2024-01-23 21:18:33', NULL),
(27, 56, 'Safiya construction', NULL, 'Room no C/3 Ganesh Krupa CHS gate no 6 malvani Malad West Mumbai 400095', 'Plumbing Contractor', NULL, 1, '2024-01-23 22:31:40', '2024-01-23 22:31:40', NULL),
(28, 58, 'Kiran', NULL, 'sion', NULL, NULL, 1, '2024-01-23 23:51:39', '2024-01-23 23:51:39', NULL),
(29, 61, 'SK.Electrical', NULL, 'B-203 Haidry Complex Near Shia Jama Masjid Haidry Chowk Naya Nagar Mira Road East Thane 401107', NULL, NULL, 1, '2024-01-24 20:09:31', '2024-01-24 20:09:31', NULL),
(30, 63, 'Rahemat Enterprise', '27ECQPK7703C', 'Shop No.B.21, Ashok Nagar, Hill No 3, Kamani, Kurla West', NULL, NULL, 1, '2024-01-24 20:51:41', '2024-01-24 20:51:41', NULL),
(31, 64, 'Sd furniture wark', NULL, 'goregoan west McDonald\'s near sv road jay shree krishna bungalow', NULL, NULL, 1, '2024-01-24 22:41:24', '2024-01-24 22:41:24', NULL),
(32, 67, 'anirudh civil contractor', NULL, 'near vidayalankar college sangam Nagar wadala east mumbai - 400037', NULL, NULL, 1, '2024-01-25 16:58:22', '2024-01-25 16:58:22', NULL),
(33, 68, 'Ramesh sahani', NULL, 'Room no 301 (b wing) Ganraj complex shill road diva east', NULL, NULL, 1, '2024-01-25 17:24:56', '2024-01-25 17:24:56', NULL),
(34, 70, 'sachin', NULL, 'kolbad Thane', 'kolbad Thane', NULL, 1, '2024-01-25 19:12:36', '2024-01-25 19:12:36', NULL),
(35, 71, 'Dhananjay Singh', 'no', 'b.27laxmi nagar welfare society s.p road avdhut Narayan high school.dahisar (e) Mumbai 400068', 'all electric work and automations', 'public/work_recommendation//71_Dhananjay Singh.jpg', 1, '2024-01-25 22:44:33', '2024-01-25 22:44:33', NULL),
(36, 72, 'Khan Gypsum Decor', NULL, 'Indra market, station road, Bhyander West Thane : 401101', '21 year experience any type of celling solution and design. All types of work celling and wall like PVC,Gypsum,Grid  ect. sale  and services.', NULL, 1, '2024-01-26 09:44:42', '2024-01-26 09:44:42', NULL),
(37, 73, 'Vishwakarma advanced electrical work', NULL, 'mulund West Hanuman pada mulund colony', NULL, 'public/work_recommendation//73_Vishwakarma advanced electrical work.pdf', 1, '2024-01-26 14:13:25', '2024-01-26 14:13:25', NULL),
(38, 94, 'ik interiors', NULL, 'jai maharashtra soc sunder baug lane kurla kamani 70', 'solution for every corner', NULL, 1, '2024-01-29 17:50:45', '2024-01-29 17:50:45', NULL),
(39, 95, 'pratik Enterprises', NULL, 'uttan Bhayander west', NULL, NULL, 1, '2024-01-29 18:26:55', '2024-01-29 18:26:55', NULL),
(40, 97, 'Saroj Enterprises', NULL, 'sanjay nagar sundar baag kamani kurla (w) mumbai 400070', 'all furniture word and sivil work', 'public/work_recommendation//97_Saroj Enterprises.jpg', 1, '2024-01-29 20:21:56', '2024-01-29 20:21:56', NULL),
(41, 99, 'Jk plumbing', NULL, 'nilkanth nagar', NULL, 'public/work_recommendation//99_Jk plumbing.pdf', 1, '2024-01-30 16:37:36', '2024-01-30 16:37:36', NULL),
(42, 100, 'design construction', '27AARFD4970F', '114,12/15, bhartiya kamla nagar near Karbala masjid antop hill wadala east', 'civil work, fabrication work, painting work, furniture work, plumbing work, pop contractor,', NULL, 1, '2024-01-30 17:18:31', '2024-01-30 17:18:31', NULL),
(43, 101, 'S.S.ELECTRICAL', NULL, 'Shop 4 narendra ho.so. jogeshwari west Mumbai 400102', 'all types electrical work', NULL, 1, '2024-01-30 17:46:04', '2024-01-30 17:46:04', NULL),
(44, 102, 'AL-HANNAN Plumbing and civil workers', NULL, 'Petronila building palinaka bandra west', NULL, NULL, 1, '2024-01-31 12:45:19', '2024-01-31 12:45:19', NULL),
(45, 107, 'THE GLASS UNIVERSE', NULL, 'Kolshet', NULL, NULL, 1, '2024-02-02 16:29:15', '2024-02-02 16:29:15', NULL),
(46, 108, 'CLASSIC P O P', NULL, 'cama industrial estate  Goregaon East nigosh building', 'ALL kind false ceiling work....\nwe use superior quality India s most trusted home brand for false ceiling, wall p.o.p', NULL, 1, '2024-02-02 20:27:08', '2024-02-02 20:27:08', NULL),
(47, 110, 'H & P CIVL CONTRACTOR', NULL, 'room no 5 chhotu n patel chwal ambewadi kurara Village Malad East Mumbai 400097', NULL, NULL, 1, '2024-02-03 13:20:44', '2024-02-03 13:20:44', NULL),
(48, 111, 'Innovative Design', NULL, 'Shop 8,Durga Residency,Indra lok,Phase 4,Bhayander east', NULL, NULL, 1, '2024-02-05 13:03:01', '2024-02-05 13:03:01', NULL),
(49, 112, 'voltamp eletech', NULL, '210,tirupati plaza,New Bamroli Road ,surat.', 'complet electrical work.', NULL, 1, '2024-02-05 17:13:07', '2024-02-05 17:13:07', NULL),
(50, 113, 'chhotu infra', 'no', 'saini colony hariyana gurugram', 'we are good then you are good', NULL, 1, '2024-02-05 20:13:53', '2024-02-05 20:13:53', NULL),
(51, 114, 'shiv Shakti Interiors', NULL, 'S8, Shree Balaji Krupa Apartment Indralok phase 6 nearby RBK International School Mira-Bhayander East', NULL, 'public/work_recommendation//114_shiv Shakti Interiors.pdf', 1, '2024-02-05 20:47:28', '2024-02-05 20:47:28', NULL),
(52, 122, 'Krishna Bind', NULL, 'Borivali', NULL, NULL, 1, '2024-02-06 08:38:40', '2024-02-06 08:38:40', NULL),
(53, 127, 'sharwan lal', NULL, 'civil, watter proffing', NULL, NULL, 1, '2024-02-06 08:51:09', '2024-02-06 08:51:09', NULL),
(54, 129, 'A R ENTERPRISES', NULL, '667 MADANPUR KHADAR SARITA VIHAR NEW DELHI 110076', NULL, NULL, 1, '2024-02-06 10:46:25', '2024-02-06 10:46:25', NULL),
(55, 132, 'vastu Interior', NULL, 'sinner phata,samangaon road,near Sai vishwa apt,shop no 2 nashik road nashik', 'kitchen trolly,modular furniture,pop ,trunkey projects', NULL, 1, '2024-02-06 12:52:53', '2024-02-06 12:52:53', NULL),
(56, 135, 'HS INTERIORS', '27CQTPS8309H', 'bandra East mumbai-51', NULL, NULL, 1, '2024-02-07 13:33:02', '2024-02-07 13:33:02', NULL),
(57, 136, 'Sai modular kitchen and furniture', NULL, 'U 2/3 khan compound opp galexy hotel vasai phata vasai east', NULL, NULL, 1, '2024-02-07 13:37:05', '2024-02-07 13:37:05', NULL),
(58, 138, 'L.B.S furniture', NULL, 'Vikhroli park saide varsha nagar bhakti Sagar society room 222', 'kurla sayba group', 'public/work_recommendation//138_L.B.S furniture.jpg', 1, '2024-02-07 13:55:02', '2024-02-07 13:55:02', NULL),
(59, 140, 'Mahesh', NULL, 'Rajshree apt saket group ,chinchpada Rd', NULL, NULL, 1, '2024-02-07 17:24:53', '2024-02-07 17:24:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_kycs`
--

CREATE TABLE `user_kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-active,0-inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_kycs`
--

INSERT INTO `user_kycs` (`id`, `user_id`, `name`, `number`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 32, 'pan', 'FMVPS8921Q', 'public/user_kyc/32_pan.jpeg', 1, '2024-01-20 14:13:08', '2024-01-20 14:13:08'),
(2, 32, 'aadhaar_front', '478270059148', 'public/user_kyc/32_aadhaar_front.jpeg', 1, '2024-01-20 14:13:08', '2024-01-20 14:13:08'),
(3, 32, 'aadhaar_back', '478270059148', 'public/user_kyc/32_aadhaar_back.jpeg', 1, '2024-01-20 14:13:08', '2024-01-20 14:13:08'),
(4, 16, 'pan', 'Test', 'public/user_kyc/16_pan.jpeg', 1, '2024-01-22 17:56:31', '2024-01-22 17:56:31'),
(5, 16, 'aadhaar_front', '383838383828253', 'public/user_kyc/16_aadhaar_front.jpeg', 1, '2024-01-22 17:56:31', '2024-01-22 17:56:31'),
(6, 16, 'aadhaar_back', '383838383828253', 'public/user_kyc/16_aadhaar_back.jpeg', 1, '2024-01-22 17:56:31', '2024-01-22 17:56:31'),
(7, 41, 'pan', 'CCNPK3499Q', 'public/user_kyc/41_pan.jpeg', 1, '2024-01-22 19:09:48', '2024-01-22 19:09:48'),
(8, 41, 'aadhaar_front', '427099537772', 'public/user_kyc/41_aadhaar_front.jpeg', 1, '2024-01-22 19:09:48', '2024-01-22 19:09:48'),
(9, 41, 'aadhaar_back', '427099537772', 'public/user_kyc/41_aadhaar_back.jpeg', 1, '2024-01-22 19:09:48', '2024-01-22 19:09:48'),
(10, 42, 'pan', 'BYZPS9110B', 'public/user_kyc/42_pan.jpeg', 1, '2024-01-22 20:11:11', '2024-01-22 20:11:11'),
(11, 42, 'aadhaar_front', '569254856743', 'public/user_kyc/42_aadhaar_front.jpeg', 1, '2024-01-22 20:11:11', '2024-01-22 20:11:11'),
(12, 42, 'aadhaar_back', '569254856743', 'public/user_kyc/42_aadhaar_back.jpeg', 1, '2024-01-22 20:11:11', '2024-01-22 20:11:11'),
(13, 37, 'pan', 'DWIPR1453P', 'public/user_kyc/37_pan.jpeg', 1, '2024-01-23 18:20:34', '2024-01-23 18:20:34'),
(14, 37, 'aadhaar_front', '359046044341', 'public/user_kyc/37_aadhaar_front.jpeg', 1, '2024-01-23 18:20:34', '2024-01-23 18:20:34'),
(15, 37, 'aadhaar_back', '359046044341', 'public/user_kyc/37_aadhaar_back.jpeg', 1, '2024-01-23 18:20:34', '2024-01-23 18:20:34'),
(16, 52, 'pan', 'DAIPS146P', 'public/user_kyc/52_pan.jpeg', 1, '2024-01-23 21:09:57', '2024-01-23 21:09:57'),
(17, 52, 'aadhaar_front', '662336160681', 'public/user_kyc/52_aadhaar_front.jpeg', 1, '2024-01-23 21:09:57', '2024-01-23 21:09:57'),
(18, 52, 'aadhaar_back', '662336160681', 'public/user_kyc/52_aadhaar_back.jpeg', 1, '2024-01-23 21:09:57', '2024-01-23 21:09:57'),
(19, 51, 'pan', 'DUAPA4328C', 'public/user_kyc/51_pan.jpeg', 1, '2024-01-24 08:16:11', '2024-01-24 08:16:11'),
(20, 51, 'aadhaar_front', '633343644728', 'public/user_kyc/51_aadhaar_front.jpeg', 1, '2024-01-24 08:16:11', '2024-01-24 08:16:11'),
(21, 51, 'aadhaar_back', '633343644728', 'public/user_kyc/51_aadhaar_back.jpeg', 1, '2024-01-24 08:16:11', '2024-01-24 08:16:11'),
(22, 53, 'pan', 'FMVPS8921Q', 'public/user_kyc/53_pan.jpeg', 1, '2024-01-24 17:10:49', '2024-01-24 17:10:49'),
(23, 53, 'aadhaar_front', '478270059148', 'public/user_kyc/53_aadhaar_front.jpeg', 1, '2024-01-24 17:10:49', '2024-01-24 17:10:49'),
(24, 53, 'aadhaar_back', '478270059148', 'public/user_kyc/53_aadhaar_back.jpeg', 1, '2024-01-24 17:10:49', '2024-01-24 17:10:49'),
(25, 61, 'pan', 'BMZPS5335J', 'public/user_kyc/61_pan.jpeg', 1, '2024-01-24 20:17:59', '2024-01-24 20:17:59'),
(26, 61, 'aadhaar_front', '583196214987', 'public/user_kyc/61_aadhaar_front.jpeg', 1, '2024-01-24 20:17:59', '2024-01-24 20:17:59'),
(27, 61, 'aadhaar_back', '583196214987', 'public/user_kyc/61_aadhaar_back.jpeg', 1, '2024-01-24 20:17:59', '2024-01-24 20:17:59'),
(28, 63, 'pan', 'ECQPK7703C', 'public/user_kyc/63_pan.jpeg', 1, '2024-01-24 21:24:34', '2024-01-24 21:24:34'),
(29, 63, 'aadhaar_front', '441549109416', 'public/user_kyc/63_aadhaar_front.jpeg', 1, '2024-01-24 21:24:34', '2024-01-24 21:24:34'),
(30, 63, 'aadhaar_back', '441549109416', 'public/user_kyc/63_aadhaar_back.jpeg', 1, '2024-01-24 21:24:34', '2024-01-24 21:24:34'),
(31, 62, 'pan', 'Amppv2157A', 'public/user_kyc/62_pan.jpeg', 1, '2024-01-25 10:42:17', '2024-01-25 10:42:17'),
(32, 62, 'aadhaar_front', '334054476992', 'public/user_kyc/62_aadhaar_front.jpeg', 1, '2024-01-25 10:42:17', '2024-01-25 10:42:17'),
(33, 62, 'aadhaar_back', '334054476992', 'public/user_kyc/62_aadhaar_back.jpeg', 1, '2024-01-25 10:42:17', '2024-01-25 10:42:17'),
(34, 71, 'pan', 'CDGPS5916L', 'public/user_kyc/71_pan.jpeg', 1, '2024-01-25 22:52:40', '2024-01-25 22:52:40'),
(35, 71, 'aadhaar_front', '646924727009', 'public/user_kyc/71_aadhaar_front.jpeg', 1, '2024-01-25 22:52:40', '2024-01-25 22:52:40'),
(36, 71, 'aadhaar_back', '646924727009', 'public/user_kyc/71_aadhaar_back.jpeg', 1, '2024-01-25 22:52:40', '2024-01-25 22:52:40'),
(37, 83, 'pan', 'ggjkkmnbjm', 'public/user_kyc/83_pan.jpeg', 1, '2024-01-28 11:51:52', '2024-01-28 11:51:52'),
(38, 83, 'aadhaar_front', '6646695994694.', 'public/user_kyc/83_aadhaar_front.jpeg', 1, '2024-01-28 11:51:52', '2024-01-28 11:51:52'),
(39, 83, 'aadhaar_back', '6646695994694.', 'public/user_kyc/83_aadhaar_back.jpeg', 1, '2024-01-28 11:51:52', '2024-01-28 11:51:52'),
(40, 94, 'pan', 'EMKPK2347N', 'public/user_kyc/94_pan.jpeg', 1, '2024-01-29 18:17:52', '2024-01-29 18:17:52'),
(41, 94, 'aadhaar_front', '420177952358', 'public/user_kyc/94_aadhaar_front.jpeg', 1, '2024-01-29 18:17:53', '2024-01-29 18:17:53'),
(42, 94, 'aadhaar_back', '420177952358', 'public/user_kyc/94_aadhaar_back.jpeg', 1, '2024-01-29 18:17:53', '2024-01-29 18:17:53'),
(43, 108, 'pan', 'FNSPK6014A', 'public/user_kyc/108_pan.jpeg', 1, '2024-02-02 20:50:19', '2024-02-02 20:50:19'),
(44, 108, 'aadhaar_front', '450421626712', 'public/user_kyc/108_aadhaar_front.jpeg', 1, '2024-02-02 20:50:19', '2024-02-02 20:50:19'),
(45, 108, 'aadhaar_back', '450421626712', 'public/user_kyc/108_aadhaar_back.jpeg', 1, '2024-02-02 20:50:19', '2024-02-02 20:50:19'),
(46, 110, 'pan', 'HTCPK9313L', 'public/user_kyc/110_pan.png', 1, '2024-02-03 16:55:59', '2024-02-03 16:55:59'),
(47, 110, 'aadhaar_front', '439774398905', 'public/user_kyc/110_aadhaar_front.jpeg', 1, '2024-02-03 16:55:59', '2024-02-03 16:55:59'),
(48, 110, 'aadhaar_back', '439774398905', 'public/user_kyc/110_aadhaar_back.jpeg', 1, '2024-02-03 16:55:59', '2024-02-03 16:55:59'),
(49, 112, 'pan', 'BVPPM1298D', 'public/user_kyc/112_pan.jpeg', 1, '2024-02-05 17:14:57', '2024-02-05 17:14:57'),
(50, 112, 'aadhaar_front', '391776697250', 'public/user_kyc/112_aadhaar_front.jpeg', 1, '2024-02-05 17:14:57', '2024-02-05 17:14:57'),
(51, 112, 'aadhaar_back', '391776697250', 'public/user_kyc/112_aadhaar_back.jpeg', 1, '2024-02-05 17:14:57', '2024-02-05 17:14:57'),
(52, 113, 'pan', 'CHEPP9629P', 'public/user_kyc/113_pan.jpeg', 1, '2024-02-06 01:13:27', '2024-02-06 01:13:27'),
(53, 113, 'aadhaar_front', '766877666917', 'public/user_kyc/113_aadhaar_front.jpeg', 1, '2024-02-06 01:13:27', '2024-02-06 01:13:27'),
(54, 113, 'aadhaar_back', '766877666917', 'public/user_kyc/113_aadhaar_back.jpeg', 1, '2024-02-06 01:13:28', '2024-02-06 01:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_otps`
--

CREATE TABLE `user_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_otps`
--

INSERT INTO `user_otps` (`id`, `phone`, `email`, `code`, `type`, `created_at`, `updated_at`) VALUES
(1, '9111111111', NULL, '5676', 'register', '2024-01-04 11:23:03', '2024-01-04 11:23:03'),
(2, '9920280114', NULL, '6857', 'register', '2024-01-05 09:51:33', '2024-01-05 09:51:52'),
(3, '8792853707', NULL, '1179', 'forgot_password', '2024-01-05 09:52:30', '2024-01-08 12:06:53'),
(4, '9876543211', NULL, '4544', 'register', '2024-01-05 10:46:35', '2024-01-05 10:46:35'),
(5, '9769965692', NULL, '1291', 'register', '2024-01-05 10:47:33', '2024-01-05 10:47:33'),
(6, '9582365423', NULL, '7857', 'register', '2024-01-06 11:12:06', '2024-01-06 11:12:06'),
(7, '9821581999', NULL, '8874', 'forgot_password', '2024-01-07 09:16:07', '2024-01-18 05:44:14'),
(8, '8976601017', NULL, '1308', 'register', '2024-01-08 09:11:14', '2024-01-08 09:11:14'),
(9, '9222222222', NULL, '9816', 'register', '2024-01-13 06:01:11', '2024-01-13 06:01:11'),
(10, '9167119131', NULL, '7262', 'register', '2024-01-13 06:30:14', '2024-01-13 06:30:14'),
(11, '9999999991', NULL, '1693', 'register', '2024-01-17 05:16:21', '2024-01-17 05:16:21'),
(12, '9999999992', NULL, '7344', 'register', '2024-01-17 07:06:09', '2024-01-17 07:06:09'),
(13, '9999999993', NULL, '7382', 'register', '2024-01-17 08:09:02', '2024-01-17 08:09:02'),
(14, '9999999994', NULL, '7019', 'register', '2024-01-17 10:10:14', '2024-01-17 10:10:14'),
(15, '8888888888', NULL, '7425', 'register', '2024-01-18 06:30:03', '2024-01-18 06:30:03'),
(16, '9999999996', NULL, '4824', 'register', '2024-01-18 10:23:57', '2024-01-18 10:24:25'),
(17, '8888888881', NULL, '1913', 'register', '2024-01-18 10:25:16', '2024-01-18 10:25:16'),
(18, '7777777771', NULL, '4511', 'register', '2024-01-18 10:27:58', '2024-01-18 10:27:58'),
(19, '9833936382', NULL, '3476', 'register', '2024-01-19 20:00:22', '2024-01-19 20:00:22'),
(20, '8355957677', NULL, '4142', 'register', '2024-01-20 11:14:12', '2024-01-20 11:14:12'),
(21, '9892015879', NULL, '7239', 'register', '2024-01-20 12:40:12', '2024-01-20 12:40:12'),
(22, '6362536261', NULL, '1244', 'register', '2024-01-20 12:47:57', '2024-01-20 12:47:57'),
(23, '7700033405', NULL, '5867', 'register', '2024-01-20 13:38:44', '2024-01-23 14:16:46'),
(24, '9352321508', NULL, '3937', 'resend', '2024-01-20 13:40:27', '2024-01-20 13:41:08'),
(25, '8828060675', NULL, '3373', 'register', '2024-01-20 14:41:18', '2024-01-20 14:41:18'),
(26, '7045485028', NULL, '1743', 'register', '2024-01-20 17:54:48', '2024-01-20 17:54:48'),
(27, '9029295301', NULL, '6009', 'register', '2024-01-21 08:17:58', '2024-01-21 08:32:22'),
(28, '9594179494', NULL, '8463', 'register', '2024-01-21 23:23:29', '2024-01-21 23:23:29'),
(29, '9082066490', NULL, '6019', 'register', '2024-01-22 11:36:02', '2024-01-22 11:36:02'),
(30, '9769439740', NULL, '6925', 'register', '2024-01-22 12:22:32', '2024-01-22 12:22:32'),
(31, '9867312856', NULL, '5939', 'resend', '2024-01-22 15:26:55', '2024-01-22 16:09:14'),
(32, '9870748711', NULL, '7167', 'resend', '2024-01-22 18:45:01', '2024-01-22 18:46:35'),
(33, '9967862342', NULL, '4434', 'register', '2024-01-22 19:00:07', '2024-01-22 19:00:07'),
(34, '9820010408', NULL, '1953', 'register', '2024-01-22 19:29:23', '2024-01-22 21:52:46'),
(35, '9967268099', NULL, '3764', 'register', '2024-01-22 20:00:36', '2024-01-22 20:00:36'),
(36, '7420990440', NULL, '6656', 'register', '2024-01-22 20:03:21', '2024-01-22 20:03:21'),
(37, '9920612114', NULL, '3369', 'register', '2024-01-22 21:32:00', '2024-01-22 21:32:00'),
(38, '8953654087', NULL, '6403', 'register', '2024-01-22 21:47:11', '2024-01-22 21:47:11'),
(39, '9768039580', NULL, '1063', 'register', '2024-01-22 22:28:20', '2024-01-22 22:28:20'),
(40, '9082789905', NULL, '8992', 'register', '2024-01-23 10:27:51', '2024-01-23 10:27:51'),
(41, '8082714858', NULL, '8701', 'register', '2024-01-23 10:31:05', '2024-01-23 10:31:05'),
(42, '9769015663', NULL, '4719', 'register', '2024-01-23 14:40:50', '2024-01-23 14:41:22'),
(43, '8079069799', NULL, '1685', 'change_phone', '2024-01-23 15:58:20', '2024-01-23 15:58:20'),
(44, '9022422022', NULL, '4661', 'register', '2024-01-23 16:56:27', '2024-01-23 16:56:27'),
(45, '9699622178', NULL, '4286', 'register', '2024-01-23 22:29:59', '2024-01-23 22:29:59'),
(46, '6393109911', NULL, '2542', 'register', '2024-01-23 23:50:27', '2024-01-23 23:50:27'),
(47, '9967310812', NULL, '1324', 'register', '2024-01-24 20:06:07', '2024-01-24 20:06:07'),
(48, '9967506618', NULL, '1665', 'resend', '2024-01-24 20:14:53', '2024-01-24 20:15:24'),
(49, '9892924015', NULL, '9183', 'register', '2024-01-24 20:28:50', '2024-01-24 20:28:50'),
(50, '9819741798', NULL, '3123', 'register', '2024-01-24 20:49:56', '2024-01-24 20:49:56'),
(51, '9987357413', NULL, '6978', 'register', '2024-01-24 22:37:01', '2024-01-24 22:37:01'),
(52, '7666191673', NULL, '9150', 'register', '2024-01-25 08:12:32', '2024-01-25 08:12:32'),
(53, '7715985668', NULL, '7137', 'register', '2024-01-25 13:38:56', '2024-01-25 13:38:56'),
(54, '7977172738', NULL, '7820', 'register', '2024-01-25 16:56:33', '2024-01-25 16:56:33'),
(55, '9594605280', NULL, '1673', 'register', '2024-01-25 17:20:08', '2024-01-25 17:20:08'),
(56, '9167597541', NULL, '4764', 'register', '2024-01-25 22:37:25', '2024-01-25 22:37:25'),
(57, '9322014153', NULL, '3300', 'register', '2024-01-26 09:35:20', '2024-01-26 09:35:20'),
(58, '8850926568', NULL, '2821', 'register', '2024-01-26 14:09:19', '2024-01-26 14:09:19'),
(59, '9608355027', NULL, '9043', 'register', '2024-01-27 14:10:07', '2024-01-27 14:10:07'),
(60, '9369124454', NULL, '8276', 'register', '2024-01-27 16:25:04', '2024-01-27 16:25:04'),
(61, '9930688782', NULL, '8618', 'resend', '2024-01-27 17:57:38', '2024-01-27 17:59:12'),
(62, '9869148182', NULL, '5781', 'register', '2024-01-27 18:34:13', '2024-01-27 18:34:13'),
(63, '9680369048', NULL, '4401', 'register', '2024-01-27 20:18:17', '2024-01-27 20:18:17'),
(64, '9420566709', NULL, '2709', 'register', '2024-01-27 20:31:41', '2024-01-27 20:31:41'),
(65, '8104494899', NULL, '4764', 'register', '2024-01-27 22:20:18', '2024-01-27 22:20:18'),
(66, '7007673168', NULL, '6667', 'register', '2024-01-28 15:25:25', '2024-01-28 15:25:25'),
(67, '5469946664', NULL, '3897', 'register', '2024-01-28 15:45:56', '2024-01-28 15:45:56'),
(68, '9222364028', NULL, '8886', 'register', '2024-01-28 18:06:39', '2024-01-28 18:06:39'),
(69, '8157915958', NULL, '1783', 'register', '2024-01-29 01:27:35', '2024-01-29 01:27:35'),
(70, '7042985676', NULL, '4422', 'register', '2024-01-29 08:37:57', '2024-01-29 08:37:57'),
(71, '8448958728', NULL, '3539', 'register', '2024-01-29 09:41:05', '2024-01-29 09:41:05'),
(72, '8078130211', NULL, '2224', 'register', '2024-01-29 10:28:27', '2024-01-29 10:28:27'),
(73, '9773852822', NULL, '1953', 'register', '2024-01-29 17:33:27', '2024-01-29 17:33:27'),
(74, '8080034434', NULL, '6556', 'register', '2024-01-29 17:48:38', '2024-01-29 17:48:38'),
(75, '9892638430', NULL, '7717', 'register', '2024-01-29 18:24:10', '2024-01-29 18:24:10'),
(76, '8629948171', NULL, '8629', 'register', '2024-01-29 19:26:44', '2024-01-29 19:26:44'),
(77, '9867694291', NULL, '3036', 'register', '2024-01-29 20:18:47', '2024-01-29 20:18:47'),
(78, '9004692113', NULL, '9520', 'register', '2024-01-30 07:34:55', '2024-01-30 07:34:55'),
(79, '8692038400', NULL, '5476', 'register', '2024-01-30 16:35:02', '2024-01-30 16:35:02'),
(80, '8692038408', NULL, '4949', 'register', '2024-01-30 16:35:33', '2024-01-30 16:35:33'),
(81, '9594361987', NULL, '3456', 'register', '2024-01-30 17:15:59', '2024-01-30 17:15:59'),
(82, '9594116364', NULL, '3365', 'register', '2024-01-30 17:42:57', '2024-01-30 17:42:57'),
(83, '9623752524', NULL, '9645', 'register', '2024-01-31 12:43:24', '2024-01-31 12:43:24'),
(84, '8875666749', NULL, '1248', 'register', '2024-01-31 17:11:38', '2024-01-31 17:11:38'),
(85, '9878118475', NULL, '2467', 'register', '2024-01-31 17:18:42', '2024-01-31 17:18:42'),
(86, '6351835929', NULL, '6489', 'register', '2024-01-31 18:54:59', '2024-01-31 18:54:59'),
(87, '7993567830', NULL, '5395', 'register', '2024-02-01 14:50:26', '2024-02-01 14:50:26'),
(88, '9819492631', NULL, '5069', 'register', '2024-02-02 16:27:58', '2024-02-02 16:27:58'),
(89, '9616250951', NULL, '1171', 'register', '2024-02-02 20:17:37', '2024-02-02 20:17:37'),
(90, '8003021954', NULL, '8297', 'register', '2024-02-03 11:21:39', '2024-02-03 11:21:39'),
(91, '8828608240', NULL, '8914', 'register', '2024-02-03 13:18:42', '2024-02-03 13:18:42'),
(92, '8424849686', NULL, '2811', 'register', '2024-02-05 12:59:29', '2024-02-05 12:59:29'),
(93, '9033200373', NULL, '5621', 'register', '2024-02-05 17:11:31', '2024-02-05 17:11:31'),
(94, '8149900376', NULL, '6709', 'register', '2024-02-05 20:01:06', '2024-02-05 20:01:06'),
(95, '8657256910', NULL, '9244', 'register', '2024-02-05 20:43:14', '2024-02-05 20:43:14'),
(96, '8076769586', NULL, '7318', 'register', '2024-02-06 00:23:51', '2024-02-06 00:23:51'),
(97, '7322061986', NULL, '3140', 'register', '2024-02-06 08:36:12', '2024-02-06 08:36:12'),
(98, '9323186091', NULL, '9908', 'resend', '2024-02-06 08:37:52', '2024-02-06 08:38:16'),
(99, '7632839742', NULL, '7616', 'register', '2024-02-06 08:39:18', '2024-02-06 08:39:18'),
(100, '8295853741', NULL, '8527', 'register', '2024-02-06 08:43:48', '2024-02-06 08:43:48'),
(101, '7738457613', NULL, '2377', 'register', '2024-02-06 08:48:25', '2024-02-06 08:48:25'),
(102, '7404305031', NULL, '1000', 'register', '2024-02-06 08:50:14', '2024-02-06 08:50:14'),
(103, '8178323044', NULL, '5438', 'register', '2024-02-06 10:30:13', '2024-02-06 10:30:13'),
(104, '7561975857', NULL, '3416', 'register', '2024-02-06 11:53:10', '2024-02-06 11:53:10'),
(105, '9871361150', NULL, '8623', 'register', '2024-02-06 12:11:49', '2024-02-06 12:11:49'),
(106, '9021239919', NULL, '3353', 'register', '2024-02-06 12:50:11', '2024-02-06 12:50:11'),
(107, '6261912537', NULL, '5636', 'register', '2024-02-06 17:01:57', '2024-02-06 17:01:57'),
(108, '9930110617', NULL, '4923', 'register', '2024-02-07 13:10:26', '2024-02-07 13:10:26'),
(109, '9833226335', NULL, '9970', 'register', '2024-02-07 13:31:12', '2024-02-07 13:31:12'),
(110, '9769001408', NULL, '3767', 'register', '2024-02-07 13:34:54', '2024-02-07 13:34:54'),
(111, '9594181332', NULL, '3942', 'register', '2024-02-07 13:36:20', '2024-02-07 13:36:20'),
(112, '9769087110', NULL, '3912', 'register', '2024-02-07 13:48:33', '2024-02-07 13:48:33'),
(113, '8717939804', NULL, '3038', 'register', '2024-02-07 17:09:43', '2024-02-07 17:09:43'),
(114, '7045493697', NULL, '9249', 'register', '2024-02-07 17:22:45', '2024-02-07 17:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_project_samples`
--

CREATE TABLE `user_project_samples` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_project_samples`
--

INSERT INTO `user_project_samples` (`id`, `user_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'Rustomjee', 1, '2024-01-06 11:13:23', '2024-01-06 11:13:23', NULL),
(2, 11, 'Shah residency', 1, '2024-01-13 06:32:36', '2024-01-13 06:32:36', NULL),
(3, 11, 'Project wildfire', 1, '2024-01-13 06:33:01', '2024-01-13 06:33:01', NULL),
(4, 17, 'sghs', 1, '2024-01-17 06:21:51', '2024-01-17 06:21:51', NULL),
(5, 19, 'Testing', 1, '2024-01-17 08:25:38', '2024-01-17 08:25:38', NULL),
(6, 21, 'sywy', 1, '2024-01-17 23:51:11', '2024-01-17 23:51:11', NULL),
(7, 21, 'abc', 1, '2024-01-18 00:40:03', '2024-01-18 00:40:22', '2024-01-18 00:40:22'),
(8, 21, 'abc', 1, '2024-01-18 00:41:39', '2024-01-18 00:41:39', NULL),
(9, 22, 'abc', 1, '2024-01-18 06:31:01', '2024-01-22 12:39:59', '2024-01-22 12:39:59'),
(10, 1, 'sample', 1, '2024-01-18 06:40:43', '2024-01-18 06:40:43', NULL),
(11, 1, 'sd', 1, '2024-01-18 07:18:28', '2024-01-18 07:29:28', '2024-01-18 07:29:28'),
(12, 1, 'ab', 1, '2024-01-18 07:19:32', '2024-01-18 07:29:25', '2024-01-18 07:29:25'),
(13, 1, 'df', 1, '2024-01-18 07:25:08', '2024-01-18 07:25:16', '2024-01-18 07:25:16'),
(14, 1, 'dff', 1, '2024-01-18 07:29:16', '2024-01-18 07:29:22', '2024-01-18 07:29:22'),
(15, 1, 'e3', 1, '2024-01-18 07:39:27', '2024-01-18 07:39:27', NULL),
(16, 1, 'hvh', 1, '2024-01-18 07:44:16', '2024-01-18 07:44:16', NULL),
(17, 1, 'yu', 1, '2024-01-18 08:27:41', '2024-01-18 08:27:41', NULL),
(18, 24, 'Testing', 1, '2024-01-18 10:26:56', '2024-01-18 10:26:56', NULL),
(19, 29, 'Runwal Forest', 1, '2024-01-20 13:05:58', '2024-01-20 13:05:58', NULL),
(20, 32, 'kanjur Marg, runwal forest tower 8, 3 bhk recidency', 1, '2024-01-20 14:21:15', '2024-01-22 07:39:45', '2024-01-22 07:39:45'),
(21, 32, 'ghatkopar, Skyline magnus 4 bhk recidency', 1, '2024-01-22 07:38:31', '2024-01-22 07:38:31', NULL),
(22, 39, 'bedroom wardrobe', 1, '2024-01-22 16:33:23', '2024-01-22 16:33:23', NULL),
(23, 41, 'Mumbai Azad nagar Andheri residential project', 1, '2024-01-22 19:06:31', '2024-01-22 19:06:31', NULL),
(24, 41, 'hiranandani', 1, '2024-01-22 19:11:59', '2024-01-22 19:11:59', NULL),
(25, 42, 'vivarea condominium', 1, '2024-01-22 20:05:25', '2024-01-22 20:05:25', NULL),
(26, 46, 'sky forest prbhadevi duplex house', 1, '2024-01-22 21:55:23', '2024-01-22 21:55:23', NULL),
(27, 45, 'eatfit and hrx all 12000 square fit', 1, '2024-01-22 21:58:21', '2024-01-26 11:31:58', '2024-01-26 11:31:58'),
(28, 44, 'Hiranandani Vega Hospital, Lifeshot', 1, '2024-01-22 22:23:04', '2024-01-22 22:23:04', NULL),
(29, 56, 'Safiya construction', 1, '2024-01-23 22:32:43', '2024-01-23 22:32:43', NULL),
(30, 51, 'Runwal Forest Tower-8 (3BHK) Full New Wiring', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(31, 61, 'lodha bleair 3bhk Flat', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(32, 32, 'kanjur Marg runwal forest 3 bhk recidency', 1, '2024-01-24 20:43:32', '2024-01-24 20:43:32', NULL),
(33, 63, 'Gypsum False Ceiling', 1, '2024-01-24 21:04:59', '2024-01-24 21:04:59', NULL),
(34, 62, 'plaster of Paris', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(35, 66, 'pop folsilling', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(36, 70, 'electrician', 1, '2024-01-25 19:13:21', '2024-01-25 19:13:21', NULL),
(37, 71, 'Dhananjay Singh', 1, '2024-01-25 22:47:58', '2024-01-25 22:47:58', NULL),
(38, 72, 'Lodha,2 bhk, RNA 2bhk', 1, '2024-01-26 09:56:54', '2024-01-26 09:56:54', NULL),
(39, 94, 'badlapur', 1, '2024-01-29 17:51:15', '2024-01-29 17:51:15', NULL),
(40, 97, 'saroj enterprises', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(41, 99, 'jk plumbing', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(42, 101, 'Residencial', 1, '2024-01-30 17:47:47', '2024-01-30 17:47:47', NULL),
(43, 102, 'raheja tower lokhand wala andheri', 1, '2024-01-31 12:52:18', '2024-01-31 12:52:18', NULL),
(44, 102, 'Gardenia buil.kandivali/Bhayander/ Mumbai center', 1, '2024-01-31 13:07:56', '2024-01-31 13:07:56', NULL),
(45, 108, 'Raheja ridge wood goregaon 2BHK Flat', 1, '2024-02-02 20:35:29', '2024-02-02 20:35:29', NULL),
(46, 108, 'rustam malad West', 1, '2024-02-02 20:43:30', '2024-02-02 20:43:30', NULL),
(47, 110, 'civil work ( tiles & Italian marble & kitchen platform )', 1, '2024-02-03 13:24:01', '2024-02-03 13:24:01', NULL),
(48, 111, 'Bhoomi acres', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(49, 113, 'Tamous pprivate ltd', 1, '2024-02-05 20:15:19', '2024-02-05 20:15:19', NULL),
(50, 114, 'BNP Paribas', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(51, 116, 'Noida uttar pradesh', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(52, 102, 'Khar link Road', 1, '2024-02-07 10:53:24', '2024-02-07 10:53:24', NULL),
(53, 137, 'Nahar Amrit Shakti Hiranandani Raheja shapoorji Palan ji Andheri mumbai all', 1, '2024-02-07 13:48:28', '2024-02-07 13:48:28', NULL),
(54, 138, 'kurla sayba groop', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_project_sample_images`
--

CREATE TABLE `user_project_sample_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_project_sample_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_project_sample_images`
--

INSERT INTO `user_project_sample_images` (`id`, `user_project_sample_id`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'public/project_sample/6_659935d37b160.jpeg', 1, '2024-01-06 11:13:23', '2024-01-06 11:13:23', NULL),
(2, 2, 'public/project_sample/11_65a22e84af6b4.jpeg', 1, '2024-01-13 06:32:36', '2024-01-13 06:32:36', NULL),
(3, 2, 'public/project_sample/11_65a22e84b16b4.jpeg', 1, '2024-01-13 06:32:36', '2024-01-13 06:32:36', NULL),
(4, 2, 'public/project_sample/11_65a22e84b242f.jpeg', 1, '2024-01-13 06:32:36', '2024-01-13 06:32:36', NULL),
(5, 3, 'public/project_sample/11_65a22e9de5106.jpeg', 1, '2024-01-13 06:33:01', '2024-01-13 06:33:01', NULL),
(6, 3, 'public/project_sample/11_65a22e9de7e44.jpeg', 1, '2024-01-13 06:33:01', '2024-01-13 06:33:01', NULL),
(7, 3, 'public/project_sample/11_65a22e9de8c7b.jpeg', 1, '2024-01-13 06:33:01', '2024-01-13 06:33:01', NULL),
(8, 4, 'public/project_sample/17_65a771ff46d69.jpeg', 1, '2024-01-17 06:21:51', '2024-01-17 06:21:51', NULL),
(9, 5, 'public/project_sample/19_65a78f02ef124.jpeg', 1, '2024-01-17 08:25:38', '2024-01-17 08:25:38', NULL),
(10, 5, 'public/project_sample/19_65a78f02f1b76.jpeg', 1, '2024-01-17 08:25:38', '2024-01-17 08:25:38', NULL),
(11, 5, 'public/project_sample/19_65a78f02f2124.jpeg', 1, '2024-01-17 08:25:38', '2024-01-17 08:25:38', NULL),
(12, 5, 'public/project_sample/19_65a78f02f265f.jpeg', 1, '2024-01-17 08:25:38', '2024-01-17 08:25:38', NULL),
(13, 6, 'public/project_sample/21_65a867ef332bf.jpeg', 1, '2024-01-17 23:51:11', '2024-01-17 23:51:11', NULL),
(14, 7, 'public/project_sample/21_65a87363c6f97.jpeg', 1, '2024-01-18 00:40:03', '2024-01-18 00:40:03', NULL),
(15, 7, 'public/project_sample/21_65a87363c8a9e.jpeg', 1, '2024-01-18 00:40:03', '2024-01-18 00:40:03', NULL),
(16, 7, 'public/project_sample/21_65a87363c8e88.jpeg', 1, '2024-01-18 00:40:03', '2024-01-18 00:40:13', '2024-01-18 00:40:13'),
(17, 7, 'public/project_sample/21_65a87363c9502.jpeg', 1, '2024-01-18 00:40:03', '2024-01-18 00:40:03', NULL),
(18, 8, 'public/project_sample/21_65a873c316885.jpeg', 1, '2024-01-18 00:41:39', '2024-01-18 00:41:39', NULL),
(19, 8, 'public/project_sample/21_65a873c318603.jpeg', 1, '2024-01-18 00:41:39', '2024-01-18 00:41:39', NULL),
(20, 8, 'public/project_sample/21_65a873c319179.jpeg', 1, '2024-01-18 00:41:39', '2024-01-18 00:41:39', NULL),
(21, 8, 'public/project_sample/21_65a873c31a429.jpeg', 1, '2024-01-18 00:41:39', '2024-01-18 00:41:39', NULL),
(22, 8, 'public/project_sample/21_65a873c31baf6.jpeg', 1, '2024-01-18 00:41:39', '2024-01-18 00:41:39', NULL),
(23, 8, 'public/project_sample/21_65a873c31cd2f.jpeg', 1, '2024-01-18 00:41:39', '2024-01-18 00:41:39', NULL),
(24, 9, 'public/project_sample/22_65a8c5a55ea12.jpeg', 1, '2024-01-18 06:31:01', '2024-01-18 06:31:01', NULL),
(25, 9, 'public/project_sample/22_65a8c5a561da9.jpeg', 1, '2024-01-18 06:31:01', '2024-01-18 06:31:01', NULL),
(26, 10, 'public/project_sample/1_65a8c7eb34f18.jpeg', 1, '2024-01-18 06:40:43', '2024-01-18 06:40:43', NULL),
(27, 10, 'public/project_sample/1_65a8c7eb38cc7.jpeg', 1, '2024-01-18 06:40:43', '2024-01-18 06:40:43', NULL),
(28, 10, 'public/project_sample/1_65a8c7eb39f9e.jpeg', 1, '2024-01-18 06:40:43', '2024-01-18 06:40:43', NULL),
(29, 10, 'public/project_sample/1_65a8c7eb3ad6a.jpeg', 1, '2024-01-18 06:40:43', '2024-01-18 06:40:43', NULL),
(30, 10, 'public/project_sample/1_65a8c7eb3c8fc.jpeg', 1, '2024-01-18 06:40:43', '2024-01-18 06:40:43', NULL),
(31, 11, 'public/project_sample/1_65a8d0c441f8e.jpeg', 1, '2024-01-18 07:18:28', '2024-01-18 07:18:28', NULL),
(32, 11, 'public/project_sample/1_65a8d0c4437bd.jpeg', 1, '2024-01-18 07:18:28', '2024-01-18 07:18:28', NULL),
(33, 11, 'public/project_sample/1_65a8d0c443e15.jpeg', 1, '2024-01-18 07:18:28', '2024-01-18 07:18:28', NULL),
(34, 11, 'public/project_sample/1_65a8d0c444865.jpeg', 1, '2024-01-18 07:18:28', '2024-01-18 07:18:37', '2024-01-18 07:18:37'),
(35, 11, 'public/project_sample/1_65a8d0c445373.jpeg', 1, '2024-01-18 07:18:28', '2024-01-18 07:18:36', '2024-01-18 07:18:36'),
(36, 12, 'public/project_sample/1_65a8d10406433.jpeg', 1, '2024-01-18 07:19:32', '2024-01-18 07:19:32', NULL),
(37, 12, 'public/project_sample/1_65a8d1040865d.jpeg', 1, '2024-01-18 07:19:32', '2024-01-18 07:19:32', NULL),
(38, 12, 'public/project_sample/1_65a8d10408fde.jpeg', 1, '2024-01-18 07:19:32', '2024-01-18 07:19:32', NULL),
(39, 12, 'public/project_sample/1_65a8d10409856.jpeg', 1, '2024-01-18 07:19:32', '2024-01-18 07:19:32', NULL),
(40, 12, 'public/project_sample/1_65a8d10409f74.jpeg', 1, '2024-01-18 07:19:32', '2024-01-18 07:19:32', NULL),
(41, 12, 'public/project_sample/1_65a8d1040acf3.jpeg', 1, '2024-01-18 07:19:32', '2024-01-18 07:19:32', NULL),
(42, 14, 'public/project_sample/1_65a8d34c35d86.jpeg', 1, '2024-01-18 07:29:16', '2024-01-18 07:29:16', NULL),
(43, 14, 'public/project_sample/1_65a8d34c37f4e.jpeg', 1, '2024-01-18 07:29:16', '2024-01-18 07:29:16', NULL),
(44, 14, 'public/project_sample/1_65a8d34c38717.jpeg', 1, '2024-01-18 07:29:16', '2024-01-18 07:29:16', NULL),
(45, 14, 'public/project_sample/1_65a8d34c3904d.jpeg', 1, '2024-01-18 07:29:16', '2024-01-18 07:29:16', NULL),
(46, 14, 'public/project_sample/1_65a8d34c39806.jpeg', 1, '2024-01-18 07:29:16', '2024-01-18 07:29:16', NULL),
(47, 14, 'public/project_sample/1_65a8d34c3a031.jpeg', 1, '2024-01-18 07:29:16', '2024-01-18 07:29:16', NULL),
(48, 14, 'public/project_sample/1_65a8d34c3af05.jpeg', 1, '2024-01-18 07:29:16', '2024-01-18 07:29:16', NULL),
(49, 15, 'public/project_sample/1_65a8d5afa3eab.jpeg', 1, '2024-01-18 07:39:27', '2024-01-18 07:39:27', NULL),
(50, 15, 'public/project_sample/1_65a8d5afa6553.jpeg', 1, '2024-01-18 07:39:27', '2024-01-18 07:39:27', NULL),
(51, 16, 'public/project_sample/1_65a8d6d09e288.jpeg', 1, '2024-01-18 07:44:16', '2024-01-18 07:44:16', NULL),
(52, 16, 'public/project_sample/1_65a8d6d0a1b40.jpeg', 1, '2024-01-18 07:44:16', '2024-01-18 07:44:16', NULL),
(53, 16, 'public/project_sample/1_65a8d6d0a2e44.jpeg', 1, '2024-01-18 07:44:16', '2024-01-18 07:44:16', NULL),
(54, 16, 'public/project_sample/1_65a8d6d0a40d7.jpeg', 1, '2024-01-18 07:44:16', '2024-01-18 07:44:16', NULL),
(55, 17, 'public/project_sample/1_65a8e0fdb5a99.jpeg', 1, '2024-01-18 08:27:41', '2024-01-18 08:27:41', NULL),
(56, 17, 'public/project_sample/1_65a8e0fdb7bdb.jpeg', 1, '2024-01-18 08:27:41', '2024-01-18 08:27:41', NULL),
(57, 17, 'public/project_sample/1_65a8e0fdb8201.jpeg', 1, '2024-01-18 08:27:41', '2024-01-18 08:27:41', NULL),
(58, 18, 'public/project_sample/24_65a8fcf0595e7.jpeg', 1, '2024-01-18 10:26:56', '2024-01-18 10:26:56', NULL),
(59, 18, 'public/project_sample/24_65a8fcf05ea0a.jpeg', 1, '2024-01-18 10:26:56', '2024-01-18 10:26:56', NULL),
(60, 19, 'public/project_sample/29_65ab77de20638.jpeg', 1, '2024-01-20 13:05:58', '2024-01-20 13:05:58', NULL),
(61, 20, 'public/project_sample/32_65ab898353ff8.jpeg', 1, '2024-01-20 14:21:15', '2024-01-20 14:21:15', NULL),
(62, 21, 'public/project_sample/32_65adce1f7e686.jpeg', 1, '2024-01-22 07:38:31', '2024-01-22 07:38:31', NULL),
(63, 21, 'public/project_sample/32_65adce1f80a99.jpeg', 1, '2024-01-22 07:38:31', '2024-01-22 07:38:31', NULL),
(64, 22, 'public/project_sample/39_65ae4b7b93344.jpeg', 1, '2024-01-22 16:33:23', '2024-01-22 16:33:23', NULL),
(65, 23, 'public/project_sample/41_65ae6f5f6793f.jpeg', 1, '2024-01-22 19:06:31', '2024-01-22 19:06:31', NULL),
(66, 23, 'public/project_sample/41_65ae6f5f6b0f7.jpeg', 1, '2024-01-22 19:06:31', '2024-01-22 19:06:31', NULL),
(67, 24, 'public/project_sample/41_65ae70a713cae.jpeg', 1, '2024-01-22 19:11:59', '2024-01-22 19:11:59', NULL),
(68, 24, 'public/project_sample/41_65ae70a71770a.jpeg', 1, '2024-01-22 19:11:59', '2024-01-22 19:11:59', NULL),
(69, 25, 'public/project_sample/42_65ae7d2d409bb.jpeg', 1, '2024-01-22 20:05:25', '2024-01-22 20:05:25', NULL),
(70, 27, 'public/project_sample/45_65ae97a6123db.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(71, 27, 'public/project_sample/45_65ae97a6189a4.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(72, 27, 'public/project_sample/45_65ae97a61c414.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(73, 27, 'public/project_sample/45_65ae97a62024d.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(74, 27, 'public/project_sample/45_65ae97a62320b.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(75, 27, 'public/project_sample/45_65ae97a623ae6.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(76, 27, 'public/project_sample/45_65ae97a627ceb.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(77, 27, 'public/project_sample/45_65ae97a628e36.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(78, 27, 'public/project_sample/45_65ae97a629fa1.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(79, 27, 'public/project_sample/45_65ae97a62ad7e.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(80, 27, 'public/project_sample/45_65ae97a62c019.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(81, 27, 'public/project_sample/45_65ae97a62f665.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(82, 27, 'public/project_sample/45_65ae97a634271.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(83, 27, 'public/project_sample/45_65ae97a637959.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(84, 27, 'public/project_sample/45_65ae97a63b701.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(85, 27, 'public/project_sample/45_65ae97a63fe68.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(86, 27, 'public/project_sample/45_65ae97a640772.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(87, 27, 'public/project_sample/45_65ae97a64563b.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(88, 27, 'public/project_sample/45_65ae97a64945d.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(89, 27, 'public/project_sample/45_65ae97a64db52.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(90, 27, 'public/project_sample/45_65ae97a65140c.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(91, 27, 'public/project_sample/45_65ae97a652002.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(92, 27, 'public/project_sample/45_65ae97a6528a1.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(93, 27, 'public/project_sample/45_65ae97a65377b.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(94, 27, 'public/project_sample/45_65ae97a654c78.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(95, 27, 'public/project_sample/45_65ae97a65592b.jpeg', 1, '2024-01-22 21:58:22', '2024-01-22 21:58:22', NULL),
(96, 29, 'public/project_sample/56_65aff1334a49a.jpeg', 1, '2024-01-23 22:32:43', '2024-01-23 22:32:43', NULL),
(97, 30, 'public/project_sample/51_65b0113ca0226.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(98, 30, 'public/project_sample/51_65b0113ca2519.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(99, 30, 'public/project_sample/51_65b0113ca2d11.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(100, 30, 'public/project_sample/51_65b0113ca33b5.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(101, 30, 'public/project_sample/51_65b0113ca398b.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(102, 30, 'public/project_sample/51_65b0113ca4191.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(103, 30, 'public/project_sample/51_65b0113ca48a6.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(104, 30, 'public/project_sample/51_65b0113ca4f80.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(105, 30, 'public/project_sample/51_65b0113ca560a.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(106, 30, 'public/project_sample/51_65b0113ca7cf5.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(107, 30, 'public/project_sample/51_65b0113ca83e7.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(108, 30, 'public/project_sample/51_65b0113ca8aa1.jpeg', 1, '2024-01-24 00:49:24', '2024-01-24 00:49:24', NULL),
(109, 31, 'public/project_sample/61_65b1224d9bbae.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(110, 31, 'public/project_sample/61_65b1224da17b7.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(111, 31, 'public/project_sample/61_65b1224da4994.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(112, 31, 'public/project_sample/61_65b1224da85b9.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(113, 31, 'public/project_sample/61_65b1224dabfff.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(114, 31, 'public/project_sample/61_65b1224dafe7c.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(115, 31, 'public/project_sample/61_65b1224db2e59.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(116, 31, 'public/project_sample/61_65b1224db7618.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(117, 31, 'public/project_sample/61_65b1224dbb916.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(118, 31, 'public/project_sample/61_65b1224dbf08c.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(119, 31, 'public/project_sample/61_65b1224dc4a77.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(120, 31, 'public/project_sample/61_65b1224dc9ff4.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(121, 31, 'public/project_sample/61_65b1224dceca3.jpeg', 1, '2024-01-24 20:14:29', '2024-01-24 20:14:29', NULL),
(122, 32, 'public/project_sample/32_65b1291ce31ae.jpeg', 1, '2024-01-24 20:43:32', '2024-01-24 20:43:32', NULL),
(123, 32, 'public/project_sample/32_65b1291ceaea3.jpeg', 1, '2024-01-24 20:43:32', '2024-01-24 20:43:32', NULL),
(124, 32, 'public/project_sample/32_65b1291cebe19.jpeg', 1, '2024-01-24 20:43:32', '2024-01-24 20:43:32', NULL),
(125, 32, 'public/project_sample/32_65b1291cecac0.jpeg', 1, '2024-01-24 20:43:32', '2024-01-24 20:43:32', NULL),
(126, 32, 'public/project_sample/32_65b1291ced9dd.jpeg', 1, '2024-01-24 20:43:32', '2024-01-24 20:43:32', NULL),
(127, 33, 'public/project_sample/63_65b12e24367c6.jpeg', 1, '2024-01-24 21:05:00', '2024-01-24 21:05:00', NULL),
(128, 33, 'public/project_sample/63_65b12e2443882.jpeg', 1, '2024-01-24 21:05:00', '2024-01-24 21:05:00', NULL),
(129, 33, 'public/project_sample/63_65b12e245099c.jpeg', 1, '2024-01-24 21:05:00', '2024-01-24 21:05:00', NULL),
(130, 33, 'public/project_sample/63_65b12e245106f.jpeg', 1, '2024-01-24 21:05:00', '2024-01-24 21:05:00', NULL),
(131, 33, 'public/project_sample/63_65b12e2451686.jpeg', 1, '2024-01-24 21:05:00', '2024-01-24 21:05:00', NULL),
(132, 33, 'public/project_sample/63_65b12e2451c5a.jpeg', 1, '2024-01-24 21:05:00', '2024-01-24 21:05:00', NULL),
(133, 33, 'public/project_sample/63_65b12e245fb42.jpeg', 1, '2024-01-24 21:05:00', '2024-01-24 21:05:00', NULL),
(134, 34, 'public/project_sample/62_65b1eec67fb2a.jpeg', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(135, 34, 'public/project_sample/62_65b1eec68461e.jpeg', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(136, 34, 'public/project_sample/62_65b1eec6862f1.jpeg', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(137, 34, 'public/project_sample/62_65b1eec68814f.jpeg', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(138, 34, 'public/project_sample/62_65b1eec68a650.jpeg', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(139, 34, 'public/project_sample/62_65b1eec68d3bf.jpeg', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(140, 34, 'public/project_sample/62_65b1eec690166.jpeg', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(141, 34, 'public/project_sample/62_65b1eec690d56.jpeg', 1, '2024-01-25 10:46:54', '2024-01-25 10:46:54', NULL),
(142, 35, 'public/project_sample/66_65b218aa1ade8.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(143, 35, 'public/project_sample/66_65b218aa1f886.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(144, 35, 'public/project_sample/66_65b218aa20847.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(145, 35, 'public/project_sample/66_65b218aa214ec.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(146, 35, 'public/project_sample/66_65b218aa2216e.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(147, 35, 'public/project_sample/66_65b218aa23b02.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(148, 35, 'public/project_sample/66_65b218aa24576.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(149, 35, 'public/project_sample/66_65b218aa24ef0.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(150, 35, 'public/project_sample/66_65b218aa255a3.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(151, 35, 'public/project_sample/66_65b218aa25fe1.jpeg', 1, '2024-01-25 13:45:38', '2024-01-25 13:45:38', NULL),
(152, 36, 'public/project_sample/70_65b26579c9c30.jpeg', 1, '2024-01-25 19:13:21', '2024-01-25 19:13:21', NULL),
(153, 37, 'public/project_sample/71_65b297c712c25.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(154, 37, 'public/project_sample/71_65b297c718f4c.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(155, 37, 'public/project_sample/71_65b297c71caef.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(156, 37, 'public/project_sample/71_65b297c71e8ea.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(157, 37, 'public/project_sample/71_65b297c71fbec.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(158, 37, 'public/project_sample/71_65b297c724ae8.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(159, 37, 'public/project_sample/71_65b297c7261a2.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(160, 37, 'public/project_sample/71_65b297c72bfc4.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(161, 37, 'public/project_sample/71_65b297c730ca1.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(162, 37, 'public/project_sample/71_65b297c73521c.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(163, 37, 'public/project_sample/71_65b297c73611b.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(164, 37, 'public/project_sample/71_65b297c736f19.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(165, 37, 'public/project_sample/71_65b297c73b368.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(166, 37, 'public/project_sample/71_65b297c740362.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(167, 37, 'public/project_sample/71_65b297c744599.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(168, 37, 'public/project_sample/71_65b297c748ce9.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(169, 37, 'public/project_sample/71_65b297c74d334.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(170, 37, 'public/project_sample/71_65b297c751a6d.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(171, 37, 'public/project_sample/71_65b297c756438.jpeg', 1, '2024-01-25 22:47:59', '2024-01-25 22:47:59', NULL),
(172, 38, 'public/project_sample/72_65b3348e63f52.jpeg', 1, '2024-01-26 09:56:54', '2024-01-26 09:56:54', NULL),
(173, 38, 'public/project_sample/72_65b3348e66b4e.jpeg', 1, '2024-01-26 09:56:54', '2024-01-26 09:56:54', NULL),
(174, 38, 'public/project_sample/72_65b3348e6775d.jpeg', 1, '2024-01-26 09:56:54', '2024-01-26 09:56:54', NULL),
(175, 38, 'public/project_sample/72_65b3348e680a1.jpeg', 1, '2024-01-26 09:56:54', '2024-01-26 09:56:54', NULL),
(176, 38, 'public/project_sample/72_65b3348e6882f.jpeg', 1, '2024-01-26 09:56:54', '2024-01-26 09:56:54', NULL),
(177, 39, 'public/project_sample/94_65b7983b87444.jpeg', 1, '2024-01-29 17:51:15', '2024-01-29 17:51:15', NULL),
(178, 40, 'public/project_sample/97_65b7bcc3e8df9.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(179, 40, 'public/project_sample/97_65b7bcc3eb66b.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(180, 40, 'public/project_sample/97_65b7bcc3ebe7a.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(181, 40, 'public/project_sample/97_65b7bcc3ec611.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(182, 40, 'public/project_sample/97_65b7bcc3eccf9.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(183, 40, 'public/project_sample/97_65b7bcc3ed385.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(184, 40, 'public/project_sample/97_65b7bcc3edb9f.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(185, 40, 'public/project_sample/97_65b7bcc3ee2e4.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(186, 40, 'public/project_sample/97_65b7bcc3eeb08.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(187, 40, 'public/project_sample/97_65b7bcc3ef260.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(188, 40, 'public/project_sample/97_65b7bcc3ef9ae.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(189, 40, 'public/project_sample/97_65b7bcc3f00b7.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(190, 40, 'public/project_sample/97_65b7bcc3f0816.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(191, 40, 'public/project_sample/97_65b7bcc3f10bb.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(192, 40, 'public/project_sample/97_65b7bcc3f17cc.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(193, 40, 'public/project_sample/97_65b7bcc3f1eaa.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(194, 40, 'public/project_sample/97_65b7bcc3f273f.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(195, 40, 'public/project_sample/97_65b7bcc3f2e72.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(196, 40, 'public/project_sample/97_65b7bcc3f3569.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(197, 40, 'public/project_sample/97_65b7bcc3f3cbe.jpeg', 1, '2024-01-29 20:27:07', '2024-01-29 20:27:07', NULL),
(198, 40, 'public/project_sample/97_65b7bcc40026f.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(199, 40, 'public/project_sample/97_65b7bcc400a5e.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(200, 40, 'public/project_sample/97_65b7bcc4011fc.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(201, 40, 'public/project_sample/97_65b7bcc40196a.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(202, 40, 'public/project_sample/97_65b7bcc40207f.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(203, 40, 'public/project_sample/97_65b7bcc40278f.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(204, 40, 'public/project_sample/97_65b7bcc402da5.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(205, 40, 'public/project_sample/97_65b7bcc403716.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(206, 40, 'public/project_sample/97_65b7bcc403d73.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(207, 40, 'public/project_sample/97_65b7bcc404591.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(208, 40, 'public/project_sample/97_65b7bcc404c34.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(209, 40, 'public/project_sample/97_65b7bcc4052f8.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(210, 40, 'public/project_sample/97_65b7bcc40592b.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(211, 40, 'public/project_sample/97_65b7bcc405fd3.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(212, 40, 'public/project_sample/97_65b7bcc4065e8.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(213, 40, 'public/project_sample/97_65b7bcc406c22.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(214, 40, 'public/project_sample/97_65b7bcc407264.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(215, 40, 'public/project_sample/97_65b7bcc4078f8.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(216, 40, 'public/project_sample/97_65b7bcc407fa6.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(217, 40, 'public/project_sample/97_65b7bcc4086f2.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(218, 40, 'public/project_sample/97_65b7bcc408d90.jpeg', 1, '2024-01-29 20:27:08', '2024-01-29 20:27:08', NULL),
(219, 41, 'public/project_sample/99_65b8d8fd43f11.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(220, 41, 'public/project_sample/99_65b8d8fd467ae.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(221, 41, 'public/project_sample/99_65b8d8fd49689.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(222, 41, 'public/project_sample/99_65b8d8fd4a042.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(223, 41, 'public/project_sample/99_65b8d8fd4b89b.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(224, 41, 'public/project_sample/99_65b8d8fd4c1b8.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(225, 41, 'public/project_sample/99_65b8d8fd4f20f.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(226, 41, 'public/project_sample/99_65b8d8fd4f956.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(227, 41, 'public/project_sample/99_65b8d8fd511af.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(228, 41, 'public/project_sample/99_65b8d8fd5474f.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(229, 41, 'public/project_sample/99_65b8d8fd54de9.jpeg', 1, '2024-01-30 16:39:49', '2024-01-30 16:39:49', NULL),
(230, 42, 'public/project_sample/101_65b8e8eb6aa2d.jpeg', 1, '2024-01-30 17:47:47', '2024-01-30 17:47:47', NULL),
(231, 42, 'public/project_sample/101_65b8e8eb700e1.jpeg', 1, '2024-01-30 17:47:47', '2024-01-30 17:47:47', NULL),
(232, 42, 'public/project_sample/101_65b8e8eb71f5f.jpeg', 1, '2024-01-30 17:47:47', '2024-01-30 17:47:47', NULL),
(233, 42, 'public/project_sample/101_65b8e8eb74e34.jpeg', 1, '2024-01-30 17:47:47', '2024-01-30 17:47:47', NULL),
(234, 42, 'public/project_sample/101_65b8e8eb76845.jpeg', 1, '2024-01-30 17:47:47', '2024-01-30 17:47:47', NULL),
(235, 42, 'public/project_sample/101_65b8e8eb78a61.jpeg', 1, '2024-01-30 17:47:47', '2024-01-30 17:47:47', NULL),
(236, 43, 'public/project_sample/102_65b9f52adcb6d.jpeg', 1, '2024-01-31 12:52:18', '2024-01-31 12:52:18', NULL),
(237, 43, 'public/project_sample/102_65b9f52ae0f44.jpeg', 1, '2024-01-31 12:52:18', '2024-01-31 12:52:18', NULL),
(238, 43, 'public/project_sample/102_65b9f52ae2ce2.jpeg', 1, '2024-01-31 12:52:18', '2024-01-31 12:52:18', NULL),
(239, 43, 'public/project_sample/102_65b9f52ae375e.jpeg', 1, '2024-01-31 12:52:18', '2024-01-31 12:52:18', NULL),
(240, 43, 'public/project_sample/102_65b9f52ae47cc.jpeg', 1, '2024-01-31 12:52:18', '2024-01-31 12:52:18', NULL),
(241, 43, 'public/project_sample/102_65b9f52ae5cb7.jpeg', 1, '2024-01-31 12:52:18', '2024-01-31 12:52:18', NULL),
(242, 44, 'public/project_sample/102_65b9f8d5024cb.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(243, 44, 'public/project_sample/102_65b9f8d506a21.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(244, 44, 'public/project_sample/102_65b9f8d50ade8.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(245, 44, 'public/project_sample/102_65b9f8d50d1e3.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(246, 44, 'public/project_sample/102_65b9f8d50f33f.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(247, 44, 'public/project_sample/102_65b9f8d510b10.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(248, 44, 'public/project_sample/102_65b9f8d513852.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(249, 44, 'public/project_sample/102_65b9f8d515828.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(250, 44, 'public/project_sample/102_65b9f8d517aab.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(251, 44, 'public/project_sample/102_65b9f8d519f3c.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(252, 44, 'public/project_sample/102_65b9f8d51a90b.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(253, 44, 'public/project_sample/102_65b9f8d51c922.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(254, 44, 'public/project_sample/102_65b9f8d51efa2.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(255, 44, 'public/project_sample/102_65b9f8d52117b.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(256, 44, 'public/project_sample/102_65b9f8d523448.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(257, 44, 'public/project_sample/102_65b9f8d525923.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(258, 44, 'public/project_sample/102_65b9f8d527ee0.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(259, 44, 'public/project_sample/102_65b9f8d52adbc.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(260, 44, 'public/project_sample/102_65b9f8d52ccdc.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(261, 44, 'public/project_sample/102_65b9f8d52f3bd.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(262, 44, 'public/project_sample/102_65b9f8d531eea.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(263, 44, 'public/project_sample/102_65b9f8d534043.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(264, 44, 'public/project_sample/102_65b9f8d536a83.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(265, 44, 'public/project_sample/102_65b9f8d538b3c.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(266, 44, 'public/project_sample/102_65b9f8d53b7c0.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(267, 44, 'public/project_sample/102_65b9f8d53c116.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(268, 44, 'public/project_sample/102_65b9f8d53e490.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(269, 44, 'public/project_sample/102_65b9f8d540cbc.jpeg', 1, '2024-01-31 13:07:57', '2024-01-31 13:07:57', NULL),
(270, 45, 'public/project_sample/108_65bd04b9e55a8.jpeg', 1, '2024-02-02 20:35:29', '2024-02-02 20:35:29', NULL),
(271, 45, 'public/project_sample/108_65bd04b9e818c.jpeg', 1, '2024-02-02 20:35:29', '2024-02-02 20:35:29', NULL),
(272, 45, 'public/project_sample/108_65bd04b9e9566.jpeg', 1, '2024-02-02 20:35:29', '2024-02-02 20:35:29', NULL),
(273, 45, 'public/project_sample/108_65bd04b9ea07a.jpeg', 1, '2024-02-02 20:35:29', '2024-02-02 20:35:29', NULL),
(274, 46, 'public/project_sample/108_65bd069ad6105.jpeg', 1, '2024-02-02 20:43:30', '2024-02-02 20:43:30', NULL),
(275, 46, 'public/project_sample/108_65bd069ada96b.jpeg', 1, '2024-02-02 20:43:30', '2024-02-02 20:43:30', NULL),
(276, 46, 'public/project_sample/108_65bd069adb5c4.jpeg', 1, '2024-02-02 20:43:30', '2024-02-02 20:43:30', NULL),
(277, 46, 'public/project_sample/108_65bd069adcafd.jpeg', 1, '2024-02-02 20:43:30', '2024-02-02 20:43:30', NULL),
(278, 46, 'public/project_sample/108_65bd069add7d8.jpeg', 1, '2024-02-02 20:43:30', '2024-02-02 20:43:30', NULL),
(279, 47, 'public/project_sample/110_65bdf119654dd.jpeg', 1, '2024-02-03 13:24:01', '2024-02-03 13:24:01', NULL),
(280, 47, 'public/project_sample/110_65bdf11967dcb.jpeg', 1, '2024-02-03 13:24:01', '2024-02-03 13:24:01', NULL),
(281, 47, 'public/project_sample/110_65bdf1196888b.jpeg', 1, '2024-02-03 13:24:01', '2024-02-03 13:24:01', NULL),
(282, 47, 'public/project_sample/110_65bdf11969072.jpeg', 1, '2024-02-03 13:24:01', '2024-02-03 13:24:01', NULL),
(283, 47, 'public/project_sample/110_65bdf1196992d.jpeg', 1, '2024-02-03 13:24:01', '2024-02-03 13:24:01', NULL),
(284, 48, 'public/project_sample/111_65c08f6ae3e2d.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(285, 48, 'public/project_sample/111_65c08f6ae6c59.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(286, 48, 'public/project_sample/111_65c08f6ae7638.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(287, 48, 'public/project_sample/111_65c08f6ae8023.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(288, 48, 'public/project_sample/111_65c08f6ae8c3a.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(289, 48, 'public/project_sample/111_65c08f6ae9580.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(290, 48, 'public/project_sample/111_65c08f6ae9fab.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(291, 48, 'public/project_sample/111_65c08f6aea9d1.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(292, 48, 'public/project_sample/111_65c08f6aeb35a.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(293, 48, 'public/project_sample/111_65c08f6aebe03.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(294, 48, 'public/project_sample/111_65c08f6aec560.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(295, 48, 'public/project_sample/111_65c08f6aed064.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(296, 48, 'public/project_sample/111_65c08f6aed93d.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(297, 48, 'public/project_sample/111_65c08f6aee26f.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(298, 48, 'public/project_sample/111_65c08f6aeebdd.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(299, 48, 'public/project_sample/111_65c08f6aef5eb.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(300, 48, 'public/project_sample/111_65c08f6aefe69.jpeg', 1, '2024-02-05 13:04:02', '2024-02-05 13:04:02', NULL),
(301, 49, 'public/project_sample/113_65c0f47faeb08.jpeg', 1, '2024-02-05 20:15:19', '2024-02-05 20:15:19', NULL),
(302, 49, 'public/project_sample/113_65c0f47fb132d.jpeg', 1, '2024-02-05 20:15:19', '2024-02-05 20:15:19', NULL),
(303, 49, 'public/project_sample/113_65c0f47fb1c91.jpeg', 1, '2024-02-05 20:15:19', '2024-02-05 20:15:19', NULL),
(304, 50, 'public/project_sample/114_65c0fc916816e.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(305, 50, 'public/project_sample/114_65c0fc916a66a.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(306, 50, 'public/project_sample/114_65c0fc916ae0c.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(307, 50, 'public/project_sample/114_65c0fc916b450.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(308, 50, 'public/project_sample/114_65c0fc916b9ca.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(309, 50, 'public/project_sample/114_65c0fc916c09d.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(310, 50, 'public/project_sample/114_65c0fc916c6e7.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(311, 50, 'public/project_sample/114_65c0fc916cdcf.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(312, 50, 'public/project_sample/114_65c0fc916d488.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(313, 50, 'public/project_sample/114_65c0fc916da49.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(314, 50, 'public/project_sample/114_65c0fc916df8d.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(315, 50, 'public/project_sample/114_65c0fc916e64b.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(316, 50, 'public/project_sample/114_65c0fc916ec3e.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(317, 50, 'public/project_sample/114_65c0fc916f22e.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(318, 50, 'public/project_sample/114_65c0fc916fa10.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(319, 50, 'public/project_sample/114_65c0fc9170001.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(320, 50, 'public/project_sample/114_65c0fc9170532.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(321, 50, 'public/project_sample/114_65c0fc9170b6a.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(322, 50, 'public/project_sample/114_65c0fc9171179.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(323, 50, 'public/project_sample/114_65c0fc9171723.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(324, 50, 'public/project_sample/114_65c0fc9171d37.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(325, 50, 'public/project_sample/114_65c0fc91723fe.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(326, 50, 'public/project_sample/114_65c0fc9172a73.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(327, 50, 'public/project_sample/114_65c0fc9173106.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(328, 50, 'public/project_sample/114_65c0fc917374f.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(329, 50, 'public/project_sample/114_65c0fc9173d3b.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(330, 50, 'public/project_sample/114_65c0fc9174357.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(331, 50, 'public/project_sample/114_65c0fc9174978.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(332, 50, 'public/project_sample/114_65c0fc917505b.jpeg', 1, '2024-02-05 20:49:45', '2024-02-05 20:49:45', NULL),
(333, 51, 'public/project_sample/116_65c12f2ccebf7.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(334, 51, 'public/project_sample/116_65c12f2cd10eb.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(335, 51, 'public/project_sample/116_65c12f2cd1821.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(336, 51, 'public/project_sample/116_65c12f2cd1f5f.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(337, 51, 'public/project_sample/116_65c12f2cd252f.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(338, 51, 'public/project_sample/116_65c12f2cd2b52.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(339, 51, 'public/project_sample/116_65c12f2cd31a4.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(340, 51, 'public/project_sample/116_65c12f2cd37b1.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(341, 51, 'public/project_sample/116_65c12f2cd3d92.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(342, 51, 'public/project_sample/116_65c12f2cd43fd.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(343, 51, 'public/project_sample/116_65c12f2cd4a5c.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(344, 51, 'public/project_sample/116_65c12f2cd5147.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(345, 51, 'public/project_sample/116_65c12f2cd5942.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(346, 51, 'public/project_sample/116_65c12f2cd601f.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(347, 51, 'public/project_sample/116_65c12f2cd6693.jpeg', 1, '2024-02-06 00:25:40', '2024-02-06 00:25:40', NULL),
(348, 52, 'public/project_sample/102_65c313cc99cd0.jpeg', 1, '2024-02-07 10:53:24', '2024-02-07 10:53:24', NULL),
(349, 52, 'public/project_sample/102_65c313cc9e34e.jpeg', 1, '2024-02-07 10:53:24', '2024-02-07 10:53:24', NULL),
(350, 52, 'public/project_sample/102_65c313cca0510.jpeg', 1, '2024-02-07 10:53:24', '2024-02-07 10:53:24', NULL),
(351, 52, 'public/project_sample/102_65c313cca2522.jpeg', 1, '2024-02-07 10:53:24', '2024-02-07 10:53:24', NULL),
(352, 52, 'public/project_sample/102_65c313cca4db0.jpeg', 1, '2024-02-07 10:53:24', '2024-02-07 10:53:24', NULL),
(353, 52, 'public/project_sample/102_65c313cca7809.jpeg', 1, '2024-02-07 10:53:24', '2024-02-07 10:53:24', NULL),
(354, 53, 'public/project_sample/137_65c33cd4c6260.jpeg', 1, '2024-02-07 13:48:28', '2024-02-07 13:48:28', NULL),
(355, 53, 'public/project_sample/137_65c33cd4c9029.jpeg', 1, '2024-02-07 13:48:28', '2024-02-07 13:48:28', NULL),
(356, 53, 'public/project_sample/137_65c33cd4c9a4c.jpeg', 1, '2024-02-07 13:48:28', '2024-02-07 13:48:28', NULL),
(357, 53, 'public/project_sample/137_65c33cd4cb609.jpeg', 1, '2024-02-07 13:48:28', '2024-02-07 13:48:28', NULL),
(358, 54, 'public/project_sample/138_65c33f8852950.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(359, 54, 'public/project_sample/138_65c33f88550da.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(360, 54, 'public/project_sample/138_65c33f88596c8.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(361, 54, 'public/project_sample/138_65c33f885a1fd.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(362, 54, 'public/project_sample/138_65c33f885d86b.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(363, 54, 'public/project_sample/138_65c33f885e538.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(364, 54, 'public/project_sample/138_65c33f885ed57.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(365, 54, 'public/project_sample/138_65c33f885f67e.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(366, 54, 'public/project_sample/138_65c33f885fd8a.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(367, 54, 'public/project_sample/138_65c33f8860abb.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(368, 54, 'public/project_sample/138_65c33f886135b.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(369, 54, 'public/project_sample/138_65c33f8861e9e.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(370, 54, 'public/project_sample/138_65c33f88627bb.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(371, 54, 'public/project_sample/138_65c33f88630b2.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(372, 54, 'public/project_sample/138_65c33f8863890.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(373, 54, 'public/project_sample/138_65c33f88640ad.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(374, 54, 'public/project_sample/138_65c33f88647d5.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(375, 54, 'public/project_sample/138_65c33f8864fab.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(376, 54, 'public/project_sample/138_65c33f8865650.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(377, 54, 'public/project_sample/138_65c33f8865e7c.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(378, 54, 'public/project_sample/138_65c33f8866515.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(379, 54, 'public/project_sample/138_65c33f8866bcf.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(380, 54, 'public/project_sample/138_65c33f88675b3.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(381, 54, 'public/project_sample/138_65c33f8867d57.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(382, 54, 'public/project_sample/138_65c33f8868495.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(383, 54, 'public/project_sample/138_65c33f8868b8b.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(384, 54, 'public/project_sample/138_65c33f886937c.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(385, 54, 'public/project_sample/138_65c33f8869a14.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(386, 54, 'public/project_sample/138_65c33f886a072.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(387, 54, 'public/project_sample/138_65c33f886a81f.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(388, 54, 'public/project_sample/138_65c33f886dfdf.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(389, 54, 'public/project_sample/138_65c33f886e9d4.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(390, 54, 'public/project_sample/138_65c33f886f492.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(391, 54, 'public/project_sample/138_65c33f886fbe8.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(392, 54, 'public/project_sample/138_65c33f8870298.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(393, 54, 'public/project_sample/138_65c33f887087c.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL),
(394, 54, 'public/project_sample/138_65c33f8870efc.jpeg', 1, '2024-02-07 14:00:00', '2024-02-07 14:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_property_types`
--

CREATE TABLE `user_property_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_type_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_property_types`
--

INSERT INTO `user_property_types` (`id`, `user_id`, `property_type_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 6, 1, 1, '2024-01-06 11:23:09', '2024-01-06 11:23:09', NULL),
(8, 6, 2, 1, '2024-01-06 11:23:09', '2024-01-06 11:23:09', NULL),
(9, 6, 3, 1, '2024-01-06 11:23:09', '2024-01-06 11:23:09', NULL),
(10, 9, 1, 1, '2024-01-10 11:22:55', '2024-01-10 11:22:55', NULL),
(38, 19, 1, 1, '2024-01-18 09:52:08', '2024-01-18 09:52:08', NULL),
(39, 19, 2, 1, '2024-01-18 09:52:08', '2024-01-18 09:52:08', NULL),
(40, 25, 1, 1, '2024-01-18 10:28:18', '2024-01-18 10:28:18', NULL),
(41, 11, 1, 1, '2024-01-18 10:52:58', '2024-01-18 10:52:58', NULL),
(47, 34, 1, 1, '2024-01-20 14:43:01', '2024-01-20 14:43:01', NULL),
(48, 34, 2, 1, '2024-01-20 14:43:01', '2024-01-20 14:43:01', NULL),
(49, 34, 3, 1, '2024-01-20 14:43:01', '2024-01-20 14:43:01', NULL),
(67, 22, 1, 1, '2024-01-22 16:06:55', '2024-01-22 16:06:55', NULL),
(68, 22, 2, 1, '2024-01-22 16:06:55', '2024-01-22 16:06:55', NULL),
(69, 22, 3, 1, '2024-01-22 16:06:55', '2024-01-22 16:06:55', NULL),
(73, 40, 1, 1, '2024-01-22 18:55:10', '2024-01-22 18:55:10', NULL),
(74, 40, 2, 1, '2024-01-22 18:55:10', '2024-01-22 18:55:10', NULL),
(75, 41, 1, 1, '2024-01-22 19:01:15', '2024-01-22 19:01:15', NULL),
(76, 41, 2, 1, '2024-01-22 19:01:15', '2024-01-22 19:01:15', NULL),
(77, 43, 1, 1, '2024-01-22 20:04:31', '2024-01-22 20:04:31', NULL),
(78, 43, 2, 1, '2024-01-22 20:04:31', '2024-01-22 20:04:31', NULL),
(82, 46, 1, 1, '2024-01-22 21:53:37', '2024-01-22 21:53:37', NULL),
(83, 46, 2, 1, '2024-01-22 21:53:37', '2024-01-22 21:53:37', NULL),
(84, 46, 3, 1, '2024-01-22 21:53:37', '2024-01-22 21:53:37', NULL),
(85, 47, 1, 1, '2024-01-22 22:29:46', '2024-01-22 22:29:46', NULL),
(88, 49, 1, 1, '2024-01-23 10:32:13', '2024-01-23 10:32:13', NULL),
(89, 49, 2, 1, '2024-01-23 10:32:13', '2024-01-23 10:32:13', NULL),
(90, 49, 3, 1, '2024-01-23 10:32:13', '2024-01-23 10:32:13', NULL),
(109, 51, 1, 1, '2024-01-23 15:58:17', '2024-01-23 15:58:17', NULL),
(110, 51, 2, 1, '2024-01-23 15:58:17', '2024-01-23 15:58:17', NULL),
(111, 51, 3, 1, '2024-01-23 15:58:17', '2024-01-23 15:58:17', NULL),
(112, 54, 1, 1, '2024-01-23 16:57:36', '2024-01-23 16:57:36', NULL),
(113, 54, 3, 1, '2024-01-23 16:57:36', '2024-01-23 16:57:36', NULL),
(114, 54, 2, 1, '2024-01-23 16:57:36', '2024-01-23 16:57:36', NULL),
(116, 58, 1, 1, '2024-01-23 23:51:19', '2024-01-23 23:51:19', NULL),
(117, 58, 2, 1, '2024-01-23 23:51:19', '2024-01-23 23:51:19', NULL),
(121, 55, 1, 1, '2024-01-24 16:35:55', '2024-01-24 16:35:55', NULL),
(122, 48, 1, 1, '2024-01-24 16:43:01', '2024-01-24 16:43:01', NULL),
(123, 48, 2, 1, '2024-01-24 16:43:01', '2024-01-24 16:43:01', NULL),
(125, 57, 1, 1, '2024-01-24 17:00:09', '2024-01-24 17:00:09', NULL),
(126, 61, 1, 1, '2024-01-24 20:07:32', '2024-01-24 20:07:32', NULL),
(127, 61, 2, 1, '2024-01-24 20:07:32', '2024-01-24 20:07:32', NULL),
(128, 63, 1, 1, '2024-01-24 20:50:26', '2024-01-24 20:50:26', NULL),
(129, 63, 2, 1, '2024-01-24 20:50:26', '2024-01-24 20:50:26', NULL),
(130, 63, 3, 1, '2024-01-24 20:50:26', '2024-01-24 20:50:26', NULL),
(131, 64, 1, 1, '2024-01-24 22:38:45', '2024-01-24 22:38:45', NULL),
(132, 64, 2, 1, '2024-01-24 22:38:45', '2024-01-24 22:38:45', NULL),
(133, 64, 3, 1, '2024-01-24 22:38:45', '2024-01-24 22:38:45', NULL),
(134, 65, 1, 1, '2024-01-25 08:15:24', '2024-01-25 08:15:24', NULL),
(135, 66, 3, 1, '2024-01-25 13:40:51', '2024-01-25 13:40:51', NULL),
(150, 67, 2, 1, '2024-01-25 17:09:20', '2024-01-25 17:09:20', NULL),
(151, 67, 3, 1, '2024-01-25 17:09:20', '2024-01-25 17:09:20', NULL),
(152, 67, 1, 1, '2024-01-25 17:09:20', '2024-01-25 17:09:20', NULL),
(158, 68, 3, 1, '2024-01-25 17:27:18', '2024-01-25 17:27:18', NULL),
(159, 68, 2, 1, '2024-01-25 17:27:18', '2024-01-25 17:27:18', NULL),
(160, 68, 1, 1, '2024-01-25 17:27:18', '2024-01-25 17:27:18', NULL),
(161, 70, 1, 1, '2024-01-25 19:10:55', '2024-01-25 19:10:55', NULL),
(162, 71, 3, 1, '2024-01-25 22:38:30', '2024-01-25 22:38:30', NULL),
(163, 71, 2, 1, '2024-01-25 22:38:30', '2024-01-25 22:38:30', NULL),
(164, 71, 1, 1, '2024-01-25 22:38:30', '2024-01-25 22:38:30', NULL),
(167, 45, 1, 1, '2024-01-26 11:29:48', '2024-01-26 11:29:48', NULL),
(168, 45, 2, 1, '2024-01-26 11:29:48', '2024-01-26 11:29:48', NULL),
(169, 45, 3, 1, '2024-01-26 11:29:48', '2024-01-26 11:29:48', NULL),
(170, 73, 1, 1, '2024-01-26 14:10:55', '2024-01-26 14:10:55', NULL),
(171, 73, 2, 1, '2024-01-26 14:10:55', '2024-01-26 14:10:55', NULL),
(172, 73, 3, 1, '2024-01-26 14:10:55', '2024-01-26 14:10:55', NULL),
(173, 85, 2, 1, '2024-01-28 15:44:21', '2024-01-28 15:44:21', NULL),
(174, 88, 1, 1, '2024-01-28 18:07:57', '2024-01-28 18:07:57', NULL),
(175, 88, 2, 1, '2024-01-28 18:07:57', '2024-01-28 18:07:57', NULL),
(176, 88, 3, 1, '2024-01-28 18:07:57', '2024-01-28 18:07:57', NULL),
(179, 94, 1, 1, '2024-01-29 18:11:37', '2024-01-29 18:11:37', NULL),
(180, 94, 2, 1, '2024-01-29 18:11:37', '2024-01-29 18:11:37', NULL),
(181, 95, 1, 1, '2024-01-29 18:25:20', '2024-01-29 18:25:20', NULL),
(182, 99, 1, 1, '2024-01-30 16:36:34', '2024-01-30 16:36:34', NULL),
(183, 100, 1, 1, '2024-01-30 17:16:44', '2024-01-30 17:16:44', NULL),
(184, 100, 2, 1, '2024-01-30 17:16:44', '2024-01-30 17:16:44', NULL),
(185, 100, 3, 1, '2024-01-30 17:16:44', '2024-01-30 17:16:44', NULL),
(186, 101, 1, 1, '2024-01-30 17:44:01', '2024-01-30 17:44:01', NULL),
(187, 101, 3, 1, '2024-01-30 17:44:01', '2024-01-30 17:44:01', NULL),
(188, 101, 2, 1, '2024-01-30 17:44:01', '2024-01-30 17:44:01', NULL),
(198, 102, 1, 1, '2024-01-31 12:44:13', '2024-01-31 12:44:13', NULL),
(199, 102, 2, 1, '2024-01-31 12:44:13', '2024-01-31 12:44:13', NULL),
(200, 102, 3, 1, '2024-01-31 12:44:13', '2024-01-31 12:44:13', NULL),
(201, 35, 2, 1, '2024-01-31 17:29:42', '2024-01-31 17:29:42', NULL),
(202, 106, 3, 1, '2024-02-01 14:51:43', '2024-02-01 14:51:43', NULL),
(203, 72, 1, 1, '2024-02-01 18:51:32', '2024-02-01 18:51:32', NULL),
(204, 72, 2, 1, '2024-02-01 18:51:32', '2024-02-01 18:51:32', NULL),
(205, 72, 3, 1, '2024-02-01 18:51:32', '2024-02-01 18:51:32', NULL),
(206, 108, 1, 1, '2024-02-02 20:18:37', '2024-02-02 20:18:37', NULL),
(207, 108, 2, 1, '2024-02-02 20:18:37', '2024-02-02 20:18:37', NULL),
(208, 108, 3, 1, '2024-02-02 20:18:37', '2024-02-02 20:18:37', NULL),
(212, 32, 1, 1, '2024-02-03 14:14:32', '2024-02-03 14:14:32', NULL),
(213, 32, 2, 1, '2024-02-03 14:14:32', '2024-02-03 14:14:32', NULL),
(214, 32, 3, 1, '2024-02-03 14:14:32', '2024-02-03 14:14:32', NULL),
(215, 112, 1, 1, '2024-02-05 17:12:01', '2024-02-05 17:12:01', NULL),
(216, 112, 2, 1, '2024-02-05 17:12:01', '2024-02-05 17:12:01', NULL),
(217, 112, 3, 1, '2024-02-05 17:12:01', '2024-02-05 17:12:01', NULL),
(221, 113, 1, 1, '2024-02-06 01:13:50', '2024-02-06 01:13:50', NULL),
(222, 113, 2, 1, '2024-02-06 01:13:50', '2024-02-06 01:13:50', NULL),
(223, 113, 3, 1, '2024-02-06 01:13:50', '2024-02-06 01:13:50', NULL),
(224, 122, 1, 1, '2024-02-06 08:37:13', '2024-02-06 08:37:13', NULL),
(225, 122, 2, 1, '2024-02-06 08:37:13', '2024-02-06 08:37:13', NULL),
(226, 124, 1, 1, '2024-02-06 08:40:10', '2024-02-06 08:40:10', NULL),
(227, 124, 2, 1, '2024-02-06 08:40:10', '2024-02-06 08:40:10', NULL),
(228, 126, 1, 1, '2024-02-06 08:45:20', '2024-02-06 08:45:20', NULL),
(229, 126, 2, 1, '2024-02-06 08:45:20', '2024-02-06 08:45:20', NULL),
(230, 127, 1, 1, '2024-02-06 08:50:05', '2024-02-06 08:50:05', NULL),
(231, 127, 2, 1, '2024-02-06 08:50:05', '2024-02-06 08:50:05', NULL),
(232, 129, 2, 1, '2024-02-06 10:31:10', '2024-02-06 10:31:10', NULL),
(233, 129, 1, 1, '2024-02-06 10:31:10', '2024-02-06 10:31:10', NULL),
(234, 129, 3, 1, '2024-02-06 10:31:10', '2024-02-06 10:31:10', NULL),
(235, 131, 1, 1, '2024-02-06 12:13:13', '2024-02-06 12:13:13', NULL),
(236, 134, 2, 1, '2024-02-07 13:11:52', '2024-02-07 13:11:52', NULL),
(237, 139, 2, 1, '2024-02-07 17:10:44', '2024-02-07 17:10:44', NULL),
(238, 139, 1, 1, '2024-02-07 17:10:44', '2024-02-07 17:10:44', NULL),
(239, 139, 3, 1, '2024-02-07 17:10:44', '2024-02-07 17:10:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_work_types`
--

CREATE TABLE `user_work_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `work_type_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_work_types`
--

INSERT INTO `user_work_types` (`id`, `user_id`, `work_type_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 2, 1, '2023-11-21 12:44:12', '2023-11-29 10:07:44', NULL),
(2, 5, 3, 1, '2023-11-21 13:01:03', '2023-11-21 13:01:03', NULL),
(3, 6, 3, 1, '2023-11-21 13:04:39', '2024-01-06 11:23:09', NULL),
(4, 8, 1, 1, '2023-11-22 06:56:00', '2023-11-23 10:40:26', NULL),
(5, 9, 2, 1, '2023-11-22 06:57:02', '2024-01-10 11:22:55', NULL),
(19, 10, 2, 1, '2023-11-22 07:00:49', '2024-01-13 06:01:25', NULL),
(20, 11, 6, 1, '2023-11-22 07:14:36', '2024-01-18 10:52:58', NULL),
(21, 12, 1, 1, '2023-11-22 10:23:41', '2023-11-22 10:23:41', NULL),
(22, 13, 2, 1, '2023-11-22 10:33:08', '2024-01-02 06:11:04', NULL),
(23, 14, 1, 1, '2023-11-22 10:33:52', '2023-12-28 11:02:03', NULL),
(24, 15, 4, 1, '2023-11-22 10:34:38', '2023-12-12 10:59:31', NULL),
(25, 16, 1, 1, '2023-11-22 10:36:59', '2023-12-12 11:02:02', NULL),
(26, 17, 4, 1, '2023-11-22 10:37:46', '2023-12-12 10:23:12', NULL),
(27, 18, 5, 1, '2023-11-22 10:38:36', '2023-12-11 07:40:09', NULL),
(28, 19, 2, 1, '2023-11-22 10:39:20', '2024-01-18 09:52:08', NULL),
(29, 20, 2, 1, '2023-11-22 10:39:59', '2024-01-19 16:31:52', NULL),
(30, 21, 1, 1, '2023-11-22 10:40:57', '2023-12-11 07:00:52', NULL),
(31, 22, 3, 1, '2023-11-22 10:42:04', '2024-01-22 16:06:55', NULL),
(32, 23, 1, 1, '2023-11-22 10:42:44', '2023-12-09 11:24:40', NULL),
(33, 24, 2, 1, '2023-11-22 10:43:19', '2024-01-03 10:10:20', NULL),
(34, 32, 6, 1, '2023-11-23 10:02:29', '2024-02-03 14:14:27', NULL),
(35, 34, 12, 1, '2023-11-23 10:07:07', '2024-01-20 14:43:01', NULL),
(36, 39, 4, 1, '2023-11-23 11:56:12', '2023-11-23 12:09:59', NULL),
(37, 40, 4, 1, '2023-11-23 12:12:48', '2024-01-22 18:48:28', NULL),
(38, 2, 1, 1, '2023-11-23 12:12:48', '2023-11-23 12:14:40', NULL),
(39, 41, 3, 1, '2023-11-24 05:20:45', '2024-01-22 19:01:15', NULL),
(40, 43, 2, 1, '2023-11-24 09:40:30', '2024-01-22 20:04:31', NULL),
(41, 44, 5, 1, '2023-11-24 11:24:37', '2023-11-27 09:24:52', NULL),
(42, 45, 2, 1, '2023-11-24 17:43:09', '2024-01-22 21:49:34', NULL),
(43, 49, 2, 1, '2023-11-24 19:06:48', '2024-01-23 10:32:13', NULL),
(44, 50, 3, 1, '2023-11-24 19:11:55', '2023-11-24 19:11:55', NULL),
(45, 54, 6, 1, '2023-11-27 07:17:03', '2024-01-23 16:57:36', NULL),
(46, 55, 6, 1, '2023-11-27 07:30:12', '2024-01-24 16:35:53', NULL),
(47, 59, 3, 1, '2023-11-28 06:24:19', '2024-01-24 00:53:31', NULL),
(48, 60, 6, 1, '2023-11-28 11:52:09', '2023-11-28 11:52:09', NULL),
(49, 68, 4, 1, '2023-11-23 12:12:48', '2024-01-25 17:21:35', NULL),
(50, 72, 3, 1, '2023-12-01 13:34:03', '2024-01-26 09:36:18', NULL),
(51, 73, 2, 1, '2023-12-04 07:07:10', '2024-01-26 14:10:55', NULL),
(52, 74, 2, 1, '2023-12-04 08:19:56', '2023-12-04 08:19:56', NULL),
(53, 75, 1, 1, '2023-12-05 13:22:54', '2023-12-05 13:22:54', NULL),
(54, 76, 4, 1, '2023-12-06 07:26:51', '2023-12-06 07:26:51', NULL),
(55, 85, 5, 1, '2023-12-13 09:33:54', '2024-01-28 15:44:21', NULL),
(56, 86, 4, 1, '2023-12-13 09:52:30', '2024-01-28 17:23:11', NULL),
(57, 87, 6, 1, '2023-12-14 08:23:58', '2023-12-14 08:23:58', NULL),
(58, 90, 1, 1, '2023-12-14 08:50:28', '2023-12-14 08:50:28', NULL),
(59, 96, 2, 1, '2023-12-14 14:35:59', '2024-01-29 19:27:39', NULL),
(60, 99, 5, 1, '2023-12-14 16:03:16', '2024-01-30 16:36:34', NULL),
(61, 100, 12, 1, '2023-12-16 07:00:20', '2024-01-30 17:16:44', NULL),
(62, 107, 1, 1, '2023-12-22 16:42:08', '2023-12-22 16:42:08', NULL),
(63, 108, 3, 1, '2023-12-26 06:14:14', '2024-02-02 20:18:37', NULL),
(64, 111, 8, 1, '2023-12-27 10:34:03', '2023-12-27 10:34:03', NULL),
(65, 112, 2, 1, '2023-12-28 06:41:40', '2024-02-05 17:12:01', NULL),
(66, 106, 12, 1, '2023-12-28 06:41:40', '2024-02-01 14:51:43', NULL),
(67, 116, 2, 1, '2024-01-03 07:42:43', '2024-01-03 07:42:43', NULL),
(68, 25, 3, 1, '2024-01-18 10:28:18', '2024-01-18 10:28:18', NULL),
(69, 35, 5, 1, '2024-01-20 17:56:48', '2024-01-31 17:29:42', NULL),
(70, 46, 2, 1, '2024-01-22 21:53:37', '2024-01-22 21:53:37', NULL),
(71, 47, 12, 1, '2024-01-22 22:29:46', '2024-01-22 22:29:46', NULL),
(72, 48, 2, 1, '2024-01-23 10:28:20', '2024-01-24 16:43:01', NULL),
(73, 51, 2, 1, '2024-01-23 14:17:23', '2024-01-23 14:17:23', NULL),
(74, 58, 4, 1, '2024-01-23 23:51:19', '2024-01-23 23:51:19', NULL),
(75, 57, 2, 1, '2024-01-24 17:00:08', '2024-01-24 17:00:08', NULL),
(76, 61, 2, 1, '2024-01-24 20:07:32', '2024-01-24 20:07:32', NULL),
(77, 63, 3, 1, '2024-01-24 20:50:26', '2024-01-24 20:50:26', NULL),
(78, 64, 6, 1, '2024-01-24 22:38:45', '2024-01-24 22:38:45', NULL),
(79, 65, 6, 1, '2024-01-25 08:15:24', '2024-01-25 08:15:24', NULL),
(80, 66, 3, 1, '2024-01-25 13:40:51', '2024-01-25 13:40:51', NULL),
(81, 67, 4, 1, '2024-01-25 16:57:36', '2024-01-25 17:09:20', NULL),
(82, 69, 2, 1, '2024-01-25 18:47:17', '2024-01-25 18:47:59', NULL),
(83, 70, 2, 1, '2024-01-25 19:10:55', '2024-01-25 19:11:01', NULL),
(84, 71, 2, 1, '2024-01-25 22:38:30', '2024-01-25 22:38:30', NULL),
(85, 79, 9, 1, '2024-01-27 20:18:49', '2024-01-27 20:18:49', NULL),
(86, 80, 3, 1, '2024-01-27 20:33:16', '2024-01-27 20:33:16', NULL),
(87, 83, 6, 1, '2024-01-28 11:48:51', '2024-01-28 11:48:51', NULL),
(88, 88, 3, 1, '2024-01-28 18:07:57', '2024-01-28 18:07:57', NULL),
(89, 94, 3, 1, '2024-01-29 17:49:40', '2024-01-29 17:49:40', NULL),
(90, 95, 6, 1, '2024-01-29 18:25:20', '2024-01-29 18:25:20', NULL),
(91, 101, 2, 1, '2024-01-30 17:44:01', '2024-01-30 17:44:01', NULL),
(92, 102, 5, 1, '2024-01-31 12:44:13', '2024-01-31 12:44:13', NULL),
(93, 103, 2, 1, '2024-01-31 17:12:28', '2024-01-31 17:12:28', NULL),
(94, 104, 2, 1, '2024-01-31 17:19:29', '2024-01-31 17:19:29', NULL),
(95, 113, 6, 1, '2024-02-05 20:02:24', '2024-02-05 20:02:24', NULL),
(96, 117, 12, 1, '2024-02-06 08:29:24', '2024-02-06 08:29:24', NULL),
(97, 118, 12, 1, '2024-02-06 08:31:46', '2024-02-06 08:31:46', NULL),
(98, 119, 12, 1, '2024-02-06 08:35:03', '2024-02-06 08:35:03', NULL),
(99, 120, 2, 1, '2024-02-06 08:37:08', '2024-02-06 21:34:27', NULL),
(100, 122, 12, 1, '2024-02-06 08:37:13', '2024-02-06 08:37:13', NULL),
(101, 121, 12, 1, '2024-02-06 08:37:16', '2024-02-06 08:37:16', NULL),
(102, 123, 6, 1, '2024-02-06 08:39:35', '2024-02-06 08:39:35', NULL),
(103, 124, 12, 1, '2024-02-06 08:40:10', '2024-02-06 08:40:10', NULL),
(104, 125, 12, 1, '2024-02-06 08:43:49', '2024-02-06 08:43:49', NULL),
(105, 126, 12, 1, '2024-02-06 08:45:20', '2024-02-06 08:45:20', NULL),
(106, 127, 12, 1, '2024-02-06 08:50:05', '2024-02-06 08:50:05', NULL),
(107, 128, 12, 1, '2024-02-06 08:51:11', '2024-02-06 08:51:11', NULL),
(108, 129, 2, 1, '2024-02-06 10:31:10', '2024-02-06 10:31:10', NULL),
(109, 130, 5, 1, '2024-02-06 11:53:44', '2024-02-06 11:53:44', NULL),
(110, 131, 2, 1, '2024-02-06 12:13:13', '2024-02-06 12:13:13', NULL),
(111, 133, 4, 1, '2024-02-06 17:02:48', '2024-02-06 17:02:48', NULL),
(112, 134, 6, 1, '2024-02-07 13:11:52', '2024-02-07 13:11:52', NULL),
(113, 139, 2, 1, '2024-02-07 17:10:44', '2024-02-07 17:10:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verification_remarks`
--

CREATE TABLE `verification_remarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `onboard_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `spoken_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_minute` int(11) DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verification_remarks`
--

INSERT INTO `verification_remarks` (`id`, `onboard_step_id`, `user_id`, `spoken_name`, `meeting_minute`, `remark`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 32, 'Chandana', 1, 'Verified', '2024-01-24 14:21:19', '2024-01-24 14:21:19', NULL),
(2, 2, 32, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:21:40', '2024-01-24 14:21:40', NULL),
(3, 3, 32, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:24:34', '2024-01-24 14:24:34', NULL),
(4, 4, 32, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:24:53', '2024-01-24 14:24:53', NULL),
(5, 5, 32, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:25:01', '2024-01-24 14:25:01', NULL),
(6, 6, 32, 'Chandana', 1, 'Good', '2024-01-24 14:25:49', '2024-01-24 14:25:49', NULL),
(7, 7, 32, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:26:00', '2024-01-24 14:26:00', NULL),
(8, 1, 51, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:26:27', '2024-01-24 14:26:27', NULL),
(9, 2, 51, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:26:35', '2024-01-24 14:26:35', NULL),
(10, 3, 51, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:26:49', '2024-01-24 14:26:49', NULL),
(11, 4, 51, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:26:59', '2024-01-24 14:26:59', NULL),
(12, 5, 51, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:27:10', '2024-01-24 14:27:10', NULL),
(13, 6, 51, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:27:21', '2024-01-24 14:27:21', NULL),
(14, 7, 51, 'Chandana', 1, 'Elemantra Verified', '2024-01-24 14:27:31', '2024-01-24 14:27:31', NULL),
(15, 1, 53, 'Chandana', 1, 'elemantra verified', '2024-01-25 15:11:04', '2024-01-25 15:11:04', NULL),
(16, 2, 53, 'Chandana', 1, 'elemantra verified', '2024-01-25 15:11:14', '2024-01-25 15:11:14', NULL),
(17, 3, 53, 'Chandana', 1, 'elemantra verified', '2024-01-25 15:11:24', '2024-01-25 15:11:24', NULL),
(18, 4, 53, 'Chandana', 1, 'elemantra verified', '2024-01-25 15:11:36', '2024-01-25 15:11:36', NULL),
(19, 5, 53, 'Chandana', 1, 'elemantra verified', '2024-01-25 15:11:47', '2024-01-25 15:11:47', NULL),
(20, 6, 53, 'Chandana', 1, 'elemantra verified', '2024-01-25 15:11:56', '2024-01-25 15:11:56', NULL),
(21, 7, 53, 'Chandana', 1, 'elemantra verified', '2024-01-25 15:12:07', '2024-01-25 15:12:07', NULL),
(22, 1, 94, 'test', 20, 'vghhghjkj', '2024-02-01 11:24:12', '2024-02-01 11:24:12', NULL),
(23, 2, 94, 'test', 84, 'hjkhtrt', '2024-02-01 11:28:31', '2024-02-01 11:28:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work_professions`
--

CREATE TABLE `work_professions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profession` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'store name in snake case',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_types`
--

CREATE TABLE `work_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-in_active, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_types`
--

INSERT INTO `work_types` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Civil Work', 1, '2023-11-21 06:44:34', '2024-01-03 01:05:56', '2024-01-03 01:05:56'),
(2, 'Electric work', 1, '2023-11-21 06:44:51', '2024-01-19 14:41:04', NULL),
(3, 'POP/ False Ceiling work', 1, '2023-11-21 06:45:01', '2024-01-19 14:40:12', NULL),
(4, 'Painting work', 1, '2023-11-21 06:45:24', '2024-01-19 14:39:55', NULL),
(5, 'Plumbing work', 1, '2023-11-21 06:45:33', '2024-01-19 14:39:44', NULL),
(6, 'Carpentry work', 1, '2023-11-21 06:47:44', '2024-01-19 14:39:10', NULL),
(8, 'civil work', 1, '2023-12-19 04:37:51', '2024-01-03 01:07:34', '2024-01-03 01:07:34'),
(9, 'Fabrication work', 1, '2023-12-19 05:53:15', '2024-01-19 14:39:01', NULL),
(10, 'Modular work', 1, '2023-12-19 05:53:24', '2024-01-19 14:39:21', NULL),
(11, 'Civil', 1, '2024-01-03 01:26:19', '2024-01-03 02:25:59', '2024-01-03 02:25:59'),
(12, 'Civil work', 1, '2024-01-03 05:26:48', '2024-01-19 14:39:30', NULL),
(13, 'Civil Work', 1, '2024-01-03 05:52:02', '2024-01-03 05:52:11', '2024-01-03 05:52:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area_of_works`
--
ALTER TABLE `area_of_works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_ranges`
--
ALTER TABLE `budget_ranges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elemantra_notifications`
--
ALTER TABLE `elemantra_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elemantra_notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `help_supports`
--
ALTER TABLE `help_supports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `help_supports_user_id_foreign` (`user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_work_type_id_foreign` (`work_type_id`);

--
-- Indexes for table `item_brand_specifications`
--
ALTER TABLE `item_brand_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_brand_specifications_item_id_foreign` (`item_id`),
  ADD KEY `item_brand_specifications_item_category_id_foreign` (`item_category_id`),
  ADD KEY `item_brand_specifications_item_detail_id_foreign` (`item_detail_id`),
  ADD KEY `item_brand_specifications_unit_id_foreign` (`unit_id`),
  ADD KEY `item_brand_specifications_work_type_id_foreign` (`work_type_id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_categories_item_id_foreign` (`item_id`),
  ADD KEY `item_categories_work_type_id_foreign` (`work_type_id`);

--
-- Indexes for table `item_details`
--
ALTER TABLE `item_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_details_item_id_foreign` (`item_id`),
  ADD KEY `item_details_item_category_id_foreign` (`item_category_id`),
  ADD KEY `item_details_work_type_id_foreign` (`work_type_id`);

--
-- Indexes for table `labour_work_descriptions`
--
ALTER TABLE `labour_work_descriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `labour_work_descriptions_work_type_id_foreign` (`work_type_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onboard_steps`
--
ALTER TABLE `onboard_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `project_addresses`
--
ALTER TABLE `project_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_addresses_project_type_project_id_index` (`project_type`,`project_id`),
  ADD KEY `project_addresses_project_type_id_foreign` (`project_type_id`);

--
-- Indexes for table `project_individual_contractors`
--
ALTER TABLE `project_individual_contractors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_individual_contractors_user_id_foreign` (`user_id`),
  ADD KEY `project_individual_contractors_project_type_id_foreign` (`project_type_id`),
  ADD KEY `project_individual_contractors_property_type_id_foreign` (`property_type_id`),
  ADD KEY `project_individual_contractors_budget_range_id_foreign` (`budget_range_id`);

--
-- Indexes for table `project_labour_applications`
--
ALTER TABLE `project_labour_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_labour_applications_project_labour_contractor_id_foreign` (`project_labour_contractor_id`),
  ADD KEY `project_labour_applications_user_id_foreign` (`user_id`),
  ADD KEY `project_labour_applications_role_id_foreign` (`role_id`);

--
-- Indexes for table `project_labour_contractors`
--
ALTER TABLE `project_labour_contractors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_labour_contractors_user_id_foreign` (`user_id`),
  ADD KEY `project_labour_contractors_project_type_id_foreign` (`project_type_id`),
  ADD KEY `project_labour_contractors_work_type_id_foreign` (`work_type_id`),
  ADD KEY `project_labour_contractors_assigned_user_id_foreign` (`assigned_user_id`);

--
-- Indexes for table `project_turnkey_contractors`
--
ALTER TABLE `project_turnkey_contractors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_turnkey_contractors_user_id_foreign` (`user_id`),
  ADD KEY `project_turnkey_contractors_project_type_id_foreign` (`project_type_id`),
  ADD KEY `project_turnkey_contractors_property_type_id_foreign` (`property_type_id`),
  ADD KEY `project_turnkey_contractors_budget_range_id_foreign` (`budget_range_id`),
  ADD KEY `project_turnkey_contractors_assigned_user_id_foreign` (`assigned_user_id`);

--
-- Indexes for table `project_types`
--
ALTER TABLE `project_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_work_requests`
--
ALTER TABLE `project_work_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_work_requests_project_work_type_id_foreign` (`project_work_type_id`),
  ADD KEY `project_work_requests_project_type_project_id_index` (`project_type`,`project_id`),
  ADD KEY `project_work_requests_project_type_id_foreign` (`project_type_id`),
  ADD KEY `project_work_requests_area_of_work_id_foreign` (`area_of_work_id`),
  ADD KEY `project_work_requests_item_id_foreign` (`item_id`),
  ADD KEY `project_work_requests_item_category_id_foreign` (`item_category_id`),
  ADD KEY `project_work_requests_item_detail_id_foreign` (`item_detail_id`),
  ADD KEY `project_work_requests_item_brand_specification_id_foreign` (`item_brand_specification_id`),
  ADD KEY `project_work_requests_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `project_work_request_applications`
--
ALTER TABLE `project_work_request_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pwra_pwta_id_foreign` (`project_work_type_application_id`),
  ADD KEY `pwra_pwri_id_foreign` (`project_work_request_id`),
  ADD KEY `project_work_request_applications_user_id_foreign` (`user_id`),
  ADD KEY `project_work_request_applications_project_type_project_id_index` (`project_type`,`project_id`);

--
-- Indexes for table `project_work_request_images`
--
ALTER TABLE `project_work_request_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_work_request_images_project_work_request_id_foreign` (`project_work_request_id`);

--
-- Indexes for table `project_work_types`
--
ALTER TABLE `project_work_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_work_types_project_type_project_id_index` (`project_type`,`project_id`),
  ADD KEY `project_work_types_project_type_id_foreign` (`project_type_id`),
  ADD KEY `project_work_types_work_type_id_foreign` (`work_type_id`),
  ADD KEY `project_work_types_assigned_user_id_foreign` (`assigned_user_id`);

--
-- Indexes for table `project_work_type_applications`
--
ALTER TABLE `project_work_type_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_work_type_applications_project_work_type_id_foreign` (`project_work_type_id`),
  ADD KEY `project_work_type_applications_project_type_project_id_index` (`project_type`,`project_id`),
  ADD KEY `project_work_type_applications_user_id_foreign` (`user_id`),
  ADD KEY `project_work_type_applications_role_id_foreign` (`role_id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_categories`
--
ALTER TABLE `review_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_ratings`
--
ALTER TABLE `review_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_ratings_review_user_id_foreign` (`review_user_id`),
  ADD KEY `review_ratings_user_id_foreign` (`user_id`),
  ADD KEY `review_ratings_review_by_user_foreign` (`review_by_user`),
  ADD KEY `review_ratings_review_category_id_foreign` (`review_category_id`);

--
-- Indexes for table `review_users`
--
ALTER TABLE `review_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_users_user_id_foreign` (`user_id`),
  ADD KEY `review_users_review_by_user_foreign` (`review_by_user`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_unique` (`role`);

--
-- Indexes for table `role_work_professions`
--
ALTER TABLE `role_work_professions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_work_professions_role_id_work_profession_id_unique` (`role_id`,`work_profession_id`),
  ADD KEY `role_work_professions_work_profession_id_foreign` (`work_profession_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_name_index` (`name`);

--
-- Indexes for table `user_companies`
--
ALTER TABLE `user_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_companies_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_kycs_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_project_samples`
--
ALTER TABLE `user_project_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_project_samples_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_project_sample_images`
--
ALTER TABLE `user_project_sample_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_project_sample_images_user_project_sample_id_foreign` (`user_project_sample_id`);

--
-- Indexes for table `user_property_types`
--
ALTER TABLE `user_property_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_property_types_user_id_property_type_id_unique` (`user_id`,`property_type_id`),
  ADD KEY `user_property_types_property_type_id_foreign` (`property_type_id`);

--
-- Indexes for table `user_work_types`
--
ALTER TABLE `user_work_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_work_types_user_id_work_type_id_unique` (`user_id`,`work_type_id`),
  ADD KEY `user_work_types_work_type_id_foreign` (`work_type_id`);

--
-- Indexes for table `verification_remarks`
--
ALTER TABLE `verification_remarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verification_remarks_onboard_step_id_foreign` (`onboard_step_id`),
  ADD KEY `verification_remarks_user_id_foreign` (`user_id`);

--
-- Indexes for table `work_professions`
--
ALTER TABLE `work_professions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_types`
--
ALTER TABLE `work_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area_of_works`
--
ALTER TABLE `area_of_works`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `budget_ranges`
--
ALTER TABLE `budget_ranges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `elemantra_notifications`
--
ALTER TABLE `elemantra_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_supports`
--
ALTER TABLE `help_supports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `item_brand_specifications`
--
ALTER TABLE `item_brand_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `item_details`
--
ALTER TABLE `item_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `labour_work_descriptions`
--
ALTER TABLE `labour_work_descriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `onboard_steps`
--
ALTER TABLE `onboard_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT for table `project_addresses`
--
ALTER TABLE `project_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `project_individual_contractors`
--
ALTER TABLE `project_individual_contractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `project_labour_applications`
--
ALTER TABLE `project_labour_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `project_labour_contractors`
--
ALTER TABLE `project_labour_contractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `project_turnkey_contractors`
--
ALTER TABLE `project_turnkey_contractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_types`
--
ALTER TABLE `project_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_work_requests`
--
ALTER TABLE `project_work_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `project_work_request_applications`
--
ALTER TABLE `project_work_request_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `project_work_request_images`
--
ALTER TABLE `project_work_request_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_work_types`
--
ALTER TABLE `project_work_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `project_work_type_applications`
--
ALTER TABLE `project_work_type_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review_categories`
--
ALTER TABLE `review_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `review_ratings`
--
ALTER TABLE `review_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `review_users`
--
ALTER TABLE `review_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_work_professions`
--
ALTER TABLE `role_work_professions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `user_companies`
--
ALTER TABLE `user_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `user_kycs`
--
ALTER TABLE `user_kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `user_project_samples`
--
ALTER TABLE `user_project_samples`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `user_project_sample_images`
--
ALTER TABLE `user_project_sample_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT for table `user_property_types`
--
ALTER TABLE `user_property_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `user_work_types`
--
ALTER TABLE `user_work_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `verification_remarks`
--
ALTER TABLE `verification_remarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `work_professions`
--
ALTER TABLE `work_professions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_types`
--
ALTER TABLE `work_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `elemantra_notifications`
--
ALTER TABLE `elemantra_notifications`
  ADD CONSTRAINT `elemantra_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `help_supports`
--
ALTER TABLE `help_supports`
  ADD CONSTRAINT `help_supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_work_type_id_foreign` FOREIGN KEY (`work_type_id`) REFERENCES `work_types` (`id`);

--
-- Constraints for table `item_brand_specifications`
--
ALTER TABLE `item_brand_specifications`
  ADD CONSTRAINT `item_brand_specifications_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`),
  ADD CONSTRAINT `item_brand_specifications_item_detail_id_foreign` FOREIGN KEY (`item_detail_id`) REFERENCES `item_details` (`id`),
  ADD CONSTRAINT `item_brand_specifications_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_brand_specifications_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `item_brand_specifications_work_type_id_foreign` FOREIGN KEY (`work_type_id`) REFERENCES `work_types` (`id`);

--
-- Constraints for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_categories_work_type_id_foreign` FOREIGN KEY (`work_type_id`) REFERENCES `work_types` (`id`);

--
-- Constraints for table `item_details`
--
ALTER TABLE `item_details`
  ADD CONSTRAINT `item_details_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`),
  ADD CONSTRAINT `item_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_details_work_type_id_foreign` FOREIGN KEY (`work_type_id`) REFERENCES `work_types` (`id`);

--
-- Constraints for table `labour_work_descriptions`
--
ALTER TABLE `labour_work_descriptions`
  ADD CONSTRAINT `labour_work_descriptions_work_type_id_foreign` FOREIGN KEY (`work_type_id`) REFERENCES `work_types` (`id`);

--
-- Constraints for table `project_addresses`
--
ALTER TABLE `project_addresses`
  ADD CONSTRAINT `project_addresses_project_type_id_foreign` FOREIGN KEY (`project_type_id`) REFERENCES `project_types` (`id`);

--
-- Constraints for table `project_individual_contractors`
--
ALTER TABLE `project_individual_contractors`
  ADD CONSTRAINT `project_individual_contractors_budget_range_id_foreign` FOREIGN KEY (`budget_range_id`) REFERENCES `budget_ranges` (`id`),
  ADD CONSTRAINT `project_individual_contractors_project_type_id_foreign` FOREIGN KEY (`project_type_id`) REFERENCES `project_types` (`id`),
  ADD CONSTRAINT `project_individual_contractors_property_type_id_foreign` FOREIGN KEY (`property_type_id`) REFERENCES `property_types` (`id`),
  ADD CONSTRAINT `project_individual_contractors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_labour_applications`
--
ALTER TABLE `project_labour_applications`
  ADD CONSTRAINT `project_labour_applications_project_labour_contractor_id_foreign` FOREIGN KEY (`project_labour_contractor_id`) REFERENCES `project_labour_contractors` (`id`),
  ADD CONSTRAINT `project_labour_applications_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `project_labour_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_labour_contractors`
--
ALTER TABLE `project_labour_contractors`
  ADD CONSTRAINT `project_labour_contractors_assigned_user_id_foreign` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `project_labour_contractors_project_type_id_foreign` FOREIGN KEY (`project_type_id`) REFERENCES `project_types` (`id`),
  ADD CONSTRAINT `project_labour_contractors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `project_labour_contractors_work_type_id_foreign` FOREIGN KEY (`work_type_id`) REFERENCES `work_types` (`id`);

--
-- Constraints for table `project_turnkey_contractors`
--
ALTER TABLE `project_turnkey_contractors`
  ADD CONSTRAINT `project_turnkey_contractors_assigned_user_id_foreign` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `project_turnkey_contractors_budget_range_id_foreign` FOREIGN KEY (`budget_range_id`) REFERENCES `budget_ranges` (`id`),
  ADD CONSTRAINT `project_turnkey_contractors_project_type_id_foreign` FOREIGN KEY (`project_type_id`) REFERENCES `project_types` (`id`),
  ADD CONSTRAINT `project_turnkey_contractors_property_type_id_foreign` FOREIGN KEY (`property_type_id`) REFERENCES `property_types` (`id`),
  ADD CONSTRAINT `project_turnkey_contractors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_work_requests`
--
ALTER TABLE `project_work_requests`
  ADD CONSTRAINT `project_work_requests_area_of_work_id_foreign` FOREIGN KEY (`area_of_work_id`) REFERENCES `area_of_works` (`id`),
  ADD CONSTRAINT `project_work_requests_item_brand_specification_id_foreign` FOREIGN KEY (`item_brand_specification_id`) REFERENCES `item_brand_specifications` (`id`),
  ADD CONSTRAINT `project_work_requests_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`),
  ADD CONSTRAINT `project_work_requests_item_detail_id_foreign` FOREIGN KEY (`item_detail_id`) REFERENCES `item_details` (`id`),
  ADD CONSTRAINT `project_work_requests_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `project_work_requests_project_type_id_foreign` FOREIGN KEY (`project_type_id`) REFERENCES `project_types` (`id`),
  ADD CONSTRAINT `project_work_requests_project_work_type_id_foreign` FOREIGN KEY (`project_work_type_id`) REFERENCES `project_work_types` (`id`),
  ADD CONSTRAINT `project_work_requests_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `project_work_request_applications`
--
ALTER TABLE `project_work_request_applications`
  ADD CONSTRAINT `project_work_request_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pwra_pwri_id_foreign` FOREIGN KEY (`project_work_request_id`) REFERENCES `project_work_requests` (`id`),
  ADD CONSTRAINT `pwra_pwta_id_foreign` FOREIGN KEY (`project_work_type_application_id`) REFERENCES `project_work_type_applications` (`id`);

--
-- Constraints for table `project_work_request_images`
--
ALTER TABLE `project_work_request_images`
  ADD CONSTRAINT `project_work_request_images_project_work_request_id_foreign` FOREIGN KEY (`project_work_request_id`) REFERENCES `project_work_requests` (`id`);

--
-- Constraints for table `project_work_types`
--
ALTER TABLE `project_work_types`
  ADD CONSTRAINT `project_work_types_assigned_user_id_foreign` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `project_work_types_project_type_id_foreign` FOREIGN KEY (`project_type_id`) REFERENCES `project_types` (`id`),
  ADD CONSTRAINT `project_work_types_work_type_id_foreign` FOREIGN KEY (`work_type_id`) REFERENCES `work_types` (`id`);

--
-- Constraints for table `project_work_type_applications`
--
ALTER TABLE `project_work_type_applications`
  ADD CONSTRAINT `project_work_type_applications_project_work_type_id_foreign` FOREIGN KEY (`project_work_type_id`) REFERENCES `project_work_types` (`id`),
  ADD CONSTRAINT `project_work_type_applications_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `project_work_type_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `review_ratings`
--
ALTER TABLE `review_ratings`
  ADD CONSTRAINT `review_ratings_review_by_user_foreign` FOREIGN KEY (`review_by_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `review_ratings_review_category_id_foreign` FOREIGN KEY (`review_category_id`) REFERENCES `review_categories` (`id`),
  ADD CONSTRAINT `review_ratings_review_user_id_foreign` FOREIGN KEY (`review_user_id`) REFERENCES `review_users` (`id`),
  ADD CONSTRAINT `review_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `review_users`
--
ALTER TABLE `review_users`
  ADD CONSTRAINT `review_users_review_by_user_foreign` FOREIGN KEY (`review_by_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `review_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_work_professions`
--
ALTER TABLE `role_work_professions`
  ADD CONSTRAINT `role_work_professions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_work_professions_work_profession_id_foreign` FOREIGN KEY (`work_profession_id`) REFERENCES `work_professions` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_companies`
--
ALTER TABLE `user_companies`
  ADD CONSTRAINT `user_companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD CONSTRAINT `user_kycs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_project_samples`
--
ALTER TABLE `user_project_samples`
  ADD CONSTRAINT `user_project_samples_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_project_sample_images`
--
ALTER TABLE `user_project_sample_images`
  ADD CONSTRAINT `user_project_sample_images_user_project_sample_id_foreign` FOREIGN KEY (`user_project_sample_id`) REFERENCES `user_project_samples` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
