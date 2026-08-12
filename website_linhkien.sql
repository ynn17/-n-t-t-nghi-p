-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th5 30, 2026 lúc 01:57 PM
-- Phiên bản máy phục vụ: 8.3.0
-- Phiên bản PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `website_linhkien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deposits`
--

CREATE TABLE `deposits` (
  `id` int NOT NULL,
  `deposit_code` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `method` varchar(100) NOT NULL,
  `card_type` varchar(50) DEFAULT NULL,
  `card_amount` int NOT NULL DEFAULT '0',
  `card_pin` varchar(100) DEFAULT NULL,
  `card_serial` varchar(100) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'success',
  `status_text` varchar(50) NOT NULL DEFAULT 'Thanh cong',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `deposits`
--

INSERT INTO `deposits` (`id`, `deposit_code`, `user_id`, `username`, `method`, `card_type`, `card_amount`, `card_pin`, `card_serial`, `status`, `status_text`, `created_at`) VALUES
(1, 'DEP-44398', 1, 'chinhapi', 'The cao Viettel', 'viettel', 100000, '13123', '123123', 'success', 'Thanh cong', '2026-05-22 08:58:21'),
(2, 'DEP-26842', 1, 'chinhapi', 'Chuyen khoan Ngan hang', '', 1000000, '', 'BANK-', 'success', 'Thanh cong', '2026-05-22 09:00:54'),
(3, 'DEP-16570', 1, 'chinhapi', 'Chuyen khoan Ngan hang', '', 1000000, '', 'BANK-', 'success', 'Thanh cong', '2026-05-22 09:01:00'),
(4, 'DEP-99288', 1, 'chinhapi', 'Chuyen khoan Ngan hang', '', 1000000, '', 'BANK-', 'success', 'Thanh cong', '2026-05-22 09:01:33'),
(5, 'DEP-22765', 1, 'chinhapi', 'Chuyen khoan Ngan hang', '', 1000000, '', 'BANK-', 'success', 'Thanh cong', '2026-05-22 09:01:37'),
(6, 'DEP-67943', 1, 'chinhapi', 'Chuyển khoản ngân hàng', '', 100000, '', 'BANK-MEM0001', 'success', 'Thành công', '2026-05-22 09:03:15'),
(7, 'DEP-72115', 1, 'chinhapi', 'Chuyển khoản ngân hàng', '', 100000, '', 'BANK-MEM0001', 'success', 'Thành công', '2026-05-30 04:04:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `options`
--

CREATE TABLE `options` (
  `id` int NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `options`
--

INSERT INTO `options` (`id`, `key`, `value`) VALUES
(1, 'ten_web', 'Shop Công Nghệ Rider'),
(2, 'sdt_admin', '0987654321'),
(3, 'email_admin', 'admin@rider.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `product_details` text NOT NULL,
  `total_qty` int NOT NULL,
  `total_price` int NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `status_text` varchar(50) DEFAULT 'Đang xử lý',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `username`, `product_details`, `total_qty`, `total_price`, `payment_method`, `status`, `status_text`, `created_at`) VALUES
(1, 'ORD-11932', 'Nguyen Van A', 'VGA ASUS Dual GeForce RTX 3060 12GB (x2)', 2, 14991000, 'Chuyển khoản Ngân hàng', 'success', 'Đã giao hàng', '2026-05-22 07:54:45'),
(2, 'ORD-79108', 'chinhapi', 'Arduino Uno R3 (Chíp Cắm) + Cáp (x1), Intel Core i5-12400F Box Chính Hãng (x1), RAM Corsair Vengeance LPX 16GB DDR4 3200MHz (x1)', 3, 4260750, 'Số dư tài khoản', 'success', 'Đã thanh toán', '2026-05-22 08:28:29'),
(3, 'ORD-92343', 'chinhapi', 'Cảm Biến Siêu Âm HC-SR04 (x11), Module Relay 5V 4 Kênh Opto Cách Ly (x13)', 24, 817000, 'Chuyển khoản Ngân hàng', 'pending', 'Đang xử lý', '2026-05-22 08:31:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `subcategory` varchar(150) NOT NULL DEFAULT '',
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `image` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `subcategory`, `price`, `stock`, `image`, `description`, `created_at`) VALUES
(7, 'Intel Core i5-12400F Box Chính Hãng', 'may-tinh', 'cpu', 3250000, 18, 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&w=300&q=80', 'Bộ xử lý CPU Intel Core i5-12400F (6 nhân 12 luồng, xung nhịp lên tới 4.4GHz, không tích hợp iGPU), sự lựa chọn hoàn hảo cho cấu hình gaming tầm trung.', '2026-05-23 07:36:10'),
(8, 'RAM Corsair Vengeance LPX 16GB DDR4 3200MHz', 'may-tinh', 'cpu', 1090000, 35, 'https://images.unsplash.com/photo-1562976540-1502c2145186?auto=format&fit=crop&w=300&q=80', 'RAM Corsair Vengeance LPX DDR4 dung lượng 16GB (bộ 2 thanh 8GB), bus 3200MHz, tản nhiệt nhôm cao cấp, tối ưu hóa hiệu suất đa nhiệm.', '2026-05-23 07:36:11'),
(9, 'VGA ASUS Dual GeForce RTX 3060 12GB', 'may-tinh', 'cpu', 7890000, 12, 'https://images.unsplash.com/photo-1591488320449-011701bb6704?auto=format&fit=crop&w=300&q=80', 'Card màn hình đồ họa ASUS Dual RTX 3060 12GB với 2 quạt tản nhiệt thông minh, công nghệ DLSS, Ray Tracing, lý tưởng cho chiến game mượt mà.', '2026-05-23 07:36:11'),
(10, 'Arduino Uno R3 (Chíp Cắm) + Cáp', 'dien-tu', 'vi-dieu-khien', 145000, 50, 'https://pos.nvncdn.com/f2fe44-24897/ps/20240730_MyXktUWW6C.jpeg?v=1722309654', 'Kit học tập Arduino Uno R3 bản chip cắm, thích hợp cho người mới bắt đầu học lập trình nhúng.', '2026-05-23 07:36:11'),
(11, 'Cảm Biến Siêu Âm HC-SR04', 'dien-tu', 'vi-dieu-khien', 25000, 120, 'https://images.unsplash.com/photo-1555664424-778a1e5e1b48?auto=format&fit=crop&w=300&q=80', 'Cảm biến khoảng cách bằng sóng siêu âm HC-SR04, độ chính xác cao từ 2cm đến 400cm.', '2026-05-23 07:36:11'),
(12, 'Module Relay 5V 4 Kênh Opto Cách Ly', 'dien-tu', 'vi-dieu-khien', 45000, 85, 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=300&q=80', 'Module điều khiển đóng ngắt thiết bị điện AC/DC công suất lớn thông qua vi điều khiển.', '2026-05-23 07:36:11'),
(13, 'Bộ chia màn hình VGA 1 ra 2 Ugreen 20918 Hỗ trợ full HD 1080P@60Hz', 'dien-tu', 'vi-dieu-khien', 260000, 500, 'https://phukiendientu.com/wp-content/uploads/2025/05/bo_chia_vga_1_vao_2_ra_ugreen_20918_0d3804868c314d49bcf8eb40e2830954_1024x1024.jpg', 'Bộ chia VGA 1 ra 2 cao cấp Ugreen 20918 hỗ trợ độ phân giải lên đến 1920×1440@60Hz với băng thông rộng tới 250Mhz. Được sản xuất bằng nguyên vật liệu bao gồm lõi cáp bằng đồng nguyên chất và các vi xử lý cao cấp mang đến khả năng chia tín hiệu vga ra 2 màn hình mà vẫn giữ nguyên chất lượng hình ảnh, là thiết bị hoàn hảo cho các nhu cầu giải trí, làm việc…', '2026-05-23 13:58:21'),
(14, 'Màn hình 27in', 'may-tinh', 'man-hinh', 30000, 23, 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&w=300&q=80', 'Màn hình PC 27z dz', '2026-05-30 07:08:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_subcategories`
--

CREATE TABLE `product_subcategories` (
  `id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `group_key` varchar(50) NOT NULL DEFAULT 'dien-tu',
  `status` varchar(20) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `product_subcategories`
--

INSERT INTO `product_subcategories` (`id`, `title`, `slug`, `group_key`, `status`) VALUES
(1, 'IC / Vi Điều Khiển', 'vi-dieu-khien', 'dien-tu', 'active'),
(2, 'Cảm Biến', 'cam-bien', 'dien-tu', 'active'),
(3, 'Module Mạch Chức Năng', 'module', 'dien-tu', 'active'),
(4, 'Phụ Kiện Kết Nối', 'phu-kien', 'dien-tu', 'active'),
(5, 'CPU - Bộ Xử Lý', 'cpu', 'may-tinh', 'active'),
(6, 'RAM - Bộ Nhớ Trong', 'ram', 'may-tinh', 'active'),
(7, 'VGA - Card Màn Hình', 'vga', 'may-tinh', 'active'),
(8, 'Ổ Cứng SSD / HDD', 'o-cung', 'may-tinh', 'active'),
(9, 'Màn hình', 'man-hinh', 'may-tinh', 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rfqs`
--

CREATE TABLE `rfqs` (
  `id` int NOT NULL,
  `rfq_code` varchar(50) NOT NULL,
  `user_id` int DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `company_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `note` text,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `status_text` varchar(50) NOT NULL DEFAULT 'Chờ phản hồi',
  `reply_content` text,
  `quoted_price` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `rfqs`
--

INSERT INTO `rfqs` (`id`, `rfq_code`, `user_id`, `username`, `company_name`, `email`, `product_name`, `quantity`, `note`, `status`, `status_text`, `reply_content`, `quoted_price`, `created_at`, `updated_at`) VALUES
(1, 'RFQ-50964', 1, 'chinhapi', 'Nguyễn Trung Chính', 'chinhapiit@gmail.com', 'Card 3060 asus', 10, 'Màu trắng 3 fan', 'pending', 'Chờ phản hồi', 'ádasd', 0, '2026-05-22 09:09:31', '2026-05-23 12:56:14'),
(2, 'RFQ-97459', 2, 'chinhk4', 'Nguyễn Trung Chính', 'chinhnt.k4@gmail.com', 'Card 3060 asus', 123, '123123', 'pending', 'Chờ phản hồi', '', 0, '2026-05-23 12:58:46', '2026-05-23 12:58:46'),
(3, 'RFQ-36094', 2, 'chinhk4', 'Nguyễn Trung Chính', 'chinhnt.k4@gmail.com', 'Card 3060 asus', 123, '123123', 'pending', 'Chờ phản hồi', '', 0, '2026-05-23 12:58:52', '2026-05-23 12:58:52'),
(4, 'RFQ-36369', 2, 'chinhk4', 'Nguyễn Trung Chính', 'chinhnt.k4@gmail.com', 'Card 3060 asus', 123, '123123', 'pending', 'Chờ phản hồi', '', 0, '2026-05-23 12:58:58', '2026-05-23 12:58:58'),
(5, 'RFQ-63799', 2, 'chinhk4', 'Nguyễn Trung Chính', 'chinhnt.k4@gmail.com', 'Card 3060 asus', 123, '123123', 'pending', 'Chờ phản hồi', '', 0, '2026-05-23 12:59:03', '2026-05-23 12:59:03'),
(6, 'RFQ-58903', 2, 'chinhk4', 'Nguyễn Trung Chính', 'chinhnt.k4@gmail.com', 'Card 3060 asus', 123, '123123', 'pending', 'Chờ phản hồi', '', 0, '2026-05-23 12:59:09', '2026-05-23 12:59:09'),
(7, 'RFQ-76889', 2, 'chinhk4', 'Nguyễn Trung Chính', 'chinhnt.k4@gmail.com', '132', 12312, '123123', 'success', 'Đã phản hồi', '', 0, '2026-05-23 13:02:24', '2026-05-23 13:03:26'),
(8, 'RFQ-49248', 3, 'yen12', 'Trần Yến', 'hatran2@gmail.com', 'Card 3060 12gb', 10, 'áđá', 'pending', 'Chờ phản hồi', '', 0, '2026-05-23 13:32:58', '2026-05-23 13:32:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'member',
  `session_token` varchar(255) DEFAULT NULL,
  `balance` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `email`, `phone`, `address`, `gender`, `role`, `session_token`, `balance`, `created_at`) VALUES
(1, 'chinhapi', '$2y$10$yktZtoT4/ybcOwvORbeb.Owxi514prB5frbUo3R4g20WVsaG20OAi', 'Nguyễn Trung Chính', 'chinhapiit@gmail.com', '0388674883', 'Nam Định', 'Nam', 'admin', '1666a09a4b55561c40ae1b1ce45df7b3', 10039250, '2026-05-22 08:22:52'),
(2, 'chinhk4', '$2y$10$FB.n8Yir78aMXZ13VLgcAuz4w/5rA9pgPHDU9NXvELrT47.UWq3hi', 'Nguyễn Trung Chính', 'chinhnt.k4@gmail.com', NULL, NULL, NULL, 'member', '', 10000000, '2026-05-22 09:22:43'),
(3, 'yen12', '$2y$10$P1lT7hgfmuvjve0R0Xe1juUOFfmYZgqw9SuzYJ95oVl5SjATNLrDK', 'Trần Yến', 'hatran2@gmail.com', NULL, NULL, NULL, 'admin', 'a14f74a89bbec882ba6fdb5abec41124', 10000000, '2026-05-23 13:32:25'),
(4, 'yen23', '$2y$10$8Zg0brcM98KESBhCylAn5.H9iXexHTTs8h/CVzslAUIkWpO9LwrZG', 'YếnTran', 'hatran2082@gmail.com', NULL, NULL, NULL, 'member', '', 0, '2026-05-23 13:55:44');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deposit_code` (`deposit_code`);

--
-- Chỉ mục cho bảng `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_code` (`order_code`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_subcategories`
--
ALTER TABLE `product_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `rfqs`
--
ALTER TABLE `rfqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rfq_code` (`rfq_code`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `options`
--
ALTER TABLE `options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `product_subcategories`
--
ALTER TABLE `product_subcategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `rfqs`
--
ALTER TABLE `rfqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
