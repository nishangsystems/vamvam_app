-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 08, 2024 at 02:16 PM
-- Server version: 8.0.39-0ubuntu0.20.04.1
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint UNSIGNED NOT NULL,
  `leader_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `appointment_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `leader_id`, `title`, `description`, `appointment_date`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'road show', 'road show khair', '2023-12-01', '10:30:00', '10:50:00', 1, '2023-11-30 05:20:47', '2023-11-30 05:20:47'),
(2, 1, 'testing book appointment', 'appointment', '2023-12-09', '10:07:00', '11:08:00', 1, '2023-12-08 04:38:24', '2023-12-08 04:38:24'),
(3, 3, 'fguu', 'testing data leader', '2023-12-22', '17:53:00', '19:54:00', 1, '2023-12-20 10:24:26', '2023-12-20 10:24:26'),
(4, 1, 'Test', 'description', '2024-01-09', '14:39:00', '16:40:00', 1, '2024-01-02 09:10:42', '2024-01-02 09:10:42'),
(5, 1, 'Test2', 'Description', '2024-01-09', '14:43:00', '15:43:00', 1, '2024-01-02 09:13:17', '2024-01-02 09:13:17'),
(6, 1, 'Test3', 'Description', '2024-01-03', '14:55:00', '15:55:00', 1, '2024-01-02 09:25:29', '2024-01-02 09:25:29'),
(7, 1, 'Test4', 'Description', '2024-01-09', '14:56:00', '16:56:00', 1, '2024-01-02 09:26:23', '2024-01-02 09:26:23'),
(8, 1, 'Test', 'Description', '2024-01-10', '14:56:00', '16:56:00', 1, '2024-01-02 09:27:18', '2024-01-02 09:27:18'),
(9, 1, 'Test5', 'Description', '2024-01-08', '14:57:00', '16:57:00', 1, '2024-01-02 09:27:39', '2024-01-02 09:27:39'),
(10, 1, 'Test6', 'Description', '2024-01-09', '15:57:00', '17:57:00', 1, '2024-01-02 09:28:00', '2024-01-02 09:28:00'),
(11, 1, 'Test7', 'Test', '2024-01-11', '14:58:00', '16:58:00', 1, '2024-01-02 09:28:22', '2024-01-02 09:28:22'),
(12, 1, 'Title', 'description', '2024-01-16', '15:56:00', '16:56:00', 1, '2024-01-15 10:27:12', '2024-01-15 10:27:12'),
(13, 1, 'titl', 'zczxczcxz', '2024-01-24', '14:57:00', '18:57:00', 1, '2024-01-23 09:29:32', '2024-01-23 09:29:32'),
(14, 1, 'tit', 'dsfsdf', '2024-01-25', '14:59:00', '17:59:00', 1, '2024-01-23 09:30:27', '2024-01-23 09:30:27'),
(15, 1, 'test', 'dsfdsdsf', '2024-01-27', '17:00:00', '20:00:00', 1, '2024-01-23 09:31:37', '2024-01-23 09:31:37'),
(16, 1, 'test', 'dsfdsdsf', '2024-01-27', '17:00:00', '20:00:00', 1, '2024-01-23 09:31:37', '2024-01-23 09:31:37'),
(17, 1, 'sdfsdfsfds', 'dfsfsdf', '2024-01-31', '15:06:00', '18:06:00', 1, '2024-01-23 09:37:14', '2024-01-23 09:37:14'),
(18, 1, 'dsds', 'sdsda', '2024-01-31', '15:15:00', '19:15:00', 1, '2024-01-23 09:46:15', '2024-01-23 09:46:15'),
(19, 4, 'test', 'nothing', '2024-01-24', '15:53:00', '16:53:00', 1, '2024-01-23 10:23:50', '2024-01-23 10:23:50'),
(20, 1, 'dsfdsfds', 'sdfsdf', '2024-01-31', '16:13:00', '19:13:00', 1, '2024-01-23 10:44:38', '2024-01-23 10:44:38'),
(21, 4, 'test', 'na', '2024-01-24', '16:25:00', '19:25:00', 1, '2024-01-23 11:55:51', '2024-01-23 11:55:51'),
(22, 6, 'Testing', 'Please Test', '2024-06-13', '10:36:00', '22:36:00', 1, '2024-06-11 23:37:06', '2024-06-11 23:37:06'),
(23, 1, 'ghy', 'bbb', '2024-07-18', '16:54:00', '16:55:00', 1, '2024-07-17 02:55:07', '2024-07-17 02:55:07'),
(24, 1, 'test', 'na', '2024-07-18', '14:32:00', '16:32:00', 1, '2024-07-17 03:32:09', '2024-07-17 03:32:09'),
(25, 1, 'na', 'mm', '2024-07-18', '14:34:00', '16:34:00', 1, '2024-07-17 03:34:59', '2024-07-17 03:34:59'),
(26, 1, 'vhg', 'bbb', '2024-07-18', '17:05:00', '18:05:00', 1, '2024-07-17 06:05:46', '2024-07-17 06:05:46'),
(27, 1, 'hhhh', 'vbb', '2024-07-18', '17:07:00', '18:07:00', 1, '2024-07-17 06:07:17', '2024-07-17 06:07:17'),
(28, 1, 'test', 'tt', '2024-07-18', '17:57:00', '19:57:00', 1, '2024-07-17 06:57:52', '2024-07-17 06:57:52'),
(29, 1, 'test', 'na', '2024-07-26', '15:56:00', '20:57:00', 1, '2024-07-25 04:57:10', '2024-07-25 04:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `assembly_constituency`
--

CREATE TABLE `assembly_constituency` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `district_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assembly_constituency`
--

INSERT INTO `assembly_constituency` (`id`, `state_id`, `district_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 1, '71- Khair', 1, '2023-11-17 07:28:30', '2023-11-17 07:28:30'),
(2, 10, 7, 'Cameroon', 1, '2024-04-25 05:38:46', '2024-04-25 05:38:46'),
(3, 5, 8, 'ARA CITY', 1, '2024-06-11 06:41:43', '2024-06-11 06:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(11, NULL, 'images/banner/17187943878925.jpg', '2024-04-25 04:55:11', '2024-06-19 05:23:07'),
(12, NULL, 'images/banner/17187948042663.jpg', '2024-06-19 05:30:04', '2024-06-19 05:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `district_id` int NOT NULL DEFAULT '0',
  `tehsil_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `state_id`, `district_id`, `tehsil_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 1, 4, 'Khair', 1, '2023-11-17 07:30:14', '2023-11-17 07:30:14'),
(2, 38, 1, 4, 'Tappal', 1, '2024-01-10 07:08:32', '2024-01-10 07:08:32'),
(3, 38, 1, 4, 'Chandaus', 1, '2024-01-10 07:19:37', '2024-01-10 07:19:37'),
(4, 10, 7, 9, 'Cameroon', 1, '2024-04-25 05:45:31', '2024-04-25 05:45:31'),
(5, 5, 8, 10, 'Barhara Sadar', 1, '2024-06-11 06:44:02', '2024-06-11 06:44:02');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint UNSIGNED NOT NULL,
  `complaint_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `complaint_file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `complaint_file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complaint_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resolved_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `complaint_code`, `customer_id`, `department_id`, `issue_type_id`, `latitude`, `longitude`, `address`, `message`, `complaint_file`, `complaint_file_type`, `complaint_date`, `status`, `remarks`, `resolved_date`, `created_at`, `updated_at`) VALUES
(1, '63525236', '1', '2', '2', NULL, NULL, NULL, 'Test', '[]', NULL, '2023-11-17', 2, NULL, NULL, '2023-11-17 07:33:47', '2023-11-17 07:33:56'),
(2, '27066408', '4', '1', '1', '28.628787843590718', '77.37256731837988', '1015A, Sector 62, Noida, Uttar Pradesh, India, 201309', 'hairstyle light is not coming', '[{\"file_path\":\"images\\/complaint\\/17006379108475.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17006379108517.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-22', 3, NULL, NULL, '2023-11-22 07:25:10', '2023-11-22 10:23:33'),
(3, '60971122', '4', '5', '4', '28.628787843590718', '77.37256731837988', '1015A, Sector 62, Noida, Uttar Pradesh, India, 201309', 'water issuep', '[{\"file_path\":\"images\\/complaint\\/17006461259044.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17006461259049.\",\"file_type\":\"\"},{\"file_path\":\"images\\/complaint\\/17006461259085.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-22', 2, NULL, NULL, '2023-11-22 09:42:05', '2023-11-22 10:04:06'),
(4, '23139818', '4', '3', '2', '28.625239576650852', '77.3747556656599', 'H224, Sector 63, Noida, Uttar Pradesh, India, 201301', 'babbsbs', '[{\"file_path\":\"images\\/complaint\\/17006495832469.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17006495832473.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17006495832476.\",\"file_type\":\"\"}]', NULL, '2023-11-22', 2, NULL, NULL, '2023-11-22 10:39:43', '2023-11-22 10:40:05'),
(5, '24821309', '2', '1', '3', '28.6264318', '77.3773893', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'road issue', '[{\"file_path\":\"images\\/complaint\\/17007157714800.jpg\",\"file_type\":\"jpg\"}]', NULL, '2023-11-23', 1, NULL, NULL, '2023-11-23 05:02:51', '2023-11-23 05:02:51'),
(6, '46120360', '9', '1', '1', '28.6265443', '77.3774825', 'H098, Sector 63, Noida, 201301, Uttar Pradesh,India', 'Please fix electric supply!', '[{\"file_path\":\"images\\/complaint\\/17007187913706.jpg\",\"file_type\":\"jpg\"}]', NULL, '2023-11-23', 2, NULL, NULL, '2023-11-23 05:53:11', '2023-11-23 05:58:49'),
(7, '34855682', '8', '1', '1', '28.6265443', '77.3774825', 'H098, Sector 63, Noida, 201301, Uttar Pradesh,India', 'Please fix it!', '[{\"file_path\":\"images\\/complaint\\/17007188668687.jpg\",\"file_type\":\"jpg\"}]', NULL, '2023-11-23', 2, NULL, NULL, '2023-11-23 05:54:26', '2023-11-23 05:59:03'),
(8, '26556096', '10', '1', '1', NULL, NULL, NULL, 'Here Street light Issues.', '[{\"file_path\":\"images\\/complaint\\/17007188990025.jpg\",\"file_type\":\"jpg\"}]', NULL, '2023-11-23', 2, NULL, NULL, '2023-11-23 05:54:59', '2023-11-23 05:55:15'),
(9, '93422194', '7', '1', '2', '28.5436392', '77.3708258', '601, Sector 100, Noida, 201303, Uttar Pradesh,India', 'abc', '[{\"file_path\":\"images\\/complaint\\/17007192989683.jpg\",\"file_type\":\"jpg\"}]', NULL, '2023-11-23', 1, NULL, NULL, '2023-11-23 06:01:38', '2023-11-23 06:01:38'),
(10, '67096212', '2', '1', '1', '28.6265443', '77.3774825', 'H098, Sector 63, Noida, 201301, Uttar Pradesh,India', 'probelm', '[]', NULL, '2023-11-23', 1, NULL, NULL, '2023-11-23 06:16:11', '2023-11-23 06:16:11'),
(11, '70637668', '11', '1', '2', '28.5333412', '77.3678478', '77, Sector 105, Noida, 201304, Uttar Pradesh,India', 'Itna padhe Nahin aaega Kuchh Hai To unke liye Bhi ki ab Sidha bola unhone Jaise bolate Hain', '[{\"file_path\":\"images\\/complaint\\/17007214269843.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-23', 1, NULL, NULL, '2023-11-23 06:37:06', '2023-11-23 06:37:06'),
(12, '16246049', '7', '2', '3', '28.6264389', '77.377405', 'H107, Sector 62, Noida, 201301, Uttar Pradesh,India', 'hello hello check hello check hello', '[{\"file_path\":\"images\\/complaint\\/17007464311537.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-23', 1, NULL, NULL, '2023-11-23 13:33:51', '2023-11-23 13:33:51'),
(13, '72565157', '7', '2', '3', '28.6264389', '77.377405', 'H107, Sector 62, Noida, 201301, Uttar Pradesh,India', 'hello hello check hello check hello', '[{\"file_path\":\"images\\/complaint\\/17007464686383.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-23', 2, NULL, NULL, '2023-11-23 13:34:28', '2023-11-24 10:28:43'),
(14, '39102545', '7', '3', '3', '28.6264176', '77.3774112', 'H107, Sector 62, Noida, 201301, Uttar Pradesh,India', 'batao Kahan dikh raha hai ki kya ho raha hai kya Nahin ho raha hai', '[{\"file_path\":\"images\\/complaint\\/17011737153074.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17011737153094.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-28', 1, NULL, NULL, '2023-11-28 12:15:15', '2023-11-28 12:15:15'),
(15, '17950019', '7', '3', '3', '28.6264176', '77.3774112', 'H107, Sector 62, Noida, 201301, Uttar Pradesh,India', 'batao Kahan dikh raha hai ki kya ho raha hai kya Nahin ho raha hai', '[{\"file_path\":\"images\\/complaint\\/17011737454339.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17011737454346.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-28', 1, NULL, NULL, '2023-11-28 12:15:45', '2023-11-28 12:15:45'),
(16, '89471112', '7', '2', '1', NULL, NULL, NULL, 'uyijo', '[]', NULL, '2023-11-28', 1, NULL, NULL, '2023-11-28 12:19:27', '2023-11-28 12:19:27'),
(17, '78395861', '10', '1', '2', NULL, NULL, NULL, 'dsas', '[]', NULL, '2023-11-28', 1, NULL, NULL, '2023-11-28 12:22:26', '2023-11-28 12:22:26'),
(18, '86285482', '2', '5', '4', NULL, NULL, NULL, 'test', '[{\"file_path\":\"images\\/complaint\\/17011760643845.sql\",\"file_type\":\"sql\"}]', NULL, '2023-11-28', 2, NULL, NULL, '2023-11-28 12:54:24', '2023-11-28 12:54:24'),
(19, '32532531', '2', '1', '1', '28.6263673', '77.3773992', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'problem', '[]', NULL, '2023-11-28', 2, NULL, NULL, '2023-11-28 12:54:49', '2023-11-28 12:54:49'),
(20, '88332798', '13', '1', '1', '27.9391956', '77.84244559999999', 'WRQR+MXG, , Khair, Uttar Pradesh, India, 202138', 'road issue', '[{\"file_path\":\"images\\/complaint\\/17012550602690.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17012550602704.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-29', 3, NULL, NULL, '2023-11-29 10:51:00', '2023-11-29 11:55:22'),
(21, '37080442', '13', '1', '2', '28.626369', '77.3773995', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', '2 day se light nhi aa rahi', '[{\"file_path\":\"images\\/complaint\\/17013229652696.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17013229652699.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17013229652704.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17013229652708.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17013229652738.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-11-30', 2, NULL, NULL, '2023-11-30 05:42:45', '2023-11-30 06:03:39'),
(22, '85658297', '2', '1', '1', '28.6263647', '77.3773977', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'hhhhhh', '[]', NULL, '2023-12-01', 2, NULL, NULL, '2023-12-01 12:00:38', '2023-12-01 12:00:38'),
(23, '32837102', '12', '1', '1', '28.6263586', '77.3774021', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'wa all', '[{\"file_path\":\"images\\/complaint\\/17016893465870.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17016893465881.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17016893465894.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-04', 3, NULL, NULL, '2023-12-04 11:29:06', '2023-12-08 07:11:13'),
(24, '71595175', '16', '2', '2', '28.6263663', '77.3773993', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'fggghu', '[]', NULL, '2023-12-05', 2, NULL, NULL, '2023-12-05 09:11:17', '2023-12-05 09:11:17'),
(25, '64664769', '16', '3', '2', '28.6263663', '77.3773993', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'cvhhhj', '[]', NULL, '2023-12-05', 2, NULL, NULL, '2023-12-05 09:12:22', '2023-12-05 09:12:22'),
(26, '14407587', '16', '3', '2', '28.6263663', '77.3773993', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'testing', '[{\"file_path\":\"images\\/complaint\\/17017681179797.jpg\",\"file_type\":\"jpg\"}]', NULL, '2023-12-05', 2, NULL, NULL, '2023-12-05 09:21:57', '2023-12-05 09:21:58'),
(27, '58976432', '16', '3', '2', '28.6263663', '77.3773993', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'testing data', '[{\"file_path\":\"images\\/complaint\\/17017681611247.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17017681611254.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-05', 2, NULL, NULL, '2023-12-05 09:22:41', '2023-12-05 09:22:41'),
(28, '71479220', '16', '3', '4', '28.6263565', '77.3773865', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'ghjjkk', '[{\"file_path\":\"images\\/complaint\\/17017769571274.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17017769571277.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-05', 2, NULL, NULL, '2023-12-05 11:49:17', '2023-12-05 11:49:17'),
(29, '12242087', '17', '2', '2', '27.9391956', '77.84244559999999', 'WRQR+MXG, , Khair, Uttar Pradesh, India, 202138', 'light issue', '[{\"file_path\":\"images\\/complaint\\/17018459000240.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17018459000252.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17018459000254.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17018459000257.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17018459000288.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-06', 2, NULL, NULL, '2023-12-06 06:58:20', '2023-12-06 06:58:20'),
(30, '38242404', '12', '1', '1', '28.6263601', '77.3773908', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'so', '[{\"file_path\":\"images\\/complaint\\/17018565523821.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-06', 2, NULL, NULL, '2023-12-06 09:55:52', '2023-12-06 09:55:52'),
(31, '51227864', '12', '1', '2', '28.6263601', '77.3773908', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'am', '[{\"file_path\":\"images\\/complaint\\/17018582014150.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-06', 2, NULL, NULL, '2023-12-06 10:23:21', '2023-12-06 10:23:21'),
(32, '60076778', '12', '1', '2', '28.6263601', '77.3773908', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'am', '[{\"file_path\":\"images\\/complaint\\/17018582310432.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-06', 2, NULL, NULL, '2023-12-06 10:23:51', '2023-12-06 10:23:51'),
(33, '24230142', '12', '1', '2', '28.6263601', '77.3773908', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'am', '[{\"file_path\":\"images\\/complaint\\/17018582543219.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17018582543225.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-06', 2, NULL, NULL, '2023-12-06 10:24:14', '2023-12-06 10:24:14'),
(34, '36509122', '12', '4', '3', '28.6263574', '77.3773936', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'ghjj', '[{\"file_path\":\"images\\/complaint\\/17018596265159.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-06', 2, NULL, NULL, '2023-12-06 10:47:06', '2023-12-06 10:47:06'),
(35, '56202345', '12', '3', '3', '28.6263574', '77.3773936', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'ghh', '[{\"file_path\":\"images\\/complaint\\/17018599020290.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-06', 2, NULL, NULL, '2023-12-06 10:51:42', '2023-12-06 11:33:02'),
(36, '45818736', '16', '2', '3', '28.6263589', '77.3774008', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'ghjj', '[{\"file_path\":\"images\\/complaint\\/17019515065263.jpg\",\"file_type\":\"jpg\"}]', NULL, '2023-12-07', 2, NULL, NULL, '2023-12-07 12:18:26', '2023-12-07 12:18:26'),
(37, '53606514', '16', '3', '3', '28.6263589', '77.3774008', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'dddf', '[{\"file_path\":\"images\\/complaint\\/17019516617007.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17019516617013.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-07', 2, NULL, NULL, '2023-12-07 12:21:01', '2023-12-07 12:21:01'),
(38, '21809296', '12', '1', '2', '28.6263572', '77.37739', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'light issue', '[{\"file_path\":\"images\\/complaint\\/17019530722586.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17019530722592.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17019530722596.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17019530722599.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17019530722611.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-07', 2, NULL, NULL, '2023-12-07 12:44:32', '2023-12-07 12:44:32'),
(39, '99832961', '3', '3', '2', '37.4219983', '-122.084', 'P1600 Amphitheatre Pkwy, , Mountain View, 94043, California,United States', 'sdfgh', '[]', NULL, '2023-12-07', 2, NULL, NULL, '2023-12-07 20:16:03', '2023-12-07 20:16:03'),
(40, '90101623', '14', '2', '3', '28.6263601', '77.3774046', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'Hamare Yahan Road ki bahut problem hai', '[{\"file_path\":\"images\\/complaint\\/17020166667253.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17020166667265.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17020166667269.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17020166667272.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17020166667285.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-08', 2, NULL, NULL, '2023-12-08 06:24:26', '2023-12-08 06:53:55'),
(41, '11669009', '25', '1', '1', '27.9391956', '77.84244559999999', 'WRQR+MXG, , Khair, Uttar Pradesh, India, 202138', 'light ki bahot issue hai', '[{\"file_path\":\"images\\/complaint\\/17022730311606.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17022730311617.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17022730311620.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17022730311625.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17022730311653.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-11', 2, NULL, NULL, '2023-12-11 05:37:11', '2023-12-11 05:37:11'),
(42, '75302183', '14', '2', '2', NULL, NULL, NULL, 'test', '[]', NULL, '2023-12-11', 2, NULL, NULL, '2023-12-11 05:42:39', '2023-12-11 05:42:39'),
(43, '51580820', '14', '2', '3', NULL, NULL, NULL, 'road', '[]', NULL, '2023-12-11', 4, NULL, NULL, '2023-12-11 07:20:13', '2023-12-11 07:23:45'),
(44, '65768281', '16', '2', '1', NULL, NULL, NULL, 'test', '[]', NULL, '2023-12-11', 2, NULL, NULL, '2023-12-11 07:21:05', '2023-12-11 07:21:05'),
(45, '81627733', '25', '2', '1', NULL, NULL, NULL, 'xyz', '[]', NULL, '2023-12-11', 2, NULL, NULL, '2023-12-11 07:21:37', '2023-12-11 07:21:37'),
(46, '15082721', '25', '1', '1', NULL, NULL, NULL, 'xyz', '[]', NULL, '2023-12-11', 1, NULL, NULL, '2023-12-11 07:22:52', '2023-12-11 07:22:52'),
(47, '76523434', '16', '4', '3', 'null', 'null', NULL, 'testy', '[]', NULL, '2023-12-11', 4, NULL, NULL, '2023-12-11 07:54:09', '2023-12-11 07:54:25'),
(48, '46347180', '16', '3', '4', '28.630073277208936', '77.38409411162138', 'D-247/11, Sector 63, Noida, Uttar Pradesh, India, 201301', 'water issue', '[]', NULL, '2023-12-11', 5, NULL, NULL, '2023-12-11 07:55:08', '2024-01-06 21:23:51'),
(49, '68480939', '27', '1', '3', '27.9391956', '77.84244559999999', 'WRQR+MXG, , Khair, Uttar Pradesh, India, 202138', 'Road ki bahut jyada samasya hai', '[{\"file_path\":\"images\\/complaint\\/17022927165918.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17022927165922.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17022927165925.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17022927165927.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17022927165940.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-11', 4, NULL, NULL, '2023-12-11 11:05:16', '2023-12-11 11:14:16'),
(50, '84985344', '27', '1', '1', '27.9391956', '77.84244559999999', 'WRQR+MXG, , Khair, Uttar Pradesh, India, 202138', 'xyz', '[{\"file_path\":\"images\\/complaint\\/17022933329396.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17022933329399.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17022933329402.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17022933329404.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17022933329429.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-11', 2, NULL, NULL, '2023-12-11 11:15:32', '2023-12-11 11:15:32'),
(51, '92694141', '14', '1', '1', '27.9407772', '77.84364029999999', 'WRRV+8CH, , Khair, Uttar Pradesh, India, 202138', 'hello hello', '[{\"file_path\":\"images\\/complaint\\/17024638528251.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17024638528265.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17024638528267.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17024638528269.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17024638528283.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-13', 4, NULL, NULL, '2023-12-13 10:37:32', '2023-12-13 10:37:44'),
(52, '73836744', '40', '1', '1', '27.9407772', '77.84364029999999', 'WRRV+8CH, , Khair, Uttar Pradesh, India, 202138', 'jal samashya', '[{\"file_path\":\"images\\/complaint\\/17032263092416.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17032263092434.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17032263092444.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17032263092447.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17032263092460.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-22', 3, NULL, NULL, '2023-12-22 06:25:09', '2024-01-02 10:12:28'),
(53, '14202194', '16', '3', '3', '28.6263866', '77.3773892', '107, Sector 63, Noida, 201301, Uttar Pradesh,India', 'trst', '[{\"file_path\":\"images\\/complaint\\/17032479664402.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17032479664409.mp4\",\"file_type\":\"mp4\"}]', NULL, '2023-12-22', 4, NULL, NULL, '2023-12-22 12:26:06', '2024-03-01 05:16:49'),
(54, '82509523', '44', '1', '2', '26.845390006973837', '80.94722673296928', 'surjeet.alobhatech@gmail.com', 'There have Electricity Issue', '[{\"file_path\":\"images\\/complaint\\/17038293876179.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17038293876186.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17038293876188.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17038293876224.mp3\",\"file_type\":\"mp3\"}]', NULL, '2023-12-29', 5, NULL, NULL, '2023-12-29 05:56:27', '2023-12-29 07:22:22'),
(55, '56259743', '44', '2', '4', '26.845390006973837', '80.94722673296928', 'surjeet.alobhatech@gmail.com', 'Water issue', '[]', NULL, '2023-12-29', 5, NULL, NULL, '2023-12-29 06:05:07', '2023-12-29 07:22:02'),
(56, '37551887', '44', '2', '2', '26.83926249783601', '80.94264082610607', 'surjeet.alobhatech@gmail.com', 'Ration Card Issue', '[{\"file_path\":\"images\\/complaint\\/17038344139970.mp4\",\"file_type\":\"mp4\"}]', NULL, '2023-12-29', 4, NULL, NULL, '2023-12-29 07:20:14', '2024-01-15 04:55:27'),
(57, '80357725', '2', '2', '2', 'null', 'null', 'noida', 'problem with my phone', '[]', NULL, '2024-01-02', 2, NULL, NULL, '2024-01-02 11:59:50', '2024-01-02 11:59:50'),
(58, '53581336', '2', '2', '2', 'null', 'null', 'noida', 'problem', '[{\"file_path\":\"images\\/complaint\\/17041968881374.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17041968881387.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17041968881392.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-01-02', 2, NULL, NULL, '2024-01-02 12:01:28', '2024-01-02 12:01:28'),
(59, '20567627', '2', '1', '2', 'null', 'null', 'noida', 'problem', '[{\"file_path\":\"images\\/complaint\\/17041975498916.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17041975498922.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17041975498928.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17041975498932.mp3\",\"file_type\":\"mp3\"}]', NULL, '2024-01-02', 2, NULL, NULL, '2024-01-02 12:12:29', '2024-01-02 12:12:30'),
(60, '69540645', '44', '2', '2', '28.626436471672218', '77.37685047090054', 'Noida sector63', 'light issue', '[]', NULL, '2024-01-03', 2, NULL, NULL, '2024-01-03 10:49:26', '2024-01-03 10:49:26'),
(61, '38767652', '44', '5', '3', 'null', 'null', 'Noida sector62', 'test', '[{\"file_path\":\"images\\/complaint\\/17042795426211.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17042795426257.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17042795426384.mp3\",\"file_type\":\"mp3\"}]', NULL, '2024-01-03', 2, NULL, NULL, '2024-01-03 10:59:02', '2024-01-03 10:59:02'),
(62, '36400306', '44', '2', '2', 'null', 'null', 'Noida sector62', 'water', '[]', NULL, '2024-01-03', 4, NULL, NULL, '2024-01-03 11:00:34', '2024-01-12 07:39:44'),
(63, '84550629', '44', '5', '1', 'null', 'null', 'noida', 'test', '[{\"file_path\":\"images\\/complaint\\/17042831376280.mp3\",\"file_type\":\"mp3\"}]', NULL, '2024-01-03', 4, NULL, NULL, '2024-01-03 11:58:57', '2024-01-12 07:38:05'),
(64, '10906005', '52', '2', '2', 'null', 'null', 'noida', 'test\n    what what is what is this', '[]', NULL, '2024-01-04', 2, NULL, NULL, '2024-01-04 07:15:38', '2024-01-04 07:30:21'),
(65, '30822996', '16', '3', '3', '28.6026361', '77.3769437', 'J93G+3Q9, Sector 66, Noida, Uttar Pradesh, India, 201301', 'issue', '[]', NULL, '2024-01-06', 4, NULL, NULL, '2024-01-06 21:23:21', '2024-01-06 21:27:07'),
(66, '45173779', '2', '3', '2', 'null', 'null', 'Noida', 'Problem', '[]', NULL, '2024-01-08', 2, NULL, NULL, '2024-01-08 11:33:51', '2024-01-08 11:33:51'),
(67, '65990617', '2', '1', '2', 'null', 'null', 'Noida', 'Ptoblem 2', '[]', NULL, '2024-01-08', 2, NULL, NULL, '2024-01-08 11:38:51', '2024-01-08 11:38:51'),
(68, '98600009', '55', '1', '2', '28.631759796386348', '77.41624508053064', 'noida 63', 'there are problems of lights and streets are darks. so plz resolve the problem.', '[{\"file_path\":\"images\\/complaint\\/17048683257456.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17048683257461.mp3\",\"file_type\":\"mp3\"}]', NULL, '2024-01-10', 4, NULL, NULL, '2024-01-10 06:32:05', '2024-01-10 09:24:40'),
(69, '22208557', '55', '2', '3', 'null', 'null', 'Noida', 'tert', '[{\"file_path\":\"images\\/complaint\\/17048789850592.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-01-10', 2, NULL, NULL, '2024-01-10 09:29:45', '2024-01-10 09:29:45'),
(70, '99582686', '58', '4', '4', 'null', 'null', 'Noida', 'new', '[]', NULL, '2024-01-10', 4, NULL, NULL, '2024-01-10 09:53:31', '2024-01-22 05:44:25'),
(71, '61885058', '2', '1', '1', 'null', 'null', 'noida', 'problem', '[{\"file_path\":\"images\\/complaint\\/17048913889296.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17048913889302.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17048913889304.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17048913889309.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17048913889368.mp3\",\"file_type\":\"mp3\"}]', NULL, '2024-01-10', 2, NULL, NULL, '2024-01-10 12:56:28', '2024-01-10 12:56:29'),
(72, '57487176', '2', '1', '1', '28.6263601', '77.3774231', 'noida', 'hi Aryan what doing', '[{\"file_path\":\"images\\/complaint\\/17050438444810.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17050438444883.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17050438444890.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17050438444895.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17050438444957.mp3\",\"file_type\":\"mp3\"},{\"file_path\":\"images\\/complaint\\/17050438444971.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-01-12', 4, NULL, NULL, '2024-01-12 07:17:24', '2024-01-12 07:58:14'),
(73, '62161320', '2', '1', '1', 'null', 'null', 'address noida sector 63 u.p.', 'Hello Sir/ma\'am\n\nI want to do a complaint against...........', '[{\"file_path\":\"images\\/complaint\\/17053183747765.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17053183747772.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17053183747774.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17053183747779.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17053183747839.mp3\",\"file_type\":\"mp3\"},{\"file_path\":\"images\\/complaint\\/17053183747844.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-01-15', 3, NULL, NULL, '2024-01-15 11:32:54', '2024-01-15 11:47:24'),
(74, '74691191', '44', '2', '2', '28.5610168', '77.3749625', 'Aligarh', 'there are electrical issues', '[{\"file_path\":\"images\\/complaint\\/17058987309173.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17058987309191.mp3\",\"file_type\":\"mp3\"},{\"file_path\":\"images\\/complaint\\/17058987309202.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-01-22', 2, NULL, NULL, '2024-01-22 04:45:30', '2024-01-22 05:54:20'),
(75, '46877740', '58', '5', '2', '28.5610047', '77.3749054', 'aligarh', 'there are street light issues', '[{\"file_path\":\"images\\/complaint\\/17059022253104.mp3\",\"file_type\":\"mp3\"}]', NULL, '2024-01-22', 4, NULL, NULL, '2024-01-22 05:43:45', '2024-01-22 05:44:34'),
(76, '85149572', '44', '2', '2', '28.5609597', '77.3749392', 'noida', 'there is water issues', '[]', NULL, '2024-01-23', 3, NULL, NULL, '2024-01-23 05:15:57', '2024-01-23 06:36:37'),
(77, '64663151', '65', '2', '3', '28.6230805989721', '77.38013450056314', 'uhh nearby tower A', 'hi', '[]', NULL, '2024-01-26', 5, NULL, NULL, '2024-01-26 03:43:57', '2024-01-26 03:49:28'),
(78, '47816277', '65', '4', '3', 'null', 'null', 'LG01, Sector 63, Noida, Uttar Pradesh, India, 201301', 'huiuui', '[]', NULL, '2024-01-26', 2, NULL, NULL, '2024-01-26 04:24:22', '2024-01-26 04:24:22'),
(79, '33256603', '70', '1', '2', '28.5610363', '77.3746513', 'Delhi', 'there are light issues', '[{\"file_path\":\"images\\/complaint\\/17062599128222.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-01-26', 2, NULL, NULL, '2024-01-26 09:05:12', '2024-01-26 09:05:13'),
(80, '95809885', '72', '3', '2', '28.561385', '77.3749702', 'Delhi', 'there are light issues', '[{\"file_path\":\"images\\/complaint\\/17062605347998.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-01-26', 2, NULL, NULL, '2024-01-26 09:15:34', '2024-01-26 09:21:45'),
(81, '96422768', '72', '2', '2', '28.561385', '77.3749702', 'noida', 'hi', '[{\"file_path\":\"images\\/complaint\\/17062608447112.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-01-26', 5, NULL, NULL, '2024-01-26 09:20:44', '2024-01-26 09:21:19'),
(82, '36073889', '74', '3', '2', '28.5610318', '77.3746471', 'delhi', 'there are light issues', '[{\"file_path\":\"images\\/complaint\\/17062621502747.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-01-26', 5, NULL, NULL, '2024-01-26 09:42:30', '2024-01-26 09:42:49'),
(83, '23941153', '74', '3', '2', '28.5610318', '77.3746471', 'delhi', 'there are light problem', '[{\"file_path\":\"images\\/complaint\\/17062631341639.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17062631341700.mp3\",\"file_type\":\"mp3\"},{\"file_path\":\"images\\/complaint\\/17062631341709.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-01-26', 5, NULL, NULL, '2024-01-26 09:58:54', '2024-01-26 09:59:20'),
(84, '70377961', '75', '3', '2', 'null', 'null', 'delhi', 'hi are you working', '[{\"file_path\":\"images\\/complaint\\/17065195839583.png\",\"file_type\":\"png\"}]', NULL, '2024-01-29', 2, NULL, NULL, '2024-01-29 09:13:03', '2024-01-29 09:13:04'),
(85, '81300115', '44', '2', '2', 'null', 'null', 'Noida', 'na', '[]', NULL, '2024-01-29', 5, NULL, NULL, '2024-01-29 09:26:42', '2024-01-29 09:39:06'),
(86, '70344217', '59', '1', '1', 'null', 'null', 'test', 'test', '[]', NULL, '2024-01-30', 2, NULL, NULL, '2024-01-30 11:26:30', '2024-01-30 11:39:00'),
(87, '99225389', '59', '3', '2', 'null', 'null', 'tty', 'test 2', '[]', NULL, '2024-01-30', 2, NULL, NULL, '2024-01-30 12:21:29', '2024-01-30 12:26:13'),
(88, '92895944', '44', '2', '2', 'null', 'null', 'noida', 'there are light problems', '[{\"file_path\":\"images\\/complaint\\/17079962953108.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-02-15', 3, NULL, NULL, '2024-02-15 11:24:55', '2024-03-01 04:58:25'),
(89, '10589719', '79', '1', '3', '28.626232', '77.3773634', 'abhishek101.alobha@gmail.com', 'road safety', '[]', NULL, '2024-02-29', 2, NULL, NULL, '2024-02-29 07:01:44', '2024-02-29 07:01:45'),
(90, '59521187', '79', '1', '3', '28.626244', '77.3773764', 'noida', 'road safety', '[{\"file_path\":\"images\\/complaint\\/17091914205162.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17091914205188.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17091914205224.mp3\",\"file_type\":\"mp3\"},{\"file_path\":\"images\\/complaint\\/17091914205226.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-02-29', 2, NULL, NULL, '2024-02-29 07:23:40', '2024-02-29 07:23:40'),
(91, '70371555', '44', '1', '2', 'null', 'null', 'noida', 'light issues', '[{\"file_path\":\"images\\/complaint\\/17091975629791.mp3\",\"file_type\":\"mp3\"}]', NULL, '2024-02-29', 2, NULL, NULL, '2024-02-29 09:06:02', '2024-02-29 09:06:03'),
(92, '44261209', '2', '2', '2', '37.4219983', '-122.084', 'Noida sector 63', 'Unique Problem', '[{\"file_path\":\"images\\/complaint\\/17092011206293.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17092011206295.mp3\",\"file_type\":\"mp3\"},{\"file_path\":\"images\\/complaint\\/17092011206298.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-02-29', 3, NULL, NULL, '2024-02-29 10:05:20', '2024-02-29 10:30:45'),
(93, '57534646', '82', '2', '2', '28.6263552', '77.3774312', 'H-15, Sector 62, Noida, 201301, Uttar Pradesh,India', 'light issue', '[]', NULL, '2024-02-29', 4, NULL, NULL, '2024-02-29 10:17:11', '2024-02-29 11:39:59'),
(94, '34891735', '2', '1', '2', '28.626368', '77.377421', 'st', 'dtxtc', '[{\"file_path\":\"images\\/complaint\\/17092037296170.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-02-29', 5, NULL, NULL, '2024-02-29 10:48:49', '2024-02-29 10:50:52'),
(95, '38273089', '82', '2', '2', '28.6263441', '77.3774256', 'noida', 'light issues', '[]', NULL, '2024-02-29', 4, NULL, NULL, '2024-02-29 11:17:20', '2024-02-29 11:43:14'),
(96, '72667811', '82', '2', '2', '28.6263588', '77.3774971', 'noida', 'hdhsjs', '[]', NULL, '2024-02-29', 4, NULL, NULL, '2024-02-29 11:31:46', '2024-02-29 11:40:14'),
(97, '47742299', '82', '2', '3', '28.6263588', '77.3774971', 'jffjj', 'cjxbxbxnj', '[]', NULL, '2024-02-29', 4, NULL, NULL, '2024-02-29 11:49:00', '2024-02-29 12:27:48'),
(98, '93869773', '84', '3', '1', '28.585207398205732', '77.37854160368443', 'Enter address', 'fuzhvjbj', '[{\"file_path\":\"images\\/complaint\\/17092680902888.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17092680902890.mp3\",\"file_type\":\"mp3\"},{\"file_path\":\"images\\/complaint\\/17092680902892.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 04:41:30', '2024-03-01 04:41:30'),
(99, '51062624', '84', '2', '2', '28.573734275317907', '77.37896975129843', 'address', 'problem can\'t be empty', '[{\"file_path\":\"images\\/complaint\\/17092683844068.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 04:46:24', '2024-03-01 04:46:24'),
(100, '15785019', '84', '2', '2', '28.573734275317907', '77.37896975129843', 'jsja', 'hanakzblahblah algsvsogsxwu wxqz jl xiv', '[]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 04:50:26', '2024-03-01 04:50:26'),
(101, '57546358', '84', '1', '2', '28.571538022384875', '77.38466341048479', 'rxhvjblnl', 'dtxuxigh', '[]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 04:56:49', '2024-03-01 04:56:50'),
(102, '56980375', '84', '2', '4', '28.564842686646962', '77.3936015367508', 'xgkgxhchc', ',jfjgchcsis', '[]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 04:57:09', '2024-03-01 04:57:09'),
(103, '58319801', '84', '3', '2', '28.57054867775769', '77.411288022995', 'xhhcgvkxg', 'tkdtxgxm', '[]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 04:57:25', '2024-03-01 04:57:25'),
(104, '27034821', '84', '4', '2', '25.60130782360055', '73.29369015991688', 'jvhkgsistF', 'ufzhcgjgj', '[]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 04:58:02', '2024-03-01 04:58:02'),
(105, '93243773', '84', '5', '3', '30.33522907500805', '69.93909727782011', 'cjg gxjhxckgc', 'ruzgxgkxiit', '[]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 04:59:04', '2024-03-01 04:59:04'),
(106, '78340737', '84', '4', '3', '13.292735396804616', '82.1594437211752', 'v nmgfb', 'vxchjg', '[]', NULL, '2024-03-01', 2, NULL, NULL, '2024-03-01 05:05:35', '2024-03-01 05:05:35'),
(107, '47256271', '84', '1', '3', '28.6263693', '77.3774336', 'noida', 'Problem', '[{\"file_path\":\"images\\/complaint\\/17129168199980.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-04-12', 2, NULL, NULL, '2024-04-12 04:43:39', '2024-04-12 04:43:40'),
(108, '13830929', '44', '2', '2', '28.6263858', '77.3774111', 'Noida', 'there is a problem in connection', '[{\"file_path\":\"images\\/complaint\\/17134345010654.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-04-18', 2, NULL, NULL, '2024-04-18 04:31:41', '2024-04-18 04:31:41'),
(109, '10487933', '44', '5', '1', '28.6269808', '77.3779574', 'Noida', 'there was a problem in connection', '[]', NULL, '2024-04-18', 2, NULL, NULL, '2024-04-18 05:05:44', '2024-04-18 05:05:44'),
(110, NULL, '87', '7', '6', NULL, NULL, NULL, 'Kindly Conduct Exam on Time.', '[]', NULL, '2024-04-24', 1, NULL, NULL, '2024-04-24 05:28:56', '2024-04-24 05:28:56'),
(111, '83783404', '87', '7', '6', '28.6263949', '77.3773935', 'cameeron', 'The exam was not done on time', '[{\"file_path\":\"images\\/complaint\\/17141073524231.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-04-26', 5, NULL, NULL, '2024-04-25 23:25:52', '2024-04-25 23:28:40'),
(112, '12760011', '87', '7', '6', '28.6264279', '77.3774246', 'cameeron', 'the exam were held late', '[{\"file_path\":\"images\\/complaint\\/17141281762206.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-04-26', 5, NULL, NULL, '2024-04-26 05:12:56', '2024-04-26 05:16:17'),
(113, '39644842', '87', '8', '6', '28.6264279', '77.3774246', 'cameeron', 'I want more computer', '[]', NULL, '2024-04-26', 2, NULL, NULL, '2024-04-26 05:19:06', '2024-04-26 05:19:13'),
(114, '35633474', '91', '7', '6', '28.6443326', '77.1885121', 'H-106', 'Please give me Course Details.', '[{\"file_path\":\"images\\/complaint\\/17181073216876.mp4\",\"file_type\":\"mp4\"}]', NULL, '2024-06-11', 2, NULL, NULL, '2024-06-11 06:32:01', '2024-06-11 06:33:37'),
(115, '52557356', '91', '7', '5', '28.7040592', '77.10249019999999', 'H-106', 'Whatvis software testing?', '[{\"file_path\":\"images\\/complaint\\/17181657007202.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-06-12', 2, NULL, NULL, '2024-06-11 22:45:00', '2024-06-11 22:46:20'),
(116, '69793542', '94', '6', '5', '4.1626135', '9.2908953', 'buea', 'i have wrong ca', '[]', NULL, '2024-06-16', 1, NULL, NULL, '2024-06-16 01:14:10', '2024-06-16 01:14:10'),
(117, '52957690', '91', '7', '6', '28.6263525', '77.3774301', 'H106', 'Test purpose', '[{\"file_path\":\"images\\/complaint\\/17186205330633.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-06-17', 2, NULL, NULL, '2024-06-17 05:05:33', '2024-06-17 05:07:13'),
(118, '82915455', '91', '7', '6', '28.626444', '77.3774527', 'h@06', 'Demo test', '[{\"file_path\":\"images\\/complaint\\/17186271074476.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-06-17', 4, NULL, NULL, '2024-06-17 06:55:07', '2024-07-17 00:14:23'),
(119, '10593003', '91', '7', '5', '28.6263718', '77.3774216', 'H106', 'Test 1', '[{\"file_path\":\"images\\/complaint\\/17187061539608.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-06-18', 2, NULL, NULL, '2024-06-18 04:52:33', '2024-06-19 05:52:26'),
(120, '37387297', '91', '7', '6', 'null', 'null', 'back side', 'test complaint', '[]', NULL, '2024-06-19', 4, NULL, NULL, '2024-06-19 05:56:21', '2024-07-09 05:33:54'),
(121, '70205637', '91', '7', '6', '28.6263104', '77.3774198', 'test', 't e s t test', '[{\"file_path\":\"images\\/complaint\\/17205229904486.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-07-09', 1, NULL, NULL, '2024-07-09 05:33:10', '2024-07-09 05:33:10'),
(122, '42776977', '91', '9', '5', '28.6263182', '77.3773973', 'na', 'test', '[{\"file_path\":\"images\\/complaint\\/17211950405930.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-07-17', 1, NULL, NULL, '2024-07-17 00:14:00', '2024-07-17 00:14:00'),
(123, '68137881', '91', '7', '6', '4.1576739', '9.2860908', 'german@gmail.com', 'compaintation', '[]', NULL, '2024-07-18', 3, NULL, NULL, '2024-07-18 12:10:53', '2024-07-18 12:41:38'),
(124, '31803658', '91', '8', '7', '4.1576739', '9.2860908', 'german@gmail.com', 'auxvtgjfjfthgk.   very gidjg tyt', '[{\"file_path\":\"images\\/complaint\\/17213257047722.jpg\",\"file_type\":\"jpg\"}]', NULL, '2024-07-18', 2, NULL, NULL, '2024-07-18 12:31:44', '2024-07-18 12:32:23'),
(125, '43682652', '91', '7', '6', '28.6263257', '77.3774146', 'na', 'exam time', '[]', NULL, '2024-07-25', 4, NULL, NULL, '2024-07-25 04:34:01', '2024-07-25 04:41:05'),
(126, '15504060', '91', '7', '6', '28.626309', '77.3774163', 'na', 'exam time', '[]', NULL, '2024-07-25', 1, NULL, NULL, '2024-07-25 04:40:49', '2024-07-25 04:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_assigns`
--

CREATE TABLE `complaint_assigns` (
  `id` bigint UNSIGNED NOT NULL,
  `complaint_id` int NOT NULL DEFAULT '0',
  `executive_id` int NOT NULL DEFAULT '0',
  `assign_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaint_assigns`
--

INSERT INTO `complaint_assigns` (`id`, `complaint_id`, `executive_id`, `assign_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-11-17', 1, '2023-11-17 07:33:56', '2023-11-17 07:33:56'),
(2, 2, 1, '2023-11-22', 5, '2023-11-22 07:26:14', '2023-11-22 07:31:38'),
(3, 2, 2, '2023-11-22', 5, '2023-11-22 07:31:38', '2023-11-22 07:47:06'),
(4, 2, 1, '2023-11-22', 5, '2023-11-22 07:47:06', '2023-11-22 07:47:28'),
(5, 2, 1, '2023-11-22', 5, '2023-11-22 07:47:28', '2023-11-22 07:47:37'),
(6, 2, 2, '2023-11-22', 3, '2023-11-22 07:47:37', '2023-11-22 10:23:33'),
(7, 2, 2, '2023-11-22', 2, '2023-11-22 07:48:00', '2023-11-22 10:12:24'),
(8, 3, 2, '2023-11-22', 4, '2023-11-22 09:49:35', '2023-11-22 10:07:17'),
(9, 3, 1, '2023-11-22', 4, '2023-11-22 09:50:04', '2023-11-22 10:07:17'),
(10, 3, 2, '2023-11-22', 4, '2023-11-22 09:50:42', '2023-11-22 10:07:17'),
(11, 4, 2, '2023-11-22', 1, '2023-11-22 10:40:05', '2023-11-22 10:40:05'),
(12, 8, 3, '2023-11-23', 1, '2023-11-23 05:55:15', '2023-11-23 05:55:15'),
(13, 7, 3, '2023-11-23', 2, '2023-11-23 05:57:51', '2023-11-23 05:59:03'),
(14, 6, 3, '2023-11-23', 2, '2023-11-23 05:57:59', '2023-11-23 05:58:49'),
(15, 13, 1, '2023-11-24', 5, '2023-11-24 10:26:51', '2023-11-24 10:28:43'),
(16, 13, 2, '2023-11-24', 1, '2023-11-24 10:28:43', '2023-11-24 10:28:43'),
(17, 18, 1, '2023-11-28', 1, '2023-11-28 12:54:24', '2023-11-28 12:54:24'),
(18, 19, 1, '2023-11-28', 4, '2023-11-28 12:54:49', '2023-12-04 10:26:45'),
(19, 20, 1, '2023-11-29', 5, '2023-11-29 10:51:00', '2023-11-29 11:01:11'),
(20, 20, 2, '2023-11-29', 3, '2023-11-29 11:01:11', '2023-11-29 11:55:22'),
(21, 21, 1, '2023-11-30', 5, '2023-11-30 05:42:45', '2023-11-30 06:00:29'),
(22, 21, 4, '2023-11-30', 2, '2023-11-30 06:00:29', '2023-11-30 06:03:39'),
(23, 22, 1, '2023-12-01', 1, '2023-12-01 12:00:38', '2023-12-01 12:00:38'),
(24, 23, 1, '2023-12-04', 5, '2023-12-04 11:29:06', '2023-12-04 11:40:56'),
(25, 23, 4, '2023-12-04', 5, '2023-12-04 11:40:56', '2023-12-05 06:51:29'),
(26, 23, 4, '2023-12-05', 5, '2023-12-05 06:51:29', '2023-12-08 07:00:35'),
(27, 24, 1, '2023-12-05', 4, '2023-12-05 09:11:17', '2023-12-05 09:34:13'),
(28, 25, 1, '2023-12-05', 1, '2023-12-05 09:12:22', '2023-12-05 09:12:22'),
(29, 26, 1, '2023-12-05', 1, '2023-12-05 09:21:57', '2023-12-05 09:21:57'),
(30, 27, 1, '2023-12-05', 4, '2023-12-05 09:22:41', '2023-12-05 09:33:59'),
(31, 28, 1, '2023-12-05', 1, '2023-12-05 11:49:17', '2023-12-05 11:49:17'),
(32, 29, 1, '2023-12-06', 4, '2023-12-06 06:58:20', '2023-12-06 07:34:20'),
(33, 30, 1, '2023-12-06', 1, '2023-12-06 09:55:52', '2023-12-06 09:55:52'),
(34, 31, 1, '2023-12-06', 1, '2023-12-06 10:23:21', '2023-12-06 10:23:21'),
(35, 32, 1, '2023-12-06', 1, '2023-12-06 10:23:51', '2023-12-06 10:23:51'),
(36, 33, 1, '2023-12-06', 1, '2023-12-06 10:24:14', '2023-12-06 10:24:14'),
(37, 34, 1, '2023-12-06', 1, '2023-12-06 10:47:06', '2023-12-06 10:47:06'),
(38, 35, 1, '2023-12-06', 4, '2023-12-06 10:51:42', '2023-12-07 12:46:04'),
(39, 35, 4, '2023-12-06', 4, '2023-12-06 11:31:51', '2023-12-07 12:46:04'),
(40, 36, 1, '2023-12-07', 4, '2023-12-07 12:18:26', '2023-12-11 04:39:04'),
(41, 37, 1, '2023-12-07', 4, '2023-12-07 12:21:01', '2023-12-11 04:38:42'),
(42, 38, 1, '2023-12-07', 1, '2023-12-07 12:44:32', '2023-12-07 12:44:32'),
(43, 39, 1, '2023-12-07', 1, '2023-12-07 20:16:03', '2023-12-07 20:16:03'),
(44, 40, 1, '2023-12-08', 5, '2023-12-08 06:24:26', '2023-12-08 06:53:55'),
(45, 40, 4, '2023-12-08', 2, '2023-12-08 06:53:55', '2024-01-02 11:20:16'),
(46, 23, 4, '2023-12-08', 3, '2023-12-08 07:00:35', '2023-12-08 07:11:13'),
(47, 41, 1, '2023-12-11', 4, '2023-12-11 05:37:11', '2023-12-11 05:38:54'),
(48, 42, 1, '2023-12-11', 1, '2023-12-11 05:42:39', '2023-12-11 05:42:39'),
(49, 43, 1, '2023-12-11', 4, '2023-12-11 07:20:13', '2023-12-11 07:23:45'),
(50, 44, 1, '2023-12-11', 1, '2023-12-11 07:21:05', '2023-12-11 07:21:05'),
(51, 45, 1, '2023-12-11', 1, '2023-12-11 07:21:37', '2023-12-11 07:21:37'),
(52, 47, 1, '2023-12-11', 4, '2023-12-11 07:54:09', '2023-12-11 07:54:25'),
(53, 48, 1, '2023-12-11', 4, '2023-12-11 07:55:08', '2023-12-11 07:55:17'),
(54, 49, 2, '2023-12-11', 4, '2023-12-11 11:05:16', '2023-12-11 11:14:16'),
(55, 50, 2, '2023-12-11', 1, '2023-12-11 11:15:32', '2023-12-11 11:15:32'),
(56, 51, 1, '2023-12-13', 4, '2023-12-13 10:37:32', '2023-12-13 10:37:44'),
(57, 52, 1, '2023-12-22', 3, '2023-12-22 06:25:09', '2024-01-15 09:00:25'),
(58, 52, 4, '2023-12-22', 3, '2023-12-22 06:34:50', '2024-01-02 10:46:00'),
(59, 53, 1, '2023-12-22', 5, '2023-12-22 12:26:06', '2023-12-28 11:02:09'),
(60, 53, 5, '2023-12-28', 5, '2023-12-28 11:02:09', '2023-12-28 11:02:18'),
(61, 53, 2, '2023-12-28', 4, '2023-12-28 11:02:18', '2024-03-01 05:16:49'),
(62, 54, 1, '2023-12-29', 5, '2023-12-29 05:56:27', '2023-12-29 06:00:24'),
(63, 54, 2, '2023-12-29', 4, '2023-12-29 06:00:24', '2023-12-29 06:11:10'),
(64, 55, 1, '2023-12-29', 4, '2023-12-29 06:05:07', '2023-12-29 07:21:30'),
(65, 54, 2, '2023-12-29', 5, '2023-12-29 06:06:03', '2023-12-29 06:06:44'),
(66, 54, 2, '2023-12-29', 2, '2023-12-29 06:06:44', '2023-12-29 06:10:43'),
(67, 56, 1, '2023-12-29', 4, '2023-12-29 07:20:14', '2024-01-15 04:55:27'),
(68, 57, 1, '2024-01-02', 1, '2024-01-02 11:59:50', '2024-01-02 11:59:50'),
(69, 58, 1, '2024-01-02', 1, '2024-01-02 12:01:28', '2024-01-02 12:01:28'),
(70, 59, 1, '2024-01-02', 2, '2024-01-02 12:12:30', '2024-01-02 12:15:14'),
(71, 60, 1, '2024-01-03', 1, '2024-01-03 10:49:26', '2024-01-03 10:49:26'),
(72, 61, 1, '2024-01-03', 1, '2024-01-03 10:59:02', '2024-01-03 10:59:02'),
(73, 62, 1, '2024-01-03', 4, '2024-01-03 11:00:34', '2024-01-12 07:39:44'),
(74, 62, 2, '2024-01-03', 4, '2024-01-03 11:07:25', '2024-01-12 07:39:44'),
(75, 62, 1, '2024-01-03', 4, '2024-01-03 11:09:21', '2024-01-12 07:39:44'),
(76, 63, 1, '2024-01-03', 4, '2024-01-03 11:58:57', '2024-01-12 07:38:05'),
(77, 64, 1, '2024-01-04', 5, '2024-01-04 07:15:38', '2024-01-04 07:30:21'),
(78, 64, 2, '2024-01-04', 2, '2024-01-04 07:30:21', '2024-01-12 07:43:14'),
(79, 65, 1, '2024-01-06', 4, '2024-01-06 21:23:21', '2024-01-06 21:27:07'),
(80, 66, 1, '2024-01-08', 1, '2024-01-08 11:33:51', '2024-01-08 11:33:51'),
(81, 67, 1, '2024-01-08', 2, '2024-01-08 11:38:51', '2024-01-15 11:49:12'),
(82, 68, 1, '2024-01-10', 4, '2024-01-10 06:32:05', '2024-01-10 09:25:52'),
(83, 68, 2, '2024-01-10', 4, '2024-01-10 07:15:37', '2024-01-10 09:25:52'),
(84, 68, 6, '2024-01-10', 4, '2024-01-10 07:21:37', '2024-01-10 09:25:52'),
(85, 69, 1, '2024-01-10', 1, '2024-01-10 09:29:45', '2024-01-10 09:29:45'),
(86, 70, 4, '2024-01-10', 4, '2024-01-10 09:53:31', '2024-01-22 05:44:25'),
(87, 71, 1, '2024-01-10', 2, '2024-01-10 12:56:29', '2024-01-15 11:48:15'),
(88, 72, 1, '2024-01-12', 4, '2024-01-12 07:17:24', '2024-01-12 07:58:14'),
(89, 73, 1, '2024-01-15', 3, '2024-01-15 11:32:55', '2024-01-15 11:47:24'),
(90, 74, 1, '2024-01-22', 5, '2024-01-22 04:45:31', '2024-01-22 04:48:19'),
(91, 74, 6, '2024-01-22', 2, '2024-01-22 04:48:19', '2024-01-22 05:54:20'),
(92, 75, 4, '2024-01-22', 4, '2024-01-22 05:43:45', '2024-01-22 05:44:34'),
(93, 76, 1, '2024-01-23', 5, '2024-01-23 05:15:57', '2024-01-23 06:19:57'),
(94, 76, 2, '2024-01-23', 3, '2024-01-23 06:19:57', '2024-01-23 06:36:37'),
(95, 77, 4, '2024-01-26', 4, '2024-01-26 03:43:58', '2024-01-26 03:49:09'),
(96, 78, 4, '2024-01-26', 1, '2024-01-26 04:24:22', '2024-01-26 04:24:22'),
(97, 79, 1, '2024-01-26', 1, '2024-01-26 09:05:13', '2024-01-26 09:05:13'),
(98, 80, 1, '2024-01-26', 5, '2024-01-26 09:15:34', '2024-01-26 09:16:32'),
(99, 80, 2, '2024-01-26', 5, '2024-01-26 09:16:32', '2024-01-26 09:21:45'),
(100, 81, 1, '2024-01-26', 4, '2024-01-26 09:20:44', '2024-01-26 09:20:55'),
(101, 80, 2, '2024-01-26', 2, '2024-01-26 09:21:45', '2024-01-26 09:37:43'),
(102, 82, 1, '2024-01-26', 4, '2024-01-26 09:42:30', '2024-01-26 09:42:40'),
(103, 83, 1, '2024-01-26', 4, '2024-01-26 09:58:54', '2024-01-26 09:59:09'),
(104, 84, 1, '2024-01-29', 1, '2024-01-29 09:13:04', '2024-01-29 09:13:04'),
(105, 85, 1, '2024-01-29', 4, '2024-01-29 09:26:42', '2024-01-29 09:39:00'),
(106, 86, 1, '2024-01-30', 5, '2024-01-30 11:26:30', '2024-01-30 11:39:00'),
(107, 86, 2, '2024-01-30', 1, '2024-01-30 11:39:00', '2024-01-30 11:39:00'),
(108, 87, 1, '2024-01-30', 5, '2024-01-30 12:21:29', '2024-01-30 12:25:17'),
(109, 87, 2, '2024-01-30', 5, '2024-01-30 12:25:17', '2024-01-30 12:26:13'),
(110, 87, 1, '2024-01-30', 1, '2024-01-30 12:26:13', '2024-01-30 12:26:13'),
(111, 88, 1, '2024-02-15', 5, '2024-02-15 11:24:55', '2024-02-15 11:27:22'),
(112, 88, 2, '2024-02-15', 3, '2024-02-15 11:27:22', '2024-03-01 04:58:25'),
(113, 89, 4, '2024-02-29', 1, '2024-02-29 07:01:45', '2024-02-29 07:01:45'),
(114, 90, 4, '2024-02-29', 1, '2024-02-29 07:23:40', '2024-02-29 07:23:40'),
(115, 91, 1, '2024-02-29', 1, '2024-02-29 09:06:03', '2024-02-29 09:06:03'),
(116, 92, 1, '2024-02-29', 3, '2024-02-29 10:05:22', '2024-02-29 10:31:19'),
(117, 93, 1, '2024-02-29', 4, '2024-02-29 10:17:11', '2024-02-29 11:39:59'),
(118, 94, 1, '2024-02-29', 6, '2024-02-29 10:48:49', '2024-02-29 10:50:52'),
(119, 95, 1, '2024-02-29', 4, '2024-02-29 11:17:20', '2024-02-29 11:43:14'),
(120, 96, 1, '2024-02-29', 4, '2024-02-29 11:31:46', '2024-02-29 11:40:14'),
(121, 97, 1, '2024-02-29', 4, '2024-02-29 11:49:00', '2024-02-29 12:27:48'),
(122, 98, 1, '2024-03-01', 1, '2024-03-01 04:41:30', '2024-03-01 04:41:30'),
(123, 99, 1, '2024-03-01', 1, '2024-03-01 04:46:24', '2024-03-01 04:46:24'),
(124, 100, 1, '2024-03-01', 1, '2024-03-01 04:50:26', '2024-03-01 04:50:26'),
(125, 101, 1, '2024-03-01', 1, '2024-03-01 04:56:50', '2024-03-01 04:56:50'),
(126, 102, 1, '2024-03-01', 1, '2024-03-01 04:57:09', '2024-03-01 04:57:09'),
(127, 103, 1, '2024-03-01', 1, '2024-03-01 04:57:25', '2024-03-01 04:57:25'),
(128, 104, 1, '2024-03-01', 1, '2024-03-01 04:58:02', '2024-03-01 04:58:02'),
(129, 105, 1, '2024-03-01', 1, '2024-03-01 04:59:04', '2024-03-01 04:59:04'),
(130, 106, 1, '2024-03-01', 1, '2024-03-01 05:05:35', '2024-03-01 05:05:35'),
(131, 107, 3, '2024-04-12', 1, '2024-04-12 04:43:40', '2024-04-12 04:43:40'),
(132, 108, 3, '2024-04-18', 1, '2024-04-18 04:31:41', '2024-04-18 04:31:41'),
(133, 109, 3, '2024-04-18', 1, '2024-04-18 05:05:44', '2024-04-18 05:05:44'),
(134, 111, 8, '2024-04-26', 6, '2024-04-25 23:26:40', '2024-04-25 23:28:40'),
(135, 112, 8, '2024-04-26', 6, '2024-04-26 05:13:04', '2024-04-26 05:16:17'),
(136, 113, 8, '2024-04-26', 1, '2024-04-26 05:19:13', '2024-04-26 05:19:13'),
(137, 114, 8, '2024-06-11', 1, '2024-06-11 06:33:37', '2024-06-11 06:33:37'),
(138, 115, 8, '2024-06-12', 1, '2024-06-11 22:46:19', '2024-06-11 22:46:19'),
(139, 117, 8, '2024-06-17', 2, '2024-06-17 05:07:13', '2024-06-17 05:08:39'),
(140, 118, 8, '2024-06-17', 4, '2024-06-17 06:55:50', '2024-07-17 00:14:23'),
(141, 119, 8, '2024-06-19', 1, '2024-06-19 05:52:26', '2024-06-19 05:52:26'),
(142, 120, 8, '2024-06-19', 4, '2024-06-19 05:56:51', '2024-07-09 05:33:54'),
(143, 123, 9, '2024-07-18', 3, '2024-07-18 12:28:40', '2024-07-18 12:41:38'),
(144, 124, 9, '2024-07-18', 1, '2024-07-18 12:32:23', '2024-07-18 12:32:23');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_assign_status`
--

CREATE TABLE `complaint_assign_status` (
  `id` bigint UNSIGNED NOT NULL,
  `complaint_id` int NOT NULL DEFAULT '0',
  `assign_complaint_id` int NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaint_assign_status`
--

INSERT INTO `complaint_assign_status` (`id`, `complaint_id`, `assign_complaint_id`, `date`, `time`, `remarks`, `media_file`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-11-17', '07:33:56', 'Assign', NULL, 1, '2023-11-17 07:33:56', '2023-11-17 07:33:56'),
(2, 2, 2, '2023-11-22', '07:26:14', 'Assign', NULL, 1, '2023-11-22 07:26:14', '2023-11-22 07:26:14'),
(3, 2, 3, '2023-11-22', '07:31:38', 'Assign', NULL, 1, '2023-11-22 07:31:38', '2023-11-22 07:31:38'),
(4, 2, 4, '2023-11-22', '07:47:06', 'Assign', NULL, 1, '2023-11-22 07:47:06', '2023-11-22 07:47:06'),
(5, 2, 5, '2023-11-22', '07:47:28', 'Assign', NULL, 1, '2023-11-22 07:47:28', '2023-11-22 07:47:28'),
(6, 2, 6, '2023-11-22', '07:47:37', 'Assign', NULL, 1, '2023-11-22 07:47:37', '2023-11-22 07:47:37'),
(7, 2, 7, '2023-11-22', '07:48:00', 'Assign', NULL, 1, '2023-11-22 07:48:00', '2023-11-22 07:48:00'),
(8, 3, 8, '2023-11-22', '09:49:35', 'Assign', NULL, 1, '2023-11-22 09:49:35', '2023-11-22 09:49:35'),
(9, 3, 9, '2023-11-22', '09:50:04', 'Assign', NULL, 1, '2023-11-22 09:50:04', '2023-11-22 09:50:04'),
(10, 3, 10, '2023-11-22', '09:50:42', 'Assign', NULL, 1, '2023-11-22 09:50:42', '2023-11-22 09:50:42'),
(11, 3, 10, '2023-11-22', '10:04:06', 'Ok, solved after 5 days', '[{\"file_path\":\"images\\/complaint\\/17006474463758.\",\"file_type\":\"\"}]', 2, '2023-11-22 10:04:06', '2023-11-22 10:04:06'),
(12, 3, 0, '2023-11-22', '10:07:17', 'Complaint cancel by user', NULL, 4, '2023-11-22 10:07:17', '2023-11-22 10:07:17'),
(13, 2, 7, '2023-11-22', '10:12:24', 'please wait', '[{\"file_path\":\"images\\/complaint\\/17006479447006.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17006479447011.\",\"file_type\":\"\"},{\"file_path\":\"images\\/complaint\\/17006479447046.mp3\",\"file_type\":\"mp3\"}]', 2, '2023-11-22 10:12:24', '2023-11-22 10:12:24'),
(14, 2, 6, '2023-11-22', '10:23:33', 'done', '[{\"file_path\":\"images\\/complaint\\/17006486130307.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17006486130312.\",\"file_type\":\"\"}]', 3, '2023-11-22 10:23:33', '2023-11-22 10:23:33'),
(15, 4, 11, '2023-11-22', '10:40:05', 'Assign', NULL, 1, '2023-11-22 10:40:05', '2023-11-22 10:40:05'),
(16, 8, 12, '2023-11-23', '05:55:15', 'Assign', NULL, 1, '2023-11-23 05:55:15', '2023-11-23 05:55:15'),
(17, 7, 13, '2023-11-23', '05:57:51', 'Assign', NULL, 1, '2023-11-23 05:57:51', '2023-11-23 05:57:51'),
(18, 6, 14, '2023-11-23', '05:57:59', 'Assign', NULL, 1, '2023-11-23 05:57:59', '2023-11-23 05:57:59'),
(19, 6, 14, '2023-11-23', '05:58:49', 'in process', '[]', 2, '2023-11-23 05:58:49', '2023-11-23 05:58:49'),
(20, 7, 13, '2023-11-23', '05:59:03', 'In Process', '[]', 2, '2023-11-23 05:59:03', '2023-11-23 05:59:03'),
(21, 13, 15, '2023-11-24', '10:26:51', 'Assign', NULL, 1, '2023-11-24 10:26:51', '2023-11-24 10:26:51'),
(22, 13, 16, '2023-11-24', '10:28:43', 'Assign', NULL, 1, '2023-11-24 10:28:43', '2023-11-24 10:28:43'),
(23, 18, 17, '2023-11-28', '12:54:24', 'Assign', NULL, 1, '2023-11-28 12:54:24', '2023-11-28 12:54:24'),
(24, 19, 18, '2023-11-28', '12:54:49', 'Assign', NULL, 1, '2023-11-28 12:54:49', '2023-11-28 12:54:49'),
(25, 20, 19, '2023-11-29', '10:51:00', 'Assign', NULL, 1, '2023-11-29 10:51:00', '2023-11-29 10:51:00'),
(26, 20, 20, '2023-11-29', '11:01:11', 'Assign', NULL, 1, '2023-11-29 11:01:11', '2023-11-29 11:01:11'),
(27, 20, 20, '2023-11-29', '11:37:02', 'work in progress', '[]', 2, '2023-11-29 11:37:02', '2023-11-29 11:37:02'),
(28, 20, 20, '2023-11-29', '11:50:09', 'work in progress', '[{\"file_path\":\"images\\/complaint\\/17012586098934.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17012586098939.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17012586098942.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17012586098945.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17012586099344.mp3\",\"file_type\":\"mp3\"}]', 2, '2023-11-29 11:50:09', '2023-11-29 11:50:09'),
(29, 20, 20, '2023-11-29', '11:55:22', 'complete', '[{\"file_path\":\"images\\/complaint\\/17012589227194.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17012589227198.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17012589227203.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17012589227205.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17012589227218.mp3\",\"file_type\":\"mp3\"}]', 3, '2023-11-29 11:55:22', '2023-11-29 11:55:22'),
(30, 21, 21, '2023-11-30', '05:42:45', 'Assign', NULL, 1, '2023-11-30 05:42:45', '2023-11-30 05:42:45'),
(31, 20, 0, '2023-11-30', '05:56:14', 'work not complete', '[{\"file_path\":\"images\\/complaint\\/17013237740972.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17013237740976.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17013237740980.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17013237740982.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17013237741012.mp3\",\"file_type\":\"mp3\"}]', 0, '2023-11-30 05:56:14', '2023-11-30 05:56:14'),
(32, 21, 22, '2023-11-30', '06:00:29', 'Assign', NULL, 1, '2023-11-30 06:00:29', '2023-11-30 06:00:29'),
(33, 21, 22, '2023-11-30', '06:03:39', 'xyz', '[{\"file_path\":\"images\\/complaint\\/17013242190508.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17013242190512.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17013242190516.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17013242190518.mp4\",\"file_type\":\"mp4\"}]', 2, '2023-11-30 06:03:39', '2023-11-30 06:03:39'),
(34, 22, 23, '2023-12-01', '12:00:38', 'Assign', NULL, 1, '2023-12-01 12:00:38', '2023-12-01 12:00:38'),
(35, 19, 0, '2023-12-04', '10:26:45', 'Complaint cancel by user', NULL, 4, '2023-12-04 10:26:45', '2023-12-04 10:26:45'),
(36, 23, 24, '2023-12-04', '11:29:06', 'Assign', NULL, 1, '2023-12-04 11:29:06', '2023-12-04 11:29:06'),
(37, 23, 25, '2023-12-04', '11:40:56', 'Assign', NULL, 1, '2023-12-04 11:40:56', '2023-12-04 11:40:56'),
(38, 23, 25, '2023-12-04', '11:42:06', 'working in progress', '[{\"file_path\":\"images\\/complaint\\/17016901268027.jpg\",\"file_type\":\"jpg\"}]', 2, '2023-12-04 11:42:06', '2023-12-04 11:42:06'),
(39, 23, 26, '2023-12-05', '06:51:29', 'Assign', NULL, 1, '2023-12-05 06:51:29', '2023-12-05 06:51:29'),
(40, 23, 26, '2023-12-05', '06:53:34', 'Aaj Aaj', '[{\"file_path\":\"images\\/complaint\\/17017592144033.png\",\"file_type\":\"png\"}]', 3, '2023-12-05 06:53:34', '2023-12-05 06:53:34'),
(41, 24, 27, '2023-12-05', '09:11:17', 'Assign', NULL, 1, '2023-12-05 09:11:17', '2023-12-05 09:11:17'),
(42, 25, 28, '2023-12-05', '09:12:22', 'Assign', NULL, 1, '2023-12-05 09:12:22', '2023-12-05 09:12:22'),
(43, 26, 29, '2023-12-05', '09:21:58', 'Assign', NULL, 1, '2023-12-05 09:21:58', '2023-12-05 09:21:58'),
(44, 27, 30, '2023-12-05', '09:22:41', 'Assign', NULL, 1, '2023-12-05 09:22:41', '2023-12-05 09:22:41'),
(45, 27, 0, '2023-12-05', '09:33:59', 'Complaint cancel by user', NULL, 4, '2023-12-05 09:33:59', '2023-12-05 09:33:59'),
(46, 24, 0, '2023-12-05', '09:34:13', 'Complaint cancel by user', NULL, 4, '2023-12-05 09:34:13', '2023-12-05 09:34:13'),
(47, 28, 31, '2023-12-05', '11:49:17', 'Assign', NULL, 1, '2023-12-05 11:49:17', '2023-12-05 11:49:17'),
(48, 29, 32, '2023-12-06', '06:58:20', 'Assign', NULL, 1, '2023-12-06 06:58:20', '2023-12-06 06:58:20'),
(49, 29, 0, '2023-12-06', '07:34:20', 'Complaint cancel by user', NULL, 4, '2023-12-06 07:34:20', '2023-12-06 07:34:20'),
(50, 30, 33, '2023-12-06', '09:55:52', 'Assign', NULL, 1, '2023-12-06 09:55:52', '2023-12-06 09:55:52'),
(51, 31, 34, '2023-12-06', '10:23:21', 'Assign', NULL, 1, '2023-12-06 10:23:21', '2023-12-06 10:23:21'),
(52, 32, 35, '2023-12-06', '10:23:51', 'Assign', NULL, 1, '2023-12-06 10:23:51', '2023-12-06 10:23:51'),
(53, 33, 36, '2023-12-06', '10:24:14', 'Assign', NULL, 1, '2023-12-06 10:24:14', '2023-12-06 10:24:14'),
(54, 34, 37, '2023-12-06', '10:47:06', 'Assign', NULL, 1, '2023-12-06 10:47:06', '2023-12-06 10:47:06'),
(55, 35, 38, '2023-12-06', '10:51:42', 'Assign', NULL, 1, '2023-12-06 10:51:42', '2023-12-06 10:51:42'),
(56, 35, 39, '2023-12-06', '11:31:51', 'Assign', NULL, 1, '2023-12-06 11:31:51', '2023-12-06 11:31:51'),
(57, 35, 39, '2023-12-06', '11:33:02', 'Aaj', '[{\"file_path\":\"images\\/complaint\\/17018623826825.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17018623826829.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17018623826832.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17018623826845.mp3\",\"file_type\":\"mp3\"}]', 2, '2023-12-06 11:33:02', '2023-12-06 11:33:02'),
(58, 36, 40, '2023-12-07', '12:18:26', 'Assign', NULL, 1, '2023-12-07 12:18:26', '2023-12-07 12:18:26'),
(59, 37, 41, '2023-12-07', '12:21:01', 'Assign', NULL, 1, '2023-12-07 12:21:01', '2023-12-07 12:21:01'),
(60, 38, 42, '2023-12-07', '12:44:32', 'Assign', NULL, 1, '2023-12-07 12:44:32', '2023-12-07 12:44:32'),
(61, 35, 0, '2023-12-07', '12:45:51', 'Complaint cancel by user', NULL, 4, '2023-12-07 12:45:51', '2023-12-07 12:45:51'),
(62, 35, 0, '2023-12-07', '12:46:04', 'Complaint cancel by user', NULL, 4, '2023-12-07 12:46:04', '2023-12-07 12:46:04'),
(63, 39, 43, '2023-12-07', '20:16:03', 'Assign', NULL, 1, '2023-12-07 20:16:03', '2023-12-07 20:16:03'),
(64, 40, 44, '2023-12-08', '06:24:26', 'Assign', NULL, 1, '2023-12-08 06:24:26', '2023-12-08 06:24:26'),
(65, 40, 0, '2023-12-08', '06:26:20', 'Complaint cancel by user', NULL, 4, '2023-12-08 06:26:20', '2023-12-08 06:26:20'),
(66, 40, 0, '2023-12-08', '06:41:42', 'Complaint cancel by user', NULL, 4, '2023-12-08 06:41:42', '2023-12-08 06:41:42'),
(67, 40, 45, '2023-12-08', '06:53:55', 'Assign', NULL, 1, '2023-12-08 06:53:55', '2023-12-08 06:53:55'),
(68, 23, 0, '2023-12-08', '06:59:25', 'problem solved nhi hui h', '[{\"file_path\":\"images\\/complaint\\/17020187653337.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17020187653342.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17020187653345.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17020187653349.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17020187653361.mp3\",\"file_type\":\"mp3\"}]', 0, '2023-12-08 06:59:25', '2023-12-08 06:59:25'),
(69, 23, 46, '2023-12-08', '07:00:35', 'Assign', NULL, 1, '2023-12-08 07:00:35', '2023-12-08 07:00:35'),
(70, 23, 46, '2023-12-08', '07:11:13', 'complete', '[{\"file_path\":\"images\\/complaint\\/17020194737258.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17020194737262.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17020194737275.mp3\",\"file_type\":\"mp3\"}]', 3, '2023-12-08 07:11:13', '2023-12-08 07:11:13'),
(71, 37, 0, '2023-12-11', '04:38:42', 'Complaint cancel by user', NULL, 4, '2023-12-11 04:38:42', '2023-12-11 04:38:42'),
(72, 36, 0, '2023-12-11', '04:39:04', 'Complaint cancel by user', NULL, 4, '2023-12-11 04:39:04', '2023-12-11 04:39:04'),
(73, 41, 47, '2023-12-11', '05:37:11', 'Assign', NULL, 1, '2023-12-11 05:37:11', '2023-12-11 05:37:11'),
(74, 41, 0, '2023-12-11', '05:38:54', 'Complaint cancel by user', NULL, 4, '2023-12-11 05:38:54', '2023-12-11 05:38:54'),
(75, 42, 48, '2023-12-11', '05:42:39', 'Assign', NULL, 1, '2023-12-11 05:42:39', '2023-12-11 05:42:39'),
(76, 43, 49, '2023-12-11', '07:20:13', 'Assign', NULL, 1, '2023-12-11 07:20:13', '2023-12-11 07:20:13'),
(77, 44, 50, '2023-12-11', '07:21:05', 'Assign', NULL, 1, '2023-12-11 07:21:05', '2023-12-11 07:21:05'),
(78, 45, 51, '2023-12-11', '07:21:37', 'Assign', NULL, 1, '2023-12-11 07:21:37', '2023-12-11 07:21:37'),
(79, 43, 0, '2023-12-11', '07:23:45', 'Complaint cancel by user', NULL, 4, '2023-12-11 07:23:45', '2023-12-11 07:23:45'),
(80, 47, 52, '2023-12-11', '07:54:09', 'Assign', NULL, 1, '2023-12-11 07:54:09', '2023-12-11 07:54:09'),
(81, 47, 0, '2023-12-11', '07:54:25', 'Complaint cancel by user', NULL, 4, '2023-12-11 07:54:25', '2023-12-11 07:54:25'),
(82, 48, 53, '2023-12-11', '07:55:08', 'Assign', NULL, 1, '2023-12-11 07:55:08', '2023-12-11 07:55:08'),
(83, 48, 0, '2023-12-11', '07:55:17', 'Complaint cancel by user', NULL, 4, '2023-12-11 07:55:17', '2023-12-11 07:55:17'),
(84, 49, 54, '2023-12-11', '11:05:16', 'Assign', NULL, 1, '2023-12-11 11:05:16', '2023-12-11 11:05:16'),
(85, 49, 0, '2023-12-11', '11:14:16', 'Complaint cancel by user', NULL, 4, '2023-12-11 11:14:16', '2023-12-11 11:14:16'),
(86, 50, 55, '2023-12-11', '11:15:32', 'Assign', NULL, 1, '2023-12-11 11:15:32', '2023-12-11 11:15:32'),
(87, 51, 56, '2023-12-13', '10:37:32', 'Assign', NULL, 1, '2023-12-13 10:37:32', '2023-12-13 10:37:32'),
(88, 51, 0, '2023-12-13', '10:37:44', 'Complaint cancel by user', NULL, 4, '2023-12-13 10:37:44', '2023-12-13 10:37:44'),
(89, 52, 57, '2023-12-22', '06:25:09', 'Assign', NULL, 1, '2023-12-22 06:25:09', '2023-12-22 06:25:09'),
(90, 52, 58, '2023-12-22', '06:34:50', 'Assign', NULL, 1, '2023-12-22 06:34:50', '2023-12-22 06:34:50'),
(91, 53, 59, '2023-12-22', '12:26:06', 'Assign', NULL, 1, '2023-12-22 12:26:06', '2023-12-22 12:26:06'),
(92, 53, 60, '2023-12-28', '11:02:09', 'Assign', NULL, 1, '2023-12-28 11:02:09', '2023-12-28 11:02:09'),
(93, 53, 61, '2023-12-28', '11:02:18', 'Assign', NULL, 1, '2023-12-28 11:02:18', '2023-12-28 11:02:18'),
(94, 54, 62, '2023-12-29', '05:56:27', 'Assign', NULL, 1, '2023-12-29 05:56:27', '2023-12-29 05:56:27'),
(95, 54, 63, '2023-12-29', '06:00:24', 'Assign', NULL, 1, '2023-12-29 06:00:24', '2023-12-29 06:00:24'),
(96, 55, 64, '2023-12-29', '06:05:07', 'Assign', NULL, 1, '2023-12-29 06:05:07', '2023-12-29 06:05:07'),
(97, 54, 65, '2023-12-29', '06:06:03', 'Assign', NULL, 1, '2023-12-29 06:06:03', '2023-12-29 06:06:03'),
(98, 54, 66, '2023-12-29', '06:06:44', 'Assign', NULL, 1, '2023-12-29 06:06:44', '2023-12-29 06:06:44'),
(99, 54, 66, '2023-12-29', '06:10:28', 'your work is inprogress', '[{\"file_path\":\"images\\/complaint\\/17038302285945.png\",\"file_type\":\"png\"}]', 2, '2023-12-29 06:10:28', '2023-12-29 06:10:28'),
(100, 54, 66, '2023-12-29', '06:10:32', 'your work is inprogress', '[{\"file_path\":\"images\\/complaint\\/17038302325472.png\",\"file_type\":\"png\"}]', 2, '2023-12-29 06:10:32', '2023-12-29 06:10:32'),
(101, 54, 66, '2023-12-29', '06:10:43', 'your work is inprogress', '[]', 2, '2023-12-29 06:10:43', '2023-12-29 06:10:43'),
(102, 54, 63, '2023-12-29', '06:11:03', 'in progress', '[]', 2, '2023-12-29 06:11:03', '2023-12-29 06:11:03'),
(103, 54, 63, '2023-12-29', '06:11:07', 'in progress', '[]', 3, '2023-12-29 06:11:07', '2023-12-29 06:11:07'),
(104, 54, 63, '2023-12-29', '06:11:10', 'in progress', '[]', 4, '2023-12-29 06:11:10', '2023-12-29 06:11:10'),
(105, 55, 0, '2023-12-29', '06:13:38', 'what is the status of this', '[]', 0, '2023-12-29 06:13:38', '2023-12-29 06:13:38'),
(106, 56, 67, '2023-12-29', '07:20:14', 'Assign', NULL, 1, '2023-12-29 07:20:14', '2023-12-29 07:20:14'),
(107, 55, 0, '2023-12-29', '07:20:27', 'Complaint cancel by user', NULL, 4, '2023-12-29 07:20:27', '2023-12-29 07:20:27'),
(108, 55, 0, '2023-12-29', '07:20:49', 'Complaint cancel by user', NULL, 4, '2023-12-29 07:20:49', '2023-12-29 07:20:49'),
(109, 55, 0, '2023-12-29', '07:21:30', 'Complaint cancel by user', NULL, 4, '2023-12-29 07:21:30', '2023-12-29 07:21:30'),
(110, 56, 67, '2023-12-29', '07:31:48', 'Working process', '[{\"file_path\":\"images\\/complaint\\/17038351084837.png\",\"file_type\":\"png\"}]', 2, '2023-12-29 07:31:48', '2023-12-29 07:31:48'),
(111, 56, 67, '2023-12-29', '07:33:12', 'Working process', '[{\"file_path\":\"images\\/complaint\\/17038351920571.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17038351920576.mp4\",\"file_type\":\"mp4\"}]', 2, '2023-12-29 07:33:12', '2023-12-29 07:33:12'),
(112, 56, 67, '2023-12-29', '07:36:14', '', '[{\"file_path\":\"images\\/complaint\\/17038353740953.png\",\"file_type\":\"png\"}]', 2, '2023-12-29 07:36:14', '2023-12-29 07:36:14'),
(113, 56, 67, '2023-12-29', '07:38:14', '', '[{\"file_path\":\"images\\/complaint\\/17038354940576.png\",\"file_type\":\"png\"}]', 2, '2023-12-29 07:38:14', '2023-12-29 07:38:14'),
(114, 56, 67, '2023-12-29', '07:38:54', '', '[{\"file_path\":\"images\\/complaint\\/17038355346732.png\",\"file_type\":\"png\"}]', 2, '2023-12-29 07:38:54', '2023-12-29 07:38:54'),
(115, 56, 67, '2023-12-29', '07:39:01', '', '[{\"file_path\":\"images\\/complaint\\/17038355414259.png\",\"file_type\":\"png\"}]', 3, '2023-12-29 07:39:01', '2023-12-29 07:39:01'),
(116, 52, 58, '2024-01-02', '10:12:28', 'resolved', '[]', 3, '2024-01-02 10:12:28', '2024-01-02 10:12:28'),
(117, 52, 58, '2024-01-02', '10:46:00', 'Resolved', '[]', 3, '2024-01-02 10:46:00', '2024-01-02 10:46:00'),
(118, 40, 45, '2024-01-02', '11:20:15', 'in progress', '[{\"file_path\":\"images\\/complaint\\/17041944150718.mp4\",\"file_type\":\"mp4\"}]', 2, '2024-01-02 11:20:15', '2024-01-02 11:20:15'),
(119, 40, 45, '2024-01-02', '11:20:16', 'in progress', '[{\"file_path\":\"images\\/complaint\\/17041944162777.mp4\",\"file_type\":\"mp4\"}]', 2, '2024-01-02 11:20:16', '2024-01-02 11:20:16'),
(120, 57, 68, '2024-01-02', '11:59:50', 'Assign', NULL, 1, '2024-01-02 11:59:50', '2024-01-02 11:59:50'),
(121, 58, 69, '2024-01-02', '12:01:28', 'Assign', NULL, 1, '2024-01-02 12:01:28', '2024-01-02 12:01:28'),
(122, 59, 70, '2024-01-02', '12:12:30', 'Assign', NULL, 1, '2024-01-02 12:12:30', '2024-01-02 12:12:30'),
(123, 59, 70, '2024-01-02', '12:15:14', 'in process', '[{\"file_path\":\"images\\/complaint\\/17041977144848.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17041977144855.mp3\",\"file_type\":\"mp3\"}]', 2, '2024-01-02 12:15:14', '2024-01-02 12:15:14'),
(124, 60, 71, '2024-01-03', '10:49:26', 'Assign', NULL, 1, '2024-01-03 10:49:26', '2024-01-03 10:49:26'),
(125, 61, 72, '2024-01-03', '10:59:02', 'Assign', NULL, 1, '2024-01-03 10:59:02', '2024-01-03 10:59:02'),
(126, 62, 73, '2024-01-03', '11:00:34', 'Assign', NULL, 1, '2024-01-03 11:00:34', '2024-01-03 11:00:34'),
(127, 62, 74, '2024-01-03', '11:07:25', 'Assign', NULL, 1, '2024-01-03 11:07:25', '2024-01-03 11:07:25'),
(128, 62, 75, '2024-01-03', '11:09:21', 'Assign', NULL, 1, '2024-01-03 11:09:21', '2024-01-03 11:09:21'),
(129, 62, 75, '2024-01-03', '11:44:29', 'waiting', '[{\"file_path\":\"images\\/complaint\\/17042822690418.png\",\"file_type\":\"png\"}]', 2, '2024-01-03 11:44:29', '2024-01-03 11:44:29'),
(130, 62, 75, '2024-01-03', '11:44:36', 'waiting', '[{\"file_path\":\"images\\/complaint\\/17042822765180.png\",\"file_type\":\"png\"}]', 2, '2024-01-03 11:44:36', '2024-01-03 11:44:36'),
(131, 62, 75, '2024-01-03', '11:45:06', 'waiting', '[]', 2, '2024-01-03 11:45:06', '2024-01-03 11:45:06'),
(132, 62, 0, '2024-01-03', '11:54:19', 'Please complete this process ASAP', '[]', 0, '2024-01-03 11:54:19', '2024-01-03 11:54:19'),
(133, 63, 76, '2024-01-03', '11:58:57', 'Assign', NULL, 1, '2024-01-03 11:58:57', '2024-01-03 11:58:57'),
(134, 62, 74, '2024-01-03', '12:02:50', 'working', '[{\"file_path\":\"images\\/complaint\\/17042833700366.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17042833700369.mp4\",\"file_type\":\"mp4\"}]', 2, '2024-01-03 12:02:50', '2024-01-03 12:02:50'),
(135, 62, 74, '2024-01-03', '12:03:59', 'test', '[{\"file_path\":\"images\\/complaint\\/17042834398253.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17042834398257.mp4\",\"file_type\":\"mp4\"}]', 2, '2024-01-03 12:03:59', '2024-01-03 12:03:59'),
(136, 62, 74, '2024-01-03', '12:05:30', 'test', '[{\"file_path\":\"images\\/complaint\\/17042835300884.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17042835300888.mp4\",\"file_type\":\"mp4\"}]', 2, '2024-01-03 12:05:30', '2024-01-03 12:05:30'),
(137, 62, 74, '2024-01-03', '12:09:28', 'test', '[{\"file_path\":\"images\\/complaint\\/17042837681027.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17042837681030.mp4\",\"file_type\":\"mp4\"}]', 3, '2024-01-03 12:09:28', '2024-01-03 12:09:28'),
(138, 64, 77, '2024-01-04', '07:15:38', 'Assign', NULL, 1, '2024-01-04 07:15:38', '2024-01-04 07:15:38'),
(139, 64, 78, '2024-01-04', '07:30:21', 'Assign', NULL, 1, '2024-01-04 07:30:21', '2024-01-04 07:30:21'),
(140, 65, 79, '2024-01-06', '21:23:21', 'Assign', NULL, 1, '2024-01-06 21:23:21', '2024-01-06 21:23:21'),
(141, 65, 0, '2024-01-06', '21:25:19', 'ghgg', '[]', 0, '2024-01-06 21:25:19', '2024-01-06 21:25:19'),
(142, 65, 0, '2024-01-06', '21:27:07', 'Complaint cancel by user', NULL, 4, '2024-01-06 21:27:07', '2024-01-06 21:27:07'),
(143, 66, 80, '2024-01-08', '11:33:51', 'Assign', NULL, 1, '2024-01-08 11:33:51', '2024-01-08 11:33:51'),
(144, 67, 81, '2024-01-08', '11:38:51', 'Assign', NULL, 1, '2024-01-08 11:38:51', '2024-01-08 11:38:51'),
(145, 63, 0, '2024-01-10', '06:24:51', 'Complaint cancel by user', NULL, 4, '2024-01-10 06:24:51', '2024-01-10 06:24:51'),
(146, 68, 82, '2024-01-10', '06:32:05', 'Assign', NULL, 1, '2024-01-10 06:32:05', '2024-01-10 06:32:05'),
(147, 68, 0, '2024-01-10', '07:03:53', 'hi, there are very critical condition so please take action ASAP', '[{\"file_path\":\"images\\/complaint\\/17048702339340.jpg\",\"file_type\":\"jpg\"}]', 0, '2024-01-10 07:03:53', '2024-01-10 07:03:53'),
(148, 68, 83, '2024-01-10', '07:15:37', 'Assign', NULL, 1, '2024-01-10 07:15:37', '2024-01-10 07:15:37'),
(149, 68, 84, '2024-01-10', '07:21:37', 'Assign', NULL, 1, '2024-01-10 07:21:37', '2024-01-10 07:21:37'),
(150, 68, 84, '2024-01-10', '07:30:11', 'ok', '[{\"file_path\":\"images\\/complaint\\/17048718113897.jpg\",\"file_type\":\"jpg\"}]', 2, '2024-01-10 07:30:11', '2024-01-10 07:30:11'),
(151, 68, 0, '2024-01-10', '07:39:31', 'there are no any response', '[{\"file_path\":\"images\\/complaint\\/17048723713188.mp3\",\"file_type\":\"mp3\"}]', 0, '2024-01-10 07:39:31', '2024-01-10 07:39:31'),
(152, 68, 84, '2024-01-10', '07:42:05', 'solved', '[{\"file_path\":\"images\\/complaint\\/17048725257888.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17048725257892.mp3\",\"file_type\":\"mp3\"}]', 3, '2024-01-10 07:42:05', '2024-01-10 07:42:05'),
(153, 68, 84, '2024-01-10', '07:43:43', 'disqualified', '[{\"file_path\":\"images\\/complaint\\/17048726236788.png\",\"file_type\":\"png\"}]', 4, '2024-01-10 07:43:43', '2024-01-10 07:43:43'),
(154, 68, 84, '2024-01-10', '07:45:36', 'test', '[{\"file_path\":\"images\\/complaint\\/17048727360635.png\",\"file_type\":\"png\"}]', 2, '2024-01-10 07:45:36', '2024-01-10 07:45:36'),
(155, 68, 0, '2024-01-10', '09:24:40', 'Complaint cancel by user', NULL, 4, '2024-01-10 09:24:40', '2024-01-10 09:24:40'),
(156, 68, 0, '2024-01-10', '09:25:35', 'Complaint cancel by user', NULL, 4, '2024-01-10 09:25:35', '2024-01-10 09:25:35'),
(157, 68, 0, '2024-01-10', '09:25:52', 'Complaint cancel by user', NULL, 4, '2024-01-10 09:25:52', '2024-01-10 09:25:52'),
(158, 69, 85, '2024-01-10', '09:29:45', 'Assign', NULL, 1, '2024-01-10 09:29:45', '2024-01-10 09:29:45'),
(159, 70, 86, '2024-01-10', '09:53:31', 'Assign', NULL, 1, '2024-01-10 09:53:31', '2024-01-10 09:53:31'),
(160, 71, 87, '2024-01-10', '12:56:29', 'Assign', NULL, 1, '2024-01-10 12:56:29', '2024-01-10 12:56:29'),
(161, 72, 88, '2024-01-12', '07:17:24', 'Assign', NULL, 1, '2024-01-12 07:17:24', '2024-01-12 07:17:24'),
(162, 63, 0, '2024-01-12', '07:38:05', 'Complaint cancel by user', NULL, 4, '2024-01-12 07:38:05', '2024-01-12 07:38:05'),
(163, 62, 0, '2024-01-12', '07:39:44', 'Complaint cancel by user', NULL, 4, '2024-01-12 07:39:44', '2024-01-12 07:39:44'),
(164, 62, 0, '2024-01-12', '07:39:58', 'na', '[{\"file_path\":\"images\\/complaint\\/17050451989124.jpg\",\"file_type\":\"jpg\"}]', 0, '2024-01-12 07:39:58', '2024-01-12 07:39:58'),
(165, 64, 78, '2024-01-12', '07:43:14', 'na', '[{\"file_path\":\"images\\/complaint\\/17050453940569.jpg\",\"file_type\":\"jpg\"}]', 2, '2024-01-12 07:43:14', '2024-01-12 07:43:14'),
(166, 72, 88, '2024-01-12', '07:58:14', 'cancelled', '[]', 4, '2024-01-12 07:58:14', '2024-01-12 07:58:14'),
(167, 70, 0, '2024-01-12', '08:57:48', 'Complaint cancel by user', NULL, 4, '2024-01-12 08:57:48', '2024-01-12 08:57:48'),
(168, 56, 67, '2024-01-15', '04:55:27', 'problem', '[]', 4, '2024-01-15 04:55:27', '2024-01-15 04:55:27'),
(169, 52, 57, '2024-01-15', '09:00:25', 'rite', '[{\"file_path\":\"images\\/complaint\\/17053092250753.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17053092250757.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17053092250762.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17053092250772.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17053092250848.mp3\",\"file_type\":\"mp3\"}]', 3, '2024-01-15 09:00:25', '2024-01-15 09:00:25'),
(170, 71, 87, '2024-01-15', '09:03:13', 're', '[{\"file_path\":\"images\\/complaint\\/17053093937297.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17053093937300.mp4\",\"file_type\":\"mp4\"}]', 2, '2024-01-15 09:03:13', '2024-01-15 09:03:13'),
(171, 71, 87, '2024-01-15', '09:05:03', 'working', '[{\"file_path\":\"images\\/complaint\\/17053095036392.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17053095036395.mp4\",\"file_type\":\"mp4\"}]', 2, '2024-01-15 09:05:03', '2024-01-15 09:05:03'),
(172, 73, 89, '2024-01-15', '11:32:55', 'Assign', NULL, 1, '2024-01-15 11:32:55', '2024-01-15 11:32:55'),
(173, 73, 0, '2024-01-15', '11:34:44', 'What happen', '[]', 0, '2024-01-15 11:34:44', '2024-01-15 11:34:44'),
(174, 73, 89, '2024-01-15', '11:47:24', 'I resolved your issue, now you can do', '[]', 3, '2024-01-15 11:47:24', '2024-01-15 11:47:24'),
(175, 71, 87, '2024-01-15', '11:48:15', 'we can not resolve your issue', '[]', 2, '2024-01-15 11:48:15', '2024-01-15 11:48:15'),
(176, 67, 81, '2024-01-15', '11:49:12', 'we can not resolve your issue', '[]', 2, '2024-01-15 11:49:12', '2024-01-15 11:49:12'),
(177, 71, 0, '2024-01-15', '11:50:34', 'What happen, why can you not resolve my issue', '[]', 0, '2024-01-15 11:50:34', '2024-01-15 11:50:34'),
(178, 67, 0, '2024-01-15', '11:50:50', 'Ehy?????', '[]', 0, '2024-01-15 11:50:50', '2024-01-15 11:50:50'),
(179, 74, 90, '2024-01-22', '04:45:31', 'Assign', NULL, 1, '2024-01-22 04:45:31', '2024-01-22 04:45:31'),
(180, 74, 91, '2024-01-22', '04:48:19', 'Assign', NULL, 1, '2024-01-22 04:48:19', '2024-01-22 04:48:19'),
(181, 74, 91, '2024-01-22', '05:16:14', 'solv', '[{\"file_path\":\"images\\/complaint\\/17059005742560.jpg\",\"file_type\":\"jpg\"}]', 3, '2024-01-22 05:16:14', '2024-01-22 05:16:14'),
(182, 74, 91, '2024-01-22', '05:37:19', 'resolve', '[{\"file_path\":\"images\\/complaint\\/17059018390409.jpg\",\"file_type\":\"jpg\"}]', 3, '2024-01-22 05:37:19', '2024-01-22 05:37:19'),
(183, 75, 92, '2024-01-22', '05:43:45', 'Assign', NULL, 1, '2024-01-22 05:43:45', '2024-01-22 05:43:45'),
(184, 70, 0, '2024-01-22', '05:44:25', 'Complaint cancel by user', NULL, 4, '2024-01-22 05:44:25', '2024-01-22 05:44:25'),
(185, 75, 0, '2024-01-22', '05:44:34', 'Complaint cancel by user', NULL, 4, '2024-01-22 05:44:34', '2024-01-22 05:44:34'),
(186, 74, 91, '2024-01-22', '05:54:20', 'in progress', '[]', 2, '2024-01-22 05:54:20', '2024-01-22 05:54:20'),
(187, 76, 93, '2024-01-23', '05:15:57', 'Assign', NULL, 1, '2024-01-23 05:15:57', '2024-01-23 05:15:57'),
(188, 76, 0, '2024-01-23', '05:23:37', 'hi, what is the status of this', '[{\"file_path\":\"images\\/complaint\\/17059874174919.png\",\"file_type\":\"png\"}]', 0, '2024-01-23 05:23:37', '2024-01-23 05:23:37'),
(189, 76, 94, '2024-01-23', '06:19:57', 'Assign', NULL, 1, '2024-01-23 06:19:57', '2024-01-23 06:19:57'),
(190, 76, 94, '2024-01-23', '06:36:37', 'done', '[{\"file_path\":\"images\\/complaint\\/17059917973858.png\",\"file_type\":\"png\"},{\"file_path\":\"images\\/complaint\\/17059917973872.mp4\",\"file_type\":\"mp4\"},{\"file_path\":\"images\\/complaint\\/17059917973971.mp3\",\"file_type\":\"mp3\"}]', 3, '2024-01-23 06:36:37', '2024-01-23 06:36:37'),
(191, 77, 95, '2024-01-26', '03:43:58', 'Assign', NULL, 1, '2024-01-26 03:43:58', '2024-01-26 03:43:58'),
(192, 77, 0, '2024-01-26', '03:45:30', 'hu', '[]', 0, '2024-01-26 03:45:30', '2024-01-26 03:45:30'),
(193, 77, 0, '2024-01-26', '03:49:09', 'Complaint cancel by user', NULL, 4, '2024-01-26 03:49:09', '2024-01-26 03:49:09'),
(194, 78, 96, '2024-01-26', '04:24:22', 'Assign', NULL, 1, '2024-01-26 04:24:22', '2024-01-26 04:24:22'),
(195, 79, 97, '2024-01-26', '09:05:13', 'Assign', NULL, 1, '2024-01-26 09:05:13', '2024-01-26 09:05:13'),
(196, 80, 98, '2024-01-26', '09:15:35', 'Assign', NULL, 1, '2024-01-26 09:15:35', '2024-01-26 09:15:35'),
(197, 80, 0, '2024-01-26', '09:15:45', 'Complaint cancel by user', NULL, 4, '2024-01-26 09:15:45', '2024-01-26 09:15:45'),
(198, 80, 99, '2024-01-26', '09:16:32', 'Assign', NULL, 1, '2024-01-26 09:16:32', '2024-01-26 09:16:32'),
(199, 81, 100, '2024-01-26', '09:20:44', 'Assign', NULL, 1, '2024-01-26 09:20:44', '2024-01-26 09:20:44'),
(200, 81, 0, '2024-01-26', '09:20:55', 'Complaint cancel by user', NULL, 4, '2024-01-26 09:20:55', '2024-01-26 09:20:55'),
(201, 80, 101, '2024-01-26', '09:21:45', 'Assign', NULL, 1, '2024-01-26 09:21:45', '2024-01-26 09:21:45'),
(202, 80, 101, '2024-01-26', '09:37:43', 'working', '[]', 2, '2024-01-26 09:37:43', '2024-01-26 09:37:43'),
(203, 82, 102, '2024-01-26', '09:42:30', 'Assign', NULL, 1, '2024-01-26 09:42:30', '2024-01-26 09:42:30'),
(204, 82, 0, '2024-01-26', '09:42:40', 'Complaint cancel by user', NULL, 4, '2024-01-26 09:42:40', '2024-01-26 09:42:40'),
(205, 82, 0, '2024-01-26', '09:43:43', 'flight problem', '[{\"file_path\":\"images\\/complaint\\/17062622236321.jpg\",\"file_type\":\"jpg\"}]', 0, '2024-01-26 09:43:43', '2024-01-26 09:43:43'),
(206, 83, 103, '2024-01-26', '09:58:54', 'Assign', NULL, 1, '2024-01-26 09:58:54', '2024-01-26 09:58:54'),
(207, 83, 0, '2024-01-26', '09:59:09', 'Complaint cancel by user', NULL, 4, '2024-01-26 09:59:09', '2024-01-26 09:59:09'),
(208, 84, 104, '2024-01-29', '09:13:04', 'Assign', NULL, 1, '2024-01-29 09:13:04', '2024-01-29 09:13:04'),
(209, 85, 105, '2024-01-29', '09:26:42', 'Assign', NULL, 1, '2024-01-29 09:26:42', '2024-01-29 09:26:42'),
(210, 85, 0, '2024-01-29', '09:39:00', 'Complaint cancel by user', NULL, 4, '2024-01-29 09:39:00', '2024-01-29 09:39:00'),
(211, 86, 106, '2024-01-30', '11:26:30', 'Assign', NULL, 1, '2024-01-30 11:26:30', '2024-01-30 11:26:30'),
(212, 86, 0, '2024-01-30', '11:28:27', 'Complaint cancel by user', NULL, 4, '2024-01-30 11:28:27', '2024-01-30 11:28:27'),
(213, 86, 107, '2024-01-30', '11:39:00', 'Assign', NULL, 1, '2024-01-30 11:39:00', '2024-01-30 11:39:00'),
(214, 87, 108, '2024-01-30', '12:21:29', 'Assign', NULL, 1, '2024-01-30 12:21:29', '2024-01-30 12:21:29'),
(215, 87, 0, '2024-01-30', '12:22:59', 'Complaint cancel by user', NULL, 4, '2024-01-30 12:22:59', '2024-01-30 12:22:59'),
(216, 87, 0, '2024-01-30', '12:23:35', 'Complaint reopen by user', NULL, 6, '2024-01-30 12:23:35', '2024-01-30 12:23:35'),
(217, 87, 108, '2024-01-30', '12:24:22', 'resolve', '[]', 3, '2024-01-30 12:24:22', '2024-01-30 12:24:22'),
(218, 87, 0, '2024-01-30', '12:24:40', 'Complaint reopen by user', NULL, 6, '2024-01-30 12:24:40', '2024-01-30 12:24:40'),
(219, 87, 109, '2024-01-30', '12:25:17', 'Assign', NULL, 1, '2024-01-30 12:25:17', '2024-01-30 12:25:17'),
(220, 87, 110, '2024-01-30', '12:26:13', 'Assign', NULL, 1, '2024-01-30 12:26:13', '2024-01-30 12:26:13'),
(221, 88, 111, '2024-02-15', '11:24:55', 'Assign', NULL, 1, '2024-02-15 11:24:55', '2024-02-15 11:24:55'),
(222, 88, 112, '2024-02-15', '11:27:22', 'Assign', NULL, 1, '2024-02-15 11:27:22', '2024-02-15 11:27:22'),
(223, 88, 112, '2024-02-15', '11:28:00', 'Working...process', '[{\"file_path\":\"images\\/complaint\\/17079964809003.jpg\",\"file_type\":\"jpg\"}]', 2, '2024-02-15 11:28:00', '2024-02-15 11:28:00'),
(224, 89, 113, '2024-02-29', '07:01:45', 'Assign', NULL, 1, '2024-02-29 07:01:45', '2024-02-29 07:01:45'),
(225, 90, 114, '2024-02-29', '07:23:40', 'Assign', NULL, 1, '2024-02-29 07:23:40', '2024-02-29 07:23:40'),
(226, 91, 115, '2024-02-29', '09:06:03', 'Assign', NULL, 1, '2024-02-29 09:06:03', '2024-02-29 09:06:03'),
(227, 92, 116, '2024-02-29', '10:05:22', 'Assign', NULL, 1, '2024-02-29 10:05:22', '2024-02-29 10:05:22'),
(228, 93, 117, '2024-02-29', '10:17:11', 'Assign', NULL, 1, '2024-02-29 10:17:11', '2024-02-29 10:17:11'),
(229, 93, 0, '2024-02-29', '10:21:30', 'Complaint cancel by user', NULL, 4, '2024-02-29 10:21:30', '2024-02-29 10:21:30'),
(230, 66, 0, '2024-02-29', '10:30:01', 'remarkanfdsfsfjsdlfjsdlf sdfnlsddflsd', '[{\"file_path\":\"images\\/complaint\\/17092026011173.jpg\",\"file_type\":\"jpg\"},{\"file_path\":\"images\\/complaint\\/17092026011175.mp3\",\"file_type\":\"mp3\"}]', 0, '2024-02-29 10:30:01', '2024-02-29 10:30:01'),
(231, 92, 116, '2024-02-29', '10:30:45', 'remark', '[]', 3, '2024-02-29 10:30:45', '2024-02-29 10:30:45'),
(232, 92, 116, '2024-02-29', '10:31:19', 'iiiiiiii', '[]', 3, '2024-02-29 10:31:19', '2024-02-29 10:31:19'),
(233, 94, 118, '2024-02-29', '10:48:49', 'Assign', NULL, 1, '2024-02-29 10:48:49', '2024-02-29 10:48:49'),
(234, 94, 118, '2024-02-29', '10:50:25', 'bchvj', '[]', 3, '2024-02-29 10:50:25', '2024-02-29 10:50:25'),
(235, 94, 0, '2024-02-29', '10:50:44', 'Complaint cancel by user', NULL, 4, '2024-02-29 10:50:44', '2024-02-29 10:50:44'),
(236, 94, 0, '2024-02-29', '10:50:52', 'Complaint reopen by user', NULL, 6, '2024-02-29 10:50:52', '2024-02-29 10:50:52'),
(237, 94, 0, '2024-02-29', '10:54:27', 'chccjmbb', '[]', 0, '2024-02-29 10:54:27', '2024-02-29 10:54:27'),
(238, 95, 119, '2024-02-29', '11:17:20', 'Assign', NULL, 1, '2024-02-29 11:17:20', '2024-02-29 11:17:20'),
(239, 96, 120, '2024-02-29', '11:31:46', 'Assign', NULL, 1, '2024-02-29 11:31:46', '2024-02-29 11:31:46'),
(240, 93, 0, '2024-02-29', '11:39:43', 'Complaint reopen by user', NULL, 6, '2024-02-29 11:39:43', '2024-02-29 11:39:43'),
(241, 93, 0, '2024-02-29', '11:39:49', 'Complaint cancel by user', NULL, 4, '2024-02-29 11:39:49', '2024-02-29 11:39:49'),
(242, 93, 0, '2024-02-29', '11:39:56', 'Complaint reopen by user', NULL, 6, '2024-02-29 11:39:56', '2024-02-29 11:39:56'),
(243, 93, 0, '2024-02-29', '11:39:59', 'Complaint cancel by user', NULL, 4, '2024-02-29 11:39:59', '2024-02-29 11:39:59'),
(244, 96, 0, '2024-02-29', '11:40:14', 'Complaint cancel by user', NULL, 4, '2024-02-29 11:40:14', '2024-02-29 11:40:14'),
(245, 95, 0, '2024-02-29', '11:43:14', 'Complaint cancel by user', NULL, 4, '2024-02-29 11:43:14', '2024-02-29 11:43:14'),
(246, 97, 121, '2024-02-29', '11:49:00', 'Assign', NULL, 1, '2024-02-29 11:49:00', '2024-02-29 11:49:00'),
(247, 97, 0, '2024-02-29', '11:49:10', 'Complaint cancel by user', NULL, 4, '2024-02-29 11:49:10', '2024-02-29 11:49:10'),
(248, 97, 0, '2024-02-29', '11:49:32', 'Complaint reopen by user', NULL, 6, '2024-02-29 11:49:32', '2024-02-29 11:49:32'),
(249, 97, 0, '2024-02-29', '11:50:41', 'Complaint cancel by user', NULL, 4, '2024-02-29 11:50:41', '2024-02-29 11:50:41'),
(250, 97, 0, '2024-02-29', '12:23:22', 'Complaint reopen by user', NULL, 6, '2024-02-29 12:23:22', '2024-02-29 12:23:22'),
(251, 97, 0, '2024-02-29', '12:23:39', 'Complaint cancel by user', NULL, 4, '2024-02-29 12:23:39', '2024-02-29 12:23:39'),
(252, 97, 0, '2024-02-29', '12:27:42', 'Complaint reopen by user', NULL, 6, '2024-02-29 12:27:42', '2024-02-29 12:27:42'),
(253, 97, 0, '2024-02-29', '12:27:48', 'Complaint cancel by user', NULL, 4, '2024-02-29 12:27:48', '2024-02-29 12:27:48'),
(254, 98, 122, '2024-03-01', '04:41:30', 'Assign', NULL, 1, '2024-03-01 04:41:30', '2024-03-01 04:41:30'),
(255, 99, 123, '2024-03-01', '04:46:24', 'Assign', NULL, 1, '2024-03-01 04:46:24', '2024-03-01 04:46:24'),
(256, 100, 124, '2024-03-01', '04:50:26', 'Assign', NULL, 1, '2024-03-01 04:50:26', '2024-03-01 04:50:26'),
(257, 101, 125, '2024-03-01', '04:56:50', 'Assign', NULL, 1, '2024-03-01 04:56:50', '2024-03-01 04:56:50'),
(258, 102, 126, '2024-03-01', '04:57:09', 'Assign', NULL, 1, '2024-03-01 04:57:09', '2024-03-01 04:57:09'),
(259, 103, 127, '2024-03-01', '04:57:25', 'Assign', NULL, 1, '2024-03-01 04:57:25', '2024-03-01 04:57:25'),
(260, 104, 128, '2024-03-01', '04:58:02', 'Assign', NULL, 1, '2024-03-01 04:58:02', '2024-03-01 04:58:02'),
(261, 88, 112, '2024-03-01', '04:58:25', 'resolved', '[]', 3, '2024-03-01 04:58:25', '2024-03-01 04:58:25'),
(262, 105, 129, '2024-03-01', '04:59:04', 'Assign', NULL, 1, '2024-03-01 04:59:04', '2024-03-01 04:59:04'),
(263, 106, 130, '2024-03-01', '05:05:35', 'Assign', NULL, 1, '2024-03-01 05:05:35', '2024-03-01 05:05:35'),
(264, 53, 61, '2024-03-01', '05:16:49', 'ok', '[]', 4, '2024-03-01 05:16:49', '2024-03-01 05:16:49'),
(265, 107, 131, '2024-04-12', '10:13:40', 'Assign', NULL, 1, '2024-04-12 04:43:40', '2024-04-12 04:43:40'),
(266, 108, 132, '2024-04-18', '10:01:41', 'Assign', NULL, 1, '2024-04-18 04:31:41', '2024-04-18 04:31:41'),
(267, 109, 133, '2024-04-18', '10:35:44', 'Assign', NULL, 1, '2024-04-18 05:05:44', '2024-04-18 05:05:44'),
(268, 111, 134, '2024-04-26', '04:56:40', 'Assign', NULL, 1, '2024-04-25 23:26:40', '2024-04-25 23:26:40'),
(269, 111, 134, '2024-04-26', '04:57:43', 'Ok we will take care of the problem', '[]', 3, '2024-04-25 23:27:43', '2024-04-25 23:27:43'),
(270, 111, 0, '2024-04-26', '04:58:40', 'Complaint reopen by user', NULL, 6, '2024-04-25 23:28:40', '2024-04-25 23:28:40'),
(271, 112, 135, '2024-04-26', '10:43:04', 'Assign', NULL, 1, '2024-04-26 05:13:04', '2024-04-26 05:13:04'),
(272, 112, 135, '2024-04-26', '10:45:01', 'ok I willctake a', '[]', 3, '2024-04-26 05:15:01', '2024-04-26 05:15:01'),
(273, 112, 0, '2024-04-26', '10:46:17', 'Complaint reopen by user', NULL, 6, '2024-04-26 05:16:17', '2024-04-26 05:16:17'),
(274, 113, 136, '2024-04-26', '10:49:13', 'Assign', NULL, 1, '2024-04-26 05:19:13', '2024-04-26 05:19:13'),
(275, 114, 137, '2024-06-11', '12:03:37', 'Assign', NULL, 1, '2024-06-11 06:33:37', '2024-06-11 06:33:37'),
(276, 115, 0, '2024-06-12', '04:15:35', 'Good', '[{\"file_path\":\"images\\/complaint\\/17181657353433.mp3\",\"file_type\":\"mp3\"}]', 0, '2024-06-11 22:45:35', '2024-06-11 22:45:35'),
(277, 115, 138, '2024-06-12', '04:16:20', 'Assign', NULL, 1, '2024-06-11 22:46:20', '2024-06-11 22:46:20'),
(278, 117, 139, '2024-06-17', '10:37:13', 'Assign', NULL, 1, '2024-06-17 05:07:13', '2024-06-17 05:07:13'),
(279, 117, 0, '2024-06-17', '10:37:35', 'please check my concern', '[]', 0, '2024-06-17 05:07:35', '2024-06-17 05:07:35'),
(280, 117, 139, '2024-06-17', '10:38:39', 'I will check your concern.', '[]', 2, '2024-06-17 05:08:39', '2024-06-17 05:08:39'),
(281, 118, 140, '2024-06-17', '12:25:50', 'Assign', NULL, 1, '2024-06-17 06:55:50', '2024-06-17 06:55:50'),
(282, 118, 0, '2024-06-17', '12:26:21', 'pleae work asap.', '[]', 0, '2024-06-17 06:56:21', '2024-06-17 06:56:21'),
(283, 118, 140, '2024-06-17', '12:31:20', 'Your Work is Done', '[]', 3, '2024-06-17 07:01:20', '2024-06-17 07:01:20'),
(284, 119, 141, '2024-06-19', '11:22:26', 'Assign', NULL, 1, '2024-06-19 05:52:26', '2024-06-19 05:52:26'),
(285, 120, 142, '2024-06-19', '11:26:51', 'Assign', NULL, 1, '2024-06-19 05:56:51', '2024-06-19 05:56:51'),
(286, 120, 0, '2024-07-09', '11:03:54', 'Complaint cancel by user', NULL, 4, '2024-07-09 05:33:54', '2024-07-09 05:33:54'),
(287, 117, 0, '2024-07-09', '11:04:33', 'no test no', '[]', 0, '2024-07-09 05:34:33', '2024-07-09 05:34:33'),
(288, 118, 0, '2024-07-17', '05:44:19', 'Complaint reopen by user', NULL, 6, '2024-07-17 00:14:19', '2024-07-17 00:14:19'),
(289, 118, 0, '2024-07-17', '05:44:23', 'Complaint cancel by user', NULL, 4, '2024-07-17 00:14:23', '2024-07-17 00:14:23'),
(290, 123, 143, '2024-07-18', '17:58:40', 'Assign', NULL, 1, '2024-07-18 12:28:40', '2024-07-18 12:28:40'),
(291, 124, 144, '2024-07-18', '18:02:23', 'Assign', NULL, 1, '2024-07-18 12:32:23', '2024-07-18 12:32:23'),
(292, 123, 143, '2024-07-18', '18:11:38', 'it\'s ok now', '[{\"file_path\":\"images\\/complaint\\/17213262988175.mp3\",\"file_type\":\"mp3\"}]', 3, '2024-07-18 12:41:38', '2024-07-18 12:41:38'),
(293, 125, 0, '2024-07-25', '10:04:17', 'Complaint cancel by user', NULL, 4, '2024-07-25 04:34:17', '2024-07-25 04:34:17'),
(294, 125, 0, '2024-07-25', '10:10:59', 'Complaint reopen by user', NULL, 6, '2024-07-25 04:40:59', '2024-07-25 04:40:59'),
(295, 125, 0, '2024-07-25', '10:11:05', 'Complaint cancel by user', NULL, 4, '2024-07-25 04:41:05', '2024-07-25 04:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_status`
--

CREATE TABLE `complaint_status` (
  `id` bigint UNSIGNED NOT NULL,
  `complaint_id` int NOT NULL DEFAULT '0',
  `status_id` int NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaint_status`
--

INSERT INTO `complaint_status` (`id`, `complaint_id`, `status_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Complaint Register', '2023-11-17 07:33:47', '2023-11-17 07:33:47'),
(2, 2, 1, 'Complaint Register', '2023-11-22 07:25:10', '2023-11-22 07:25:10'),
(3, 3, 1, 'Complaint Register', '2023-11-22 09:42:05', '2023-11-22 09:42:05'),
(4, 3, 4, 'Complaint Reopen by user', '2023-11-22 10:07:17', '2023-11-22 10:07:17'),
(5, 4, 1, 'Complaint Register', '2023-11-22 10:39:43', '2023-11-22 10:39:43'),
(6, 5, 1, 'Complaint Register', '2023-11-23 05:02:51', '2023-11-23 05:02:51'),
(7, 6, 1, 'Complaint Register', '2023-11-23 05:53:11', '2023-11-23 05:53:11'),
(8, 7, 1, 'Complaint Register', '2023-11-23 05:54:26', '2023-11-23 05:54:26'),
(9, 8, 1, 'Complaint Register', '2023-11-23 05:54:59', '2023-11-23 05:54:59'),
(10, 9, 1, 'Complaint Register', '2023-11-23 06:01:38', '2023-11-23 06:01:38'),
(11, 10, 1, 'Complaint Register', '2023-11-23 06:16:11', '2023-11-23 06:16:11'),
(12, 11, 1, 'Complaint Register', '2023-11-23 06:37:06', '2023-11-23 06:37:06'),
(13, 12, 1, 'Complaint Register', '2023-11-23 13:33:51', '2023-11-23 13:33:51'),
(14, 13, 1, 'Complaint Register', '2023-11-23 13:34:28', '2023-11-23 13:34:28'),
(15, 14, 1, 'Complaint Register', '2023-11-28 12:15:15', '2023-11-28 12:15:15'),
(16, 15, 1, 'Complaint Register', '2023-11-28 12:15:45', '2023-11-28 12:15:45'),
(17, 16, 1, 'Complaint Register', '2023-11-28 12:19:27', '2023-11-28 12:19:27'),
(18, 17, 1, 'Complaint Register', '2023-11-28 12:22:26', '2023-11-28 12:22:26'),
(19, 18, 1, 'Complaint Register', '2023-11-28 12:54:24', '2023-11-28 12:54:24'),
(20, 19, 1, 'Complaint Register', '2023-11-28 12:54:49', '2023-11-28 12:54:49'),
(21, 20, 1, 'Complaint Register', '2023-11-29 10:51:00', '2023-11-29 10:51:00'),
(22, 21, 1, 'Complaint Register', '2023-11-30 05:42:45', '2023-11-30 05:42:45'),
(23, 20, 5, 'Complaint Reopen by user', '2023-11-30 05:43:17', '2023-11-30 05:43:17'),
(24, 22, 1, 'Complaint Register', '2023-12-01 12:00:38', '2023-12-01 12:00:38'),
(25, 19, 4, 'Complaint Reopen by user', '2023-12-04 10:26:45', '2023-12-04 10:26:45'),
(26, 23, 1, 'Complaint Register', '2023-12-04 11:29:06', '2023-12-04 11:29:06'),
(27, 24, 1, 'Complaint Register', '2023-12-05 09:11:17', '2023-12-05 09:11:17'),
(28, 25, 1, 'Complaint Register', '2023-12-05 09:12:22', '2023-12-05 09:12:22'),
(29, 26, 1, 'Complaint Register', '2023-12-05 09:21:57', '2023-12-05 09:21:57'),
(30, 27, 1, 'Complaint Register', '2023-12-05 09:22:41', '2023-12-05 09:22:41'),
(31, 27, 4, 'Complaint Reopen by user', '2023-12-05 09:33:59', '2023-12-05 09:33:59'),
(32, 24, 4, 'Complaint Reopen by user', '2023-12-05 09:34:13', '2023-12-05 09:34:13'),
(33, 28, 1, 'Complaint Register', '2023-12-05 11:49:17', '2023-12-05 11:49:17'),
(34, 29, 1, 'Complaint Register', '2023-12-06 06:58:20', '2023-12-06 06:58:20'),
(35, 29, 4, 'Complaint Reopen by user', '2023-12-06 07:34:20', '2023-12-06 07:34:20'),
(36, 30, 1, 'Complaint Register', '2023-12-06 09:55:52', '2023-12-06 09:55:52'),
(37, 31, 1, 'Complaint Register', '2023-12-06 10:23:21', '2023-12-06 10:23:21'),
(38, 32, 1, 'Complaint Register', '2023-12-06 10:23:51', '2023-12-06 10:23:51'),
(39, 33, 1, 'Complaint Register', '2023-12-06 10:24:14', '2023-12-06 10:24:14'),
(40, 34, 1, 'Complaint Register', '2023-12-06 10:47:06', '2023-12-06 10:47:06'),
(41, 35, 1, 'Complaint Register', '2023-12-06 10:51:42', '2023-12-06 10:51:42'),
(42, 23, 5, 'Complaint Reopen by user', '2023-12-06 11:35:54', '2023-12-06 11:35:54'),
(43, 23, 5, 'Complaint Reopen by user', '2023-12-06 11:45:37', '2023-12-06 11:45:37'),
(44, 23, 5, 'Complaint Reopen by user', '2023-12-06 11:46:06', '2023-12-06 11:46:06'),
(45, 36, 1, 'Complaint Register', '2023-12-07 12:18:26', '2023-12-07 12:18:26'),
(46, 37, 1, 'Complaint Register', '2023-12-07 12:21:01', '2023-12-07 12:21:01'),
(47, 38, 1, 'Complaint Register', '2023-12-07 12:44:32', '2023-12-07 12:44:32'),
(48, 35, 4, 'Complaint Reopen by user', '2023-12-07 12:45:51', '2023-12-07 12:45:51'),
(49, 35, 4, 'Complaint Reopen by user', '2023-12-07 12:46:04', '2023-12-07 12:46:04'),
(50, 23, 5, 'Complaint Reopen by user', '2023-12-07 12:46:17', '2023-12-07 12:46:17'),
(51, 39, 1, 'Complaint Register', '2023-12-07 20:16:03', '2023-12-07 20:16:03'),
(52, 40, 1, 'Complaint Register', '2023-12-08 06:24:26', '2023-12-08 06:24:26'),
(53, 40, 4, 'Complaint Reopen by user', '2023-12-08 06:26:20', '2023-12-08 06:26:20'),
(54, 40, 4, 'Complaint Reopen by user', '2023-12-08 06:41:42', '2023-12-08 06:41:42'),
(55, 37, 4, 'Complaint Reopen by user', '2023-12-11 04:38:42', '2023-12-11 04:38:42'),
(56, 36, 4, 'Complaint Reopen by user', '2023-12-11 04:39:04', '2023-12-11 04:39:04'),
(57, 41, 1, 'Complaint Register', '2023-12-11 05:37:11', '2023-12-11 05:37:11'),
(58, 41, 4, 'Complaint Reopen by user', '2023-12-11 05:38:54', '2023-12-11 05:38:54'),
(59, 42, 1, 'Complaint Register', '2023-12-11 05:42:39', '2023-12-11 05:42:39'),
(60, 43, 1, 'Complaint Register', '2023-12-11 07:20:13', '2023-12-11 07:20:13'),
(61, 44, 1, 'Complaint Register', '2023-12-11 07:21:05', '2023-12-11 07:21:05'),
(62, 45, 1, 'Complaint Register', '2023-12-11 07:21:37', '2023-12-11 07:21:37'),
(63, 46, 1, 'Complaint Register', '2023-12-11 07:22:52', '2023-12-11 07:22:52'),
(64, 43, 4, 'Complaint Reopen by user', '2023-12-11 07:23:45', '2023-12-11 07:23:45'),
(65, 43, 5, 'Complaint Reopen by user', '2023-12-11 07:54:04', '2023-12-11 07:54:04'),
(66, 47, 1, 'Complaint Register', '2023-12-11 07:54:09', '2023-12-11 07:54:09'),
(67, 47, 4, 'Complaint Reopen by user', '2023-12-11 07:54:25', '2023-12-11 07:54:25'),
(68, 48, 1, 'Complaint Register', '2023-12-11 07:55:08', '2023-12-11 07:55:08'),
(69, 48, 4, 'Complaint Reopen by user', '2023-12-11 07:55:17', '2023-12-11 07:55:17'),
(70, 48, 5, 'Complaint Reopen by user', '2023-12-11 09:35:12', '2023-12-11 09:35:12'),
(71, 48, 5, 'Complaint Reopen by user', '2023-12-11 09:37:09', '2023-12-11 09:37:09'),
(72, 47, 5, 'Complaint Reopen by user', '2023-12-11 09:37:18', '2023-12-11 09:37:18'),
(73, 48, 5, 'Complaint Reopen by user', '2023-12-11 09:50:01', '2023-12-11 09:50:01'),
(74, 49, 1, 'Complaint Register', '2023-12-11 11:05:16', '2023-12-11 11:05:16'),
(75, 49, 5, 'Complaint Reopen by user', '2023-12-11 11:06:58', '2023-12-11 11:06:58'),
(76, 49, 4, 'Complaint Reopen by user', '2023-12-11 11:14:16', '2023-12-11 11:14:16'),
(77, 49, 5, 'Complaint Reopen by user', '2023-12-11 11:14:29', '2023-12-11 11:14:29'),
(78, 50, 1, 'Complaint Register', '2023-12-11 11:15:32', '2023-12-11 11:15:32'),
(79, 51, 1, 'Complaint Register', '2023-12-13 10:37:32', '2023-12-13 10:37:32'),
(80, 51, 4, 'Complaint Reopen by user', '2023-12-13 10:37:44', '2023-12-13 10:37:44'),
(81, 52, 1, 'Complaint Register', '2023-12-22 06:25:09', '2023-12-22 06:25:09'),
(82, 53, 1, 'Complaint Register', '2023-12-22 12:26:06', '2023-12-22 12:26:06'),
(83, 54, 1, 'Complaint Register', '2023-12-29 05:56:27', '2023-12-29 05:56:27'),
(84, 55, 1, 'Complaint Register', '2023-12-29 06:05:07', '2023-12-29 06:05:07'),
(85, 56, 1, 'Complaint Register', '2023-12-29 07:20:14', '2023-12-29 07:20:14'),
(86, 55, 4, 'Complaint Reopen by user', '2023-12-29 07:20:27', '2023-12-29 07:20:27'),
(87, 55, 4, 'Complaint Reopen by user', '2023-12-29 07:20:49', '2023-12-29 07:20:49'),
(88, 55, 4, 'Complaint Reopen by user', '2023-12-29 07:21:30', '2023-12-29 07:21:30'),
(89, 55, 5, 'Complaint Reopen by user', '2023-12-29 07:22:02', '2023-12-29 07:22:02'),
(90, 54, 5, 'Complaint Reopen by user', '2023-12-29 07:22:22', '2023-12-29 07:22:22'),
(91, 57, 1, 'Complaint Register', '2024-01-02 11:59:50', '2024-01-02 11:59:50'),
(92, 58, 1, 'Complaint Register', '2024-01-02 12:01:28', '2024-01-02 12:01:28'),
(93, 59, 1, 'Complaint Register', '2024-01-02 12:12:29', '2024-01-02 12:12:29'),
(94, 60, 1, 'Complaint Register', '2024-01-03 10:49:26', '2024-01-03 10:49:26'),
(95, 61, 1, 'Complaint Register', '2024-01-03 10:59:02', '2024-01-03 10:59:02'),
(96, 62, 1, 'Complaint Register', '2024-01-03 11:00:34', '2024-01-03 11:00:34'),
(97, 63, 1, 'Complaint Register', '2024-01-03 11:58:57', '2024-01-03 11:58:57'),
(98, 64, 1, 'Complaint Register', '2024-01-04 07:15:38', '2024-01-04 07:15:38'),
(99, 65, 1, 'Complaint Register', '2024-01-06 21:23:21', '2024-01-06 21:23:21'),
(100, 48, 5, 'Complaint Reopen by user', '2024-01-06 21:23:51', '2024-01-06 21:23:51'),
(101, 65, 5, 'Complaint Reopen by user', '2024-01-06 21:24:12', '2024-01-06 21:24:12'),
(102, 48, 5, 'Complaint Reopen by user', '2024-01-06 21:24:27', '2024-01-06 21:24:27'),
(103, 65, 4, 'Complaint Reopen by user', '2024-01-06 21:27:07', '2024-01-06 21:27:07'),
(104, 66, 1, 'Complaint Register', '2024-01-08 11:33:51', '2024-01-08 11:33:51'),
(105, 67, 1, 'Complaint Register', '2024-01-08 11:38:51', '2024-01-08 11:38:51'),
(106, 63, 4, 'Complaint Reopen by user', '2024-01-10 06:24:51', '2024-01-10 06:24:51'),
(107, 68, 1, 'Complaint Register', '2024-01-10 06:32:05', '2024-01-10 06:32:05'),
(108, 68, 4, 'Complaint Reopen by user', '2024-01-10 09:24:40', '2024-01-10 09:24:40'),
(109, 68, 4, 'Complaint Reopen by user', '2024-01-10 09:25:35', '2024-01-10 09:25:35'),
(110, 68, 4, 'Complaint Reopen by user', '2024-01-10 09:25:52', '2024-01-10 09:25:52'),
(111, 69, 1, 'Complaint Register', '2024-01-10 09:29:45', '2024-01-10 09:29:45'),
(112, 70, 1, 'Complaint Register', '2024-01-10 09:53:31', '2024-01-10 09:53:31'),
(113, 63, 5, 'Complaint Reopen by user', '2024-01-10 11:51:49', '2024-01-10 11:51:49'),
(114, 62, 5, 'Complaint Reopen by user', '2024-01-10 11:55:17', '2024-01-10 11:55:17'),
(115, 71, 1, 'Complaint Register', '2024-01-10 12:56:28', '2024-01-10 12:56:28'),
(116, 72, 1, 'Complaint Register', '2024-01-12 07:17:24', '2024-01-12 07:17:24'),
(117, 63, 4, 'Complaint Reopen by user', '2024-01-12 07:38:05', '2024-01-12 07:38:05'),
(118, 62, 4, 'Complaint Reopen by user', '2024-01-12 07:39:44', '2024-01-12 07:39:44'),
(119, 70, 4, 'Complaint Reopen by user', '2024-01-12 08:57:48', '2024-01-12 08:57:48'),
(120, 73, 1, 'Complaint Register', '2024-01-15 11:32:54', '2024-01-15 11:32:54'),
(121, 74, 1, 'Complaint Register', '2024-01-22 04:45:30', '2024-01-22 04:45:30'),
(122, 70, 5, 'Complaint Reopen by user', '2024-01-22 05:35:44', '2024-01-22 05:35:44'),
(123, 75, 1, 'Complaint Register', '2024-01-22 05:43:45', '2024-01-22 05:43:45'),
(124, 70, 4, 'Complaint Reopen by user', '2024-01-22 05:44:25', '2024-01-22 05:44:25'),
(125, 75, 4, 'Complaint Reopen by user', '2024-01-22 05:44:34', '2024-01-22 05:44:34'),
(126, 76, 1, 'Complaint Register', '2024-01-23 05:15:57', '2024-01-23 05:15:57'),
(127, 77, 1, 'Complaint Register', '2024-01-26 03:43:57', '2024-01-26 03:43:57'),
(128, 77, 4, 'Complaint Reopen by user', '2024-01-26 03:49:09', '2024-01-26 03:49:09'),
(129, 77, 5, 'Complaint Reopen by user', '2024-01-26 03:49:28', '2024-01-26 03:49:28'),
(130, 78, 1, 'Complaint Register', '2024-01-26 04:24:22', '2024-01-26 04:24:22'),
(131, 79, 1, 'Complaint Register', '2024-01-26 09:05:12', '2024-01-26 09:05:12'),
(132, 80, 1, 'Complaint Register', '2024-01-26 09:15:34', '2024-01-26 09:15:34'),
(133, 80, 4, 'Complaint Reopen by user', '2024-01-26 09:15:45', '2024-01-26 09:15:45'),
(134, 80, 5, 'Complaint Reopen by user', '2024-01-26 09:15:51', '2024-01-26 09:15:51'),
(135, 81, 1, 'Complaint Register', '2024-01-26 09:20:44', '2024-01-26 09:20:44'),
(136, 81, 4, 'Complaint Reopen by user', '2024-01-26 09:20:55', '2024-01-26 09:20:55'),
(137, 81, 5, 'Complaint Reopen by user', '2024-01-26 09:21:19', '2024-01-26 09:21:19'),
(138, 82, 1, 'Complaint Register', '2024-01-26 09:42:30', '2024-01-26 09:42:30'),
(139, 82, 4, 'Complaint Reopen by user', '2024-01-26 09:42:40', '2024-01-26 09:42:40'),
(140, 82, 5, 'Complaint Reopen by user', '2024-01-26 09:42:49', '2024-01-26 09:42:49'),
(141, 83, 1, 'Complaint Register', '2024-01-26 09:58:54', '2024-01-26 09:58:54'),
(142, 83, 4, 'Complaint Reopen by user', '2024-01-26 09:59:09', '2024-01-26 09:59:09'),
(143, 83, 5, 'Complaint Reopen by user', '2024-01-26 09:59:20', '2024-01-26 09:59:20'),
(144, 84, 1, 'Complaint Register', '2024-01-29 09:13:03', '2024-01-29 09:13:03'),
(145, 85, 1, 'Complaint Register', '2024-01-29 09:26:42', '2024-01-29 09:26:42'),
(146, 85, 4, 'Complaint Reopen by user', '2024-01-29 09:39:00', '2024-01-29 09:39:00'),
(147, 85, 5, 'Complaint Reopen by user', '2024-01-29 09:39:06', '2024-01-29 09:39:06'),
(148, 86, 1, 'Complaint Register', '2024-01-30 11:26:30', '2024-01-30 11:26:30'),
(149, 86, 4, 'Complaint Reopen by user', '2024-01-30 11:28:27', '2024-01-30 11:28:27'),
(150, 86, 5, 'Complaint Reopen by user', '2024-01-30 11:28:54', '2024-01-30 11:28:54'),
(151, 87, 1, 'Complaint Register', '2024-01-30 12:21:29', '2024-01-30 12:21:29'),
(152, 87, 4, 'Complaint cancel by user', '2024-01-30 12:22:59', '2024-01-30 12:22:59'),
(153, 87, 5, 'Complaint Reopen by user', '2024-01-30 12:23:35', '2024-01-30 12:23:35'),
(154, 87, 5, 'Complaint Reopen by user', '2024-01-30 12:24:40', '2024-01-30 12:24:40'),
(155, 88, 1, 'Complaint Register', '2024-02-15 11:24:55', '2024-02-15 11:24:55'),
(156, 89, 1, 'Complaint Register', '2024-02-29 07:01:44', '2024-02-29 07:01:44'),
(157, 90, 1, 'Complaint Register', '2024-02-29 07:23:40', '2024-02-29 07:23:40'),
(158, 91, 1, 'Complaint Register', '2024-02-29 09:06:02', '2024-02-29 09:06:02'),
(159, 92, 1, 'Complaint Register', '2024-02-29 10:05:20', '2024-02-29 10:05:20'),
(160, 93, 1, 'Complaint Register', '2024-02-29 10:17:11', '2024-02-29 10:17:11'),
(161, 93, 4, 'Complaint cancel by user', '2024-02-29 10:21:30', '2024-02-29 10:21:30'),
(162, 94, 1, 'Complaint Register', '2024-02-29 10:48:49', '2024-02-29 10:48:49'),
(163, 94, 4, 'Complaint cancel by user', '2024-02-29 10:50:44', '2024-02-29 10:50:44'),
(164, 94, 5, 'Complaint Reopen by user', '2024-02-29 10:50:52', '2024-02-29 10:50:52'),
(165, 95, 1, 'Complaint Register', '2024-02-29 11:17:20', '2024-02-29 11:17:20'),
(166, 96, 1, 'Complaint Register', '2024-02-29 11:31:46', '2024-02-29 11:31:46'),
(167, 93, 5, 'Complaint Reopen by user', '2024-02-29 11:39:43', '2024-02-29 11:39:43'),
(168, 93, 4, 'Complaint cancel by user', '2024-02-29 11:39:49', '2024-02-29 11:39:49'),
(169, 93, 5, 'Complaint Reopen by user', '2024-02-29 11:39:56', '2024-02-29 11:39:56'),
(170, 93, 4, 'Complaint cancel by user', '2024-02-29 11:39:59', '2024-02-29 11:39:59'),
(171, 96, 4, 'Complaint cancel by user', '2024-02-29 11:40:14', '2024-02-29 11:40:14'),
(172, 95, 4, 'Complaint cancel by user', '2024-02-29 11:43:14', '2024-02-29 11:43:14'),
(173, 97, 1, 'Complaint Register', '2024-02-29 11:49:00', '2024-02-29 11:49:00'),
(174, 97, 4, 'Complaint cancel by user', '2024-02-29 11:49:10', '2024-02-29 11:49:10'),
(175, 97, 5, 'Complaint Reopen by user', '2024-02-29 11:49:32', '2024-02-29 11:49:32'),
(176, 97, 4, 'Complaint cancel by user', '2024-02-29 11:50:41', '2024-02-29 11:50:41'),
(177, 97, 5, 'Complaint Reopen by user', '2024-02-29 12:23:22', '2024-02-29 12:23:22'),
(178, 97, 4, 'Complaint cancel by user', '2024-02-29 12:23:39', '2024-02-29 12:23:39'),
(179, 97, 5, 'Complaint Reopen by user', '2024-02-29 12:27:42', '2024-02-29 12:27:42'),
(180, 97, 4, 'Complaint cancel by user', '2024-02-29 12:27:48', '2024-02-29 12:27:48'),
(181, 98, 1, 'Complaint Register', '2024-03-01 04:41:30', '2024-03-01 04:41:30'),
(182, 99, 1, 'Complaint Register', '2024-03-01 04:46:24', '2024-03-01 04:46:24'),
(183, 100, 1, 'Complaint Register', '2024-03-01 04:50:26', '2024-03-01 04:50:26'),
(184, 101, 1, 'Complaint Register', '2024-03-01 04:56:49', '2024-03-01 04:56:49'),
(185, 102, 1, 'Complaint Register', '2024-03-01 04:57:09', '2024-03-01 04:57:09'),
(186, 103, 1, 'Complaint Register', '2024-03-01 04:57:25', '2024-03-01 04:57:25'),
(187, 104, 1, 'Complaint Register', '2024-03-01 04:58:02', '2024-03-01 04:58:02'),
(188, 105, 1, 'Complaint Register', '2024-03-01 04:59:04', '2024-03-01 04:59:04'),
(189, 106, 1, 'Complaint Register', '2024-03-01 05:05:35', '2024-03-01 05:05:35'),
(190, 107, 1, 'Complaint Register', '2024-04-12 04:43:40', '2024-04-12 04:43:40'),
(191, 108, 1, 'Complaint Register', '2024-04-18 04:31:41', '2024-04-18 04:31:41'),
(192, 109, 1, 'Complaint Register', '2024-04-18 05:05:44', '2024-04-18 05:05:44'),
(193, 110, 1, 'Complaint Register', '2024-04-24 05:28:56', '2024-04-24 05:28:56'),
(194, 111, 1, 'Complaint Register', '2024-04-25 23:25:52', '2024-04-25 23:25:52'),
(195, 111, 5, 'Complaint Reopen by user', '2024-04-25 23:28:40', '2024-04-25 23:28:40'),
(196, 112, 1, 'Complaint Register', '2024-04-26 05:12:56', '2024-04-26 05:12:56'),
(197, 112, 5, 'Complaint Reopen by user', '2024-04-26 05:16:17', '2024-04-26 05:16:17'),
(198, 113, 1, 'Complaint Register', '2024-04-26 05:19:06', '2024-04-26 05:19:06'),
(199, 114, 1, 'Complaint Register', '2024-06-11 06:32:01', '2024-06-11 06:32:01'),
(200, 115, 1, 'Complaint Register', '2024-06-11 22:45:00', '2024-06-11 22:45:00'),
(201, 116, 1, 'Complaint Register', '2024-06-16 01:14:10', '2024-06-16 01:14:10'),
(202, 117, 1, 'Complaint Register', '2024-06-17 05:05:33', '2024-06-17 05:05:33'),
(203, 118, 1, 'Complaint Register', '2024-06-17 06:55:07', '2024-06-17 06:55:07'),
(204, 119, 1, 'Complaint Register', '2024-06-18 04:52:33', '2024-06-18 04:52:33'),
(205, 120, 1, 'Complaint Register', '2024-06-19 05:56:21', '2024-06-19 05:56:21'),
(206, 121, 1, 'Complaint Register', '2024-07-09 05:33:10', '2024-07-09 05:33:10'),
(207, 120, 4, 'Complaint cancel by user', '2024-07-09 05:33:54', '2024-07-09 05:33:54'),
(208, 122, 1, 'Complaint Register', '2024-07-17 00:14:00', '2024-07-17 00:14:00'),
(209, 118, 5, 'Complaint Reopen by user', '2024-07-17 00:14:19', '2024-07-17 00:14:19'),
(210, 118, 4, 'Complaint cancel by user', '2024-07-17 00:14:23', '2024-07-17 00:14:23'),
(211, 123, 1, 'Complaint Register', '2024-07-18 12:10:54', '2024-07-18 12:10:54'),
(212, 124, 1, 'Complaint Register', '2024-07-18 12:31:44', '2024-07-18 12:31:44'),
(213, 125, 1, 'Complaint Register', '2024-07-25 04:34:01', '2024-07-25 04:34:01'),
(214, 125, 4, 'Complaint cancel by user', '2024-07-25 04:34:17', '2024-07-25 04:34:17'),
(215, 126, 1, 'Complaint Register', '2024-07-25 04:40:49', '2024-07-25 04:40:49'),
(216, 125, 5, 'Complaint Reopen by user', '2024-07-25 04:40:59', '2024-07-25 04:40:59'),
(217, 125, 4, 'Complaint cancel by user', '2024-07-25 04:41:05', '2024-07-25 04:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `content_managements`
--

CREATE TABLE `content_managements` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_managements`
--

INSERT INTO `content_managements` (`id`, `name`, `short_name`, `details`, `created_at`, `updated_at`) VALUES
(1, 'Terms & Condition', 'terms_condition', '<p>Terms and Conditions</p><p><br></p><p>Welcome to JanSamadhan ! These Terms and Conditions govern your use of our mobile application and services. Please read these terms carefully before using our app. By accessing or using our app, you agree to be bound by these Terms and Conditions. If you do not agree to all the terms and conditions, then you may not access the app or use any services.</p><p><br></p><p>1. Acceptance of Terms</p><p><br></p><p>By accessing or using our app, you agree to abide by these Terms and Conditions and any additional terms and conditions that may apply to specific features of the app or to services available through the app. If you do not agree to these terms, please do not use the app.</p><p><br></p><p>2. Use of the App</p><p><br></p><p>You must be at least 18 years old to use our app. By using the app, you represent and warrant that you are at least 18 years old.</p><p><br></p><p>You agree not to use the app for any unlawful purpose or in any way that could damage, disable, overburden, or impair the app or interfere with any other party\'s use and enjoyment of the app.</p><p><br></p><p>3. User Responsibilities</p><p><br></p><p>You are solely responsible for the content you submit through the app, including complaints, comments, and any other materials . You agree not to submit any User Content that is unlawful, defamatory, harassing, or otherwise objectionable.</p><p><br></p><p>You agree to provide accurate and complete information when submitting complaints through the app. JanSamadhan is not responsible for any inaccuracies or omissions in the information provided by users.</p><p><br></p><p>4. Confidentiality</p><p><br></p><p>JanSamadhan&nbsp; respects your privacy and will handle any personal information submitted through the app in accordance with our Privacy Policy&nbsp;<font color=\"#000000\" style=\"background-color: rgb(255, 255, 255);\"><font style=\"\"><span style=\"font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre;\"><a href=\"https://jansamadhan.alobhatech.com/mobile_privacy_policy\" target=\"_blank\" style=\"\">https://jansamadhan.alobhatech.com</a></span><span style=\"font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre;\"><a href=\"https://jansamadhan.alobhatech.com/mobile_privacy_policy\" target=\"_blank\" style=\"\">/mobile_privacy_policy</a></span></font>.</font> However, please be aware that any information submitted through the app may be accessible to JanSamadhan&nbsp;and its employees.</p><p><br></p><p>5. Limitation of Liability</p><p><br></p><p>To the fullest extent permitted by applicable law, JanSamadhan&nbsp;shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from (i) your access to or use of or inability to access or use the app; (ii) any conduct or content of any third party on the app; or (iii) unauthorized access, use, or alteration of your transmissions or content.</p><p><br></p><p>7. Contact Us</p><p><br></p><p>If you have any questions about these Terms and Conditions, please contact us at&nbsp; info@alobhatechnologies.com.</p><p><br></p><p>By using our app, you agree to these Terms and Conditions. Thank you for choosing JANSAMADHAN!</p>', '2023-11-17 07:15:39', '2024-02-29 06:25:46'),
(2, 'Privacy Policy', 'privacy_policy', '<p>Privacy Policy</p><p><br></p><p>Thank you for choosing Jansamadhan. This Privacy Policy outlines how we collect, use, and safeguard your personal information when you use our complaint management app (referred to as the \"App\"). We are committed to protecting your privacy and ensuring the security of your personal information.</p><p><br></p><p>Information Collection and Use:</p><p><br></p><p>Personal Information: To effectively manage complaints, we may collect personal information such as your name, email address, contact number, and any other information you provide when using the App.</p><p>&nbsp;&nbsp;</p><p>Usage Information: We may also collect non-personal information about how you use the App, including but not limited to the type of device you use, your operating system, your IP address, and usage statistics.</p><p><br></p><p>How We Use Your Information:</p><p><br></p><p>To Process Complaints:&nbsp; We use the information collected to process and manage complaints submitted through the App, including communication with you regarding the status of your complaint</p><p><br></p><p>Improvement of Services:&nbsp; Your feedback and usage data may be used to improve the functionality and user experience of the App.</p><p><br></p><p>Communications:&nbsp; We may use your email address or other contact information to send you updates, newsletters, or other information related to the App. You can opt-out of these communications at any time.</p><p><br></p><p>Data Security:</p><p>We are committed to protecting the security of your personal information and have implemented appropriate technical and organizational measures to safeguard your data against unauthorized access, alteration, disclosure, or destruction.</p><p><br></p><p>Data Sharing:</p><p><br></p><p>We do not sell, trade, or rent your personal information to third parties. However, we may share your information with trusted third-party service providers who assist us in operating our business or servicing you, provided that they agree to keep this information confidential.</p><p><br></p><p>Compliance with Laws:</p><p><br></p><p>We may disclose your information when required by law or in response to valid legal requests, such as court orders or subpoenas.</p><p><br></p><p>Changes to This Privacy Policy:</p><p><br></p><p>We reserve the right to update this Privacy Policy at any time. We encourage you to review this Privacy Policy periodically for any changes. Your continued use of the App after any changes to this Privacy Policy will constitute your acceptance of those changes.</p><p><br></p><p>Contact Us:</p><p><br></p><p>If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at info@alobhatechnologies.com</p><p><br></p><p>By using the App, you consent to the terms of this Privacy Policy.</p>', '2023-11-17 07:15:39', '2024-02-29 06:19:25'),
(3, 'About Us', 'about_us', '<p>About Us</p><p><br></p><p>Welcome to Jansamadhan, your trusted companion in managing complaints effectively and efficiently. We understand the importance of providing a platform where individuals&nbsp; can address concerns, resolve issues, and improve overall satisfaction.</p><p><br></p><p>Our Mission:</p><p><br></p><p>At Jansamadhan, our mission is to streamline the complaint management process, making it easier for users to voice their concerns and for businesses to address them promptly. We aim to foster transparency, accountability, and positive communication between consumers and service providers.</p><p><br></p><p>What We Offer:<br></p><p><br></p><p>User-Friendly Platform:&nbsp; Our complaint management app is designed with simplicity and ease of use in mind, ensuring that users can submit, track, and manage complaints effortlessly.</p><p><br></p><p>Prompt Resolution:&nbsp; We believe in the power of timely resolution. Our platform facilitates efficient communication between complainants and the relevant authorities or businesses, leading to quicker resolution of issues.</p><p><br></p><p>-Data Insights: We provide valuable insights and analytics to businesses based on complaint data, enabling them to identify trends, address recurring issues, and enhance their services.</p><p><br></p><p>Our Commitment to Excellence:</p><p><br></p><p>At Jansamadhan, we are committed to excellence in every aspect of our service. We continuously strive to improve our platform, enhance user experience, and uphold the highest standards of privacy and security.</p><p><br></p><p>Get in Touch:</p><p><br></p><p>We value your feedback and suggestions. If you have any questions, comments, or ideas for improvement, please don\'t hesitate to contact us. Your input is crucial to our ongoing efforts to provide a superior complaint management experience.</p><p><br></p><p>Thank you for choosing Jansamadhan as your trusted partner in managing complaints. We look forward to serving you and helping to create a more responsive and customer-centric environment for all.</p>', '2023-11-17 07:15:39', '2024-02-29 06:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voter_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhaar_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `guardian_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_profile_complete` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0- Not Delete, 1- Delete',
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_executive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-Not Executive,1-Executive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_unique_id`, `voter_id`, `aadhaar_card`, `name`, `gender`, `dob`, `age`, `guardian_name`, `relation`, `mobile`, `email`, `password`, `show_password`, `otp`, `forgot_otp`, `is_profile_complete`, `status`, `is_delete`, `api_token`, `device_type`, `device_token`, `is_executive`, `created_at`, `updated_at`) VALUES
(1, '78564929', '12345kjhui', '879798798789', 'Ravi', 'Male', '2005-11-17', 18, 'father', 'Father', '9876543210', 'ravi@gmail.com', '$2y$10$f3rJRT.mhL00FkfZTBDOV.HxzW6JuiJucspyPDoR6qm3RzdXnz4f.', '9876543210', '9107', NULL, 0, 1, 0, 'eba93a4b142192d4fc6b4a1798300e66cd686372ac40c8b4c2978c3eca9867a5', 'android', 'etHrCn9gSHeZSedD-AOKIS:APA91bGU9-epHFYE04T5yUViP4ZCkC0mTyuRwbCyHX_lY1-fuKnYjigQ7TB3SkOyC1ZBEdLFcZTMbJLPtOA-RpFggv76BpwGHbSUVuGmm9wYpOsK1lFVTlyQU2s2sRJ2gT7iW6FZPRP8', 0, '2023-11-17 07:32:17', '2024-02-29 11:17:33'),
(2, '19901048', NULL, NULL, 'Aryan gangwar', 'Male', '2005-11-20', 18, 'guardgin', 'Father', '9956095335', 'aryan@gmail.com', '$2y$10$iYc7xWmS40JnEmGE3bBbg.eWIJG2pmZpFEC.ZmwwfmNOXK07BTlTS', '9956095335', '6442', NULL, 1, 1, 0, '44e407f1032982c1de156b61ead11c5260b39ccd07d884150a31cf7ccb3b484d', 'android', 'dsPbDBzMT4KkQ9meammxTI:APA91bHYiwLcQIiMftsJgyCUMmjKJwWz8ewcBjLohZF81FX1fe79qB3W7es3ix7syz-5ynlNvViDGTP_2ENqRRWjSyv4sJ6bhXjCd2Nj2FRBT_OMV2f8AF5AtQIthilz5ipNRooVJc7U', 0, '2023-11-17 09:21:20', '2024-05-28 23:21:20'),
(3, '85350603', NULL, NULL, 'Teat', 'Male', '2005-11-20', NULL, 'guardina', 'Father', '1234567890', 'test@gmail.com', NULL, NULL, '8750', NULL, 1, 1, 0, 'b21c41312a4ccf4b7ac41954ba54507b7a9dc4d069317f4c7f84c1f5b5e67823', 'android', 'dPufDlwQTzibKfeIvdaZal:APA91bFB4FfioiT186ZH3V2YrejeRBoMGtIHzDm8FF2XdzbUDwnNSstxZTgdKxxL2LG2QlbsI8WApHiEyDnCu8JCzk_ghCzxvtlvx-gGZJGa989UD7JyjyLVPeau1_YyEmKHjilIMwFK', 0, '2023-11-20 12:22:40', '2023-12-07 19:53:09'),
(4, '79626550', 'AFX3122135', '666666666666', 'SUJEET KUMAR', 'Male', '2004-06-30', NULL, 'Jai', 'Mother', '8808166289', 'surjeet.alobhatech@gmail.com', NULL, NULL, '5894', NULL, 1, 1, 1, 'd7aba77adbf49faa9ce674abf6bd28bc3ec9317ef38d79f2d186bcb25b511266', 'android', 'c7RrMukXQmC3LY5v30sxH2:APA91bE7yhTfkAOFaQ0f7tN8jfOHk3gtWNZU0-33w1CzqESTyNHhRDCqkiEfYMZ57JMSxcJnWs7I-rWsRPPjF5fwbV3aijWUz7dEA1Kq9KCFw0ui03gzLmYcEc5i6jZft07u4yzMMDAV', 0, '2023-11-22 06:27:33', '2023-12-29 05:36:07'),
(5, '70419588', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1231231231', NULL, NULL, NULL, '7966', NULL, 0, 1, 0, 'a45710a5f1db08387d43ceee4fed4d12cf08591d49580392747da3d6ca033b61', 'android', 'fp3-1tG_QwOg_XLuRYqAQB:APA91bEcvjbg-LVldMgxvl1INHHe0y9MbKFuAiMnCfLRDc1YhlSkUKDE0Twk2r4XWCC7nTxjxqMsPajAJ8ixvfdOYjCkAs7MGZ3LQ6GLTdTFiTv39YeDaRIuOlwEBtQwu80JlmJ69nWJ', 0, '2023-11-22 06:32:23', '2023-11-22 06:32:25'),
(6, '73911700', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '3601', NULL, 0, 1, 0, '395953f3a81ed1ef6d9e12b59e15da3b12232ff37e132b3c49ea0b6316395abb', 'android', 'fp3-1tG_QwOg_XLuRYqAQB:APA91bEcvjbg-LVldMgxvl1INHHe0y9MbKFuAiMnCfLRDc1YhlSkUKDE0Twk2r4XWCC7nTxjxqMsPajAJ8ixvfdOYjCkAs7MGZ3LQ6GLTdTFiTv39YeDaRIuOlwEBtQwu80JlmJ69nWJ', 0, '2023-11-22 07:12:53', '2024-01-02 11:31:57'),
(7, '68883278', 'qeqweqw', '234234234', 'Ashish Kumar', 'Male', '2005-11-24', 18, 'Amit', 'Father', '9015366399', 'krashishshukla@gmail.com', '$2y$10$MJudDwMF84.X.9sydIf0iucRUlN.nqTkaOFI0FurWr4E8XqHKLEHi', '9015366399', '8072', NULL, 1, 1, 0, '21d569820a0687198b5e8002eeeabd6f8f12d409ecbc13e5b487286a359da024', 'android', 'e2Sf8QmWRoOJGsPH8WEFwv:APA91bEU29cKcguUbxg1AMxsX4-KgIXKjtJ_FHvJ5DgxgyQl7SnAR8hWsdQk6jArMMm6dXx4SkLTlHcLxXhiSB8Ks8gdstwt0rQcmV2SoZTwbzS9n_9G2TiuhwxV2ClhY3E_lADS8Uq0', 0, '2023-11-23 04:58:27', '2023-11-28 12:19:27'),
(8, '99731482', NULL, NULL, 'Alobha', 'Male', '2005-11-08', NULL, 'Alobha', 'Father', '9956095336', 'alobha@gmail.com', NULL, NULL, '7948', NULL, 1, 1, 0, '41d99460dd17b700847ceb1673217f56add5278a4d04e6d8dc0f7fff129174e7', 'android', 'd9Hfk5EcQwS9p_TjIrrVS9:APA91bFkFm-K7Km2hoe5ccMyOkvzdOBVe97Mq2lSj5ILLN2J-VWEkrXbB9fXH3t5m7tGTDKVMbLfisS4NIc7eLzY67_qgfFOaRM0aV1gziBU7ibtn43NHVmTo5ARp8kv-qecGvMMeLpJ', 0, '2023-11-23 05:47:12', '2023-11-23 05:53:34'),
(9, '66693724', NULL, NULL, 'Aryan Alobha', 'Male', '2005-11-08', NULL, 'Aryan Alobhaa', 'Father', '9956095337', 'aryanalobha@gmail.com', NULL, NULL, '7956', NULL, 1, 1, 0, '5850cb10623a95944b7e229f14e821d57477e231ce0f28376a57295e784d6f50', 'android', 'd9Hfk5EcQwS9p_TjIrrVS9:APA91bFkFm-K7Km2hoe5ccMyOkvzdOBVe97Mq2lSj5ILLN2J-VWEkrXbB9fXH3t5m7tGTDKVMbLfisS4NIc7eLzY67_qgfFOaRM0aV1gziBU7ibtn43NHVmTo5ARp8kv-qecGvMMeLpJ', 0, '2023-11-23 05:49:03', '2023-11-23 05:50:12'),
(10, '14768326', 'AHV1125151', '827348724783', 'Rahul Kumar', 'Male', '1998-12-31', 24, 'Kaushal Kishor', 'Father', '8808166389', 'rahul12@gmail.com', '$2y$10$Uh/1356aXaxgFxgKtZO/NeGXCQcKFsMH/INQL4Xeb2cuJXPfA9Tw2', '8808166389', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-11-23 05:49:57', '2023-11-28 12:22:26'),
(11, '62155919', NULL, NULL, 'Ash', 'Male', '2005-11-02', NULL, 'hari', 'Father', '8808168389', 'shishshukla@gmail.com', NULL, NULL, '4205', NULL, 1, 1, 0, '385a6d46edde07af3ba9b3c9b858fe07a132c6c5046b99dea5e718c56915939b', 'android', 'e2Sf8QmWRoOJGsPH8WEFwv:APA91bEU29cKcguUbxg1AMxsX4-KgIXKjtJ_FHvJ5DgxgyQl7SnAR8hWsdQk6jArMMm6dXx4SkLTlHcLxXhiSB8Ks8gdstwt0rQcmV2SoZTwbzS9n_9G2TiuhwxV2ClhY3E_lADS8Uq0', 0, '2023-11-23 06:32:13', '2023-11-23 06:36:21'),
(12, '97916324', NULL, NULL, 'xyz', 'Male', '2006-09-20', NULL, 'xyz', 'Father', '7320828254', 'xyzx@gmail.com', NULL, NULL, '6867', NULL, 1, 1, 0, '476030a3b964022a01b1028f9372f16d30c75df507ec01fd0817f47af122cb1b', 'android', 'fs6MzKucSwycg1TLHeetHZ:APA91bGJpAM5Sr3bTe43-khqPwBWM0QynfzYvOnEVUmaDDGCek93Vq7XyAcfYnBUYhW06w-zVsLWddodD8OcT2xGIwaQ0fVepKylirrxW_6yiUNoJZGDjjmiNYQ6ZZASn8KpNeTiHI0U', 0, '2023-11-28 12:43:54', '2023-12-28 12:17:27'),
(14, '18205500', NULL, NULL, 'Ragho', 'Male', '2004-01-11', 19, 'uygi', 'Mother', '7827922041', 'aaaaa@gmail.com', '$2y$10$l23X9PU5aVc3g8Z4DQVNU.3ZNaDCsEitw7DoMrRNzGikELmp73On6', '7827922041', '3711', NULL, 1, 1, 0, 'f495e2ef271434a13dbf57da6c244bae6e72555796b768661b473eb1f11bf724', 'android', 'eXMrBNUgTF6GUd9opqZEQc:APA91bGcDXJQn_Lfk72mu3aZeBBVKQ7xOyOFl81vLU9eghVmnwq4fNGV-A_yvuj8aCe2sLQTl0n2ThnQfQ32AV26ebOz-QR3m4GfyVdBrNAbQBtixfltqSj23VFdnbT9NJnZL3BTy3FX', 0, '2023-12-01 11:44:36', '2023-12-22 11:37:47'),
(15, '95367680', NULL, NULL, 'aryan', 'Male', '2005-12-07', NULL, 'guardian', 'Father', '7878787878', 'jssj@gmail.com', NULL, NULL, '5341', NULL, 1, 1, 0, 'c92c7dab1bbf6fa2b18126ca1353e215612a625a1b303ebd05e9f143cc9db109', 'android', 'do6RXUjORhqBG7q2b6CvO1:APA91bEDH6-qiTcZdsF3_D0APr5tnb3WvoaLzjNAQf2mdKU7ABLhvOdvQeiUJitrd9zvY5wsQA4QdkuuBw-XknJYOzBE1nWvFXkSkfIchg6L88DEtVg70KyV3tTSnE2bDWh7w66kJx5I', 0, '2023-12-01 12:01:25', '2023-12-11 06:43:30'),
(16, '86438425', 'ABC3416177', '994949949949', 'Deepika Mourya', 'Female', '1998-12-11', 25, 'Testing Apps', 'Mother', '9956208979', 'bhshajaj@gmail.com', '$2y$10$Hn8a0McuJYJP2gWUt08fqebtkpI0Jbq7hVmFghnTMVB9qLis/Lrv.', '9956208979', '5299', NULL, 1, 1, 0, 'b98e7f8cd73f639880d9af29a07a3faba20781f8ffd1e521881c0114d7584d97', 'android', 'cqx-poB5THShWCmskTiZTH:APA91bEP7E3jrZ0EKr2UgdatKmsX5HMLHT_8b21LeQQLjRxbSTvnDn7glkLPh9uHeDgNYOHjHOtn__5M29KptlU7_YRz5Hvp6hawqOVz_VTjNOS0_KZVSYCZXhFkzfeFovTzOQKqeBxH', 0, '2023-12-04 11:38:09', '2024-01-07 17:05:55'),
(17, '46130467', NULL, NULL, 'RRR', 'Male', '2005-12-06', 18, 'RRR', 'Father', '7310828254', 'RRR@gmail.com', '$2y$10$gZP/Uz6lq7q45V18qLvW0OOOy6XFqKljJpLvnUJy4CztIZxT371yu', '7310828254', '6367', NULL, 1, 1, 0, 'd8cede2ca21031771f7ed5b86ee2807afd210f2df064e078ec649a6b6d045665', 'android', 'eK5wOb7EQUSvnPTE8tBjv0:APA91bECiOaQh_mKWrf-fmMkUjzNSoUcMsf0hLM2W3XAvL7fe7J1g5TdErMsb_wrjoosC8bfiJxQoE06bcA3HJ0gj-xEZqQ53XdUZ23tstETS1qGEEA59lvx9JaTuB2_OYzws0P_HfCj', 0, '2023-12-06 05:50:42', '2023-12-06 06:52:33'),
(18, '13618068', NULL, NULL, 'abc', 'Male', '2005-12-07', NULL, 'xyz', 'Father', '7827922044', 'xnyzx@gmail.com', NULL, NULL, '2514', NULL, 1, 1, 0, '957c35738dc4a3d51a2c10e384576076b9d28b4d92095ca1dd18b41f5d67ab4f', 'android', 'ei6libxOQZOAJVxVro9jjN:APA91bGI35iSepOlP65D4GCNWJRwhu3hFiJaDkReoqNTmRSG6SPRBYaF6xjW--u7bFAKRJwl73RZ8kH822631lS49iRS0ki7es5IQFAPOsfDSyZBv5oE4jdBbkIbEPs9EcOJgzchOP-q', 0, '2023-12-07 11:52:52', '2023-12-07 13:29:17'),
(19, '75648296', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7827922043', NULL, NULL, NULL, '2508', NULL, 0, 1, 1, 'cc16a2bbe24a9065374ed84a4fe6ed90ed252b64c42582686d97d2667bfd7eba', 'android', 'ei6libxOQZOAJVxVro9jjN:APA91bGI35iSepOlP65D4GCNWJRwhu3hFiJaDkReoqNTmRSG6SPRBYaF6xjW--u7bFAKRJwl73RZ8kH822631lS49iRS0ki7es5IQFAPOsfDSyZBv5oE4jdBbkIbEPs9EcOJgzchOP-q', 0, '2023-12-07 11:57:57', '2023-12-07 11:58:41'),
(20, '56565351', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7544979797', NULL, NULL, NULL, '8989', NULL, 0, 1, 0, '5e74a0c64c7b7553ae9904f99d093695901635af148951462ea8e2bc409a7c43', 'android', 'ei6libxOQZOAJVxVro9jjN:APA91bGI35iSepOlP65D4GCNWJRwhu3hFiJaDkReoqNTmRSG6SPRBYaF6xjW--u7bFAKRJwl73RZ8kH822631lS49iRS0ki7es5IQFAPOsfDSyZBv5oE4jdBbkIbEPs9EcOJgzchOP-q', 0, '2023-12-07 12:24:29', '2023-12-07 12:24:31'),
(21, '48878387', NULL, NULL, 'Amit', 'Male', '2005-12-08', 18, 'XYZ', 'Father', '1233333333', NULL, '$2y$10$72Gc9NoMeZWPTuOm9RtOa.lc9HLlMY5P1GC.4FZQcJGyY0soGSX5G', '1233333333', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-08 07:33:20', '2023-12-08 07:33:20'),
(22, '92184294', NULL, NULL, 'Amit', 'Male', '2005-12-08', 18, 'XYZ', 'Father', '1233333334', NULL, '$2y$10$Nnf8Euq6QCPE2PtewsDaoeGi2fMcOCzUm.TDw.pK/yViHuXgNijfG', '1233333334', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-08 07:33:39', '2023-12-08 07:33:39'),
(23, '30485721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9955555555', NULL, NULL, NULL, '4532', NULL, 0, 1, 0, '160e084055903fc1caec7f60f6c5d8da112cef86f6b66e626b76ed70d12ac2b8', 'android', 'ei6libxOQZOAJVxVro9jjN:APA91bGI35iSepOlP65D4GCNWJRwhu3hFiJaDkReoqNTmRSG6SPRBYaF6xjW--u7bFAKRJwl73RZ8kH822631lS49iRS0ki7es5IQFAPOsfDSyZBv5oE4jdBbkIbEPs9EcOJgzchOP-q', 0, '2023-12-08 11:12:11', '2023-12-08 11:12:14'),
(24, '44418488', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ',,,,,,,,,,', NULL, NULL, NULL, '1073', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-11 05:21:16', '2023-12-13 10:05:31'),
(25, '90820532', NULL, NULL, 'Ram', 'Male', '2005-11-16', 18, 'shyam', 'Father', '7272727272', 'ram@gmail.com', '$2y$10$ps3Dyu32jBTTKD3Ou9uWx.LIRXX24gcH9S2pZKM8WUeOeHpWVABK2', '7272727272', '9553', NULL, 1, 1, 0, 'fdc545f02b2a2b01191924d544c21fbcfdf6a8639c77f6a1cbb1aa45241ca865', 'android', 'eK5wOb7EQUSvnPTE8tBjv0:APA91bGqA_6uLKwZiKq-FTMwivKLYQZk1EcASkYrvDL32Mgc6tlsI7PmWqMFRiIyaEyqLZNURo9_ClSACTyjjT5gR9dSu_uljUZNbkMGC9QJxFHMAS_KpdfeB2w9fxJ0gyBbaDF-vcOU', 0, '2023-12-11 05:29:42', '2023-12-11 07:22:52'),
(26, '61941102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ',,,,,,,,', NULL, NULL, NULL, '5419', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-11 10:10:14', '2023-12-11 10:10:14'),
(27, '28486581', NULL, NULL, 'Tech', 'Male', '2004-12-11', NULL, 'technologies', 'Father', '8292992382', 'tech@gmail.com', NULL, NULL, '2425', NULL, 1, 1, 0, 'dfdafd76d2648c443e55f4e30350f6c10f1fa6e75fd03a5204512ced34346a5f', 'android', 'fKp8HrxcS_2n5Asi4wmOxT:APA91bEnRUFS61fX9LVA_ZiA2HolkwzuOOMCnmCtW1eAqq8oE4GRN8Sz0zxIqLo30O-yvjTMv0XkFwRNYLb1OCf6Xj9mmHwXm7ag1V2xmMkLeeQ9fH2tO_zItxkVEBnsBU-PrCNxJOW7', 0, '2023-12-11 10:11:18', '2023-12-11 11:04:50'),
(28, '60070349', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ',,,,,,,,,', NULL, NULL, NULL, '2533', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-11 13:01:06', '2023-12-11 13:01:06'),
(29, '59106954', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9666666666', NULL, NULL, NULL, '9062', NULL, 0, 1, 0, '648e385e210c52a3f7222b836d754f35286da76b5b9db1a9471cee12686691d0', 'android', 'c3wVcBO8TN6xSgP83H9C7V:APA91bHyyh0IFg8O54qoE-ZRK-s8j4wEy59TZ-FrLBAd7k1rwSYg0TCitGAPBhZNvkVc7a9MkVzPotL2uDIFksY7T_nNZp4fhS2L8fH0mVEe7vi3TKK31h3ANRyG6LtRqtznzcXFD60o', 0, '2023-12-15 10:32:34', '2023-12-15 10:32:36'),
(30, '88017819', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '..........', NULL, NULL, NULL, '7680', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-18 06:31:51', '2023-12-18 06:31:51'),
(31, '86158305', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '.......', NULL, NULL, NULL, '3704', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-18 11:57:23', '2023-12-18 11:57:23'),
(32, '78071083', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '......88', NULL, NULL, NULL, '2663', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-18 11:59:02', '2023-12-18 11:59:02'),
(33, '77924546', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '99', NULL, NULL, NULL, '9542', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-18 12:00:17', '2023-12-22 05:36:09'),
(34, '14025428', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '995620897.', NULL, NULL, NULL, '2642', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-18 12:07:13', '2023-12-18 12:07:13'),
(35, '75046105', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '999', NULL, NULL, NULL, '8776', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-18 12:49:19', '2023-12-18 12:49:19'),
(36, '41709648', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22,', NULL, NULL, NULL, '5969', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-18 12:54:36', '2023-12-18 12:54:36'),
(37, '23248208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8853825042', NULL, NULL, NULL, '2233', NULL, 0, 1, 0, 'f555fa9dd6bf2bb679b16460e8681aa786cdee8f901884927e6e61cf29507059', 'android', 'ew_dqmlBQ3eb3Rbz2fhKyn:APA91bFtEcTOSkaG8Y7JcOq-aOxvDnpE6jngBN_p4bCije7zLMzJ3YZW4gDkOguAWUj_tQVH21mL2K0oBLdnWIizvdok-JuDIAzOGo4wjs88927utKEIbokSgzlWBQ3Dv_5D_QEXuHyL', 0, '2023-12-21 14:04:39', '2023-12-21 14:04:41'),
(38, '19111719', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '.........', NULL, NULL, NULL, '9180', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-22 05:34:46', '2023-12-22 05:34:46'),
(39, '89356008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9999', NULL, NULL, NULL, '7987', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-22 05:35:03', '2023-12-22 05:35:03'),
(40, '57331356', NULL, NULL, 'alobha', 'Male', '2004-11-23', NULL, 'Alli', 'Father', '7320888000', 'all@gmail.com', NULL, NULL, '5500', NULL, 1, 1, 0, '401e87e0ac0d182a4b4988233cbb81bc4d4d2173b3250507428afb97f2f6c681', 'android', 'eXMrBNUgTF6GUd9opqZEQc:APA91bGcDXJQn_Lfk72mu3aZeBBVKQ7xOyOFl81vLU9eghVmnwq4fNGV-A_yvuj8aCe2sLQTl0n2ThnQfQ32AV26ebOz-QR3m4GfyVdBrNAbQBtixfltqSj23VFdnbT9NJnZL3BTy3FX', 0, '2023-12-22 06:06:16', '2023-12-22 06:29:26'),
(41, '16832771', NULL, NULL, 'www', 'Male', '2005-12-22', 18, 'XYZ', 'Father', '8988899988', NULL, '$2y$10$4Bn2wnDXBDpg2TY04iNcYOG52TiAVTR83OVMOJEpI11ybEUl5XMBq', '8988899988', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2023-12-22 09:29:28', '2023-12-22 09:29:28'),
(42, '70121019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1222222222', NULL, NULL, NULL, '4309', NULL, 0, 1, 0, 'a6e9f99f4b7e4ee128bf452e0520fe59effb46e0b91cb36ffa706fc2547d8594', 'android', 'fs6MzKucSwycg1TLHeetHZ:APA91bGJpAM5Sr3bTe43-khqPwBWM0QynfzYvOnEVUmaDDGCek93Vq7XyAcfYnBUYhW06w-zVsLWddodD8OcT2xGIwaQ0fVepKylirrxW_6yiUNoJZGDjjmiNYQ6ZZASn8KpNeTiHI0U', 0, '2023-12-28 10:59:23', '2023-12-28 10:59:25'),
(43, '79391767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7888888888', NULL, NULL, NULL, '9893', NULL, 0, 1, 0, '59613893f35d1dfc255dbd8eea93228fb68b982c614d47bc248b0b4648023c6b', 'android', 'fs6MzKucSwycg1TLHeetHZ:APA91bGJpAM5Sr3bTe43-khqPwBWM0QynfzYvOnEVUmaDDGCek93Vq7XyAcfYnBUYhW06w-zVsLWddodD8OcT2xGIwaQ0fVepKylirrxW_6yiUNoJZGDjjmiNYQ6ZZASn8KpNeTiHI0U', 0, '2023-12-28 12:18:33', '2023-12-28 12:18:34'),
(44, '84248426', 'ADX2017454', '958285862152', 'SUJEET KUMAR', 'Male', '2006-01-14', NULL, 'Bateshwar Dayal', 'Father', '8808166289', 'surjeet.alobhatech@gmail.com', NULL, NULL, '6244', NULL, 1, 1, 0, '9589c3e66718a494f6301f652c3a55bc838769f695216e8f7c4965399c9da5b3', 'android', 'dxCapF5zQdWzqT2E1T2DXt:APA91bHTE5DCkbEB4eB_4UbfN14KpT8_v60gWoUKxDm4SDNHt6H5v7rq5yH3KjdAjof5HcCVoxVN-M_O14F4ptFwhQTp6ExVzUu7ltVzlzTh_b8FN2TCHouWtXvKge5ckGxzoZQCR9di', 0, '2023-12-29 05:36:20', '2024-04-23 02:07:27'),
(45, '70237482', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22', NULL, NULL, NULL, '2167', NULL, 0, 1, 0, 'ed6ea9c22321dc80d716d3797497d058e7649719a41e365343b3fbf767fb45ab', 'android', 'c7RrMukXQmC3LY5v30sxH2:APA91bE7yhTfkAOFaQ0f7tN8jfOHk3gtWNZU0-33w1CzqESTyNHhRDCqkiEfYMZ57JMSxcJnWs7I-rWsRPPjF5fwbV3aijWUz7dEA1Kq9KCFw0ui03gzLmYcEc5i6jZft07u4yzMMDAV', 0, '2023-12-29 06:28:10', '2023-12-29 06:28:56'),
(46, '75651888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1342343243', NULL, NULL, NULL, '9499', NULL, 0, 1, 0, '3dc2465189441104c185676883e636521dff3592e02386f1312ae4f811fc5220', 'android', 'f3XCat7zTNO7-kCYubRfjY:APA91bF5HDx0YxaeTRAqOPY4Tb3ByVLWKeu1xEJPLre7JRHf-LclDqHV2ycDBNHnV7H_wHvYQq7EHylZXVVKSnREQMLI4V-pfqMTMNjQEL4OlmeWYP5xx9tstypEOc7xaG0UltPYo8tm', 0, '2024-01-02 11:33:22', '2024-01-02 11:33:23'),
(47, '90515502', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3423423423', NULL, NULL, NULL, '1001', NULL, 0, 1, 0, '8770028e1ac0dc0347017cdc2fc53e50b92851bd726e6537fa1717bde927e97a', 'android', 'f3XCat7zTNO7-kCYubRfjY:APA91bF5HDx0YxaeTRAqOPY4Tb3ByVLWKeu1xEJPLre7JRHf-LclDqHV2ycDBNHnV7H_wHvYQq7EHylZXVVKSnREQMLI4V-pfqMTMNjQEL4OlmeWYP5xx9tstypEOc7xaG0UltPYo8tm', 0, '2024-01-02 11:33:58', '2024-01-02 11:33:59'),
(48, '31619966', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6464949949', NULL, NULL, NULL, '9379', NULL, 0, 1, 0, '5df2294eff6692d88afec096d14327d81a5733e80806a33590e9ddcd91f15552', 'android', 'd-xBYSysQ1aFI_TvzcEi_w:APA91bEmLMNiFIsnhwCV0dX0dUqVqNoCYnd1UJ-pwR_Tiuq0rdrE8LlVzUP0udM_6B9m-C60EKsb4pWY-vYwowhV-VlzfVvhRMPK9xotJ7G_O9R5j_py2Z3YpIokiWsADek4pkRxnykd', 0, '2024-01-03 05:28:34', '2024-01-03 05:29:14'),
(49, '74098874', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2222222222', NULL, NULL, NULL, '7339', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2024-01-03 05:40:45', '2024-01-03 05:41:02'),
(50, '95766914', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5252525252', NULL, NULL, NULL, '1860', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2024-01-03 05:45:09', '2024-01-03 05:45:41'),
(51, '71240156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8808166280', NULL, NULL, NULL, '6288', NULL, 0, 1, 0, '51b2af4e29f67e935dd6036a2945c7804d38fc272c02968ba3e7d17a5ef114ff', 'android', 'd-xBYSysQ1aFI_TvzcEi_w:APA91bEmLMNiFIsnhwCV0dX0dUqVqNoCYnd1UJ-pwR_Tiuq0rdrE8LlVzUP0udM_6B9m-C60EKsb4pWY-vYwowhV-VlzfVvhRMPK9xotJ7G_O9R5j_py2Z3YpIokiWsADek4pkRxnykd', 0, '2024-01-03 13:00:12', '2024-01-03 13:00:15'),
(52, '43060892', 'BHS3545758', '525252525252', 'Rahul', 'Male', '2005-12-14', NULL, 'teat', 'Father', '5854845787', 'hzhzh@gmail.com', NULL, NULL, '8213', NULL, 1, 1, 0, 'f4aac4dd858e3fc28cd02bef5650fbb770c2b9901f6dce96860348f40fbdf281', 'android', 'd-xBYSysQ1aFI_TvzcEi_w:APA91bEmLMNiFIsnhwCV0dX0dUqVqNoCYnd1UJ-pwR_Tiuq0rdrE8LlVzUP0udM_6B9m-C60EKsb4pWY-vYwowhV-VlzfVvhRMPK9xotJ7G_O9R5j_py2Z3YpIokiWsADek4pkRxnykd', 0, '2024-01-04 07:12:13', '2024-01-04 07:14:11'),
(53, '80690424', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5646487878', NULL, NULL, NULL, '1175', NULL, 0, 1, 0, 'e440f274574320584a307349d80da91cb8e0bc9c2e570e1b1dd6692489401631', 'android', 'd-xBYSysQ1aFI_TvzcEi_w:APA91bEmLMNiFIsnhwCV0dX0dUqVqNoCYnd1UJ-pwR_Tiuq0rdrE8LlVzUP0udM_6B9m-C60EKsb4pWY-vYwowhV-VlzfVvhRMPK9xotJ7G_O9R5j_py2Z3YpIokiWsADek4pkRxnykd', 0, '2024-01-04 07:22:10', '2024-01-04 07:22:11'),
(54, '21954673', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9956095535', NULL, NULL, NULL, '2466', NULL, 0, 1, 0, '6bbbd8e6828468261aa03871bb7602c6d90bf47ca002077eba64fe42bcc7fc29', 'android', 'fpMP_rEHSuSNArr7W9JnP9:APA91bEiP6GDnweMsCNqgFYb3Tq4Ozpj7BPxfurt19KcY0lUpg2jmjK-8DNcto9vTunUmnHAE0yCdJImSKkdjKy12BOlRbwgpYs6cbof5VVfEf9JF4kfuRv01-Ig561Y-SPOVEK8ZtVf', 0, '2024-01-05 09:50:30', '2024-01-05 09:50:31'),
(55, '99904486', 'HHS2134555', '912285302185', 'Akash Kumar (User)', 'Male', '2005-12-09', 18, 'Radhe shyam', 'Father', '8934024280', 'akash@gmail.com', '$2y$10$YDux8GHzpV/fFFEb1qgDG.3ED70UHah1kDK3VyR3gZs1SH1cQaMee', '8934024280', '5343', NULL, 1, 1, 1, '41c67e835bcf909b6cf7397a4f6da9bb5071b8c589c0e2123ba531df749c68c4', 'android', 'cCUbykmpSm2KS9XWk-oAf4:APA91bH3_rb9Qwhyh7WdbjGnNlPUuNqOs1QKg7L1IIoxMctEKkmFFpOdp5Bu9hLIysXCgLoFfg9Fr-uW4OkH8Nn_pSbfLH5NOPlEzqdZoYxNdFhmqsSzHSQTy_idDaq34hl4x1H_pKwz', 0, '2024-01-10 06:25:16', '2024-01-10 09:36:21'),
(56, '11316713', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8934024280', NULL, NULL, NULL, '2185', NULL, 0, 1, 1, 'fd2e60eb7d1c55bcc8c75ceaba768b09cc34bfbf128241b44e25aef9b54ae5a0', 'android', 'cCUbykmpSm2KS9XWk-oAf4:APA91bH3_rb9Qwhyh7WdbjGnNlPUuNqOs1QKg7L1IIoxMctEKkmFFpOdp5Bu9hLIysXCgLoFfg9Fr-uW4OkH8Nn_pSbfLH5NOPlEzqdZoYxNdFhmqsSzHSQTy_idDaq34hl4x1H_pKwz', 0, '2024-01-10 09:36:54', '2024-01-10 09:37:30'),
(57, '99972322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8934024280', NULL, NULL, NULL, '8653', NULL, 0, 1, 1, '8fcc7ed03d179cf202c3c960083a207dcb52d349b38476d454facf764251f831', 'android', 'cCUbykmpSm2KS9XWk-oAf4:APA91bH3_rb9Qwhyh7WdbjGnNlPUuNqOs1QKg7L1IIoxMctEKkmFFpOdp5Bu9hLIysXCgLoFfg9Fr-uW4OkH8Nn_pSbfLH5NOPlEzqdZoYxNdFhmqsSzHSQTy_idDaq34hl4x1H_pKwz', 0, '2024-01-10 09:37:52', '2024-01-10 09:38:10'),
(58, '37631975', NULL, NULL, 'Akash Kumar User', 'Male', '2004-12-31', 20, 'Bateshwar Dayal', 'Father', '8934024280', 'aash@gmail.com', '$2y$10$ZcK3tPbgU/mzsEZAiiIU1.a4S8dZBGnmrH.kNEdL64pL0.nYL/AKi', '8934024280', '2239', NULL, 1, 1, 1, 'de4f6cc48fbe39b0221e28c8fc1b652dfbc926a4d8498ad00d8dc54ae00c1c49', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bHF3UG4zL2lB-c9lzLzofcVNMQ0HvQYniqmtQn3Neu0wsfaEv43dlpIZESfm1BygqZEcsRAL1NbgICIkOaaCZCBBsQVxPocURtpQfsFNO6R4bem6OXq5VXhbweJENwVkSrwyzO7', 0, '2024-01-10 09:38:31', '2024-01-22 05:53:20'),
(59, '62614738', NULL, NULL, 'Ravi', 'Male', '2006-01-30', NULL, 'Prakash', 'Father', '8750957260', 'raviprakash.alobha@gmail.com', NULL, NULL, '9030', NULL, 1, 1, 0, '94127b726776c45b2ee083ea7cfa4cc1a8453df355d8f46b44fca2eb47cd996a', 'android', 'cWBwpttlRDmeaKtzYElsDW:APA91bG2ke0FJlyeP6YXCi6dnBngQbpUNfTjbhBbVptRTxQG0JigAlWgf8mHJSrlOISxIPEJCpemkNjx8v0Z7mg5gzX4ZHxb8hsFgcKvosPHZd2qcIrGPydoaNn-aShcetclKaWVsk0J', 0, '2024-01-15 06:10:32', '2024-01-30 11:24:30'),
(60, '42185867', NULL, NULL, 'Guest User', 'Male', '2006-01-15', NULL, 'Guest Guardian', 'Father', '2543534252', 'guest@gmail.com', NULL, NULL, '1770', NULL, 1, 1, 0, 'da81752ed2122c607c990b02b5de3a223d055c0465f61496e91126e40352bff7', 'android', 'fnNMNb8vSRSNDRrcmDuqsg:APA91bHBT8ihZn9uzThbT5zH6tSe1hasV1hDueuJSLrQn2z4ibJ9vwkcY3XZ0VVGrRfqiA145nfGRRyR8A1fKeKqeTxTxiztJfxRo7TlN3PC2QdmFYcJ3W9NlFscn5GaCi_fyCwYJPqy', 0, '2024-01-15 12:08:17', '2024-01-15 12:30:29'),
(61, '76433034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9943534535', NULL, NULL, NULL, '5490', NULL, 0, 1, 0, '839d34dbeb12bddfb9141a04fbfb9d3c03a0ac08cb4dc41e237b3724469b16ed', 'android', 'fnNMNb8vSRSNDRrcmDuqsg:APA91bHBT8ihZn9uzThbT5zH6tSe1hasV1hDueuJSLrQn2z4ibJ9vwkcY3XZ0VVGrRfqiA145nfGRRyR8A1fKeKqeTxTxiztJfxRo7TlN3PC2QdmFYcJ3W9NlFscn5GaCi_fyCwYJPqy', 0, '2024-01-15 12:32:54', '2024-01-15 12:32:55'),
(62, '28582666', 'SHH4554887', '968484848484', 'vk', 'Male', '2006-01-14', NULL, 'Na', 'Father', '9792779704', 'vk@gmail.com', NULL, NULL, '9976', NULL, 1, 1, 0, 'c5030f41afecc62562b62477be623e3f4156d9ec3684abd288901411147c2ede', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bHF3UG4zL2lB-c9lzLzofcVNMQ0HvQYniqmtQn3Neu0wsfaEv43dlpIZESfm1BygqZEcsRAL1NbgICIkOaaCZCBBsQVxPocURtpQfsFNO6R4bem6OXq5VXhbweJENwVkSrwyzO7', 0, '2024-01-22 04:56:30', '2024-01-22 04:58:04'),
(63, '76054454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8318721504', NULL, NULL, NULL, '7554', NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2024-01-22 10:44:33', '2024-01-22 10:44:33'),
(64, '81186474', 'JSJ3188454', '852136454884', 'akash', 'Male', '2006-01-23', NULL, 'radhe', 'Father', '8934024280', 'akash@gmail.com', NULL, NULL, '1676', NULL, 1, 1, 0, '7dbc36d8c6a949f30945471722d9ed852d9da339a44a4814f7731698a6b747e4', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bFrg9OPoZBhfr5KUY3nYMzv-14tupX7MwfNJ4w-6Tg7EXn8rqNYWYQ3L6Jb1eZCZAQmnaV7_yOgVb5WqrSCt52eU1zjivGZYoA0v18NkE3a5-2aanCiMD3OZra8z5PGozQqX9Rz', 0, '2024-01-23 05:27:56', '2024-01-23 05:29:49'),
(65, '22503887', 'ABC1234567', '254286396658', 'raushan', 'Male', '2006-01-26', NULL, 'mahender lal', 'Father', '8448372087', 'mahinder.lal@outlook.com', NULL, NULL, '4168', NULL, 1, 1, 1, '4081c2557226e1ef3e0a7caf9ae1ddf442d6ff08d592483a4fd702b94b4f0a07', 'android', 'fh2lSjgVQvagGTZanscd4I:APA91bED4g7SR4HPwG6TkE-Pgvv3FV1LRGApiIm2L2IHAeCqcmkfffEfm8Cn8wRNcU5YBhmxvsycx-pcFvtUKqce3TMkFBKOy6U7-Q4cakUK_GyawVW0uM_S1G9FBiVBO6wI-KmP5qgM', 0, '2024-01-26 03:25:43', '2024-01-26 04:28:52'),
(66, '49558315', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8448372087', NULL, NULL, NULL, '9669', NULL, 0, 1, 1, 'de15ec6153d47fe6da2e1612d0969010f5dbad4058481e1bd21e8c7a735ef7b4', 'android', 'fh2lSjgVQvagGTZanscd4I:APA91bED4g7SR4HPwG6TkE-Pgvv3FV1LRGApiIm2L2IHAeCqcmkfffEfm8Cn8wRNcU5YBhmxvsycx-pcFvtUKqce3TMkFBKOy6U7-Q4cakUK_GyawVW0uM_S1G9FBiVBO6wI-KmP5qgM', 0, '2024-01-26 04:29:06', '2024-01-26 04:31:13'),
(67, '44586313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2544888669', NULL, NULL, NULL, '4865', NULL, 0, 1, 0, 'ddcd7260eb1fae89bb0d94fb23a8921c78c510ba99a8aff794fd79bcb823aad0', 'android', 'fh2lSjgVQvagGTZanscd4I:APA91bED4g7SR4HPwG6TkE-Pgvv3FV1LRGApiIm2L2IHAeCqcmkfffEfm8Cn8wRNcU5YBhmxvsycx-pcFvtUKqce3TMkFBKOy6U7-Q4cakUK_GyawVW0uM_S1G9FBiVBO6wI-KmP5qgM', 0, '2024-01-26 04:31:27', '2024-01-26 04:31:30'),
(68, '59914344', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3333333333', NULL, NULL, NULL, '4343', NULL, 0, 1, 0, '9ee929bf5e749f1480166d7394d89f4851e4b3eaac48329603589f55a360d546', 'android', 'fh2lSjgVQvagGTZanscd4I:APA91bED4g7SR4HPwG6TkE-Pgvv3FV1LRGApiIm2L2IHAeCqcmkfffEfm8Cn8wRNcU5YBhmxvsycx-pcFvtUKqce3TMkFBKOy6U7-Q4cakUK_GyawVW0uM_S1G9FBiVBO6wI-KmP5qgM', 0, '2024-01-26 07:02:46', '2024-01-26 07:03:04'),
(69, '19064855', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9519989068', NULL, NULL, NULL, '2167', NULL, 0, 1, 0, 'c11895335771b01ca56379402e4a1aed29a85a668a220fb6d4f9a3dcb9cb90a9', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bHbOwUuuXiAwooRI5iDzYbD55hWIin8jPsrSTVarDzv5stYnDUKamrnT4zfy_9kfeVuucsmZnF1BjEQTpt3kN813ER5o38vqFpLXY9Rge4Nly7IRSFxo_gKivKwCprCW8KiaCOU', 0, '2024-01-26 09:02:16', '2024-01-26 09:02:18'),
(70, '13092114', 'AVF2525468', '253196797679', 'Sujeet', 'Male', '2006-01-11', NULL, 'Ram', 'Father', '9519989060', 'surjeet.alobhatech1@gmail.com', NULL, NULL, '9980', NULL, 1, 1, 0, 'a6516a8453aa4e2ae0c23f1f0a9d0dbbfa17eaf5fe3527544ee8b9d729038cc6', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bHbOwUuuXiAwooRI5iDzYbD55hWIin8jPsrSTVarDzv5stYnDUKamrnT4zfy_9kfeVuucsmZnF1BjEQTpt3kN813ER5o38vqFpLXY9Rge4Nly7IRSFxo_gKivKwCprCW8KiaCOU', 0, '2024-01-26 09:02:59', '2024-01-26 09:05:34'),
(71, '94838325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8808166789', NULL, NULL, NULL, '4583', NULL, 0, 1, 0, 'c269eeb83560fae15807d34a6ff6492c2ec61f864740c950a5bb82a389cbce5f', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bHbOwUuuXiAwooRI5iDzYbD55hWIin8jPsrSTVarDzv5stYnDUKamrnT4zfy_9kfeVuucsmZnF1BjEQTpt3kN813ER5o38vqFpLXY9Rge4Nly7IRSFxo_gKivKwCprCW8KiaCOU', 0, '2024-01-26 09:10:16', '2024-01-26 09:10:18'),
(72, '36551242', 'ABH2134657', '612345457557', 'SUJEET KUMAR', 'Male', '2006-01-06', NULL, 'Bateshwar Dayal', 'Father', '8808166780', 'suneet12@gmail.com', NULL, NULL, '8193', NULL, 1, 1, 0, '6e3fc8fe2974c1bee8e813804ec71fa2534ec32c8b42ce821c157c90dcc7727a', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bHbOwUuuXiAwooRI5iDzYbD55hWIin8jPsrSTVarDzv5stYnDUKamrnT4zfy_9kfeVuucsmZnF1BjEQTpt3kN813ER5o38vqFpLXY9Rge4Nly7IRSFxo_gKivKwCprCW8KiaCOU', 0, '2024-01-26 09:13:10', '2024-01-26 09:19:22'),
(73, '82078682', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9984986953', NULL, NULL, NULL, '3901', NULL, 0, 1, 0, 'f740a496c96d5d49aa9159b16fbcb877e7ebc713b0145e571f0f4247f5c7fc7d', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bHbOwUuuXiAwooRI5iDzYbD55hWIin8jPsrSTVarDzv5stYnDUKamrnT4zfy_9kfeVuucsmZnF1BjEQTpt3kN813ER5o38vqFpLXY9Rge4Nly7IRSFxo_gKivKwCprCW8KiaCOU', 0, '2024-01-26 09:39:09', '2024-01-26 09:39:10'),
(74, '44634705', 'SGV6245454', '973467679797', 'SUJEET KUMAR', 'Male', '2006-01-12', NULL, 'Bateshwar Dayal', 'Father', '6387004933', 'sujeetg@gmail.com', NULL, NULL, '6511', NULL, 1, 1, 0, '5a400e6292307dc1bc54bd6a8bc9027a3ab62c13f9b5ca93a5fed8845a991437', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bHbOwUuuXiAwooRI5iDzYbD55hWIin8jPsrSTVarDzv5stYnDUKamrnT4zfy_9kfeVuucsmZnF1BjEQTpt3kN813ER5o38vqFpLXY9Rge4Nly7IRSFxo_gKivKwCprCW8KiaCOU', 0, '2024-01-26 09:40:15', '2024-01-26 09:41:42'),
(75, '64619819', 'BSB5455454', '967879797979', 'Raj', 'Male', '2006-01-29', NULL, 'Raj', 'Father', '8808808808', 'rajgaggs@gmail.com', NULL, NULL, '2794', NULL, 1, 1, 0, '909749ca3486798dbc345532e732dcce90c73be59d8f7bc1ec99bd8e4a81afd0', 'android', 'dVr4yMeiRXqwbU6ilZHrHO:APA91bF_K8AFCQVVgSzD4aT4RxJAfv_6d3Yv_alEA1QkKbUtXov6XSRPnAPTsooT0sMmSFo09TptrIPtwsdSji_80-G_48pk0swtMNqkObxX-184H_JHK8hK_3MLcbiGtBMrVrSssOIy', 0, '2024-01-29 09:09:46', '2024-01-29 09:12:06'),
(76, '67856583', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9984986943', NULL, NULL, NULL, '7436', NULL, 0, 1, 0, '09d87d151f9c8a5f49d8a450fb483b23f18902f8f608486fe0f6c9a15ad26394', 'android', 'dVr4yMeiRXqwbU6ilZHrHO:APA91bF_K8AFCQVVgSzD4aT4RxJAfv_6d3Yv_alEA1QkKbUtXov6XSRPnAPTsooT0sMmSFo09TptrIPtwsdSji_80-G_48pk0swtMNqkObxX-184H_JHK8hK_3MLcbiGtBMrVrSssOIy', 0, '2024-02-15 11:16:08', '2024-02-15 11:16:10'),
(77, '65553761', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8454884884', NULL, NULL, NULL, '7206', NULL, 0, 1, 0, '779ffcd293e80b191c39e5017caeaabec461184ca3bc7027f51e63ab4b2bf58e', 'android', 'dVr4yMeiRXqwbU6ilZHrHO:APA91bF_K8AFCQVVgSzD4aT4RxJAfv_6d3Yv_alEA1QkKbUtXov6XSRPnAPTsooT0sMmSFo09TptrIPtwsdSji_80-G_48pk0swtMNqkObxX-184H_JHK8hK_3MLcbiGtBMrVrSssOIy', 0, '2024-02-15 11:22:06', '2024-02-15 11:22:07'),
(78, '21553094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6387004932', NULL, NULL, NULL, '4066', NULL, 0, 1, 0, '184e4b8318cd8fbfb3fec4b3a5f2456c60031c471abbc01f94a90200dfb1408e', 'android', 'dVr4yMeiRXqwbU6ilZHrHO:APA91bF_K8AFCQVVgSzD4aT4RxJAfv_6d3Yv_alEA1QkKbUtXov6XSRPnAPTsooT0sMmSFo09TptrIPtwsdSji_80-G_48pk0swtMNqkObxX-184H_JHK8hK_3MLcbiGtBMrVrSssOIy', 0, '2024-02-15 11:22:50', '2024-02-15 11:23:04'),
(79, '91485024', 'ABC1234567', '274588717985', 'Abhishek Pandey', 'Male', '1997-11-25', NULL, 'B Pandey', 'Husband', '9098307615', 'abhishek101.alobha@gmail.com', NULL, NULL, '7026', NULL, 1, 1, 0, 'c9319a357768c90fa632e5659f2ddadc19dd143bab7c36277f75c8539aad3a43', 'android', 'eTr17pWgSSSwrCsWOiP9xW:APA91bGiCF5xFSK5_a_z29ru1GAP6C9P_A46BLD5tKrfNSMIH4dzeXFP5IRG4VmrTcKk2BV-Bbf8dVeZ0uW7Y8rOVBxdnL_nVp0aIMz2j7etDJrBH3-rujgYhrwqagvDYctKNaDFhzRT', 0, '2024-02-29 05:54:39', '2024-02-29 15:26:54'),
(80, '95375028', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5656565656', NULL, NULL, NULL, '3718', NULL, 0, 1, 0, 'c9ac90775eea1e64ac8d3018fe81f76017a704243310eca2b9c28bd6f6b7d33f', 'android', 'fXzWch77TcauzYJ_QfVkWZ:APA91bHDkn6s_LBtrS08VSvsFKuPkcjSGNk8_0AdcJmJEdRfCEGhEXivzfwNjvFlsTC8zBwsMaiezk37xRAtE3SKCix6fAf5AiuhippTDH5veFhPS3XFpDJ3aIR29qmp7_5ZP8XaqUQR', 0, '2024-02-29 06:29:28', '2024-02-29 07:20:35'),
(81, '41142171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9098307618', NULL, NULL, NULL, '8963', NULL, 0, 1, 0, '6c90e753d9593a33dba8dfb7be1383e36b42e8a84240b36134f79f6fa7e60241', 'android', 'cmUZjjx5QeOHYW6pcN0BoM:APA91bHUFfRrYokXMqHpFyZCdd-EG1R-jR_s0WqQTjNm_JQFqBtLByV8lgg9WHW7hBes7Vawi5z4Unporfzm-w9gs7RTJ86gQVlGDsxM_AytkABc2fr5WdMueV3KJOFGgWkP0D9y7zSV', 0, '2024-02-29 07:21:56', '2024-02-29 07:21:57'),
(82, '75928687', 'GDN0225185', '397788000234', 'h', 'Male', '2006-03-10', NULL, 'sushil srivastav', 'Father', '8081781245', 'abhisheksrivastav6777@gmail.com@com@com', NULL, NULL, '5566', NULL, 1, 1, 0, 'cbc3bc654ee097443958944d054ca92e4a66ec6549278cf49e36911d5035f50d', 'android', 'e33WEUAiRe6YSSJ9Ze8N2h:APA91bFpfMiDxf53vZXsuIjPGJZ6xSliv6tC3-LvGCmgOEqzD1WK0FG8d9KdhmIqAZXnoDwM-6ZMTj59xaaVifLo4KRR_WA2ecs5Sd8YuHNt2vL3-wu8qDL8hZAHAsQKQqgMhjZH2Dd8', 0, '2024-02-29 09:23:10', '2024-02-29 12:07:02'),
(83, '93298476', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7985069022', NULL, NULL, NULL, '8478', NULL, 0, 1, 1, '73b8447a3726b3eeeaf90b25dd2e511a6fdfed75add46f05f1b098b4590b84e1', 'android', 'cz4Sek6-RLS2s9uq_c__aR:APA91bEnOWP-UGdSJiYK3kVqACaRo-aX5h4h_KdUK-5Rdloqf70NphO8FQ1MSK7cZE7WNoWotRWjBzfTXlPsY2oVNa3pyrubiHBVGMSPZHxhPmreLYtRw_lTtmDHq1TyH9M-QMEqFxqw', 0, '2024-02-29 11:25:59', '2024-02-29 11:33:37'),
(84, '77905333', 'ABC2902793', '575586987412', 'Anush', 'Female', '2006-03-02', NULL, 'xhjkngu', 'Father', '7985069022', 'sgknkb@gmail.com.comuvufysjg', NULL, NULL, '8168', NULL, 1, 1, 0, 'cb16fd98ce3952d092a011bb4820452d8b61fb1faaee9bb82a105a2f127e2202', 'android', 'cBVYu-C7SS6l2156YNMMx6:APA91bEz-NNW-zUtg5gkai_h-PtB3wFdGLkqWn35kHlN9OInxmeZst6cf3bLsM1iiWicnPbxdBB61JmT6N6xZsXjF_ORKOx-J4miGC-d2B1j-McskygFj-8peC2jLO6jXbBikLxeBNMC', 0, '2024-02-29 11:33:51', '2024-04-19 03:50:54'),
(85, '85052059', NULL, NULL, 'Jean Marie', 'Female', '2006-03-01', 18, 'Pierre', 'Father', '2377484868', 'jeanmarie@gmail.com', '$2y$10$wsdngobrzwdDLkyc/QIY7.jT6e66VipSeYZBkZ9s1nw8oFJkSvLdO', '2377484868', '3215', NULL, 0, 1, 0, '5e8470d25ece85253e53b88f76191740b4cbbef4159748afc8ef308b065f25ce', 'android', 'fVXF7NXrQV-2WmNy8nSgy8:APA91bGvTcW7NClZ78xbEgr3y5vTwwq0ezGyHlqFUcxYyp74wwhUEftYxFQq4WavfKjZKXxrfINyxRnPo3M19BtiCeTy6Vo32yxLXlbwOBMk9hxsdoWSXl3GL4TnZ4jtUI3eU4I2ujEk', 0, '2024-04-24 04:47:07', '2024-04-25 02:08:01'),
(86, '54796994', NULL, NULL, 'Paul', 'Male', '2006-04-20', 18, 'Andre', 'Father', '3242324242', 'Paul123@gmail.com', '$2y$10$2HrJhVfGvZY3.nQDhfUhKuAoErsAvw8Hwi5WJbtXeeErj3RghCjz.', '3242324242', '7933', NULL, 0, 1, 0, 'a16f965aa09bec6416887a677c46c06f1715bed12eb016344bba664446dc92c0', 'android', 'cMi1eZXMRQynB0z_niVqKL:APA91bGZvh0HxaA1ZlIIkvZsWT9KSBoOLHXPC4zAxWoI_E6A2zLDaB8A_F5OpTiv7KxTRYBK5v8eOPUw3fEaZSrC7GYU7NDtOOQjUSrFcu3cZ3xKXelbouXT0NoVicsUqbmySUmUwBkl', 0, '2024-04-24 04:48:12', '2024-04-25 05:24:42'),
(87, '83424490', NULL, '845649464444', 'Paul (Student)', 'Male', '2000-10-17', 23, 'Pierre', 'Father', '2377484860', 'jsna@gmail.com', '$2y$10$XYpY7iKUivNEBJmAXbrKoeQDbMHbx6booIjKzqsTbK0vKuLdc/w/u', '2377484860', '4725', NULL, 1, 1, 0, '4cc832e8aae09f694f3743d8df54788fe31c3ec8ebf63504dc00c6fbf6423de3', 'android', 'fVXF7NXrQV-2WmNy8nSgy8:APA91bGvTcW7NClZ78xbEgr3y5vTwwq0ezGyHlqFUcxYyp74wwhUEftYxFQq4WavfKjZKXxrfINyxRnPo3M19BtiCeTy6Vo32yxLXlbwOBMk9hxsdoWSXl3GL4TnZ4jtUI3eU4I2ujEk', 0, '2024-04-24 05:28:56', '2024-04-29 05:05:47'),
(88, '90922871', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8888989899', NULL, NULL, NULL, '3372', NULL, 0, 1, 0, 'df483575b5b62d47d1f91d78c91e891a83d2f81ca8fcac36a15d8fb8593ab9eb', 'android', 'fFS8DtdMR4u6VICcWQomx_:APA91bFJlP0_sTrBn4TAyn5jyW5Gy4KcWRYEscjxfZGnV7zZExVOfUqb_nI7T2nV3FJz-BCEYYMJAFHDQ_IyLqy8k0fImk6VMLGxsKblhC4cBdYpOjynxqhHXuToj7hXZ1dhxCp93ksr', 0, '2024-05-14 01:27:35', '2024-05-14 01:27:41'),
(89, '39462446', 'ABC5454545', '563427176820', 'deepak', 'Male', '1998-05-23', NULL, 'manoj', 'Father', '9660365200', 'alobha.deepak@gmail.com', NULL, NULL, '9759', NULL, 1, 1, 0, '518462996fd9eab32728ed3962a8350cf0e71d0c6f0052abd99e72cb9da39d90', 'android', 'fAcbHECASbyWNhCMtQgCu3:APA91bGi1ZRC8pI_U5FgNrgCaODYEKCZZ3b9mWCcbp1IoW-LwfuWAwDSqVFsZQTIH07XngPEDY8pI-BRAoH3e9Igt_yBXDa0399q4MtFas0SWVIfOlot3lxlEwZgj1iML_FJRXIuMDLT', 0, '2024-05-14 01:31:05', '2024-05-15 00:55:01'),
(90, '42235110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9199560953', NULL, NULL, NULL, '2449', NULL, 0, 1, 0, 'eb76d08eb6a19f2ac266dd181e12338c363b60dc3ee83d5b9bf51d49e2cfa37f', 'android', 'fE7mqG1DSJ6jcb3JShzdDv:APA91bF-nsw9VGou_tlEalPy4NBNsKAHgZSUkt6SqLypxDBr-P_iBiq3xIqqhMPv7BMyNN4YC8-5ckRwiY4y9RkZCgB3L02OieMe54QzZJdbxftroZvUVTeHiE5gk5-YStbs24oDMeic', 0, '2024-05-21 02:23:22', '2024-05-21 02:23:32'),
(91, 'NSG/22/0406', NULL, NULL, 'MUSIMA GINA-DELSY ELOMO EFFENGE', 'Male', '2006-06-13', NULL, 'Nishang', 'Father', '651412949', 'musimagina@gmail.com', NULL, NULL, NULL, NULL, 1, 1, 0, '3f0ad6cd7eb2b41ff63088cf4b78cd8679c50055761c0ec563648301db86934a', 'android', 'daYDQ6FDSIeyE_9Evv2ElP:APA91bEIyQxPj4NAT9zGcQLIN2LG_CCsx9HauzKQVzfSL1YCqh7BirzeGGdtAw3N3WSWwmF8cR2pS42utU1J7mpoo-P7Z6WQRTHFV1nra6ek_qLKmc-bskak8JW5jUGmfaK6dY-piAOH', 0, '2024-06-11 05:17:18', '2024-07-25 04:41:35'),
(92, 'test', NULL, NULL, 'Test', NULL, NULL, NULL, NULL, NULL, '995609533', 'test@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '278844e0fe45b25f8a499d1433a22c68514ff8db02087ce942b677c49313fd5b', 'android', 'dsPbDBzMT4KkQ9meammxTI:APA91bHYiwLcQIiMftsJgyCUMmjKJwWz8ewcBjLohZF81FX1fe79qB3W7es3ix7syz-5ynlNvViDGTP_2ENqRRWjSyv4sJ6bhXjCd2Nj2FRBT_OMV2f8AF5AtQIthilz5ipNRooVJc7U', 0, '2024-06-11 06:27:47', '2024-06-17 01:34:36'),
(93, 'NSG/22/0083', NULL, NULL, 'ATUH CELINE NTONE', NULL, NULL, NULL, NULL, NULL, '654558994', 'celine@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, 'f4ce92f2434b0eceb6ec707c6b8b09b9e281255aa9ccc214d49b9110a558102d', 'android', 'fIDuxL3-RaGhZeqSL8F0XS:APA91bGalmjriIeGLRVA5cbeHPlBd54_Slsm8kWuVz6Wj2xeckJfj9z-GEDbZSeos9nRl19W-n4CSEaBLhmergH7vUG3tUNr72DT_sToq_3Y3WejfWRptIy3I1YH3GdzZl4YLfeJs16B', 0, '2024-06-13 02:01:07', '2024-07-13 10:48:35'),
(94, 'NISHANG', NULL, NULL, 'NISHANG TEST', NULL, NULL, NULL, NULL, NULL, '679135427', 'iishang@yahoo.com', NULL, NULL, NULL, NULL, 0, 1, 0, 'f928b72082c6ec809b8dbc686bcbdbda4ee8930eba7e2f2a88c0e56f833e0a05', 'android', 'cepr2i1YQyu7Qt_dvGw4Ds:APA91bESQ7osxu7aDxuoGJzjQ--uaQ_76rQKf4yI-OHcBRrFyaEd5hkPYmAzIpC5jWUcd4MDVfUdZQguDYon4B0WamTrJ2TcO6_C0VR6fM8d1IWUJWKkbVaGuiHhbpV9T-SnOjEY6Oci', 0, '2024-06-13 09:11:11', '2024-06-16 01:29:36'),
(95, 'GERMAN', NULL, NULL, 'GERMANO TEST', NULL, NULL, NULL, NULL, NULL, '237672394352', 'germano@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '5598e0fc487c11bf608ebe6980371694b4adb36c991864074d1c333eb1dd07f1', 'android', 'cVOZYHM9REOqzwLmWqhVtP:APA91bF4UpHYQS2yA8UA_YrfSbPYA1_rK_qxQaqOTI_1bEqNmdzimpUfnO-2D0mkmcqx24TqKWkpf7pfZtN4vkkMct_lNSUy4xOtPbkdPVdlw0z-ptic1GmjI7JsCjCTGlHyw0OKmilg', 0, '2024-06-18 00:21:31', '2024-07-09 05:51:48'),
(96, 'MPH/22/0008', NULL, NULL, 'TANGOUENTA TCHUATENE MAUDE LYNDSAY', NULL, NULL, NULL, NULL, NULL, '697986364', 'tchuatene.tangouenta@slui.org', NULL, NULL, NULL, NULL, 0, 1, 0, '0d3838d82830a64189f06d2cb0b03c29c1504494a82d304ed666ba3b39661fa5', 'android', 'cKU3vKo7QKOwX8v8FBTyPf:APA91bGbFCZ83cQLc5ed6Y3GlTcb8JmtbvGbwcOgK6AQ4D6OBNi7I5cY7HIAQ2dSjIlacFNVCAD03pBqXZMwpJyzTC-hrOBq8Bn46w6q0jYFj8DhxoSmgjPlVOUqLwnzY-icNBUH8uiI', 0, '2024-06-18 16:50:10', '2024-06-18 16:50:10'),
(97, '10034662', NULL, NULL, 'Annu Yadav', 'Female', '2006-06-19', 18, 'ABCD', 'Father', '1122334455', 'annu.alobha@gmail.com', '$2y$10$d6bqg05Fik9Bl63abHKEEuctwxSt9uiS50Ibc5rmefq5shixCWFsW', '1122334455', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2024-06-19 02:07:03', '2024-06-19 02:07:03'),
(98, 'BNS/22/0011', NULL, NULL, 'FRIKAH KELLIE ANUTIKA', NULL, NULL, NULL, NULL, NULL, '651211878', 'frikellie@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, 'fddd116f3f7f8ec025d3fcaea7368589a0395e91aba06dfed92bef66df9bd689', 'android', 'cMWCEDO6Q-e78KK3YRkFP9:APA91bHmezRNS6mJS7Q_IZIRS7mrEVzVPQ5R7Hl303c-fv20vTehkSzZxvoyPIkbzDeF-OCB4nuvPFUbvyT0wFWf6KWnuhOlqph4D4aYhhxlK8i7hZSNSY6iRwJzeThEmPw_yiI-UFSx', 0, '2024-06-19 12:31:29', '2024-06-19 12:31:29'),
(99, '96840660', 'WERTYU3456', '345678976543', 'Test User', 'Female', '2002-08-29', 22, 'TEST', 'Mother', '8423220414', 'bhumikatripathi292002@gmail.com', '$2y$10$NhTPIgRvXYkKUcVbwUAVeuLXFcxDaUFGidGr1IAoqUbcGxKMXBhRC', '8423220414', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, 0, '2024-07-09 05:15:40', '2024-07-09 05:15:40'),
(100, 'MIT/21/0007', NULL, NULL, 'TEWOUO NGAFE ILIASSOU', NULL, NULL, NULL, NULL, NULL, '678986828', 'iliasakieme7@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '8f5b109d97887c1ffbddae961c02e5b0bfb3b64cc8066c771362d802b0c76950', 'android', 'cnQ-YmTbS6O5XRNQGHW_2T:APA91bHUUw10YuxwsmfFDEfuSRaYgv_bFFDQrmS-c7vOYU2iw_z-zqXAuu9-Dcb3PJchdDDhLc5dzcWDeRg6GSNQgGjvw8zdDtp7l4KmfcLlpxaCWIaejhAgJUmUtvcZdPU7CZoefQUx', 0, '2024-07-09 08:20:53', '2024-07-22 07:36:35'),
(101, 'NSG/21/0228', NULL, NULL, 'MBONG GIFTY KUM', NULL, NULL, NULL, NULL, NULL, '677844754', 'mbonggifty922@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '53333d763bf3f52c5c386256eb5f7ab493e7ef47c8387b3b1b2ef10b81fc1ad3', 'android', 'fIDuxL3-RaGhZeqSL8F0XS:APA91bGalmjriIeGLRVA5cbeHPlBd54_Slsm8kWuVz6Wj2xeckJfj9z-GEDbZSeos9nRl19W-n4CSEaBLhmergH7vUG3tUNr72DT_sToq_3Y3WejfWRptIy3I1YH3GdzZl4YLfeJs16B', 0, '2024-07-09 10:13:49', '2024-07-09 10:13:49'),
(102, 'SLU-BMLS-22-1756', NULL, NULL, 'ISA ABDORAMAN', NULL, NULL, NULL, NULL, NULL, '654078677', 'isaabdoraman@38gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '74c848d3f1157544977cc68b1a709f03226be235170d65e0789a816a3536ce4c', 'android', 'fIDuxL3-RaGhZeqSL8F0XS:APA91bGalmjriIeGLRVA5cbeHPlBd54_Slsm8kWuVz6Wj2xeckJfj9z-GEDbZSeos9nRl19W-n4CSEaBLhmergH7vUG3tUNr72DT_sToq_3Y3WejfWRptIy3I1YH3GdzZl4YLfeJs16B', 0, '2024-07-09 10:15:38', '2024-07-09 10:15:38'),
(103, 'MPY/23/0002', NULL, NULL, 'Mbah Sigismund Nyanga', NULL, NULL, NULL, NULL, NULL, '676243586', 'mbabitesroyal@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '4cfd9459109538ce74e1268face190ac74f878035ea979b1fcde14b0a6c05767', 'android', 'd7_1a5QrRxSxZjGk-oa0_G:APA91bGO7S1y0Ctalvu7SNGFLKHOvEGebcjh1Qsds9E4Ju52VTSZVcIbeiyQ7ozHdaACMhpJJmuxxiw_xX4mO6FkRCWcVdtiHJPrdU8RNKQDskVrLosOcx7lwRUMheDZc3hR6tqHBHkQ', 0, '2024-07-22 06:35:59', '2024-07-24 08:20:48'),
(104, 'MLS/22/0024', NULL, NULL, 'BELANGO CORADE NZEBELE', NULL, NULL, NULL, NULL, NULL, '651838988', 'belangocorade@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '5e9b4554b44bd325734dbc9d40311b32d90f5d69fee65b0724e9b04fa1a80695', 'android', 'cnQ-YmTbS6O5XRNQGHW_2T:APA91bHUUw10YuxwsmfFDEfuSRaYgv_bFFDQrmS-c7vOYU2iw_z-zqXAuu9-Dcb3PJchdDDhLc5dzcWDeRg6GSNQgGjvw8zdDtp7l4KmfcLlpxaCWIaejhAgJUmUtvcZdPU7CZoefQUx', 0, '2024-07-22 10:44:58', '2024-07-22 10:44:58'),
(105, 'DEN/23/0018', NULL, NULL, 'Sadwamou Djeve Adolphe', NULL, NULL, NULL, NULL, NULL, '698252527', 'nia71908@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '11cfbc90ae5a4813f0aa48be1bc9a2803f350dc418b427eacd62addd41b243b4', 'android', 'c0cT8XAoT-Gc93WNnTmJ0W:APA91bEUIjhtiNRM1BWlKAun4Nw_PTl8ulQHMsESJibWOKFgpWPl4FGuM9iOD83CAVgInDLc_TbUSGysCcPErVVKJzPgcuw1jSnXUtPRW7XUzF9E_drbMHB7il6ba73OeI2kJLAjbrFJ', 0, '2024-07-24 09:05:43', '2024-07-25 02:28:52');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `tehsil_id` int DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parliamentary_id` int DEFAULT NULL,
  `assembly_id` int DEFAULT NULL,
  `town_village_id` int DEFAULT NULL,
  `panchayat_ward_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `block_id` int DEFAULT NULL,
  `thana_id` int DEFAULT NULL,
  `post_office_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `land_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `customer_id`, `state_id`, `district_id`, `tehsil_id`, `area`, `parliamentary_id`, `assembly_id`, `town_village_id`, `panchayat_ward_id`, `block_id`, `thana_id`, `post_office_id`, `house_no`, `land_mark`, `locality`, `pincode`, `created_at`, `updated_at`) VALUES
(1, 1, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '123', NULL, '12', '454654', '2023-11-17 07:32:17', '2023-11-17 07:33:47'),
(2, 2, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '106 H Block', NULL, 'Noida', '201301', '2023-11-17 09:21:20', '2023-11-28 12:54:24'),
(3, 3, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', 'building', NULL, 'street', '201301', '2023-11-20 12:22:40', '2023-11-20 12:23:55'),
(4, 4, 38, 1, 4, 'Urban', 1, 1, 1, '1', 0, 1, '1', '2', NULL, 'na', '262528', '2023-11-22 06:27:33', '2023-12-29 05:28:25'),
(5, 5, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-11-22 06:32:23', '2023-11-22 06:32:23'),
(6, 6, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-11-22 07:12:53', '2023-11-22 07:12:53'),
(7, 7, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '301', NULL, 'Abc', '120012', '2023-11-23 04:58:27', '2023-11-28 12:19:27'),
(8, 8, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '106', NULL, 'block h 106', '201301', '2023-11-23 05:47:12', '2023-11-23 05:48:29'),
(9, 9, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '106', NULL, 'block h sector 63', '201301', '2023-11-23 05:49:03', '2023-11-23 05:50:12'),
(10, 10, 38, 1, 4, 'Urban', 1, 1, 1, '1', 1, 1, '1', '49', NULL, 'sector', '69500', '2023-11-23 05:49:57', '2023-11-28 12:22:26'),
(11, 11, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', 'ghh', NULL, 'zzz', '121002', '2023-11-23 06:32:13', '2023-11-23 06:36:21'),
(12, 12, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', 'Aaj', NULL, 'noid', '785222', '2023-11-28 12:43:54', '2023-12-07 12:16:53'),
(13, 13, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', 'xyz', NULL, 'xyz', '123456', '2023-11-29 08:12:19', '2023-11-29 10:43:38'),
(14, 14, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', 'all', NULL, 'am', '123456', '2023-12-01 11:44:36', '2023-12-11 07:20:13'),
(15, 15, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', 'buildin', NULL, 'locality', '201301', '2023-12-01 12:01:25', '2023-12-07 13:39:58'),
(16, 16, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2023-12-04 11:38:09', '2024-01-06 21:28:12'),
(17, 17, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '1', NULL, 'khair', '123456', '2023-12-06 05:50:42', '2023-12-06 06:52:33'),
(18, 18, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2023-12-07 11:52:52', '2023-12-07 13:29:17'),
(19, 19, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-07 11:57:57', '2023-12-07 11:57:57'),
(20, 20, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-07 12:24:29', '2023-12-07 12:24:29'),
(21, 21, 38, 1, 0, NULL, 1, 1, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-08 07:33:20', '2023-12-08 07:33:20'),
(22, 22, 38, 1, 0, NULL, 1, 1, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-08 07:33:39', '2023-12-08 07:33:39'),
(23, 23, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-08 11:12:11', '2023-12-08 11:12:11'),
(24, 24, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-11 05:21:16', '2023-12-11 05:21:16'),
(25, 25, 38, 1, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, 'xyz', NULL, '2023-12-11 05:29:42', '2023-12-11 07:22:52'),
(26, 26, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-11 10:10:14', '2023-12-11 10:10:14'),
(27, 27, 38, 1, 4, 'Urban', 1, 1, 1, '1', 0, 1, '1', 'xyz', NULL, 'xyz', NULL, '2023-12-11 10:11:18', '2023-12-11 11:04:50'),
(28, 28, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-11 13:01:06', '2023-12-11 13:01:06'),
(29, 29, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-15 10:32:34', '2023-12-15 10:32:34'),
(30, 30, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-18 06:31:51', '2023-12-18 06:31:51'),
(31, 31, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-18 11:57:23', '2023-12-18 11:57:23'),
(32, 32, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-18 11:59:02', '2023-12-18 11:59:02'),
(33, 33, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-18 12:00:17', '2023-12-18 12:00:17'),
(34, 34, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-18 12:07:13', '2023-12-18 12:07:13'),
(35, 35, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-18 12:49:19', '2023-12-18 12:49:19'),
(36, 36, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-18 12:54:36', '2023-12-18 12:54:36'),
(37, 37, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-21 14:04:39', '2023-12-21 14:04:39'),
(38, 38, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-22 05:34:46', '2023-12-22 05:34:46'),
(39, 39, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-22 05:35:03', '2023-12-22 05:35:03'),
(40, 40, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2023-12-22 06:06:16', '2023-12-22 06:29:26'),
(41, 41, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2023-12-22 09:29:28', '2023-12-22 09:29:28'),
(42, 42, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-28 10:59:23', '2023-12-28 10:59:23'),
(43, 43, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-28 12:18:33', '2023-12-28 12:18:33'),
(44, 44, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '05', NULL, 'Gabhna', '226015', '2023-12-29 05:36:20', '2024-02-15 11:25:25'),
(45, 45, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-29 06:28:10', '2023-12-29 06:28:10'),
(46, 46, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-02 11:33:22', '2024-01-02 11:33:22'),
(47, 47, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-02 11:33:58', '2024-01-02 11:33:58'),
(48, 48, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-03 05:28:34', '2024-01-03 05:28:34'),
(49, 49, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-03 05:40:45', '2024-01-03 05:40:45'),
(50, 50, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-03 05:45:09', '2024-01-03 05:45:09'),
(51, 51, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-03 13:00:12', '2024-01-03 13:00:12'),
(52, 52, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2024-01-04 07:12:13', '2024-01-04 07:14:11'),
(53, 53, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-04 07:22:10', '2024-01-04 07:22:10'),
(54, 54, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-05 09:50:30', '2024-01-05 09:50:30'),
(55, 55, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2024-01-10 06:25:16', '2024-01-10 07:37:25'),
(56, 56, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-10 09:36:54', '2024-01-10 09:36:54'),
(57, 57, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-10 09:37:52', '2024-01-10 09:37:52'),
(58, 58, 38, 1, 4, 'Urban', 1, 1, 1, '1', 0, 1, '1', NULL, NULL, NULL, NULL, '2024-01-10 09:38:31', '2024-01-10 09:40:16'),
(59, 59, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2024-01-15 06:10:32', '2024-01-30 11:24:30'),
(60, 60, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '26 a', NULL, 'Localit', '201301', '2024-01-15 12:08:17', '2024-01-15 12:30:29'),
(61, 61, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-15 12:32:54', '2024-01-15 12:32:54'),
(62, 62, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2024-01-22 04:56:30', '2024-01-22 04:58:04'),
(63, 63, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-22 10:44:33', '2024-01-22 10:44:33'),
(64, 64, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, NULL, '2024-01-23 05:27:56', '2024-01-23 05:29:31'),
(65, 65, 38, 1, 4, 'Urban', 1, 1, 1, '1', 0, 1, '1', '11/34', NULL, 'ukaslue', '524112', '2024-01-26 03:25:43', '2024-01-26 03:40:18'),
(66, 66, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-26 04:29:06', '2024-01-26 04:29:06'),
(67, 67, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-26 04:31:27', '2024-01-26 04:31:27'),
(68, 68, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-26 07:02:46', '2024-01-26 07:02:46'),
(69, 69, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-26 09:02:16', '2024-01-26 09:02:16'),
(70, 70, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, '226012', '2024-01-26 09:02:59', '2024-01-26 09:05:34'),
(71, 71, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-26 09:10:16', '2024-01-26 09:10:16'),
(72, 72, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, '229012', '2024-01-26 09:13:10', '2024-01-26 09:14:39'),
(73, 73, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-01-26 09:39:09', '2024-01-26 09:39:09'),
(74, 74, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, '226012', '2024-01-26 09:40:15', '2024-01-26 09:41:42'),
(75, 75, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', NULL, NULL, NULL, '226012', '2024-01-29 09:09:46', '2024-01-29 09:12:06'),
(76, 76, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-02-15 11:16:08', '2024-02-15 11:16:08'),
(77, 77, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-02-15 11:22:06', '2024-02-15 11:22:06'),
(78, 78, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-02-15 11:22:50', '2024-02-15 11:22:50'),
(79, 79, 38, 1, 4, 'Urban', 1, 1, 1, '1', 0, 1, '1', 'H163', NULL, 'NA', '201301', '2024-02-29 05:54:39', '2024-02-29 06:30:20'),
(80, 80, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-02-29 06:29:28', '2024-02-29 06:29:28'),
(81, 81, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-02-29 07:21:56', '2024-02-29 07:21:56'),
(82, 82, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '23', NULL, 'pisava', '200201', '2024-02-29 09:23:10', '2024-02-29 11:32:37'),
(83, 83, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-02-29 11:25:59', '2024-02-29 11:25:59'),
(84, 84, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', 'xgzggjjk', NULL, 'yfvkbmcg', '458759', '2024-02-29 11:33:51', '2024-03-01 04:32:42'),
(85, 85, 10, 6, 0, 'Urban', 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, '23788', '2024-04-24 04:47:07', '2024-04-24 04:47:07'),
(86, 86, 10, 7, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, '56543', '2024-04-24 04:48:12', '2024-04-24 04:48:12'),
(87, 87, 10, 7, 9, 'Urban', 2, 2, 2, '2', 0, 2, '2', '+54', NULL, 'ad', '512156', '2024-04-24 05:28:56', '2024-04-25 06:10:46'),
(88, 88, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-05-14 01:27:35', '2024-05-14 01:27:35'),
(89, 89, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', 'test', NULL, 'test', '203126', '2024-05-14 01:31:05', '2024-05-14 01:50:06'),
(90, 90, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-05-21 02:23:22', '2024-05-21 02:23:22'),
(91, 91, 5, 8, 10, 'Rural', 3, 3, 3, '3', 5, 3, '3', '95A', NULL, 'H-95', '802301', '2024-06-11 05:17:18', '2024-07-25 04:41:35'),
(92, 92, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-06-11 06:27:47', '2024-06-11 06:27:47'),
(93, 93, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-06-13 02:01:07', '2024-06-13 02:01:07'),
(94, 94, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-06-13 09:11:11', '2024-06-13 09:11:11'),
(95, 95, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-06-18 00:21:31', '2024-06-18 00:21:31'),
(96, 96, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-06-18 16:50:10', '2024-06-18 16:50:10'),
(97, 97, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-06-19 02:07:03', '2024-06-19 02:07:03'),
(98, 98, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-06-19 12:31:29', '2024-06-19 12:31:29'),
(99, 99, 38, 1, 3, 'Urban', 1, 1, 0, '0', 0, 0, '0', NULL, NULL, NULL, '123456', '2024-07-09 05:15:40', '2024-07-09 05:15:40'),
(100, 100, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-07-09 08:20:53', '2024-07-09 08:20:53'),
(101, 101, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-07-09 10:13:49', '2024-07-09 10:13:49'),
(102, 102, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-07-09 10:15:38', '2024-07-09 10:15:38'),
(103, 103, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-07-22 06:35:59', '2024-07-22 06:35:59'),
(104, 104, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-07-22 10:44:58', '2024-07-22 10:44:58'),
(105, 105, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2024-07-24 09:05:43', '2024-07-24 09:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Deparment 1', 0, '2023-09-06 07:50:04', '2024-04-24 05:23:32'),
(2, 'Department 2', 0, '2023-09-06 07:50:19', '2024-04-24 05:23:28'),
(3, 'Departmet-4', 0, '2023-09-06 09:01:18', '2024-04-24 05:23:21'),
(4, 'Department-6', 0, '2023-09-06 09:11:46', '2024-04-24 05:23:16'),
(5, 'New Department 2', 0, '2023-10-03 10:32:16', '2024-04-24 05:23:12'),
(6, 'Student Record', 1, '2024-04-24 05:24:09', '2024-04-24 05:24:09'),
(7, 'Exams Management', 1, '2024-04-24 05:24:19', '2024-04-24 05:24:19'),
(8, 'Finance Management', 1, '2024-04-24 05:24:29', '2024-04-24 05:24:29'),
(9, 'Transport Management', 1, '2024-04-24 05:24:40', '2024-04-24 05:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 'Aligarh', 1, '2023-09-06 07:18:39', '2023-09-07 09:26:28'),
(5, 38, 'GB Nagar', 1, '2023-10-06 06:04:45', '2023-10-26 09:10:26'),
(6, 10, 'Yaounde', 1, '2024-04-24 04:42:44', '2024-04-24 04:42:44'),
(7, 10, 'Cameroon', 1, '2024-04-24 04:42:58', '2024-04-25 06:22:44'),
(8, 5, 'Bhojpur', 1, '2024-06-11 06:40:36', '2024-06-11 06:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `leader_id` int NOT NULL DEFAULT '0',
  `added_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `leader_id`, `added_by`, `title`, `description`, `address`, `image`, `video`, `event_date`, `start_date_time`, `end_date_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'admin', 'Today Meeting', 'Techsar Epub Meeting', '71- Khair', NULL, NULL, '2023-11-29', '2023-11-29 11:00:00', '2023-11-29 16:30:00', 1, '2023-11-28 13:10:14', '2023-11-28 13:10:14'),
(2, 2, 'leader', '12', 'xyz', 'khair', 'images/event/17013270388861.png', 'images/event/17013270388872.mp4', '2023-12-01', '2023-12-01 12:18:00', '2023-12-01 15:18:00', 1, '2023-11-30 06:50:38', '2023-11-30 06:50:38'),
(3, 0, 'admin', 'testing event', 'testing event meeting', 'test@gmail.com', 'images/event/17018558333312.png', 'images/event/17018558333333.png', '2023-12-06', '2023-12-06 15:00:00', '2023-12-06 18:12:00', 1, '2023-12-06 09:43:53', '2023-12-06 09:43:53'),
(4, 0, 'admin', 'today road show khair', 'road show', '71- Khair', 'images/event/17020345253392.png', 'images/event/17020345253419.png', '2023-12-08', '2023-12-08 18:52:00', '2023-12-08 20:54:00', 1, '2023-12-08 11:22:05', '2023-12-08 11:22:05'),
(5, 0, 'admin', 'Today meeting with Team', 'Important', 'Noida sector 62', NULL, NULL, '2023-12-12', '2023-12-12 11:00:00', '2023-12-12 14:00:00', 1, '2023-12-11 11:52:48', '2023-12-11 11:52:48'),
(6, 0, 'admin', 'urgent meeting', 'Important discussion', 'Noida sector 62', NULL, NULL, '2023-12-11', '2023-12-11 18:00:00', '2023-12-11 20:00:00', 1, '2023-12-11 11:54:42', '2023-12-11 11:54:42'),
(7, 0, 'admin', 'xyz', 'xyz', 'xyz', NULL, NULL, '2023-12-09', '2023-12-09 17:25:00', '2023-12-09 19:25:00', 1, '2023-12-11 11:55:30', '2023-12-11 11:55:30'),
(8, 3, 'leader', 'Deepika test event', 'Deepika events', 'event planning', NULL, NULL, '2023-12-22', '2023-12-22 17:35:00', '2023-12-23 16:35:00', 1, '2023-12-22 11:05:56', '2023-12-22 11:05:56'),
(9, 0, 'admin', 'New Best Events', 'Test', 'Noida', NULL, NULL, '2023-12-29', '2023-12-29 13:01:00', '2024-01-05 14:40:00', 1, '2023-12-29 07:11:02', '2023-12-29 07:11:02'),
(10, 0, 'admin', 'Events', 'Test', 'Noida', NULL, NULL, '2024-02-16', '2024-02-16 03:46:00', '2025-08-28 18:47:00', 1, '2023-12-29 07:12:07', '2023-12-29 07:14:38'),
(11, 1, 'leader', 'Event Test', 'Description', 'Noida', NULL, NULL, '2024-01-02', '2024-01-02 15:11:00', '2024-01-03 15:11:00', 1, '2024-01-02 09:41:49', '2024-01-02 09:41:49'),
(12, 1, 'leader', 'Event Test 2', 'Description', 'Noida', NULL, NULL, '2024-01-03', '2024-01-03 15:14:00', '2024-01-04 15:14:00', 1, '2024-01-02 09:44:39', '2024-01-02 09:44:39'),
(13, 4, 'leader', 'test', 'test', 'noida', NULL, NULL, '2024-01-05', '2024-01-05 10:50:00', '2024-01-26 00:00:00', 1, '2024-01-04 04:50:36', '2024-01-04 04:50:36'),
(14, 4, 'leader', 'Bhandaara', 'Please come!', 'Noida sector 63', 'images/event/17047128912449.png', 'images/event/17047128912466.mp4', '2024-01-09', '2024-01-09 10:00:00', '2024-01-09 19:00:00', 1, '2024-01-08 11:21:31', '2024-01-08 11:21:31'),
(15, 4, 'leader', 'new Event', 'test', 'noida', 'images/event/17048826191084.png', NULL, '2024-01-11', '2024-01-11 10:00:00', '2024-01-13 16:00:00', 1, '2024-01-10 10:30:19', '2024-01-10 12:24:32'),
(16, 0, 'admin', 'New Events', 'test', 'noida', NULL, NULL, '2024-01-16', '2024-01-16 17:49:00', '2024-01-17 17:49:00', 1, '2024-01-10 12:19:54', '2024-01-15 06:58:55'),
(17, 0, 'admin', 'Admin Events', 'NAnann', 'noida', NULL, NULL, '2024-01-10', '2024-01-10 20:56:00', '2024-01-20 17:56:00', 1, '2024-01-10 12:26:48', '2024-01-10 12:28:11'),
(18, 1, 'leader', 'ttt', 'description', 'address', NULL, NULL, '2024-01-16', '2024-01-16 14:39:00', '2024-01-17 14:39:00', 1, '2024-01-15 09:09:34', '2024-01-15 09:09:34'),
(19, 1, 'leader', 'sdfsfd', 'sdfdsf', 'sdfsdfs', NULL, NULL, '2024-01-23', '2024-01-23 15:36:00', '2024-01-24 15:36:00', 1, '2024-01-22 10:06:32', '2024-01-22 10:06:32'),
(20, 4, 'leader', 'new', 'test', 'noida', NULL, NULL, '2024-01-24', '2024-01-24 12:16:00', '2024-01-24 16:16:00', 1, '2024-01-23 06:46:19', '2024-01-23 06:46:19'),
(21, 1, 'leader', 'hhh', 'desc', 'juu', 'images/event/17059940230827.jpg', 'images/event/17059940230843.mp4', '2024-01-24', '2024-01-24 12:43:00', '2024-01-25 12:43:00', 1, '2024-01-23 07:13:43', '2024-01-23 07:13:43'),
(22, 4, 'leader', 'new', 'test', 'noida', NULL, NULL, '2024-01-24', '2024-01-24 12:52:00', '2024-01-24 13:52:00', 1, '2024-01-23 07:23:06', '2024-01-23 07:23:06'),
(23, 4, 'leader', 'test', 'na', 'Noida', 'images/event/17059946808486.png', NULL, '2024-01-24', '2024-01-24 12:53:00', '2024-01-24 12:58:00', 1, '2024-01-23 07:24:40', '2024-01-23 07:24:40'),
(24, 1, 'leader', 'test', 'gh', 'all fbh', 'images/event/17091912530744.jpg', 'images/event/17091912530777.mp4', '2024-03-01', '2024-03-01 12:50:00', '2024-03-01 13:50:00', 1, '2024-02-29 07:20:53', '2024-02-29 07:20:53'),
(25, 0, 'admin', 'Annual Function', 'Everyone Come', 'Biaka', 'images/event/17139543016509.jpg', NULL, '2024-04-27', '2024-04-27 16:52:00', '2024-05-01 17:53:00', 1, '2024-04-24 04:55:01', '2024-04-24 04:55:01'),
(26, 0, 'admin', 'Testing Server', 'Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.Lorem ipsum dolor sit amet consectetur adipiscing elit ligula, consequat ut maecenas facilisi ad sed laoreet viverra, tempor at donec sociosqu duis ullamcorper class. Hendrerit lacinia integer eu cubilia maecenas dictum tempor, velit aenean parturient elementum arcu enim blandit, id dui magnis luctus semper nunc. Eros porta cum est et magnis sollicitudin netus fames tristique, eleifend ullamcorper a lacinia fringilla curae potenti platea, ridiculus mi tempor elementum nascetur habitasse ligula nostra.', 'H95', 'images/event/17181086035395.jpg', NULL, '2024-06-11', '2024-06-11 17:59:00', '2024-06-11 19:52:00', 1, '2024-06-11 06:53:23', '2024-06-11 06:53:23'),
(27, 0, 'admin', 'Holiay', 'Hii All', 'H-106 Sector 63 Noida', NULL, NULL, '2024-06-12', '2024-06-12 10:16:00', '2024-06-13 10:16:00', 1, '2024-06-11 23:16:21', '2024-06-11 23:16:21'),
(28, 1, 'leader', 'tedt', 'ugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigxugcifogxufzufzufzyfzmvxufdufzhfzydzufzufxufzjfxufzufzufzufzufzhfzyfxhfzjfzufzufzufzufxufxufxufxigxifxigxkgxjvckbckvxkvmvxjgxjfxufxufxufxigxigxigxigxigx', 'na', NULL, NULL, '2024-07-18', '2024-07-18 17:11:00', '2024-07-18 23:11:00', 1, '2024-07-17 01:13:42', '2024-07-17 01:13:42'),
(29, 8, 'leader', 'Second semester exams', 'Our exams starts soon', 'All HND nursing', NULL, NULL, '2024-07-24', '2024-07-24 18:29:00', '2024-07-31 18:29:00', 1, '2024-07-18 11:59:45', '2024-07-18 11:59:45'),
(30, 8, 'leader', 'Youth day', 'come one come all', 'on campus', NULL, NULL, '2024-07-24', '2024-07-24 18:30:00', '2024-08-08 18:30:00', 1, '2024-07-18 12:00:51', '2024-07-18 12:00:51'),
(31, 1, 'leader', 'staff meeting', 'we have a staff meeting', 'on campus', NULL, NULL, '2024-07-19', '2024-07-19 18:35:00', '2024-07-19 20:35:00', 1, '2024-07-18 12:05:49', '2024-07-18 12:05:49'),
(32, 1, 'leader', 'staff meeting', 'hdhdh\nnsnsn', 'on campus', NULL, NULL, '2024-07-20', '2024-07-20 13:19:00', '2024-07-20 15:19:00', 1, '2024-07-19 06:49:37', '2024-07-19 06:49:37'),
(33, 1, 'leader', 'test', 'na', 'na', NULL, NULL, '2024-07-26', '2024-07-26 17:57:00', '2024-07-26 22:58:00', 1, '2024-07-25 04:58:11', '2024-07-25 04:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `executives`
--

CREATE TABLE `executives` (
  `id` bigint UNSIGNED NOT NULL,
  `executive_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voter_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhaar_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `guardian_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `executives`
--

INSERT INTO `executives` (`id`, `executive_unique_id`, `voter_id`, `aadhaar_card`, `name`, `gender`, `dob`, `age`, `guardian_name`, `relation`, `mobile`, `email`, `password`, `show_password`, `otp`, `forgot_otp`, `api_token`, `device_type`, `device_token`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '11179417', '12345kjhui', '879798798789', 'Ravi', 'Male', '2005-11-17', NULL, 'father', 'Father', '9876543210', 'ravi@gmail.com', '$2y$10$3be21S3vqBpxc/TmL2BlD.JDpwtNr6NdnS51lw3n/WyQa9ycqNVTG', '123456', '1495', NULL, '4bb623b99d19951e9577ce11b7f41343681e9c2329b7e09877e761719590adf3', 'android', 'dLRZXp_dT0iszMQdPrny6b:APA91bH-zf7p23S6Xw8sDqxNwF6D3OTNL3FI6wFaUXn9jiznrO0atKGy6ppoDVgxPawl5T7bZisHUEBq_XN0RviYiiLMSSEQ6eLf-K2of1L1_FITnyO-svRmOrnpQkfrOXIIMT2mMNHw', 1, 0, '2023-11-17 07:32:43', '2024-07-05 00:03:37'),
(2, '44518362', 'JI34JHDS25', '912265256843', 'Sujeet Kumar (Executive)', 'Male', '2001-07-22', 22, 'Bateshwar dayal', 'Father', '8808166289', 'surjeet.alobhatech@gmail.com', '$2y$10$EVu91Fc86nApXDER1.FgmOHV8Kh7Xvy912AFgY0cbJO1iLnmqRCtO', '123456', '6285', NULL, '2e544ddf223818e44f7d6de2ad65e2b0a712f29ceb968514f9435ec35e61702a', 'android', 'fUAVT52GT4-ISttOIWGBjz:APA91bGR_xVJEVOObbcS7BAhkNMQeTm3dH05vEEXABCAnhh0GyjLWtJ10Y9n_E_-JY50ZIKq_gWPS5gdj53p0HaqXlYSt3538pEOmNC6qtNjpif8nW8ZSRTeGCyzvov9gFvxSb2rrAKl', 0, 0, '2023-11-22 07:31:26', '2024-04-25 06:32:14'),
(3, '48049935', 'AFX2089217', '374672864782', 'Raj', 'Male', '2000-12-31', NULL, 'Jay Singh', 'Father', '9792779707', 'raj123@gmail.com', '$2y$10$l9J3NSqNIEcp1V6GaFNK4eTH5qQXTU2gUTvV/jrxgH/H.cOdREBaK', '12345678', '4816', NULL, '7e98dc5dac21337ca689827b5f15c430c12f88ca5e0c8d0472f7f25aae9c89b9', 'android', 'cBVYu-C7SS6l2156YNMMx6:APA91bEz-NNW-zUtg5gkai_h-PtB3wFdGLkqWn35kHlN9OInxmeZst6cf3bLsM1iiWicnPbxdBB61JmT6N6xZsXjF_ORKOx-J4miGC-d2B1j-McskygFj-8peC2jLO6jXbBikLxeBNMC', 0, 0, '2023-11-23 05:52:40', '2024-04-25 06:32:07'),
(4, '61771958', NULL, NULL, 'XYZ', 'Male', '2005-11-16', 18, 'NNN', 'Father', '7827922041', 'qa@alobhatechnologies.com', '$2y$10$9Y2..7JsFxKiC7jCHBzZU.EAe83cRPGAMCZl69SQMljFpGYpxmCry', 'amit@123', '5192', NULL, '171ee8bb6eecf36b8b20621948e2ae620b4d96d4f335c90e88057aad5fcee3fd', 'android', 'dJmUwOYsQgat0rgF3UhKWF:APA91bE2CmZMPRVtgbEpuCO_U2UhaJbVVKp5I5d-Xr7yW-8V-KYJgUT6KZ3zbaB5zzH5YtS_3pr80TgAhXOI7mEchIHTqXX0eLBhQQF1GTxag5ouEo7gSXVakZDWGnXwW_jJO7eB2Qo8', 0, 0, '2023-11-30 05:59:31', '2024-04-25 06:31:56'),
(5, '91674503', '2345678905', '987654321987', 'Alobha Tester Executive', 'Female', '2005-12-06', 18, 'abcd', 'Father', '9956208970', 'deepika@gmail.com', '$2y$10$WFOJsD/oRRoG3pdSTOfhieP8iBtyR0oAbBTJGwV2GssjZs00X9rDi', '123456', '9841', NULL, 'dd7e0b2c751f3192afe87ca973ff5522addf2d8b06b387b52775ec15f68ae0c0', 'android', 'fUAVT52GT4-ISttOIWGBjz:APA91bGR_xVJEVOObbcS7BAhkNMQeTm3dH05vEEXABCAnhh0GyjLWtJ10Y9n_E_-JY50ZIKq_gWPS5gdj53p0HaqXlYSt3538pEOmNC6qtNjpif8nW8ZSRTeGCyzvov9gFvxSb2rrAKl', 0, 0, '2023-12-19 04:56:31', '2024-04-25 06:31:48'),
(6, '17438973', 'Facere sun', 'Perferendis', 'Akash (Executive)', 'Male', '1985-07-05', 38, 'Veda Hatfield', 'Wife', '8934024280', 'xopy@mailinator.com', '$2y$10$vxxIrcx5p.HXF3u4nohPreJWuvPG/7ZWtEN8mhXaTRQYFM5oTsmo6', 'Ut hic sunt sequi co', '6504', NULL, '849c24e0ea494adc90df302ab08fe5a4ee15e299c29646662972d39da404cc7d', 'android', 'fPDFcIg8RGivTYU9Mw_Vae:APA91bEnjDZt4n3VJg6hRD7AVg2W15L4Lb2XpWr83Br1B_wGpptahPfrC9DSmRMEXovoCpObYlCGMaxalzWUzyejGgvTUfIbXChyjSSCvfyJEAEFd6RQfAqvgm2vWrr7wDzk9GBbPKWv', 0, 0, '2024-01-10 07:20:57', '2024-04-25 06:31:42'),
(7, '25763855', NULL, NULL, 'David', 'Male', '1998-10-22', NULL, 'Justin', 'Father', '3242324241', 'david123@gmail.com', '$2y$10$cKbJS/Zo3MhD28MiPX.FPejSFFZ.ew2KHkTCMeyqLiuB9WiiCxDT6', '123456', NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-04-24 04:49:31', '2024-04-25 06:31:34'),
(8, '92312066', NULL, NULL, 'Suzzane (Executive)', 'Female', '1999-06-24', 24, 'Eric', 'Mother', '1111111111', 'Suzzane12@gmail.com', '$2y$10$T5hOjwpIChUmH6bx3ssrQuftZWMnf8JTbbzHlfHpRm28WurQovpvK', '123456', '9286', NULL, '7b2141e812d0664f8b57df25d20217f71372737a5f64a365ee7e811019474d12', 'android', 'duimspHjQqamSsv_5OJDkN:APA91bFYDlVQ992ZBRjFKWRTxoDERvm4wuBl93Q37yF6SwjT3AZjfr4sTkq6_n3JkaH6qCTPRS6SDiR4IxwqqkCVozu4CPGS0ERqACm7hAIfWnyJGRXt5RPvj0FEh0m5rdVcOHeMIvj_', 1, 0, '2024-04-24 04:50:22', '2024-07-09 00:50:17'),
(9, 'teacher@gmail.com', NULL, NULL, 'Teacher account', NULL, NULL, NULL, NULL, NULL, '+237679135426', 'teacher@gmail.com', NULL, NULL, NULL, NULL, '82aee425949e4524102636cc8b6589551347be092eb11449522b4f93d3bc1913', 'android', 'fcC-5u25SQ-yqIBN2bx42X:APA91bEr8613bXc-en_7L0ySe2nfH0_vCyD-Av17f0ZkWBP-zg-mytGDzRH6WgfVuS9qTIsrwNV3JwdbO80LKOv8y13DcGCgdzdaqLJ62tHhJXHyNFcAzOIVHwBvb1z5jDEH9BeTk8h0', 1, 0, '2024-07-09 05:18:42', '2024-07-29 14:08:26'),
(10, 'hfksdhfs', NULL, NULL, 'test', NULL, NULL, NULL, NULL, NULL, '936348765', 'dsfdf@gmail.com', NULL, NULL, NULL, NULL, 'd877d98d16a502978d5dca1a406ff3dbee8b4ceb7eecf96ea9e6d94f65b0baec', NULL, NULL, 1, 0, '2024-07-09 05:20:49', '2024-07-09 05:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `executive_addresses`
--

CREATE TABLE `executive_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `executive_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `tehsil_id` int DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parliamentary_id` int DEFAULT NULL,
  `assembly_id` int DEFAULT NULL,
  `town_village_id` int DEFAULT NULL,
  `panchayat_ward_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `block_id` int DEFAULT NULL,
  `thana_id` int DEFAULT NULL,
  `post_office_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `land_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `executive_addresses`
--

INSERT INTO `executive_addresses` (`id`, `executive_id`, `state_id`, `district_id`, `tehsil_id`, `area`, `parliamentary_id`, `assembly_id`, `town_village_id`, `panchayat_ward_id`, `block_id`, `thana_id`, `post_office_id`, `house_no`, `land_mark`, `locality`, `pincode`, `created_at`, `updated_at`) VALUES
(1, 1, 38, 1, 4, 'Rural', 1, 1, 1, '1', 1, 1, '1', '123', NULL, '12', '454654', '2023-11-17 07:32:43', '2023-11-17 07:32:43'),
(2, 2, 38, 1, 4, 'Urban', 1, 1, 1, '1', 2, 1, '1', '49', NULL, 'sector', '69500', '2023-11-22 07:31:26', '2024-01-10 07:14:01'),
(3, 3, 38, 1, 4, 'Urban', 1, 1, 1, '1', 1, 1, '1', '76', NULL, 'Barola', '69500', '2023-11-23 05:52:40', '2023-11-23 05:52:40'),
(4, 4, 38, 1, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-11-30 05:59:31', '2023-12-11 07:18:53'),
(5, 5, 38, 1, 0, 'Rural', 1, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, NULL, '2023-12-19 04:56:31', '2023-12-19 11:45:56'),
(6, 6, 38, 1, 4, 'Urban', 1, 1, 1, '1', 3, 1, '1', 'Error ipsum fugit', NULL, 'Necessitatibus est e', 'Dolore', '2024-01-10 07:20:57', '2024-01-10 07:37:10'),
(7, 7, 10, 6, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, NULL, '23455', '2024-04-24 04:49:31', '2024-04-24 04:49:31'),
(8, 8, 10, 7, 9, 'Urban', 2, 2, 2, '2', 4, 2, '2', '23', NULL, '45', '323454', '2024-04-24 04:50:22', '2024-06-12 05:16:34'),
(9, 9, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, 'Buea', NULL, '2024-07-09 05:18:42', '2024-07-09 05:18:42'),
(10, 10, 0, 0, 0, NULL, 0, 0, 0, '0', 0, 0, '0', NULL, NULL, 'address', NULL, '2024-07-09 05:20:49', '2024-07-09 05:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `executive_appointments`
--

CREATE TABLE `executive_appointments` (
  `id` bigint UNSIGNED NOT NULL,
  `executive_id` int NOT NULL DEFAULT '0',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `action_leader_id` int NOT NULL DEFAULT '0',
  `reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-approve,2-reject',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `executive_appointments`
--

INSERT INTO `executive_appointments` (`id`, `executive_id`, `reason`, `description`, `appointment_date`, `appointment_time`, `action_leader_id`, `reject_reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test', NULL, '2023-12-19', '15:00:00', 0, NULL, 0, '2023-12-19 17:16:44', '2023-12-19 17:16:44'),
(2, 1, 'Test', NULL, '2023-12-19', '15:00:00', 0, NULL, 0, '2023-12-19 17:18:05', '2023-12-19 17:18:05'),
(10, 5, 'Deepika test appointment', 'appointment test', '2023-12-26', '17:02:00', 0, NULL, 0, '2023-12-21 09:33:09', '2023-12-21 09:33:09'),
(12, 5, 'tgyh', 'fhhj', '2023-12-27', '16:04:00', 0, NULL, 0, '2023-12-21 09:34:36', '2023-12-21 09:34:36'),
(15, 4, 'DJ', 'DJ', '2023-12-23', '18:07:00', 0, NULL, 0, '2023-12-22 11:37:22', '2023-12-22 11:37:22'),
(16, 5, 'trst', 'tyuu', '2023-12-22', '16:29:00', 0, NULL, 0, '2023-12-22 12:00:09', '2023-12-22 12:00:09'),
(17, 4, 'test', 'sdfdsfs', '2024-01-04', '16:20:00', 0, NULL, 0, '2024-01-02 10:50:39', '2024-01-02 10:50:39'),
(22, 6, 'na', NULL, '2024-01-10', '16:37:00', 0, NULL, 0, '2024-01-10 11:07:18', '2024-01-10 11:07:18'),
(23, 6, 'tedt', 'test', '2024-01-10', '16:37:00', 0, NULL, 0, '2024-01-10 11:07:41', '2024-01-10 11:07:41'),
(24, 6, 'tedt', 'test', '2024-01-10', '16:37:00', 0, NULL, 0, '2024-01-10 11:07:41', '2024-01-10 11:07:41'),
(25, 6, 'tedt', 'test', '2024-01-10', '16:37:00', 0, NULL, 0, '2024-01-10 11:07:43', '2024-01-10 11:07:43'),
(26, 6, 'na', 'na', '2024-01-11', '16:46:00', 0, NULL, 0, '2024-01-10 11:16:24', '2024-01-10 11:16:24'),
(27, 1, 'Title', 'Description', '2024-01-17', '13:09:00', 0, NULL, 0, '2024-01-15 07:39:51', '2024-01-15 07:39:51'),
(28, 1, 'Title2', 'description', '2024-01-17', '15:11:00', 0, NULL, 0, '2024-01-15 07:42:00', '2024-01-15 07:42:00'),
(31, 6, 'personal', 'na', '2024-01-22', '11:39:00', 0, NULL, 0, '2024-01-22 06:09:34', '2024-01-22 06:09:34'),
(32, 1, 'ttt', 'ff', '2024-01-23', '15:20:00', 0, NULL, 0, '2024-01-22 09:50:16', '2024-01-22 09:50:16'),
(33, 1, 'ttt', 'ff', '2024-01-23', '15:20:00', 0, NULL, 0, '2024-01-22 09:50:16', '2024-01-22 09:50:16'),
(34, 1, 'ttt', 'ff', '2024-01-23', '15:20:00', 0, NULL, 0, '2024-01-22 09:50:16', '2024-01-22 09:50:16'),
(35, 1, 'ttt', 'ff', '2024-01-23', '15:20:00', 0, NULL, 0, '2024-01-22 09:50:16', '2024-01-22 09:50:16'),
(36, 1, 'ttt', 'ff', '2024-01-23', '15:20:00', 0, NULL, 0, '2024-01-22 09:50:16', '2024-01-22 09:50:16'),
(37, 1, 'fsfsdff', 'sss', '2024-01-23', '15:21:00', 0, NULL, 0, '2024-01-22 09:51:54', '2024-01-22 09:51:54'),
(38, 2, 'testing', 'testing', '2024-01-23', '16:07:00', 0, NULL, 0, '2024-01-22 10:37:47', '2024-01-22 10:37:47'),
(40, 2, 'na', 'test', '2024-01-22', '17:59:00', 0, NULL, 0, '2024-01-22 12:29:46', '2024-01-22 12:29:46'),
(41, 2, 'na', 'test', '2024-01-22', '17:59:00', 0, NULL, 0, '2024-01-22 12:29:46', '2024-01-22 12:29:46'),
(42, 2, 'Naaaaa', 'test', '2024-01-22', '18:11:00', 0, NULL, 0, '2024-01-22 12:41:53', '2024-01-22 12:41:53'),
(43, 2, 'Naaaaa', 'test', '2024-01-22', '18:11:00', 0, NULL, 0, '2024-01-22 12:41:54', '2024-01-22 12:41:54'),
(46, 1, 'dsfsfdsf', 'fdsfsf', '2024-01-24', '14:47:00', 0, NULL, 0, '2024-01-23 09:18:27', '2024-01-23 09:18:27'),
(47, 1, 'dsfsfdsf', 'fdsfsf', '2024-01-24', '14:47:00', 0, NULL, 0, '2024-01-23 09:18:27', '2024-01-23 09:18:27'),
(48, 1, 'sdsdfffd', 'sdfdsfs', '2024-01-24', '14:49:00', 0, NULL, 0, '2024-01-23 09:20:46', '2024-01-23 09:20:46'),
(49, 1, 'sdsdfffd', 'sdfdsfs', '2024-01-24', '14:49:00', 0, NULL, 0, '2024-01-23 09:20:46', '2024-01-23 09:20:46'),
(50, 1, 'title', 'description', '2024-01-24', '14:52:00', 0, NULL, 0, '2024-01-23 09:23:10', '2024-01-23 09:23:10'),
(51, 1, 'title', 'description', '2024-01-24', '14:52:00', 0, NULL, 0, '2024-01-23 09:23:10', '2024-01-23 09:23:10'),
(52, 1, 'title', 'sdsdf', '2024-01-26', '14:53:00', 0, NULL, 0, '2024-01-23 09:24:48', '2024-01-23 09:24:48'),
(53, 1, 'sdfsdf', 'ddd', '2024-01-31', '17:13:00', 0, NULL, 0, '2024-01-23 09:45:01', '2024-01-23 09:45:01'),
(54, 2, 'Naa', 'test', '2024-01-23', '15:51:00', 0, NULL, 0, '2024-01-23 10:21:16', '2024-01-23 10:21:16'),
(55, 2, 'S', 'test', '2024-01-23', '15:51:00', 0, NULL, 0, '2024-01-23 10:21:37', '2024-01-23 10:21:37'),
(56, 1, 'reason', 'additional', '2024-03-14', '16:27:00', 0, NULL, 0, '2024-02-29 10:57:30', '2024-02-29 10:57:30'),
(58, 8, 'g', 'g', '2024-06-13', '17:29:00', 0, NULL, 0, '2024-06-12 06:30:01', '2024-06-12 06:30:01'),
(60, 9, 'test', 'na', '2024-07-16', '13:03:00', 0, NULL, 0, '2024-07-16 04:39:56', '2024-07-16 04:39:56'),
(62, 9, 'vhj', 'nnj', '2024-07-17', '10:12:00', 0, NULL, 0, '2024-07-17 01:13:11', '2024-07-17 01:13:11'),
(67, 9, 'na', 'na', '2024-07-26', '16:25:00', 0, NULL, 0, '2024-07-25 05:25:38', '2024-07-25 05:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issue_types`
--

CREATE TABLE `issue_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issue_types`
--

INSERT INTO `issue_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Other Issue', 0, '2023-09-06 07:52:18', '2024-04-24 05:25:56'),
(2, 'Light Issue', 0, '2023-09-06 08:00:27', '2024-04-24 05:25:51'),
(3, 'Road Issue', 0, '2023-09-06 09:01:33', '2024-04-24 05:25:46'),
(4, 'water Issue', 0, '2023-10-03 10:32:50', '2024-04-24 05:25:42'),
(5, 'Missing Students Records', 1, '2024-04-24 05:26:23', '2024-04-24 05:26:23'),
(6, 'Late Exam', 1, '2024-04-24 05:26:38', '2024-04-24 05:26:38'),
(7, 'Fee Not Submit.', 1, '2024-04-24 05:26:52', '2024-04-24 05:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `leaders`
--

CREATE TABLE `leaders` (
  `id` bigint UNSIGNED NOT NULL,
  `leader_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voter_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhaar_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaders`
--

INSERT INTO `leaders` (`id`, `leader_unique_id`, `voter_id`, `aadhaar_card`, `name`, `mobile`, `email`, `password`, `show_password`, `otp`, `forgot_otp`, `api_token`, `device_type`, `device_token`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '40303584', '879879789', '798798798798', 'leader jan', '9876543210', 'leader@gmail.com', '$2y$10$zKCxIBQl0RihvcKf.akLAOj5e5xMh0vuEZylJf1/UEdp8cj5Ri15S', '123456', '9691', NULL, '133bae94dfa6f60aed7f525649db43e097832fbcbfc77365741b1e1e796c64cd', 'android', 'daYDQ6FDSIeyE_9Evv2ElP:APA91bEIyQxPj4NAT9zGcQLIN2LG_CCsx9HauzKQVzfSL1YCqh7BirzeGGdtAw3N3WSWwmF8cR2pS42utU1J7mpoo-P7Z6WQRTHFV1nra6ek_qLKmc-bskak8JW5jUGmfaK6dY-piAOH', 1, 0, '2023-11-23 06:57:38', '2024-07-25 04:56:46'),
(2, '34985204', NULL, '1234567890', 'XYZ', '7827922041', 'qa@alobhatechnologies.com', '$2y$10$kIhqx4DOY4hvFlb7qM/OvuYo.BlyTVY9LHKJikjtFva12SXKK1O/W', 'amit@123', '2690', NULL, 'bf0796e5db454b2ab4a91d0d4954087f383d999df62765ff8f745afb58b1eac9', 'android', 'fs6MzKucSwycg1TLHeetHZ:APA91bGJpAM5Sr3bTe43-khqPwBWM0QynfzYvOnEVUmaDDGCek93Vq7XyAcfYnBUYhW06w-zVsLWddodD8OcT2xGIwaQ0fVepKylirrxW_6yiUNoJZGDjjmiNYQ6ZZASn8KpNeTiHI0U', 1, 0, '2023-11-30 05:06:42', '2023-12-28 11:18:00'),
(3, '76444039', '9876543210', '987654321000', 'Alobha Tester Leader', '9956208979', 'deepikamouryaa@gmail.com', '$2y$10$OFcdI0rFIor9MFQ1Pbhlzuz02pDWqeTDnJiPnZa4RM7Yoh/oOrjam', '123456', '4169', NULL, 'cb7b3642bc3fef151e4d4cf654a42f2ffeec7c3aecaa0b7b7823083e8aa54437', 'android', 'cqx-poB5THShWCmskTiZTH:APA91bEP7E3jrZ0EKr2UgdatKmsX5HMLHT_8b21LeQQLjRxbSTvnDn7glkLPh9uHeDgNYOHjHOtn__5M29KptlU7_YRz5Hvp6hawqOVz_VTjNOS0_KZVSYCZXhFkzfeFovTzOQKqeBxH', 1, 0, '2023-12-19 09:13:40', '2024-01-07 18:22:00'),
(4, '15068792', 'AFX2089217', '912295302931', 'LEADER', '8808166289', 'surjeet.alobhatech@gmail.com', '$2y$10$aEPiXuTad3B.cg1fLWu3vOiiU5gmCCm5ZG6cdapqob1mJ9MBtFiUy', '12345678', '9082', NULL, 'a72f178ee43435c697e639ee47d80c9c3a87e2a606b7c0fd60d8f600687dc86f', 'android', 'ekn6TJiTR4Ow5ZcEry5ltq:APA91bHP4M8MDBZT3SQHRNlJMwneKOBqzIiEFFCIO1DDsQSQtBnaS4RBhKcVlUg63MNFWag9_sFUyeDdw1B5Ux7BKPON0Z-hJc_JMtKa1GjobuuSz86AFcwA2PqBcznjyB2dCxuB3XTB', 1, 0, '2024-01-04 04:33:42', '2024-03-01 05:01:28'),
(5, '19868867', NULL, '123456781234', 'Anurag Yadav', '7985858001', 'anurag2001.alobha@gmail.com', '$2y$10$uVuwjaoJohPzKXH715O1v.PCiDYefwPOL4D8jHk/IgxLraPxP5Vga', NULL, '2548', NULL, '9fd2c9e16c41e69dec4a07fced3fff6fa744dbf62b9260953a988de1014f87a2', 'android', 'fPDFcIg8RGivTYU9Mw_Vae:APA91bEnjDZt4n3VJg6hRD7AVg2W15L4Lb2XpWr83Br1B_wGpptahPfrC9DSmRMEXovoCpObYlCGMaxalzWUzyejGgvTUfIbXChyjSSCvfyJEAEFd6RQfAqvgm2vWrr7wDzk9GBbPKWv', 1, 0, '2024-02-29 11:16:02', '2024-04-18 04:12:24'),
(6, '96505514', NULL, '0', 'Richard (Director)', '3737373737', 'Richard123@gmail.com', '$2y$10$C/f/OUHhVJFAbo.CwAW58OW/HGqYq8DisXiPFjcRAlpmjAXUpyVgS', NULL, '3628', NULL, '2ed515e9ad61c2ce4371e166103bcf173204bbd4e48e1b56050cac2f3c8070ba', 'android', 'fx6x_wyOQKuK_UYT34wGJW:APA91bHiAh0w2FUSClrLHJ4VOqB93rO_SrRsoc2-2VU6oftCESB_asjun_N9ljKg38SA1O-1Ly0aiDWdxENiXdxWcO-3vHHauYtdRpPIy07HtMmpZBxloMhgKhiYVE0kRta_PJiGcNv4', 1, 0, '2024-04-24 04:51:42', '2024-06-20 02:00:35'),
(7, '74942455', NULL, NULL, 'asd', '123456789', NULL, '$2y$10$QxgPO8JcKfbTmXA6QWaOtuGJmVSAHXjnlZEdjGhFJPGx6zT5zBVVq', NULL, NULL, NULL, '212b65fbfd22d8f25d57a780eefc8bcfc61101b2027260adc470b72847d66e18', 'android', NULL, 1, 0, '2024-07-09 05:24:10', '2024-07-09 05:24:10'),
(8, '16386285', NULL, NULL, NULL, '675183646', NULL, '$2y$10$Ifz3kfCQQBvDflrUUb7TpOliU3UU7zORc0IIvQI1iYKcSsIf14Tei', NULL, '4879', NULL, '73c95eb845ad54f226e175434b2c7a2394127025efe18906503baf4d41a84b65', 'android', 'cRJKEUldS-mIKiCEXW_U1k:APA91bEhdumiCFYYTuAYZukSpX9inyJFcVkj5BQNQu_x8Cgw6hXcHHZ7WGa8fqA_VSFBrlN_WUWBuoS9HqqlSGkCuRVZewuIjQ0Hf_TFLn0ByqdUVRS0-U98ew-1qHmGVSiy-PwUSiow', 1, 0, '2024-07-09 05:45:11', '2024-07-18 11:58:48'),
(9, '61699953', NULL, NULL, NULL, '682343536', NULL, '$2y$10$PHZHu9rM5Ybs.BRdOv1XreyxpxveiXLNR4H4NI2misT9t0Dsx0w6e', NULL, NULL, NULL, 'ace25ec2631a43e92537375eb20a0d8053164fe748940bb4f16841ed031856c3', 'android', 'duimspHjQqamSsv_5OJDkN:APA91bFYDlVQ992ZBRjFKWRTxoDERvm4wuBl93Q37yF6SwjT3AZjfr4sTkq6_n3JkaH6qCTPRS6SDiR4IxwqqkCVozu4CPGS0ERqACm7hAIfWnyJGRXt5RPvj0FEh0m5rdVcOHeMIvj_', 1, 0, '2024-07-11 03:13:04', '2024-07-11 04:17:38');

-- --------------------------------------------------------

--
-- Table structure for table `leader_notifications`
--

CREATE TABLE `leader_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `complaint_id` int NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `leader_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leader_notifications`
--

INSERT INTO `leader_notifications` (`id`, `type`, `title`, `message`, `complaint_id`, `is_read`, `is_delete`, `leader_id`, `created_at`, `updated_at`) VALUES
(1, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-19 10:24:09', '2024-07-25 04:58:36'),
(2, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-19 10:24:09', '2023-12-19 10:24:09'),
(3, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-19 10:24:10', '2023-12-19 10:24:10'),
(4, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-19 12:15:58', '2024-07-25 04:58:36'),
(5, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-19 12:15:58', '2023-12-19 12:15:58'),
(6, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-19 12:15:58', '2023-12-19 12:15:58'),
(7, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-19 17:16:45', '2024-07-25 04:58:36'),
(8, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-19 17:16:45', '2023-12-19 17:16:45'),
(9, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-19 17:16:45', '2023-12-19 17:16:45'),
(10, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-19 17:18:06', '2024-07-25 04:58:36'),
(11, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-19 17:18:06', '2023-12-19 17:18:06'),
(12, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-19 17:18:07', '2023-12-19 17:18:07'),
(13, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-19 18:27:07', '2024-07-25 04:58:36'),
(14, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-19 18:27:07', '2023-12-19 18:27:07'),
(15, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-19 18:27:08', '2023-12-19 18:27:08'),
(16, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-19 18:43:48', '2024-07-25 04:58:36'),
(17, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-19 18:43:49', '2023-12-19 18:43:49'),
(18, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-19 18:43:49', '2023-12-19 18:43:49'),
(19, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-20 05:14:14', '2024-07-25 04:58:36'),
(20, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-20 05:14:14', '2023-12-20 05:14:14'),
(21, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-20 05:14:14', '2023-12-20 05:14:14'),
(22, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-20 05:26:37', '2024-07-25 04:58:36'),
(23, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-20 05:26:38', '2023-12-20 05:26:38'),
(24, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-20 05:26:38', '2023-12-20 05:26:38'),
(25, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-20 06:17:06', '2024-07-25 04:58:36'),
(26, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-20 06:17:06', '2023-12-20 06:17:06'),
(27, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-20 06:17:06', '2023-12-20 06:17:06'),
(28, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 07:20:15', '2024-07-25 04:58:36'),
(29, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 07:20:15', '2023-12-21 07:20:15'),
(30, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 07:20:15', '2023-12-21 07:20:15'),
(31, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 07:35:45', '2024-07-25 04:58:36'),
(32, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 07:35:45', '2023-12-21 07:35:45'),
(33, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 07:35:45', '2023-12-21 07:35:45'),
(34, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 08:07:48', '2024-07-25 04:58:36'),
(35, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 08:07:48', '2023-12-21 08:07:48'),
(36, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 08:07:48', '2023-12-21 08:07:48'),
(37, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 09:09:49', '2024-07-25 04:58:36'),
(38, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 09:09:49', '2023-12-21 09:09:49'),
(39, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 09:09:49', '2023-12-21 09:09:49'),
(40, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 09:32:48', '2024-07-25 04:58:36'),
(41, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 09:32:48', '2023-12-21 09:32:48'),
(42, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 09:32:48', '2023-12-21 09:32:48'),
(43, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 09:33:09', '2024-07-25 04:58:36'),
(44, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 09:33:10', '2023-12-21 09:33:10'),
(45, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 09:33:10', '2023-12-21 09:33:10'),
(46, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 09:34:01', '2024-07-25 04:58:36'),
(47, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 09:34:01', '2023-12-21 09:34:01'),
(48, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 09:34:01', '2023-12-21 09:34:01'),
(49, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 09:34:36', '2024-07-25 04:58:36'),
(50, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 09:34:37', '2023-12-21 09:34:37'),
(51, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 09:34:37', '2023-12-21 09:34:37'),
(52, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 09:35:44', '2024-07-25 04:58:36'),
(53, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 09:35:44', '2023-12-21 09:35:44'),
(54, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 09:35:44', '2023-12-21 09:35:44'),
(55, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-21 14:08:34', '2024-07-25 04:58:36'),
(56, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-21 14:08:34', '2023-12-21 14:08:34'),
(57, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-21 14:08:35', '2023-12-21 14:08:35'),
(58, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-22 11:37:23', '2024-07-25 04:58:36'),
(59, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-22 11:37:23', '2023-12-22 11:37:23'),
(60, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-22 11:37:23', '2023-12-22 11:37:23'),
(61, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-22 12:00:09', '2024-07-25 04:58:36'),
(62, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-22 12:00:10', '2023-12-22 12:00:10'),
(63, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-22 12:00:10', '2023-12-22 12:00:10'),
(64, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-26 06:16:27', '2024-07-25 04:58:36'),
(65, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-26 06:16:27', '2023-12-26 06:16:27'),
(66, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-26 06:16:27', '2023-12-26 06:16:27'),
(67, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-26 07:41:17', '2024-07-25 04:58:36'),
(68, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-26 07:41:18', '2023-12-26 07:41:18'),
(69, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-26 07:41:18', '2023-12-26 07:41:18'),
(70, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-28 08:03:13', '2024-07-25 04:58:36'),
(71, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-28 08:03:14', '2023-12-28 08:03:14'),
(72, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-28 08:03:14', '2023-12-28 08:03:14'),
(73, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-28 08:04:50', '2024-07-25 04:58:36'),
(74, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-28 08:04:51', '2023-12-28 08:04:51'),
(75, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-28 08:04:51', '2023-12-28 08:04:51'),
(76, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-28 09:26:06', '2024-07-25 04:58:36'),
(77, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-28 09:26:07', '2023-12-28 09:26:07'),
(78, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-28 09:26:07', '2023-12-28 09:26:07'),
(79, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-28 10:16:45', '2024-07-25 04:58:36'),
(80, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-28 10:16:45', '2023-12-28 10:16:45'),
(81, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-28 10:16:46', '2023-12-28 10:16:46'),
(82, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-29 06:20:21', '2024-07-25 04:58:36'),
(83, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-29 06:20:21', '2023-12-29 06:20:21'),
(84, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-29 06:20:21', '2023-12-29 06:20:21'),
(85, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-29 07:03:13', '2024-07-25 04:58:36'),
(86, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-29 07:03:14', '2023-12-29 07:03:14'),
(87, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-29 07:03:14', '2023-12-29 07:03:14'),
(88, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2023-12-29 07:06:43', '2024-07-25 04:58:36'),
(89, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2023-12-29 07:06:44', '2023-12-29 07:06:44'),
(90, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2023-12-29 07:06:44', '2023-12-29 07:06:44'),
(91, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-02 10:50:39', '2024-07-25 04:58:36'),
(92, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-02 10:50:40', '2024-01-02 10:50:40'),
(93, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-02 10:50:40', '2024-01-02 10:50:40'),
(94, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-02 11:49:07', '2024-07-25 04:58:36'),
(95, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-02 11:49:07', '2024-01-02 11:49:07'),
(96, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-02 11:49:07', '2024-01-02 11:49:07'),
(97, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-01-03 09:52:02', '2024-07-25 04:58:36'),
(98, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-03 09:52:02', '2024-01-03 09:52:02'),
(99, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-03 09:52:02', '2024-01-03 09:52:02'),
(100, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-01-03 13:01:38', '2024-07-25 04:58:36'),
(101, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-03 13:01:38', '2024-01-03 13:01:38'),
(102, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-03 13:01:38', '2024-01-03 13:01:38'),
(103, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-10 10:01:38', '2024-07-25 04:58:36'),
(104, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 10:01:39', '2024-01-10 10:01:39'),
(105, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 10:01:39', '2024-01-10 10:01:39'),
(106, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 10:01:39', '2024-01-10 10:01:39'),
(107, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-10 10:04:13', '2024-07-25 04:58:36'),
(108, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 10:04:13', '2024-01-10 10:04:13'),
(109, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 10:04:13', '2024-01-10 10:04:13'),
(110, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 10:04:14', '2024-01-10 10:04:14'),
(111, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-10 10:04:45', '2024-07-25 04:58:36'),
(112, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 10:04:46', '2024-01-10 10:04:46'),
(113, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 10:04:46', '2024-01-10 10:04:46'),
(114, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 10:04:46', '2024-01-10 10:04:46'),
(115, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-10 11:04:53', '2024-07-25 04:58:36'),
(116, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-10 11:04:54', '2024-07-25 04:58:36'),
(117, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:04:54', '2024-01-10 11:04:54'),
(118, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:04:54', '2024-01-10 11:04:54'),
(119, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:04:54', '2024-01-10 11:04:54'),
(120, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:04:54', '2024-01-10 11:04:54'),
(121, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-10 11:04:54', '2024-07-25 04:58:36'),
(122, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:04:54', '2024-01-10 11:04:54'),
(123, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:04:54', '2024-01-10 11:04:54'),
(124, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:04:55', '2024-01-10 11:04:55'),
(125, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:04:55', '2024-01-10 11:04:55'),
(126, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:04:55', '2024-01-10 11:04:55'),
(127, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-01-10 11:04:57', '2024-07-25 04:58:36'),
(128, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:04:58', '2024-01-10 11:04:58'),
(129, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:04:58', '2024-01-10 11:04:58'),
(130, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:04:58', '2024-01-10 11:04:58'),
(131, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-01-10 11:07:18', '2024-07-25 04:58:36'),
(132, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:07:19', '2024-01-10 11:07:19'),
(133, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:07:19', '2024-01-10 11:07:19'),
(134, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:07:19', '2024-01-10 11:07:19'),
(135, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-01-10 11:07:42', '2024-07-25 04:58:36'),
(136, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-01-10 11:07:42', '2024-07-25 04:58:36'),
(137, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:07:42', '2024-01-10 11:07:42'),
(138, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:07:42', '2024-01-10 11:07:42'),
(139, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:07:42', '2024-01-10 11:07:42'),
(140, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:07:42', '2024-01-10 11:07:42'),
(141, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:07:43', '2024-01-10 11:07:43'),
(142, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:07:43', '2024-01-10 11:07:43'),
(143, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-01-10 11:07:43', '2024-07-25 04:58:36'),
(144, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:07:43', '2024-01-10 11:07:43'),
(145, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:07:44', '2024-01-10 11:07:44'),
(146, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:07:44', '2024-01-10 11:07:44'),
(147, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-01-10 11:16:25', '2024-07-25 04:58:36'),
(148, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-10 11:16:25', '2024-01-10 11:16:25'),
(149, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-10 11:16:25', '2024-01-10 11:16:25'),
(150, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-10 11:16:26', '2024-01-10 11:16:26'),
(151, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-12 07:37:30', '2024-07-25 04:58:36'),
(152, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-12 07:37:31', '2024-01-12 07:37:31'),
(153, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-12 07:37:31', '2024-01-12 07:37:31'),
(154, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-12 07:37:31', '2024-01-12 07:37:31'),
(155, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-15 07:39:51', '2024-07-25 04:58:36'),
(156, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-15 07:39:52', '2024-01-15 07:39:52'),
(157, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-15 07:39:52', '2024-01-15 07:39:52'),
(158, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-15 07:39:52', '2024-01-15 07:39:52'),
(159, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-15 07:42:01', '2024-07-25 04:58:36'),
(160, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-15 07:42:01', '2024-01-15 07:42:01'),
(161, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-15 07:42:01', '2024-01-15 07:42:01'),
(162, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-15 07:42:01', '2024-01-15 07:42:01'),
(163, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-15 12:01:11', '2024-07-25 04:58:36'),
(164, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-15 12:01:12', '2024-01-15 12:01:12'),
(165, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-15 12:01:12', '2024-01-15 12:01:12'),
(166, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-15 12:01:13', '2024-01-15 12:01:13'),
(167, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 05:47:34', '2024-07-25 04:58:36'),
(168, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 05:47:34', '2024-01-22 05:47:34'),
(169, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 05:47:35', '2024-01-22 05:47:35'),
(170, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 05:47:35', '2024-01-22 05:47:35'),
(171, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 06:09:07', '2024-07-25 04:58:36'),
(172, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 06:09:08', '2024-01-22 06:09:08'),
(173, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 06:09:08', '2024-01-22 06:09:08'),
(174, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 06:09:08', '2024-01-22 06:09:08'),
(175, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 06:09:34', '2024-07-25 04:58:36'),
(176, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 06:09:34', '2024-07-25 04:58:36'),
(177, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 06:09:34', '2024-01-22 06:09:34'),
(178, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 06:09:34', '2024-01-22 06:09:34'),
(179, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 06:09:34', '2024-01-22 06:09:34'),
(180, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 06:09:34', '2024-01-22 06:09:34'),
(181, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 06:09:35', '2024-01-22 06:09:35'),
(182, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 06:09:35', '2024-01-22 06:09:35'),
(183, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-07-25 04:58:36'),
(184, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-07-25 04:58:36'),
(185, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-07-25 04:58:36'),
(186, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-07-25 04:58:36'),
(187, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-07-25 04:58:36'),
(188, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(189, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(190, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(191, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(192, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(193, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(194, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(195, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(196, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(197, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(198, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(199, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(200, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(201, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(202, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 09:50:17', '2024-01-22 09:50:17'),
(203, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 09:51:55', '2024-07-25 04:58:36'),
(204, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 09:51:55', '2024-01-22 09:51:55'),
(205, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 09:51:55', '2024-01-22 09:51:55'),
(206, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 09:51:56', '2024-01-22 09:51:56'),
(207, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 10:37:47', '2024-07-25 04:58:36'),
(208, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 10:37:47', '2024-07-25 04:58:36'),
(209, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 10:37:48', '2024-01-22 10:37:48'),
(210, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 10:37:48', '2024-01-22 10:37:48'),
(211, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 10:37:48', '2024-01-22 10:37:48'),
(212, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 10:37:48', '2024-01-22 10:37:48'),
(213, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 10:37:48', '2024-01-22 10:37:48'),
(214, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 10:37:48', '2024-01-22 10:37:48'),
(215, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 12:29:47', '2024-07-25 04:58:36'),
(216, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 12:29:47', '2024-07-25 04:58:36'),
(217, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 12:29:47', '2024-01-22 12:29:47'),
(218, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 12:29:47', '2024-01-22 12:29:47'),
(219, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 12:29:47', '2024-01-22 12:29:47'),
(220, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 12:29:47', '2024-01-22 12:29:47'),
(221, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 12:29:47', '2024-01-22 12:29:47'),
(222, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 12:29:48', '2024-01-22 12:29:48'),
(223, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 12:41:53', '2024-07-25 04:58:36'),
(224, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 12:41:54', '2024-01-22 12:41:54'),
(225, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 12:41:54', '2024-01-22 12:41:54'),
(226, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 12:41:54', '2024-01-22 12:41:54'),
(227, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-22 12:41:55', '2024-07-25 04:58:36'),
(228, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-22 12:41:55', '2024-01-22 12:41:55'),
(229, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-22 12:41:55', '2024-01-22 12:41:55'),
(230, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-22 12:41:55', '2024-01-22 12:41:55'),
(231, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 06:00:13', '2024-07-25 04:58:36'),
(232, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 06:00:13', '2024-01-23 06:00:13'),
(233, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 06:00:13', '2024-01-23 06:00:13'),
(234, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 06:00:14', '2024-01-23 06:00:14'),
(235, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 06:00:47', '2024-07-25 04:58:36'),
(236, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 06:00:47', '2024-01-23 06:00:47'),
(237, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 06:00:47', '2024-01-23 06:00:47'),
(238, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 06:00:48', '2024-07-25 04:58:36'),
(239, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 06:00:48', '2024-01-23 06:00:48'),
(240, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 06:00:48', '2024-01-23 06:00:48'),
(241, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 06:00:49', '2024-01-23 06:00:49'),
(242, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 06:00:49', '2024-01-23 06:00:49'),
(243, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 06:38:30', '2024-07-25 04:58:36'),
(244, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 06:38:30', '2024-07-25 04:58:36'),
(245, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 06:38:31', '2024-01-23 06:38:31'),
(246, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 06:38:31', '2024-01-23 06:38:31'),
(247, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 06:38:31', '2024-01-23 06:38:31'),
(248, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 06:38:31', '2024-01-23 06:38:31'),
(249, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 06:38:31', '2024-01-23 06:38:31'),
(250, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 06:38:31', '2024-01-23 06:38:31'),
(251, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:18:28', '2024-07-25 04:58:36'),
(252, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:18:28', '2024-07-25 04:58:36'),
(253, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:18:28', '2024-01-23 09:18:28'),
(254, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:18:28', '2024-01-23 09:18:28'),
(255, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:18:28', '2024-01-23 09:18:28'),
(256, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:18:28', '2024-01-23 09:18:28'),
(257, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:18:28', '2024-01-23 09:18:28'),
(258, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:18:29', '2024-01-23 09:18:29'),
(259, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:20:47', '2024-07-25 04:58:36'),
(260, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:20:47', '2024-07-25 04:58:36'),
(261, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:20:47', '2024-01-23 09:20:47'),
(262, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:20:47', '2024-01-23 09:20:47'),
(263, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:20:47', '2024-01-23 09:20:47'),
(264, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:20:47', '2024-01-23 09:20:47'),
(265, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:20:48', '2024-01-23 09:20:48'),
(266, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:20:48', '2024-01-23 09:20:48'),
(267, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:23:10', '2024-07-25 04:58:36'),
(268, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:23:10', '2024-07-25 04:58:36'),
(269, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:23:10', '2024-01-23 09:23:10'),
(270, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:23:11', '2024-01-23 09:23:11'),
(271, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:23:11', '2024-01-23 09:23:11'),
(272, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:23:11', '2024-01-23 09:23:11'),
(273, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:23:11', '2024-01-23 09:23:11'),
(274, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:23:11', '2024-01-23 09:23:11'),
(275, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:24:48', '2024-07-25 04:58:36'),
(276, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:24:49', '2024-01-23 09:24:49'),
(277, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:24:49', '2024-01-23 09:24:49'),
(278, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:24:49', '2024-01-23 09:24:49'),
(279, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:45:02', '2024-07-25 04:58:36'),
(280, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:45:02', '2024-01-23 09:45:02'),
(281, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:45:03', '2024-01-23 09:45:03'),
(282, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:45:03', '2024-01-23 09:45:03'),
(283, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 09:50:42', '2024-07-25 04:58:36'),
(284, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 09:50:42', '2024-01-23 09:50:42'),
(285, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 09:50:43', '2024-01-23 09:50:43'),
(286, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 09:50:43', '2024-01-23 09:50:43'),
(287, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 10:21:17', '2024-07-25 04:58:36'),
(288, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 10:21:17', '2024-01-23 10:21:17'),
(289, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 10:21:17', '2024-01-23 10:21:17'),
(290, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 10:21:18', '2024-01-23 10:21:18'),
(291, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-23 10:21:38', '2024-07-25 04:58:36'),
(292, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-23 10:21:38', '2024-01-23 10:21:38'),
(293, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-23 10:21:38', '2024-01-23 10:21:38'),
(294, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-23 10:21:38', '2024-01-23 10:21:38'),
(295, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-26 03:34:28', '2024-07-25 04:58:36'),
(296, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-26 03:34:28', '2024-01-26 03:34:28'),
(297, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-26 03:34:28', '2024-01-26 03:34:28'),
(298, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-26 03:34:29', '2024-01-26 03:34:29'),
(299, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-29 09:16:06', '2024-07-25 04:58:36'),
(300, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-29 09:16:06', '2024-01-29 09:16:06'),
(301, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-29 09:16:07', '2024-01-29 09:16:07'),
(302, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-29 09:16:08', '2024-01-29 09:16:08'),
(303, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-01-29 09:42:01', '2024-07-25 04:58:36'),
(304, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-01-29 09:42:02', '2024-01-29 09:42:02'),
(305, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-01-29 09:42:02', '2024-01-29 09:42:02'),
(306, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-01-29 09:42:02', '2024-01-29 09:42:02'),
(307, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-15 11:25:59', '2024-07-25 04:58:36'),
(308, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-15 11:26:00', '2024-02-15 11:26:00'),
(309, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-15 11:26:01', '2024-02-15 11:26:01'),
(310, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-15 11:26:01', '2024-02-15 11:26:01'),
(311, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 07:48:54', '2024-07-25 04:58:36'),
(312, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 07:48:54', '2024-02-29 07:48:54'),
(313, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 07:48:55', '2024-02-29 07:48:55'),
(314, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 07:48:57', '2024-02-29 07:48:57'),
(315, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 10:38:20', '2024-07-25 04:58:36'),
(316, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 10:38:20', '2024-02-29 10:38:20'),
(317, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 10:38:20', '2024-02-29 10:38:20'),
(318, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 10:38:20', '2024-02-29 10:38:20'),
(319, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 10:43:57', '2024-07-25 04:58:36'),
(320, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 10:43:57', '2024-02-29 10:43:57'),
(321, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 10:43:58', '2024-02-29 10:43:58'),
(322, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 10:43:58', '2024-02-29 10:43:58'),
(323, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 10:57:30', '2024-07-25 04:58:36'),
(324, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 10:57:31', '2024-02-29 10:57:31'),
(325, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 10:57:31', '2024-02-29 10:57:31'),
(326, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 10:57:31', '2024-02-29 10:57:31'),
(327, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 11:13:58', '2024-07-25 04:58:36'),
(328, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 11:13:58', '2024-02-29 11:13:58'),
(329, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 11:13:59', '2024-02-29 11:13:59'),
(330, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 11:13:59', '2024-02-29 11:13:59'),
(331, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 11:30:57', '2024-07-25 04:58:36'),
(332, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 11:30:57', '2024-02-29 11:30:57'),
(333, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 11:30:57', '2024-02-29 11:30:57'),
(334, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 11:30:58', '2024-02-29 11:30:58'),
(335, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 5, '2024-02-29 11:30:59', '2024-04-12 04:33:31'),
(336, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 11:35:39', '2024-07-25 04:58:36'),
(337, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 11:35:40', '2024-02-29 11:35:40'),
(338, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 11:35:40', '2024-02-29 11:35:40'),
(339, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 11:35:41', '2024-02-29 11:35:41');
INSERT INTO `leader_notifications` (`id`, `type`, `title`, `message`, `complaint_id`, `is_read`, `is_delete`, `leader_id`, `created_at`, `updated_at`) VALUES
(340, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 1, 1, 5, '2024-02-29 11:35:42', '2024-04-12 04:33:31'),
(341, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 12:21:27', '2024-07-25 04:58:36'),
(342, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 12:21:27', '2024-02-29 12:21:27'),
(343, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 12:21:27', '2024-02-29 12:21:27'),
(344, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 12:21:28', '2024-02-29 12:21:28'),
(345, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 5, '2024-02-29 12:21:28', '2024-04-12 04:33:31'),
(346, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-02-29 12:22:25', '2024-07-25 04:58:36'),
(347, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-02-29 12:22:26', '2024-02-29 12:22:26'),
(348, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-02-29 12:22:26', '2024-02-29 12:22:26'),
(349, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-02-29 12:22:26', '2024-02-29 12:22:26'),
(350, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 5, '2024-02-29 12:22:26', '2024-04-12 04:33:31'),
(351, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-04-12 04:03:10', '2024-07-25 04:58:36'),
(352, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-04-12 04:03:10', '2024-04-12 04:03:10'),
(353, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-04-12 04:03:11', '2024-04-12 04:03:11'),
(354, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-04-12 04:03:11', '2024-04-12 04:03:11'),
(355, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 5, '2024-04-12 04:03:12', '2024-04-12 04:33:31'),
(356, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-04-18 04:35:50', '2024-07-25 04:58:36'),
(357, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-04-18 04:35:50', '2024-04-18 04:35:50'),
(358, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-04-18 04:35:51', '2024-04-18 04:35:51'),
(359, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-04-18 04:35:51', '2024-04-18 04:35:51'),
(360, 'appointment', 'Jansamadhan Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-04-18 04:35:51', '2024-04-18 04:35:51'),
(361, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-06-11 06:47:33', '2024-07-25 04:58:36'),
(362, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-06-11 06:47:33', '2024-06-11 06:47:33'),
(363, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-06-11 06:47:35', '2024-06-11 06:47:35'),
(364, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-06-11 06:47:35', '2024-06-11 06:47:35'),
(365, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-06-11 06:47:37', '2024-06-11 06:47:37'),
(366, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 6, '2024-06-11 06:47:38', '2024-06-18 04:57:21'),
(367, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-06-11 23:15:13', '2024-07-25 04:58:36'),
(368, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-06-11 23:15:13', '2024-06-11 23:15:13'),
(369, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-06-11 23:15:13', '2024-06-11 23:15:13'),
(370, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-06-11 23:15:14', '2024-06-11 23:15:14'),
(371, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-06-11 23:15:14', '2024-06-11 23:15:14'),
(372, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 6, '2024-06-11 23:15:14', '2024-06-18 04:57:21'),
(373, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-06-11 23:30:55', '2024-07-25 04:58:36'),
(374, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-06-11 23:30:55', '2024-06-11 23:30:55'),
(375, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-06-11 23:30:55', '2024-06-11 23:30:55'),
(376, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-06-11 23:30:56', '2024-06-11 23:30:56'),
(377, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-06-11 23:30:56', '2024-06-11 23:30:56'),
(378, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 6, '2024-06-11 23:30:56', '2024-06-18 04:57:21'),
(379, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-06-12 06:30:02', '2024-07-25 04:58:36'),
(380, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-06-12 06:30:02', '2024-06-12 06:30:02'),
(381, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-06-12 06:30:03', '2024-06-12 06:30:03'),
(382, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-06-12 06:30:03', '2024-06-12 06:30:03'),
(383, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-06-12 06:30:03', '2024-06-12 06:30:03'),
(384, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 6, '2024-06-12 06:30:04', '2024-06-18 04:57:21'),
(385, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-06-17 06:58:32', '2024-07-25 04:58:36'),
(386, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-06-17 06:58:32', '2024-06-17 06:58:32'),
(387, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-06-17 06:58:32', '2024-06-17 06:58:32'),
(388, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-06-17 06:58:33', '2024-06-17 06:58:33'),
(389, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-06-17 06:58:33', '2024-06-17 06:58:33'),
(390, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 1, 1, 6, '2024-06-17 06:58:33', '2024-06-18 04:57:21'),
(391, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-06-18 04:51:20', '2024-07-25 04:58:36'),
(392, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-06-18 04:51:20', '2024-06-18 04:51:20'),
(393, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-06-18 04:51:21', '2024-06-18 04:51:21'),
(394, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-06-18 04:51:21', '2024-06-18 04:51:21'),
(395, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-06-18 04:51:21', '2024-06-18 04:51:21'),
(396, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 6, '2024-06-18 04:51:22', '2024-06-18 04:57:21'),
(397, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-09 05:36:20', '2024-07-25 04:58:36'),
(398, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-09 05:36:20', '2024-07-09 05:36:20'),
(399, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-09 05:36:20', '2024-07-09 05:36:20'),
(400, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-09 05:36:21', '2024-07-09 05:36:21'),
(401, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-09 05:36:21', '2024-07-09 05:36:21'),
(402, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-09 05:36:21', '2024-07-09 05:36:21'),
(403, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-09 05:36:21', '2024-07-09 05:36:21'),
(404, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-16 04:37:42', '2024-07-25 04:58:36'),
(405, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-16 04:37:42', '2024-07-16 04:37:42'),
(406, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-16 04:37:42', '2024-07-16 04:37:42'),
(407, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-16 04:37:42', '2024-07-16 04:37:42'),
(408, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-16 04:37:44', '2024-07-16 04:37:44'),
(409, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-16 04:37:44', '2024-07-16 04:37:44'),
(410, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-16 04:37:44', '2024-07-16 04:37:44'),
(411, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-16 04:37:45', '2024-07-16 04:37:45'),
(412, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-16 04:37:45', '2024-07-16 04:37:45'),
(413, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 1, 1, 1, '2024-07-16 04:39:56', '2024-07-25 04:58:36'),
(414, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-16 04:39:56', '2024-07-16 04:39:56'),
(415, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-16 04:39:57', '2024-07-16 04:39:57'),
(416, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-16 04:39:57', '2024-07-16 04:39:57'),
(417, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-16 04:39:57', '2024-07-16 04:39:57'),
(418, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-16 04:39:57', '2024-07-16 04:39:57'),
(419, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-16 04:39:57', '2024-07-16 04:39:57'),
(420, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-16 04:39:58', '2024-07-16 04:39:58'),
(421, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-16 04:39:58', '2024-07-16 04:39:58'),
(422, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-17 00:42:12', '2024-07-25 04:58:36'),
(423, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-17 00:42:13', '2024-07-17 00:42:13'),
(424, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-17 00:42:13', '2024-07-17 00:42:13'),
(425, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-17 00:42:13', '2024-07-17 00:42:13'),
(426, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-17 00:42:13', '2024-07-17 00:42:13'),
(427, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-17 00:42:13', '2024-07-17 00:42:13'),
(428, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-17 00:42:14', '2024-07-17 00:42:14'),
(429, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-17 00:42:14', '2024-07-17 00:42:14'),
(430, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-17 00:42:14', '2024-07-17 00:42:14'),
(431, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-17 01:11:43', '2024-07-25 04:58:36'),
(432, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-17 01:11:43', '2024-07-17 01:11:43'),
(433, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-17 01:11:43', '2024-07-17 01:11:43'),
(434, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-17 01:11:44', '2024-07-17 01:11:44'),
(435, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-17 01:11:44', '2024-07-17 01:11:44'),
(436, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-17 01:11:44', '2024-07-17 01:11:44'),
(437, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-17 01:11:44', '2024-07-17 01:11:44'),
(438, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-17 01:11:44', '2024-07-17 01:11:44'),
(439, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-17 01:11:44', '2024-07-17 01:11:44'),
(440, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-17 01:13:11', '2024-07-25 04:58:36'),
(441, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-17 01:13:11', '2024-07-17 01:13:11'),
(442, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-17 01:13:11', '2024-07-17 01:13:11'),
(443, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-17 01:13:12', '2024-07-17 01:13:12'),
(444, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-17 01:13:12', '2024-07-17 01:13:12'),
(445, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-17 01:13:12', '2024-07-17 01:13:12'),
(446, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-17 01:13:12', '2024-07-17 01:13:12'),
(447, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-17 01:13:12', '2024-07-17 01:13:12'),
(448, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-17 01:13:13', '2024-07-17 01:13:13'),
(449, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-17 03:40:07', '2024-07-25 04:58:36'),
(450, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-17 03:40:08', '2024-07-17 03:40:08'),
(451, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-17 03:40:08', '2024-07-17 03:40:08'),
(452, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-17 03:40:08', '2024-07-17 03:40:08'),
(453, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-17 03:40:08', '2024-07-17 03:40:08'),
(454, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-17 03:40:08', '2024-07-17 03:40:08'),
(455, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-17 03:40:09', '2024-07-17 03:40:09'),
(456, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-17 03:40:09', '2024-07-17 03:40:09'),
(457, 'appointment', 'Biaka Appointment Notification', 'New appointment received.1', 0, 0, 0, 9, '2024-07-17 03:40:09', '2024-07-17 03:40:09'),
(458, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-18 06:22:46', '2024-07-25 04:58:36'),
(459, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-18 06:22:46', '2024-07-18 06:22:46'),
(460, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-18 06:22:47', '2024-07-18 06:22:47'),
(461, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-18 06:22:47', '2024-07-18 06:22:47'),
(462, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-18 06:22:47', '2024-07-18 06:22:47'),
(463, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-18 06:22:47', '2024-07-18 06:22:47'),
(464, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-18 06:22:48', '2024-07-18 06:22:48'),
(465, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-18 06:22:48', '2024-07-18 06:22:48'),
(466, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-18 06:22:48', '2024-07-18 06:22:48'),
(467, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-18 12:07:45', '2024-07-25 04:58:36'),
(468, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-18 12:07:46', '2024-07-18 12:07:46'),
(469, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-18 12:07:46', '2024-07-18 12:07:46'),
(470, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-18 12:07:46', '2024-07-18 12:07:46'),
(471, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-18 12:07:46', '2024-07-18 12:07:46'),
(472, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-18 12:07:47', '2024-07-18 12:07:47'),
(473, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-18 12:07:47', '2024-07-18 12:07:47'),
(474, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-18 12:07:47', '2024-07-18 12:07:47'),
(475, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-18 12:07:47', '2024-07-18 12:07:47'),
(476, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-19 02:30:12', '2024-07-25 04:58:36'),
(477, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-19 02:30:12', '2024-07-19 02:30:12'),
(478, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-19 02:30:12', '2024-07-19 02:30:12'),
(479, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-19 02:30:13', '2024-07-19 02:30:13'),
(480, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-19 02:30:13', '2024-07-19 02:30:13'),
(481, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-19 02:30:13', '2024-07-19 02:30:13'),
(482, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-19 02:30:13', '2024-07-19 02:30:13'),
(483, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-19 02:30:14', '2024-07-19 02:30:14'),
(484, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-19 02:30:14', '2024-07-19 02:30:14'),
(485, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-22 04:49:05', '2024-07-25 04:58:36'),
(486, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-22 04:49:05', '2024-07-22 04:49:05'),
(487, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-22 04:49:05', '2024-07-22 04:49:05'),
(488, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-22 04:49:06', '2024-07-22 04:49:06'),
(489, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-22 04:49:06', '2024-07-22 04:49:06'),
(490, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-22 04:49:06', '2024-07-22 04:49:06'),
(491, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-22 04:49:06', '2024-07-22 04:49:06'),
(492, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-22 04:49:06', '2024-07-22 04:49:06'),
(493, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-22 04:49:07', '2024-07-22 04:49:07'),
(494, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-25 02:22:48', '2024-07-25 04:58:36'),
(495, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-25 02:22:49', '2024-07-25 02:22:49'),
(496, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-25 02:22:49', '2024-07-25 02:22:49'),
(497, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-25 02:22:49', '2024-07-25 02:22:49'),
(498, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-25 02:22:50', '2024-07-25 02:22:50'),
(499, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-25 02:22:50', '2024-07-25 02:22:50'),
(500, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-25 02:22:50', '2024-07-25 02:22:50'),
(501, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-25 02:22:50', '2024-07-25 02:22:50'),
(502, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-25 02:22:51', '2024-07-25 02:22:51'),
(503, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 1, 1, '2024-07-25 04:35:29', '2024-07-25 04:58:36'),
(504, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-25 04:35:29', '2024-07-25 04:35:29'),
(505, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-25 04:35:29', '2024-07-25 04:35:29'),
(506, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-25 04:35:30', '2024-07-25 04:35:30'),
(507, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-25 04:35:30', '2024-07-25 04:35:30'),
(508, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-25 04:35:30', '2024-07-25 04:35:30'),
(509, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-25 04:35:30', '2024-07-25 04:35:30'),
(510, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-25 04:35:31', '2024-07-25 04:35:31'),
(511, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-25 04:35:31', '2024-07-25 04:35:31'),
(512, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 1, '2024-07-25 05:25:39', '2024-07-25 05:25:39'),
(513, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 2, '2024-07-25 05:25:39', '2024-07-25 05:25:39'),
(514, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 3, '2024-07-25 05:25:39', '2024-07-25 05:25:39'),
(515, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 4, '2024-07-25 05:25:39', '2024-07-25 05:25:39'),
(516, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 5, '2024-07-25 05:25:40', '2024-07-25 05:25:40'),
(517, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 6, '2024-07-25 05:25:40', '2024-07-25 05:25:40'),
(518, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 7, '2024-07-25 05:25:40', '2024-07-25 05:25:40'),
(519, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 8, '2024-07-25 05:25:41', '2024-07-25 05:25:41'),
(520, 'appointment', 'Biaka Appointment Notification', 'New appointment received.', 0, 0, 0, 9, '2024-07-25 05:25:41', '2024-07-25 05:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_09_04_000000_create_failed_jobs_table', 1),
(3, '2023_09_04_000000_create_users_table', 1),
(4, '2023_09_04_000001_create_password_resets_table', 1),
(5, '2023_09_04_000002_create_content_management_table', 1),
(6, '2023_09_04_000003_create_settings_table', 1),
(7, '2023_09_04_000004_create_states_table', 1),
(8, '2023_09_04_000005_create_districts_table', 1),
(9, '2023_09_04_000006_create_tehsils_table', 1),
(10, '2023_09_04_000007_create_panchayat_wards_table', 1),
(11, '2023_09_04_000008_create_town_villages_table', 1),
(12, '2023_09_04_000009_create_parliamentary_constituency_table', 1),
(13, '2023_09_04_000010_create_assembly_constituency_table', 1),
(14, '2023_09_05_000011_create_customers_table', 1),
(15, '2023_09_05_000012_create_customer_addresses_table', 1),
(16, '2023_09_06_000013_create_complaints_table', 1),
(17, '2023_09_06_000014_create_departments_table', 1),
(18, '2023_09_06_000015_create_issue_types_table', 1),
(19, '2023_09_06_081425_create_permission_tables', 1),
(20, '2023_09_06_992407_add_slug_to_permissions_table', 1),
(21, '2023_09_06_999221_create_modules_table', 1),
(22, '2023_09_26_000009_create_banners_table', 1),
(23, '2023_09_26_000234_create_complaint_assigns_table', 1),
(24, '2023_09_26_000235_create_complaint_assign_status_table', 1),
(25, '2023_09_26_992407_add_device_to_customers_table', 1),
(26, '2023_09_27_000011_create_executives_table', 1),
(27, '2023_09_27_000012_create_executive_addresses_table', 1),
(28, '2023_09_27_103206_create_survey_questions_table', 1),
(29, '2023_09_27_104551_create_survey_answers_table', 1),
(30, '2023_09_27_104609_create_survey_votings_table', 1),
(31, '2023_09_27_992407_add_forgot_to_customers_table', 1),
(32, '2023_10_04_992408_create_complaint_status_table', 1),
(33, '2023_10_19_000007_create_blocks_table', 1),
(34, '2023_10_19_000007_create_post_offices_table', 1),
(35, '2023_10_19_000007_create_thanas_table', 1),
(36, '2023_10_19_000008_create_wards_table', 1),
(37, '2023_10_25_000011_create_leaders_table', 1),
(38, '2023_10_27_992408_add_is_profile_complete_to_customers_table', 1),
(39, '2023_10_30_000012_create_appointments_table', 1),
(40, '2023_11_03_000013_create_events_table', 1),
(41, '2023_12_07_000014_create_user_appointments_table', 2),
(42, '2023_12_19_000015_create_executive_appointments_table', 3),
(43, '2023_12_19_000016_create_user_notifications_table', 3),
(44, '2023_12_19_000017_create_representative_notifications_table', 3),
(45, '2023_12_19_000018_create_leader_notifications_table', 3),
(46, '2024_01_05_992407_add_column_to_leader_notifications_table', 4),
(47, '2024_01_05_992407_add_column_to_representative_notifications_table', 4),
(48, '2024_01_05_992407_add_column_to_user_notifications_table', 4),
(49, '2024_01_08_000017_create_representative_to_dos_table', 5),
(50, '2024_01_08_000018_create_representative_request_approvals_table', 5),
(51, '2024_07_16_000011_create_parents_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'State', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(2, 'District', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(3, 'Tehsil', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(4, 'Block', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(5, 'City', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(6, 'Assembly Constituency', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(7, 'Parliamentary Constituency', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(8, 'Department', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(9, 'Issue Type', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(10, 'Customer', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(11, 'Customer Wise Complaint', '2023-11-17 07:15:39', '2023-11-17 07:15:39');

-- --------------------------------------------------------

--
-- Table structure for table `panchayat_wards`
--

CREATE TABLE `panchayat_wards` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `district_id` int NOT NULL DEFAULT '0',
  `tehsil_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `panchayat_wards`
--

INSERT INTO `panchayat_wards` (`id`, `state_id`, `district_id`, `tehsil_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 1, 4, 'Hamidpur', 1, '2023-11-17 07:29:54', '2023-11-17 07:29:54'),
(2, 10, 7, 9, 'Cameroon', 1, '2024-04-25 05:45:11', '2024-04-25 05:45:11'),
(3, 5, 8, 10, 'Bisunpur', 1, '2024-06-11 06:43:08', '2024-06-11 06:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `parent_unique_id`, `name`, `mobile`, `email`, `password`, `show_password`, `api_token`, `device_type`, `device_token`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '25789544', 'Ravi', '8750957260', NULL, '$2y$10$e38Q3C3XUVhGW02REgmkbO7qB984cysR5TIpt0.EHKiRvaRcpJhYe', NULL, '274a81aa148938c60fab2434e713d78bbc1ae89ba51bfece82e466e42f5f4de2', NULL, NULL, 1, 0, '2024-07-15 22:49:02', '2024-07-15 22:49:21'),
(2, '81196629', NULL, '675183646', NULL, '$2y$10$2EbBVxsxlAv.cLRfh2a0F.j3waON.1kN0TF4ybsSRPpjwGLYR1oRG', NULL, '1b803c1bcc0ee847ae40578db128c403133e6edf97eb5e29ed74c56d8b234e37', 'android', 'eUEf-BZ5Q7WPkHoujeG8vt:APA91bGwkFBpf_opbUUd_1z1b1WDkG4gsf_mBOLpayU92VWdx68ERWK08ndOXThhK09CV4j1qTA6CHfPkHPkIdsDFZ2DHRfJ9Hth4TXeDxk4grcMegMVijsA8PwCOjZHaLkpp4_7ImAw', 1, 0, '2024-07-16 01:37:38', '2024-07-25 10:21:15'),
(3, '71272441', NULL, '682343536', NULL, '$2y$10$DhX36WEYzwj8XPPFajkWFOgWF8jXMDPiYcxcMHekcpVXquUEFY3QW', NULL, '719d04ab7a4811d4772d63a25321e4316d12811d5a7477e18c1f02f38e63bd2d', 'android', 'eUEf-BZ5Q7WPkHoujeG8vt:APA91bGwkFBpf_opbUUd_1z1b1WDkG4gsf_mBOLpayU92VWdx68ERWK08ndOXThhK09CV4j1qTA6CHfPkHPkIdsDFZ2DHRfJ9Hth4TXeDxk4grcMegMVijsA8PwCOjZHaLkpp4_7ImAw', 1, 0, '2024-07-26 03:15:29', '2024-07-26 03:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `parliamentary_constituency`
--

CREATE TABLE `parliamentary_constituency` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parliamentary_constituency`
--

INSERT INTO `parliamentary_constituency` (`id`, `state_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 'Aligarh', 1, '2023-11-17 07:28:53', '2023-11-17 07:28:53'),
(2, 10, 'Cameroon', 1, '2024-04-25 05:39:26', '2024-04-25 05:39:26'),
(3, 5, 'ARA', 1, '2024-06-11 06:41:08', '2024-06-11 06:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `module_id`, `slug`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_state', '1', 'View State', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(2, 'add_district', '2', 'Add District', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(3, 'view_district', '2', 'View District', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(4, 'edit_district', '2', 'Edit District', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(5, 'active_inactive_district', '2', 'Active/Inactive District', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(6, 'delete_district', '2', 'Delete District', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(7, 'add_tehsil', '3', 'Add Tehsil', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(8, 'view_tehsil', '3', 'View Tehsil', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(9, 'edit_tehsil', '3', 'Edit Tehsil', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(10, 'delete_tehsil', '3', 'Delete Tehsil', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(11, 'active_inactive_tehsil', '3', 'Active/Inactive Tehsil', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(12, 'add_block', '4', 'Add Block', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(13, 'view_block', '4', 'View Block', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(14, 'edit_block', '4', 'Edit Block', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(15, 'delete_block', '4', 'Delete Block', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(16, 'active_inactive_block', '4', 'Active/Inactive Block', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(17, 'add_city', '5', 'Add City', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(18, 'view_city', '5', 'View City', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(19, 'edit_city', '5', 'Edit City', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(20, 'delete_city', '5', 'Delete City', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(21, 'active_inactive_city', '5', 'Active/Inactive City', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(22, 'add_assembly_constituency', '6', 'Add Assembly Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(23, 'view_assembly_constituency', '6', 'View Assembly Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(24, 'edit_assembly_constituency', '6', 'Edit Assembly Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(25, 'delete_assembly_constituency', '6', 'Delete Assembly Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(26, 'active_inactive_assembly_constituency', '6', 'Active/Inactive Assembly Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(27, 'add_parliamentary_constituency', '7', 'Add Parliamentary Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(28, 'view_parliamentary_constituency', '7', 'View Parliamentary Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(29, 'edit_parliamentary_constituency', '7', 'Edit Parliamentary Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(30, 'delete_parliamentary_constituency', '7', 'Delete Parliamentary Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(31, 'active_inactive_parliamentary_constituency', '7', 'Active/Inactive Parliamentary Constituency', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(32, 'add_department', '8', 'Add Department', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(33, 'view_department', '8', 'View Department', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(34, 'edit_department', '8', 'Edit Department', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(35, 'delete_department', '8', 'Delete Department', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(36, 'active_inactive_department', '8', 'Active/Inactive Department', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(37, 'add_issue_type', '9', 'Add Issue Type', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(38, 'view_issue_type', '9', 'View Issue Type', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(39, 'edit_issue_type', '9', 'Edit Issue Type', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(40, 'delete_issue_type', '9', 'Delete Issue Type', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(41, 'active_inactive_issue_type', '9', 'Active/Inactive Issue Type', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(42, 'add_user', '10', 'Add User', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(43, 'view_user', '10', 'View User', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(44, 'edit_user', '10', 'Edit User', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(45, 'delete_user', '10', 'Delete User', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(46, 'active_inactive_user', '10', 'Active/Inactive User', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(47, 'add_user_wise_complaint', '11', 'Add User Wise Complaint', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(48, 'view_user_wise_complaint', '11', 'View User Wise Complaint', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(49, 'edit_user_wise_complaint', '11', 'Edit User Wise Complaint', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(50, 'delete_user_wise_complaint', '11', 'Delete User Wise Complaint', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40'),
(51, 'active_inactive_user_wise_complaint', '11', 'Active/Inactive User Wise Complaint', 'admin', '2023-11-17 07:15:40', '2023-11-17 07:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_offices`
--

CREATE TABLE `post_offices` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `district_id` int NOT NULL DEFAULT '0',
  `tehsil_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_offices`
--

INSERT INTO `post_offices` (`id`, `state_id`, `district_id`, `tehsil_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 1, 4, 'Pisava', 1, '2023-11-17 07:30:57', '2023-11-17 07:30:57'),
(2, 10, 7, 9, 'Cameroon', 1, '2024-04-25 05:50:22', '2024-04-25 05:50:22'),
(3, 5, 8, 10, 'Nawada ARA', 1, '2024-06-11 06:44:40', '2024-06-11 06:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `representative_notifications`
--

CREATE TABLE `representative_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `complaint_id` int NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `executive_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `representative_notifications`
--

INSERT INTO `representative_notifications` (`id`, `type`, `title`, `message`, `complaint_id`, `is_read`, `is_delete`, `executive_id`, `created_at`, `updated_at`) VALUES
(1, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2023-12-19 17:16:44', '2024-01-30 12:12:23'),
(2, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2023-12-19 17:18:05', '2024-01-30 12:12:23'),
(3, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-20 05:26:37', '2023-12-20 05:26:37'),
(4, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-20 06:17:05', '2023-12-20 06:17:05'),
(5, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 07:20:14', '2023-12-21 07:20:14'),
(6, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 07:35:44', '2023-12-21 07:35:44'),
(7, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 08:07:47', '2023-12-21 08:07:47'),
(8, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 09:09:48', '2023-12-21 09:09:48'),
(9, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 09:32:47', '2023-12-21 09:32:47'),
(10, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 09:33:09', '2023-12-21 09:33:09'),
(11, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 09:34:00', '2023-12-21 09:34:00'),
(12, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 09:34:36', '2023-12-21 09:34:36'),
(13, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 09:35:43', '2023-12-21 09:35:43'),
(14, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-21 14:08:34', '2023-12-21 14:08:34'),
(15, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 52, 0, 1, 1, '2023-12-22 06:25:09', '2024-01-30 12:12:23'),
(16, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 4, '2023-12-22 11:37:22', '2023-12-22 11:37:22'),
(17, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 5, '2023-12-22 12:00:09', '2023-12-22 12:00:09'),
(18, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 53, 0, 1, 1, '2023-12-22 12:26:06', '2024-01-30 12:12:23'),
(19, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 54, 0, 1, 1, '2023-12-29 05:56:27', '2024-01-30 12:12:23'),
(20, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 55, 0, 1, 1, '2023-12-29 06:05:07', '2024-01-30 12:12:23'),
(21, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 56, 0, 1, 1, '2023-12-29 07:20:14', '2024-01-30 12:12:23'),
(22, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 4, '2024-01-02 10:50:39', '2024-01-02 10:50:39'),
(23, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 57, 0, 1, 1, '2024-01-02 11:59:51', '2024-01-30 12:12:23'),
(24, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 58, 0, 1, 1, '2024-01-02 12:01:28', '2024-01-30 12:12:23'),
(25, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 59, 0, 1, 1, '2024-01-02 12:12:30', '2024-01-30 12:12:23'),
(26, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 60, 0, 1, 1, '2024-01-03 10:49:27', '2024-01-30 12:12:23'),
(27, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 61, 0, 1, 1, '2024-01-03 10:59:03', '2024-01-30 12:12:23'),
(28, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 62, 0, 1, 1, '2024-01-03 11:00:35', '2024-01-30 12:12:23'),
(29, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 63, 0, 1, 1, '2024-01-03 11:58:58', '2024-01-30 12:12:23'),
(30, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 64, 0, 1, 1, '2024-01-04 07:15:38', '2024-01-30 12:12:23'),
(31, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 65, 1, 1, 1, '2024-01-06 21:23:21', '2024-01-30 12:12:23'),
(32, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 66, 1, 1, 1, '2024-01-08 11:33:51', '2024-01-30 12:12:23'),
(33, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 67, 1, 1, 1, '2024-01-08 11:38:52', '2024-01-30 12:12:23'),
(34, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 68, 0, 1, 1, '2024-01-10 06:32:06', '2024-01-30 12:12:23'),
(35, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 69, 0, 1, 1, '2024-01-10 09:29:45', '2024-01-30 12:12:23'),
(36, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 70, 0, 0, 4, '2024-01-10 09:53:31', '2024-01-10 09:53:31'),
(37, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:04:53', '2024-01-10 11:04:53'),
(38, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:04:53', '2024-01-10 11:04:53'),
(39, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:04:54', '2024-01-10 11:04:54'),
(40, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:04:57', '2024-01-10 11:04:57'),
(41, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:07:18', '2024-01-10 11:07:18'),
(42, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:07:41', '2024-01-10 11:07:41'),
(43, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:07:42', '2024-01-10 11:07:42'),
(44, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:07:43', '2024-01-10 11:07:43'),
(45, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-10 11:16:25', '2024-01-10 11:16:25'),
(46, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 71, 0, 1, 1, '2024-01-10 12:56:29', '2024-01-30 12:12:23'),
(47, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 72, 0, 1, 1, '2024-01-12 07:17:24', '2024-01-30 12:12:23'),
(48, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-15 07:39:51', '2024-01-30 12:12:23'),
(49, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-15 07:42:00', '2024-01-30 12:12:23'),
(50, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 73, 0, 1, 1, '2024-01-15 11:32:55', '2024-01-30 12:12:23'),
(51, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 74, 0, 1, 1, '2024-01-22 04:45:31', '2024-01-30 12:12:23'),
(52, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 75, 0, 0, 4, '2024-01-22 05:43:45', '2024-01-22 05:43:45'),
(53, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-22 06:09:07', '2024-01-22 06:09:07'),
(54, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-22 06:09:34', '2024-01-22 06:09:34'),
(55, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 6, '2024-01-22 06:09:34', '2024-01-22 06:09:34'),
(56, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-01-30 12:12:23'),
(57, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-01-30 12:12:23'),
(58, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-01-30 12:12:23'),
(59, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-01-30 12:12:23'),
(60, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-22 09:50:16', '2024-01-30 12:12:23'),
(61, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-22 09:51:55', '2024-01-30 12:12:23'),
(62, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-22 10:37:47', '2024-02-29 11:30:17'),
(63, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-22 10:37:47', '2024-02-29 11:30:17'),
(64, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-22 12:29:46', '2024-02-29 11:30:17'),
(65, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-22 12:29:46', '2024-02-29 11:30:17'),
(66, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-22 12:41:53', '2024-02-29 11:30:17'),
(67, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-22 12:41:54', '2024-02-29 11:30:17'),
(68, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 76, 0, 1, 1, '2024-01-23 05:15:58', '2024-01-30 12:12:23'),
(69, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-23 06:38:30', '2024-02-29 11:30:17'),
(70, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-23 06:38:30', '2024-02-29 11:30:17'),
(71, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-23 09:18:27', '2024-01-30 12:12:23'),
(72, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-23 09:18:28', '2024-01-30 12:12:23'),
(73, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-23 09:20:47', '2024-01-30 12:12:23'),
(74, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-23 09:20:47', '2024-01-30 12:12:23'),
(75, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-23 09:23:10', '2024-01-30 12:12:23'),
(76, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-23 09:23:10', '2024-01-30 12:12:23'),
(77, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-23 09:24:48', '2024-01-30 12:12:23'),
(78, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 1, '2024-01-23 09:45:02', '2024-01-30 12:12:23'),
(79, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-23 10:21:16', '2024-02-29 11:30:17'),
(80, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-23 10:21:37', '2024-02-29 11:30:17'),
(81, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 77, 0, 0, 4, '2024-01-26 03:43:58', '2024-01-26 03:43:58'),
(82, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 78, 0, 0, 4, '2024-01-26 04:24:23', '2024-01-26 04:24:23'),
(83, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 79, 0, 1, 1, '2024-01-26 09:05:13', '2024-01-30 12:12:23'),
(84, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 80, 0, 1, 1, '2024-01-26 09:15:35', '2024-01-30 12:12:23'),
(85, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 81, 0, 1, 1, '2024-01-26 09:20:45', '2024-01-30 12:12:23'),
(86, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 82, 0, 1, 1, '2024-01-26 09:42:30', '2024-01-30 12:12:23'),
(87, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 83, 0, 1, 1, '2024-01-26 09:58:54', '2024-01-30 12:12:23'),
(88, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 84, 0, 1, 1, '2024-01-29 09:13:04', '2024-01-30 12:12:23'),
(89, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 85, 0, 1, 1, '2024-01-29 09:26:42', '2024-01-30 12:12:23'),
(90, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 86, 0, 1, 1, '2024-01-30 11:26:31', '2024-01-30 12:12:23'),
(91, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 87, 0, 0, 1, '2024-01-30 12:21:29', '2024-01-30 12:21:29'),
(92, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 88, 0, 0, 1, '2024-02-15 11:24:55', '2024-02-15 11:24:55'),
(93, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 89, 0, 0, 4, '2024-02-29 07:01:45', '2024-02-29 07:01:45'),
(94, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 90, 0, 0, 4, '2024-02-29 07:23:41', '2024-02-29 07:23:41'),
(95, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 91, 0, 0, 1, '2024-02-29 09:06:03', '2024-02-29 09:06:03'),
(96, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 92, 0, 0, 1, '2024-02-29 10:05:23', '2024-02-29 10:05:23'),
(97, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 93, 0, 0, 1, '2024-02-29 10:17:12', '2024-02-29 10:17:12'),
(98, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 94, 0, 0, 1, '2024-02-29 10:48:50', '2024-02-29 10:48:50'),
(99, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 1, '2024-02-29 10:57:30', '2024-02-29 10:57:30'),
(100, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 95, 0, 0, 1, '2024-02-29 11:17:20', '2024-02-29 11:17:20'),
(101, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 96, 0, 0, 1, '2024-02-29 11:31:47', '2024-02-29 11:31:47'),
(102, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 97, 0, 0, 1, '2024-02-29 11:49:01', '2024-02-29 11:49:01'),
(103, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 98, 0, 0, 1, '2024-03-01 04:41:30', '2024-03-01 04:41:30'),
(104, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 99, 0, 0, 1, '2024-03-01 04:46:24', '2024-03-01 04:46:24'),
(105, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 100, 0, 0, 1, '2024-03-01 04:50:26', '2024-03-01 04:50:26'),
(106, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 101, 0, 0, 1, '2024-03-01 04:56:50', '2024-03-01 04:56:50'),
(107, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 102, 0, 0, 1, '2024-03-01 04:57:09', '2024-03-01 04:57:09'),
(108, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 103, 0, 0, 1, '2024-03-01 04:57:25', '2024-03-01 04:57:25'),
(109, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 104, 0, 0, 1, '2024-03-01 04:58:02', '2024-03-01 04:58:02'),
(110, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 105, 0, 0, 1, '2024-03-01 04:59:04', '2024-03-01 04:59:04'),
(111, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 106, 0, 0, 1, '2024-03-01 05:05:35', '2024-03-01 05:05:35'),
(112, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 107, 0, 0, 3, '2024-04-12 04:43:40', '2024-04-12 04:43:40'),
(113, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 108, 0, 0, 3, '2024-04-18 04:31:42', '2024-04-18 04:31:42'),
(114, 'new-complaint', 'Jansamadhan Complaint Notification', 'New complaint has been received.', 109, 0, 0, 3, '2024-04-18 05:05:44', '2024-04-18 05:05:44'),
(115, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 8, '2024-06-11 23:30:54', '2024-06-11 23:30:54'),
(116, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 8, '2024-06-12 06:30:02', '2024-06-12 06:30:02'),
(117, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-16 04:37:41', '2024-07-25 05:26:29'),
(118, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-16 04:39:56', '2024-07-25 05:26:29'),
(119, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-17 01:11:43', '2024-07-25 05:26:29'),
(120, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-17 01:13:11', '2024-07-25 05:26:29'),
(121, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-17 03:40:07', '2024-07-25 05:26:29'),
(122, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-18 12:07:45', '2024-07-25 05:26:29'),
(123, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-22 04:49:04', '2024-07-25 05:26:29'),
(124, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-25 02:22:48', '2024-07-25 05:26:29'),
(125, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 9, '2024-07-25 05:25:38', '2024-07-25 05:26:29');

-- --------------------------------------------------------

--
-- Table structure for table `representative_request_approvals`
--

CREATE TABLE `representative_request_approvals` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_date` date DEFAULT NULL,
  `executive_id` int NOT NULL DEFAULT '0',
  `complaint_id` int NOT NULL DEFAULT '0',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `leader_id` int NOT NULL DEFAULT '0',
  `reply_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-approve,2-reject',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `representative_request_approvals`
--

INSERT INTO `representative_request_approvals` (`id`, `ticket_no`, `ticket_date`, `executive_id`, `complaint_id`, `message`, `leader_id`, `reply_message`, `status`, `created_at`, `updated_at`) VALUES
(1, '62774814', '2024-01-09', 1, 62, 'Message', 0, NULL, 0, '2024-01-09 12:53:46', '2024-01-09 12:53:46'),
(2, '11788140', '2024-01-09', 1, 62, 'message', 1, 'Reject', 2, '2024-01-09 12:56:51', '2024-01-10 11:40:32'),
(3, '48586347', '2024-01-10', 6, 68, 'plz approve this....', 1, 'Rejected', 2, '2024-01-10 07:28:38', '2024-01-10 11:17:39'),
(4, '86078728', '2024-01-10', 6, 68, 'done', 1, 'OKay', 1, '2024-01-10 09:26:46', '2024-01-10 11:16:27'),
(5, '55083146', '2024-01-12', 2, 54, 'na', 4, 'done', 1, '2024-01-12 07:43:20', '2024-01-22 07:53:24'),
(6, '99500107', '2024-01-15', 1, 73, 'request for approval', 4, 'done', 1, '2024-01-15 11:59:07', '2024-01-22 07:54:03'),
(7, '98673259', '2024-01-22', 6, 68, 'what happened', 4, 'trst', 1, '2024-01-22 05:16:50', '2024-01-22 07:52:16'),
(8, '58616075', '2024-01-26', 2, 80, 'Ok', 0, NULL, 0, '2024-01-26 09:17:06', '2024-01-26 09:17:06'),
(9, '97168299', '2024-01-30', 1, 73, 'approv', 0, NULL, 0, '2024-01-30 12:08:57', '2024-01-30 12:08:57'),
(10, '40081460', '2024-02-29', 1, 94, 'approval', 1, 'rejected', 2, '2024-02-29 10:55:38', '2024-02-29 10:56:42'),
(11, '35515465', '2024-03-01', 2, 88, 'help', 5, 'No', 2, '2024-03-01 04:57:40', '2024-03-01 05:06:38'),
(12, '54835783', '2024-04-12', 3, 107, 'what to do', 5, 'anything', 1, '2024-04-12 04:49:13', '2024-04-12 04:51:09'),
(13, '50033584', '2024-04-26', 8, 113, 'student want computer', 6, 'ok scholl will provide fund', 1, '2024-04-26 05:19:33', '2024-04-26 05:20:08'),
(14, '80571467', '2024-06-17', 8, 117, 'your request is approved', 1, 'na', 1, '2024-06-17 05:08:54', '2024-07-17 00:55:56'),
(15, '50772546', '2024-07-18', 9, 123, 'I need to solved this', 1, 'it\'s ok', 1, '2024-07-18 12:37:45', '2024-07-18 12:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `representative_to_dos`
--

CREATE TABLE `representative_to_dos` (
  `id` bigint UNSIGNED NOT NULL,
  `executive_id` int NOT NULL DEFAULT '0',
  `todo_date` date DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-not complete,1-complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `representative_to_dos`
--

INSERT INTO `representative_to_dos` (`id`, `executive_id`, `todo_date`, `title`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-01-08', NULL, 'Approve Some Complaints!', 1, '2024-01-08 12:18:50', '2024-01-15 07:35:09'),
(2, 1, '2024-01-08', NULL, 'Approve Some Complaints!', 1, '2024-01-08 12:18:50', '2024-01-15 07:04:51'),
(3, 2, '2024-01-09', NULL, 'ggg', 0, '2024-01-09 11:36:08', '2024-01-09 11:36:08'),
(4, 2, '2024-01-09', NULL, 'ggg', 0, '2024-01-09 11:36:11', '2024-01-09 11:36:11'),
(5, 6, '2024-01-10', NULL, 'I am going to Assembly.', 0, '2024-01-10 11:23:07', '2024-01-10 11:23:07'),
(6, 6, '2024-01-10', NULL, 'I am going to Assembly.', 1, '2024-01-10 11:23:16', '2024-01-22 06:18:44'),
(7, 6, '2024-01-10', NULL, 'I am going to Assembly.', 1, '2024-01-10 11:23:19', '2024-01-22 06:18:38'),
(8, 6, '2024-01-10', NULL, 'test', 1, '2024-01-10 11:47:20', '2024-01-22 06:18:42'),
(9, 6, '2024-01-10', NULL, 'test', 1, '2024-01-10 11:47:20', '2024-01-22 06:18:41'),
(10, 6, '2024-01-10', NULL, 'test', 1, '2024-01-10 11:47:21', '2024-01-22 06:18:40'),
(11, 1, '2024-01-15', NULL, 'To Do', 1, '2024-01-15 04:56:40', '2024-01-15 07:35:39'),
(12, 1, '2024-01-15', NULL, 'To Do 2', 1, '2024-01-15 04:59:19', '2024-01-15 07:35:37'),
(13, 1, '2024-01-15', NULL, 'tt', 1, '2024-01-15 04:59:31', '2024-01-15 07:04:35'),
(14, 6, '2024-01-22', NULL, 'Jai Shree Ram', 1, '2024-01-22 06:19:19', '2024-01-22 06:20:39'),
(15, 6, '2024-01-22', NULL, 'Jai Shree Ram', 1, '2024-01-22 06:19:19', '2024-01-22 06:20:32'),
(16, 6, '2024-01-22', NULL, 'today working from home', 1, '2024-01-22 06:20:05', '2024-01-22 06:20:19'),
(17, 6, '2024-01-22', NULL, 'today working from home', 0, '2024-01-22 06:21:55', '2024-01-22 06:21:55'),
(18, 6, '2024-01-22', NULL, 'today working from home', 0, '2024-01-22 06:21:55', '2024-01-22 06:21:55'),
(19, 1, '2024-01-22', NULL, 'dfdfdf', 0, '2024-01-22 09:52:24', '2024-01-22 09:52:24'),
(20, 1, '2024-01-22', NULL, 'dfdfdf', 0, '2024-01-22 09:52:24', '2024-01-22 09:52:24'),
(21, 1, '2024-01-22', NULL, 'sdfdsf', 1, '2024-01-22 09:53:24', '2024-01-22 10:02:25'),
(22, 1, '2024-01-22', NULL, 'rtret', 1, '2024-01-22 10:02:18', '2024-01-22 10:02:21'),
(23, 1, '2024-01-22', NULL, 'skdjfhskfhdsfhdshf sdfhsdjkfhskjfh skfhs hsdkjhfkjdshf kshfkjsdhfksd fhsdkfhsdkf sfhdkfhsd fhksdhf ksdhfkjsdhf sfhsdkfhsdk fhsdjkfhsd kfhsdkjf shfdskfhdsk fhksdhfksdhf dskhfkjxcn,mxncv,xcnvmxncv hsfhksdhf svhxck vhdxkdfheskjf hvjkshf ksdhfsd fvs', 1, '2024-01-22 10:02:45', '2024-01-22 10:02:50'),
(24, 2, '2024-01-22', NULL, 'testing', 1, '2024-01-22 10:38:00', '2024-01-22 12:42:36'),
(25, 2, '2024-01-22', NULL, 'testing', 1, '2024-01-22 10:38:01', '2024-01-22 12:42:36'),
(26, 2, '2024-01-22', NULL, 'gggg', 1, '2024-01-22 10:38:13', '2024-01-22 12:42:35'),
(27, 2, '2024-01-22', NULL, 'gggg', 1, '2024-01-22 10:38:13', '2024-01-22 12:42:34'),
(28, 2, '2024-01-22', NULL, 'hi', 0, '2024-01-22 12:42:47', '2024-01-22 12:42:47'),
(29, 2, '2024-01-22', NULL, 'hi', 0, '2024-01-22 12:42:47', '2024-01-22 12:42:47'),
(30, 2, '2024-01-23', NULL, 'hi', 1, '2024-01-23 06:39:39', '2024-01-23 06:39:51'),
(31, 2, '2024-01-23', NULL, 'wfh', 0, '2024-01-23 06:39:58', '2024-01-23 06:39:58'),
(32, 2, '2024-01-23', NULL, 'wfh', 0, '2024-01-23 06:39:58', '2024-01-23 06:39:58'),
(33, 1, '2024-01-23', NULL, 'dfdfs', 0, '2024-01-23 09:24:58', '2024-01-23 09:24:58'),
(34, 1, '2024-01-23', NULL, 'fdfd', 0, '2024-01-23 09:45:34', '2024-01-23 09:45:34'),
(35, 2, '2024-01-23', NULL, 'Tuesday', 0, '2024-01-23 10:21:58', '2024-01-23 10:21:58'),
(36, 2, '2024-01-23', NULL, 'nothing', 0, '2024-01-23 10:22:07', '2024-01-23 10:22:07'),
(37, 2, '2024-01-29', NULL, 'Na', 0, '2024-01-29 09:58:39', '2024-01-29 09:58:39'),
(38, 2, '2024-02-15', NULL, 'working', 0, '2024-02-15 11:29:08', '2024-02-15 11:29:08'),
(39, 5, '2024-02-29', NULL, 'dh', 0, '2024-02-29 07:18:19', '2024-02-29 07:18:19'),
(40, 1, '2024-02-29', NULL, 'eryu', 1, '2024-02-29 10:59:28', '2024-02-29 10:59:30'),
(41, 8, '2024-06-12', NULL, 'What is Todo?', 1, '2024-06-11 23:32:32', '2024-06-11 23:32:35'),
(42, 8, '2024-06-12', NULL, 'fggf', 1, '2024-06-12 05:21:11', '2024-06-12 05:21:16'),
(43, 9, '2024-07-16', NULL, 'test', 1, '2024-07-16 04:35:50', '2024-07-16 04:36:19'),
(44, 9, '2024-07-16', NULL, 'test', 1, '2024-07-16 04:36:00', '2024-07-16 04:36:13'),
(45, 9, '2024-07-16', NULL, 'test', 1, '2024-07-16 04:36:27', '2024-07-16 04:37:10'),
(46, 9, '2024-07-17', NULL, 'fft', 1, '2024-07-17 01:22:33', '2024-07-17 01:22:39'),
(47, 9, '2024-07-24', NULL, 'marking of papers', 1, '2024-07-24 08:31:54', '2024-07-24 08:31:57'),
(48, 9, '2024-07-24', NULL, 'Host hims and other systems online', 1, '2024-07-24 08:32:44', '2024-07-24 08:32:51'),
(49, 9, '2024-07-25', NULL, 'test', 1, '2024-07-25 02:25:11', '2024-07-25 02:26:50'),
(50, 9, '2024-07-25', NULL, 'yyy', 1, '2024-07-25 03:22:18', '2024-07-25 05:25:56'),
(51, 9, '2024-07-25', NULL, 'test', 1, '2024-07-25 05:26:01', '2024-07-25 05:26:03'),
(52, 9, '2024-07-25', NULL, 'na', 1, '2024-07-25 05:26:11', '2024-07-25 05:26:17'),
(53, 9, '2024-07-25', NULL, 'nanan', 0, '2024-07-25 05:29:38', '2024-07-25 05:29:38'),
(54, 9, '2024-07-25', NULL, 'dgdhfgdgfjgjg', 0, '2024-07-25 05:30:10', '2024-07-25 05:30:10'),
(55, 9, '2024-07-25', NULL, 'test nananans', 0, '2024-07-25 05:30:57', '2024-07-25 05:30:57'),
(56, 9, '2024-07-29', NULL, 'gamalin exam 23/08/24', 1, '2024-07-29 14:09:51', '2024-07-29 14:10:31');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superAdmin', 'admin', '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(2, 'test', 'admin', '2023-12-08 08:08:54', '2023-12-08 08:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(1, 2),
(2, 2),
(17, 2),
(18, 2),
(20, 2),
(21, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `phone_no_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fevicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `our_service_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instagram_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `youtube_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `map_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` int NOT NULL DEFAULT '101',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 101, 'Andaman and Nicobar Islands', 1, NULL, NULL),
(2, 101, 'Andhra Pradesh', 1, NULL, NULL),
(3, 101, 'Arunachal Pradesh', 1, NULL, NULL),
(4, 101, 'Assam', 1, NULL, NULL),
(5, 101, 'Bihar', 1, NULL, NULL),
(6, 101, 'Chandigarh', 1, NULL, NULL),
(7, 101, 'Chhattisgarh', 1, NULL, NULL),
(8, 101, 'Dadra and Nagar Haveli', 1, NULL, NULL),
(9, 101, 'Daman and Diu', 1, NULL, NULL),
(10, 101, 'Delhi', 1, NULL, NULL),
(11, 101, 'Goa', 1, NULL, NULL),
(12, 101, 'Gujarat', 1, NULL, NULL),
(13, 101, 'Haryana', 1, NULL, NULL),
(14, 101, 'Himachal Pradesh', 1, NULL, NULL),
(15, 101, 'Jammu and Kashmir', 1, NULL, NULL),
(16, 101, 'Jharkhand', 1, NULL, NULL),
(17, 101, 'Karnataka', 1, NULL, NULL),
(18, 101, 'Kenmore', 1, NULL, NULL),
(19, 101, 'Kerala', 1, NULL, NULL),
(20, 101, 'Lakshadweep', 1, NULL, NULL),
(21, 101, 'Madhya Pradesh', 1, NULL, NULL),
(22, 101, 'Maharashtra', 1, NULL, NULL),
(23, 101, 'Manipur', 1, NULL, NULL),
(24, 101, 'Meghalaya', 1, NULL, NULL),
(25, 101, 'Mizoram', 1, NULL, NULL),
(26, 101, 'Nagaland', 1, NULL, NULL),
(27, 101, 'Narora', 1, NULL, NULL),
(28, 101, 'Natwar', 1, NULL, NULL),
(29, 101, 'Odisha', 1, NULL, NULL),
(30, 101, 'Paschim Medinipur', 1, NULL, NULL),
(31, 101, 'Pondicherry', 1, NULL, NULL),
(32, 101, 'Punjab', 1, NULL, NULL),
(33, 101, 'Rajasthan', 1, NULL, NULL),
(34, 101, 'Sikkim', 1, NULL, NULL),
(35, 101, 'Tamil Nadu', 1, NULL, NULL),
(36, 101, 'Telangana', 1, NULL, NULL),
(37, 101, 'Tripura', 1, NULL, NULL),
(38, 101, 'Uttar Pradesh', 1, NULL, NULL),
(39, 101, 'Uttarakhand', 1, NULL, NULL),
(40, 101, 'Vaishali', 1, NULL, NULL),
(41, 101, 'West Bengal', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `survey_answers`
--

CREATE TABLE `survey_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `survey_question_id` int NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>Active,0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_answers`
--

INSERT INTO `survey_answers` (`id`, `survey_question_id`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'test', 1, '2023-11-22 10:41:28', '2023-11-22 10:41:28'),
(2, 3, 'Yes', 1, '2023-11-28 13:28:34', '2023-11-28 13:28:34'),
(3, 3, 'No', 1, '2023-11-28 13:28:39', '2023-11-28 13:28:39'),
(4, 2, 'yes', 1, '2023-11-28 13:30:51', '2023-11-28 13:30:51'),
(5, 2, 'No', 1, '2023-11-28 13:30:58', '2023-11-28 13:30:58'),
(6, 3, 'c', 1, '2023-11-30 06:59:47', '2023-11-30 06:59:47'),
(7, 4, 'yes', 1, '2023-11-30 07:23:17', '2023-11-30 07:23:17'),
(8, 4, 'No', 1, '2023-11-30 07:23:17', '2023-11-30 07:23:17'),
(9, 6, 'Yes', 1, '2024-01-04 07:05:40', '2024-01-04 07:05:40'),
(10, 7, 'No', 1, '2024-01-04 07:07:26', '2024-01-04 07:07:26'),
(11, 7, 'yes', 1, '2024-01-04 07:07:26', '2024-01-04 07:07:26'),
(12, 6, 'No', 1, '2024-01-04 07:16:43', '2024-01-04 07:16:43'),
(13, 8, 'Social services', 1, '2024-01-10 10:43:48', '2024-01-10 10:43:48'),
(14, 9, 'answer...', 1, '2024-01-12 07:32:56', '2024-01-12 07:32:56'),
(15, 11, 'dd', 1, '2024-02-29 07:21:26', '2024-02-29 07:21:26'),
(16, 11, 'g', 1, '2024-02-29 07:21:26', '2024-02-29 07:21:26'),
(17, 12, '1', 1, '2024-04-12 04:10:57', '2024-04-12 04:10:57'),
(18, 12, '2', 1, '2024-04-12 04:10:57', '2024-04-12 04:10:57'),
(19, 17, 'sack teachers', 1, '2024-06-16 01:28:49', '2024-06-16 01:28:49'),
(20, 17, 'add suggestion box', 1, '2024-06-16 01:28:49', '2024-06-16 01:28:49'),
(21, 17, 'close early', 1, '2024-06-16 01:28:49', '2024-06-16 01:28:49'),
(22, 18, 'Bad', 1, '2024-06-20 02:02:08', '2024-06-20 02:02:08'),
(23, 18, 'Good', 1, '2024-06-20 02:02:08', '2024-06-20 02:02:08'),
(24, 18, 'Very bad', 1, '2024-06-20 02:02:08', '2024-06-20 02:02:08'),
(25, 19, 'good', 1, '2024-07-17 00:57:00', '2024-07-17 00:57:00'),
(26, 19, 'bad', 1, '2024-07-17 00:57:00', '2024-07-17 00:57:00'),
(27, 19, 'neutral', 1, '2024-07-17 00:57:00', '2024-07-17 00:57:00'),
(28, 20, 'na', 1, '2024-07-17 01:10:19', '2024-07-17 01:10:19');

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE `survey_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `week_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>Active,0=>Inactive',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_questions`
--

INSERT INTO `survey_questions` (`id`, `question`, `start_date`, `end_date`, `week_date`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'When will be come Jaugar new modle?', NULL, NULL, '2023-W47', 1, NULL, '2023-11-22 10:41:07', '2023-11-22 10:41:07'),
(2, 'When will the issue with the water be resolved?', NULL, NULL, '2023-W48', 1, NULL, '2023-11-28 13:25:40', '2023-11-28 13:25:40'),
(3, 'Are you registered to vote at the current address you reside at?', NULL, NULL, '2023-W52', 1, NULL, '2023-11-28 13:28:23', '2023-11-28 13:28:23'),
(4, 'Are you registered to vote at the current address', NULL, NULL, '2023-W50', 1, 1, '2023-11-30 07:23:17', '2023-12-11 09:48:49'),
(5, 'have you a Voter Id ?', NULL, NULL, '2024-W20', 1, 1, '2024-01-04 07:03:14', '2024-01-04 07:04:36'),
(6, 'have a voter id', NULL, NULL, '2024-W1', 1, NULL, '2024-01-04 07:05:40', '2024-01-04 07:05:40'),
(7, 'What is your problems', NULL, NULL, '2024-W2', 1, NULL, '2024-01-04 07:07:26', '2024-01-04 07:15:50'),
(8, 'What is the perpose of JanSamadhan', NULL, NULL, '2024-W3', 1, NULL, '2024-01-10 10:43:48', '2024-01-10 10:43:48'),
(9, 'question', NULL, NULL, '2024-W4', 1, NULL, '2024-01-12 07:32:56', '2024-01-12 07:32:56'),
(10, 'If I request for a replacement, when will I get it?', NULL, NULL, '2024-W04', 1, NULL, '2024-01-22 04:59:24', '2024-01-22 04:59:24'),
(11, 'dfg', NULL, NULL, '2024-W9', 1, NULL, '2024-02-29 07:21:26', '2024-02-29 07:21:26'),
(12, 'when', NULL, NULL, '2024-W15', 1, NULL, '2024-04-12 04:10:57', '2024-04-12 04:10:57'),
(13, 'Best Student in This University.', NULL, NULL, '2024-W17', 1, NULL, '2024-04-24 05:15:47', '2024-04-24 05:15:47'),
(14, 'What Is Test', NULL, NULL, '2024-W24', 0, NULL, '2024-06-11 06:57:30', '2024-06-17 09:07:52'),
(15, 'What is Development', NULL, NULL, '2024-W23', 1, NULL, '2024-06-11 07:03:08', '2024-06-11 07:03:08'),
(16, 'What is privacy, and why is it important?', NULL, NULL, '2024-W34', 1, 1, '2024-06-11 07:03:31', '2024-06-20 01:52:33'),
(17, 'how do you think we can improve the school', NULL, NULL, '2024-W27', 1, NULL, '2024-06-16 01:28:49', '2024-06-16 01:28:49'),
(18, 'what do you think about the management of the institution', NULL, NULL, '2024-W25', 1, NULL, '2024-06-20 02:02:08', '2024-06-20 02:02:08'),
(19, 'test', NULL, NULL, '2024-W29', 1, NULL, '2024-07-17 00:57:00', '2024-07-17 00:57:00'),
(20, 'test', NULL, NULL, '2024-W30', 1, NULL, '2024-07-17 01:10:19', '2024-07-17 01:10:19');

-- --------------------------------------------------------

--
-- Table structure for table `survey_votings`
--

CREATE TABLE `survey_votings` (
  `id` bigint UNSIGNED NOT NULL,
  `survey_question_id` int NOT NULL,
  `survey_answer_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_votings`
--

INSERT INTO `survey_votings` (`id`, `survey_question_id`, `survey_answer_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, '2023-11-22 10:41:35', '2023-11-22 10:41:35'),
(2, 1, 1, 11, '2023-11-23 06:46:29', '2023-11-23 06:46:29'),
(3, 2, 5, 12, '2023-11-28 13:31:06', '2023-11-28 13:31:06'),
(4, 2, 5, 13, '2023-11-30 08:12:14', '2023-11-30 08:12:14'),
(5, 4, 8, 16, '2023-12-05 07:45:09', '2023-12-05 07:45:09'),
(6, 4, 8, 14, '2023-12-11 12:04:10', '2023-12-11 12:04:10'),
(7, 3, 3, 16, '2023-12-28 18:02:11', '2023-12-28 18:02:11'),
(8, 3, 2, 44, '2023-12-29 07:13:44', '2023-12-29 07:13:44'),
(9, 9, 14, 44, '2024-01-22 04:56:15', '2024-01-22 04:56:15'),
(10, 9, 14, 62, '2024-01-22 04:58:07', '2024-01-22 04:58:07'),
(11, 9, 14, 2, '2024-01-23 13:42:08', '2024-01-23 13:42:08'),
(12, 9, 14, 65, '2024-01-26 03:48:53', '2024-01-26 03:48:53'),
(13, 11, 15, 82, '2024-02-29 10:04:24', '2024-02-29 10:04:24'),
(14, 11, 15, 2, '2024-02-29 10:44:33', '2024-02-29 10:44:33'),
(15, 12, 17, 84, '2024-04-12 04:44:42', '2024-04-12 04:44:42'),
(16, 19, 25, 91, '2024-07-17 01:07:01', '2024-07-17 01:07:01'),
(17, 20, 28, 91, '2024-07-25 04:35:47', '2024-07-25 04:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `tehsils`
--

CREATE TABLE `tehsils` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `district_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tehsils`
--

INSERT INTO `tehsils` (`id`, `state_id`, `district_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 1, 'Atrauli', 1, '2023-09-06 07:27:24', '2023-09-07 09:29:41'),
(2, 38, 1, 'Gabhana', 1, '2023-09-06 07:27:24', '2023-09-06 07:27:24'),
(3, 38, 1, 'Iglas', 1, '2023-09-06 07:27:24', '2023-09-07 09:29:37'),
(4, 38, 1, 'Khair', 1, '2023-09-06 07:27:24', '2023-09-07 09:29:33'),
(5, 38, 1, 'Koil', 1, '2023-09-06 07:27:24', '2023-09-07 09:30:08'),
(6, 5, 3, 'kuchaikot', 1, '2023-09-07 09:32:43', '2023-09-07 09:34:57'),
(7, 38, 4, 'Gola Gokaran Nath', 1, '2023-10-03 10:26:44', '2023-10-03 10:26:54'),
(8, 38, 5, 'Noida1', 1, '2023-10-06 06:05:35', '2023-10-06 06:05:35'),
(9, 10, 7, 'Cameroon', 1, '2024-04-25 05:39:39', '2024-04-25 05:39:39'),
(10, 5, 8, 'Barhara', 1, '2024-06-11 06:42:19', '2024-06-11 06:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `thanas`
--

CREATE TABLE `thanas` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `district_id` int NOT NULL DEFAULT '0',
  `tehsil_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thanas`
--

INSERT INTO `thanas` (`id`, `state_id`, `district_id`, `tehsil_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 1, 4, 'Pisava', 1, '2023-11-17 07:30:40', '2023-11-17 07:30:40'),
(2, 10, 7, 9, 'Cameroon', 1, '2024-04-25 05:46:05', '2024-04-25 05:46:05'),
(3, 5, 8, 10, 'ARA SADAR', 1, '2024-06-11 06:44:22', '2024-06-11 06:44:22');

-- --------------------------------------------------------

--
-- Table structure for table `town_villages`
--

CREATE TABLE `town_villages` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `district_id` int NOT NULL DEFAULT '0',
  `tehsil_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `town_villages`
--

INSERT INTO `town_villages` (`id`, `state_id`, `district_id`, `tehsil_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 38, 1, 4, 'Hamidpur', 1, '2023-11-17 07:29:23', '2023-11-17 07:29:23'),
(2, 10, 7, 9, 'Cameroon', 1, '2024-04-25 05:44:46', '2024-04-25 05:44:46'),
(3, 5, 8, 10, 'Ekona', 1, '2024-06-11 06:42:49', '2024-06-11 06:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `forgot_otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `image`, `about`, `forgot_otp`, `role`, `is_admin`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'biaka@gmail.com', NULL, '$2y$10$k6awB4VptQkCqfUud5qpQOeTLAgZjb5mJsEKg4bGp6hrRdIAfsXEG', NULL, NULL, NULL, NULL, 'superAdmin', 1, 1, NULL, '2023-11-17 07:15:39', '2023-11-17 07:15:39'),
(2, 'test', 'qa@alobhatechnologies.com', NULL, '$2y$10$ShzS3bNBhd.D5Nn6DOEL6em9KOBX6R55hNNvKZrS4PowCEQlGEGVm', '7827922041', NULL, NULL, NULL, NULL, 0, 1, NULL, '2023-12-08 08:09:29', '2023-12-08 08:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_appointments`
--

CREATE TABLE `user_appointments` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int NOT NULL DEFAULT '0',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `action_leader_id` int NOT NULL DEFAULT '0',
  `reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-approve,2-reject',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_appointments`
--

INSERT INTO `user_appointments` (`id`, `customer_id`, `reason`, `description`, `appointment_date`, `appointment_time`, `action_leader_id`, `reject_reason`, `status`, `created_at`, `updated_at`) VALUES
(2, 16, 'reason', 'qwertyui asdfghj f', '2023-12-09', '15:46:00', 0, NULL, 0, '2023-12-08 10:22:12', '2023-12-08 10:22:12'),
(5, 14, 'reason', 'work not completed', '2023-12-12', '16:00:00', 0, NULL, 0, '2023-12-11 07:50:15', '2023-12-11 07:50:15'),
(6, 14, 'reason', 'work not completed', '2023-12-12', '16:00:00', 0, NULL, 0, '2023-12-11 07:50:16', '2023-12-11 07:50:16'),
(17, 2, 'Test', 'Description', '2024-01-10', '13:29:00', 0, NULL, 0, '2023-12-28 08:03:13', '2023-12-28 08:03:13'),
(18, 2, 'TEst', 'TEst DEscription', '2024-01-03', '13:34:00', 0, NULL, 0, '2023-12-28 08:04:50', '2023-12-28 08:04:50'),
(20, 2, 'Test', 'Description', '2024-01-02', '15:46:00', 0, NULL, 0, '2023-12-28 10:16:44', '2023-12-28 10:16:44'),
(22, 44, 'Water issues', NULL, '2023-12-30', '12:00:00', 0, NULL, 0, '2023-12-29 07:03:13', '2023-12-29 07:03:13'),
(24, 2, 'TEst', 'Description', '2024-01-03', '17:18:00', 0, NULL, 0, '2024-01-02 11:49:06', '2024-01-02 11:49:06'),
(25, 44, 'Ration Issue', 'test', '2024-01-04', '00:00:00', 0, NULL, 0, '2024-01-03 09:52:01', '2024-01-03 09:52:01'),
(26, 51, 'yest', 'test', '2024-01-04', '18:30:00', 0, NULL, 0, '2024-01-03 13:01:37', '2024-01-03 13:01:37'),
(27, 58, 'water issue', 'This appointment booked regarding of water', '2024-01-11', '12:00:00', 0, NULL, 0, '2024-01-10 10:01:38', '2024-01-10 10:01:38'),
(28, 58, 'Meet persons', 'community meeting', '2024-01-12', '11:00:00', 0, NULL, 0, '2024-01-10 10:04:12', '2024-01-10 10:04:12'),
(31, 2, 'title', 'desription', '2024-01-16', '17:30:00', 0, NULL, 0, '2024-01-15 12:01:10', '2024-01-15 12:01:10'),
(32, 58, 'nothing', 'Na', '2024-01-23', '00:00:00', 0, NULL, 0, '2024-01-22 05:47:34', '2024-01-22 05:47:34'),
(34, 44, 'Test', 'Na', '2024-01-24', '11:30:00', 0, NULL, 0, '2024-01-23 06:00:46', '2024-01-23 06:00:46'),
(35, 44, 'Test', 'Na', '2024-01-24', '11:30:00', 0, NULL, 0, '2024-01-23 06:00:46', '2024-01-23 06:00:46'),
(38, 75, 'na', NULL, '2024-01-30', '14:45:00', 0, NULL, 0, '2024-01-29 09:16:04', '2024-01-29 09:16:04'),
(39, 44, 'jjj', NULL, '2024-01-30', '15:11:00', 0, NULL, 0, '2024-01-29 09:42:01', '2024-01-29 09:42:01'),
(40, 44, 'test', NULL, '2024-02-17', '15:55:00', 0, NULL, 0, '2024-02-15 11:25:59', '2024-02-15 11:25:59'),
(41, 2, 'test', NULL, '2024-03-01', '16:18:00', 0, NULL, 0, '2024-02-29 07:48:53', '2024-02-29 07:48:53'),
(42, 2, 'NEW REASON!', NULL, '2024-03-05', '16:08:00', 0, NULL, 0, '2024-02-29 10:38:19', '2024-02-29 10:38:19'),
(43, 2, 'resone!', NULL, '2024-03-01', '17:13:00', 0, NULL, 0, '2024-02-29 10:43:57', '2024-02-29 10:43:57'),
(44, 2, 'reason', NULL, '2024-03-01', '16:43:00', 0, NULL, 0, '2024-02-29 11:13:58', '2024-02-29 11:13:58'),
(46, 82, 'hdgsgs', NULL, '2024-03-01', '16:10:00', 0, NULL, 0, '2024-02-29 11:35:38', '2024-02-29 11:35:38'),
(47, 82, 'tum', NULL, '2024-03-01', '12:51:00', 0, NULL, 0, '2024-02-29 12:21:26', '2024-02-29 12:21:26'),
(48, 82, 'vugj', NULL, '2024-03-02', '19:52:00', 0, NULL, 0, '2024-02-29 12:22:25', '2024-02-29 12:22:25'),
(49, 84, 'none', NULL, '2024-04-13', '15:00:00', 0, NULL, 0, '2024-04-12 04:03:09', '2024-04-12 04:03:09'),
(50, 44, 'test', NULL, '2024-04-19', '15:35:00', 0, NULL, 0, '2024-04-18 04:35:49', '2024-04-18 04:35:49'),
(53, 91, 'For meeting', NULL, '2024-06-18', '17:58:00', 0, NULL, 0, '2024-06-17 06:58:31', '2024-06-17 06:58:31'),
(55, 91, 'test test test', NULL, '2024-07-10', '12:01:00', 0, NULL, 0, '2024-07-09 05:36:19', '2024-07-09 05:36:19'),
(56, 91, 'test na', NULL, '2024-07-18', '11:41:00', 0, NULL, 0, '2024-07-17 00:42:12', '2024-07-17 00:42:12'),
(57, 91, 'hhjj', NULL, '2024-07-19', '18:22:00', 0, NULL, 0, '2024-07-18 06:22:46', '2024-07-18 06:22:46'),
(59, 91, 'na', NULL, '2024-07-26', '15:35:00', 0, NULL, 0, '2024-07-25 04:35:28', '2024-07-25 04:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `complaint_id` int NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `type`, `title`, `message`, `complaint_id`, `is_read`, `is_delete`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 16, '2023-12-19 10:24:08', '2023-12-19 10:24:08'),
(2, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 16, '2023-12-19 12:15:57', '2023-12-19 12:15:57'),
(3, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 16, '2023-12-19 18:27:07', '2023-12-19 18:27:07'),
(4, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 16, '2023-12-19 18:43:48', '2023-12-19 18:43:48'),
(5, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 16, '2023-12-20 05:14:13', '2023-12-20 05:14:13'),
(6, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 40, '2023-12-22 06:14:32', '2023-12-22 06:14:32'),
(7, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 52, 0, 0, 40, '2023-12-22 06:25:09', '2023-12-22 06:25:09'),
(8, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 53, 0, 0, 16, '2023-12-22 12:26:06', '2023-12-22 12:26:06'),
(9, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 16, '2023-12-26 06:16:26', '2023-12-26 06:16:26'),
(10, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 16, '2023-12-26 07:41:17', '2023-12-26 07:41:17'),
(11, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2023-12-28 08:03:13', '2024-02-29 10:53:25'),
(12, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2023-12-28 08:04:50', '2024-02-29 10:53:25'),
(13, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2023-12-28 09:26:06', '2024-02-29 10:53:25'),
(14, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2023-12-28 10:16:45', '2024-02-29 10:53:25'),
(15, 'account-delete', 'Jansamadhan Account Notification', 'Your profile has been deleted successfully.', 0, 0, 0, 4, '2023-12-29 05:36:07', '2023-12-29 05:36:07'),
(16, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 1, 44, '2023-12-29 05:40:19', '2024-01-12 07:36:58'),
(17, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 54, 0, 1, 44, '2023-12-29 05:56:27', '2024-01-12 07:36:58'),
(18, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 55, 0, 1, 44, '2023-12-29 06:05:07', '2024-01-12 07:36:58'),
(19, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 44, '2023-12-29 06:20:20', '2024-01-12 07:36:58'),
(20, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 44, '2023-12-29 07:03:13', '2024-01-12 07:36:58'),
(21, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 44, '2023-12-29 07:06:43', '2024-01-12 07:36:58'),
(22, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 56, 0, 1, 44, '2023-12-29 07:20:14', '2024-01-12 07:36:58'),
(23, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 55, 0, 1, 44, '2023-12-29 07:20:28', '2024-01-12 07:36:58'),
(24, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 55, 0, 1, 44, '2023-12-29 07:20:49', '2024-01-12 07:36:58'),
(25, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 55, 0, 1, 44, '2023-12-29 07:21:31', '2024-01-12 07:36:58'),
(26, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 55, 0, 1, 44, '2023-12-29 07:22:02', '2024-01-12 07:36:58'),
(27, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 54, 0, 1, 44, '2023-12-29 07:22:22', '2024-01-12 07:36:58'),
(28, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-01-02 11:49:06', '2024-02-29 10:53:25'),
(29, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 57, 0, 1, 2, '2024-01-02 11:59:50', '2024-02-29 10:53:25'),
(30, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 58, 0, 1, 2, '2024-01-02 12:01:28', '2024-02-29 10:53:25'),
(31, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 59, 1, 1, 2, '2024-01-02 12:12:30', '2024-02-29 10:53:25'),
(32, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 44, '2024-01-03 09:52:02', '2024-01-12 07:36:58'),
(33, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 60, 0, 1, 44, '2024-01-03 10:49:26', '2024-01-12 07:36:58'),
(34, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 61, 0, 1, 44, '2024-01-03 10:59:02', '2024-01-12 07:36:58'),
(35, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 62, 0, 1, 44, '2024-01-03 11:00:34', '2024-01-12 07:36:58'),
(36, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 63, 0, 1, 44, '2024-01-03 11:58:57', '2024-01-12 07:36:58'),
(37, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 51, '2024-01-03 13:01:38', '2024-01-03 13:01:38'),
(38, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 52, '2024-01-04 07:14:11', '2024-01-04 07:14:11'),
(39, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 64, 0, 0, 52, '2024-01-04 07:15:38', '2024-01-04 07:15:38'),
(40, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 65, 0, 0, 16, '2024-01-06 21:23:21', '2024-01-06 21:23:21'),
(41, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 48, 0, 0, 16, '2024-01-06 21:23:51', '2024-01-06 21:23:51'),
(42, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 65, 0, 0, 16, '2024-01-06 21:24:12', '2024-01-06 21:24:12'),
(43, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 48, 0, 0, 16, '2024-01-06 21:24:27', '2024-01-06 21:24:27'),
(44, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 65, 0, 0, 16, '2024-01-06 21:27:07', '2024-01-06 21:27:07'),
(45, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 66, 1, 1, 2, '2024-01-08 11:33:51', '2024-02-29 10:53:25'),
(46, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 67, 1, 1, 2, '2024-01-08 11:38:51', '2024-02-29 10:53:25'),
(47, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 63, 0, 1, 44, '2024-01-10 06:24:51', '2024-01-12 07:36:58'),
(48, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 55, '2024-01-10 06:27:44', '2024-01-10 06:27:44'),
(49, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 68, 0, 0, 55, '2024-01-10 06:32:05', '2024-01-10 06:32:05'),
(50, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 68, 0, 0, 55, '2024-01-10 07:30:11', '2024-01-10 07:30:11'),
(51, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 68, 0, 0, 55, '2024-01-10 07:42:05', '2024-01-10 07:42:05'),
(52, 'cancelled', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully cancelled.', 68, 0, 0, 55, '2024-01-10 07:43:43', '2024-01-10 07:43:43'),
(53, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 68, 0, 0, 55, '2024-01-10 07:45:36', '2024-01-10 07:45:36'),
(54, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 68, 0, 0, 55, '2024-01-10 09:24:40', '2024-01-10 09:24:40'),
(55, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 68, 0, 0, 55, '2024-01-10 09:25:35', '2024-01-10 09:25:35'),
(56, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 68, 0, 0, 55, '2024-01-10 09:25:52', '2024-01-10 09:25:52'),
(57, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 69, 0, 0, 55, '2024-01-10 09:29:45', '2024-01-10 09:29:45'),
(58, 'account-delete', 'Jansamadhan Account Notification', 'Your profile has been deleted successfully.', 0, 0, 0, 55, '2024-01-10 09:36:21', '2024-01-10 09:36:21'),
(59, 'account-delete', 'Jansamadhan Account Notification', 'Your profile has been deleted successfully.', 0, 0, 0, 56, '2024-01-10 09:37:30', '2024-01-10 09:37:30'),
(60, 'account-delete', 'Jansamadhan Account Notification', 'Your profile has been deleted successfully.', 0, 0, 0, 57, '2024-01-10 09:38:10', '2024-01-10 09:38:10'),
(61, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 58, '2024-01-10 09:40:16', '2024-01-10 09:40:16'),
(62, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 70, 0, 0, 58, '2024-01-10 09:53:31', '2024-01-10 09:53:31'),
(63, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 1, 0, 58, '2024-01-10 10:01:38', '2024-01-10 10:02:20'),
(64, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 58, '2024-01-10 10:04:12', '2024-01-10 10:04:12'),
(65, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 58, '2024-01-10 10:04:45', '2024-01-10 10:04:45'),
(66, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 63, 0, 1, 44, '2024-01-10 11:51:49', '2024-01-12 07:36:58'),
(67, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 62, 0, 1, 44, '2024-01-10 11:55:17', '2024-01-12 07:36:58'),
(68, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 71, 0, 1, 2, '2024-01-10 12:56:29', '2024-02-29 10:53:25'),
(69, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 72, 0, 1, 2, '2024-01-12 07:17:24', '2024-02-29 10:53:25'),
(70, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 44, '2024-01-12 07:37:30', '2024-01-12 07:37:30'),
(71, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 63, 0, 0, 44, '2024-01-12 07:38:05', '2024-01-12 07:38:05'),
(72, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 62, 1, 0, 44, '2024-01-12 07:39:44', '2024-01-12 07:51:44'),
(73, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 64, 0, 0, 52, '2024-01-12 07:43:14', '2024-01-12 07:43:14'),
(74, 'cancelled', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully cancelled.', 72, 0, 1, 2, '2024-01-12 07:58:14', '2024-02-29 10:53:25'),
(75, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 70, 0, 0, 58, '2024-01-12 08:57:48', '2024-01-12 08:57:48'),
(76, 'cancelled', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully cancelled.', 56, 1, 0, 44, '2024-01-15 04:55:28', '2024-01-23 06:17:24'),
(77, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 52, 0, 0, 40, '2024-01-15 09:00:25', '2024-01-15 09:00:25'),
(78, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 71, 0, 1, 2, '2024-01-15 09:03:14', '2024-02-29 10:53:25'),
(79, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 71, 0, 1, 2, '2024-01-15 09:05:04', '2024-02-29 10:53:25'),
(80, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 73, 0, 1, 2, '2024-01-15 11:32:55', '2024-02-29 10:53:25'),
(81, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 73, 0, 1, 2, '2024-01-15 11:47:25', '2024-02-29 10:53:25'),
(82, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 71, 1, 1, 2, '2024-01-15 11:48:16', '2024-02-29 10:53:25'),
(83, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 67, 1, 1, 2, '2024-01-15 11:49:13', '2024-02-29 10:53:25'),
(84, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 1, 1, 2, '2024-01-15 12:01:11', '2024-02-29 10:53:25'),
(85, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 60, '2024-01-15 12:30:29', '2024-01-15 12:30:29'),
(86, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 74, 0, 0, 44, '2024-01-22 04:45:31', '2024-01-22 04:45:31'),
(87, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 62, '2024-01-22 04:58:04', '2024-01-22 04:58:04'),
(88, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 74, 0, 0, 44, '2024-01-22 05:16:14', '2024-01-22 05:16:14'),
(89, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 70, 0, 0, 58, '2024-01-22 05:35:45', '2024-01-22 05:35:45'),
(90, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 74, 1, 0, 44, '2024-01-22 05:37:19', '2024-01-23 06:17:21'),
(91, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 75, 0, 0, 58, '2024-01-22 05:43:45', '2024-01-22 05:43:45'),
(92, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 70, 0, 0, 58, '2024-01-22 05:44:25', '2024-01-22 05:44:25'),
(93, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 75, 0, 0, 58, '2024-01-22 05:44:34', '2024-01-22 05:44:34'),
(94, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 58, '2024-01-22 05:47:34', '2024-01-22 05:47:34'),
(95, 'account-delete', 'Jansamadhan Account Notification', 'Your profile has been deleted successfully.', 0, 0, 0, 58, '2024-01-22 05:53:20', '2024-01-22 05:53:20'),
(96, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 74, 0, 0, 44, '2024-01-22 05:54:20', '2024-01-22 05:54:20'),
(97, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 76, 0, 0, 44, '2024-01-23 05:15:57', '2024-01-23 05:15:57'),
(98, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 64, '2024-01-23 05:29:31', '2024-01-23 05:29:31'),
(99, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 44, '2024-01-23 06:00:12', '2024-01-23 06:00:12'),
(100, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 44, '2024-01-23 06:00:46', '2024-01-23 06:00:46'),
(101, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 44, '2024-01-23 06:00:47', '2024-01-23 06:00:47'),
(102, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 76, 0, 0, 44, '2024-01-23 06:36:37', '2024-01-23 06:36:37'),
(103, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 1, 1, 2, '2024-01-23 09:50:42', '2024-02-29 10:53:25'),
(104, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 1, 65, '2024-01-26 03:33:56', '2024-01-26 03:50:12'),
(105, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 65, '2024-01-26 03:34:28', '2024-01-26 03:50:12'),
(106, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 77, 1, 1, 65, '2024-01-26 03:43:58', '2024-01-26 03:50:12'),
(107, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 77, 1, 1, 65, '2024-01-26 03:49:09', '2024-01-26 03:50:12'),
(108, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 77, 1, 1, 65, '2024-01-26 03:49:28', '2024-01-26 03:50:12'),
(109, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 78, 1, 0, 65, '2024-01-26 04:24:22', '2024-01-26 04:27:55'),
(110, 'account-delete', 'Jansamadhan Account Notification', 'Your profile has been deleted successfully.', 0, 0, 0, 65, '2024-01-26 04:28:52', '2024-01-26 04:28:52'),
(111, 'account-delete', 'Jansamadhan Account Notification', 'Your profile has been deleted successfully.', 0, 0, 0, 66, '2024-01-26 04:31:13', '2024-01-26 04:31:13'),
(112, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 70, '2024-01-26 09:04:19', '2024-01-26 09:04:19'),
(113, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 79, 0, 0, 70, '2024-01-26 09:05:13', '2024-01-26 09:05:13'),
(114, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 72, '2024-01-26 09:14:17', '2024-01-26 09:14:17'),
(115, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 80, 0, 0, 72, '2024-01-26 09:15:34', '2024-01-26 09:15:34'),
(116, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 80, 0, 0, 72, '2024-01-26 09:15:45', '2024-01-26 09:15:45'),
(117, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 80, 0, 0, 72, '2024-01-26 09:15:52', '2024-01-26 09:15:52'),
(118, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 81, 0, 0, 72, '2024-01-26 09:20:44', '2024-01-26 09:20:44'),
(119, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 81, 0, 0, 72, '2024-01-26 09:20:55', '2024-01-26 09:20:55'),
(120, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 81, 0, 0, 72, '2024-01-26 09:21:19', '2024-01-26 09:21:19'),
(121, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 80, 0, 0, 72, '2024-01-26 09:37:43', '2024-01-26 09:37:43'),
(122, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 74, '2024-01-26 09:41:18', '2024-01-26 09:41:18'),
(123, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 82, 0, 0, 74, '2024-01-26 09:42:30', '2024-01-26 09:42:30'),
(124, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 82, 0, 0, 74, '2024-01-26 09:42:41', '2024-01-26 09:42:41'),
(125, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 82, 0, 0, 74, '2024-01-26 09:42:49', '2024-01-26 09:42:49'),
(126, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 83, 0, 0, 74, '2024-01-26 09:58:54', '2024-01-26 09:58:54'),
(127, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 83, 0, 0, 74, '2024-01-26 09:59:09', '2024-01-26 09:59:09'),
(128, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 83, 0, 0, 74, '2024-01-26 09:59:20', '2024-01-26 09:59:20'),
(129, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 75, '2024-01-29 09:12:06', '2024-01-29 09:12:06'),
(130, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 84, 0, 0, 75, '2024-01-29 09:13:04', '2024-01-29 09:13:04'),
(131, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 75, '2024-01-29 09:16:05', '2024-01-29 09:16:05'),
(132, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 85, 0, 0, 44, '2024-01-29 09:26:42', '2024-01-29 09:26:42'),
(133, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 85, 0, 0, 44, '2024-01-29 09:39:00', '2024-01-29 09:39:00'),
(134, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 85, 0, 0, 44, '2024-01-29 09:39:07', '2024-01-29 09:39:07'),
(135, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 44, '2024-01-29 09:42:01', '2024-01-29 09:42:01'),
(136, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 59, '2024-01-30 11:24:31', '2024-01-30 11:24:31'),
(137, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 86, 0, 0, 59, '2024-01-30 11:26:30', '2024-01-30 11:26:30'),
(138, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 86, 0, 0, 59, '2024-01-30 11:28:27', '2024-01-30 11:28:27'),
(139, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 86, 0, 0, 59, '2024-01-30 11:28:54', '2024-01-30 11:28:54'),
(140, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 87, 0, 0, 59, '2024-01-30 12:21:29', '2024-01-30 12:21:29'),
(141, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 87, 0, 0, 59, '2024-01-30 12:22:59', '2024-01-30 12:22:59'),
(142, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 87, 0, 0, 59, '2024-01-30 12:23:35', '2024-01-30 12:23:35'),
(143, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 87, 0, 0, 59, '2024-01-30 12:24:23', '2024-01-30 12:24:23'),
(144, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 87, 0, 0, 59, '2024-01-30 12:24:41', '2024-01-30 12:24:41'),
(145, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 88, 0, 0, 44, '2024-02-15 11:24:55', '2024-02-15 11:24:55'),
(146, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 44, '2024-02-15 11:25:59', '2024-02-15 11:25:59'),
(147, 'inprogress', 'Jansamadhan Complaint Notification', 'Your complaint has been in progress.', 88, 0, 0, 44, '2024-02-15 11:28:01', '2024-02-15 11:28:01'),
(148, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 79, '2024-02-29 06:30:21', '2024-02-29 06:30:21'),
(149, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 89, 0, 0, 79, '2024-02-29 07:01:45', '2024-02-29 07:01:45'),
(150, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 90, 0, 0, 79, '2024-02-29 07:23:40', '2024-02-29 07:23:40'),
(151, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-02-29 07:48:54', '2024-02-29 10:53:25'),
(152, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 91, 0, 0, 44, '2024-02-29 09:06:03', '2024-02-29 09:06:03'),
(153, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 1, 0, 82, '2024-02-29 09:51:34', '2024-02-29 11:20:00'),
(154, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 92, 0, 1, 2, '2024-02-29 10:05:22', '2024-02-29 10:53:25'),
(155, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 93, 1, 0, 82, '2024-02-29 10:17:11', '2024-02-29 11:19:56'),
(156, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 93, 1, 0, 82, '2024-02-29 10:21:30', '2024-02-29 11:19:59'),
(157, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 92, 0, 1, 2, '2024-02-29 10:30:45', '2024-02-29 10:53:25'),
(158, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 92, 0, 1, 2, '2024-02-29 10:31:19', '2024-02-29 10:53:25'),
(159, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-02-29 10:38:19', '2024-02-29 10:53:25'),
(160, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 2, '2024-02-29 10:43:57', '2024-02-29 10:53:25'),
(161, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 94, 0, 1, 2, '2024-02-29 10:48:49', '2024-02-29 10:53:25'),
(162, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 94, 0, 1, 2, '2024-02-29 10:50:25', '2024-02-29 10:53:25'),
(163, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 94, 1, 1, 2, '2024-02-29 10:50:45', '2024-02-29 10:53:25'),
(164, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 94, 1, 1, 2, '2024-02-29 10:50:52', '2024-02-29 10:53:25'),
(165, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 2, '2024-02-29 11:13:58', '2024-02-29 11:13:58'),
(166, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 95, 0, 1, 82, '2024-02-29 11:17:20', '2024-02-29 11:19:52'),
(167, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 1, 0, 82, '2024-02-29 11:30:56', '2024-02-29 11:34:54'),
(168, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 96, 1, 0, 82, '2024-02-29 11:31:46', '2024-02-29 11:34:53'),
(169, 'account-delete', 'Jansamadhan Account Notification', 'Your profile has been deleted successfully.', 0, 0, 0, 83, '2024-02-29 11:33:39', '2024-02-29 11:33:39'),
(170, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 1, 0, 82, '2024-02-29 11:35:39', '2024-02-29 11:39:05'),
(171, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 93, 0, 0, 82, '2024-02-29 11:39:43', '2024-02-29 11:39:43'),
(172, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 93, 0, 0, 82, '2024-02-29 11:39:49', '2024-02-29 11:39:49'),
(173, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 93, 0, 0, 82, '2024-02-29 11:39:57', '2024-02-29 11:39:57'),
(174, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 93, 0, 0, 82, '2024-02-29 11:40:00', '2024-02-29 11:40:00'),
(175, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 96, 0, 0, 82, '2024-02-29 11:40:15', '2024-02-29 11:40:15'),
(176, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 95, 0, 0, 82, '2024-02-29 11:43:14', '2024-02-29 11:43:14'),
(177, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 97, 0, 0, 82, '2024-02-29 11:49:00', '2024-02-29 11:49:00'),
(178, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 97, 0, 0, 82, '2024-02-29 11:49:10', '2024-02-29 11:49:10'),
(179, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 97, 0, 0, 82, '2024-02-29 11:49:33', '2024-02-29 11:49:33'),
(180, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 97, 0, 0, 82, '2024-02-29 11:50:41', '2024-02-29 11:50:41'),
(181, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 82, '2024-02-29 12:21:27', '2024-02-29 12:21:27'),
(182, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 82, '2024-02-29 12:22:25', '2024-02-29 12:22:25'),
(183, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 97, 0, 0, 82, '2024-02-29 12:23:22', '2024-02-29 12:23:22'),
(184, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 97, 0, 0, 82, '2024-02-29 12:23:39', '2024-02-29 12:23:39'),
(185, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 97, 0, 0, 82, '2024-02-29 12:27:42', '2024-02-29 12:27:42'),
(186, 'complaint-withdraw', 'Jansamadhan Complaint Notification', 'Your complaint has been withdraw successfully.', 97, 0, 0, 82, '2024-02-29 12:27:49', '2024-02-29 12:27:49'),
(187, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 1, 0, 84, '2024-03-01 04:32:42', '2024-03-01 04:36:31'),
(188, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 98, 0, 0, 84, '2024-03-01 04:41:30', '2024-03-01 04:41:30'),
(189, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 99, 0, 0, 84, '2024-03-01 04:46:24', '2024-03-01 04:46:24'),
(190, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 100, 0, 0, 84, '2024-03-01 04:50:26', '2024-03-01 04:50:26'),
(191, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 101, 0, 0, 84, '2024-03-01 04:56:50', '2024-03-01 04:56:50'),
(192, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 102, 0, 0, 84, '2024-03-01 04:57:09', '2024-03-01 04:57:09'),
(193, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 103, 0, 0, 84, '2024-03-01 04:57:25', '2024-03-01 04:57:25'),
(194, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 104, 0, 0, 84, '2024-03-01 04:58:02', '2024-03-01 04:58:02'),
(195, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 88, 1, 0, 44, '2024-03-01 04:58:26', '2024-04-18 03:38:18'),
(196, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 105, 0, 0, 84, '2024-03-01 04:59:04', '2024-03-01 04:59:04'),
(197, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 106, 0, 0, 84, '2024-03-01 05:05:35', '2024-03-01 05:05:35'),
(198, 'cancelled', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully cancelled.', 53, 0, 0, 16, '2024-03-01 05:16:50', '2024-03-01 05:16:50'),
(199, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 84, '2024-04-12 04:03:09', '2024-04-12 04:03:09'),
(200, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 107, 0, 0, 84, '2024-04-12 04:43:40', '2024-04-12 04:43:40'),
(201, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 108, 0, 0, 44, '2024-04-18 04:31:41', '2024-04-18 04:31:41'),
(202, 'appointment', 'Jansamadhan Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 0, 44, '2024-04-18 04:35:49', '2024-04-18 04:35:49'),
(203, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 109, 1, 0, 44, '2024-04-18 05:05:44', '2024-04-18 06:58:25'),
(204, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 87, '2024-04-25 06:01:00', '2024-04-25 06:01:00'),
(205, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 111, 0, 0, 87, '2024-04-25 23:25:52', '2024-04-25 23:25:52'),
(206, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 111, 0, 0, 87, '2024-04-25 23:27:43', '2024-04-25 23:27:43'),
(207, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 111, 0, 0, 87, '2024-04-25 23:28:40', '2024-04-25 23:28:40'),
(208, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 112, 0, 0, 87, '2024-04-26 05:12:56', '2024-04-26 05:12:56'),
(209, 'resolved', 'Jansamadhan Complaint Notification', 'Your complaint has been resolved.', 112, 0, 0, 87, '2024-04-26 05:15:02', '2024-04-26 05:15:02'),
(210, 'complaint-reopen', 'Jansamadhan Complaint Notification', 'Your complaint has been reopen successfully.', 112, 0, 0, 87, '2024-04-26 05:16:17', '2024-04-26 05:16:17'),
(211, 'complaint-create', 'Jansamadhan Complaint Notification', 'Your complaint has been register successfully.', 113, 0, 0, 87, '2024-04-26 05:19:06', '2024-04-26 05:19:06'),
(212, 'account-create', 'Jansamadhan Account Notification', 'Your profile has been successfully completed.', 0, 0, 0, 89, '2024-05-14 01:50:06', '2024-05-14 01:50:06'),
(213, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 114, 0, 1, 91, '2024-06-11 06:32:01', '2024-07-25 04:41:43'),
(214, 'account-create', 'Biaka Account Notification', 'Your profile has been successfully completed.', 0, 0, 1, 91, '2024-06-11 06:45:52', '2024-07-25 04:41:43'),
(215, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-06-11 06:47:33', '2024-07-25 04:41:43'),
(216, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 115, 0, 1, 91, '2024-06-11 22:45:00', '2024-07-25 04:41:43'),
(217, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-06-11 23:15:12', '2024-07-25 04:41:43'),
(218, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 116, 0, 0, 94, '2024-06-16 01:14:11', '2024-06-16 01:14:11'),
(219, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 117, 0, 1, 91, '2024-06-17 05:05:33', '2024-07-25 04:41:43'),
(220, 'inprogress', 'Biaka Complaint Notification', 'Your complaint has been in progress.', 117, 0, 1, 91, '2024-06-17 05:08:39', '2024-07-25 04:41:43'),
(221, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 118, 0, 1, 91, '2024-06-17 06:55:07', '2024-07-25 04:41:43'),
(222, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-06-17 06:58:31', '2024-07-25 04:41:43'),
(223, 'resolved', 'Biaka Complaint Notification', 'Your complaint has been resolved.', 118, 0, 1, 91, '2024-06-17 07:01:21', '2024-07-25 04:41:43'),
(224, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-06-18 04:51:19', '2024-07-25 04:41:43'),
(225, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 119, 0, 1, 91, '2024-06-18 04:52:34', '2024-07-25 04:41:43'),
(226, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 120, 0, 1, 91, '2024-06-19 05:56:21', '2024-07-25 04:41:43'),
(227, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 121, 0, 1, 91, '2024-07-09 05:33:10', '2024-07-25 04:41:43'),
(228, 'complaint-withdraw', 'Biaka Complaint Notification', 'Your complaint has been withdraw successfully.', 120, 0, 1, 91, '2024-07-09 05:33:54', '2024-07-25 04:41:43'),
(229, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-07-09 05:36:19', '2024-07-25 04:41:43'),
(230, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 122, 1, 1, 91, '2024-07-17 00:14:00', '2024-07-25 04:41:43'),
(231, 'complaint-reopen', 'Biaka Complaint Notification', 'Your complaint has been reopen successfully.', 118, 0, 1, 91, '2024-07-17 00:14:19', '2024-07-25 04:41:43'),
(232, 'complaint-withdraw', 'Biaka Complaint Notification', 'Your complaint has been withdraw successfully.', 118, 0, 1, 91, '2024-07-17 00:14:23', '2024-07-25 04:41:43'),
(233, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-07-17 00:42:12', '2024-07-25 04:41:43'),
(234, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-07-18 06:22:46', '2024-07-25 04:41:43'),
(235, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 123, 0, 1, 91, '2024-07-18 12:10:54', '2024-07-25 04:41:43'),
(236, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 124, 0, 1, 91, '2024-07-18 12:31:45', '2024-07-25 04:41:43'),
(237, 'resolved', 'Biaka Complaint Notification', 'Your complaint has been resolved.', 123, 0, 1, 91, '2024-07-18 12:41:39', '2024-07-25 04:41:43'),
(238, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-07-19 02:30:12', '2024-07-25 04:41:43'),
(239, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 125, 0, 1, 91, '2024-07-25 04:34:01', '2024-07-25 04:41:43'),
(240, 'complaint-withdraw', 'Biaka Complaint Notification', 'Your complaint has been withdraw successfully.', 125, 0, 1, 91, '2024-07-25 04:34:17', '2024-07-25 04:41:43'),
(241, 'appointment', 'Biaka Appointment Notification', 'Your appointment has been booked successfully.', 0, 0, 1, 91, '2024-07-25 04:35:29', '2024-07-25 04:41:43'),
(242, 'complaint-create', 'Biaka Complaint Notification', 'Your complaint has been register successfully.', 126, 0, 1, 91, '2024-07-25 04:40:49', '2024-07-25 04:41:43'),
(243, 'complaint-reopen', 'Biaka Complaint Notification', 'Your complaint has been reopen successfully.', 125, 0, 1, 91, '2024-07-25 04:41:00', '2024-07-25 04:41:43'),
(244, 'complaint-withdraw', 'Biaka Complaint Notification', 'Your complaint has been withdraw successfully.', 125, 0, 1, 91, '2024-07-25 04:41:05', '2024-07-25 04:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `district_id` int NOT NULL DEFAULT '0',
  `tehsil_id` int NOT NULL DEFAULT '0',
  `municipality_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_leader_id_index` (`leader_id`),
  ADD KEY `appointments_title_index` (`title`),
  ADD KEY `appointments_appointment_date_index` (`appointment_date`),
  ADD KEY `appointments_start_time_index` (`start_time`),
  ADD KEY `appointments_end_time_index` (`end_time`),
  ADD KEY `appointments_status_index` (`status`);

--
-- Indexes for table `assembly_constituency`
--
ALTER TABLE `assembly_constituency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assembly_constituency_state_id_index` (`state_id`),
  ADD KEY `assembly_constituency_district_id_index` (`district_id`),
  ADD KEY `assembly_constituency_name_index` (`name`),
  ADD KEY `assembly_constituency_status_index` (`status`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_title_index` (`title`),
  ADD KEY `banners_image_index` (`image`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocks_state_id_index` (`state_id`),
  ADD KEY `blocks_district_id_index` (`district_id`),
  ADD KEY `blocks_tehsil_id_index` (`tehsil_id`),
  ADD KEY `blocks_name_index` (`name`),
  ADD KEY `blocks_status_index` (`status`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaints_complaint_code_index` (`complaint_code`),
  ADD KEY `complaints_customer_id_index` (`customer_id`),
  ADD KEY `complaints_department_id_index` (`department_id`),
  ADD KEY `complaints_issue_type_id_index` (`issue_type_id`),
  ADD KEY `complaints_latitude_index` (`latitude`),
  ADD KEY `complaints_longitude_index` (`longitude`),
  ADD KEY `complaints_address_index` (`address`),
  ADD KEY `complaints_complaint_file_type_index` (`complaint_file_type`),
  ADD KEY `complaints_complaint_date_index` (`complaint_date`),
  ADD KEY `complaints_status_index` (`status`),
  ADD KEY `complaints_resolved_date_index` (`resolved_date`);

--
-- Indexes for table `complaint_assigns`
--
ALTER TABLE `complaint_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_assigns_complaint_id_index` (`complaint_id`),
  ADD KEY `complaint_assigns_executive_id_index` (`executive_id`),
  ADD KEY `complaint_assigns_assign_date_index` (`assign_date`),
  ADD KEY `complaint_assigns_status_index` (`status`);

--
-- Indexes for table `complaint_assign_status`
--
ALTER TABLE `complaint_assign_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_assign_status_complaint_id_index` (`complaint_id`),
  ADD KEY `complaint_assign_status_assign_complaint_id_index` (`assign_complaint_id`),
  ADD KEY `complaint_assign_status_date_index` (`date`),
  ADD KEY `complaint_assign_status_time_index` (`time`),
  ADD KEY `complaint_assign_status_status_index` (`status`);

--
-- Indexes for table `complaint_status`
--
ALTER TABLE `complaint_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_status_complaint_id_index` (`complaint_id`),
  ADD KEY `complaint_status_status_id_index` (`status_id`);

--
-- Indexes for table `content_managements`
--
ALTER TABLE `content_managements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_managements_name_index` (`name`),
  ADD KEY `content_managements_short_name_index` (`short_name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_customer_unique_id_index` (`customer_unique_id`),
  ADD KEY `customers_voter_id_index` (`voter_id`),
  ADD KEY `customers_aadhaar_card_index` (`aadhaar_card`),
  ADD KEY `customers_name_index` (`name`),
  ADD KEY `customers_gender_index` (`gender`),
  ADD KEY `customers_dob_index` (`dob`),
  ADD KEY `customers_age_index` (`age`),
  ADD KEY `customers_guardian_name_index` (`guardian_name`),
  ADD KEY `customers_relation_index` (`relation`),
  ADD KEY `customers_mobile_index` (`mobile`),
  ADD KEY `customers_email_index` (`email`),
  ADD KEY `customers_password_index` (`password`),
  ADD KEY `customers_show_password_index` (`show_password`),
  ADD KEY `customers_otp_index` (`otp`),
  ADD KEY `customers_status_index` (`status`),
  ADD KEY `customers_is_executive_index` (`is_executive`),
  ADD KEY `customers_api_token_index` (`api_token`),
  ADD KEY `customers_device_type_index` (`device_type`),
  ADD KEY `customers_device_token_index` (`device_token`),
  ADD KEY `customers_forgot_otp_index` (`forgot_otp`),
  ADD KEY `customers_is_delete_index` (`is_delete`),
  ADD KEY `customers_is_profile_complete_index` (`is_profile_complete`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_customer_id_index` (`customer_id`),
  ADD KEY `customer_addresses_state_id_index` (`state_id`),
  ADD KEY `customer_addresses_district_id_index` (`district_id`),
  ADD KEY `customer_addresses_tehsil_id_index` (`tehsil_id`),
  ADD KEY `customer_addresses_area_index` (`area`),
  ADD KEY `customer_addresses_parliamentary_id_index` (`parliamentary_id`),
  ADD KEY `customer_addresses_assembly_id_index` (`assembly_id`),
  ADD KEY `customer_addresses_town_village_id_index` (`town_village_id`),
  ADD KEY `customer_addresses_panchayat_ward_id_index` (`panchayat_ward_id`),
  ADD KEY `customer_addresses_block_id_index` (`block_id`),
  ADD KEY `customer_addresses_thana_id_index` (`thana_id`),
  ADD KEY `customer_addresses_post_office_id_index` (`post_office_id`),
  ADD KEY `customer_addresses_house_no_index` (`house_no`),
  ADD KEY `customer_addresses_land_mark_index` (`land_mark`),
  ADD KEY `customer_addresses_locality_index` (`locality`),
  ADD KEY `customer_addresses_pincode_index` (`pincode`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_name_index` (`name`),
  ADD KEY `departments_status_index` (`status`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_state_id_index` (`state_id`),
  ADD KEY `districts_name_index` (`name`),
  ADD KEY `districts_status_index` (`status`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_leader_id_index` (`leader_id`),
  ADD KEY `events_added_by_index` (`added_by`),
  ADD KEY `events_title_index` (`title`),
  ADD KEY `events_image_index` (`image`),
  ADD KEY `events_video_index` (`video`),
  ADD KEY `events_event_date_index` (`event_date`),
  ADD KEY `events_start_date_time_index` (`start_date_time`),
  ADD KEY `events_end_date_time_index` (`end_date_time`),
  ADD KEY `events_status_index` (`status`);

--
-- Indexes for table `executives`
--
ALTER TABLE `executives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `executives_executive_unique_id_index` (`executive_unique_id`),
  ADD KEY `executives_voter_id_index` (`voter_id`),
  ADD KEY `executives_aadhaar_card_index` (`aadhaar_card`),
  ADD KEY `executives_name_index` (`name`),
  ADD KEY `executives_gender_index` (`gender`),
  ADD KEY `executives_dob_index` (`dob`),
  ADD KEY `executives_age_index` (`age`),
  ADD KEY `executives_guardian_name_index` (`guardian_name`),
  ADD KEY `executives_relation_index` (`relation`),
  ADD KEY `executives_mobile_index` (`mobile`),
  ADD KEY `executives_email_index` (`email`),
  ADD KEY `executives_password_index` (`password`),
  ADD KEY `executives_show_password_index` (`show_password`),
  ADD KEY `executives_otp_index` (`otp`),
  ADD KEY `executives_forgot_otp_index` (`forgot_otp`),
  ADD KEY `executives_api_token_index` (`api_token`),
  ADD KEY `executives_device_type_index` (`device_type`),
  ADD KEY `executives_device_token_index` (`device_token`),
  ADD KEY `executives_status_index` (`status`),
  ADD KEY `executives_is_delete_index` (`is_delete`);

--
-- Indexes for table `executive_addresses`
--
ALTER TABLE `executive_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `executive_addresses_executive_id_index` (`executive_id`),
  ADD KEY `executive_addresses_state_id_index` (`state_id`),
  ADD KEY `executive_addresses_district_id_index` (`district_id`),
  ADD KEY `executive_addresses_tehsil_id_index` (`tehsil_id`),
  ADD KEY `executive_addresses_area_index` (`area`),
  ADD KEY `executive_addresses_parliamentary_id_index` (`parliamentary_id`),
  ADD KEY `executive_addresses_assembly_id_index` (`assembly_id`),
  ADD KEY `executive_addresses_town_village_id_index` (`town_village_id`),
  ADD KEY `executive_addresses_panchayat_ward_id_index` (`panchayat_ward_id`),
  ADD KEY `executive_addresses_block_id_index` (`block_id`),
  ADD KEY `executive_addresses_thana_id_index` (`thana_id`),
  ADD KEY `executive_addresses_post_office_id_index` (`post_office_id`),
  ADD KEY `executive_addresses_house_no_index` (`house_no`),
  ADD KEY `executive_addresses_land_mark_index` (`land_mark`),
  ADD KEY `executive_addresses_locality_index` (`locality`),
  ADD KEY `executive_addresses_pincode_index` (`pincode`);

--
-- Indexes for table `executive_appointments`
--
ALTER TABLE `executive_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `executive_appointments_executive_id_index` (`executive_id`),
  ADD KEY `executive_appointments_appointment_date_index` (`appointment_date`),
  ADD KEY `executive_appointments_appointment_time_index` (`appointment_time`),
  ADD KEY `executive_appointments_action_leader_id_index` (`action_leader_id`),
  ADD KEY `executive_appointments_status_index` (`status`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `issue_types`
--
ALTER TABLE `issue_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issue_types_name_index` (`name`),
  ADD KEY `issue_types_status_index` (`status`);

--
-- Indexes for table `leaders`
--
ALTER TABLE `leaders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaders_leader_unique_id_index` (`leader_unique_id`),
  ADD KEY `leaders_voter_id_index` (`voter_id`),
  ADD KEY `leaders_aadhaar_card_index` (`aadhaar_card`),
  ADD KEY `leaders_name_index` (`name`),
  ADD KEY `leaders_mobile_index` (`mobile`),
  ADD KEY `leaders_email_index` (`email`),
  ADD KEY `leaders_password_index` (`password`),
  ADD KEY `leaders_show_password_index` (`show_password`),
  ADD KEY `leaders_otp_index` (`otp`),
  ADD KEY `leaders_forgot_otp_index` (`forgot_otp`),
  ADD KEY `leaders_api_token_index` (`api_token`),
  ADD KEY `leaders_device_type_index` (`device_type`),
  ADD KEY `leaders_device_token_index` (`device_token`),
  ADD KEY `leaders_status_index` (`status`),
  ADD KEY `leaders_is_delete_index` (`is_delete`);

--
-- Indexes for table `leader_notifications`
--
ALTER TABLE `leader_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leader_notifications_complaint_id_index` (`complaint_id`),
  ADD KEY `leader_notifications_leader_id_index` (`leader_id`),
  ADD KEY `leader_notifications_is_read_index` (`is_read`),
  ADD KEY `leader_notifications_is_delete_index` (`is_delete`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_name_index` (`name`);

--
-- Indexes for table `panchayat_wards`
--
ALTER TABLE `panchayat_wards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `panchayat_wards_state_id_index` (`state_id`),
  ADD KEY `panchayat_wards_district_id_index` (`district_id`),
  ADD KEY `panchayat_wards_tehsil_id_index` (`tehsil_id`),
  ADD KEY `panchayat_wards_name_index` (`name`),
  ADD KEY `panchayat_wards_status_index` (`status`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parents_parent_unique_id_index` (`parent_unique_id`),
  ADD KEY `parents_name_index` (`name`),
  ADD KEY `parents_mobile_index` (`mobile`),
  ADD KEY `parents_email_index` (`email`),
  ADD KEY `parents_password_index` (`password`),
  ADD KEY `parents_show_password_index` (`show_password`),
  ADD KEY `parents_api_token_index` (`api_token`),
  ADD KEY `parents_device_type_index` (`device_type`),
  ADD KEY `parents_device_token_index` (`device_token`),
  ADD KEY `parents_status_index` (`status`),
  ADD KEY `parents_is_delete_index` (`is_delete`);

--
-- Indexes for table `parliamentary_constituency`
--
ALTER TABLE `parliamentary_constituency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parliamentary_constituency_state_id_index` (`state_id`),
  ADD KEY `parliamentary_constituency_name_index` (`name`),
  ADD KEY `parliamentary_constituency_status_index` (`status`);

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
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  ADD KEY `permissions_module_id_index` (`module_id`),
  ADD KEY `permissions_slug_index` (`slug`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `post_offices`
--
ALTER TABLE `post_offices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_offices_state_id_index` (`state_id`),
  ADD KEY `post_offices_district_id_index` (`district_id`),
  ADD KEY `post_offices_tehsil_id_index` (`tehsil_id`),
  ADD KEY `post_offices_name_index` (`name`),
  ADD KEY `post_offices_status_index` (`status`);

--
-- Indexes for table `representative_notifications`
--
ALTER TABLE `representative_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `representative_notifications_complaint_id_index` (`complaint_id`),
  ADD KEY `representative_notifications_executive_id_index` (`executive_id`),
  ADD KEY `representative_notifications_is_read_index` (`is_read`),
  ADD KEY `representative_notifications_is_delete_index` (`is_delete`);

--
-- Indexes for table `representative_request_approvals`
--
ALTER TABLE `representative_request_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `representative_request_approvals_ticket_no_index` (`ticket_no`),
  ADD KEY `representative_request_approvals_ticket_date_index` (`ticket_date`),
  ADD KEY `representative_request_approvals_executive_id_index` (`executive_id`),
  ADD KEY `representative_request_approvals_complaint_id_index` (`complaint_id`),
  ADD KEY `representative_request_approvals_leader_id_index` (`leader_id`);

--
-- Indexes for table `representative_to_dos`
--
ALTER TABLE `representative_to_dos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `representative_to_dos_executive_id_index` (`executive_id`),
  ADD KEY `representative_to_dos_status_index` (`status`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_phone_no_one_index` (`phone_no_one`),
  ADD KEY `settings_phone_no_two_index` (`phone_no_two`),
  ADD KEY `settings_email_index` (`email`),
  ADD KEY `settings_address_index` (`address`),
  ADD KEY `settings_logo_index` (`logo`),
  ADD KEY `settings_fevicon_index` (`fevicon`),
  ADD KEY `settings_website_index` (`website`),
  ADD KEY `settings_our_service_image_index` (`our_service_image`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_index` (`country_id`),
  ADD KEY `states_name_index` (`name`),
  ADD KEY `states_status_index` (`status`);

--
-- Indexes for table `survey_answers`
--
ALTER TABLE `survey_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_questions_created_by_index` (`created_by`);

--
-- Indexes for table `survey_votings`
--
ALTER TABLE `survey_votings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tehsils`
--
ALTER TABLE `tehsils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tehsils_state_id_index` (`state_id`),
  ADD KEY `tehsils_district_id_index` (`district_id`),
  ADD KEY `tehsils_name_index` (`name`),
  ADD KEY `tehsils_status_index` (`status`);

--
-- Indexes for table `thanas`
--
ALTER TABLE `thanas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thanas_state_id_index` (`state_id`),
  ADD KEY `thanas_district_id_index` (`district_id`),
  ADD KEY `thanas_tehsil_id_index` (`tehsil_id`),
  ADD KEY `thanas_name_index` (`name`),
  ADD KEY `thanas_status_index` (`status`);

--
-- Indexes for table `town_villages`
--
ALTER TABLE `town_villages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `town_villages_state_id_index` (`state_id`),
  ADD KEY `town_villages_district_id_index` (`district_id`),
  ADD KEY `town_villages_tehsil_id_index` (`tehsil_id`),
  ADD KEY `town_villages_name_index` (`name`),
  ADD KEY `town_villages_status_index` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_name_index` (`name`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_password_index` (`password`),
  ADD KEY `users_phone_index` (`phone`),
  ADD KEY `users_image_index` (`image`),
  ADD KEY `users_forgot_otp_index` (`forgot_otp`),
  ADD KEY `users_role_index` (`role`),
  ADD KEY `users_is_admin_index` (`is_admin`),
  ADD KEY `users_status_index` (`status`);

--
-- Indexes for table `user_appointments`
--
ALTER TABLE `user_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_appointments_customer_id_index` (`customer_id`),
  ADD KEY `user_appointments_appointment_date_index` (`appointment_date`),
  ADD KEY `user_appointments_appointment_time_index` (`appointment_time`),
  ADD KEY `user_appointments_action_leader_id_index` (`action_leader_id`),
  ADD KEY `user_appointments_status_index` (`status`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_complaint_id_index` (`complaint_id`),
  ADD KEY `user_notifications_user_id_index` (`user_id`),
  ADD KEY `user_notifications_is_read_index` (`is_read`),
  ADD KEY `user_notifications_is_delete_index` (`is_delete`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wards_state_id_index` (`state_id`),
  ADD KEY `wards_district_id_index` (`district_id`),
  ADD KEY `wards_tehsil_id_index` (`tehsil_id`),
  ADD KEY `wards_municipality_id_index` (`municipality_id`),
  ADD KEY `wards_name_index` (`name`),
  ADD KEY `wards_status_index` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `assembly_constituency`
--
ALTER TABLE `assembly_constituency`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `complaint_assigns`
--
ALTER TABLE `complaint_assigns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `complaint_assign_status`
--
ALTER TABLE `complaint_assign_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `complaint_status`
--
ALTER TABLE `complaint_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `content_managements`
--
ALTER TABLE `content_managements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `executives`
--
ALTER TABLE `executives`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `executive_addresses`
--
ALTER TABLE `executive_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `executive_appointments`
--
ALTER TABLE `executive_appointments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_types`
--
ALTER TABLE `issue_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `leaders`
--
ALTER TABLE `leaders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `leader_notifications`
--
ALTER TABLE `leader_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `panchayat_wards`
--
ALTER TABLE `panchayat_wards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parliamentary_constituency`
--
ALTER TABLE `parliamentary_constituency`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_offices`
--
ALTER TABLE `post_offices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `representative_notifications`
--
ALTER TABLE `representative_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `representative_request_approvals`
--
ALTER TABLE `representative_request_approvals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `representative_to_dos`
--
ALTER TABLE `representative_to_dos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `survey_answers`
--
ALTER TABLE `survey_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `survey_votings`
--
ALTER TABLE `survey_votings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tehsils`
--
ALTER TABLE `tehsils`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `thanas`
--
ALTER TABLE `thanas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `town_villages`
--
ALTER TABLE `town_villages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_appointments`
--
ALTER TABLE `user_appointments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
