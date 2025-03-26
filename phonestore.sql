-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table phonestore.banners
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `san_pham_id` bigint unsigned NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_dang` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banners_san_pham_id_foreign` (`san_pham_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.banners: ~0 rows (approximately)
INSERT INTO `banners` (`id`, `san_pham_id`, `hinh_anh`, `ngay_dang`, `created_at`, `updated_at`) VALUES
	(1, 1, 'uploads/images/FvzPQSDfbUsuCMFHQCTJQ5xyhGrIynePmYka9eIS.webp', '2024-11-07', NULL, '2025-01-15 10:01:38'),
	(3, 1, 'uploads/images/FYbCP6iAiI170mgNhD2JTvPyoZdkB6GPVjqQYqad.webp', '2024-11-09', NULL, '2025-01-15 10:01:56'),
	(5, 1, 'uploads/images/FQ8aBUeGyyvoOfg5fBhCK3I3QnRWoLV2eUYncOUQ.webp', '2024-11-11', NULL, '2025-01-15 10:02:11'),
	(6, 1, 'uploads/images/XdlZtIkChhyackZrHPFLtrc9C3QXh1NZOfbJKCyH.webp', '2024-11-12', NULL, '2025-01-15 10:02:17'),
	(7, 1, 'uploads/images/9FPL8stpGGbkBX1pD3CS474R4Y7z0CG8XhLJdtfp.webp', '2024-11-13', NULL, '2025-01-15 10:02:24');

-- Dumping structure for table phonestore.binh_luans
CREATE TABLE IF NOT EXISTS `binh_luans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `san_pham_id` bigint unsigned DEFAULT NULL,
  `noi_dung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_binh_luan` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `binh_luans_san_pham_id_foreign` (`san_pham_id`),
  KEY `binh_luans_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.binh_luans: ~0 rows (approximately)
INSERT INTO `binh_luans` (`id`, `user_id`, `san_pham_id`, `noi_dung`, `ngay_binh_luan`, `created_at`, `updated_at`, `trang_thai`) VALUES
	(1, 1, 1, 'Sản phẩm đẹp!', '2024-11-07', NULL, NULL, 1),
	(2, 1, 1, 'Chất lượng tuyệt vời!', '2024-11-08', NULL, NULL, 1),
	(3, 1, 1, 'Rất hài lòng với sản phẩm này.', '2024-11-09', NULL, NULL, 1),
	(4, 1, 1, 'Sản phẩm đáng tiền!', '2024-11-10', NULL, NULL, 1),
	(5, 1, 1, 'Tôi sẽ mua lại!', '2024-11-11', NULL, NULL, 1),
	(6, 1, 1, 'Thiết kế rất đẹp.', '2024-11-12', NULL, NULL, 1),
	(7, 1, 1, 'Mình rất thích sản phẩm này!', '2024-11-13', NULL, NULL, 1),
	(8, 1, 1, 'Sản phẩm tuyệt vời!', '2024-11-14', NULL, NULL, 1),
	(9, 1, 1, 'Thời gian giao hàng rất nhanh.', '2024-11-15', NULL, NULL, 1),
	(10, 1, 1, 'Sẽ giới thiệu cho bạn bè.', '2024-11-16', NULL, NULL, 1);

-- Dumping structure for table phonestore.chi_tiet_don_hangs
CREATE TABLE IF NOT EXISTS `chi_tiet_don_hangs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `don_hang_id` bigint unsigned DEFAULT NULL,
  `san_pham_id` bigint unsigned DEFAULT NULL,
  `so_luong` int unsigned DEFAULT NULL,
  `dong_gia` double(10,2) DEFAULT NULL,
  `thanh_tien` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chi_tiet_don_hangs_don_hang_id_foreign` (`don_hang_id`),
  KEY `chi_tiet_don_hangs_san_pham_id_foreign` (`san_pham_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.chi_tiet_don_hangs: ~0 rows (approximately)
INSERT INTO `chi_tiet_don_hangs` (`id`, `don_hang_id`, `san_pham_id`, `so_luong`, `dong_gia`, `thanh_tien`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 80000000.00, 80000000.00, NULL, NULL),
	(2, 1, 1, 1, 14000000.00, 14000000.00, NULL, NULL),
	(3, 1, 1, 1, 19000000.00, 19000000.00, NULL, NULL),
	(4, 1, 1, 1, 16000000.00, 16000000.00, NULL, NULL),
	(5, 1, 1, 1, 11000000.00, 11000000.00, NULL, NULL),
	(6, 1, 1, 1, 15000000.00, 15000000.00, NULL, NULL),
	(7, 1, 1, 1, 20000000.00, 20000000.00, NULL, NULL),
	(8, 1, 1, 1, 18000000.00, 18000000.00, NULL, NULL),
	(9, 1, 1, 1, 12000000.00, 12000000.00, NULL, NULL),
	(10, 1, 1, 1, 17000000.00, 17000000.00, NULL, NULL),
	(11, 11, 1, 1, 14990000.00, 14990000.00, '2025-01-15 10:03:23', '2025-01-15 10:03:23'),
	(12, 11, 2, 1, 19000000.00, 19000000.00, '2025-01-15 10:03:23', '2025-01-15 10:03:23');

-- Dumping structure for table phonestore.danh_mucs
CREATE TABLE IF NOT EXISTS `danh_mucs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ten_danh_muc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.danh_mucs: ~0 rows (approximately)
INSERT INTO `danh_mucs` (`id`, `ten_danh_muc`, `created_at`, `updated_at`) VALUES
	(1, 'Iphone', NULL, NULL),
	(2, 'Samsung', NULL, NULL),
	(3, 'Oppo', NULL, NULL),
	(4, 'Readme', NULL, NULL),
	(5, 'Xiomi', NULL, NULL),
	(6, 'Vertu', NULL, NULL);

-- Dumping structure for table phonestore.don_hangs
CREATE TABLE IF NOT EXISTS `don_hangs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ma_don_hang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ten_nguoi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dia_chi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_nguoi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trang_thai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'cho_xac_nhan',
  `thanh_toan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'chua_thanh_toan',
  `tien_hang` double DEFAULT NULL,
  `tien_ship` double DEFAULT NULL,
  `tong_tien` double DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ngay_dat_hang` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phuong_thuc_thanh_toan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `don_hangs_ma_don_hang_unique` (`ma_don_hang`),
  KEY `don_hangs_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.don_hangs: ~0 rows (approximately)
INSERT INTO `don_hangs` (`id`, `ma_don_hang`, `ten_nguoi_nhan`, `dia_chi_nhan`, `email_nguoi_nhan`, `so_dien_thoai`, `trang_thai`, `thanh_toan`, `tien_hang`, `tien_ship`, `tong_tien`, `user_id`, `created_at`, `updated_at`, `ngay_dat_hang`, `phuong_thuc_thanh_toan`) VALUES
	(1, NULL, 'Vinh', 'Nam Từ Liêm, Hà Nội', NULL, '0987654321', '1', '1', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-07 00:00:00', '1'),
	(2, NULL, 'Nguyen Van An', 'Ba Đình, Hà Nội', NULL, '0987654321', '0', '0', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-08 00:00:00', '2'),
	(3, NULL, 'Tran Thi Bich', 'Cầu Giấy, Hà Nội', NULL, '0987654321', '1', '1', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-09 00:00:00', '1'),
	(4, NULL, 'Le Van Cuong', 'Hoàn Kiếm, Hà Nội', NULL, '0987654321', '0', '0', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-10 00:00:00', '2'),
	(5, NULL, 'Pham Thi Duyen', 'Đống Đa, Hà Nội', NULL, '0923456789', '1', '1', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-11 00:00:00', '1'),
	(6, NULL, 'Hoang Van Em', 'Hai Bà Trưng, Hà Nội', NULL, '0987654321', '0', '0', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-12 00:00:00', '2'),
	(7, NULL, 'Vu Thi Phuong', 'Hà Đông, Hà Nội', NULL, '0987654321', '1', '1', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-13 00:00:00', '1'),
	(8, NULL, 'Do Van Giang', 'Tây Hồ, Hà Nội', NULL, '0987654321', '0', '0', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-14 00:00:00', '2'),
	(9, NULL, 'Nguyen Thi Hien', 'Thanh Xuân, Hà Nội', NULL, '0923456789', '1', '1', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-15 00:00:00', '1'),
	(10, NULL, 'Phan Van Hung', 'Long Biên, Hà Nội', NULL, '0987654321', '0', '0', NULL, NULL, NULL, 1, NULL, NULL, '2024-11-16 00:00:00', '2'),
	(11, 'GT-1-1736960603', 'Đào Xuân Hùng', 'Nam Từ Liêm, Hà Nội', 'admin@gmail.com', '0987654321', 'cho_xac_nhan', 'chua_thanh_toan', 33990000, 0, 33990000, 1, '2025-01-15 10:03:23', '2025-01-15 10:03:23', NULL, NULL);

-- Dumping structure for table phonestore.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table phonestore.gio_hangs
CREATE TABLE IF NOT EXISTS `gio_hangs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `san_pham_id` bigint unsigned DEFAULT NULL,
  `so_luong` int unsigned DEFAULT NULL,
  `thanh_tien` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gio_hangs_san_pham_id_foreign` (`san_pham_id`),
  KEY `gio_hangs_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.gio_hangs: ~0 rows (approximately)
INSERT INTO `gio_hangs` (`id`, `user_id`, `san_pham_id`, `so_luong`, `thanh_tien`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 80000000.00, NULL, NULL),
	(2, 2, 2, 1, 14000000.00, NULL, NULL),
	(3, 3, 3, 1, 19000000.00, NULL, NULL),
	(4, 1, 4, 1, 16000000.00, NULL, NULL),
	(5, 2, 5, 1, 11000000.00, NULL, NULL),
	(6, 3, 6, 1, 15000000.00, NULL, NULL),
	(7, 1, 7, 1, 20000000.00, NULL, NULL),
	(8, 2, 8, 1, 18000000.00, NULL, NULL),
	(9, 3, 9, 1, 12000000.00, NULL, NULL),
	(10, 1, 10, 1, 17000000.00, NULL, NULL);

-- Dumping structure for table phonestore.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attempts` tinyint unsigned DEFAULT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned DEFAULT NULL,
  `created_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.jobs: ~0 rows (approximately)

-- Dumping structure for table phonestore.lien_hes
CREATE TABLE IF NOT EXISTS `lien_hes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noi_dung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_gui` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.lien_hes: ~0 rows (approximately)

-- Dumping structure for table phonestore.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_07_14_020923_create_danh_mucs_table', 1),
	(6, '2024_07_14_022720_create_san_phams_table', 1),
	(7, '2024_07_14_023456_create_don_hangs_table', 1),
	(8, '2024_07_14_023848_create_tai_khoans_table', 1),
	(9, '2024_07_14_024316_create_gio_hangs_table', 1),
	(10, '2024_07_14_024418_create_chi_tiet_don_hangs_table', 1),
	(11, '2024_07_14_024451_create_binh_luans_table', 1),
	(12, '2024_07_14_024538_create_tin_tucs_table', 1),
	(13, '2024_07_14_024633_create_banners_table', 1),
	(14, '2024_07_15_034121_update_don_hangs', 1),
	(15, '2024_07_22_023125_update_gia_san_pham_table', 1),
	(16, '2024_08_01_165244_update_don_hangs_table', 1),
	(17, '2024_08_01_170318_create_jobs_table', 1),
	(18, '2024_08_03_024145_create_lien_hes_table', 1),
	(19, '2024_08_03_050553_update_binh_luans_table', 1),
	(20, '2024_08_03_050745_update_binh_luan_table', 1),
	(21, '2024_08_03_054559_update_binh_luans_table', 2),
	(22, '2024_08_03_151336_add_tieu_de_table', 2),
	(23, '2024_08_05_062449_create_password_resets_table', 2);

-- Dumping structure for table phonestore.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.password_resets: ~0 rows (approximately)

-- Dumping structure for table phonestore.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table phonestore.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table phonestore.san_phams
CREATE TABLE IF NOT EXISTS `san_phams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ten_san_pham` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gia` double(10,2) DEFAULT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_luong` int unsigned DEFAULT NULL,
  `mo_ta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `danh_muc_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gia_khuyen_mai` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `san_phams_danh_muc_id_foreign` (`danh_muc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.san_phams: ~0 rows (approximately)
INSERT INTO `san_phams` (`id`, `ten_san_pham`, `gia`, `hinh_anh`, `so_luong`, `mo_ta`, `danh_muc_id`, `created_at`, `updated_at`, `gia_khuyen_mai`) VALUES
	(1, 'Iphone 15', 15000000.00, 'uploads/images/aCQmaGGH1o5nvzAQHeRzIpT1ZvTfHaGlJIFFWBlw.webp', 10, 'Qua chat luong', 1, NULL, '2025-01-15 09:56:59', 14990000),
	(2, 'Samsung Galaxy S23', 20000000.00, 'uploads/images/3TGY8Krc13Rtuj5b3ybPdJwOIVkQ4wKLYBDktlDz.jpg', 15, 'Màn hình đẹp', 2, NULL, '2025-01-15 09:59:27', 19000000),
	(3, 'Oppo Find X3', 18000000.00, 'uploads/images/75yvXuVmVcuEHUaw8dGOHB3NnrhqsdIewbMzHEtK.jpg', 20, 'Camera ấn tượng', 3, NULL, '2025-01-15 09:59:21', 17000000),
	(4, 'Redmi Note 10', 12000000.00, 'uploads/images/Co6zBkAIaDDLbwj7XHRkKjWrWzPNsQmxrLNfKOJS.jpg', 25, 'Giá cả phải chăng', 1, NULL, '2025-01-15 09:58:17', 11000000),
	(5, 'Xiaomi Mi 11', 17000000.00, 'uploads/images/xIoSMxPUALqrkc3QAY6KlTxqJVloux62Hq47ZRMH.jpg', 30, 'Hiệu năng mạnh mẽ', 5, NULL, '2025-01-15 09:59:13', 16000000),
	(6, 'Vertu Signature S', 80000000.00, 'uploads/images/mD6VKc5bv2l7rWOWqMwchjBW72M51b6zQCQcwnvK.jpg', 5, 'Sang trọng và đẳng cấp', 6, NULL, '2025-01-15 09:59:07', 78000000),
	(7, 'Iphone 14', 14000000.00, 'uploads/images/cqSJhNn2Kwgf6Lk29cn4tVFa5vsBolIyxNRHwDMl.jpg', 12, 'Công nghệ tiên tiến', 1, NULL, '2025-01-15 09:59:48', 13990000),
	(8, 'Samsung Galaxy S22', 19000000.00, 'uploads/images/AlkSqtXCRPPZKZwAZr6acgpbbTksEmtFrBmkA9kK.jpg', 18, 'Thiết kế hiện đại', 2, NULL, '2025-01-15 10:00:10', 18900000),
	(9, 'Oppo Reno6', 16000000.00, 'uploads/images/KpGgcfWOyRyODgIvFgeeY2MpGG2evSITK55jATv1.jpg', 22, 'Hiệu suất tốt', 3, NULL, '2025-01-15 10:00:37', 15900000),
	(10, 'Redmi Note 9', 11000000.00, 'uploads/images/NgaHNVvvr9q0rnDDgHoHRf56S0kuwxa5G5dnXuO5.jpg', 28, 'Pin lâu', 5, NULL, '2025-01-15 10:00:57', 10000000);

-- Dumping structure for table phonestore.tai_khoans
CREATE TABLE IF NOT EXISTS `tai_khoans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ten_dang_nhap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `so_dien_thoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dia_chi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vai_tro` tinyint(1) DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tai_khoans_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.tai_khoans: ~0 rows (approximately)

-- Dumping structure for table phonestore.tin_tucs
CREATE TABLE IF NOT EXISTS `tin_tucs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_dang` date DEFAULT NULL,
  `noi_dung` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tieu_de` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `tin_tucs_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.tin_tucs: ~10 rows (approximately)
INSERT INTO `tin_tucs` (`id`, `hinh_anh`, `ngay_dang`, `noi_dung`, `user_id`, `created_at`, `updated_at`, `tieu_de`) VALUES
	(1, '1.jpg', '2024-11-07', 'Sự kiện liên quan đến công nghệ hiện đại diễn ra vào tháng 11 năm 2024. Các chuyên gia hàng đầu sẽ thảo luận về những phát triển mới nhất trong lĩnh vực trí tuệ nhân tạo.', 1, NULL, NULL, NULL),
	(2, '2.jpg', '2024-11-08', 'Hội thảo về sự phát triển của 5G và ảnh hưởng của nó đến các lĩnh vực khác.', 2, NULL, NULL, NULL),
	(3, '3.jpg', '2024-11-09', 'Cuộc thi lập trình dành cho sinh viên với nhiều phần thưởng hấp dẫn.', 3, NULL, NULL, NULL),
	(4, '4.jpg', '2024-11-10', 'Triển lãm công nghệ hàng năm với sự tham gia của nhiều công ty lớn.', 1, NULL, NULL, NULL),
	(5, '5.jpg', '2024-11-11', 'Chương trình đào tạo về phát triển ứng dụng di động.', 2, NULL, NULL, NULL),
	(6, '6.jpg', '2024-11-12', 'Hội nghị thảo luận về bảo mật thông tin trong kỷ nguyên số.', 3, NULL, NULL, NULL),
	(7, '7.jpg', '2024-11-13', 'Chương trình khởi nghiệp công nghệ cho thanh niên.', 1, NULL, NULL, NULL),
	(8, '8.jpg', '2024-11-14', 'Diễn đàn công nghệ xanh và phát triển bền vững.', 2, NULL, NULL, NULL),
	(9, '9.jpg', '2024-11-15', 'Khóa học miễn phí về trí tuệ nhân tạo và máy học.', 3, NULL, NULL, NULL),
	(10, '10.jpg', '2024-11-16', 'Cuộc thi phát triển sản phẩm công nghệ sáng tạo.', 1, NULL, NULL, NULL);

-- Dumping structure for table phonestore.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ten_dang_nhap` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vai_tro` tinyint(1) DEFAULT '0',
  `trang_thai` tinyint(1) DEFAULT '0' COMMENT '0.Tốt, 1.Đã khóa',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_ten_dang_nhap_unique` (`ten_dang_nhap`),
  UNIQUE KEY `users_so_dien_thoai_unique` (`so_dien_thoai`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table phonestore.users: ~4 rows (approximately)
INSERT INTO `users` (`id`, `ho_va_ten`, `ten_dang_nhap`, `email`, `email_verified_at`, `password`, `so_dien_thoai`, `dia_chi`, `vai_tro`, `trang_thai`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Đào Xuân Hùng', 'admin', 'admin@gmail.com', NULL, '$2y$10$lUctaWcCDsBuqUDMfOjrgurE38WXuChJYqmD3MTLOlsYYbzK5zkTS', '0987654321', 'Nam Từ Liêm, Hà Nội', 1, 0, NULL, NULL, NULL),
	(2, 'Nguyễn Thiện Giáp', 'sunkenvalley', 'ccccc3@gmail.com', NULL, '$2y$10$lUctaWcCDsBuqUDMfOjrgurE38WXuChJYqmD3MTLOlsYYbzK5zkTS', '0987654322', 'Nam Từ Liêm, Hà Nội', 1, 0, NULL, NULL, NULL),
	(3, 'Nguyễn Lan Anh', 'lananh', 'ccccc2@fpt.edu.vn', NULL, '$2y$10$lUctaWcCDsBuqUDMfOjrgurE38WXuChJYqmD3MTLOlsYYbzK5zkTS', '0987654323', 'Ba Đình, Hà Nội', 1, 0, NULL, NULL, NULL),
	(4, 'Trần Đức Bảo', 'baotd', 'ccccc@fpt.edu.vn', NULL, '$2y$10$lUctaWcCDsBuqUDMfOjrgurE38WXuChJYqmD3MTLOlsYYbzK5zkTS', '0987654324', 'Ba Đình, Hà Nội', 1, 0, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
