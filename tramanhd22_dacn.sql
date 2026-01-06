-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 06, 2026 at 01:21 PM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 8.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tramanhd22_dacn`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-hung.tranvan@stu.edu.vn|58.187.185.204', 'i:1;', 1767604021),
('laravel-cache-hung.tranvan@stu.edu.vn|58.187.185.204:timer', 'i:1767604021;', 1767604021);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_hoi_dong`
--

CREATE TABLE `chi_tiet_hoi_dong` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `MaHD` varchar(20) NOT NULL,
  `MaGV` varchar(20) NOT NULL,
  `ChucVu` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DeTai`
--

CREATE TABLE `DeTai` (
  `MaDT` varchar(50) NOT NULL,
  `TenDeTai` varchar(255) NOT NULL,
  `TrangThai` varchar(50) NOT NULL,
  `MaGV` varchar(20) DEFAULT NULL,
  `MaGVPB` varchar(20) DEFAULT NULL,
  `MoTa` text DEFAULT NULL,
  `MaHD` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `DeTai`
--

INSERT INTO `DeTai` (`MaDT`, `TenDeTai`, `TrangThai`, `MaGV`, `MaGVPB`, `MoTa`, `MaHD`, `created_at`, `updated_at`) VALUES
('DT1003', 'Xây dựng website bán sách trực tuyến', 'Được tiếp tục', 'GV7BC', 'GV33B', 'Đề tài  Xây dựng website bán sách trực tuyến nhằm phát triển nền tảng thương mại điện tử chuyên cung cấp sách giấy/ebook đa thể loại. Website cho phép duyệt theo danh mục–NXB–tác giả, tìm kiếm nhanh, lọc theo giá/đánh giá/định dạng, xem trích đoạn, thêm giỏ hàng và thanh toán an toàn. Hệ thống hỗ trợ mã giảm giá, chương trình thành viên, gợi ý cá nhân hóa, danh sách yêu thích, theo dõi đơn hàng, đánh giá & bình luận. Phía quản trị có quản lý tồn kho–đơn hàng–khuyến mãi, nhập liệu ISBN, đồng bộ vận chuyển và báo cáo doanh thu.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT10F6', 'Ứng dụng quản lý tập lluyện và chế độ ăn cá nhân', 'Được tiếp tục', 'GV3CF', 'GV305', 'Ứng dụng quản lý tập lluyện và chế độ ăn cá nhân', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT13D7', 'Xây dựng sàn giao dịch bất động sản', 'Được tiếp tục', 'GVF0D', 'GVAD6', '- Đề tài tập trung phát triển một nền tảng trung gian kết nối người mua, người bán và người thuê bất động sản. Hệ thống cho phép người dùng đăng tin rao bán/cho thuê bất động sản một cách minh bạch với đầy đủ thông tin và hình ảnh. Đồng thời, người có nhu cầu có thể dễ dàng tìm kiếm, lọc và so sánh các bất động sản dựa trên nhiều tiêu chí khác nhau.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT14A8', 'Xây dựng website tìm kiếm việc làm', 'Được tiếp tục', 'GV33B', 'GV195', 'Mục đích của đề tài là xây dựng một website hỗ trợ kết nối giữa người tìm việc và nhà tuyển dụng, giúp việc tìm kiếm và đăng tuyển việc làm diễn ra nhanh chóng, hiệu quả và minh bạch', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT14BA', 'Xây dựng ứng dụng quản lý phòng trọ', 'Được tiếp tục', 'GV819', 'GV60B', 'Ứng dụng quản lý phòng trọ cho phép quản lý phòng, vật tư, dịch vụ. \nQuản lý khách hàng và hóa đơn hàng tháng ', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT176E', 'Xây dựng website bán cơ và phụ kiện bida', 'Được tiếp tục', 'GV7BC', 'GV75D', 'Đề tài  Xây dựng website bán cơ và phụ kiện bida nhằm phát triển một nền tảng thương mại điện tử chuyên cung cấp các sản phẩm liên quan đến bida như cơ, bi, bàn, găng tay, bao da và các phụ kiện khác. Website cho phép người dùng dễ dàng tìm kiếm, so sánh, đặt mua sản phẩm và theo dõi đơn hàng trực tuyến. Hệ thống tích hợp giỏ hàng, thanh toán trực tuyến, quản lý tồn kho và đánh giá sản phẩm. Mục tiêu của dự án là mang đến một kênh mua sắm tiện lợi, hiện đại và đáng tin cậy cho cộng đồng yêu thích bida.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT1940', 'Xây dựng WEBSITE cho cửa hàng bách hóa', 'Được tiếp tục', 'GV60B', 'GVA27', 'Xây dựng website quản lý bán hàng trực tuyến. Người dùng có thể xem, mua sản phẩm, quản lý giỏ hàng, đơn hàng, địa chỉ giao hàng, trong khi quản trị viên (Admin) có thể quản lý sản phẩm, danh mục, người dùng và theo dõi đơn hàng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT19A7', 'Xây dựng website bán quần áo', 'Được tiếp tục', 'GV31F', 'GVE87', 'Tìm hiểu nghiệp vụ bán hàng của các website bán quần áo hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán quần áo theo quy trình đã thiết kế\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT1A73', 'Ứng dụng quản lý kho hàng và đơn nhập xuất', 'Được tiếp tục', 'GV774', 'GV305', 'Mục tiêu: Quản lý hàng tồn, đơn nhập/xuất, nhà cung cấp.\nTính năng:\nCRUD sản phẩm, thống kê số lượng tồn\nTạo đơn nhập/xuất, lọc theo thời gian\nBáo cáo doanh thu, biểu đồ trực quan', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT1C21', 'Nghiên cứu và ứng dụng thư viện NetCode  for game Objects để xây dựng một game  multiplayer trên \nnền tảng Unity', 'Được tiếp tục', 'GV195', 'GV3CF', 'Tìm hiểu về thư viện NetCode for game Objects, xây dựng kịch bản game\n và hiện thực 1 game multiplayer trên nền tảng Unity', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT1D1E', 'Xây dựng Website quản lý và bán hàng nội thất', 'Cảnh Cáo', 'GV33B', 'GV195', 'Xây dựng một website hỗ trợ cửa hàng nội thất quản lý bán hàng trực tuyến và kho hàng một cách hiệu quả, hiện đại và dễ sử dụng; Cụ thể hóa quy trình nghiệp vụ của cửa hàng bán nội thất bao gồm: quy trình bán hàng trực tuyến và quy trình quản lý kho', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT1E2D', 'Xây dựng website bán giày', 'Được tiếp tục', 'GV82C', 'GVAD6', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm giày', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT1ECA', 'Xây dựng website bán quần áo nam nữ', 'Được tiếp tục', 'GV7BC', 'GV60B', 'Đề tài  Xây dựng website bán quần áo nam nữ nhằm phát triển nền tảng thương mại điện tử đáp ứng nhu cầu mua sắm thời trang đa dạng cho cả nam và nữ. Website cho phép duyệt danh mục theo bộ sưu tập/loại sản phẩm, lọc theo size–màu–chất liệu–giá, xem hướng dẫn chọn size, đánh giá sản phẩm, thêm giỏ hàng và thanh toán trực tuyến an toàn. Hệ thống hỗ trợ mã giảm giá, chương trình thành viên, theo dõi đơn hàng, đổi/trả, gợi ý phối đồ (lookbook) và quản trị tồn kho–đơn hàng–khuyến mãi.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT1ED8', 'Website bán giày', 'Được tiếp tục', 'GVAD6', 'GV33B', 'Xây dựng website bán hàng giày  , xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT1EE3', 'Xây dựng mạng xã hội kết nối hoạt động cộng đồng', 'Được tiếp tục', 'GVA27', 'GVAD6', 'Xây dựng mạng xã hội chuyên về các hoạt động cộng đồng: đăng sự kiện, đăng ký tham gia, chia sẻ thông tin sự kiện với người khác', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT2235', 'Website bán quần áo', 'Được tiếp tục', 'GVAD6', 'GVA83', 'Xây dựng website bán hàng quần áo, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT233C', 'Xây dựng Website bán các sản phẩm của Apple', 'Được tiếp tục', 'GV8F6', 'GVE12', 'Tìm hiểu đặc điểm sản phẩm của Apple. Hỗ trợ phân loại, tìm kiếm theo đặc điểm của sản phẩm. Theo dõi đơn hàng, kiểm tra thời hạn bảo hành sản phẩm. Thống kê doanh thu của mỗi loại sản phẩm.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT248B', 'Xây dựng website bán quần áo cho cửa hàng SomeHow', 'Được tiếp tục', 'GV195', 'GV3D9', 'Xây dựng website quản lý quần áo và hỗ trợ khách hàng đặt \nmua quần áo trực tuyến cho cửa hàng Somehow', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT269E', 'Phát hiện tấn công DDOS bằng học sâu trên dữ liệu NetFlow', 'Được tiếp tục', 'GV3CF', 'GV7BC', 'Phát hiện tấn công DDOS bằng học sâu trên dữ liệu NetFlow', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT2A8A', 'Xây dựng Website bán máy tính Desktop', 'Được tiếp tục', 'GV8F6', 'GV3CF', 'Tìm hiểu nghiệp vụ mua bán & quản lý sản phẩm máy tính và linh kiện. Hỗ trợ tìm kiếm theo thông số kỹ thuật của sản phẩm. Theo dõi đơn hàng, kiểm tra thời hạn bảo hành sản phẩm. Hỗ trợ xây dựng cấu hình và báo giá.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT2B91', 'Website Quản Lý Nhân Sự Công Ty Sản Xuất Bao Bì Nhựa MANAPlastic Tích Hợp App Chấm Công', 'Được tiếp tục', 'GV6B4', 'GVE1B', '- Xây dựng một trang web tập trung vào việc phát triển hệ thống quản lý nhân sự cho công ty viết bằng Angular (FE) và dùng Java Spring Boot (BE), hệ thống sẽ gồm có 4 role chính ( Admin, HR, Quản Lý Trực Tiếp, Nhân Viên) với các mục tiêu chính cho hệ thống bao gồm: quản lý tài khoản, chấm công ( có app chấm công ), lương, lịch làm việc, báo cáo, phân quyền chức năng ( Admin cũng có thể xem các thao tác trên hệ thống - Active Logs),...\nFE: Angular - BE: Spring Boot - App chấm công: Dart Flutter', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT2CFC', 'Xây dựng website đặt phòng khách sạn.', 'Được tiếp tục', 'GVE12', 'GVF0D', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm phòng, Đặt phòng, Đánh gíá, Bình luận\nAdmin: Quản lý phòng, Quản lý đặt phòng, quản lý dịch vụ,..', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT2F28', 'XÂY DỰNG WEBSITE HỔ TRỢ HỌC TẬP TIẾNG ANH', 'Được tiếp tục', 'GV60B', 'GV195', 'Xây dựng website hổ trợ học tập tiếng anh nhắc nhở hoàn thành khóa học và bán khóa Có bài kiểm tra để đánh giá năng lực.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT324A', 'Xây dựng website cho thuê xe', 'Được tiếp tục', 'GV75D', 'GV7E2', 'Xây dựng website kinh doanh cho thuê xe', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT328A', 'Xây dựng website bán điện thoại di động', 'Được tiếp tục', 'GVE1B', 'GVF0D', 'Xây dựng website khách hàng có thể mua và thanh toán điện thoại di động, có cho phép trả góp, admin có thể quản lý sản phẩm điện thoại di động về màu sắc, giá tiền', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT35E7', 'Website Platform học trực tuyến (Online Course) với thương hiệu Learnary, \n', 'Được tiếp tục', 'GV6B4', 'GV8F6', '- Xây dựng một nền tảng website bán khoá học với thương hiệu Learnary, đóng vai trò trung gian mang khóa học của người bán tới với học viên, với các chức năng chính như cho phép giảng viên đăng bán các khóa học, học viên tìm kiếm, mua, học các khóa học, đồng thời cũng có thể làm bài tập củng cố kiến thức sau khi học. Hệ thống gồm 3 vai trò chính (Người quản lý, Học Viên, Giảng Viên). \nFE: Next.js - BE:Express NodeJS', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT35F5', 'Xây dựng website bán quần áo thời trang', 'Được tiếp tục', 'GV75D', 'GV87E', 'Xây dựng website bán quần áo online', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT3681', 'Xây dựng website quản lý cho công ty logictics QH', 'Được tiếp tục', 'GV195', 'GV5B2', 'xây dựng website quản lý dịch vụ giao hàng. Hỗ trợ đối tác gửi đơn, \nvà công ty phân phối nhân viên nhận đơn và giao hàng cho khách hàng', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT36D4', 'Ứng dụng học từ vựng / ngôn ngữ\n(Language Learning App)', 'Được tiếp tục', 'GV774', 'GV906', 'Mục tiêu: Giúp người dùng học và ôn tập từ mới mỗi ngày.\n\nTính năng:\n\nTạo danh sách từ vựng, flashcard\n\nQuiz trắc nghiệm, điểm số\n\nCấp độ học và gợi ý ôn lại', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT3787', 'Xây dựng ứng dụng Web quản lý đăng ký sử dụng thiết bị phòng Gym của trường STU', 'Được tiếp tục', 'GV8F6', 'GV6B4', 'Quản lý thiết bị phòng gym STU, lập lịch hoạt động và cho người dùng đăng ký lịch sử dụng thiết bị. Kiểm tra đối sánh người dùng đã đăng ký lịch khi vào phòng gym và thông báo nhắc nhở người dùng nào đã hết giờ tập.', 'HD20251226062157aD', '2025-12-25 23:41:38', '2025-12-25 23:59:00'),
('DT38FA', 'Xây dựng website bán quần áo', 'Được tiếp tục', 'GVA27', 'GVE87', 'Xây dựng 1 website thương mại điện tử kinh doanh quần áo', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT3B2E', 'Xây dựng sàn giao dịch thương mại điện tử', 'Được tiếp tục', 'GV75D', 'GVA83', 'Xây dựng website cung cấp sàn giao dịch thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT3C43', 'Website bán bánh', 'Được tiếp tục', 'GVAD6', 'GV510', 'Xây dựng website bán hàng bánh ngọt, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT3F85', 'Xây dựng Website bán nguyên liệu sản phẩm từ thảo dược', 'Được tiếp tục', 'GV8F6', 'GVAD6', 'Phân loại thảo dược và dược tính của mỗi loại. Hỗ trợ tìm kiếm sản phẩm theo nhóm danh mục, công dụng. Quản lý đơn hàng, quản lý thanh toán và thống kê doanh thu, cảnh báo sản phẩm sắp hết hạn sử dụng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT3F97', 'Quản Lý quán cafe', 'Được tiếp tục', 'GV3CF', 'GV906', 'Xây dựng website + app hỗ trợ đặt món thanh toán cho quán cafe', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT405D', 'Hệ thống web quản lý sân và dịch vụ cầu lông', 'Được tiếp tục', 'GV3D9', 'GV31F', 'Hệ thống web đặt sân cầu lông tích hợp bán hàng, dịch vụ đan vợt, thanh toán online và vận chuyển, giúp số hóa hoạt động quản lý cho các câu lạc bộ cầu lông.   \n- Quản lý (Chủ sân/Admin):\nQuản lý sân bãi và lịch đặt, xử lý đổi/hủy lịch.\nQuản lý sản phẩm và dịch vụ, theo dõi đơn hàng, đơn đan vợt.\n- Khách hàng:\nĐặt sân trực tuyến, thanh toán online và nhận nhắc lịch.\nMua dụng cụ cầu lông và theo dõi giao hàng.\nĐặt dịch vụ đan vợt và theo dõi trạng thái xử lý.\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT4134', 'Xây dựng Website quản lý chung cư', 'Được tiếp tục', 'GV7E2', 'GV5B2', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT42E0', 'Website Đặt vé xem phim', 'Được tiếp tục', 'GV6B4', 'GV195', 'xây dựng 1 website đặt lịch khách sạn với 1 giao diện đơn giản hoá tối ưu thân thiện đối với người dùng, cho phép người dùng chọn và đặt phòng 1 cách nhanh gọn và nhận đc phản hồi email khi đã đặt thành công. Mục tiêu nhằm tăng số lượng khách và doanh thu cho người chủ và thuận tiện cho người dùng.\n\nFE: ReactJS, Clerk, Tailwindcsss. BE:Express Nodejs', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT458D', 'Xây dựng website bán điện thoại di động', 'Được tiếp tục', 'GVE1B', 'GVF0D', 'Xây dựng website khách hàng có thể mua và thanh toán điện thoại di động, có cho phép trả góp, admin có thể quản lý sản phẩm điện thoại di động về màu sắc, giá tiền', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT4659', 'Xây dựng website quản lý nhân sự cho công ty công nghệ phần mềm', 'Được tiếp tục', 'GV33B', 'GVE12', 'Đề tài “Xây dựng website quản lý nhân sự” nhằm phát triển một hệ thống hỗ trợ doanh nghiệp trong việc quản lý và vận hành đội ngũ nhân viên một cách hiệu quả, minh bạch và hiện đại. Website giúp tối ưu hóa quy trình làm việc, giảm thiểu công việc giấy tờ, đồng thời tăng cường khả năng truy cập và bảo mật thông tin', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT4874', 'Xây dựng website bán hoa tươi.', 'Đình Chỉ', 'GVE12', 'GV60B', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng PHP (MVC) + Mysql gồm 2 phần:\nUser: Tìm kiếm, Đặt hàng, Đánh gíá, Bình luận\nAdmin: Quản lý danh mục, Quản lý đơn hàng, quản lý dịch vụ,..', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT4882', 'Hệ thống tính tiền và quản lý doanh thu cho cửa hàng', 'Được tiếp tục', 'GV3D9', 'GV5B2', '- Xây dựng hệ thống tính tiền và quản lý doanh thu cho cửa hàng, giúp tự động hóa quy trình bán hàng và thanh toán.\n- Cho phép nhân viên tạo đơn hàng, tính tổng tiền, in hóa đơn và lưu dữ liệu giao dịch.\n- Hỗ trợ quản lý theo dõi doanh thu, thống kê sản phẩm bán chạy và xuất báo cáo theo thời gian.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT4890', 'Website ôn thi trắc nghiệm', 'Được tiếp tục', 'GV3CF', 'GV7E2', 'hỗ trợ người dùng quản lý và ôn thi trắc nghiệm', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT4B44', 'Xây dựng website bán vật tư điện lạnh', 'Được tiếp tục', 'GVA83', 'GV33B', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán vật tư điện lạnh.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT4C29', 'Ứng dụng quản lý quán cà phê/nhà hàng (POS System)', 'Được tiếp tục', 'GV774', 'GV3CF', 'Mục tiêu: Hỗ trợ nhân viên ghi order, thanh toán, quản lý bàn.\nTính năng:\nQuản lý món ăn, hóa đơn, doanh thu theo ngày\nIn hóa đơn, kết nối máy in (nếu có)\nGiao diện quản lý cho admin', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT4FFD', 'Xây dựng website mạng xã hội dành cho game thủ', 'Được tiếp tục', 'GVA27', 'GVAD6', 'Xây dựng website có các chức năng cơ bản của 1 mạng xã hội hướng tới nhóm người đam mê game', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5199', 'Xây dựng website quản lý nhân sự cho hệ thống quán cafe Sài Gòn Xưa', 'Được tiếp tục', 'GV195', 'GV33B', 'Xây dựng website quản lý nhân viên và lịch làm việc của nhân viên\n cho hệ thống quán cafe', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT525F', 'Xây dựng ứng dụng bán hàng mỹ phẩm', 'Được tiếp tục', 'GVF0D', 'GV906', 'Đề tài này tập trung phát triển một ứng dụng thương mại điện tử chuyên biệt cho lĩnh vực mỹ phẩm. Ứng dụng cung cấp một nền tảng để người dùng khám phá, tìm hiểu thông tin và mua sắm các sản phẩm như son, phấn, kem dưỡng da,...\nĐiểm nhấn của hệ thống là khả năng hiển thị đầy đủ thông tin sản phẩm, bao gồm thành phần, công dụng, hướng dẫn sử dụng và xuất xứ, nhằm xây dựng lòng tin và hỗ trợ quyết định mua hàng. Ứng dụng được kỳ vọng sẽ mang đến trải nghiệm mua sắm trực tuyến tiện lợi, an toàn và đáng tin cậy cho người dùng cuối', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT543B', 'Xây dựng Website hỗ trợ học tiếng Anh', 'Được tiếp tục', 'GV8F6', 'GV74E', 'Tổ chức các bài học với nhiều cấp độ khác nhau. Hỗ trợ đánh giá sự tiến bộ của người học qua các bài kiểm tra, người học chỉ được tham gia bài học cấp độ cao hơn khi đạt được 80% cấp độ kế trước.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5532', 'Xây dựng website bán giày', 'Cảnh Cáo', 'GVF0D', 'GV31F', 'Đề tài này tập trung phát triển một website thương mại điện tử chuyên bán các sản phẩm giày dép. Hệ thống cung cấp giao diện trực quan để khách hàng có thể dễ dàng duyệt, tìm kiếm và lựa chọn các mẫu giày theo nhiều tiêu chí khác nhau. Website được thiết kế để tối ưu hóa trải nghiệm mua sắm, từ việc xem ảnh sản phẩm chi tiết đến quy trình đặt hàng và thanh toán đơn giản. Về phía quản trị, hệ thống hỗ trợ quản lý danh mục, sản phẩm và đơn hàng một cách hiệu quả', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5A34', 'Xây dựng Website bán quần áo thời trang', 'Được tiếp tục', 'GV8F6', 'GVAA8', 'Tìm hiểu chủng loại quần áo muốn kinh doanh, hỗ trợ người dùng phân loại theo chủng loại, theo giới tính, thương hiệu... Hỗ trợ thanh toán online, theo dõi đơn hàng, thống kê doanh thu theo tháng, quý, năm và sản phẩm bán chạy nhất.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5B51', 'Xây dựng ứng dụng mobile hỗ trợ quản lý vận hành tòa nhà', 'Được tiếp tục', 'GV7BC', 'GVE1B', 'Đề tài  Xây dựng ứng dụng mobile hỗ trợ quản lý vận hành tòa nhà nhằm phát triển nền tảng iOS/Android dành cho cư dân, ban quản lý và kỹ thuật. Ứng dụng cho phép tiếp nhận & xử lý yêu cầu cư dân (ticket/work order), quản lý bảo trì–bảo dưỡng định kỳ, đặt tiện ích (bể bơi, phòng gym, sân tennis…), quản lý khách/xe ra vào, thông báo–bản tin nội bộ, ghi chỉ số điện nước và phản ánh sự cố kèm hình ảnh.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5BE9', 'Ứng dụng quản lý tài chính cá nhân', 'Được tiếp tục', 'GV774', 'GVF0D', 'Mục tiêu: Theo dõi chi tiêu, thu nhập, báo cáo.\nTính năng:\nGhi lại giao dịch hàng ngày\nBiểu đồ thu chi, lọc theo tháng\nXuất báo cáo CSV/PDF', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5BFB', 'Website hỗ trợ tìm kiếm việc làm', 'Được tiếp tục', 'GV3CF', 'GV819', 'Website hỗ trợ tìm kiếm việc làm', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5C96', 'Xây dựng Website bán hàng điện máy', 'Được tiếp tục', 'GV7E2', 'GV33B', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5D8D', 'Xây dựng Website cung dịch vụ cho thuê xe và thuê xe ô tô tự lái', 'Được tiếp tục', 'GV8F6', 'GV851', 'Tìm hiểu phương thức cung cấp dịch vụ thuê xe: điều kiện thuê, hợp đồng thuê, phương thức giao dịch… Quản lý, phân loại xe phù hợp với chủng loại, nhu cầu sử dụng, quản lý tình trạng xe, quản lý hợp đồng, thông tin khách hàng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT5F42', 'Xây dựng website đặt vé xem phim cho công ty CINEGO', 'Được tiếp tục', 'GVA27', 'GVE87', 'Xây dựng 1 website cho phép người dùng đặt vé xem phim, tìm kiếm phim cần mua vé, thanh toán online', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT6069', 'Xây dựng website quản lý thư viện', 'Được tiếp tục', 'GV2F8', 'GVA83', 'Là một hệ thống trực tuyến giúp quản lý sách, yêu cầu mượn sách và thông tin người dùng một cách hiệu quả, tối ưu hóa quy trình vận hành thư viện', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT63AF', 'Xây dựng ứng dụng hỗ trợ bệnh nhân ADHD', 'Được tiếp tục', 'GVA83', 'GV5B2', '- Tìm hiểu nghiệp vụ ứng dụng hỗ trợ bệnh nhân ADHD.\n- Tìm hiểu các công nghệ phát triển ứng dụng, AI.\n- Xây dựng CSDL\n- Hiện thực ứng dụng ', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT63BD', 'Xây dựng website bán hoa tươi', 'Được tiếp tục', 'GV510', 'GV75D', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán hoa tươi.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql', NULL, '2025-12-25 23:41:38', '2025-12-25 23:51:06'),
('DT64D0', 'Xây dựng app tiếp thị bất động sản', 'Được tiếp tục', 'GV851', 'GV7BC', 'Xây dựng ứng dụng tiếp thị bất động sản giúp hỗ trợ người dùng đăng tin cho thuê và mua bán bất động sản, cho phép xem và lọc danh sách theo khu vực, đường, phường, thành phố. Hệ thống tích hợp bản đồ tương tác hiển thị tọa độ định vị, thông tin liên hệ của người đăng, cùng tính năng tìm kiếm tự động theo đề xuất.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT6704', 'Ứng dụng đọc truyện tranh manga', 'Được tiếp tục', 'GV3CF', 'GV8F6', 'Mô tả: xây dựng backend và frontend di động hỗ trợ đọc truyện online', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT67F1', 'Xây dựng website đặt lịch khám bệnh trực tuyến', 'Được tiếp tục', 'GV7BC', 'GV819', 'Đề tài  Xây dựng website đặt lịch khám bệnh trực tuyến nhằm phát triển nền tảng giúp bệnh nhân dễ dàng tìm kiếm cơ sở y tế, bác sĩ phù hợp và đặt lịch khám nhanh chóng, tiện lợi qua internet. Hệ thống cho phép quản lý lịch hẹn, gửi thông báo nhắc lịch tự động, lưu trữ hồ sơ khám bệnh và hỗ trợ thanh toán trực tuyến. Website hướng đến việc tối ưu hóa quy trình khám chữa bệnh, giảm thời gian chờ đợi và nâng cao chất lượng dịch vụ y tế.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT692A', 'Xây dựng website bán quần áo', 'Được tiếp tục', 'GV82C', 'GVE87', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm quần áo', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT69CD', 'Xây dựng website bán bò sát', 'Được tiếp tục', 'GV60B', 'GVF0D', 'Xây dựng website bán bò sát cho phép quản lý sản phẩm, khách hàng và đơn hàng; hỗ trợ tìm kiếm, đặt mua trực tuyến, quản lý khuyến mãi và báo cáo doanh thu', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT69DF', 'Xây dựng website quản lý bán sách', 'Được tiếp tục', 'GV2F8', 'GV305', 'Website Quản lý bán sách một cổng thông tin điện tử phục vụ khách hàng và quản trị viên của hệ thống sử dụng', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT6A19', 'Xây dựng hệ thống phân tích cảm xúc người dùng mạng xã hội dựa trên bình luận ', 'Được tiếp tục', 'GV33B', 'GV851', 'Thu thập dữ liệu từ các trang mạng xã hội.\nXử lý và gán nhãn dữ liệu đã thu thập.\nXây dựng những bộ ngữ liệu từ các bình luận được thu thập.\nHuấn luyện mô hình PHOBert từ những bộ ngữ đã được xây dựng.\nXây dựng website tích hợp mô hình đã được huấn luyện vào để phân tích cảm xúc từ những bài viết trên các trang mạng xã hội.\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT6D74', 'Xây dựng website bán hàng thời trang', 'Được tiếp tục', 'GV33B', 'GVF0D', '- Mục đích của đề tài là nghiên cứu, thiết kế và xây dựng website bán hàng thời trang nhằm mở rộng quy mô kinh doanh, nâng cao chất lượng trải nghiệm mua sắm của khách hàng, đồng thời tối ưu hóa quy trình quản lý và vận hành hoạt động kinh doanh so với các mô hình bán hàng thông qua mạng xã hội', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT6E47', 'Xây dựng website bán sách điện tử trực tuyến', 'Được tiếp tục', 'GV7BC', 'GV3D9', 'Đề tài  Xây dựng website bán sách điện tử trực tuyến hướng đến việc tạo ra một nền tảng thương mại điện tử chuyên cung cấp và phân phối sách điện tử (eBook). Hệ thống cho phép người dùng duyệt, tìm kiếm, mua và đọc sách trực tuyến một cách thuận tiện. Website tích hợp các tính năng như đánh giá sách, quản lý thư viện cá nhân, bảo vệ bản quyền nội dung và hỗ trợ thanh toán an toàn. Mục tiêu của dự án là mang đến trải nghiệm đọc hiện đại, linh hoạt và khuyến khích văn hóa đọc trong thời đại số.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT6EA0', 'Xây dựng Website bán vé máy bay', 'Được tiếp tục', 'GV7E2', 'GV8F6', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7031', 'Xây dựng website bán quần áo', 'Được tiếp tục', 'GV82C', 'GVAA8', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm quần áo', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT70C4', 'Xây dựng ứng dụng quản lý sức khỏe', 'Được tiếp tục', 'GVF0D', 'GVAA8', 'Đề tài này tập trung phát triển một ứng dụng cá nhân hóa giúp người dùng theo dõi và quản lý tình trạng sức khỏe tổng quát của bản thân. Ứng dụng cung cấp các công cụ để ghi chép, lưu trữ và phân tích các chỉ số sức khỏe quan trọng theo thời gian. Mục tiêu là tạo ra một trợ lý sức khỏe số, hỗ trợ người dùng hình thành thói quen lành mạnh, cảnh báo sớm các dấu hiệu bất thường và cung cấp dữ liệu hữu ích khi cần tham vấn ý kiến chuyên môn từ bác sĩ', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT70D6', 'Xây dựng ứng dụng game \"Kẻ bị bỏ lại\"', 'Được tiếp tục', 'GV7E2', 'GV74E', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7302', 'Website hỗ trợ tìm kiếm và quản lý cho thuê phòng trọ', 'Được tiếp tục', 'GV3D9', 'GVA27', 'Mô tả đề tài: \nCác tính năng cốt lõi\n+ Đối với chủ trọ:\n- Đăng ký / đăng nhập\n- Đăng tin cho thuê (mô tả, hình ảnh, giá, địa chỉ...), xóa, chỉnh sửa.\n- Quản lý tình trạng phòng (trống, đã thuê, đang sửa chữa).\n- Quản lý hợp đồng, lịch sử cho thuê.\n+ Đối với người thuê:\n- Đăng ký / đăng nhập\n- Tìm kiếm, lọc phòng trọ theo khu vực, giá, tiện ích... .\n- Xem chi tiết phòng (ảnh, bản đồ, giá, mô tả, đánh giá).\n- Đặt thuê hoặc liên hệ nhanh với chủ trọ.\n- Đánh giá/review sau khi thuê.\n+ Đối với hệ thống admin\n- Quản lý tài khoản\n- Quản lý hồ sơ cá nhân (tên, số điện thoại, ảnh đại diện).\n- Quản lý tin đăng (kiểm duyệt)\n- CSDL\n+ Các tính năng nâng cao\n- Thanh toán online (Momo, VNPay, Paypal).\n- Quản lý hợp đồng điện tử.\n- Thông báo qua email/SMS.\n- Dashboard thống kê doanh thu cho chủ trọ.\n- Tích hợp Google Maps API để hiển thị vị trí phòng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7369', 'Xây dựng Website bán quần áo', 'Được tiếp tục', 'GV7E2', 'GV3D9', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT746F', 'Xây dựng website đặt lịch khám bệnh', 'Được tiếp tục', 'GV60B', 'GV819', 'Xây dựng website đặt lịch khám bệnh có thể đặt lịch theo thời gian phù hợp nhằm đảm bảo hạn chế trường hợp quá tải bệnh nhân, hệ thống hỗ trợ quản lý lịch sửa đặt lịch, hồ sơ bệnh án để bệnh nhân có thể theo dõi theo từng đợt khám, quản lý bác sĩ, doanh thu của phòng khám, quản lý các ca làm việc, hỗ trợ đặt lịch hộ trong trường hợp người dùng không biêt cách đặt khám, quản lý thuốc', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT775C', 'Xây dựng ứng dụng quản lý quan hệ khách hàng cho doanh nghiệp bán lẻ', 'Được tiếp tục', 'GV7BC', 'GV906', 'Đề tài  Xây dựng ứng dụng quản lý quan hệ khách hàng (CRM) cho doanh nghiệp bán lẻ nhằm phát triển một nền tảng giúp doanh nghiệp theo dõi, phân tích và tối ưu hóa quá trình tương tác với khách hàng. Ứng dụng hỗ trợ quản lý thông tin khách hàng, lịch sử mua hàng, chăm sóc sau bán, và triển khai các chiến dịch marketing cá nhân hóa. Hệ thống hướng đến việc tăng doanh số, cải thiện trải nghiệm khách hàng và nâng cao hiệu quả vận hành của doanh nghiệp bán lẻ.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT77BB', 'Xây dựng Website quản lý kho', 'Được tiếp tục', 'GV7E2', 'GVE1B', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7972', 'Website bán nến thơm và tinh dầu', 'Được tiếp tục', 'GVAD6', 'GV195', 'Xây dựng website bán hàng tinh dầu, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7AA6', 'Xây dựng website đặt sân Pickleball', 'Được tiếp tục', 'GVE1B', 'GVA27', 'Xây dựng website cho phép khách hàng có thể đặt sân online theo 1 lần hoặc định kỳ, admin có thể quản lý được thời gian rảnh của sân', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7AB4', 'Xây dựng website bán quần áo thời trang', 'Được tiếp tục', 'GV75D', 'GV60B', 'Xây dựng website bán quần áo online', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7C35', 'Xây dựng ứng dụng quản lý phòng khám', 'Được tiếp tục', 'GVF0D', 'GV87E', 'Đề tài này tập trung phát triển một hệ thống phần mềm để số hóa và tự động hóa các quy trình nghiệp vụ cốt lõi của một phòng khám. Ứng dụng giúp theo dõi toàn bộ hành trình của bệnh nhân, từ đăng ký lịch hẹn, khám bệnh, đến kê đơn và thanh toán. Mục tiêu chính là giảm thiểu thủ tục giấy tờ, tối ưu hóa lịch trình làm việc của bác sĩ, quản lý thông tin bệnh nhân một cách tập trung và bảo mật, từ đó nâng cao hiệu quả hoạt động và chất lượng dịch vụ của phòng khám.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7D12', 'Xây dựng website bán áo khoác', 'Được tiếp tục', 'GV31F', 'GV7BC', 'Tìm hiểu nghiệp vụ bán hàng của các website bán áo khoác \nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán áo khoác theo quy trình đã thiết kế', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7DCB', 'Xây dựng Web site kinh doanh Laptop', 'Được tiếp tục', 'GV819', 'GV7BC', 'Xây dựng web site thương mại mua bán sản phẩm laptop', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7E1F', 'Xây dựng website QUẢN LÝ BÁN THỰC PHẨM CHỨC NĂNG', 'Được tiếp tục', 'GV2F8', 'GV906', 'Là một hệ thống thương mại điện tử giúp cửa hàng quản lý sản phẩm, khách hàng, đơn hàng và doanh thu hiệu quả.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT7EEA', 'Xây dựng website bán quần áo, phụ kiện', 'Được tiếp tục', 'GV82C', 'GV3CF', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm quần áo, phụ kiện', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT8049', 'Xây dựng website bán nông sản sạch', 'Được tiếp tục', 'GVF0D', 'GV60B', 'Đề tài này tập trung phát triển một website thương mại điện tử chuyên kinh doanh các mặt hàng nông sản sạch, có nguồn gốc rõ ràng. Hệ thống hướng tới việc kết nối trực tiếp người tiêu dùng với nhà cung cấp, nhằm đảm bảo chất lượng và độ tươi ngon của sản phẩm. Website cho phép người dùng dễ dàng tìm kiếm và đặt mua các loại rau củ, trái cây tươi sống. Trọng tâm của đề tài là xây dựng lòng tin thông qua việc cung cấp đầy đủ thông tin về nguồn gốc, quy trình canh tác cho từng sản phẩm', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT80AE', 'Xây dựng website bán bánh online', 'Được tiếp tục', 'GV510', 'GVF0D', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của cửa hàng bán bánh\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React - Node.js - MySQL', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT837A', 'Website bán hoa tươi', 'Được tiếp tục', 'GVAD6', 'GV305', 'Xây dựng website bán hàng hoa tươi, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT8405', 'Xây dựng ứng dụng quản lý cơ sở Bida', 'Được tiếp tục', 'GV819', 'GV6B4', 'Ứng dụng quản lý hoạt động chuỗi cơ sở Bida. \nQuản lý doanh thu ,nhân viên các dịch vụ hỗ trợ', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT8417', 'Xây dựng hệ thống phân tích cảm xúc người dùng mạng xã hội dựa trên bình luận ', 'Được tiếp tục', 'GV33B', 'GV851', 'Thu thập dữ liệu từ các trang mạng xã hội.\nXử lý và gán nhãn dữ liệu đã thu thập.\nXây dựng những bộ ngữ liệu từ các bình luận được thu thập.\nHuấn luyện mô hình PHOBert từ những bộ ngữ đã được xây dựng.\nXây dựng website tích hợp mô hình đã được huấn luyện vào để phân tích cảm xúc từ những bài viết trên các trang mạng xã hội.\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT8724', 'Xây dựng website luyện các kỹ năng tiếng Anh dựa trên nền tảng trí tuệ nhân tạo', 'Được tiếp tục', 'GV2F8', 'GV851', 'Xây dựng website tích hợp trí tuệ nhân tạo để tạo ra một môi trường học tiếng Anh tương tác, giúp người dùng chủ động luyện tập và cải thiện toàn diện các kỹ năng Viết, Nói, Nghe và Từ vựng thông qua cơ chế phản hồi thông minh, tức thì và được cá nhân hóa.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT87C3', 'Xây dựng website bán đồ thủ công online', 'Được tiếp tục', 'GV510', 'GV5B2', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của cửa hàng bán đồ thủ công.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React - Node.js - Mysql', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT890A', 'Xây dựng website gọi nước cà phê bằng mã QR tại quán', 'Được tiếp tục', 'GVAD6', 'GVA27', 'Xây dựng website bán hàng nước uống, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT8ADE', 'Xây dựng hệ thống IoT quản lý vườn cây', 'Được tiếp tục', 'GV851', 'GV74E', 'Xây dựng hệ thống IoT cho vườn sầu riêng giúp tự động thu thập và điều khiển quy trình chăm sóc cây sầu riêng thông qua. Hệ thống dùng ESP32 kết nối các cảm biến đo độ ẩm đất, nhiệt độ đất, chỉ số NPK, pH, nhiệt độ không khí và ánh sáng để liên tục ghi nhận trạng thái môi trường. Dựa trên dữ liệu thời gian thực để gửi thông báo tưới nước hoặc tưới phân hợp lý. Một quản lý công việc (task) cho phép tạo, gán và theo dõi nhiệm vụ cho người thực hiện công việc, kèm thông báo và lịch thực hiện. Phần Mở rộng Cửa hàng tích hợp (shop) cung cấp  thuốc và phân.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT8DB3', 'Website hỗ trợ chia sẻ tài liệu  sử dụng công nghệ NFT', 'Được tiếp tục', 'GV3CF', 'GV7BC', 'Website hỗ trợ chia sẻ tài liệu  sử dụng công nghệ NFT', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT8E67', 'Ứng dụng hỗ trợ chạy bộ sử dụng công nghệ NFT', 'Được tiếp tục', 'GV3CF', 'GV851', 'Ứng dụng hỗ trợ chạy bộ sử dụng công nghệ NFT', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT8E75', 'Xây dựng website bán vé sự kiện', 'Được tiếp tục', 'GV82C', 'GV510', 'Xây dựng ứng dụng web cho phép nhà tổ chức các sự kiện đăng ký, bán vé cho người xem', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT9011', 'Xây dựng website QUẢN LÝ BÁN LAPTOP', 'Được tiếp tục', 'GV2F8', 'GVAA8', 'Là một hệ thống thương mại điện tử giúp cửa hàng quản lý sản phẩm Laptop, khách hàng, đơn hàng và doanh thu một cách hiệu quả. ', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT918D', 'Xây dựng website QUẢN LÝ BÁN ĐỒ THỂ THAO', 'Được tiếp tục', 'GV2F8', 'GV3D9', 'Là hệ thống thương mại điện tử cho phép người dùng mua sắm trực tuyến các sản phẩm thể thao như quần áo, giày dép, dụng cụ, và phụ kiện đến từ nhiều thương hiệu khác nhau.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT93C5', 'Xây dựng ứng dụng quản lý đặt phòng khách sạn', 'Được tiếp tục', 'GV819', 'GV195', 'Ứng dụng cho phép quản lý việc đặt phòng của một khách sạn.\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT94A8', 'Quản lý điểm sinh viên hệ tín chỉ', 'Được tiếp tục', 'GV3D9', 'GVA83', 'Admin\n+ Chức năng quản lý sinh viên: Quản lý hồ sơ, cập nhật và tra cứu thông tin sinh viên hỗ trợ trong hệ thống.\n+ Chức năng quản lý môn học: Quản lý danh sách môn học trong toàn chương trình đào tạo, bao gồm môn tiên quyết và môn bắt buộc.\n+  Chức năng quản lý điểm sinh viên: Cho phép giảng viên và admin nhập, chỉnh sửa, và xem điểm sinh viên theo từng lớp tín chỉ.\n+ Chức năng quản lý học phí: Tính học phí dựa trên số tín chỉ đăng ký; hỗ trợ thống kê, in báo cáo.\n+ Chức năng quản lý lớp: Quản lý danh sách lớp theo khoa, khóa học, hỗ trợ nhà trường tổ chức và theo dõi tình hình học tập của sinh viên theo từng lớp.\n+ Chức năng quản lý lớp tín chỉ: cho phép sinh viên học linh hoạt nhiều lớp khác nhau trong cùng học kỳ .\n+  Chức năng quản lý đăng ký lớp tín chỉ: Cho phép sinh viên đăng ký học phần theo học kỳ, dựa trên kế hoạch đào tạo và điều kiện tiên quyết; hỗ trợ tra mã môn học.\n+ Chức năng phân quyền người dùng: Phân chia quyền hạn giữa admin, giảng viên và sinh viên nhằm đảm bảo bảo mật và quản lý thông tin hiệu quả.\n+ Chức năng in danh sách lớp tín chỉ: Cho phép admin in, xuất file danh sách sinh viên theo từng lớp tín chỉ.\n+ Chức năng in bảng điểm: Hỗ trợ admin in báo cáo điểm tổng hợp từng hoặc học kỳ.\n+ Chức năng in học phí: Cho phép in báo cáo chi tiết học phí từng sinh viên, phục vụ đối chiếu và lưu trữ.\n+Chức năng in danh sách đăng ký lớp tín : thống kê và lưu trữ thông tin sinh viên đã đăng ký từng lớp tín chỉ trong học kỳ.\nSinh viên:\n+ Chức năng thông tin cá nhân: Cho phép sinh viên xem, cập nhật hồ sơ cá nhân trong hệ thống.\n+ Chức năng bảng điểm: Hiển thị kết quả học tập chi tiết theo từng học kỳ hoặc toàn khóa, giúp sinh viên theo dõi tiến độ học tập.\n+ Chức năng  đăng ký môn học: Sinh viên đăng ký môn học đúng tiến độ và số lượng tín chỉ theo quy định.\n+ Chức năng đổi mật khẩu: Giúp người dùng bảo vệ thông tin tài khoản và đảm bảo tính bảo mật hệ thống.\n+ Chức năng học phí:Tự động cập nhật học phí theo số tín chỉ; tự động thay đổi khi sinh viên thêm hoặc hủy môn học.\nGiảng viên:\n+ Chức năng môn học giảng dạy: Cho phép giảng viên theo dõi các môn học và lớp tín chỉ mà mình phụ trách.\n+ Chức năng  xem danh sách sinh viên: Giúp giảng viên và admin xem danh sách sinh viên theo từng lớp học phần.\n+ Chức năng nhập điểm: Giảng viên cập nhật, chỉnh sửa và gửi kết quả học tập của sinh viên về phòng đào tạo.\n+ Chức năng thời khóa biểu giảng viên: Hiển thị và quản lý lịch giảng dạy theo từng học kỳ cho giảng viên.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT976E', 'Xây dựng website bán trang sức', 'Được tiếp tục', 'GV31F', 'GV305', 'Tìm hiểu nghiệp vụ bán trang sức của các website bán trang sức hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán trang sức theo quy trình đã thiết kế\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT977C', 'Xây dựng website bán lẻ linh kiện máy tính', 'Được tiếp tục', 'GV75D', 'GVAA8', 'Xây dưựng website bán lẻ linh kiện máy tính online', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT9952', 'Ứng dụng quản lý học tập \n(Student Portal)', 'Được tiếp tục', 'GV774', 'GV851', 'Mục tiêu: Giúp sinh viên quản lý học phần, điểm số, lịch học.\nTính năng:\nĐăng nhập phân quyền (sinh viên, giảng viên, admin)\nQuản lý lịch học, điểm, tài liệu\nXuất file PDF bảng điểm', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT99B5', 'Xây dựng website đặt phòng khách sạn.', 'Được tiếp tục', 'GVE12', 'GVF0D', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm phòng, Đặt phòng, Đánh gíá, Bình luận\nAdmin: Quản lý phòng, Quản lý đặt phòng, quản lý dịch vụ,..', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT9D1E', 'Xây dựng website bán giày thể thao', 'Được tiếp tục', 'GVE1B', 'GV305', 'Xây dựng website khách hàng có thể mua và thanh toán giày, admin có thể quản lý sản phẩm giày', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT9E3F', 'Xây dựng ứng dụng học ngoại ngữ', 'Được tiếp tục', 'GVA83', 'GV7E2', '- Tìm hiểu nghiệp vụ ứng dụng học ngoại ngữ.\n- Tìm hiểu các công nghệ phát triển ứng dụng.\n- Xây dựng CSDL\n- Hiện thực ứng dụng ', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT9ED1', 'Xây dựng website bán hoa tươi và đồ trang trí', 'Được tiếp tục', 'GVA83', 'GVE1B', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán hoa tươi và đồ trang trí.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DT9ED8', 'Xây dựng website bán thiết bị điện tử', 'Được tiếp tục', 'GV31F', 'GV510', 'Tìm hiểu nghiệp vụ của các website bán thiết bị điện tử hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán thiết bị điện tử theo quy trình đã thiết kế', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTA10B', 'Xây dựng web cho thuê phòng', 'Được tiếp tục', 'GV851', 'GV7E2', 'Xây dựng hệ thống hỗ trợ người dùng đăng tin, tìm kiếm và đặt thuê phòng trọ một cách thuận tiện. Website cho phép chủ phòng quản lý thông tin phòng, giá thuê, hình ảnh và trạng thái phòng còn trống. Người thuê có thể tìm kiếm phòng theo khu vực, giá và tiện ích, đồng thời liên hệ trực tiếp với chủ phòng. Hệ thống còn tích hợp chức năng đăng ký, đăng nhập, đánh giá và quản lý tài khoản người dùng. Mục tiêu là tạo ra một nền tảng hiệu quả, thân thiện, giúp kết nối nhanh chóng giữa người có nhu cầu thuê và cho thuê.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTA227', 'Xây dựng website bán vật dụng cho mèo', 'Được tiếp tục', 'GV851', 'GV33B', 'Xây dựng website bán vật dụng cho mèo. Website cho phép người dùng tìm kiếm, lựa chọn, đặt mua sản phẩm và theo dõi đơn hàng dễ dàng. Quản trị viên có thể quản lý sản phẩm, khách hàng và đơn hàng hiệu quả, đồng thời tối ưu hoá quy trình bán hàng. Thiết kế giao diện thân thiện, hỗ trợ tùy chỉnh, tìm kiếm và quản lý đơn hàng thuận tiện.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTA2C1', 'Xây dựng website bán linh kiện máy tính', 'Được tiếp tục', 'GVA83', 'GV75D', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán linh kiện máy tính.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTA54A', 'Xây dựng website bán điện thoại và phụ kiện', 'Được tiếp tục', 'GV75D', 'GV6B4', 'Xây dựng website bán điện thoại và phụ kiện online', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTA69E', 'Xây dựng website bán quần áo', 'Được tiếp tục', 'GVA27', 'GV87E', 'Xây dựng 1 website thương mại điện tử kinh doanh quần áo', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTA857', 'Xây dựng ứng dụng web thi trắc nghiệm trực tuyến', 'Được tiếp tục', 'GV851', 'GVE1B', 'Xây dựng website thi trắc nghiệm trực tuyến. Ứng dụng web thi trắc nghiệm trực tuyến giúp tổ chức và quản lý các nội dung cần ôn tập và kỳ kiểm tra dưới dạng trắc nghiệm cho học sinh, sinh viên. Người quản trị có thể dễ dàng tạo, sửa và phân loại câu hỏi theo chủ đề, mức độ. Hệ thống cho phép tạo bài kiểm tra, gán cho nhóm lớp cụ thể, và theo dõi kết quả. Học viên có thể ôn tập và để chuẩn bị trước kỳ kiểm tra chính thức.\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTAB83', 'Xây dựng website bán máy vi tính', 'Được tiếp tục', 'GVE1B', 'GV819', 'Xây dựng website khách hàng có thể mua và thanh toán máy vi tính, có cho phép trả góp, admin có thể quản lý sản phẩm máy vi tính và phụ kiện', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTACEE', 'Xây dựng ứng dụng đấu giá sản phẩm', 'Được tiếp tục', 'GV819', 'GV7E2', 'Ứng dụng như một  sàn đấu giá \ncho phép người dụng bán hoặc mua sản phẩm thông qua hình thức đấu giá', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTAF28', 'Xây  dựng Website bán hàng nội thất', 'Được tiếp tục', 'GV7E2', 'GVA83', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTAFDD', 'Xây dựng website đặt phòng khách sạn', 'Được tiếp tục', 'GVA83', 'GV8F6', '- Tìm hiểu nghiệp vụ quản lý, đặt phòng của một khách sạn.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTB14C', 'Công cụ/bot hỗ trợ giao dịch sàn binance', 'Được tiếp tục', 'GV3CF', 'GV851', NULL, NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTB298', 'Xây dựng ứng dụng mobile đặt vé xe khách', 'Được tiếp tục', 'GV7BC', 'GV3CF', 'Đề tài xây dựng ứng dụng mobile đặt vé xe khách nhằm phát triển nền tảng trên iOS/Android giúp người dùng tìm tuyến, so sánh giá/giờ chạy, chọn chỗ ngồi, đặt và thanh toán vé nhanh chóng. Ứng dụng hỗ trợ vé điện tử (QR), thông báo nhắc giờ khởi hành, theo dõi trạng thái chuyến đi theo thời gian thực (nếu nhà xe hỗ trợ), quản lý lịch sử đặt vé và chương trình tích điểm. Phía nhà xe có mô-đun quản trị chuyến/ghế/tồn vé, đối soát doanh thu và báo cáo.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTB383', 'Xây dựng Website bán mô hình figure Nhật Bản', 'Đình Chỉ', 'GV8F6', NULL, 'Xây dựng website quản lý và bán sản phẩm Figure, hỗ trợ phân loại tìm kiếm  theo chủ đề, chất liệu … Quản lý đơn hàng, thống kê phân loại nào được quan tâm nhiều nhất.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTB4EE', 'Xây dựng webiste bán điện thoại di động', 'Được tiếp tục', 'GV305', 'GVAA8', 'Sinh viên tìm hiểu nghiệp vụ và phân tích, thiết kế xây dựng website bán điện thoại di động', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTB5F5', 'Xây dựng website bán cà phê trực tuyến', 'Được tiếp tục', 'GV7BC', 'GVA27', 'Đề tài  Xây dựng website bán cà phê trực tuyến nhằm phát triển nền tảng thương mại điện tử chuyên cung cấp hạt/ bột cà phê, capsule, dụng cụ pha và quà tặng. Website cho phép duyệt theo loại hạt–mức rang–cách pha, xem ghi chú hương vị, nguồn gốc & truy xuất lô, chọn mức xay, thêm giỏ hàng và thanh toán an toàn. Hệ thống tích hợp gói đăng ký (subscription) giao định kỳ, mã giảm giá/điểm thưởng, theo dõi đơn hàng, đánh giá sản phẩm, gợi ý pha chế & công thức, cùng quản trị tồn kho–đơn hàng–khuyến mãi và kết nối đơn vị vận chuyển.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTB621', 'Xây dựng website đặt phòng khách sạn trực tuyến', 'Được tiếp tục', 'GV195', 'GV8F6', 'xây dựng website quản lý cho khách sạn và hỗ trợ đặt phòng khách sạn trực tuyến', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTBB3C', 'Hệ thống quản lý đặt lịch khám bệnh trực tuyến', 'Được tiếp tục', 'GV774', 'GV87E', 'Mục tiêu: Bệnh nhân đặt lịch, chọn bác sĩ, chuyên khoa.\nTính năng: \nĐăng nhập/đăng ký, xác thực qua email\nQuản lý lịch hẹn, gửi thông báo tự động\nGiao diện cho bác sĩ xem danh sách bệnh nhân\nỨng dụng: Phòng khám, bệnh viện nhỏ, phòng khám', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTBC43', 'Xây dựng website đặt tour du lịch.', 'Được tiếp tục', 'GVE12', 'GV906', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm tour du lịch, Đặt tour, Đánh gíá, Bình luận\nAdmin: Quản lý tour, Quản lý đặt tour, quản lý dịch vụ,..', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTBC51', 'Website xây dựng hệ thống đặt đồ ăn trực tuyến', 'Được tiếp tục', 'GVAD6', 'GV75D', 'Xây dựng website bán hàng món ăn vặt, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTBCE9', 'Xây dựng website học tiếng anh trực tuyến', 'Được tiếp tục', 'GV31F', 'GV74E', 'Tìm hiểu nghiệp vụ của các website học tiếng anh hiện tại\nxây dựng lược đồ CSDL và thiết kế giao diện cho đề tài\nXây dựng website học tiếng anh', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTBD73', 'Xây dựng ứng dụng Game', 'Được tiếp tục', 'GV819', 'GV7BC', 'Xây dựng ứng dụng Game hành động sử dụng unity', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTC126', 'Xây dựng website đặt phòng khách sạn trực tuyến', 'Được tiếp tục', 'GV195', 'GV8F6', 'xây dựng website quản lý cho khách sạn và hỗ trợ đặt phòng khách sạn trực tuyến', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTC2F2', 'Website Platform học trực tuyến (Online Course) với thương hiệu Learnary, \n', 'Được tiếp tục', 'GV6B4', 'GV8F6', '- Xây dựng một nền tảng website bán khoá học với thương hiệu Learnary, đóng vai trò trung gian mang khóa học của người bán tới với học viên, với các chức năng chính như cho phép giảng viên đăng bán các khóa học, học viên tìm kiếm, mua, học các khóa học, đồng thời cũng có thể làm bài tập củng cố kiến thức sau khi học. Hệ thống gồm 3 vai trò chính (Người quản lý, Học Viên, Giảng Viên). \nFE: Next.js - BE:Express NodeJS', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTC484', 'Hệ thống quản lý bàn và đặt món ăn nhà hàng', 'Được tiếp tục', 'GV3D9', 'GV87E', '- Dành cho nhân viên:\n+ Quản lý bàn: biết được số lượng bàn, tình trạng bàn, sức chứa của bàn, xử lý ghép bàn\n+ Quản lý đặt món: hỗ trợ khách hàng gọi món, xử lý yêu cầu hủy món, cập nhật phục vụ món\n- Dành cho khách hàng: giúp khách hàng tự tay gọi món', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTC59F', 'Website Đặt vé xem phim', 'Được tiếp tục', 'GV6B4', 'GV195', 'xây dựng 1 website đặt lịch khách sạn với 1 giao diện đơn giản hoá tối ưu thân thiện đối với người dùng, cho phép người dùng chọn và đặt phòng 1 cách nhanh gọn và nhận đc phản hồi email khi đã đặt thành công. Mục tiêu nhằm tăng số lượng khách và doanh thu cho người chủ và thuận tiện cho người dùng.\n\nFE: ReactJS, Clerk, Tailwindcsss. BE:Express Nodejs', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTC64B', 'Xây dựng website bán điện thoại.', 'Xin hoãn', 'GVE12', NULL, 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm điện thoại, Đặt hàng, Đánh gíá, Bình luận\nAdmin: Quản lý Danh Mục, Quản lý đặt hàng, quản lý dịch vụ khuyến mãi,..', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38');
INSERT INTO `DeTai` (`MaDT`, `TenDeTai`, `TrangThai`, `MaGV`, `MaGVPB`, `MoTa`, `MaHD`, `created_at`, `updated_at`) VALUES
('DTC7B1', 'Xây dựng website bán điện thoại', 'Được tiếp tục', 'GVA83', 'GV31F', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán điện thoại.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTCB44', 'Xây dựng website quản lý phòng nha', 'Được tiếp tục', 'GVE12', 'GVA27', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website frontend: Nextjs, backedn: Nodejs + Mysql\nGồm các tính năng: QUản lý nha sỹ, quản lý thông tin bệnh nhân, quản lý lịch khám,...', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTCB56', 'Web bán quần áo', 'Được tiếp tục', 'GVAD6', 'GV305', 'Xây dựng website bán hàng quần áo, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTCC3B', 'Website đặt phòng khách sạn trực tuyến', 'Được tiếp tục', 'GVF0D', 'GV8F6', 'Đề tài này tập trung phát triển một hệ thống website đặt phòng khách sạn, hoạt động theo mô hình đại lý. Hệ thống sẽ thiết lập quan hệ hợp tác với các đối tác khách sạn để nhập thông tin, giá phòng và tình trạng phòng trống. Người dùng cuối sẽ truy cập vào website này để tìm kiếm, so sánh và đặt phòng trực tiếp. Bài toán kỹ thuật trọng tâm là quản lý và đồng bộ hóa dữ liệu (phòng, giá, lịch đặt) từ nhiều đối tác khác nhau vào một cơ sở dữ liệu thống nhất của hệ thống, từ đó cung cấp trải nghiệm đặt phòng chính xác, minh bạch và liền mạch cho khách hàng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTD199', 'Xây dựng app quản lý bán hàng cho quán cafe', 'Được tiếp tục', 'GV851', 'GV3CF', 'Xây dựng ứng dụng quản lý bán hàng cho quán cà phê tập trung phát triển một ứng dụng di động hỗ trợ quán trong việc đặt món, quản lý đơn hàng và phục vụ khách hàng hiệu quả hơn. Ứng dụng cho phép người dùng lựa chọn món, thanh toán trực tuyến và giúp nhân viên dễ dàng theo dõi, xử lý đơn hàng nhanh chóng. Bên cạnh đó, hệ thống còn cung cấp chức năng thống kê doanh thu, giúp chủ quán quản lý hoạt động kinh doanh thuận tiện hơn và nâng cao chất lượng phục vụ.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTD24D', 'Xây dựng website bán nhạc cụ', 'Được tiếp tục', 'GV851', 'GV510', 'Xây dựng websites bán nhạc cụ, cho người dùng có thể tiếp cận nhiều mặt hàng khác nhau,xem thông số chi tiết của mặt hàng,mua hàng trực tuyến,cho phép khách hàng đặt nhạc cụ theo yêu cầu như kiểu mẫu dáng đàn, loại gỗ, thiết bị điện tử đi kèm với nhạc cụ,sẽ thể hiện giá cả của từng option mà người dùng chọn khi đặt nhạc cụ theo yêu cầu.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTD25F', 'Xây dựng website Quản lý đặt phòng và dịch vụ cho Khách sạn', 'Được tiếp tục', 'GV305', 'GV7E2', 'Sinh viên tìm hiểu nghiệp vụ và phân tích, thiết kế xây dựng website đặt phòng và dịch vụ của Khách sạn', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTD6F4', 'Website Quản Lý Nhân Sự Công Ty Sản Xuất Bao Bì Nhựa MANAPlastic Tích Hợp App Chấm Công', 'Được tiếp tục', 'GV6B4', 'GVE1B', '- Xây dựng một trang web tập trung vào việc phát triển hệ thống quản lý nhân sự cho công ty viết bằng Angular (FE) và dùng Java Spring Boot (BE), hệ thống sẽ gồm có 4 role chính ( Admin, HR, Quản Lý Trực Tiếp, Nhân Viên) với các mục tiêu chính cho hệ thống bao gồm: quản lý tài khoản, chấm công ( có app chấm công ), lương, lịch làm việc, báo cáo, phân quyền chức năng ( Admin cũng có thể xem các thao tác trên hệ thống - Active Logs),...\nFE: Angular - BE: Spring Boot - App chấm công: Dart Flutter', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTD83D', 'Xây dựng Website bán sách', 'Cảnh Cáo', 'GV8F6', 'GVE87', 'Tìm hiểu nghiệp vụ quản lý, phân loại sản phẩm, hỗ trợ khách hàng tìm kiếm và review một đoạn nội dung quyển sách, quản lý đơn hàng, hỗ trợ theo dõi đơn hàng, thanh toán online.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTD8DA', 'Xây dựng website bán đồ thể thao', 'Được tiếp tục', 'GVA83', 'GVF0D', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán đồ thể thao.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTDA1E', 'Xây dựng website bán sách online', 'Được tiếp tục', 'GVE1B', 'GV87E', 'Xây dựng website cho khách hàng có thể mua sách online, admin có thể quản lý sách', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTDB39', 'Xây dựng hệ thống đặt lịch khám bệnh trực tuyến', 'Được tiếp tục', 'GV33B', 'GV31F', 'Xây dựng một hệ thống số hóa toàn bộ quy trình lên lịch hẹn khám bệnh của phòng khám, giúp quản lý phòng khám hiệu quả hơn; -  Xây dựng cơ sở dữ liệu để lưu trữ và quản lý thông tin tập trung, bao gồm: hồ sơ bệnh nhân, thông tin bác sĩ, chuyên khoa, dịch vụ y tế và các ca khám còn trống', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTDC84', 'Xây dựng website bán áo thun', 'Được tiếp tục', 'GVE1B', 'GV31F', 'Xây dựng website cho khách hàng có thể mua áo thun online, cho phép đặt áo thun theo yêu cầu, admin có thể quản lý áo thun', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTE069', 'Xây dựng website bán nội thất văn phòng', 'Được tiếp tục', 'GV510', 'GV74E', '- Tìm hiểu nghiệp vụ quản lý bán hàng của một cửa hàng nội thất văn phòng.\n- Tìm hiểu các công nghệ phát triển website.\n- Tìm hiểu AI và tích hợp AI hỗ trợ phân tích kinh doanh và phân tích đánh giá sản phẩm.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTE07B', 'Xây dựng website quản lý kho', 'Được tiếp tục', 'GV75D', 'GV819', 'Xây dựng website cung cấp dịch vụ quản lý kho cho doanh nghiệp', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTE3AF', 'Xây dựng website bán Sách online', 'Được tiếp tục', 'GV510', 'GVE12', '- Tìm hiểu nghiệp vụ quản lý, bán hàng  của một nhà sách.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTE4C2', 'Xây dựng App theo dõi và hỗ trợ bình luận bóng đá', 'Được tiếp tục', 'GV819', 'GVAA8', 'Ứng dụng cung cấp thông tin các giải đấu bóng đá, \ncho phép các BLV và người dùng tương tác và đánh giá', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTE716', 'Xây dựng website QUẢN LÝ BÁN PC', 'Được tiếp tục', 'GV2F8', 'GV510', 'Là hệ thống thương mại điện tử giúp cửa hàng quản lý sản phẩm máy tính, linh kiện máy tính,  đơn hàng, doanh thu hiệu quả. Hệ thống giúp khách hàng dễ dàng xem và mua sắm sản phẩm trực tuyến và giúp quản trị viên quản lý hoạt động kinh doanh một cách thuận tiện.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTE751', 'Xây dựng website bán đồng hồ', 'Được tiếp tục', 'GV75D', 'GV3D9', 'Xây dựng website bán đồng hồ online', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTE938', 'Xây dựng website bán chậu cây cảnh', 'Được tiếp tục', 'GV82C', 'GV60B', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm chậu cảnh', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTE9DF', 'Xây dựng website bán quần áo và phụ kiện thể thao', 'Được tiếp tục', 'GV31F', 'GVE12', 'Tìm hiểu nghiệp vụ bán hàng của các website bán quần áo và phụ kiện thể thao hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán quần áo và phụ kiện thể thao theo quy trình đã thiết kế', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTED66', 'Xây dựng website quản lý chuỗi phòng trọ và hỗ trợ người dùng thuê phòng trực tuyến', 'Được tiếp tục', 'GV195', 'GVA83', 'Xây dựng website quản lý chuỗi phòng trọ, quản lý việc thuê phòng\n và chi phí. Hỗ trợ người dùng tìm và thuê phòng trọ', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTEE55', 'Xây dựng ứng dụng website kết nối và quản lý cộng đồng cầu lông', 'Được tiếp tục', 'GV82C', 'GV3D9', 'Xây dựng ứng dụng website kết nối và quản lý cộng đồng cầu lông', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTEEB2', 'Xây dựng website bán giày', 'Được tiếp tục', 'GV31F', 'GVA27', 'Tìm hiểu nghiệp vụ bán giày của các website bán giày hiện có\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán giày theo quy trình đã thiết kế\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF023', 'Ứng dụng + website hỗ trợ đấu giá sử dụng blockchain', 'Được tiếp tục', 'GV3CF', 'GVF0D', 'Ứng dụng + website hỗ trợ đấu giá sử dụng blockchain', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF0C4', 'Xây dựng website bán bánh online', 'Được tiếp tục', 'GV510', 'GVF0D', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của cửa hàng bán bánh\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React - Node.js - MySQL', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF302', 'Xây dựng website thương mại điện tử cho công ty OLDTOT', 'Được tiếp tục', 'GVA27', 'GV6B4', 'Xây dựng website cho phép người dùng rao bán hoặc tặng đồ cũ, người mua có thể tìm và liên hệ với người bán hoặc người tặng', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF310', 'Xây dựng website quản lý và bán vé sự kiện', 'Được tiếp tục', 'GV33B', 'GV5B2', '  Thiết kế và xây dựng một nền tảng Quản lý và Bán vé sự kiện, nhằm hỗ trợ và kết nối giữa khách hàng với những đơn vị tổ chức sự kiện. Mang đến sự tối ưu hóa các quy trình mua bán và quản lý vé trong sự kiện; -        Thiết kế một cổng thông tin sự kiện cho Khách hàng giúp người dùng dễ dàng tìm kiếm, xem, đặt vé và chỗ ngồi cho sự kiện đó', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF47D', 'Xây dựng website quản lý ao nuôi tôm', 'Được tiếp tục', 'GV33B', 'GVAD6', 'Xây dựng hệ thống website có khả năng lưu trữ, quản lý dữ liệu ao nuôi.\nXây dựng chức năng ghi nhận chất lượng nước,lượng thuốc, thức ăn và vật tư sử dụng hằng ngày.\nXây dựng tính năng cảnh báo khi các chỉ số môi trường quá ngưỡng và khi thuốc gần hết hạn.\nXây dựng chức năng thống kê và báo cáo: xuất kết quả sử dụng thuốc và chi phí vật tư theo từng vụ nuôi\n', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF74E', 'Xây dựng website bán đồ thể thao', 'Được tiếp tục', 'GVF0D', 'GV75D', '- Đề tài này tập trung phát triển một website thương mại điện tử chuyên về các sản phẩm thể thao. Hệ thống cung cấp một cổng thông tin trực tuyến cho phép khách hàng xem, tìm kiếm và đặt mua các mặt hàng như quần áo, dụng cụ và phụ kiên thể thao một cách thuận tiện. Về phía cửa hàng, website hỗ trợ toàn bộ quy trình từ quản lý sản phẩm, đơn hàng đến khách hàng.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF7A9', 'Xây dựng Website quản lý cửa hàng tiện lợi', 'Được tiếp tục', 'GV7E2', 'GVA27', 'Tìm hiểu nội dung game. Phân tích và thiết kế game. Hiện thực game .', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF960', 'Xây dựng Website học tiếng Nhật trực tuyến', 'Được tiếp tục', 'GV2F8', 'GVA27', 'Giúp người dùng có thể tra cứu từ vựng, luyện thi JLPT, và quản lý tiến độ học tập.', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTF972', 'WEBSITE tin tức', 'Được tiếp tục', 'GV82C', 'GVA27', NULL, NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTFAB4', 'Xây dựng website Bán cây cảnh', 'Được tiếp tục', 'GV305', 'GVE87', 'Sinh viên tìm hiểu nghiệp vụ và phân tích, thiết kế xây dựng website bán cây cảnh', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTFDD9', 'Xây dựng website bán máy tính', 'Được tiếp tục', 'GVA27', 'GV74E', 'Xây dựng 1 website thương mại điện tử kinh doanh máy tính và phụ kiện', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
('DTFE0D', 'Xây dựng website bán rau củ ', 'Được tiếp tục', 'GV510', 'GV87E', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của cửa hàng bán rau củ\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng Laravel - Mysql', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `diem_huong_dan`
--

CREATE TABLE `diem_huong_dan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `MSSV` varchar(20) NOT NULL,
  `pttk` double DEFAULT NULL,
  `tkvd` double DEFAULT NULL,
  `htvd` double DEFAULT NULL,
  `ktsp` double DEFAULT NULL,
  `tong` double DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  `bao_ve` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Danh_gia` text NOT NULL,
  `dieu_chinh` text DEFAULT NULL,
  `uu` text DEFAULT NULL,
  `nhuoc` text DEFAULT NULL,
  `cau_hoi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diem_huong_dan`
--

INSERT INTO `diem_huong_dan` (`id`, `MSSV`, `pttk`, `tkvd`, `htvd`, `ktsp`, `tong`, `ghi_chu`, `bao_ve`, `created_at`, `updated_at`, `Danh_gia`, `dieu_chinh`, `uu`, `nhuoc`, `cau_hoi`) VALUES
(1, 'DH52108380', 2.5, 2.5, 2.5, 0, 7.5, NULL, 'Không được bảo vệ', '2025-12-26 01:53:19', '2025-12-26 09:24:56', 'Đạt', 'asdfasfbfđgfghgjhsjhx,sd,xh,sjdh j,shj, hjsdhcdjshcjhdscjhdsjmcshdjchdsh', 'asdasd', NULL, 'asdasd'),
(2, 'DH52111881', 0, 2.5, 0, 2.5, 5, NULL, 'Được bảo vệ', '2025-12-26 01:53:19', '2025-12-26 09:24:56', 'Đạt', 'asdfasfbfđgfghgjhsjhx,sd,xh,sjdh j,shj, hjsdhcdjshcjhdscjhdsjmcshdjchdsh', 'asdasd', NULL, 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `diem_phan_bien`
--

CREATE TABLE `diem_phan_bien` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `MSSV` varchar(20) NOT NULL,
  `pttk` double DEFAULT NULL,
  `tkvd` double DEFAULT NULL,
  `htvd` double DEFAULT NULL,
  `ktsp` double DEFAULT NULL,
  `tong` double DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  `bao_ve` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Danh_gia` text NOT NULL,
  `dieu_chinh` text DEFAULT NULL,
  `uu` text DEFAULT NULL,
  `nhuoc` text DEFAULT NULL,
  `cau_hoi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GiangVien`
--

CREATE TABLE `GiangVien` (
  `MaGV` varchar(20) NOT NULL,
  `Ho_va_Ten` varchar(120) NOT NULL,
  `HocVi` varchar(100) DEFAULT NULL,
  `NoiCongTac` varchar(255) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `sdt` varchar(191) DEFAULT NULL,
  `So_luong_sinh_vien` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `GiangVien`
--

INSERT INTO `GiangVien` (`MaGV`, `Ho_va_Ten`, `HocVi`, `NoiCongTac`, `email`, `sdt`, `So_luong_sinh_vien`, `created_at`, `updated_at`, `user_id`) VALUES
('GV195', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH Bình Dương', 'thinh.nguyentranphuc@stu.edu.vn', NULL, 7, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 3),
('GV2F8', 'NGUYỄN THƯỜNG KIỆT', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'kiet.nguyenthuong@stu.edu.vn', NULL, 10, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 4),
('GV305', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH CNSG', 'dung.lethimy@stu.edu.vn', NULL, 3, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 5),
('GV31F', 'TRỊNH THANH DUY', 'Thạc sĩ', 'ĐH CNSG', 'duy.trinhthanh@stu.edu.vn', NULL, 10, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 6),
('GV33B', 'HUỲNH QUANG ĐỨC', 'Thạc sĩ', 'ĐH Bình Dương', 'duc.huynhquang@stu.edu.vn', NULL, 10, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 7),
('GV3CF', 'ĐOÀN TRÌNH DỤC', 'Thạc sĩ', 'ĐH CNSG', 'duc.doantrinh@stu.edu.vn', NULL, 11, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 8),
('GV3D9', 'NGUYỄN TRỌNG NGHĨA', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'nghia.nguyentrong@stu.edu.vn', NULL, 7, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 9),
('GV510', 'TRẦN VĂN HÙNG', 'Thạc sĩ', 'ĐH CNSG', 'hung.tranvan@stu.edu.vn', NULL, 10, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 10),
('GV5B2', 'VÕ XUÂN THỊNH', 'Thạc sĩ', 'ĐH Bình Dương', 'thinh.voxuan@stu.edu.vn', NULL, 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 11),
('GV60B', 'NGUYỄN THỊ NGÂN HÀ', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'ha.nguyenthingan@stu.edu.vn', NULL, 6, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 12),
('GV6B4', 'NGUYỄN MINH SANG', 'Thạc sĩ', 'ĐH CNSG', 'sang.nguyenminh@stu.edu.vn', NULL, 6, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 13),
('GV74E', 'HOÀNG KHUÊ', 'Thạc sĩ', 'ĐH CNSG', 'khue.hoang@stu.edu.vn', NULL, 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 14),
('GV75D', 'KHUẤT BÁ DUY LÂM', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'lam.khuatbaduy@stu.edu.vn', NULL, 9, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 15),
('GV774', 'MAI VÂN PHƯƠNG VŨ', 'Thạc sĩ', 'ĐH Sư phạm', 'vu.maivanphuong@stu.edu.vn', NULL, 8, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 16),
('GV7BC', 'NGUYỄN HỒNG BỬU LONG', 'Thạc sĩ', 'ĐH CNSG', 'long.nguyenhongbuu@stu.edu.vn', NULL, 10, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 17),
('GV7E2', 'NGUYỄN THANH TÙNG', 'Thạc sĩ', 'ĐH CNSG', 'tung.nguyenthanh@stu.edu.vn', NULL, 9, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 18),
('GV819', 'HỒ ĐÌNH KHẢ', 'Thạc sĩ', 'ĐH CNSG', 'kha.hodinh@stu.edu.vn', NULL, 9, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 19),
('GV82C', 'TRẦN VŨ HOÀNG ƯNG', 'Thạc sĩ', ' Cty Codix', 'ung.tranvuhoang@stu.edu.vn', NULL, 8, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 20),
('GV851', 'LƯƠNG AN VINH', 'Thạc sĩ', 'ĐH CNSG', 'vinh.luongan@stu.edu.vn', NULL, 8, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 21),
('GV87E', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'ĐH CNSG', 'y.tranthinhu@stu.edu.vn', NULL, 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 22),
('GV8F6', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'ĐH CNSG', 'bach.ngoxuan@stu.edu.vn', NULL, 9, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 23),
('GV906', 'NGUYỄN LẠC AN THƯ', 'Thạc sĩ', 'ĐH CNSG', 'thu.nguyenlacan@stu.edu.vn', NULL, 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 24),
('GVA27', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'bang.buinhat@stu.edu.vn', NULL, 9, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 25),
('GVA83', 'HÀ ANH VŨ', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'vu.haanh@stu.edu.vn', NULL, 10, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 26),
('GVAA8', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', 'ĐH CNSG', 'van.tranthihong@stu.edu.vn', NULL, 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 27),
('GVAD6', 'TRẦN QUỐC TRƯỜNG', 'Thạc sĩ', 'ĐH CNSG', 'truong.tranquoc@stu.edu.vn', NULL, 9, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 28),
('GVE12', 'LÊ TRIỆU NGỌC ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'duc.letrieungoc@stu.edu.vn', NULL, 7, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 29),
('GVE1B', 'NGUYỄN NGỌC LÂM', 'Thạc sĩ', 'ĐH FPT', 'lam.nguyenngoc@stu.edu.vn', NULL, 8, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 30),
('GVE87', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', 'ĐH CNSG', 'an.nguyentruong@stu.edu.vn', NULL, 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 31),
('GVF0D', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH CNSG', 'deo.duongvan@stu.edu.vn', NULL, 9, '2025-12-25 23:41:38', '2025-12-25 23:41:38', 32);

-- --------------------------------------------------------

--
-- Table structure for table `hoi_dong`
--

CREATE TABLE `hoi_dong` (
  `MaHD` varchar(20) NOT NULL,
  `ngay_bat_dau` datetime NOT NULL,
  `ngay_ket_thuc` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hoi_dong`
--

INSERT INTO `hoi_dong` (`MaHD`, `ngay_bat_dau`, `ngay_ket_thuc`, `created_at`, `updated_at`) VALUES
('HD20251226062157aD', '2025-12-22 06:21:00', '2026-01-01 06:21:00', '2025-12-25 23:21:57', '2025-12-25 23:21:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_10_09_053402_create_sessions_table', 1),
(2, '2025_10_09_054302_create_users_table', 1),
(3, '2025_10_10_141252_create_cache_table', 1),
(4, '2025_10_12_072800_create_teachers_table', 1),
(5, '2025_10_12_072850_create_de_tai_table', 1),
(6, '2025_10_12_072909_create_students_table', 1),
(7, '2025_10_12_072933_create_assistants_table', 1),
(8, '2025_11_09_131804_create_temp_import_table', 1),
(9, '2025_12_01_033924_create_time_allocations_table', 1),
(10, '2025_12_13_234533_add_hocvi_to_giangvien_table', 1),
(11, '2025_12_14_000020_add_extra_fields_to_temp_import_table', 1),
(12, '2025_12_14_075101_create_diem_huong_dan_and_diem_phan_bien_tables', 1),
(13, '2025_12_23_052356_add_danh_gia_columns_to_de_tai_table', 1),
(14, '2025_12_23_083319_add_text_fields_to_diem_tables', 1),
(15, '2025_12_23_091445_add_bao_ve_to_diem_tables', 1),
(16, '2025_12_23_101323_add_ghi_chu_to_diem_tables', 1),
(17, '2025_12_24_063156_add__g_v_p_b_temp_table', 1),
(18, '2025_12_24_091556_create_hoi_dong_table', 1),
(19, '2025_12_24_091602_create_chi_tiet_hoi_dong_table', 1),
(20, '2025_12_24_102320_add_mahd_to_detai_table', 1),
(21, '2025_12_26_054136_remove_soluong_from_detai_table', 1),
(22, '2025_12_26_055320_make_user_id_nullable_in_giangvien', 2),
(23, '2025_12_26_055539_add_magvpb_to_detai_table', 3),
(24, '2025_12_26_055742_add_mota_to_detai_table', 4),
(25, '2025_12_26_055909_change_trangthai_type_in_detai_table', 5),
(26, '2025_12_26_060050_add_diem_to_sinhvien_table', 6),
(27, '2025_12_26_060207_add_ghichu_to_sinhvien_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('yiVMMudAsEDZRaHZF7f9cHz3Kcle8cv9B4m8bOrD', 33, '112.197.73.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMHpjdmJDYnN5anpmUXNlS056UUZYSFVXV25PTmtDRDM3d1lZQW1kNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MzM7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vYnVpbWFpdHJhbWFuaC5pZC52bi9ldmFsdWF0aW9uNTAtZXhwb3J0Ijt9fQ==', 1767680211);

-- --------------------------------------------------------

--
-- Table structure for table `SinhVien`
--

CREATE TABLE `SinhVien` (
  `MSSV` varchar(20) NOT NULL,
  `Ho_va_Ten` varchar(120) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `sdt` varchar(191) DEFAULT NULL,
  `Lop` varchar(191) DEFAULT NULL,
  `Nhom` varchar(191) DEFAULT NULL,
  `MaDT` varchar(50) DEFAULT NULL,
  `Diem` tinyint(3) UNSIGNED DEFAULT NULL,
  `GhiChu` text DEFAULT NULL,
  `HuongDeTai` varchar(191) DEFAULT NULL,
  `Giang_vien_huong_dan` varchar(20) DEFAULT NULL,
  `Da_phan_cong` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SinhVien`
--

INSERT INTO `SinhVien` (`MSSV`, `Ho_va_Ten`, `email`, `sdt`, `Lop`, `Nhom`, `MaDT`, `Diem`, `GhiChu`, `HuongDeTai`, `Giang_vien_huong_dan`, `Da_phan_cong`, `created_at`, `updated_at`, `user_id`) VALUES
('DH51801379', 'Ngô Minh Đạt', 'DH51801379@student.stu.edu.vn', '0792170819', 'D18_TH01', '72', 'DT6EA0', 30, NULL, 'Ứng dụng .Net', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51900751', 'Ngô Tuấn Thành', 'DH51900751@student.stu.edu.vn', '0777843892', 'D19_TH06', NULL, 'DT3787', 50, NULL, NULL, 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51901190', 'Trần Quốc Đạt', 'dh51901190@student.stu.edu.vn', '#N/A', 'D20_TH01', '135', 'DT4B44', 50, NULL, 'Ứng dụng .Net', 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51901588', 'Trần Thanh Duy', 'dh51901588@student.stu.edu.vn', '#N/A', 'D19_TH05', '72', 'DT6EA0', 35, NULL, 'Ứng dụng .Net', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51902347', 'Trần Xuân Trí', 'dh51902347@student.stu.edu.vn', NULL, 'D19_TH08', NULL, 'DT324A', 45, 'Bài làm chưa dạt, nhưng sinh viên hứa cố gắng trong thời gian còn lại và vẫn muốn tiếp tục thực hiện ', NULL, 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51902585', 'Trần Đình Hiền', 'dh51902585@student.stu.edu.vn', '#N/A', 'D19_TH07', '87', 'DT9952', 50, NULL, 'Ứng dụng trên Web', 'GV774', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51903427', 'Lương Ngọc Hải Đăng', 'dh51903427@student.stu.edu.vn', '#N/A', 'D19_TH04', '120', 'DT2235', 30, NULL, 'Ứng dụng trên Web', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51903563', 'Hình Tân Hiệp', 'dh51903563@student.stu.edu.vn', '#N/A', 'D19-TH05', '39', 'DT9D1E', 30, NULL, 'Ứng dụng trên Web', 'GVE1B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51904163', 'Nguyễn Hoàng Yến Nhi', 'dh51904163@student.stu.edu.vn', '#N/A', 'D19_TH04', '133', 'DTA227', 50, NULL, 'Ứng dụng trên Web', 'GV851', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51904209', 'Nguyễn Thị Hồng Oanh', 'dh51904209@student.stu.edu.vn', '#N/A', 'D19_TH04', '115', 'DT7972', 30, NULL, 'Ứng dụng trên Web', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51904519', 'Ngô Định Thế', 'dh51904519@student.stu.edu.vn', '#N/A', 'D19_TH05', '77', 'DT1ECA', 45, NULL, 'Ứng dụng trên Web', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51904876', 'Trần Đông Vi', 'dh51904876@student.stu.edu.vn', '#N/A', 'D19_TH02', '84', 'DT5B51', 40, NULL, 'Ứng dụng trên Mobile', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51905046', 'Kha Trí Hùng', 'DH51905046@student.stu.edu.vn', '0356065109', 'D19_TH05', NULL, 'DT4874', 50, 'Sinh viên dùng bài làm sẵn (do GV trường khác hướng dẫn) để nộp, GVHD đã cảnh báo từ đầu, yêu cầu thực hiện ljai nhưng sinh viên không thực hiện.', NULL, 'GVE12', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH51905502', 'Châu Bảo Nhân Trung', 'dh51905502@student.stu.edu.vn', '#N/A', 'D19-TH09', '136', 'DTD24D', 50, NULL, 'Ứng dụng trên Web', 'GV851', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52000037', 'Đỗ Hoàng Dũng', 'DH52000037@student.stu.edu.vn', '0789140801', 'D20_TH01', NULL, 'DT248B', 40, NULL, NULL, 'GV195', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52000682', 'Lê Tuấn', 'DH52000682@student.stu.edu.vn', '0777789336', 'D20_TH03', '61', 'DTEEB2', 40, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001024', 'Nguyễn Duy Sơn', 'DH52001024@student.stu.edu.vn', '0783887570', 'D20_TH02', '169', 'DT3F85', 50, NULL, '*', 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001243', 'Lưu Văn Hiếu', 'DH52001243@student.stu.edu.vn', '0977833079', 'D20_TH05', '88', 'DT9ED1', 50, NULL, 'Ứng dụng trên Web', 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001281', 'Phạm Tôn Thuận', 'dh52001281@student.stu.edu.vn', '#N/A', 'D20-TH04', '17', 'DT4890', 30, NULL, 'Ứng dụng trên Web', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001330', 'Phạm Ngọc Đông', 'DH52001330@student.stu.edu.vn', '0366468307', 'D20_TH03', '61', 'DTEEB2', NULL, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001367', 'Lâm Chí Minh', 'DH52001367@student.stu.edu.vn', '0924405798', 'D20_TH01', '135', 'DT4B44', 50, NULL, 'Ứng dụng .Net', 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001630', 'Nguyễn Ngọc Thiện', 'dh52001630@student.stu.edu.vn', NULL, 'D20_TH02', NULL, NULL, 0, NULL, NULL, NULL, 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001688', 'Phạm Nhựt Linh', 'DH52001688@student.stu.edu.vn', '0794985963', 'D20_TH02', '51', 'DTC59F', 30, NULL, 'Ứng dụng trên Web', 'GV6B4', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001900', 'Nguyễn Minh Triều', 'DH52001900@student.stu.edu.vn', '0899052420', 'D20_TH01', '150', 'DT6D74', 50, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52001904', 'Nguyễn Hữu Trường', 'DH52001904@student.stu.edu.vn', '0855021202', 'D20_TH01', '111', 'DT7E1F', 50, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52002187', 'Lê Văn Nam', 'dh52002187@student.stu.edu.vn', '#N/A', 'D20_TH03', '90', 'DT1E2D', 40, NULL, 'Ứng dụng trên Web', 'GV82C', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52002202', 'Nguyễn Tuấn Vũ', 'dh52002202@student.stu.edu.vn', '#N/A', 'D20_TH02', '94', 'DT1940', 50, NULL, 'Ứng dụng trên Web', 'GV60B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52002302', 'Cao Hoàng Nam', 'DH52002302@student.stu.edu.vn', '0909393047', 'D20_TH01', '28', 'DTF302', 40, NULL, 'Ứng dụng trên Web', 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52002303', 'Lê Chí Cường', 'DH52002303@student.stu.edu.vn', '0904446653', 'D20_TH01', '28', 'DTF302', 40, NULL, 'Ứng dụng trên Web', 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52002358', 'Vương Tiến Hùng', 'DH52002358@student.stu.edu.vn', '0968189572', 'D20_TH05', '89', 'DT7EEA', 50, NULL, 'Ứng dụng trên Web', 'GV82C', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52002723', 'Phạm Ngọc Khoa', 'DH52002723@student.stu.edu.vn', '0528051699', 'D20_TH04', '4', 'DT5D8D', 30, NULL, 'Ứng dụng trên Web', 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52003145', 'Huỳnh Trần Anh Quốc', 'dh52003145@student.stu.edu.vn', '#N/A', 'D20_TH01', '137', 'DTA54A', 45, 'Bài làm chưa dạt, nhưng sinh viên hứa cố gắng trong thời gian còn lại và vẫn muốn tiếp tục thực hiện ', 'Ứng dụng trên Web', 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52003489', 'Nguyễn Thanh Hải', 'dh52003489@student.stu.edu.vn', '#N/A', 'D20_TH03', '94', 'DT1940', 50, NULL, 'Ứng dụng trên Web', 'GV60B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52003543', 'Nguyễn Công Chi', 'DH52003543@student.stu.edu.vn', '0523261143', 'D20_TH05', '97', 'DT8049', 50, NULL, 'Ứng dụng trên Web', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52003592', 'Nguyễn Khải Minh', 'dh52003592@student.stu.edu.vn', '#N/A', 'D20-TH02', '127', 'DTBC51', 30, NULL, 'Ứng dụng trên Web', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52003835', 'Trần Đình Khoa', 'DH52003835@student.stu.edu.vn', '0707035451', 'D20_TH05', '108', 'DT1ED8', 30, NULL, 'Ứng dụng trên Web', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52003862', 'Trần Hữu Quang', 'DH52003862@student.stu.edu.vn', '0919402052', 'D20_TH05', '88', 'DT9ED1', 50, NULL, 'Ứng dụng trên Web', 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52003935', 'Phạm Châu Phú', 'DH52003935@student.stu.edu.vn', '0337847385', 'D20_TH04', '5', 'DT2A8A', 40, NULL, 'Ứng dụng trên Web', 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52003995', 'Huỳnh Thanh Phúc', 'DH52003995@student.stu.edu.vn', '0348095507', 'D20_TH04', '16', 'DT3F97', 30, NULL, 'Ứng dụng trên Web', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52004272', 'Lưu Thị Thanh Thảo', 'DH52004272@student.stu.edu.vn', '0329824880', 'D20_TH06', '31', 'DT93C5', 40, NULL, 'Ứng dụng trên Web', 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005049', 'Đặng Ngọc Giàu', 'DH52005049@student.stu.edu.vn', '0834376555', 'D20-TH09', '80', 'DT7369', 30, NULL, 'Ứng dụng trên Web', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005068', 'Nguyễn Thanh Danh', 'DH52005068@student.stu.edu.vn', '0798621883', 'D20_TH09', '82', 'DTE938', 50, NULL, 'Ứng dụng trên Web', 'GV82C', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005677', 'Võ Chu Quốc Anh', 'dh52005677@student.stu.edu.vn', '#N/A', 'D20_TH09', '129', 'DT5BE9', 50, NULL, 'Ứng dụng trên Mobile', 'GV774', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005699', 'Nguyễn Hùng Cường', 'DH52005699@student.stu.edu.vn', '0932464672', 'D20_TH10', '167', 'DTD83D', 50, NULL, '*', 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005731', 'Trần Lê Minh Duy', 'DH52005731@student.stu.edu.vn', '0838567807', 'D20_TH09', '15', 'DTA69E', 50, NULL, 'Ứng dụng trên Web', 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005747', 'Đào Thành Đạt', 'DH52005747@student.stu.edu.vn', '0522939018', 'D20_TH06', '148', 'DT7AB4', 45, NULL, 'Ứng dụng trên Web', 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005770', 'Trịnh Anh Đức', 'DH52005770@student.stu.edu.vn', '0582449063', 'D20_TH11', '162', 'DTA857', 50, NULL, '*', 'GV851', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005851', 'Nguyễn Tấn Huy', 'DH52005851@student.stu.edu.vn', '0919202108', 'D20_TH08', '172', 'DTB14C', 30, NULL, '*', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005870', 'Vũ Trung Kiên', 'DH52005870@student.stu.edu.vn', '0779182032', 'D20_TH08', '6', 'DTB383', 40, 'Sv không code được, ko chỉ ra được đoạn code để load dữ liệu lên form.', 'Ứng dụng trên Web', 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005891', 'Phạm Nguyễn Hoàng Khang', 'DH52005891@student.stu.edu.vn', '0833485997', 'D20_TH07', '117', 'DT977C', 50, NULL, 'Ứng dụng trên Web', 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52005912', 'Huỳnh Tấn Thiên Khôi', 'DH52005912@student.stu.edu.vn', '0917567680', 'D20_TH07', NULL, 'DTC7B1', 50, NULL, NULL, 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52006159', 'Võ Đức Thanh', 'dh52006159@student.stu.edu.vn', NULL, 'D20_TH09', NULL, 'DTA10B', 50, NULL, NULL, 'GV851', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52006188', 'Lê Nguyễn Trường Thịnh', 'DH52006188@student.stu.edu.vn', '0774077020', 'D20_TH10', NULL, 'DT5A34', 50, NULL, NULL, 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52006237', 'Nguyễn Trần Vân Uyển', 'DH52006237@student.stu.edu.vn', '0963476850', 'D20_TH09', '114', 'DTE751', 35, NULL, 'Ứng dụng trên Web', 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52006575', 'Lâm Tuấn Khoa', 'DH52006575@student.stu.edu.vn', '0355002372', 'D20_TH09', '114', 'DTE751', 30, NULL, 'Ứng dụng trên Web', 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52006618', 'Trần Minh Trung', 'DH52006618@student.stu.edu.vn', '0902480705', 'D20_TH11', NULL, 'DTA2C1', 50, NULL, NULL, 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52007089', 'Huỳnh Minh Khoa', 'DH52007089@student.stu.edu.vn', '0898175595', 'D20_TH11', '173', 'DTC64B', 50, 'Gia đình có hoàn cảnh khó khăn.', '*', 'GVE12', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52007161', 'Phạm Duy Thắng', 'DH52007161@student.stu.edu.vn', '0335444058', 'D20-TH11', '121', 'DT5532', 50, 'Sử dụng AI trong quá trình nghiên cứu và hiện thực ứng dụng nhưng không hiểu.', 'Ứng dụng trên Web', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52007186', 'Trần Như Nguyện', 'DH52007186@student.stu.edu.vn', '0388065951', 'D20_TH10', '31', 'DT93C5', 40, NULL, 'Ứng dụng trên Web', 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52100514', 'Trần Quốc Nam', 'DH52100514@student.stu.edu.vn', '0778663123', 'D21_TH04', '62', 'DT77BB', 30, NULL, 'Ứng dụng .Net', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52100776', 'Vũ Trung Nguyên', 'DH52100776@student.stu.edu.vn', '0931329585', 'D21_TH09', '58', 'DTBC43', 50, NULL, 'Ứng dụng trên Web', 'GVE12', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52100937', 'Nguyễn Xuân Long', 'DH52100937@student.stu.edu.vn', '0396285403', 'D21_TH02', '131', 'DT4C29', 60, NULL, 'Ứng dụng trên Web', 'GV774', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52101228', 'Nguyễn Thanh Hậu', 'dh52101228@student.stu.edu.vn', '#N/A', 'D21_TH07', '73', 'DT19A7', 20, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52101402', 'Nguyễn Văn Hoàng Long', 'DH52101402@student.stu.edu.vn', '0828599379', 'D21_TH02', '131', 'DT4C29', 60, NULL, 'Ứng dụng trên Web', 'GV774', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52101465', 'Quách Thái Hùng', 'DH52101465@student.stu.edu.vn', '0947252595', 'D21_TH02', '144', 'DT7302', 30, NULL, 'Ứng dụng trên Web', 'GV3D9', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52101856', 'Nguyễn Duy Bản', 'DH52101856@student.stu.edu.vn', '0342271703', 'D21_TH03', '113', 'DT9011', 50, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52101979', 'Phạm Thị Ánh Hồng', 'DH52101979@student.stu.edu.vn', '0976747106', 'D21_TH02', '145', 'DT405D', 40, NULL, 'Ứng dụng trên Web', 'GV3D9', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52103137', 'Phan Tuấn Dũng', 'DH52103137@student.stu.edu.vn', '0357716720', 'D21_TH01', '175', 'DT2F28', 50, NULL, '*', 'GV60B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52103511', 'Phạm Hữu Chí', 'DH52103511@student.stu.edu.vn', '0385920397', 'D21_TH01', '70', 'DT80AE', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52103682', 'Bùi Minh Phúc', 'DH52103682@student.stu.edu.vn', '0359128746', 'D21_TH01', '160', 'DT4659', 0, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52103727', 'Đào Duy Hoàng Vương', 'DH52103727@student.stu.edu.vn', '0983621649', 'D21_TH03', '177', 'DTC126', NULL, NULL, '*', 'GV195', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52104108', 'Nguyễn Đăng Khoa', 'DH52104108@student.stu.edu.vn', '0938240431', 'D21_TH02', '157', 'DTF310', 50, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52104298', 'Lê Thị Ly Ly', 'DH52104298@student.stu.edu.vn', '0339519874', 'D21_TH08', '69', 'DTE069', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52104582', 'Ngô Duy Tùng', 'DH52104582@student.stu.edu.vn', '0946809362', 'D21_TH03', '113', 'DT9011', 50, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52104857', 'Lê Thị Đa Lin', 'DH52104857@student.stu.edu.vn', '0374423479', 'D21_TH04', '134', 'DT3C43', 40, NULL, 'Ứng dụng trên Web', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52104887', 'Nhữ Quốc Anh', 'DH52104887@student.stu.edu.vn', '0856143299', 'D21_TH05', '116', 'DTE07B', 40, NULL, 'Ứng dụng trên Web', 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52105093', 'Nguyễn Hoàng Huy', 'dh52105093@student.stu.edu.vn', '#N/A', 'D21_TH04', '126', 'DTCB56', 50, NULL, 'Ứng dụng trên Web', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52105312', 'Trần Hà Xuân Thịnh', 'DH52105312@student.stu.edu.vn', '0349573458', 'D21_TH02', '159', 'DT14A8', 0, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52105342', 'Trần Nguyễn Minh Quân', 'DH52105342@student.stu.edu.vn', '0388073445', 'D21_TH05', '105', 'DT6069', 60, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52105346', 'Lê Nguyễn Thành Vũ', 'DH52105346@student.stu.edu.vn', '0763163435', 'D21_TH02', '19', 'DTAF28', 35, NULL, 'Ứng dụng .Net', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52105659', 'Bạch Đức Phước', 'DH52105659@student.stu.edu.vn', '0866088087', 'D21_TH03', '176', 'DTB621', 40, NULL, '*', 'GV195', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52105864', 'Mô Ham Mách A Ra Pát', 'DH52105864@student.stu.edu.vn', '0971050307', 'D21_TH02', NULL, 'DT1C21', 40, NULL, NULL, 'GV195', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106130', 'Bùi Phi Hùng', 'DH52106130@student.stu.edu.vn', '0394126389', 'D21_TH01', '98', 'DT10F6', 40, NULL, 'Ứng dụng trên Mobile', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106176', 'Nguyễn Minh Huy', 'DH52106176@student.stu.edu.vn', '0933881276', 'D21_TH07', '180', 'DTD8DA', 50, NULL, '*', 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106187', 'Tạ Tương Hiếu', 'dh52106187@student.stu.edu.vn', '#N/A', 'D21_TH04', '126', 'DTCB56', 50, NULL, 'Ứng dụng trên Web', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106292', 'Phan Duy Tuấn', 'DH52106292@student.stu.edu.vn', '0327261528', 'D21_TH04', '103', 'DT890A', 60, NULL, 'Ứng dụng .Net', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106608', 'Đỗ Quang Vinh', 'DH52106608@student.stu.edu.vn', '0708738019', 'D21_TH03', '86', 'DTEE55', 50, NULL, 'Ứng dụng trên Web', 'GV82C', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106740', 'Trần Hoàng Long', 'dh52106740@student.stu.edu.vn', '#N/A', 'D21_TH03', '92', 'DTF023', 30, NULL, 'Ứng dụng trên Mobile', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106804', 'Nguyễn Trường Giang', 'dh52106804@student.stu.edu.vn', '#N/A', 'D21_TH04', '110', 'DT918D', 40, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106859', 'Phạm Phúc Khả', 'DH52106859@student.stu.edu.vn', '0924993500', 'D21_TH01', NULL, 'DTBD73', 50, NULL, NULL, 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52106873', 'Nguyễn Hoàng Quan', 'dh52106873@student.stu.edu.vn', '#N/A', 'D21_TH04', '9', 'DT233C', 60, NULL, 'Ứng dụng trên Web', 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52107203', 'Nguyễn Ngọc Thiện', 'DH52107203@student.stu.edu.vn', '0962419209', 'D21_TH01', '160', 'DT4659', 40, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52107408', 'Trần Minh Tú', 'DH52107408@student.stu.edu.vn', '0772911890', 'D21_TH02', '144', 'DT7302', 30, NULL, 'Ứng dụng trên Web', 'GV3D9', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52107697', 'Đinh Nguyễn Tuấn', 'DH52107697@student.stu.edu.vn', '0976588770', 'D21_TH03', '85', 'DT775C', 50, NULL, 'Ứng dụng trên Mobile', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52107801', 'Nguyễn Thanh Vân', 'DH52107801@student.stu.edu.vn', '0349442507', 'D21_TH05', '105', 'DT6069', 50, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52107926', 'Nguyễn Văn Huy', 'dh52107926@student.stu.edu.vn', '#N/A', 'D21_TH05', '36', 'DTDA1E', 40, NULL, 'Ứng dụng trên Web', 'GVE1B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52108018', 'Nguyễn Quốc Thắng', 'DH52108018@student.stu.edu.vn', '0765688708', 'D21_TH05', '143', 'DTED66', 40, NULL, 'Ứng dụng trên Web', 'GV195', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52108380', 'Đoàn Thị Yến Bình', 'DH52108380@student.stu.edu.vn', '0824108001', 'D21_TH06', '27', 'DT63BD', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-26 01:45:36', NULL),
('DH52108402', 'Nguyễn Trung Hiếu', 'DH52108402@student.stu.edu.vn', '0326780829', 'D21_TH05', '123', 'DTBB3C', 50, NULL, 'Ứng dụng trên Web', 'GV774', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52108453', 'Đinh Phạm Phú Khang', 'DH52108453@student.stu.edu.vn', '0778715658', 'D21_TH05', '130', 'DT3B2E', 45, NULL, 'Ứng dụng trên Web', 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52108517', 'Hoàng Hữu Lê Chinh', 'DH52108517@student.stu.edu.vn', '0898671245', 'D21_TH05', '99', 'DT67F1', 35, NULL, 'Ứng dụng trên Web', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52108656', 'Võ Minh Thuận', 'DH52108656@student.stu.edu.vn', '0936452676', 'D21_TH06', '78', 'DT8E75', 40, NULL, 'Ứng dụng trên Web', 'GV82C', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52108711', 'Đặng Gia Bảo', 'dh52108711@student.stu.edu.vn', '#N/A', 'D21_TH06', '96', 'DTF74E', 50, NULL, 'Ứng dụng trên Web', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52108862', 'Hà Trần Hoàng Anh', 'dh52108862@student.stu.edu.vn', '#N/A', 'D21_TH06', '96', 'DTF74E', 50, NULL, 'Ứng dụng trên Web', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52109172', 'Nguyễn Thành Sang', 'dh52109172@student.stu.edu.vn', '#N/A', 'D21_TH07', '73', 'DT19A7', NULL, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52109230', 'Trần Phạm Thanh Phong', 'dh52109230@student.stu.edu.vn', '#N/A', 'D21_TH07', '74', 'DT87C3', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110534', 'Nguyễn Mậu An', 'DH52110534@student.stu.edu.vn', '0343513046', 'D21_TH08', '93', 'DT8724', 60, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110553', 'Mai Trần Duy Anh', 'DH52110553@student.stu.edu.vn', '0947657637', 'D21_TH13', '40', 'DTAB83', 50, NULL, 'Ứng dụng trên Web', 'GVE1B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110561', 'Nguyễn Lan Anh', 'DH52110561@student.stu.edu.vn', '0329186138', 'D21_TH11', '14', 'DTD199', 50, NULL, 'Ứng dụng trên Mobile', 'GV851', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110568', 'Phạm Minh Anh', 'DH52110568@student.stu.edu.vn', '0395168006', 'D21_TH05', '53', 'DT2B91', 45, NULL, 'Ứng dụng Java', 'GV6B4', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110581', 'Nguyễn Ngọc Ân', 'DH52110581@student.stu.edu.vn', '0921266924', 'D21_TH13', '10', 'DTD6F4', 45, NULL, 'Ứng dụng trên Web', 'GV6B4', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110593', 'Lê Tôn Bảo', 'DH52110593@student.stu.edu.vn', '0949965772', 'D21_TH13', '40', 'DTAB83', 50, NULL, 'Ứng dụng trên Web', 'GVE1B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110640', 'Hà Thị Mỹ Châu', 'DH52110640@student.stu.edu.vn', '0394949891', 'D21_TH05', '178', 'DT5199', 40, NULL, '*', 'GV195', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110659', 'Ngô Đức Trần Cường', 'dh52110659@student.stu.edu.vn', '#N/A', 'D21_TH11', '154', 'DT6A19', 50, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110660', 'Nguyễn Chí Cường', 'DH52110660@student.stu.edu.vn', '0901315352', 'D21_TH05', NULL, 'DT1EE3', 50, NULL, NULL, 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110677', 'Nguyễn Ngọc Doanh', 'DH52110677@student.stu.edu.vn', '0902904122', 'D21_TH09', '164', 'DT4134', 35, NULL, '*', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110693', 'Đỗ Ngọc Anh Duy', 'DH52110693@student.stu.edu.vn', '0865006929', 'D21_TH13', '12', 'DT38FA', 50, NULL, 'Ứng dụng trên Web', 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110733', 'Nguyễn Sơn Dương', 'DH52110733@student.stu.edu.vn', '0826464186', 'D21_TH11', '107', 'DT8E67', 60, NULL, 'Ứng dụng trên Mobile', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110742', 'Nguyễn Quốc Đại', 'DH52110742@student.stu.edu.vn', '0898366249', 'D21_TH14', '138', 'DT35F5', 50, NULL, 'Ứng dụng trên Web', 'GV75D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110780', 'Nguyễn Tấn Đạt', 'dh52110780@student.stu.edu.vn', '#N/A', 'D21_TH08', '69', 'DTE069', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110786', 'Tăng Cẩm Đạt', 'dh52110786@student.stu.edu.vn', '#N/A', 'D21_TH08', '112', 'DTE716', 30, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110793', 'Trịnh Phát Đạt', 'DH52110793@student.stu.edu.vn', '0977336644', 'D21_TH08', '41', 'DTDC84', 50, NULL, 'Ứng dụng trên Web', 'GVE1B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110800', 'Nguyễn Võ Hoàng Hải Đăng', 'DH52110800@student.stu.edu.vn', '02837713095', 'D21_TH14', '66', 'DT70D6', 35, NULL, 'Ứng dụng .Net', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110802', 'Trần Ngọc Điền', 'DH52110802@student.stu.edu.vn', '0924640701', 'D21_TH14', '13', 'DT4FFD', 40, NULL, 'Ứng dụng trên Web', 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110812', 'Trương Thanh Đông', 'DH52110812@student.stu.edu.vn', '0706766557', 'D21_TH11', '125', 'DT525F', 50, NULL, 'Ứng dụng trên Mobile', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110836', 'Nguyễn Hồng Gấm', 'DH52110836@student.stu.edu.vn', '0775160497', 'D21_TH06', '152', 'DT837A', 60, NULL, 'Ứng dụng trên Web', 'GVAD6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110857', 'Nguyễn Đăng Hải', 'DH52110857@student.stu.edu.vn', '0909523075', 'D21_TH08', '50', 'DTB298', 40, NULL, 'Ứng dụng trên Mobile', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110924', 'Trần Nguyễn Minh Hiếu', 'DH52110924@student.stu.edu.vn', '0936049080', 'D21_TH13', '149', 'DTDB39', 50, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110935', 'Nguyễn Đình Hòa', 'DH52110935@student.stu.edu.vn', '0888254294', 'D21_TH13', '42', 'DT458D', 45, NULL, 'Ứng dụng trên Web', 'GVE1B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52110995', 'Đỗ Quang Huy', 'DH52110995@student.stu.edu.vn', '0395553134', 'D21_TH09', '170', 'DT5F42', 30, NULL, '*', 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111030', 'Nguyễn Quốc Huy', 'DH52111030@student.stu.edu.vn', '0933705051', 'D21_TH09', '141', 'DT3681', 40, NULL, 'Ứng dụng trên Web', 'GV195', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111055', 'Trần Đức Huynh', 'DH52111055@student.stu.edu.vn', '0866714807', 'D21_TH10', '47', 'DT35E7', 40, NULL, 'Ứng dụng trên Web', 'GV6B4', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111063', 'Nguyễn Mạnh Hưng', 'DH52111063@student.stu.edu.vn', '0328707978', 'D21_TH11', '21', 'DT8ADE', 50, NULL, 'Ứng dụng trên Mobile', 'GV851', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111067', 'Trần Minh Hưng', 'DH52111067@student.stu.edu.vn', '0932078352', 'D21_TH11', '30', 'DTE4C2', 50, NULL, 'Ứng dụng trên Mobile', 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111083', 'Trần Mai Huy Khải', 'DH52111083@student.stu.edu.vn', '0582079957', 'D21_TH09', '170', 'DT5F42', 30, NULL, '*', 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111085', 'Trương Minh Khải', 'DH52111085@student.stu.edu.vn', '0835359010', 'D21_TH08', '49', 'DTD25F', 0, NULL, 'Ứng dụng trên Web', 'GV305', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111086', 'Dương Trí Khang', 'DH52111086@student.stu.edu.vn', '0836169654', 'D21_TH08', '22', 'DT13D7', 50, NULL, 'Ứng dụng Java', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111115', 'Mai Lâm Quang Khánh', 'DH52111115@student.stu.edu.vn', '0707347324', 'D21_TH10', '65', 'DTE9DF', 40, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111171', 'Lâm Tuấn Kiệt', 'DH52111171@student.stu.edu.vn', '0941693505', 'D21_TH10', '2', 'DTB4EE', 50, NULL, 'Ứng dụng trên Web', 'GV305', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111174', 'Ngô Tuấn Kiệt', 'DH52111174@student.stu.edu.vn', '0849929007', 'D21_TH08', '181', 'DTAFDD', 50, NULL, '*', 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111204', 'Trương Văn Liêu', 'DH52111204@student.stu.edu.vn', '0393726628', 'D21_TH08', '122', 'DTCC3B', 50, NULL, 'Ứng dụng trên Web', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111212', 'Nguyễn Hoàng Linh', 'DH52111212@student.stu.edu.vn', '0941412077', 'D21_TH11', '25', 'DT8DB3', 30, NULL, 'Ứng dụng trên Mobile', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111224', 'Giang Nhật Long', 'DH52111224@student.stu.edu.vn', '0856639637', 'D21_TH13', '68', 'DT976E', NULL, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111240', 'Nguyễn Viết Long', 'dh52111240@student.stu.edu.vn', '#N/A', 'D21_TH08', '101', 'DT6704', 0, NULL, 'Ứng dụng trên Mobile', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111245', 'Võ Thành Long', 'DH52111245@student.stu.edu.vn', '0937369772', 'D21_TH10', '100', 'DT1003', 50, NULL, 'Ứng dụng trên Web', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111258', 'Trần Tấn Lộc', 'DH52111258@student.stu.edu.vn', '0332345957', 'D21_TH10', '81', 'DT7031', 50, NULL, 'Ứng dụng trên Web', 'GV82C', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111263', 'Nguyễn Hòa Lợi', 'dh52111263@student.stu.edu.vn', '#N/A', 'D21_TH14', '60', 'DT99B5', 40, NULL, 'Ứng dụng trên Web', 'GVE12', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111293', 'Ong Văn Mến', 'DH52111293@student.stu.edu.vn', '0933331843', 'D21_TH12', '46', 'DT42E0', 30, NULL, 'Ứng dụng trên Web', 'GV6B4', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111321', 'Trần Hoàng Minh', 'dh52111321@student.stu.edu.vn', '#N/A', 'D21_TH07', '54', 'DTB5F5', 40, 'Sinh viên đã đi làm nên ít thời gian, SV hứa sẽ  cố gắng tập trung hơn.', 'Ứng dụng trên Web', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111358', 'Đồng Văn Nghĩa', 'DH52111358@student.stu.edu.vn', '0382149204', 'D21_TH08', '182', 'DT36D4', 40, NULL, '*', 'GV774', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111401', 'Lê Quang Nhân', 'DH52111401@student.stu.edu.vn', '0393638193', 'D21_TH08', '33', 'DT7DCB', 50, NULL, 'Ứng dụng trên Web', 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111411', 'Trần Trọng Nhân', 'DH52111411@student.stu.edu.vn', '02723867856', 'D21_TH08', '34', 'DTE3AF', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111439', 'Huỳnh Tấn Nhớ', 'DH52111439@student.stu.edu.vn', '0977979791', 'D21_TH13', '67', 'DT7D12', 40, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111441', 'Nguyễn Thị Nhung', 'DH52111441@student.stu.edu.vn', '0359439628', 'D21_TH09', '35', 'DT94A8', 40, NULL, 'Ứng dụng trên Web', 'GV3D9', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111482', 'Võ Văn Phát', 'DH52111482@student.stu.edu.vn', '0937689655', 'D21_TH09', '58', 'DTBC43', 50, NULL, 'Ứng dụng trên Web', 'GVE12', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111486', 'Nguyễn Tấn Phi', 'DH52111486@student.stu.edu.vn', '0703760626', 'D21_TH09', '56', 'DT5BFB', 30, NULL, 'Ứng dụng trên Web', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111491', 'Nguyễn Chí Phong', 'DH52111491@student.stu.edu.vn', '0903073250', 'D21_TH10', '64', 'DT9ED8', 40, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111495', 'Phạm Hồng Phong', 'dh52111495@student.stu.edu.vn', '#N/A', 'D21_TH10', '79', 'DTF972', 50, NULL, 'Ứng dụng trên Web', 'GV82C', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('Dh52111509', 'Nguyễn Thành Tỷ  Phú', 'DH52111509@student.stu.edu.vn', '0767392039', 'D21_TH10', '37', 'DT7AA6', 30, NULL, 'Ứng dụng trên Web', 'GVE1B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111529', 'Lê Trần Trọng Phúc', 'DH52111529@student.stu.edu.vn', '0946129499', 'D21_TH10', '153', 'DTF47D', 50, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111531', 'Lưu Hoàng Phúc', 'DH52111531@student.stu.edu.vn', '0396895104', 'D21_TH13', '68', 'DT976E', 30, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111560', 'Võ Hoàng Phúc', 'DH52111560@student.stu.edu.vn', '0767764470', 'D21_TH08', '23', 'DT64D0', 50, NULL, 'Ứng dụng trên Mobile', 'GV851', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111579', 'Nguyễn Việt Phương', 'DH52111579@student.stu.edu.vn', '0978699529', 'D21_TH09', '56', 'DT5BFB', 30, NULL, 'Ứng dụng trên Web', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111612', 'Trần Nguyễn Hoàng Quân', 'DH52111612@student.stu.edu.vn', '0911341117', 'D21_TH10', '59', 'DTCB44', 50, NULL, 'Ứng dụng trên Web', 'GVE12', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111615', 'Võ Minh Quân', 'DH52111615@student.stu.edu.vn', '0854381067', 'D21_TH13', '158', 'DT63AF', 50, NULL, 'Ứng dụng .Net', 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111637', 'Nguyễn Đăng Quyền', 'DH52111637@student.stu.edu.vn', '0815804376', 'D21_TH10', '43', 'DT328A', 40, NULL, 'Ứng dụng trên Web', 'GVE1B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111681', 'Lê Anh Tài', 'DH52111681@student.stu.edu.vn', '0967788246', 'D21_TH10', '29', 'DT8405', 50, NULL, 'Ứng dụng trên Mobile', 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111682', 'Lê Nguyễn Trọng Tài', 'dh52111682@student.stu.edu.vn', '#N/A', 'D21_TH14', '104', 'DT176E', 45, 'Sinh viên đã đi làm nên ít thời gian, SV hứa sẽ  cố gắng tập trung hơn.', 'Ứng dụng trên Web', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111695', 'Nguyễn Văn Tài', 'DH52111695@student.stu.edu.vn', '0985141631', 'D21_TH13', '140', 'DT746F', NULL, NULL, 'Ứng dụng trên Web', 'GV60B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111700', 'Thái Tấn Tài', 'DH52111700@student.stu.edu.vn', '0353004163', 'D21_TH09', '7', 'DTC484', 45, NULL, 'Ứng dụng trên Web', 'GV3D9', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111704', 'Dương Văn Minh Tâm', 'dh52111704@student.stu.edu.vn', '#N/A', 'D21_TH12', '118', 'DT7C35', 20, NULL, 'Ứng dụng Java', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111720', 'Nguyễn Công Tấn', 'DH52111720@student.stu.edu.vn', NULL, 'D21_TH10', '44', 'DTACEE', 50, NULL, 'Ứng dụng Java', 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111756', 'Lê Minh Thảo', 'DH52111756@student.stu.edu.vn', '0522731750', 'D21_TH13', '109', 'DT69DF', 40, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111794', 'Nguyễn Chí Thiện', 'DH52111794@student.stu.edu.vn', '0979286060', 'D21_TH13', '44', 'DTACEE', 50, NULL, 'Ứng dụng Java', 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111823', 'Võ Thị Tho', 'DH52111823@student.stu.edu.vn', '0969747148', 'D21_TH10', '71', 'DTF7A9', 35, NULL, 'Ứng dụng .Net', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111833', 'Lê Nguyễn Minh Thông', 'DH52111833@student.stu.edu.vn', '0769630210', 'D21_TH08', '23', 'DT64D0', 50, NULL, 'Ứng dụng trên Mobile', 'GV851', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111843', 'Bùi Hữu Thuận', 'dh52111843@student.stu.edu.vn', '#N/A', 'D21_TH07', '54', 'DTB5F5', 30, 'Sinh viên đã đi làm nên ít thời gian, SV hứa sẽ  cố gắng tập trung hơn.', 'Ứng dụng Java', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111845', 'Lâm Gia Thuận', 'DH52111845@student.stu.edu.vn', '0931548545', 'D21-TH13', '91', 'DT692A', 50, NULL, 'Ứng dụng trên Web', 'GV82C', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111847', 'Lương Hiếu Thuận', 'DH52111847@student.stu.edu.vn', '0965629532', 'D21_TH08', '95', 'DT6E47', 40, NULL, 'Ứng dụng trên Web', 'GV7BC', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111863', 'Nguyễn Thị Minh Thư', 'DH52111863@student.stu.edu.vn', '097473170', 'D21_TH10', '7', 'DTC484', 40, NULL, 'Ứng dụng trên Web', 'GV3D9', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111881', 'Trần Thủy Tiên', 'DH52111881@student.stu.edu.vn', '0327458490', 'D21_TH08', '27', 'DT63BD', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111923', 'Đỗ Minh Trí', 'DH52111923@student.stu.edu.vn', '0704651788', 'D21_TH10', '55', 'DTC2F2', 40, NULL, 'Ứng dụng trên Web', 'GV6B4', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52111976', 'Nguyễn Minh Trường', 'DH52111976@student.stu.edu.vn', '0939024432', 'D21_TH13', '140', 'DT746F', 50, NULL, 'Ứng dụng trên Web', 'GV60B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112002', 'Lâm Đình Tuấn', 'DH52112002@student.stu.edu.vn', '0906673427', 'D21_TH14', '106', 'DTF960', 50, NULL, 'Ứng dụng trên Web', 'GV2F8', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112019', 'Nguyễn Ngọc Thanh Tuệ', 'DH52112019@student.stu.edu.vn', '0907355548', 'D21_TH08', '24', 'DTFAB4', 50, NULL, 'Ứng dụng trên Web', 'GV305', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112079', 'Nguyễn Đình Vinh', 'DH52112079@student.stu.edu.vn', '0383731640', 'D21_TH14', '168', 'DT4882', 40, NULL, '*', 'GV3D9', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112118', 'Trần Hoàng Vương', 'DH52112118@student.stu.edu.vn', '0987038840', 'D21_TH13', '76', 'DT69CD', 50, NULL, 'Ứng dụng trên Web', 'GV60B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112127', 'Lương Triều Vỹ', 'DH52112127@student.stu.edu.vn', NULL, 'D21_TH08', '63', 'DTBCE9', 40, NULL, 'Ứng dụng trên Web', 'GV31F', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112786', 'Đinh Quang Thịnh', 'DH52112786@student.stu.edu.vn', '0931487603', 'D21_TH10', '26', 'DT14BA', 50, NULL, 'Ứng dụng trên Mobile', 'GV819', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112805', 'Võ Trọng Nghĩa', 'DH52112805@student.stu.edu.vn', NULL, 'D21_TH12', '151', 'DT1A73', 60, NULL, 'Ứng dụng trên Mobile', 'GV774', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112809', 'Mai Hoàng An', 'DH52112809@student.stu.edu.vn', '0972285275', 'D21_TH12', '151', 'DT1A73', 60, NULL, 'Ứng dụng trên Mobile', 'GV774', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52112944', 'Lê Đoàn Anh Quân', 'DH52112944@student.stu.edu.vn', '0866603591', 'D21_TH11', '156', 'DT8417', 50, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113016', 'Huỳnh Quốc Duy', 'DH52113016@student.stu.edu.vn', '0362949286', 'D21_TH14', '75', 'DTF0C4', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113047', 'Phan Đức Thắng', 'DH52113047@student.stu.edu.vn', '0949985490', 'D21_TH14', '155', 'DT1D1E', 40, NULL, 'Ứng dụng trên Web', 'GV33B', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113134', 'Mai Quang Vinh', 'DH52113134@student.stu.edu.vn', '0523756478', 'D21_TH12', '83', 'DT9E3F', 50, NULL, 'Ứng dụng .Net', 'GVA83', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113150', 'Trần Ngọc Tú', 'dh52113150@student.stu.edu.vn', '#N/A', 'D21_TH11', '119', 'DT70C4', 50, NULL, 'Ứng dụng trên Mobile', 'GVF0D', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113174', 'Phạm Nguyễn Thanh Tâm', 'dh52113174@student.stu.edu.vn', '#N/A', 'D21_TH12', '8', 'DT543B', 50, NULL, 'Ứng dụng trên Web', 'GV8F6', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('Dh52113292', 'Lê Minh Kiệt', 'DH52113292@student.stu.edu.vn', '0937733385', 'D21_TH08', '34', 'DTE3AF', 50, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113345', 'Lữ Mai Phương', 'DH52113345@student.stu.edu.vn', '0833063875', 'D21_TH08', '179', 'DT269E', 50, 'Đổi tên đề tài \"Phát hiện tấn công DDOS bằng các thuật máy học\"', '*', 'GV3CF', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113526', 'Trần Thái Duy', 'DH52113526@student.stu.edu.vn', '0935183461', 'D21_TH11', '102', 'DTFE0D', 40, NULL, 'Ứng dụng trên Web', 'GV510', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113745', 'Nguyễn Thành Lợi', 'dh52113745@student.stu.edu.vn', '#N/A', 'D21_TH14', '57', 'DT2CFC', 50, NULL, 'Ứng dụng trên Web', 'GVE12', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('DH52113777', 'Huỳnh Xuân Thọ', 'DH52113777@student.stu.edu.vn', NULL, 'D21_TH12', '52', 'DT5C96', 30, NULL, 'Ứng dụng .Net', 'GV7E2', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL),
('LT52200006', 'Trần Minh Nghĩa', 'LT52200006@student.stu.edu.vn', '0908655034', 'L22_TH01', '20', 'DTFDD9', 40, NULL, 'Ứng dụng trên Web', 'GVA27', 0, '2025-12-25 23:41:38', '2025-12-25 23:41:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `temp_import`
--

CREATE TABLE `temp_import` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `MSSV` varchar(191) DEFAULT NULL,
  `HoTenSV` varchar(191) DEFAULT NULL,
  `Lop` varchar(191) DEFAULT NULL,
  `SDT` varchar(191) DEFAULT NULL,
  `Email` varchar(191) DEFAULT NULL,
  `HuongDeTai` varchar(191) DEFAULT NULL,
  `Nhom` varchar(191) DEFAULT NULL,
  `GVHD` varchar(191) DEFAULT NULL,
  `GVPB` varchar(255) DEFAULT NULL,
  `HocVi` varchar(100) DEFAULT NULL,
  `NoiCongTac` varchar(255) DEFAULT NULL,
  `TenDeTai` varchar(255) DEFAULT NULL,
  `MoTa` text DEFAULT NULL,
  `Diem` double DEFAULT NULL,
  `TrangThai` varchar(50) DEFAULT NULL,
  `GhiChu` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_import`
--

INSERT INTO `temp_import` (`id`, `MSSV`, `HoTenSV`, `Lop`, `SDT`, `Email`, `HuongDeTai`, `Nhom`, `GVHD`, `GVPB`, `HocVi`, `NoiCongTac`, `TenDeTai`, `MoTa`, `Diem`, `TrangThai`, `GhiChu`, `created_at`, `updated_at`) VALUES
(1, 'DH52002723', 'Phạm Ngọc Khoa', 'D20_TH04', '0528051699', 'DH52002723@student.stu.edu.vn', 'Ứng dụng trên Web', '4', 'NGÔ XUÂN BÁCH', 'LƯƠNG AN VINH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website cung dịch vụ cho thuê xe và thuê xe ô tô tự lái', 'Tìm hiểu phương thức cung cấp dịch vụ thuê xe: điều kiện thuê, hợp đồng thuê, phương thức giao dịch… Quản lý, phân loại xe phù hợp với chủng loại, nhu cầu sử dụng, quản lý tình trạng xe, quản lý hợp đồng, thông tin khách hàng.', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(2, 'DH52003935', 'Phạm Châu Phú', 'D20_TH04', '0337847385', 'DH52003935@student.stu.edu.vn', 'Ứng dụng trên Web', '5', 'NGÔ XUÂN BÁCH', 'ĐOÀN TRÌNH DỤC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán máy tính Desktop', 'Tìm hiểu nghiệp vụ mua bán & quản lý sản phẩm máy tính và linh kiện. Hỗ trợ tìm kiếm theo thông số kỹ thuật của sản phẩm. Theo dõi đơn hàng, kiểm tra thời hạn bảo hành sản phẩm. Hỗ trợ xây dựng cấu hình và báo giá.', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(3, 'DH52005870', 'Vũ Trung Kiên', 'D20_TH08', '0779182032', 'DH52005870@student.stu.edu.vn', 'Ứng dụng trên Web', '6', 'NGÔ XUÂN BÁCH', '', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán mô hình figure Nhật Bản', 'Xây dựng website quản lý và bán sản phẩm Figure, hỗ trợ phân loại tìm kiếm  theo chủ đề, chất liệu … Quản lý đơn hàng, thống kê phân loại nào được quan tâm nhiều nhất.', 40, 'Đình Chỉ', 'Sv không code được, ko chỉ ra được đoạn code để load dữ liệu lên form.', '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(4, 'DH52113174', 'Phạm Nguyễn Thanh Tâm', 'D21_TH12', '#N/A', '#N/A', 'Ứng dụng trên Web', '8', 'NGÔ XUÂN BÁCH', 'HOÀNG KHUÊ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website hỗ trợ học tiếng Anh', 'Tổ chức các bài học với nhiều cấp độ khác nhau. Hỗ trợ đánh giá sự tiến bộ của người học qua các bài kiểm tra, người học chỉ được tham gia bài học cấp độ cao hơn khi đạt được 80% cấp độ kế trước.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(5, 'DH52106873', 'Nguyễn Hoàng Quan', 'D21_TH04', '#N/A', '#N/A', 'Ứng dụng trên Web', '9', 'NGÔ XUÂN BÁCH', 'LÊ TRIỆU NGỌC ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán các sản phẩm của Apple', 'Tìm hiểu đặc điểm sản phẩm của Apple. Hỗ trợ phân loại, tìm kiếm theo đặc điểm của sản phẩm. Theo dõi đơn hàng, kiểm tra thời hạn bảo hành sản phẩm. Thống kê doanh thu của mỗi loại sản phẩm.', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(6, 'DH52005699', 'Nguyễn Hùng Cường', 'D20_TH10', '0932464672', 'DH52005699@student.stu.edu.vn', '*', '167', 'NGÔ XUÂN BÁCH', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán sách', 'Tìm hiểu nghiệp vụ quản lý, phân loại sản phẩm, hỗ trợ khách hàng tìm kiếm và review một đoạn nội dung quyển sách, quản lý đơn hàng, hỗ trợ theo dõi đơn hàng, thanh toán online.', 50, 'Cảnh Cáo', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(7, 'DH52001024', 'Nguyễn Duy Sơn', 'D20_TH02', '0783887570', 'DH52001024@student.stu.edu.vn', '*', '169', 'NGÔ XUÂN BÁCH', 'TRẦN QUỐC TRƯỜNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán nguyên liệu sản phẩm từ thảo dược', 'Phân loại thảo dược và dược tính của mỗi loại. Hỗ trợ tìm kiếm sản phẩm theo nhóm danh mục, công dụng. Quản lý đơn hàng, quản lý thanh toán và thống kê doanh thu, cảnh báo sản phẩm sắp hết hạn sử dụng.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(8, 'DH52006188', 'Lê Nguyễn Trường Thịnh', 'D20_TH10', '0774077020', 'DH52006188@student.stu.edu.vn', NULL, NULL, 'NGÔ XUÂN BÁCH', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán quần áo thời trang', 'Tìm hiểu chủng loại quần áo muốn kinh doanh, hỗ trợ người dùng phân loại theo chủng loại, theo giới tính, thương hiệu... Hỗ trợ thanh toán online, theo dõi đơn hàng, thống kê doanh thu theo tháng, quý, năm và sản phẩm bán chạy nhất.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(9, 'DH51900751', 'Ngô Tuấn Thành', 'D19_TH06', '0777843892', 'DH51900751@student.stu.edu.vn', NULL, NULL, 'NGÔ XUÂN BÁCH', 'NGUYỄN MINH SANG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng Web quản lý đăng ký sử dụng thiết bị phòng Gym của trường STU', 'Quản lý thiết bị phòng gym STU, lập lịch hoạt động và cho người dùng đăng ký lịch sử dụng thiết bị. Kiểm tra đối sánh người dùng đã đăng ký lịch khi vào phòng gym và thông báo nhắc nhở người dùng nào đã hết giờ tập.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(10, 'DH52110693', 'Đỗ Ngọc Anh Duy', 'D21_TH13', '0865006929', 'DH52110693@student.stu.edu.vn', 'Ứng dụng trên Web', '12', 'BÙI NHẬT BẰNG', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán quần áo', 'Xây dựng 1 website thương mại điện tử kinh doanh quần áo', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(11, 'DH52110802', 'Trần Ngọc Điền', 'D21_TH14', '0924640701', 'DH52110802@student.stu.edu.vn', 'Ứng dụng trên Web', '13', 'BÙI NHẬT BẰNG', 'TRẦN QUỐC TRƯỜNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website mạng xã hội dành cho game thủ', 'Xây dựng website có các chức năng cơ bản của 1 mạng xã hội hướng tới nhóm người đam mê game', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(12, 'LT52200006', 'Trần Minh Nghĩa', 'L22_TH01', '0908655034', 'LT52200006@student.stu.edu.vn', 'Ứng dụng trên Web', '20', 'BÙI NHẬT BẰNG', 'HOÀNG KHUÊ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán máy tính', 'Xây dựng 1 website thương mại điện tử kinh doanh máy tính và phụ kiện', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(13, 'DH52005731', 'Trần Lê Minh Duy', 'D20_TH09', '0838567807', 'DH52005731@student.stu.edu.vn', 'Ứng dụng trên Web', '15', 'BÙI NHẬT BẰNG', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán quần áo', 'Xây dựng 1 website thương mại điện tử kinh doanh quần áo', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(14, 'DH52002303', 'Lê Chí Cường', 'D20_TH01', '0904446653', 'DH52002303@student.stu.edu.vn', 'Ứng dụng trên Web', '28', 'BÙI NHẬT BẰNG', 'NGUYỄN MINH SANG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website thương mại điện tử cho công ty OLDTOT', 'Xây dựng website cho phép người dùng rao bán hoặc tặng đồ cũ, người mua có thể tìm và liên hệ với người bán hoặc người tặng', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(15, 'DH52002302', 'Cao Hoàng Nam', 'D20_TH01', '0909393047', 'DH52002302@student.stu.edu.vn', 'Ứng dụng trên Web', '28', 'BÙI NHẬT BẰNG', 'NGUYỄN MINH SANG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website thương mại điện tử cho công ty OLDTOT', 'Xây dựng website cho phép người dùng rao bán hoặc tặng đồ cũ, người mua có thể tìm và liên hệ với người bán hoặc người tặng', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(16, 'DH52110995', 'Đỗ Quang Huy', 'D21_TH09', '0395553134', 'DH52110995@student.stu.edu.vn', '*', '170', 'BÙI NHẬT BẰNG', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt vé xem phim cho công ty CINEGO', 'Xây dựng 1 website cho phép người dùng đặt vé xem phim, tìm kiếm phim cần mua vé, thanh toán online', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(17, 'DH52111083', 'Trần Mai Huy Khải', 'D21_TH09', '0582079957', 'DH52111083@student.stu.edu.vn', '*', '170', 'BÙI NHẬT BẰNG', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt vé xem phim cho công ty CINEGO', 'Xây dựng 1 website cho phép người dùng đặt vé xem phim, tìm kiếm phim cần mua vé, thanh toán online', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(18, 'DH52110660', 'Nguyễn Chí Cường', 'D21_TH05', '0901315352', 'DH52110660@student.stu.edu.vn', NULL, NULL, 'BÙI NHẬT BẰNG', 'TRẦN QUỐC TRƯỜNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng mạng xã hội kết nối hoạt động cộng đồng', 'Xây dựng mạng xã hội chuyên về các hoạt động cộng đồng: đăng sự kiện, đăng ký tham gia, chia sẻ thông tin sự kiện với người khác', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(19, 'DH52003995', 'Huỳnh Thanh Phúc', 'D20_TH04', '0348095507', 'DH52003995@student.stu.edu.vn', 'Ứng dụng trên Web', '16', 'ĐOÀN TRÌNH DỤC', 'NGUYỄN LẠC AN THƯ', 'Thạc sĩ', 'ĐH CNSG', 'Quản Lý quán cafe', 'Xây dựng website + app hỗ trợ đặt món thanh toán cho quán cafe', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(20, 'DH52001281', 'Phạm Tôn Thuận', 'D20-TH04', '#N/A', '#N/A', 'Ứng dụng trên Web', '17', 'ĐOÀN TRÌNH DỤC', 'NGUYỄN THANH TÙNG', 'Thạc sĩ', 'ĐH CNSG', 'Website ôn thi trắc nghiệm', 'hỗ trợ người dùng quản lý và ôn thi trắc nghiệm', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(21, 'DH52111212', 'Nguyễn Hoàng Linh', 'D21_TH11', '0941412077', 'DH52111212@student.stu.edu.vn', 'Ứng dụng trên Mobile', '25', 'ĐOÀN TRÌNH DỤC', 'NGUYỄN HỒNG BỬU LONG', 'Thạc sĩ', 'ĐH CNSG', 'Website hỗ trợ chia sẻ tài liệu  sử dụng công nghệ NFT', 'Website hỗ trợ chia sẻ tài liệu  sử dụng công nghệ NFT', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(22, 'DH52111579', 'Nguyễn Việt Phương', 'D21_TH09', '0978699529', 'DH52111579@student.stu.edu.vn', 'Ứng dụng trên Web', '56', 'ĐOÀN TRÌNH DỤC', 'HỒ ĐÌNH KHẢ', 'Thạc sĩ', 'ĐH CNSG', 'Website hỗ trợ tìm kiếm việc làm', 'Website hỗ trợ tìm kiếm việc làm', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(23, 'DH52111486', 'Nguyễn Tấn Phi', 'D21_TH09', '0703760626', 'DH52111486@student.stu.edu.vn', 'Ứng dụng trên Web', '56', 'ĐOÀN TRÌNH DỤC', 'TRẦN VĂN HÙNG', 'Thạc sĩ', 'ĐH CNSG', 'Website quản lý sân bóng', 'Website quản lý sân bóng', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(24, 'DH52106740', 'Trần Hoàng Long', 'D21_TH03', '#N/A', '#N/A', 'Ứng dụng trên Mobile', '92', 'ĐOÀN TRÌNH DỤC', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH CNSG', 'Ứng dụng + website hỗ trợ đấu giá sử dụng blockchain', 'Ứng dụng + website hỗ trợ đấu giá sử dụng blockchain', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(25, 'DH52106130', 'Bùi Phi Hùng', 'D21_TH01', '0394126389', 'DH52106130@student.stu.edu.vn', 'Ứng dụng trên Mobile', '98', 'ĐOÀN TRÌNH DỤC', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH CNSG', 'Ứng dụng quản lý tập lluyện và chế độ ăn cá nhân', 'Ứng dụng quản lý tập lluyện và chế độ ăn cá nhân', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(26, 'DH52111240', 'Nguyễn Viết Long', 'D21_TH08', '#N/A', '#N/A', 'Ứng dụng trên Mobile', '101', 'ĐOÀN TRÌNH DỤC', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'ĐH CNSG', 'Ứng dụng đọc truyện tranh manga', 'Mô tả: xây dựng backend và frontend di động hỗ trợ đọc truyện online', 0, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(27, 'DH52110733', 'Nguyễn Sơn Dương', 'D21_TH11', '0826464186', 'DH52110733@student.stu.edu.vn', 'Ứng dụng trên Mobile', '107', 'ĐOÀN TRÌNH DỤC', 'LƯƠNG AN VINH', 'Thạc sĩ', 'ĐH CNSG', 'Ứng dụng hỗ trợ chạy bộ sử dụng công nghệ NFT', 'Ứng dụng hỗ trợ chạy bộ sử dụng công nghệ NFT', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(28, 'DH52005851', 'Nguyễn Tấn Huy', 'D20_TH08', '0919202108', 'DH52005851@student.stu.edu.vn', '*', '172', 'ĐOÀN TRÌNH DỤC', 'LƯƠNG AN VINH', 'Thạc sĩ', 'ĐH CNSG', 'Công cụ/bot hỗ trợ giao dịch sàn binance', NULL, 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(29, 'DH52113345', 'Lữ Mai Phương', 'D21_TH08', '0833063875', 'DH52113345@student.stu.edu.vn', '*', '179', 'ĐOÀN TRÌNH DỤC', 'NGUYỄN HỒNG BỬU LONG', 'Thạc sĩ', 'ĐH CNSG', 'Phát hiện tấn công DDOS bằng học sâu trên dữ liệu NetFlow', 'Phát hiện tấn công DDOS bằng học sâu trên dữ liệu NetFlow', 50, 'Được tiếp tục', 'Đổi tên đề tài \"Phát hiện tấn công DDOS bằng các thuật máy học\"', '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(30, 'DH52111171', 'Lâm Tuấn Kiệt', 'D21_TH10', '0941693505', 'DH52111171@student.stu.edu.vn', 'Ứng dụng trên Web', '2', 'LÊ THỊ MỸ DUNG', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng webiste bán điện thoại di động', 'Sinh viên tìm hiểu nghiệp vụ và phân tích, thiết kế xây dựng website bán điện thoại di động', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(31, 'DH52112019', 'Nguyễn Ngọc Thanh Tuệ', 'D21_TH08', '0907355548', 'DH52112019@student.stu.edu.vn', 'Ứng dụng trên Web', '24', 'LÊ THỊ MỸ DUNG', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website Bán cây cảnh', 'Sinh viên tìm hiểu nghiệp vụ và phân tích, thiết kế xây dựng website bán cây cảnh', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(32, 'DH52111085', 'Trương Minh Khải', 'D21_TH08', '0835359010', 'DH52111085@student.stu.edu.vn', 'Ứng dụng trên Web', '49', 'LÊ THỊ MỸ DUNG', 'NGUYỄN THANH TÙNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website Quản lý đặt phòng và dịch vụ cho Khách sạn', 'Sinh viên tìm hiểu nghiệp vụ và phân tích, thiết kế xây dựng website đặt phòng và dịch vụ của Khách sạn', 0, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(33, 'DH52000682', 'Lê Tuấn', 'D20_TH03', '0777789336', 'DH52000682@student.stu.edu.vn', 'Ứng dụng trên Web', '61', 'TRỊNH THANH DUY', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán giày', 'Tìm hiểu nghiệp vụ bán giày của các website bán giày hiện có\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán giày theo quy trình đã thiết kế\n', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(34, 'DH52001330', 'Phạm Ngọc Đông', 'D20_TH03', '0366468307', 'DH52001330@student.stu.edu.vn', 'Ứng dụng trên Web', '61', 'TRỊNH THANH DUY', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán giày', 'Tìm hiểu nghiệp vụ bán giày của các website bán giày hiện có\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán giày theo quy trình đã thiết kế\n', NULL, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(35, 'DH52112127', 'Lương Triều Vỹ', 'D21_TH08', '', 'DH52112127@student.stu.edu.vn', 'Ứng dụng trên Web', '63', 'TRỊNH THANH DUY', 'HOÀNG KHUÊ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website học tiếng anh trực tuyến', 'Tìm hiểu nghiệp vụ của các website học tiếng anh hiện tại\nxây dựng lược đồ CSDL và thiết kế giao diện cho đề tài\nXây dựng website học tiếng anh', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(36, 'DH52111491', 'Nguyễn Chí Phong', 'D21_TH10', '0903073250', 'DH52111491@student.stu.edu.vn', 'Ứng dụng trên Web', '64', 'TRỊNH THANH DUY', 'TRẦN VĂN HÙNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán thiết bị điện tử', 'Tìm hiểu nghiệp vụ của các website bán thiết bị điện tử hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán thiết bị điện tử theo quy trình đã thiết kế', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(37, 'DH52111115', 'Mai Lâm Quang Khánh', 'D21_TH10', '0707347324', 'DH52111115@student.stu.edu.vn', 'Ứng dụng trên Web', '65', 'TRỊNH THANH DUY', 'LÊ TRIỆU NGỌC ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán quần áo và phụ kiện thể thao', 'Tìm hiểu nghiệp vụ bán hàng của các website bán quần áo và phụ kiện thể thao hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán quần áo và phụ kiện thể thao theo quy trình đã thiết kế', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(38, 'DH52111439', 'Huỳnh Tấn Nhớ', 'D21_TH13', '0977979791', 'DH52111439@student.stu.edu.vn', 'Ứng dụng trên Web', '67', 'TRỊNH THANH DUY', 'NGUYỄN HỒNG BỬU LONG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán áo khoác', 'Tìm hiểu nghiệp vụ bán hàng của các website bán áo khoác \nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán áo khoác theo quy trình đã thiết kế', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(39, 'DH52111531', 'Lưu Hoàng Phúc', 'D21_TH13', '0396895104', 'DH52111531@student.stu.edu.vn', 'Ứng dụng trên Web', '68', 'TRỊNH THANH DUY', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán trang sức', 'Tìm hiểu nghiệp vụ bán trang sức của các website bán trang sức hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán trang sức theo quy trình đã thiết kế\n', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(40, 'DH52111224', 'Giang Nhật Long', 'D21_TH13', '0856639637', 'DH52111224@student.stu.edu.vn', 'Ứng dụng trên Web', '68', 'TRỊNH THANH DUY', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán trang sức', 'Tìm hiểu nghiệp vụ bán trang sức của các website bán trang sức hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán trang sức theo quy trình đã thiết kế\n', NULL, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(41, 'DH52101228', 'Nguyễn Thanh Hậu', 'D21_TH07', '#N/A', '#N/A', 'Ứng dụng trên Web', '73', 'TRỊNH THANH DUY', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán quần áo', 'Tìm hiểu nghiệp vụ bán hàng của các website bán quần áo hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán quần áo theo quy trình đã thiết kế\n', 20, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(42, 'DH52109172', 'Nguyễn Thành Sang', 'D21_TH07', '#N/A', '#N/A', 'Ứng dụng trên Web', '73', 'TRỊNH THANH DUY', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán quần áo', 'Tìm hiểu nghiệp vụ bán hàng của các website bán quần áo hiện nay\nXây dựng quy trình nghiệp vụ, lược đồ CSDL, thiết kế giao diện cho đề tài\nXây dựng website bán quần áo theo quy trình đã thiết kế\n', NULL, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(43, 'DH52111086', 'Dương Trí Khang', 'D21_TH08', '0836169654', 'DH52111086@student.stu.edu.vn', 'Ứng dụng Java', '22', 'DƯƠNG VĂN ĐEO', 'TRẦN QUỐC TRƯỜNG', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Xây dựng sàn giao dịch bất động sản', '- Đề tài tập trung phát triển một nền tảng trung gian kết nối người mua, người bán và người thuê bất động sản. Hệ thống cho phép người dùng đăng tin rao bán/cho thuê bất động sản một cách minh bạch với đầy đủ thông tin và hình ảnh. Đồng thời, người có nhu cầu có thể dễ dàng tìm kiếm, lọc và so sánh các bất động sản dựa trên nhiều tiêu chí khác nhau.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(44, 'DH52108711', 'Đặng Gia Bảo', 'D21_TH06', '#N/A', '#N/A', 'Ứng dụng trên Web', '96', 'DƯƠNG VĂN ĐEO', 'KHUẤT BÁ DUY LÂM', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Xây dựng website bán đồ thể thao', '- Đề tài này tập trung phát triển một website thương mại điện tử chuyên về các sản phẩm thể thao. Hệ thống cung cấp một cổng thông tin trực tuyến cho phép khách hàng xem, tìm kiếm và đặt mua các mặt hàng như quần áo, dụng cụ và phụ kiên thể thao một cách thuận tiện. Về phía cửa hàng, website hỗ trợ toàn bộ quy trình từ quản lý sản phẩm, đơn hàng đến khách hàng.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(45, 'DH52108862', 'Hà Trần Hoàng Anh', 'D21_TH06', '#N/A', '#N/A', 'Ứng dụng trên Web', '96', 'DƯƠNG VĂN ĐEO', 'KHUẤT BÁ DUY LÂM', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Xây dựng website bán đồ thể thao', '- Đề tài này tập trung phát triển một website thương mại điện tử chuyên về các sản phẩm thể thao. Hệ thống cung cấp một cổng thông tin trực tuyến cho phép khách hàng xem, tìm kiếm và đặt mua các mặt hàng như quần áo, dụng cụ và phụ kiên thể thao một cách thuận tiện. Về phía cửa hàng, website hỗ trợ toàn bộ quy trình từ quản lý sản phẩm, đơn hàng đến khách hàng.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(46, 'DH52003543', 'Nguyễn Công Chi', 'D20_TH05', '0523261143', 'DH52003543@student.stu.edu.vn', 'Ứng dụng trên Web', '97', 'DƯƠNG VĂN ĐEO', 'NGUYỄN THỊ NGÂN HÀ', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Xây dựng website bán nông sản sạch', 'Đề tài này tập trung phát triển một website thương mại điện tử chuyên kinh doanh các mặt hàng nông sản sạch, có nguồn gốc rõ ràng. Hệ thống hướng tới việc kết nối trực tiếp người tiêu dùng với nhà cung cấp, nhằm đảm bảo chất lượng và độ tươi ngon của sản phẩm. Website cho phép người dùng dễ dàng tìm kiếm và đặt mua các loại rau củ, trái cây tươi sống. Trọng tâm của đề tài là xây dựng lòng tin thông qua việc cung cấp đầy đủ thông tin về nguồn gốc, quy trình canh tác cho từng sản phẩm', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(47, 'DH52111704', 'Dương Văn Minh Tâm', 'D21_TH12', '#N/A', '#N/A', 'Ứng dụng Java', '118', 'DƯƠNG VĂN ĐEO', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Xây dựng ứng dụng quản lý phòng khám', 'Đề tài này tập trung phát triển một hệ thống phần mềm để số hóa và tự động hóa các quy trình nghiệp vụ cốt lõi của một phòng khám. Ứng dụng giúp theo dõi toàn bộ hành trình của bệnh nhân, từ đăng ký lịch hẹn, khám bệnh, đến kê đơn và thanh toán. Mục tiêu chính là giảm thiểu thủ tục giấy tờ, tối ưu hóa lịch trình làm việc của bác sĩ, quản lý thông tin bệnh nhân một cách tập trung và bảo mật, từ đó nâng cao hiệu quả hoạt động và chất lượng dịch vụ của phòng khám.', 20, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(48, 'DH52113150', 'Trần Ngọc Tú', 'D21_TH11', '#N/A', '#N/A', 'Ứng dụng trên Mobile', '119', 'DƯƠNG VĂN ĐEO', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Xây dựng ứng dụng quản lý sức khỏe', 'Đề tài này tập trung phát triển một ứng dụng cá nhân hóa giúp người dùng theo dõi và quản lý tình trạng sức khỏe tổng quát của bản thân. Ứng dụng cung cấp các công cụ để ghi chép, lưu trữ và phân tích các chỉ số sức khỏe quan trọng theo thời gian. Mục tiêu là tạo ra một trợ lý sức khỏe số, hỗ trợ người dùng hình thành thói quen lành mạnh, cảnh báo sớm các dấu hiệu bất thường và cung cấp dữ liệu hữu ích khi cần tham vấn ý kiến chuyên môn từ bác sĩ', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(49, 'DH52007161', 'Phạm Duy Thắng', 'D20-TH11', '0335444058', 'DH52007161@student.stu.edu.vn', 'Ứng dụng trên Web', '121', 'DƯƠNG VĂN ĐEO', 'TRỊNH THANH DUY', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Xây dựng website bán giày', 'Đề tài này tập trung phát triển một website thương mại điện tử chuyên bán các sản phẩm giày dép. Hệ thống cung cấp giao diện trực quan để khách hàng có thể dễ dàng duyệt, tìm kiếm và lựa chọn các mẫu giày theo nhiều tiêu chí khác nhau. Website được thiết kế để tối ưu hóa trải nghiệm mua sắm, từ việc xem ảnh sản phẩm chi tiết đến quy trình đặt hàng và thanh toán đơn giản. Về phía quản trị, hệ thống hỗ trợ quản lý danh mục, sản phẩm và đơn hàng một cách hiệu quả', 50, 'Cảnh Cáo', 'Sử dụng AI trong quá trình nghiên cứu và hiện thực ứng dụng nhưng không hiểu.', '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(50, 'DH52111204', 'Trương Văn Liêu', 'D21_TH08', '0393726628', 'DH52111204@student.stu.edu.vn', 'Ứng dụng trên Web', '122', 'DƯƠNG VĂN ĐEO', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Website đặt phòng khách sạn trực tuyến', 'Đề tài này tập trung phát triển một hệ thống website đặt phòng khách sạn, hoạt động theo mô hình đại lý. Hệ thống sẽ thiết lập quan hệ hợp tác với các đối tác khách sạn để nhập thông tin, giá phòng và tình trạng phòng trống. Người dùng cuối sẽ truy cập vào website này để tìm kiếm, so sánh và đặt phòng trực tiếp. Bài toán kỹ thuật trọng tâm là quản lý và đồng bộ hóa dữ liệu (phòng, giá, lịch đặt) từ nhiều đối tác khác nhau vào một cơ sở dữ liệu thống nhất của hệ thống, từ đó cung cấp trải nghiệm đặt phòng chính xác, minh bạch và liền mạch cho khách hàng.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(51, 'DH52110812', 'Trương Thanh Đông', 'D21_TH11', '0706766557', 'DH52110812@student.stu.edu.vn', 'Ứng dụng trên Mobile', '125', 'DƯƠNG VĂN ĐEO', 'NGUYỄN LẠC AN THƯ', 'Thạc sĩ', 'Cty TNHH Aduro Labs VN', 'Xây dựng ứng dụng bán hàng mỹ phẩm', 'Đề tài này tập trung phát triển một ứng dụng thương mại điện tử chuyên biệt cho lĩnh vực mỹ phẩm. Ứng dụng cung cấp một nền tảng để người dùng khám phá, tìm hiểu thông tin và mua sắm các sản phẩm như son, phấn, kem dưỡng da,...\nĐiểm nhấn của hệ thống là khả năng hiển thị đầy đủ thông tin sản phẩm, bao gồm thành phần, công dụng, hướng dẫn sử dụng và xuất xứ, nhằm xây dựng lòng tin và hỗ trợ quyết định mua hàng. Ứng dụng được kỳ vọng sẽ mang đến trải nghiệm mua sắm trực tuyến tiện lợi, an toàn và đáng tin cậy cho người dùng cuối', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(52, 'DH52111529', 'Lê Trần Trọng Phúc', 'D21_TH10', '0946129499', 'DH52111529@student.stu.edu.vn', 'Ứng dụng trên Web', '153', 'HUỲNH QUANG ĐỨC', 'TRẦN QUỐC TRƯỜNG', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng website quản lý ao nuôi tôm', 'Xây dựng hệ thống website có khả năng lưu trữ, quản lý dữ liệu ao nuôi.\nXây dựng chức năng ghi nhận chất lượng nước,lượng thuốc, thức ăn và vật tư sử dụng hằng ngày.\nXây dựng tính năng cảnh báo khi các chỉ số môi trường quá ngưỡng và khi thuốc gần hết hạn.\nXây dựng chức năng thống kê và báo cáo: xuất kết quả sử dụng thuốc và chi phí vật tư theo từng vụ nuôi\n', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(53, 'DH52110659', 'Ngô Đức Trần Cường', 'D21_TH11', '#N/A', '#N/A', 'Ứng dụng trên Web', '154', 'HUỲNH QUANG ĐỨC', 'LƯƠNG AN VINH', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng hệ thống phân tích cảm xúc người dùng mạng xã hội dựa trên bình luận ', 'Thu thập dữ liệu từ các trang mạng xã hội.\nXử lý và gán nhãn dữ liệu đã thu thập.\nXây dựng những bộ ngữ liệu từ các bình luận được thu thập.\nHuấn luyện mô hình PHOBert từ những bộ ngữ đã được xây dựng.\nXây dựng website tích hợp mô hình đã được huấn luyện vào để phân tích cảm xúc từ những bài viết trên các trang mạng xã hội.\n', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(54, 'DH52112944', 'Lê Đoàn Anh Quân', 'D21_TH11', '0866603591', 'DH52112944@student.stu.edu.vn', 'Ứng dụng trên Web', '156', 'HUỲNH QUANG ĐỨC', 'LƯƠNG AN VINH', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng hệ thống phân tích cảm xúc người dùng mạng xã hội dựa trên bình luận ', 'Thu thập dữ liệu từ các trang mạng xã hội.\nXử lý và gán nhãn dữ liệu đã thu thập.\nXây dựng những bộ ngữ liệu từ các bình luận được thu thập.\nHuấn luyện mô hình PHOBert từ những bộ ngữ đã được xây dựng.\nXây dựng website tích hợp mô hình đã được huấn luyện vào để phân tích cảm xúc từ những bài viết trên các trang mạng xã hội.\n', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(55, 'DH52113047', 'Phan Đức Thắng', 'D21_TH14', '0949985490', 'DH52113047@student.stu.edu.vn', 'Ứng dụng trên Web', '155', 'HUỲNH QUANG ĐỨC', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng Website quản lý và bán hàng nội thất', 'Xây dựng một website hỗ trợ cửa hàng nội thất quản lý bán hàng trực tuyến và kho hàng một cách hiệu quả, hiện đại và dễ sử dụng; Cụ thể hóa quy trình nghiệp vụ của cửa hàng bán nội thất bao gồm: quy trình bán hàng trực tuyến và quy trình quản lý kho', 40, 'Cảnh Cáo', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(56, 'DH52104108', 'Nguyễn Đăng Khoa', 'D21_TH02', '0938240431', 'DH52104108@student.stu.edu.vn', 'Ứng dụng trên Web', '157', 'HUỲNH QUANG ĐỨC', 'VÕ XUÂN THỊNH', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng website quản lý và bán vé sự kiện', '  Thiết kế và xây dựng một nền tảng Quản lý và Bán vé sự kiện, nhằm hỗ trợ và kết nối giữa khách hàng với những đơn vị tổ chức sự kiện. Mang đến sự tối ưu hóa các quy trình mua bán và quản lý vé trong sự kiện; -        Thiết kế một cổng thông tin sự kiện cho Khách hàng giúp người dùng dễ dàng tìm kiếm, xem, đặt vé và chỗ ngồi cho sự kiện đó', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(57, 'DH52110924', 'Trần Nguyễn Minh Hiếu', 'D21_TH13', '0936049080', 'DH52110924@student.stu.edu.vn', 'Ứng dụng trên Web', '149', 'HUỲNH QUANG ĐỨC', 'TRỊNH THANH DUY', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng hệ thống đặt lịch khám bệnh trực tuyến', 'Xây dựng một hệ thống số hóa toàn bộ quy trình lên lịch hẹn khám bệnh của phòng khám, giúp quản lý phòng khám hiệu quả hơn; -  Xây dựng cơ sở dữ liệu để lưu trữ và quản lý thông tin tập trung, bao gồm: hồ sơ bệnh nhân, thông tin bác sĩ, chuyên khoa, dịch vụ y tế và các ca khám còn trống', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(58, 'DH52001900', 'Nguyễn Minh Triều', 'D20_TH01', '0899052420', 'DH52001900@student.stu.edu.vn', 'Ứng dụng trên Web', '150', 'HUỲNH QUANG ĐỨC', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng website bán hàng thời trang', '- Mục đích của đề tài là nghiên cứu, thiết kế và xây dựng website bán hàng thời trang nhằm mở rộng quy mô kinh doanh, nâng cao chất lượng trải nghiệm mua sắm của khách hàng, đồng thời tối ưu hóa quy trình quản lý và vận hành hoạt động kinh doanh so với các mô hình bán hàng thông qua mạng xã hội', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(59, 'DH52105312', 'Trần Hà Xuân Thịnh', 'D21_TH02', '0349573458', 'DH52105312@student.stu.edu.vn', 'Ứng dụng trên Web', '159', 'HUỲNH QUANG ĐỨC', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng website tìm kiếm việc làm', 'Mục đích của đề tài là xây dựng một website hỗ trợ kết nối giữa người tìm việc và nhà tuyển dụng, giúp việc tìm kiếm và đăng tuyển việc làm diễn ra nhanh chóng, hiệu quả và minh bạch', 0, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(60, 'DH52103682', 'Bùi Minh Phúc', 'D21_TH01', '0359128746', 'DH52103682@student.stu.edu.vn', 'Ứng dụng trên Web', '160', 'HUỲNH QUANG ĐỨC', 'LÊ TRIỆU NGỌC ĐỨC', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng website quản lý nhân sự cho công ty công nghệ phần mềm', 'Đề tài “Xây dựng website quản lý nhân sự” nhằm phát triển một hệ thống hỗ trợ doanh nghiệp trong việc quản lý và vận hành đội ngũ nhân viên một cách hiệu quả, minh bạch và hiện đại. Website giúp tối ưu hóa quy trình làm việc, giảm thiểu công việc giấy tờ, đồng thời tăng cường khả năng truy cập và bảo mật thông tin', 0, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(61, 'DH52107203', 'Nguyễn Ngọc Thiện', 'D21_TH01', '0962419209', 'DH52107203@student.stu.edu.vn', 'Ứng dụng trên Web', '160', 'HUỲNH QUANG ĐỨC', 'LÊ TRIỆU NGỌC ĐỨC', 'Thạc sĩ', 'ĐH Bình Dương', 'Xây dựng website quản lý nhân sự cho công ty công nghệ phần mềm', 'Đề tài “Xây dựng website quản lý nhân sự” nhằm phát triển một hệ thống hỗ trợ doanh nghiệp trong việc quản lý và vận hành đội ngũ nhân viên một cách hiệu quả, minh bạch và hiện đại. Website giúp tối ưu hóa quy trình làm việc, giảm thiểu công việc giấy tờ, đồng thời tăng cường khả năng truy cập và bảo mật thông tin', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(62, 'DH52113745', 'Nguyễn Thành Lợi', 'D21_TH14', '#N/A', '#N/A', 'Ứng dụng trên Web', '57', 'LÊ TRIỆU NGỌC ĐỨC', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt phòng khách sạn.', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm phòng, Đặt phòng, Đánh gíá, Bình luận\nAdmin: Quản lý phòng, Quản lý đặt phòng, quản lý dịch vụ,..', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(63, 'DH52111263', 'Nguyễn Hòa Lợi', 'D21_TH14', '#N/A', '#N/A', 'Ứng dụng trên Web', '60', 'LÊ TRIỆU NGỌC ĐỨC', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt phòng khách sạn.', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm phòng, Đặt phòng, Đánh gíá, Bình luận\nAdmin: Quản lý phòng, Quản lý đặt phòng, quản lý dịch vụ,..', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(64, 'DH52111482', 'Võ Văn Phát', 'D21_TH09', '0937689655', 'DH52111482@student.stu.edu.vn', 'Ứng dụng trên Web', '58', 'LÊ TRIỆU NGỌC ĐỨC', 'NGUYỄN LẠC AN THƯ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt tour du lịch.', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm tour du lịch, Đặt tour, Đánh gíá, Bình luận\nAdmin: Quản lý tour, Quản lý đặt tour, quản lý dịch vụ,..', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(65, 'DH52100776', 'Vũ Trung Nguyên', 'D21_TH09', '0931329585', 'DH52100776@student.stu.edu.vn', 'Ứng dụng trên Web', '58', 'LÊ TRIỆU NGỌC ĐỨC', 'NGUYỄN LẠC AN THƯ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt tour du lịch.', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm tour du lịch, Đặt tour, Đánh gíá, Bình luận\nAdmin: Quản lý tour, Quản lý đặt tour, quản lý dịch vụ,..', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(66, 'DH52111612', 'Trần Nguyễn Hoàng Quân', 'D21_TH10', '0911341117', 'DH52111612@student.stu.edu.vn', 'Ứng dụng trên Web', '59', 'LÊ TRIỆU NGỌC ĐỨC', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website quản lý phòng nha', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website frontend: Nextjs, backedn: Nodejs + Mysql\nGồm các tính năng: QUản lý nha sỹ, quản lý thông tin bệnh nhân, quản lý lịch khám,...', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(67, 'DH52007089', 'Huỳnh Minh Khoa', 'D20_TH11', '0898175595', 'DH52007089@student.stu.edu.vn', '*', '173', 'LÊ TRIỆU NGỌC ĐỨC', '', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán điện thoại.', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng Laravel + Mysql gồm 2 phần:\nUser: Tìm kiếm điện thoại, Đặt hàng, Đánh gíá, Bình luận\nAdmin: Quản lý Danh Mục, Quản lý đặt hàng, quản lý dịch vụ khuyến mãi,..', 50, 'Xin hoãn', 'Gia đình có hoàn cảnh khó khăn.', '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(68, 'DH51905046', 'Kha Trí Hùng', 'D19_TH05', '0356065109', 'DH51905046@student.stu.edu.vn', NULL, NULL, 'LÊ TRIỆU NGỌC ĐỨC', 'NGUYỄN THỊ NGÂN HÀ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán hoa tươi.', 'Tìm hiểu nghiệp vụ.\nPhân tích và thiết kết CSDL\nHiện thực website dùng PHP (MVC) + Mysql gồm 2 phần:\nUser: Tìm kiếm, Đặt hàng, Đánh gíá, Bình luận\nAdmin: Quản lý danh mục, Quản lý đơn hàng, quản lý dịch vụ,..', 50, 'Đình Chỉ', 'Sinh viên dùng bài làm sẵn (do GV trường khác hướng dẫn) để nộp, GVHD đã cảnh báo từ đầu, yêu cầu thực hiện ljai nhưng sinh viên không thực hiện.', '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(69, 'DH52112118', 'Trần Hoàng Vương', 'D21_TH13', '0987038840', 'DH52112118@student.stu.edu.vn', 'Ứng dụng trên Web', '76', 'NGUYỄN THỊ NGÂN HÀ', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán bò sát', 'Xây dựng website bán bò sát cho phép quản lý sản phẩm, khách hàng và đơn hàng; hỗ trợ tìm kiếm, đặt mua trực tuyến, quản lý khuyến mãi và báo cáo doanh thu', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(70, 'DH52002202', 'Nguyễn Tuấn Vũ', 'D20_TH02', '#N/A', '#N/A', 'Ứng dụng trên Web', '94', 'NGUYỄN THỊ NGÂN HÀ', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng WEBSITE cho cửa hàng bách hóa', 'Xây dựng website quản lý bán hàng trực tuyến. Người dùng có thể xem, mua sản phẩm, quản lý giỏ hàng, đơn hàng, địa chỉ giao hàng, trong khi quản trị viên (Admin) có thể quản lý sản phẩm, danh mục, người dùng và theo dõi đơn hàng.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(71, 'DH52003489', 'Nguyễn Thanh Hải', 'D20_TH03', '#N/A', '#N/A', 'Ứng dụng trên Web', '94', 'NGUYỄN THỊ NGÂN HÀ', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán điện thoại ', 'Xây dựng website quản lý bán điện thoại  cho phép quàn lý và sản phẩm khách hàng và đơn hàng có thể tìm kiếm đặt mua online', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(72, 'DH52111976', 'Nguyễn Minh Trường', 'D21_TH13', '0939024432', 'DH52111976@student.stu.edu.vn', 'Ứng dụng trên Web', '140', 'NGUYỄN THỊ NGÂN HÀ', 'HỒ ĐÌNH KHẢ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt lịch khám bệnh', 'Xây dựng website đặt lịch khám bệnh có thể đặt lịch theo thời gian phù hợp nhằm đảm bảo hạn chế trường hợp quá tải bệnh nhân, hệ thống hỗ trợ quản lý lịch sửa đặt lịch, hồ sơ bệnh án để bệnh nhân có thể theo dõi theo từng đợt khám, quản lý bác sĩ, doanh thu của phòng khám, quản lý các ca làm việc, hỗ trợ đặt lịch hộ trong trường hợp người dùng không biêt cách đặt khám, quản lý thuốc', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(73, 'DH52111695', 'Nguyễn Văn Tài', 'D21_TH13', '0985141631', 'DH52111695@student.stu.edu.vn', 'Ứng dụng trên Web', '140', 'NGUYỄN THỊ NGÂN HÀ', 'HỒ ĐÌNH KHẢ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt lịch khám bệnh', 'Xây dựng website đặt lịch khám bệnh có thể đặt lịch theo thời gian phù hợp nhằm đảm bảo hạn chế trường hợp quá tải bệnh nhân, hệ thống hỗ trợ quản lý lịch sửa đặt lịch, hồ sơ bệnh án để bệnh nhân có thể theo dõi theo từng đợt khám, quản lý bác sĩ, doanh thu của phòng khám, quản lý các ca làm việc, hỗ trợ đặt lịch hộ trong trường hợp người dùng không biêt cách đặt khám, quản lý thuốc', NULL, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(74, 'DH52103137', 'Phan Tuấn Dũng', 'D21_TH01', '0357716720', 'DH52103137@student.stu.edu.vn', '*', '175', 'NGUYỄN THỊ NGÂN HÀ', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'XÂY DỰNG WEBSITE HỔ TRỢ HỌC TẬP TIẾNG ANH', 'Xây dựng website hổ trợ học tập tiếng anh nhắc nhở hoàn thành khóa học và bán khóa Có bài kiểm tra để đánh giá năng lực.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(75, 'DH52111881', 'Trần Thủy Tiên', 'D21_TH08', '0327458490', 'DH52111881@student.stu.edu.vn', 'Ứng dụng trên Web', '27', 'TRẦN VĂN HÙNG', 'KHUẤT BÁ DUY LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán hoa tươi', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán hoa tươi.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(76, 'DH52108380', 'Đoàn Thị Yến Bình', 'D21_TH06', '0824108001', 'DH52108380@student.stu.edu.vn', 'Ứng dụng trên Web', '27', 'TRẦN VĂN HÙNG', 'KHUẤT BÁ DUY LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán hoa tươi', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán hoa tươi.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(77, 'Dh52113292', 'Lê Minh Kiệt', 'D21_TH08', '0937733385', 'DH52113292@student.stu.edu.vn', 'Ứng dụng trên Web', '34', 'TRẦN VĂN HÙNG', 'LÊ TRIỆU NGỌC ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán Sách online', '- Tìm hiểu nghiệp vụ quản lý, bán hàng  của một nhà sách.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(78, 'DH52111411', 'Trần Trọng Nhân', 'D21_TH08', '02723867856', 'DH52111411@student.stu.edu.vn', 'Ứng dụng trên Web', '34', 'TRẦN VĂN HÙNG', 'LÊ TRIỆU NGỌC ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán Sách online', '- Tìm hiểu nghiệp vụ quản lý, bán hàng  của một nhà sách.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(79, 'DH52110780', 'Nguyễn Tấn Đạt', 'D21_TH08', '#N/A', '#N/A', 'Ứng dụng trên Web', '69', 'TRẦN VĂN HÙNG', 'HOÀNG KHUÊ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán nội thất văn phòng', '- Tìm hiểu nghiệp vụ quản lý bán hàng của một cửa hàng nội thất văn phòng.\n- Tìm hiểu các công nghệ phát triển website.\n- Tìm hiểu AI và tích hợp AI hỗ trợ phân tích kinh doanh và phân tích đánh giá sản phẩm.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql\n', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(80, 'DH52104298', 'Lê Thị Ly Ly', 'D21_TH08', '0339519874', 'DH52104298@student.stu.edu.vn', 'Ứng dụng trên Web', '69', 'TRẦN VĂN HÙNG', 'HOÀNG KHUÊ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán nội thất văn phòng', '- Tìm hiểu nghiệp vụ quản lý bán hàng của một cửa hàng nội thất văn phòng.\n- Tìm hiểu các công nghệ phát triển website.\n- Tìm hiểu AI và tích hợp AI hỗ trợ phân tích kinh doanh và phân tích đánh giá sản phẩm.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React, Node.js và Mysql\n', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(81, 'DH52103511', 'Phạm Hữu Chí', 'D21_TH01', '0385920397', 'DH52103511@student.stu.edu.vn', 'Ứng dụng trên Web', '70', 'TRẦN VĂN HÙNG', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán bánh online', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của cửa hàng bán bánh\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React - Node.js - MySQL', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(82, 'DH52113016', 'Huỳnh Quốc Duy', 'D21_TH14', '0362949286', 'DH52113016@student.stu.edu.vn', 'Ứng dụng trên Web', '75', 'TRẦN VĂN HÙNG', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán bánh online', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của cửa hàng bán bánh\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React - Node.js - MySQL', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(83, 'DH52109230', 'Trần Phạm Thanh Phong', 'D21_TH07', '#N/A', '#N/A', 'Ứng dụng trên Web', '74', 'TRẦN VĂN HÙNG', 'VÕ XUÂN THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán đồ thủ công online', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của cửa hàng bán đồ thủ công.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng công nghệ: React - Node.js - Mysql', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(84, 'DH52113526', 'Trần Thái Duy', 'D21_TH11', '0935183461', 'DH52113526@student.stu.edu.vn', 'Ứng dụng trên Web', '102', 'TRẦN VĂN HÙNG', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán rau củ ', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của cửa hàng bán rau củ\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Cài đặt ứng dụng web bằng Laravel - Mysql', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(85, 'DH52112786', 'Đinh Quang Thịnh', 'D21_TH10', '0931487603', 'DH52112786@student.stu.edu.vn', 'Ứng dụng trên Mobile', '26', 'HỒ ĐÌNH KHẢ', 'NGUYỄN THỊ NGÂN HÀ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng quản lý phòng trọ', 'Ứng dụng quản lý phòng trọ cho phép quản lý phòng, vật tư, dịch vụ. \nQuản lý khách hàng và hóa đơn hàng tháng ', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(86, 'DH52111681', 'Lê Anh Tài', 'D21_TH10', '0967788246', 'DH52111681@student.stu.edu.vn', 'Ứng dụng trên Mobile', '29', 'HỒ ĐÌNH KHẢ', 'NGUYỄN MINH SANG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng quản lý cơ sở Bida', 'Ứng dụng quản lý hoạt động chuỗi cơ sở Bida. \nQuản lý doanh thu ,nhân viên các dịch vụ hỗ trợ', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(87, 'DH52111067', 'Trần Minh Hưng', 'D21_TH11', '0932078352', 'DH52111067@student.stu.edu.vn', 'Ứng dụng trên Mobile', '30', 'HỒ ĐÌNH KHẢ', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng App theo dõi và hỗ trợ bình luận bóng đá', 'Ứng dụng cung cấp thông tin các giải đấu bóng đá, \ncho phép các BLV và người dùng tương tác và đánh giá', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(88, 'DH52007186', 'Trần Như Nguyện', 'D20_TH10', '0388065951', 'DH52007186@student.stu.edu.vn', 'Ứng dụng trên Web', '31', 'HỒ ĐÌNH KHẢ', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng quản lý đặt phòng khách sạn', 'Ứng dụng cho phép quản lý việc đặt phòng của một khách sạn.\n', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(89, 'DH52004272', 'Lưu Thị Thanh Thảo', 'D20_TH06', '0329824880', 'DH52004272@student.stu.edu.vn', 'Ứng dụng trên Web', '31', 'HỒ ĐÌNH KHẢ', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng quản lý đặt phòng khách sạn', 'Ứng dụng cho phép quản lý việc đặt phòng của một khách sạn.\n', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(90, 'DH52111401', 'Lê Quang Nhân', 'D21_TH08', '0393638193', 'DH52111401@student.stu.edu.vn', 'Ứng dụng trên Web', '33', 'HỒ ĐÌNH KHẢ', 'NGUYỄN HỒNG BỬU LONG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Web site kinh doanh Laptop', 'Xây dựng web site thương mại mua bán sản phẩm laptop', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(91, 'DH52111720', 'Nguyễn Công Tấn', 'D21_TH10', '', 'DH52111720@student.stu.edu.vn', 'Ứng dụng Java', '44', 'HỒ ĐÌNH KHẢ', 'NGUYỄN THANH TÙNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng đấu giá sản phẩm', 'Ứng dụng như một  sàn đấu giá \ncho phép người dụng bán hoặc mua sản phẩm thông qua hình thức đấu giá', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(92, 'DH52111794', 'Nguyễn Chí Thiện', 'D21_TH13', '0979286060', 'DH52111794@student.stu.edu.vn', 'Ứng dụng Java', '44', 'HỒ ĐÌNH KHẢ', 'NGUYỄN THANH TÙNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng đấu giá sản phẩm', 'Ứng dụng như một  sàn đấu giá \ncho phép người dụng bán hoặc mua sản phẩm thông qua hình thức đấu giá', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(93, 'DH52106859', 'Phạm Phúc Khả', 'D21_TH01', '0924993500', 'DH52106859@student.stu.edu.vn', NULL, NULL, 'HỒ ĐÌNH KHẢ', 'NGUYỄN HỒNG BỬU LONG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng Game', 'Xây dựng ứng dụng Game hành động sử dụng unity', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(94, 'DH52110534', 'Nguyễn Mậu An', 'D21_TH08', '0343513046', 'DH52110534@student.stu.edu.vn', 'Ứng dụng trên Web', '93', 'NGUYỄN THƯỜNG KIỆT', 'LƯƠNG AN VINH', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website luyện các kỹ năng tiếng Anh dựa trên nền tảng trí tuệ nhân tạo', 'Xây dựng website tích hợp trí tuệ nhân tạo để tạo ra một môi trường học tiếng Anh tương tác, giúp người dùng chủ động luyện tập và cải thiện toàn diện các kỹ năng Viết, Nói, Nghe và Từ vựng thông qua cơ chế phản hồi thông minh, tức thì và được cá nhân hóa.', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(95, 'DH52105342', 'Trần Nguyễn Minh Quân', 'D21_TH05', '0388073445', 'DH52105342@student.stu.edu.vn', 'Ứng dụng trên Web', '105', 'NGUYỄN THƯỜNG KIỆT', 'HÀ ANH VŨ', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website quản lý thư viện', 'Là một hệ thống trực tuyến giúp quản lý sách, yêu cầu mượn sách và thông tin người dùng một cách hiệu quả, tối ưu hóa quy trình vận hành thư viện', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(96, 'DH52107801', 'Nguyễn Thanh Vân', 'D21_TH05', '0349442507', 'DH52107801@student.stu.edu.vn', 'Ứng dụng trên Web', '105', 'NGUYỄN THƯỜNG KIỆT', 'HÀ ANH VŨ', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website quản lý thư viện', 'Là một hệ thống trực tuyến giúp quản lý sách, yêu cầu mượn sách và thông tin người dùng một cách hiệu quả, tối ưu hóa quy trình vận hành thư viện', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(97, 'DH52112002', 'Lâm Đình Tuấn', 'D21_TH14', '0906673427', 'DH52112002@student.stu.edu.vn', 'Ứng dụng trên Web', '106', 'NGUYỄN THƯỜNG KIỆT', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng Website học tiếng Nhật trực tuyến', 'Giúp người dùng có thể tra cứu từ vựng, luyện thi JLPT, và quản lý tiến độ học tập.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(98, 'DH52111756', 'Lê Minh Thảo', 'D21_TH13', '0522731750', 'DH52111756@student.stu.edu.vn', 'Ứng dụng trên Web', '109', 'NGUYỄN THƯỜNG KIỆT', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website quản lý bán sách', 'Website Quản lý bán sách một cổng thông tin điện tử phục vụ khách hàng và quản trị viên của hệ thống sử dụng', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(99, 'DH52106804', 'Nguyễn Trường Giang', 'D21_TH04', '#N/A', '#N/A', 'Ứng dụng trên Web', '110', 'NGUYỄN THƯỜNG KIỆT', 'NGUYỄN TRỌNG NGHĨA', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website QUẢN LÝ BÁN ĐỒ THỂ THAO', 'Là hệ thống thương mại điện tử cho phép người dùng mua sắm trực tuyến các sản phẩm thể thao như quần áo, giày dép, dụng cụ, và phụ kiện đến từ nhiều thương hiệu khác nhau.', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36'),
(100, 'DH52001904', 'Nguyễn Hữu Trường', 'D20_TH01', '0855021202', 'DH52001904@student.stu.edu.vn', 'Ứng dụng trên Web', '111', 'NGUYỄN THƯỜNG KIỆT', 'NGUYỄN LẠC AN THƯ', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website QUẢN LÝ BÁN THỰC PHẨM CHỨC NĂNG', 'Là một hệ thống thương mại điện tử giúp cửa hàng quản lý sản phẩm, khách hàng, đơn hàng và doanh thu hiệu quả.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:36', '2025-12-25 23:41:36');
INSERT INTO `temp_import` (`id`, `MSSV`, `HoTenSV`, `Lop`, `SDT`, `Email`, `HuongDeTai`, `Nhom`, `GVHD`, `GVPB`, `HocVi`, `NoiCongTac`, `TenDeTai`, `MoTa`, `Diem`, `TrangThai`, `GhiChu`, `created_at`, `updated_at`) VALUES
(101, 'DH52110786', 'Tăng Cẩm Đạt', 'D21_TH08', '#N/A', '#N/A', 'Ứng dụng trên Web', '112', 'NGUYỄN THƯỜNG KIỆT', 'TRẦN VĂN HÙNG', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website QUẢN LÝ BÁN PC', 'Là hệ thống thương mại điện tử giúp cửa hàng quản lý sản phẩm máy tính, linh kiện máy tính,  đơn hàng, doanh thu hiệu quả. Hệ thống giúp khách hàng dễ dàng xem và mua sắm sản phẩm trực tuyến và giúp quản trị viên quản lý hoạt động kinh doanh một cách thuận tiện.', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(102, 'DH52101856', 'Nguyễn Duy Bản', 'D21_TH03', '0342271703', 'DH52101856@student.stu.edu.vn', 'Ứng dụng trên Web', '113', 'NGUYỄN THƯỜNG KIỆT', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website QUẢN LÝ BÁN LAPTOP', 'Là một hệ thống thương mại điện tử giúp cửa hàng quản lý sản phẩm Laptop, khách hàng, đơn hàng và doanh thu một cách hiệu quả. ', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(103, 'DH52104582', 'Ngô Duy Tùng', 'D21_TH03', '0946809362', 'DH52104582@student.stu.edu.vn', 'Ứng dụng trên Web', '113', 'NGUYỄN THƯỜNG KIỆT', 'HỒ ĐÌNH KHẢ', 'Thạc sĩ', 'Cty cổ phần công nghệ FINVIET', 'Xây dựng website QUẢN LÝ BÁN LAPTOP', 'Là một hệ thống thương mại điện tử giúp cửa hàng quản lý sản phẩm Laptop, khách hàng, đơn hàng và doanh thu một cách hiệu quả. ', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(104, 'DH52006575', 'Lâm Tuấn Khoa', 'D20_TH09', '0355002372', 'DH52006575@student.stu.edu.vn', 'Ứng dụng trên Web', '114', 'KHUẤT BÁ DUY LÂM', 'NGUYỄN TRỌNG NGHĨA', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng website bán đồng hồ', 'Xây dựng website bán đồng hồ online', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(105, 'DH52006237', 'Nguyễn Trần Vân Uyển', 'D20_TH09', '0963476850', 'DH52006237@student.stu.edu.vn', 'Ứng dụng trên Web', '114', 'KHUẤT BÁ DUY LÂM', 'NGUYỄN TRỌNG NGHĨA', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng website bán đồng hồ', 'Xây dựng website bán đồng hồ online', 35, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(106, 'DH52104887', 'Nhữ Quốc Anh', 'D21_TH05', '0856143299', 'DH52104887@student.stu.edu.vn', 'Ứng dụng trên Web', '116', 'KHUẤT BÁ DUY LÂM', 'HỒ ĐÌNH KHẢ', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng website quản lý kho', 'Xây dựng website cung cấp dịch vụ quản lý kho cho doanh nghiệp', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(107, 'DH52005891', 'Phạm Nguyễn Hoàng Khang', 'D20_TH07', '0833485997', 'DH52005891@student.stu.edu.vn', 'Ứng dụng trên Web', '117', 'KHUẤT BÁ DUY LÂM', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng website bán lẻ linh kiện máy tính', 'Xây dưựng website bán lẻ linh kiện máy tính online', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(108, 'DH52108453', 'Đinh Phạm Phú Khang', 'D21_TH05', '0778715658', 'DH52108453@student.stu.edu.vn', 'Ứng dụng trên Web', '130', 'KHUẤT BÁ DUY LÂM', 'HÀ ANH VŨ', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng sàn giao dịch thương mại điện tử', 'Xây dựng website cung cấp sàn giao dịch thương mại điện tử', 45, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(109, 'DH52003145', 'Huỳnh Trần Anh Quốc', 'D20_TH01', '#N/A', '#N/A', 'Ứng dụng trên Web', '137', 'KHUẤT BÁ DUY LÂM', 'NGUYỄN MINH SANG', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng website bán điện thoại và phụ kiện', 'Xây dựng website bán điện thoại và phụ kiện online', 45, 'Được tiếp tục', 'Bài làm chưa dạt, nhưng sinh viên hứa cố gắng trong thời gian còn lại và vẫn muốn tiếp tục thực hiện ', '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(110, 'DH52110742', 'Nguyễn Quốc Đại', 'D21_TH14', '0898366249', 'DH52110742@student.stu.edu.vn', 'Ứng dụng trên Web', '138', 'KHUẤT BÁ DUY LÂM', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng website bán quần áo thời trang', 'Xây dựng website bán quần áo online', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(111, 'DH52005747', 'Đào Thành Đạt', 'D20_TH06', '0522939018', 'DH52005747@student.stu.edu.vn', 'Ứng dụng trên Web', '148', 'KHUẤT BÁ DUY LÂM', 'NGUYỄN THỊ NGÂN HÀ', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng website bán quần áo thời trang', 'Xây dựng website bán quần áo online', 45, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(112, 'DH51902347', 'Trần Xuân Trí', 'D19_TH08', NULL, NULL, NULL, NULL, 'KHUẤT BÁ DUY LÂM', 'NGUYỄN THANH TÙNG', 'Thạc sĩ', 'Công Ty Cổ Phần Viễn Thông FPT Telecom', 'Xây dựng website cho thuê xe', 'Xây dựng website kinh doanh cho thuê xe', 45, 'Được tiếp tục', 'Bài làm chưa dạt, nhưng sinh viên hứa cố gắng trong thời gian còn lại và vẫn muốn tiếp tục thực hiện ', '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(113, 'DH52107926', 'Nguyễn Văn Huy', 'D21_TH05', '#N/A', '#N/A', 'Ứng dụng trên Web', '36', 'NGUYỄN NGỌC LÂM', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'ĐH FPT', 'Xây dựng website bán sách online', 'Xây dựng website cho khách hàng có thể mua sách online, admin có thể quản lý sách', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(114, 'Dh52111509', 'Nguyễn Thành Tỷ  Phú', 'D21_TH10', '0767392039', 'DH52111509@student.stu.edu.vn', 'Ứng dụng trên Web', '37', 'NGUYỄN NGỌC LÂM', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH FPT', 'Xây dựng website đặt sân Pickleball', 'Xây dựng website cho phép khách hàng có thể đặt sân online theo 1 lần hoặc định kỳ, admin có thể quản lý được thời gian rảnh của sân', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(115, 'DH51903563', 'Hình Tân Hiệp', 'D19-TH05', '#N/A', '#N/A', 'Ứng dụng trên Web', '39', 'NGUYỄN NGỌC LÂM', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH FPT', 'Xây dựng website bán giày thể thao', 'Xây dựng website khách hàng có thể mua và thanh toán giày, admin có thể quản lý sản phẩm giày', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(116, 'DH52110593', 'Lê Tôn Bảo', 'D21_TH13', '0949965772', 'DH52110593@student.stu.edu.vn', 'Ứng dụng trên Web', '40', 'NGUYỄN NGỌC LÂM', 'HỒ ĐÌNH KHẢ', 'Thạc sĩ', 'ĐH FPT', 'Xây dựng website bán máy vi tính', 'Xây dựng website khách hàng có thể mua và thanh toán máy vi tính, có cho phép trả góp, admin có thể quản lý sản phẩm máy vi tính và phụ kiện', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(117, 'DH52110553', 'Mai Trần Duy Anh', 'D21_TH13', '0947657637', 'DH52110553@student.stu.edu.vn', 'Ứng dụng trên Web', '40', 'NGUYỄN NGỌC LÂM', 'HỒ ĐÌNH KHẢ', 'Thạc sĩ', 'ĐH FPT', 'Xây dựng website bán máy vi tính', 'Xây dựng website khách hàng có thể mua và thanh toán máy vi tính, có cho phép trả góp, admin có thể quản lý sản phẩm máy vi tính và phụ kiện', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(118, 'DH52110793', 'Trịnh Phát Đạt', 'D21_TH08', '0977336644', 'DH52110793@student.stu.edu.vn', 'Ứng dụng trên Web', '41', 'NGUYỄN NGỌC LÂM', 'TRỊNH THANH DUY', 'Thạc sĩ', 'ĐH FPT', 'Xây dựng website bán áo thun', 'Xây dựng website cho khách hàng có thể mua áo thun online, cho phép đặt áo thun theo yêu cầu, admin có thể quản lý áo thun', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(119, 'DH52110935', 'Nguyễn Đình Hòa', 'D21_TH13', '0888254294', 'DH52110935@student.stu.edu.vn', 'Ứng dụng trên Web', '42', 'NGUYỄN NGỌC LÂM', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH FPT', 'Xây dựng website bán điện thoại di động', 'Xây dựng website khách hàng có thể mua và thanh toán điện thoại di động, có cho phép trả góp, admin có thể quản lý sản phẩm điện thoại di động về màu sắc, giá tiền', 45, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(120, 'DH52111637', 'Nguyễn Đăng Quyền', 'D21_TH10', '0815804376', 'DH52111637@student.stu.edu.vn', 'Ứng dụng trên Web', '43', 'NGUYỄN NGỌC LÂM', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH FPT', 'Xây dựng website bán điện thoại di động', 'Xây dựng website khách hàng có thể mua và thanh toán điện thoại di động, có cho phép trả góp, admin có thể quản lý sản phẩm điện thoại di động về màu sắc, giá tiền', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(121, 'DH52110857', 'Nguyễn Đăng Hải', 'D21_TH08', '0909523075', 'DH52110857@student.stu.edu.vn', 'Ứng dụng trên Mobile', '50', 'NGUYỄN HỒNG BỬU LONG', 'ĐOÀN TRÌNH DỤC', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng ứng dụng mobile đặt vé xe khách', 'Đề tài xây dựng ứng dụng mobile đặt vé xe khách nhằm phát triển nền tảng trên iOS/Android giúp người dùng tìm tuyến, so sánh giá/giờ chạy, chọn chỗ ngồi, đặt và thanh toán vé nhanh chóng. Ứng dụng hỗ trợ vé điện tử (QR), thông báo nhắc giờ khởi hành, theo dõi trạng thái chuyến đi theo thời gian thực (nếu nhà xe hỗ trợ), quản lý lịch sử đặt vé và chương trình tích điểm. Phía nhà xe có mô-đun quản trị chuyến/ghế/tồn vé, đối soát doanh thu và báo cáo.', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(122, 'DH52111843', 'Bùi Hữu Thuận', 'D21_TH07', '#N/A', '#N/A', 'Ứng dụng Java', '54', 'NGUYỄN HỒNG BỬU LONG', 'BÙI NHẬT BẰNG', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng website bán cà phê trực tuyến', 'Đề tài  Xây dựng website bán cà phê trực tuyến nhằm phát triển nền tảng thương mại điện tử chuyên cung cấp hạt/ bột cà phê, capsule, dụng cụ pha và quà tặng. Website cho phép duyệt theo loại hạt–mức rang–cách pha, xem ghi chú hương vị, nguồn gốc & truy xuất lô, chọn mức xay, thêm giỏ hàng và thanh toán an toàn. Hệ thống tích hợp gói đăng ký (subscription) giao định kỳ, mã giảm giá/điểm thưởng, theo dõi đơn hàng, đánh giá sản phẩm, gợi ý pha chế & công thức, cùng quản trị tồn kho–đơn hàng–khuyến mãi và kết nối đơn vị vận chuyển.', 30, 'Được tiếp tục', 'Sinh viên đã đi làm nên ít thời gian, SV hứa sẽ  cố gắng tập trung hơn.', '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(123, 'DH52111321', 'Trần Hoàng Minh', 'D21_TH07', '#N/A', '#N/A', 'Ứng dụng trên Web', '54', 'NGUYỄN HỒNG BỬU LONG', 'BÙI NHẬT BẰNG', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng website bán cà phê trực tuyến', 'Đề tài  Xây dựng website bán cà phê trực tuyến nhằm phát triển nền tảng thương mại điện tử chuyên cung cấp hạt/ bột cà phê, capsule, dụng cụ pha và quà tặng. Website cho phép duyệt theo loại hạt–mức rang–cách pha, xem ghi chú hương vị, nguồn gốc & truy xuất lô, chọn mức xay, thêm giỏ hàng và thanh toán an toàn. Hệ thống tích hợp gói đăng ký (subscription) giao định kỳ, mã giảm giá/điểm thưởng, theo dõi đơn hàng, đánh giá sản phẩm, gợi ý pha chế & công thức, cùng quản trị tồn kho–đơn hàng–khuyến mãi và kết nối đơn vị vận chuyển.', 40, 'Được tiếp tục', 'Sinh viên đã đi làm nên ít thời gian, SV hứa sẽ  cố gắng tập trung hơn.', '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(124, 'DH51904876', 'Trần Đông Vi', 'D19_TH02', '#N/A', '#N/A', 'Ứng dụng trên Mobile', '84', 'NGUYỄN HỒNG BỬU LONG', 'NGUYỄN NGỌC LÂM', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng ứng dụng mobile hỗ trợ quản lý vận hành tòa nhà', 'Đề tài  Xây dựng ứng dụng mobile hỗ trợ quản lý vận hành tòa nhà nhằm phát triển nền tảng iOS/Android dành cho cư dân, ban quản lý và kỹ thuật. Ứng dụng cho phép tiếp nhận & xử lý yêu cầu cư dân (ticket/work order), quản lý bảo trì–bảo dưỡng định kỳ, đặt tiện ích (bể bơi, phòng gym, sân tennis…), quản lý khách/xe ra vào, thông báo–bản tin nội bộ, ghi chỉ số điện nước và phản ánh sự cố kèm hình ảnh.', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(125, 'DH52107697', 'Đinh Nguyễn Tuấn', 'D21_TH03', '0976588770', 'DH52107697@student.stu.edu.vn', 'Ứng dụng trên Mobile', '85', 'NGUYỄN HỒNG BỬU LONG', 'NGUYỄN LẠC AN THƯ', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng ứng dụng quản lý quan hệ khách hàng cho doanh nghiệp bán lẻ', 'Đề tài  Xây dựng ứng dụng quản lý quan hệ khách hàng (CRM) cho doanh nghiệp bán lẻ nhằm phát triển một nền tảng giúp doanh nghiệp theo dõi, phân tích và tối ưu hóa quá trình tương tác với khách hàng. Ứng dụng hỗ trợ quản lý thông tin khách hàng, lịch sử mua hàng, chăm sóc sau bán, và triển khai các chiến dịch marketing cá nhân hóa. Hệ thống hướng đến việc tăng doanh số, cải thiện trải nghiệm khách hàng và nâng cao hiệu quả vận hành của doanh nghiệp bán lẻ.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(126, 'DH51904519', 'Ngô Định Thế', 'D19_TH05', '#N/A', '#N/A', 'Ứng dụng trên Web', '77', 'NGUYỄN HỒNG BỬU LONG', 'NGUYỄN THỊ NGÂN HÀ', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng website bán quần áo nam nữ', 'Đề tài  Xây dựng website bán quần áo nam nữ nhằm phát triển nền tảng thương mại điện tử đáp ứng nhu cầu mua sắm thời trang đa dạng cho cả nam và nữ. Website cho phép duyệt danh mục theo bộ sưu tập/loại sản phẩm, lọc theo size–màu–chất liệu–giá, xem hướng dẫn chọn size, đánh giá sản phẩm, thêm giỏ hàng và thanh toán trực tuyến an toàn. Hệ thống hỗ trợ mã giảm giá, chương trình thành viên, theo dõi đơn hàng, đổi/trả, gợi ý phối đồ (lookbook) và quản trị tồn kho–đơn hàng–khuyến mãi.', 45, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(127, 'DH52111847', 'Lương Hiếu Thuận', 'D21_TH08', '0965629532', 'DH52111847@student.stu.edu.vn', 'Ứng dụng trên Web', '95', 'NGUYỄN HỒNG BỬU LONG', 'NGUYỄN TRỌNG NGHĨA', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng website bán sách điện tử trực tuyến', 'Đề tài  Xây dựng website bán sách điện tử trực tuyến hướng đến việc tạo ra một nền tảng thương mại điện tử chuyên cung cấp và phân phối sách điện tử (eBook). Hệ thống cho phép người dùng duyệt, tìm kiếm, mua và đọc sách trực tuyến một cách thuận tiện. Website tích hợp các tính năng như đánh giá sách, quản lý thư viện cá nhân, bảo vệ bản quyền nội dung và hỗ trợ thanh toán an toàn. Mục tiêu của dự án là mang đến trải nghiệm đọc hiện đại, linh hoạt và khuyến khích văn hóa đọc trong thời đại số.', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(128, 'DH52108517', 'Hoàng Hữu Lê Chinh', 'D21_TH05', '0898671245', 'DH52108517@student.stu.edu.vn', 'Ứng dụng trên Web', '99', 'NGUYỄN HỒNG BỬU LONG', 'HỒ ĐÌNH KHẢ', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng website đặt lịch khám bệnh trực tuyến', 'Đề tài  Xây dựng website đặt lịch khám bệnh trực tuyến nhằm phát triển nền tảng giúp bệnh nhân dễ dàng tìm kiếm cơ sở y tế, bác sĩ phù hợp và đặt lịch khám nhanh chóng, tiện lợi qua internet. Hệ thống cho phép quản lý lịch hẹn, gửi thông báo nhắc lịch tự động, lưu trữ hồ sơ khám bệnh và hỗ trợ thanh toán trực tuyến. Website hướng đến việc tối ưu hóa quy trình khám chữa bệnh, giảm thời gian chờ đợi và nâng cao chất lượng dịch vụ y tế.', 35, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(129, 'DH52111245', 'Võ Thành Long', 'D21_TH10', '0937369772', 'DH52111245@student.stu.edu.vn', 'Ứng dụng trên Web', '100', 'NGUYỄN HỒNG BỬU LONG', 'HUỲNH QUANG ĐỨC', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng website bán sách trực tuyến', 'Đề tài  Xây dựng website bán sách trực tuyến nhằm phát triển nền tảng thương mại điện tử chuyên cung cấp sách giấy/ebook đa thể loại. Website cho phép duyệt theo danh mục–NXB–tác giả, tìm kiếm nhanh, lọc theo giá/đánh giá/định dạng, xem trích đoạn, thêm giỏ hàng và thanh toán an toàn. Hệ thống hỗ trợ mã giảm giá, chương trình thành viên, gợi ý cá nhân hóa, danh sách yêu thích, theo dõi đơn hàng, đánh giá & bình luận. Phía quản trị có quản lý tồn kho–đơn hàng–khuyến mãi, nhập liệu ISBN, đồng bộ vận chuyển và báo cáo doanh thu.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(130, 'DH52111682', 'Lê Nguyễn Trọng Tài', 'D21_TH14', '#N/A', '#N/A', 'Ứng dụng trên Web', '104', 'NGUYỄN HỒNG BỬU LONG', 'KHUẤT BÁ DUY LÂM', 'Tiến sĩ', 'ĐH KHTN', 'Xây dựng website bán cơ và phụ kiện bida', 'Đề tài  Xây dựng website bán cơ và phụ kiện bida nhằm phát triển một nền tảng thương mại điện tử chuyên cung cấp các sản phẩm liên quan đến bida như cơ, bi, bàn, găng tay, bao da và các phụ kiện khác. Website cho phép người dùng dễ dàng tìm kiếm, so sánh, đặt mua sản phẩm và theo dõi đơn hàng trực tuyến. Hệ thống tích hợp giỏ hàng, thanh toán trực tuyến, quản lý tồn kho và đánh giá sản phẩm. Mục tiêu của dự án là mang đến một kênh mua sắm tiện lợi, hiện đại và đáng tin cậy cho cộng đồng yêu thích bida.', 45, 'Được tiếp tục', 'Sinh viên đã đi làm nên ít thời gian, SV hứa sẽ  cố gắng tập trung hơn.', '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(131, 'DH52111700', 'Thái Tấn Tài', 'D21_TH09', '0353004163', 'DH52111700@student.stu.edu.vn', 'Ứng dụng trên Web', '7', 'NGUYỄN TRỌNG NGHĨA', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'ĐH CNSG', 'Hệ thống quản lý bàn và đặt món ăn nhà hàng', '- Dành cho nhân viên:\n+ Quản lý bàn: biết được số lượng bàn, tình trạng bàn, sức chứa của bàn, xử lý ghép bàn\n+ Quản lý đặt món: hỗ trợ khách hàng gọi món, xử lý yêu cầu hủy món, cập nhật phục vụ món\n- Dành cho khách hàng: giúp khách hàng tự tay gọi món', 45, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(132, 'DH52111863', 'Nguyễn Thị Minh Thư', 'D21_TH10', '097473170', 'DH52111863@student.stu.edu.vn', 'Ứng dụng trên Web', '7', 'NGUYỄN TRỌNG NGHĨA', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'ĐH CNSG', 'Hệ thống quản lý bàn và đặt món ăn nhà hàng', '- Dành cho nhân viên:\n+ Quản lý bàn: biết được số lượng bàn, tình trạng bàn, sức chứa của bàn, xử lý ghép bàn\n+ Quản lý đặt món: hỗ trợ khách hàng gọi món, xử lý yêu cầu hủy món, cập nhật phục vụ món\n- Dành cho khách hàng: giúp khách hàng tự tay gọi món', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(133, 'DH52111441', 'Nguyễn Thị Nhung', 'D21_TH09', '0359439628', 'DH52111441@student.stu.edu.vn', 'Ứng dụng trên Web', '35', 'NGUYỄN TRỌNG NGHĨA', 'HÀ ANH VŨ', 'Thạc sĩ', 'ĐH CNSG', 'Quản lý điểm sinh viên hệ tín chỉ', 'Admin\n+ Chức năng quản lý sinh viên: Quản lý hồ sơ, cập nhật và tra cứu thông tin sinh viên hỗ trợ trong hệ thống.\n+ Chức năng quản lý môn học: Quản lý danh sách môn học trong toàn chương trình đào tạo, bao gồm môn tiên quyết và môn bắt buộc.\n+  Chức năng quản lý điểm sinh viên: Cho phép giảng viên và admin nhập, chỉnh sửa, và xem điểm sinh viên theo từng lớp tín chỉ.\n+ Chức năng quản lý học phí: Tính học phí dựa trên số tín chỉ đăng ký; hỗ trợ thống kê, in báo cáo.\n+ Chức năng quản lý lớp: Quản lý danh sách lớp theo khoa, khóa học, hỗ trợ nhà trường tổ chức và theo dõi tình hình học tập của sinh viên theo từng lớp.\n+ Chức năng quản lý lớp tín chỉ: cho phép sinh viên học linh hoạt nhiều lớp khác nhau trong cùng học kỳ .\n+  Chức năng quản lý đăng ký lớp tín chỉ: Cho phép sinh viên đăng ký học phần theo học kỳ, dựa trên kế hoạch đào tạo và điều kiện tiên quyết; hỗ trợ tra mã môn học.\n+ Chức năng phân quyền người dùng: Phân chia quyền hạn giữa admin, giảng viên và sinh viên nhằm đảm bảo bảo mật và quản lý thông tin hiệu quả.\n+ Chức năng in danh sách lớp tín chỉ: Cho phép admin in, xuất file danh sách sinh viên theo từng lớp tín chỉ.\n+ Chức năng in bảng điểm: Hỗ trợ admin in báo cáo điểm tổng hợp từng hoặc học kỳ.\n+ Chức năng in học phí: Cho phép in báo cáo chi tiết học phí từng sinh viên, phục vụ đối chiếu và lưu trữ.\n+Chức năng in danh sách đăng ký lớp tín : thống kê và lưu trữ thông tin sinh viên đã đăng ký từng lớp tín chỉ trong học kỳ.\nSinh viên:\n+ Chức năng thông tin cá nhân: Cho phép sinh viên xem, cập nhật hồ sơ cá nhân trong hệ thống.\n+ Chức năng bảng điểm: Hiển thị kết quả học tập chi tiết theo từng học kỳ hoặc toàn khóa, giúp sinh viên theo dõi tiến độ học tập.\n+ Chức năng  đăng ký môn học: Sinh viên đăng ký môn học đúng tiến độ và số lượng tín chỉ theo quy định.\n+ Chức năng đổi mật khẩu: Giúp người dùng bảo vệ thông tin tài khoản và đảm bảo tính bảo mật hệ thống.\n+ Chức năng học phí:Tự động cập nhật học phí theo số tín chỉ; tự động thay đổi khi sinh viên thêm hoặc hủy môn học.\nGiảng viên:\n+ Chức năng môn học giảng dạy: Cho phép giảng viên theo dõi các môn học và lớp tín chỉ mà mình phụ trách.\n+ Chức năng  xem danh sách sinh viên: Giúp giảng viên và admin xem danh sách sinh viên theo từng lớp học phần.\n+ Chức năng nhập điểm: Giảng viên cập nhật, chỉnh sửa và gửi kết quả học tập của sinh viên về phòng đào tạo.\n+ Chức năng thời khóa biểu giảng viên: Hiển thị và quản lý lịch giảng dạy theo từng học kỳ cho giảng viên.', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(134, 'DH52107408', 'Trần Minh Tú', 'D21_TH02', '0772911890', 'DH52107408@student.stu.edu.vn', 'Ứng dụng trên Web', '144', 'NGUYỄN TRỌNG NGHĨA', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'Website hỗ trợ tìm kiếm và quản lý cho thuê phòng trọ', 'Mô tả đề tài: \nCác tính năng cốt lõi\n+ Đối với chủ trọ:\n- Đăng ký / đăng nhập\n- Đăng tin cho thuê (mô tả, hình ảnh, giá, địa chỉ...), xóa, chỉnh sửa.\n- Quản lý tình trạng phòng (trống, đã thuê, đang sửa chữa).\n- Quản lý hợp đồng, lịch sử cho thuê.\n+ Đối với người thuê:\n- Đăng ký / đăng nhập\n- Tìm kiếm, lọc phòng trọ theo khu vực, giá, tiện ích... .\n- Xem chi tiết phòng (ảnh, bản đồ, giá, mô tả, đánh giá).\n- Đặt thuê hoặc liên hệ nhanh với chủ trọ.\n- Đánh giá/review sau khi thuê.\n+ Đối với hệ thống admin\n- Quản lý tài khoản\n- Quản lý hồ sơ cá nhân (tên, số điện thoại, ảnh đại diện).\n- Quản lý tin đăng (kiểm duyệt)\n- CSDL\n+ Các tính năng nâng cao\n- Thanh toán online (Momo, VNPay, Paypal).\n- Quản lý hợp đồng điện tử.\n- Thông báo qua email/SMS.\n- Dashboard thống kê doanh thu cho chủ trọ.\n- Tích hợp Google Maps API để hiển thị vị trí phòng.', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(135, 'DH52101465', 'Quách Thái Hùng', 'D21_TH02', '0947252595', 'DH52101465@student.stu.edu.vn', 'Ứng dụng trên Web', '144', 'NGUYỄN TRỌNG NGHĨA', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'Website hỗ trợ tìm kiếm và quản lý cho thuê phòng trọ', 'Mô tả đề tài: \nCác tính năng cốt lõi\n+ Đối với chủ trọ:\n- Đăng ký / đăng nhập\n- Đăng tin cho thuê (mô tả, hình ảnh, giá, địa chỉ...), xóa, chỉnh sửa.\n- Quản lý tình trạng phòng (trống, đã thuê, đang sửa chữa).\n- Quản lý hợp đồng, lịch sử cho thuê.\n+ Đối với người thuê:\n- Đăng ký / đăng nhập\n- Tìm kiếm, lọc phòng trọ theo khu vực, giá, tiện ích... .\n- Xem chi tiết phòng (ảnh, bản đồ, giá, mô tả, đánh giá).\n- Đặt thuê hoặc liên hệ nhanh với chủ trọ.\n- Đánh giá/review sau khi thuê.\n+ Đối với hệ thống admin\n- Quản lý tài khoản\n- Quản lý hồ sơ cá nhân (tên, số điện thoại, ảnh đại diện).\n- Quản lý tin đăng (kiểm duyệt)\n- CSDL\n+ Các tính năng nâng cao\n- Thanh toán online (Momo, VNPay, Paypal).\n- Quản lý hợp đồng điện tử.\n- Thông báo qua email/SMS.\n- Dashboard thống kê doanh thu cho chủ trọ.\n- Tích hợp Google Maps API để hiển thị vị trí phòng.', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(136, 'DH52101979', 'Phạm Thị Ánh Hồng', 'D21_TH02', '0976747106', 'DH52101979@student.stu.edu.vn', 'Ứng dụng trên Web', '145', 'NGUYỄN TRỌNG NGHĨA', 'TRỊNH THANH DUY', 'Thạc sĩ', 'ĐH CNSG', 'Hệ thống web quản lý sân và dịch vụ cầu lông', 'Hệ thống web đặt sân cầu lông tích hợp bán hàng, dịch vụ đan vợt, thanh toán online và vận chuyển, giúp số hóa hoạt động quản lý cho các câu lạc bộ cầu lông.   \n- Quản lý (Chủ sân/Admin):\nQuản lý sân bãi và lịch đặt, xử lý đổi/hủy lịch.\nQuản lý sản phẩm và dịch vụ, theo dõi đơn hàng, đơn đan vợt.\n- Khách hàng:\nĐặt sân trực tuyến, thanh toán online và nhận nhắc lịch.\nMua dụng cụ cầu lông và theo dõi giao hàng.\nĐặt dịch vụ đan vợt và theo dõi trạng thái xử lý.\n', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(137, 'DH52112079', 'Nguyễn Đình Vinh', 'D21_TH14', '0383731640', 'DH52112079@student.stu.edu.vn', '*', '168', 'NGUYỄN TRỌNG NGHĨA', 'VÕ XUÂN THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'Hệ thống tính tiền và quản lý doanh thu cho cửa hàng', '- Xây dựng hệ thống tính tiền và quản lý doanh thu cho cửa hàng, giúp tự động hóa quy trình bán hàng và thanh toán.\n- Cho phép nhân viên tạo đơn hàng, tính tổng tiền, in hóa đơn và lưu dữ liệu giao dịch.\n- Hỗ trợ quản lý theo dõi doanh thu, thống kê sản phẩm bán chạy và xuất báo cáo theo thời gian.', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(138, 'DH52110581', 'Nguyễn Ngọc Ân', 'D21_TH13', '0921266924', 'DH52110581@student.stu.edu.vn', 'Ứng dụng trên Web', '10', 'NGUYỄN MINH SANG', 'NGUYỄN NGỌC LÂM', 'Thạc sĩ', 'ĐH FPT', 'Website Quản Lý Nhân Sự Công Ty Sản Xuất Bao Bì Nhựa MANAPlastic Tích Hợp App Chấm Công', '- Xây dựng một trang web tập trung vào việc phát triển hệ thống quản lý nhân sự cho công ty viết bằng Angular (FE) và dùng Java Spring Boot (BE), hệ thống sẽ gồm có 4 role chính ( Admin, HR, Quản Lý Trực Tiếp, Nhân Viên) với các mục tiêu chính cho hệ thống bao gồm: quản lý tài khoản, chấm công ( có app chấm công ), lương, lịch làm việc, báo cáo, phân quyền chức năng ( Admin cũng có thể xem các thao tác trên hệ thống - Active Logs),...\nFE: Angular - BE: Spring Boot - App chấm công: Dart Flutter', 45, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(139, 'DH52110568', 'Phạm Minh Anh', 'D21_TH05', '0395168006', 'DH52110568@student.stu.edu.vn', 'Ứng dụng Java', '53', 'NGUYỄN MINH SANG', 'NGUYỄN NGỌC LÂM', 'Thạc sĩ', 'ĐH FPT', 'Website Quản Lý Nhân Sự Công Ty Sản Xuất Bao Bì Nhựa MANAPlastic Tích Hợp App Chấm Công', '- Xây dựng một trang web tập trung vào việc phát triển hệ thống quản lý nhân sự cho công ty viết bằng Angular (FE) và dùng Java Spring Boot (BE), hệ thống sẽ gồm có 4 role chính ( Admin, HR, Quản Lý Trực Tiếp, Nhân Viên) với các mục tiêu chính cho hệ thống bao gồm: quản lý tài khoản, chấm công ( có app chấm công ), lương, lịch làm việc, báo cáo, phân quyền chức năng ( Admin cũng có thể xem các thao tác trên hệ thống - Active Logs),...\nFE: Angular - BE: Spring Boot - App chấm công: Dart Flutter', 45, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(140, 'DH52111923', 'Đỗ Minh Trí', 'D21_TH10', '0704651788', 'DH52111923@student.stu.edu.vn', 'Ứng dụng trên Web', '55', 'NGUYỄN MINH SANG', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'ĐH FPT', 'Website Platform học trực tuyến (Online Course) với thương hiệu Learnary, \n', '- Xây dựng một nền tảng website bán khoá học với thương hiệu Learnary, đóng vai trò trung gian mang khóa học của người bán tới với học viên, với các chức năng chính như cho phép giảng viên đăng bán các khóa học, học viên tìm kiếm, mua, học các khóa học, đồng thời cũng có thể làm bài tập củng cố kiến thức sau khi học. Hệ thống gồm 3 vai trò chính (Người quản lý, Học Viên, Giảng Viên). \nFE: Next.js - BE:Express NodeJS', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(141, 'DH52111055', 'Trần Đức Huynh', 'D21_TH10', '0866714807', 'DH52111055@student.stu.edu.vn', 'Ứng dụng trên Web', '47', 'NGUYỄN MINH SANG', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'ĐH FPT', 'Website Platform học trực tuyến (Online Course) với thương hiệu Learnary, \n', '- Xây dựng một nền tảng website bán khoá học với thương hiệu Learnary, đóng vai trò trung gian mang khóa học của người bán tới với học viên, với các chức năng chính như cho phép giảng viên đăng bán các khóa học, học viên tìm kiếm, mua, học các khóa học, đồng thời cũng có thể làm bài tập củng cố kiến thức sau khi học. Hệ thống gồm 3 vai trò chính (Người quản lý, Học Viên, Giảng Viên). \nFE: Next.js - BE:Express NodeJS', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(142, 'DH52001688', 'Phạm Nhựt Linh', 'D20_TH02', '0794985963', 'DH52001688@student.stu.edu.vn', 'Ứng dụng trên Web', '51', 'NGUYỄN MINH SANG', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH FPT', 'Website Đặt vé xem phim', 'xây dựng 1 website đặt lịch khách sạn với 1 giao diện đơn giản hoá tối ưu thân thiện đối với người dùng, cho phép người dùng chọn và đặt phòng 1 cách nhanh gọn và nhận đc phản hồi email khi đã đặt thành công. Mục tiêu nhằm tăng số lượng khách và doanh thu cho người chủ và thuận tiện cho người dùng.\n\nFE: ReactJS, Clerk, Tailwindcsss. BE:Express Nodejs', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(143, 'DH52111293', 'Ong Văn Mến', 'D21_TH12', '0933331843', 'DH52111293@student.stu.edu.vn', 'Ứng dụng trên Web', '46', 'NGUYỄN MINH SANG', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH FPT', 'Website Đặt vé xem phim', 'xây dựng 1 website đặt lịch khách sạn với 1 giao diện đơn giản hoá tối ưu thân thiện đối với người dùng, cho phép người dùng chọn và đặt phòng 1 cách nhanh gọn và nhận đc phản hồi email khi đã đặt thành công. Mục tiêu nhằm tăng số lượng khách và doanh thu cho người chủ và thuận tiện cho người dùng.\n\nFE: ReactJS, Clerk, Tailwindcsss. BE:Express Nodejs', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(144, 'DH52111030', 'Nguyễn Quốc Huy', 'D21_TH09', '0933705051', 'DH52111030@student.stu.edu.vn', 'Ứng dụng trên Web', '141', 'NGUYỄN TRẦN PHÚC THỊNH', 'VÕ XUÂN THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website quản lý cho công ty logictics QH', 'xây dựng website quản lý dịch vụ giao hàng. Hỗ trợ đối tác gửi đơn, \nvà công ty phân phối nhân viên nhận đơn và giao hàng cho khách hàng', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(145, 'DH52108018', 'Nguyễn Quốc Thắng', 'D21_TH05', '0765688708', 'DH52108018@student.stu.edu.vn', 'Ứng dụng trên Web', '143', 'NGUYỄN TRẦN PHÚC THỊNH', 'HÀ ANH VŨ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website quản lý chuỗi phòng trọ và hỗ trợ người dùng thuê phòng trực tuyến', 'Xây dựng website quản lý chuỗi phòng trọ, quản lý việc thuê phòng\n và chi phí. Hỗ trợ người dùng tìm và thuê phòng trọ', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(146, 'DH52105659', 'Bạch Đức Phước', 'D21_TH03', '0866088087', 'DH52105659@student.stu.edu.vn', '*', '176', 'NGUYỄN TRẦN PHÚC THỊNH', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt phòng khách sạn trực tuyến', 'xây dựng website quản lý cho khách sạn và hỗ trợ đặt phòng khách sạn trực tuyến', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(147, 'DH52103727', 'Đào Duy Hoàng Vương', 'D21_TH03', '0983621649', 'DH52103727@student.stu.edu.vn', '*', '177', 'NGUYỄN TRẦN PHÚC THỊNH', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt phòng khách sạn trực tuyến', 'xây dựng website quản lý cho khách sạn và hỗ trợ đặt phòng khách sạn trực tuyến', NULL, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(148, 'DH52110640', 'Hà Thị Mỹ Châu', 'D21_TH05', '0394949891', 'DH52110640@student.stu.edu.vn', '*', '178', 'NGUYỄN TRẦN PHÚC THỊNH', 'HUỲNH QUANG ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website quản lý nhân sự cho hệ thống quán cafe Sài Gòn Xưa', 'Xây dựng website quản lý nhân viên và lịch làm việc của nhân viên\n cho hệ thống quán cafe', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(149, 'DH52000037', 'Đỗ Hoàng Dũng', 'D20_TH01', '0789140801', 'DH52000037@student.stu.edu.vn', NULL, NULL, 'NGUYỄN TRẦN PHÚC THỊNH', 'NGUYỄN TRỌNG NGHĨA', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán quần áo cho cửa hàng SomeHow', 'Xây dựng website quản lý quần áo và hỗ trợ khách hàng đặt \nmua quần áo trực tuyến cho cửa hàng Somehow', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(150, 'DH52105864', 'Mô Ham Mách A Ra Pát', 'D21_TH02', '0971050307', 'DH52105864@student.stu.edu.vn', NULL, NULL, 'NGUYỄN TRẦN PHÚC THỊNH', 'ĐOÀN TRÌNH DỤC', 'Thạc sĩ', 'ĐH CNSG', 'Nghiên cứu và ứng dụng thư viện NetCode  for game Objects để xây dựng một game  multiplayer trên \nnền tảng Unity', 'Tìm hiểu về thư viện NetCode for game Objects, xây dựng kịch bản game\n và hiện thực 1 game multiplayer trên nền tảng Unity', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(151, 'DH52106292', 'Phan Duy Tuấn', 'D21_TH04', '0327261528', 'DH52106292@student.stu.edu.vn', 'Ứng dụng .Net', '103', 'TRẦN QUỐC TRƯỜNG', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website gọi nước cà phê bằng mã QR tại quán', 'Xây dựng website bán hàng nước uống, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(152, 'DH52003835', 'Trần Đình Khoa', 'D20_TH05', '0707035451', 'DH52003835@student.stu.edu.vn', 'Ứng dụng trên Web', '108', 'TRẦN QUỐC TRƯỜNG', 'HUỲNH QUANG ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Website bán giày', 'Xây dựng website bán hàng giày  , xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(153, 'DH51904209', 'Nguyễn Thị Hồng Oanh', 'D19_TH04', '#N/A', '#N/A', 'Ứng dụng trên Web', '115', 'TRẦN QUỐC TRƯỜNG', 'NGUYỄN TRẦN PHÚC THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'Website bán nến thơm và tinh dầu', 'Xây dựng website bán hàng tinh dầu, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(154, 'DH51903427', 'Lương Ngọc Hải Đăng', 'D19_TH04', '#N/A', '#N/A', 'Ứng dụng trên Web', '120', 'TRẦN QUỐC TRƯỜNG', 'HÀ ANH VŨ', 'Thạc sĩ', 'ĐH CNSG', 'Website bán quần áo', 'Xây dựng website bán hàng quần áo, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(155, 'DH52106187', 'Tạ Tương Hiếu', 'D21_TH04', '#N/A', '#N/A', 'Ứng dụng trên Web', '126', 'TRẦN QUỐC TRƯỜNG', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH CNSG', 'Web bán quần áo', 'Xây dựng website bán hàng quần áo, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(156, 'DH52105093', 'Nguyễn Hoàng Huy', 'D21_TH04', '#N/A', '#N/A', 'Ứng dụng trên Web', '126', 'TRẦN QUỐC TRƯỜNG', 'NGUYỄN NGỌC LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Website bán giày', 'Xây dựng website bán hàng giày, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(157, 'DH52003592', 'Nguyễn Khải Minh', 'D20-TH02', '#N/A', '#N/A', 'Ứng dụng trên Web', '127', 'TRẦN QUỐC TRƯỜNG', 'KHUẤT BÁ DUY LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Website xây dựng hệ thống đặt đồ ăn trực tuyến', 'Xây dựng website bán hàng món ăn vặt, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(158, 'DH52104857', 'Lê Thị Đa Lin', 'D21_TH04', '0374423479', 'DH52104857@student.stu.edu.vn', 'Ứng dụng trên Web', '134', 'TRẦN QUỐC TRƯỜNG', 'TRẦN VĂN HÙNG', 'Thạc sĩ', 'ĐH CNSG', 'Website bán bánh', 'Xây dựng website bán hàng bánh ngọt, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(159, 'DH52110836', 'Nguyễn Hồng Gấm', 'D21_TH06', '0775160497', 'DH52110836@student.stu.edu.vn', 'Ứng dụng trên Web', '152', 'TRẦN QUỐC TRƯỜNG', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH CNSG', 'Website bán hoa tươi', 'Xây dựng website bán hàng hoa tươi, xây dựng giỏ hàng và các chức năng cơ bản của thương mại điện tử', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(160, 'DH52113777', 'Huỳnh Xuân Thọ', 'D21_TH12', '', 'DH52113777@student.stu.edu.vn', 'Ứng dụng .Net', '52', 'NGUYỄN THANH TÙNG', 'HUỲNH QUANG ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán hàng điện máy', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(161, 'DH52105346', 'Lê Nguyễn Thành Vũ', 'D21_TH02', '0763163435', 'DH52105346@student.stu.edu.vn', 'Ứng dụng .Net', '19', 'NGUYỄN THANH TÙNG', 'HÀ ANH VŨ', 'Thạc sĩ', 'ĐH CNSG', 'Xây  dựng Website bán hàng nội thất', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', 35, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(162, 'DH52100514', 'Trần Quốc Nam', 'D21_TH04', '0778663123', 'DH52100514@student.stu.edu.vn', 'Ứng dụng .Net', '62', 'NGUYỄN THANH TÙNG', 'NGUYỄN NGỌC LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website quản lý kho', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(163, 'DH52110800', 'Nguyễn Võ Hoàng Hải Đăng', 'D21_TH14', '02837713095', 'DH52110800@student.stu.edu.vn', 'Ứng dụng .Net', '66', 'NGUYỄN THANH TÙNG', 'HOÀNG KHUÊ', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng game \"Kẻ bị bỏ lại\"', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', 35, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(164, 'DH52111823', 'Võ Thị Tho', 'D21_TH10', '0969747148', 'DH52111823@student.stu.edu.vn', 'Ứng dụng .Net', '71', 'NGUYỄN THANH TÙNG', 'BÙI NHẬT BẰNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website quản lý cửa hàng tiện lợi', 'Tìm hiểu nội dung game. Phân tích và thiết kế game. Hiện thực game .', 35, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(165, 'DH51801379', 'Ngô Minh Đạt', 'D18_TH01', '0792170819', 'DH51801379@student.stu.edu.vn', 'Ứng dụng .Net', '72', 'NGUYỄN THANH TÙNG', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán vé máy bay', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(166, 'DH51901588', 'Trần Thanh Duy', 'D19_TH05', '#N/A', '#N/A', 'Ứng dụng .Net', '72', 'NGUYỄN THANH TÙNG', 'KHUẤT BÁ DUY LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website quản lý khách sạn', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', 35, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(167, 'DH52005049', 'Đặng Ngọc Giàu', 'D20-TH09', '0834376555', 'DH52005049@student.stu.edu.vn', 'Ứng dụng trên Web', '80', 'NGUYỄN THANH TÙNG', 'NGUYỄN TRỌNG NGHĨA', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website bán quần áo', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', 30, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(168, 'DH52110677', 'Nguyễn Ngọc Doanh', 'D21_TH09', '0902904122', 'DH52110677@student.stu.edu.vn', '*', '164', 'NGUYỄN THANH TÙNG', 'VÕ XUÂN THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng Website quản lý chung cư', 'Tìm hiểu nghiệp vụ. Phân tích và thiết kế ứng dụng. Hiện thực ứng dụng.', 35, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(169, 'DH52108656', 'Võ Minh Thuận', 'D21_TH06', '0936452676', 'DH52108656@student.stu.edu.vn', 'Ứng dụng trên Web', '78', 'TRẦN VŨ HOÀNG ƯNG', 'TRẦN VĂN HÙNG', 'Thạc sĩ', ' Cty Codix', 'Xây dựng website bán vé sự kiện', 'Xây dựng ứng dụng web cho phép nhà tổ chức các sự kiện đăng ký, bán vé cho người xem', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(170, 'DH52111495', 'Phạm Hồng Phong', 'D21_TH10', '#N/A', '#N/A', 'Ứng dụng trên Web', '79', 'TRẦN VŨ HOÀNG ƯNG', 'BÙI NHẬT BẰNG', 'Thạc sĩ', ' Cty Codix', 'WEBSITE tin tức', NULL, 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(171, 'DH52111258', 'Trần Tấn Lộc', 'D21_TH10', '0332345957', 'DH52111258@student.stu.edu.vn', 'Ứng dụng trên Web', '81', 'TRẦN VŨ HOÀNG ƯNG', 'TRẦN THỊ HỒNG VÂN', 'Thạc sĩ', ' Cty Codix', 'Xây dựng website bán quần áo', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm quần áo', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(172, 'DH52005068', 'Nguyễn Thanh Danh', 'D20_TH09', '0798621883', 'DH52005068@student.stu.edu.vn', 'Ứng dụng trên Web', '82', 'TRẦN VŨ HOÀNG ƯNG', 'NGUYỄN THỊ NGÂN HÀ', 'Thạc sĩ', ' Cty Codix', 'Xây dựng website bán chậu cây cảnh', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm chậu cảnh', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(173, 'DH52106608', 'Đỗ Quang Vinh', 'D21_TH03', '0708738019', 'DH52106608@student.stu.edu.vn', 'Ứng dụng trên Web', '86', 'TRẦN VŨ HOÀNG ƯNG', 'NGUYỄN TRỌNG NGHĨA', 'Thạc sĩ', ' Cty Codix', 'Xây dựng ứng dụng website kết nối và quản lý cộng đồng cầu lông', 'Xây dựng ứng dụng website kết nối và quản lý cộng đồng cầu lông', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(174, 'DH52002358', 'Vương Tiến Hùng', 'D20_TH05', '0968189572', 'DH52002358@student.stu.edu.vn', 'Ứng dụng trên Web', '89', 'TRẦN VŨ HOÀNG ƯNG', 'ĐOÀN TRÌNH DỤC', 'Thạc sĩ', ' Cty Codix', 'Xây dựng website bán quần áo, phụ kiện', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm quần áo, phụ kiện', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(175, 'DH52002187', 'Lê Văn Nam', 'D20_TH03', '#N/A', '#N/A', 'Ứng dụng trên Web', '90', 'TRẦN VŨ HOÀNG ƯNG', 'TRẦN QUỐC TRƯỜNG', 'Thạc sĩ', ' Cty Codix', 'Xây dựng website bán giày', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm giày', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(176, 'DH52111845', 'Lâm Gia Thuận', 'D21-TH13', '0931548545', 'DH52111845@student.stu.edu.vn', 'Ứng dụng trên Web', '91', 'TRẦN VŨ HOÀNG ƯNG', 'NGUYỄN TRƯỜNG AN', 'Thạc sĩ', ' Cty Codix', 'Xây dựng website bán quần áo', 'Xây dựng ứng dụng web cho phép shop đăng bán sản phẩm quần áo', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(177, 'DH52110561', 'Nguyễn Lan Anh', 'D21_TH11', '0329186138', 'DH52110561@student.stu.edu.vn', 'Ứng dụng trên Mobile', '14', 'LƯƠNG AN VINH', 'ĐOÀN TRÌNH DỤC', 'Tiến sĩ', 'ĐH CNSG', 'Xây dựng app quản lý bán hàng cho quán cafe', 'Xây dựng ứng dụng quản lý bán hàng cho quán cà phê tập trung phát triển một ứng dụng di động hỗ trợ quán trong việc đặt món, quản lý đơn hàng và phục vụ khách hàng hiệu quả hơn. Ứng dụng cho phép người dùng lựa chọn món, thanh toán trực tuyến và giúp nhân viên dễ dàng theo dõi, xử lý đơn hàng nhanh chóng. Bên cạnh đó, hệ thống còn cung cấp chức năng thống kê doanh thu, giúp chủ quán quản lý hoạt động kinh doanh thuận tiện hơn và nâng cao chất lượng phục vụ.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(178, 'DH52111063', 'Nguyễn Mạnh Hưng', 'D21_TH11', '0328707978', 'DH52111063@student.stu.edu.vn', 'Ứng dụng trên Mobile', '21', 'LƯƠNG AN VINH', 'HOÀNG KHUÊ', 'Tiến sĩ', 'ĐH CNSG', 'Xây dựng hệ thống IoT quản lý vườn cây', 'Xây dựng hệ thống IoT cho vườn sầu riêng giúp tự động thu thập và điều khiển quy trình chăm sóc cây sầu riêng thông qua. Hệ thống dùng ESP32 kết nối các cảm biến đo độ ẩm đất, nhiệt độ đất, chỉ số NPK, pH, nhiệt độ không khí và ánh sáng để liên tục ghi nhận trạng thái môi trường. Dựa trên dữ liệu thời gian thực để gửi thông báo tưới nước hoặc tưới phân hợp lý. Một quản lý công việc (task) cho phép tạo, gán và theo dõi nhiệm vụ cho người thực hiện công việc, kèm thông báo và lịch thực hiện. Phần Mở rộng Cửa hàng tích hợp (shop) cung cấp  thuốc và phân.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(179, 'DH52111833', 'Lê Nguyễn Minh Thông', 'D21_TH08', '0769630210', 'DH52111833@student.stu.edu.vn', 'Ứng dụng trên Mobile', '23', 'LƯƠNG AN VINH', 'NGUYỄN HỒNG BỬU LONG', 'Tiến sĩ', 'ĐH CNSG', 'Xây dựng app tiếp thị bất động sản', 'Xây dựng ứng dụng tiếp thị bất động sản giúp hỗ trợ người dùng đăng tin cho thuê và mua bán bất động sản, cho phép xem và lọc danh sách theo khu vực, đường, phường, thành phố. Hệ thống tích hợp bản đồ tương tác hiển thị tọa độ định vị, thông tin liên hệ của người đăng, cùng tính năng tìm kiếm tự động theo đề xuất.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(180, 'DH52111560', 'Võ Hoàng Phúc', 'D21_TH08', '0767764470', 'DH52111560@student.stu.edu.vn', 'Ứng dụng trên Mobile', '23', 'LƯƠNG AN VINH', 'NGUYỄN HỒNG BỬU LONG', 'Tiến sĩ', 'ĐH CNSG', 'Xây dựng app tiếp thị bất động sản', 'Xây dựng ứng dụng tiếp thị bất động sản giúp hỗ trợ người dùng đăng tin cho thuê và mua bán bất động sản, cho phép xem và lọc danh sách theo khu vực, đường, phường, thành phố. Hệ thống tích hợp bản đồ tương tác hiển thị tọa độ định vị, thông tin liên hệ của người đăng, cùng tính năng tìm kiếm tự động theo đề xuất.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(181, 'DH51904163', 'Nguyễn Hoàng Yến Nhi', 'D19_TH04', '#N/A', '#N/A', 'Ứng dụng trên Web', '133', 'LƯƠNG AN VINH', 'HUỲNH QUANG ĐỨC', 'Tiến sĩ', 'ĐH CNSG', 'Xây dựng website bán vật dụng cho mèo', 'Xây dựng website bán vật dụng cho mèo. Website cho phép người dùng tìm kiếm, lựa chọn, đặt mua sản phẩm và theo dõi đơn hàng dễ dàng. Quản trị viên có thể quản lý sản phẩm, khách hàng và đơn hàng hiệu quả, đồng thời tối ưu hoá quy trình bán hàng. Thiết kế giao diện thân thiện, hỗ trợ tùy chỉnh, tìm kiếm và quản lý đơn hàng thuận tiện.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(182, 'DH51905502', 'Châu Bảo Nhân Trung', 'D19-TH09', '#N/A', '#N/A', 'Ứng dụng trên Web', '136', 'LƯƠNG AN VINH', 'TRẦN VĂN HÙNG', 'Tiến sĩ', 'ĐH CNSG', 'Xây dựng website bán nhạc cụ', 'Xây dựng websites bán nhạc cụ, cho người dùng có thể tiếp cận nhiều mặt hàng khác nhau,xem thông số chi tiết của mặt hàng,mua hàng trực tuyến,cho phép khách hàng đặt nhạc cụ theo yêu cầu như kiểu mẫu dáng đàn, loại gỗ, thiết bị điện tử đi kèm với nhạc cụ,sẽ thể hiện giá cả của từng option mà người dùng chọn khi đặt nhạc cụ theo yêu cầu.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(183, 'DH52005770', 'Trịnh Anh Đức', 'D20_TH11', '0582449063', 'DH52005770@student.stu.edu.vn', '*', '162', 'LƯƠNG AN VINH', 'NGUYỄN NGỌC LÂM', 'Tiến sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng web thi trắc nghiệm trực tuyến', 'Xây dựng website thi trắc nghiệm trực tuyến. Ứng dụng web thi trắc nghiệm trực tuyến giúp tổ chức và quản lý các nội dung cần ôn tập và kỳ kiểm tra dưới dạng trắc nghiệm cho học sinh, sinh viên. Người quản trị có thể dễ dàng tạo, sửa và phân loại câu hỏi theo chủ đề, mức độ. Hệ thống cho phép tạo bài kiểm tra, gán cho nhóm lớp cụ thể, và theo dõi kết quả. Học viên có thể ôn tập và để chuẩn bị trước kỳ kiểm tra chính thức.\n', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(184, 'DH52006159', 'Võ Đức Thanh', 'D20_TH09', NULL, NULL, NULL, NULL, 'LƯƠNG AN VINH', 'NGUYỄN THANH TÙNG', 'Tiến sĩ', 'ĐH CNSG', 'Xây dựng web cho thuê phòng', 'Xây dựng hệ thống hỗ trợ người dùng đăng tin, tìm kiếm và đặt thuê phòng trọ một cách thuận tiện. Website cho phép chủ phòng quản lý thông tin phòng, giá thuê, hình ảnh và trạng thái phòng còn trống. Người thuê có thể tìm kiếm phòng theo khu vực, giá và tiện ích, đồng thời liên hệ trực tiếp với chủ phòng. Hệ thống còn tích hợp chức năng đăng ký, đăng nhập, đánh giá và quản lý tài khoản người dùng. Mục tiêu là tạo ra một nền tảng hiệu quả, thân thiện, giúp kết nối nhanh chóng giữa người có nhu cầu thuê và cho thuê.', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(185, 'DH52113134', 'Mai Quang Vinh', 'D21_TH12', '0523756478', 'DH52113134@student.stu.edu.vn', 'Ứng dụng .Net', '83', 'HÀ ANH VŨ', 'NGUYỄN THANH TÙNG', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng học ngoại ngữ', '- Tìm hiểu nghiệp vụ ứng dụng học ngoại ngữ.\n- Tìm hiểu các công nghệ phát triển ứng dụng.\n- Xây dựng CSDL\n- Hiện thực ứng dụng ', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(186, 'DH52001243', 'Lưu Văn Hiếu', 'D20_TH05', '0977833079', 'DH52001243@student.stu.edu.vn', 'Ứng dụng trên Web', '88', 'HÀ ANH VŨ', 'NGUYỄN NGỌC LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán hoa tươi và đồ trang trí', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán hoa tươi và đồ trang trí.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(187, 'DH52003862', 'Trần Hữu Quang', 'D20_TH05', '0919402052', 'DH52003862@student.stu.edu.vn', 'Ứng dụng trên Web', '88', 'HÀ ANH VŨ', 'NGUYỄN NGỌC LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán hoa tươi và đồ trang trí', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán hoa tươi và đồ trang trí.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(188, 'DH51901190', 'Trần Quốc Đạt', 'D20_TH01', '#N/A', '#N/A', 'Ứng dụng .Net', '135', 'HÀ ANH VŨ', 'HUỲNH QUANG ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán vật tư điện lạnh', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán vật tư điện lạnh.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(189, 'DH52001367', 'Lâm Chí Minh', 'D20_TH01', '0924405798', 'DH52001367@student.stu.edu.vn', 'Ứng dụng .Net', '135', 'HÀ ANH VŨ', 'HUỲNH QUANG ĐỨC', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán vật tư điện lạnh', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán vật tư điện lạnh.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(190, 'DH52111615', 'Võ Minh Quân', 'D21_TH13', '0854381067', 'DH52111615@student.stu.edu.vn', 'Ứng dụng .Net', '158', 'HÀ ANH VŨ', 'VÕ XUÂN THỊNH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng ứng dụng hỗ trợ bệnh nhân ADHD', '- Tìm hiểu nghiệp vụ ứng dụng hỗ trợ bệnh nhân ADHD.\n- Tìm hiểu các công nghệ phát triển ứng dụng, AI.\n- Xây dựng CSDL\n- Hiện thực ứng dụng ', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(191, 'DH52106176', 'Nguyễn Minh Huy', 'D21_TH07', '0933881276', 'DH52106176@student.stu.edu.vn', '*', '180', 'HÀ ANH VŨ', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán đồ thể thao', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán đồ thể thao.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38');
INSERT INTO `temp_import` (`id`, `MSSV`, `HoTenSV`, `Lop`, `SDT`, `Email`, `HuongDeTai`, `Nhom`, `GVHD`, `GVPB`, `HocVi`, `NoiCongTac`, `TenDeTai`, `MoTa`, `Diem`, `TrangThai`, `GhiChu`, `created_at`, `updated_at`) VALUES
(192, 'DH52111174', 'Ngô Tuấn Kiệt', 'D21_TH08', '0849929007', 'DH52111174@student.stu.edu.vn', '*', '181', 'HÀ ANH VŨ', 'NGÔ XUÂN BÁCH', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website đặt phòng khách sạn', '- Tìm hiểu nghiệp vụ quản lý, đặt phòng của một khách sạn.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(193, 'DH52005912', 'Huỳnh Tấn Thiên Khôi', 'D20_TH07', '0917567680', 'DH52005912@student.stu.edu.vn', NULL, NULL, 'HÀ ANH VŨ', 'TRỊNH THANH DUY', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán điện thoại', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán điện thoại.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(194, 'DH52006618', 'Trần Minh Trung', 'D20_TH11', '0902480705', 'DH52006618@student.stu.edu.vn', NULL, NULL, 'HÀ ANH VŨ', 'KHUẤT BÁ DUY LÂM', 'Thạc sĩ', 'ĐH CNSG', 'Xây dựng website bán linh kiện máy tính', '- Tìm hiểu nghiệp vụ quản lý, bán hàng của một cửa hàng bán linh kiện máy tính.\n- Tìm hiểu các công nghệ phát triển website.\n- Xây dựng CSDL\n- Hiện thực website', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(195, 'DH51902585', 'Trần Đình Hiền', 'D19_TH07', '#N/A', '#N/A', 'Ứng dụng trên Web', '87', 'MAI VÂN PHƯƠNG VŨ', 'LƯƠNG AN VINH', 'Thạc sĩ', 'ĐH Sư phạm', 'Ứng dụng quản lý học tập \n(Student Portal)', 'Mục tiêu: Giúp sinh viên quản lý học phần, điểm số, lịch học.\nTính năng:\nĐăng nhập phân quyền (sinh viên, giảng viên, admin)\nQuản lý lịch học, điểm, tài liệu\nXuất file PDF bảng điểm', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(196, 'DH52108402', 'Nguyễn Trung Hiếu', 'D21_TH05', '0326780829', 'DH52108402@student.stu.edu.vn', 'Ứng dụng trên Web', '123', 'MAI VÂN PHƯƠNG VŨ', 'TRẦN THỊ NHƯ Ý', 'Thạc sĩ', 'ĐH Sư phạm', 'Hệ thống quản lý đặt lịch khám bệnh trực tuyến', 'Mục tiêu: Bệnh nhân đặt lịch, chọn bác sĩ, chuyên khoa.\nTính năng: \nĐăng nhập/đăng ký, xác thực qua email\nQuản lý lịch hẹn, gửi thông báo tự động\nGiao diện cho bác sĩ xem danh sách bệnh nhân\nỨng dụng: Phòng khám, bệnh viện nhỏ, phòng khám', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(197, 'DH52005677', 'Võ Chu Quốc Anh', 'D20_TH09', '#N/A', '#N/A', 'Ứng dụng trên Mobile', '129', 'MAI VÂN PHƯƠNG VŨ', 'DƯƠNG VĂN ĐEO', 'Thạc sĩ', 'ĐH Sư phạm', 'Ứng dụng quản lý tài chính cá nhân', 'Mục tiêu: Theo dõi chi tiêu, thu nhập, báo cáo.\nTính năng:\nGhi lại giao dịch hàng ngày\nBiểu đồ thu chi, lọc theo tháng\nXuất báo cáo CSV/PDF', 50, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(198, 'DH52100937', 'Nguyễn Xuân Long', 'D21_TH02', '0396285403', 'DH52100937@student.stu.edu.vn', 'Ứng dụng trên Web', '131', 'MAI VÂN PHƯƠNG VŨ', 'ĐOÀN TRÌNH DỤC', 'Thạc sĩ', 'ĐH Sư phạm', 'Ứng dụng quản lý quán cà phê/nhà hàng (POS System)', 'Mục tiêu: Hỗ trợ nhân viên ghi order, thanh toán, quản lý bàn.\nTính năng:\nQuản lý món ăn, hóa đơn, doanh thu theo ngày\nIn hóa đơn, kết nối máy in (nếu có)\nGiao diện quản lý cho admin', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(199, 'DH52101402', 'Nguyễn Văn Hoàng Long', 'D21_TH02', '0828599379', 'DH52101402@student.stu.edu.vn', 'Ứng dụng trên Web', '131', 'MAI VÂN PHƯƠNG VŨ', 'ĐOÀN TRÌNH DỤC', 'Thạc sĩ', 'ĐH Sư phạm', 'Ứng dụng quản lý quán cà phê/nhà hàng (POS System)', 'Mục tiêu: Hỗ trợ nhân viên ghi order, thanh toán, quản lý bàn.\nTính năng:\nQuản lý món ăn, hóa đơn, doanh thu theo ngày\nIn hóa đơn, kết nối máy in (nếu có)\nGiao diện quản lý cho admin', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(200, 'DH52112805', 'Võ Trọng Nghĩa', 'D21_TH12', '', 'DH52112805@student.stu.edu.vn', 'Ứng dụng trên Mobile', '151', 'MAI VÂN PHƯƠNG VŨ', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH Sư phạm', 'Ứng dụng quản lý kho hàng và đơn nhập xuất', 'Mục tiêu: Quản lý hàng tồn, đơn nhập/xuất, nhà cung cấp.\nTính năng:\nCRUD sản phẩm, thống kê số lượng tồn\nTạo đơn nhập/xuất, lọc theo thời gian\nBáo cáo doanh thu, biểu đồ trực quan', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(201, 'DH52112809', 'Mai Hoàng An', 'D21_TH12', '0972285275', 'DH52112809@student.stu.edu.vn', 'Ứng dụng trên Mobile', '151', 'MAI VÂN PHƯƠNG VŨ', 'LÊ THỊ MỸ DUNG', 'Thạc sĩ', 'ĐH Sư phạm', 'Ứng dụng quản lý kho hàng và đơn nhập xuất', 'Mục tiêu: Quản lý hàng tồn, đơn nhập/xuất, nhà cung cấp.\nTính năng:\nCRUD sản phẩm, thống kê số lượng tồn\nTạo đơn nhập/xuất, lọc theo thời gian\nBáo cáo doanh thu, biểu đồ trực quan', 60, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(202, 'DH52111358', 'Đồng Văn Nghĩa', 'D21_TH08', '0382149204', 'DH52111358@student.stu.edu.vn', '*', '182', 'MAI VÂN PHƯƠNG VŨ', 'NGUYỄN LẠC AN THƯ', 'Thạc sĩ', 'ĐH Sư phạm', 'Ứng dụng học từ vựng / ngôn ngữ\n(Language Learning App)', 'Mục tiêu: Giúp người dùng học và ôn tập từ mới mỗi ngày.\n\nTính năng:\n\nTạo danh sách từ vựng, flashcard\n\nQuiz trắc nghiệm, điểm số\n\nCấp độ học và gợi ý ôn lại', 40, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38'),
(203, 'DH52001630', 'Nguyễn Ngọc Thiện', 'D20_TH02', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'KHÔNG NHẬN ĐỀ TÀI', NULL, 0, 'Được tiếp tục', NULL, '2025-12-25 23:41:38', '2025-12-25 23:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `ThoiGian`
--

CREATE TABLE `ThoiGian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `TenSuKien` varchar(191) NOT NULL,
  `NgayBatDau` datetime NOT NULL,
  `NgayKetThuc` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ThoiGian`
--

INSERT INTO `ThoiGian` (`id`, `TenSuKien`, `NgayBatDau`, `NgayKetThuc`, `created_at`, `updated_at`) VALUES
(1, 'Chấm điểm 50%', '2025-12-20 09:43:00', '2025-12-28 09:43:00', '2025-12-25 23:57:36', '2025-12-26 02:43:39'),
(2, 'Chấm điểm phản biện', '2025-12-24 08:41:00', '2025-12-25 08:41:00', '2025-12-25 23:58:28', '2025-12-26 01:41:46'),
(3, 'Chấm điểm hướng dẫn', '2025-12-17 14:44:00', '2026-01-08 14:44:00', '2025-12-25 23:58:50', '2025-12-26 07:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `thuky`
--

CREATE TABLE `thuky` (
  `MaTK` varchar(20) NOT NULL,
  `Ho_va_Ten` varchar(120) NOT NULL,
  `email` varchar(191) NOT NULL,
  `sdt` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role` enum('SinhVien','GiangVien','ThuKy') NOT NULL DEFAULT 'SinhVien',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'KHUU NGOC THANH PHUONG', 'thanhphuongkhuu@gmail.com', NULL, '$2y$12$q1fPVMszYEU8b2ITS2jcAu1cjWCeYsQIvqsWHUJJfnZOw5RQdtMry', 'ThuKy', NULL, '2025-10-09 09:22:49', '2025-10-09 09:22:49'),
(2, 'Bui Mai Tram Anh', 'dh52200319@student.stu.edu.vn', NULL, '$2y$12$d9fP2nFpiQ/QnMW5FiALq.7OiybALQnG/Pn672jzTZgFbX/ax531y', 'ThuKy', '4wRn2elEtpdpGRkqZdFwXV1wnXT4dpLUFv3HodeRQgPPfs3Pui0JUUW94PK5', '2025-10-10 08:57:57', '2025-10-10 08:57:57'),
(3, 'NGUYỄN TRẦN PHÚC THỊNH', 'thinh.nguyentranphuc@stu.edu.vn', NULL, '$2y$12$Fmr1fZ047nUFK0H3F/3GTutMzahtC3TPFEiqUDFZ9QWwAIbgBOKW.', 'GiangVien', NULL, '2025-12-25 23:30:13', '2025-12-25 23:30:13'),
(4, 'NGUYỄN THƯỜNG KIỆT', 'kiet.nguyenthuong@stu.edu.vn', NULL, '$2y$12$GVwKkcRwYJ..pLS3kaIGJ.8TgLatJA4DT8wLNDB7ZqNc9DQ1agAZC', 'GiangVien', NULL, '2025-12-25 23:30:13', '2025-12-25 23:30:13'),
(5, 'LÊ THỊ MỸ DUNG', 'dung.lethimy@stu.edu.vn', NULL, '$2y$12$8s1MlkcgQP3KGTqp6TXEuOj0YCoJy5cRexxkAKZJ1faqUPMo/YCk6', 'GiangVien', NULL, '2025-12-25 23:30:14', '2025-12-25 23:30:14'),
(6, 'TRỊNH THANH DUY', 'duy.trinhthanh@stu.edu.vn', NULL, '$2y$12$/P.xYgX/7x1mYdIcV9gRDeXCewUGMvmZq3Gk4nmV/jf4xRDwz3rSu', 'GiangVien', NULL, '2025-12-25 23:30:14', '2025-12-25 23:30:14'),
(7, 'HUỲNH QUANG ĐỨC', 'duc.huynhquang@stu.edu.vn', NULL, '$2y$12$D1JZtymsYfrJao4Gq5ey3.WYap7JplPE3yK00B7YzBnFxmXUa0KxO', 'GiangVien', NULL, '2025-12-25 23:30:14', '2025-12-25 23:30:14'),
(8, 'ĐOÀN TRÌNH DỤC', 'duc.doantrinh@stu.edu.vn', NULL, '$2y$12$kcLNOIk8cXDsjP.rUy8wz.H6pvsjMaEjFxhSz0N5f.r4OsyiuL8PS', 'GiangVien', NULL, '2025-12-25 23:30:14', '2025-12-25 23:30:14'),
(9, 'NGUYỄN TRỌNG NGHĨA', 'nghia.nguyentrong@stu.edu.vn', NULL, '$2y$12$Vj.VtIFCDRw4.dP1HhV9Mup42DfHkqWXN2JYAjLak4buTrFjIxXOO', 'GiangVien', NULL, '2025-12-25 23:30:15', '2025-12-25 23:30:15'),
(10, 'TRẦN VĂN HÙNG', 'hung.tranvan@stu.edu.vn', NULL, '$2y$12$ea7SFa43uYpvF4RBYvD01uCL441AyOTb1Uh.o2hrPTTOLkL1Dx6/6', 'GiangVien', NULL, '2025-12-25 23:30:15', '2025-12-25 23:30:15'),
(11, 'VÕ XUÂN THỊNH', 'thinh.voxuan@stu.edu.vn', NULL, '$2y$12$FWL7jGdxzjlXgdEm2mZyK.9i0vwsRVVZ.SrgaqUyol6v6izbirVR.', 'GiangVien', NULL, '2025-12-25 23:30:15', '2025-12-25 23:30:15'),
(12, 'NGUYỄN THỊ NGÂN HÀ', 'ha.nguyenthingan@stu.edu.vn', NULL, '$2y$12$pXFnY9Xq8u7qytKzCGJzvOVC48Fn5uxX853nOKKK1u2ApExrA9ZYu', 'GiangVien', NULL, '2025-12-25 23:30:15', '2025-12-25 23:30:15'),
(13, 'NGUYỄN MINH SANG', 'sang.nguyenminh@stu.edu.vn', NULL, '$2y$12$l/JKmkYwGMLsqgKbXJMIVuLpv2jd0swiCjU3hz5znOwJJ1amQPEaS', 'GiangVien', NULL, '2025-12-25 23:30:16', '2025-12-25 23:30:16'),
(14, 'HOÀNG KHUÊ', 'khue.hoang@stu.edu.vn', NULL, '$2y$12$4pXCKxGs2c7FhlUa2vRf2.omis6qzVlCWYVWDYTZYl4qAcboEueli', 'GiangVien', NULL, '2025-12-25 23:30:16', '2025-12-25 23:30:16'),
(15, 'KHUẤT BÁ DUY LÂM', 'lam.khuatbaduy@stu.edu.vn', NULL, '$2y$12$Woyn0YPGjPFwuqzT8J1pfutc07Yb95gBUqWLVNJv/ofQvHAcwDcCi', 'GiangVien', NULL, '2025-12-25 23:30:16', '2025-12-25 23:30:16'),
(16, 'MAI VÂN PHƯƠNG VŨ', 'vu.maivanphuong@stu.edu.vn', NULL, '$2y$12$mXDtEPGnN1hCYF4aJszEpODukfs09C8TdHIps38RqNR87nxR5NSzG', 'GiangVien', NULL, '2025-12-25 23:30:16', '2025-12-25 23:30:16'),
(17, 'NGUYỄN HỒNG BỬU LONG', 'long.nguyenhongbuu@stu.edu.vn', NULL, '$2y$12$chXZWovKwr2kXi53F/LXYekqsyj8r./hoI.A6zVhXiMeStUIK2xpC', 'GiangVien', NULL, '2025-12-25 23:30:17', '2025-12-25 23:30:17'),
(18, 'NGUYỄN THANH TÙNG', 'tung.nguyenthanh@stu.edu.vn', NULL, '$2y$12$z1A.9VmQmtAG7Xt4hoGHSO8iOfCdxwR9PmEE4w7tqpXriSfX/C7Va', 'GiangVien', NULL, '2025-12-25 23:30:17', '2025-12-25 23:30:17'),
(19, 'HỒ ĐÌNH KHẢ', 'kha.hodinh@stu.edu.vn', NULL, '$2y$12$NJYceJ8FrH1uGESK0AyrtetrAF7lWamUGcyV7Zyu0qOaV8A2AwwPW', 'GiangVien', NULL, '2025-12-25 23:30:17', '2025-12-25 23:30:17'),
(20, 'TRẦN VŨ HOÀNG ƯNG', 'ung.tranvuhoang@stu.edu.vn', NULL, '$2y$12$GjUHnYHMlebx4iVRZkT6YOOgNV8.LcElEA.cVFR9LQDE9eKSqJ/.2', 'GiangVien', NULL, '2025-12-25 23:30:18', '2025-12-25 23:30:18'),
(21, 'LƯƠNG AN VINH', 'vinh.luongan@stu.edu.vn', NULL, '$2y$12$D9LVwcJ2NK89kAgLcYmwaeaHbsarWpaEv3icI9qKpLDy83se5Xxni', 'GiangVien', NULL, '2025-12-25 23:30:18', '2025-12-25 23:30:18'),
(22, 'TRẦN THỊ NHƯ Ý', 'y.tranthinhu@stu.edu.vn', NULL, '$2y$12$t0mPcieDYGTySWtRTXHYceoCV9xSZBSil9HKIpTVX.4LwYTxWTPq6', 'GiangVien', NULL, '2025-12-25 23:30:18', '2025-12-25 23:30:18'),
(23, 'NGÔ XUÂN BÁCH', 'bach.ngoxuan@stu.edu.vn', NULL, '$2y$12$8wINFt8csxVi3r8xCxCwc.znLDnEuZIMu8CFUgzKtQQ4DiDe0uAoy', 'GiangVien', NULL, '2025-12-25 23:30:18', '2025-12-25 23:30:18'),
(24, 'NGUYỄN LẠC AN THƯ', 'thu.nguyenlacan@stu.edu.vn', NULL, '$2y$12$baJXB3UykStuYO5L6rjIg.0ZhscLDW9f8ORgy8cWaHFnPia7Gk6J.', 'GiangVien', NULL, '2025-12-25 23:30:19', '2025-12-25 23:30:19'),
(25, 'BÙI NHẬT BẰNG', 'bang.buinhat@stu.edu.vn', NULL, '$2y$12$uNRDthbs924w5R2Q5jhp2.9z/FZIFHrbGSnwEoMuyw7vOQOLSHAAW', 'GiangVien', NULL, '2025-12-25 23:30:19', '2025-12-25 23:30:19'),
(26, 'HÀ ANH VŨ', 'vu.haanh@stu.edu.vn', NULL, '$2y$12$1yJ.hT5Qdm.znTfS6PSAxuNFhB1vBrZlv/axG2TAT4DWf6pkVAjWi', 'GiangVien', NULL, '2025-12-25 23:30:19', '2025-12-25 23:30:19'),
(27, 'TRẦN THỊ HỒNG VÂN', 'van.tranthihong@stu.edu.vn', NULL, '$2y$12$xXO38KSgaKqKVjCD4ffbl.OEgHWm85kqcMv/e03jSdlrvtXdoByLe', 'GiangVien', NULL, '2025-12-25 23:30:19', '2025-12-25 23:30:19'),
(28, 'TRẦN QUỐC TRƯỜNG', 'truong.tranquoc@stu.edu.vn', NULL, '$2y$12$2qbFhycqHTkJ3lLzJRPOm.CHh7K/VO.BEdiQvDA5AaqX9Nv3x0cei', 'GiangVien', NULL, '2025-12-25 23:30:20', '2025-12-25 23:30:20'),
(29, 'LÊ TRIỆU NGỌC ĐỨC', 'duc.letrieungoc@stu.edu.vn', NULL, '$2y$12$PDefN4MpzX5FfUbnmQ2ktO8IRyHRIkoXbUjt9LlPsmedHU/WKy4ZS', 'GiangVien', NULL, '2025-12-25 23:30:20', '2025-12-25 23:30:20'),
(30, 'NGUYỄN NGỌC LÂM', 'lam.nguyenngoc@stu.edu.vn', NULL, '$2y$12$2e01Sf2UqBQ/AN1coRT.KeGdbUvj7RPczqogBtl6MOahu4j4APY2a', 'GiangVien', NULL, '2025-12-25 23:30:20', '2025-12-25 23:30:20'),
(31, 'NGUYỄN TRƯỜNG AN', 'an.nguyentruong@stu.edu.vn', NULL, '$2y$12$A0xFRgwLVR7ehmjcV5dWI.wcOZr4kvE1dhaEEiwcf/DshjTYOUMR6', 'GiangVien', NULL, '2025-12-25 23:30:20', '2025-12-25 23:30:20'),
(32, 'DƯƠNG VĂN ĐEO', 'deo.duongvan@stu.edu.vn', NULL, '$2y$12$rMiWK9ZwYxvWVqApVEFvwumAZUVTlDLV.CQJR.B1QQlgh3eDcT3qe', 'GiangVien', NULL, '2025-12-25 23:30:21', '2025-12-25 23:30:21'),
(33, 'Admin', 'admin123@gmail.com', NULL, '$2y$12$klTSyNbR6gxfVrOnkk9LaednCNh2AvOsIAMmD35xtYqAX5DRZdugS', 'ThuKy', NULL, '2026-01-06 04:13:26', '2026-01-06 04:13:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `chi_tiet_hoi_dong`
--
ALTER TABLE `chi_tiet_hoi_dong`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chi_tiet_hoi_dong_mahd_magv_unique` (`MaHD`,`MaGV`),
  ADD KEY `chi_tiet_hoi_dong_magv_foreign` (`MaGV`);

--
-- Indexes for table `DeTai`
--
ALTER TABLE `DeTai`
  ADD PRIMARY KEY (`MaDT`),
  ADD KEY `detai_magv_foreign` (`MaGV`),
  ADD KEY `detai_magvpb_foreign` (`MaGVPB`);

--
-- Indexes for table `diem_huong_dan`
--
ALTER TABLE `diem_huong_dan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diem_huong_dan_mssv_index` (`MSSV`);

--
-- Indexes for table `diem_phan_bien`
--
ALTER TABLE `diem_phan_bien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diem_phan_bien_mssv_index` (`MSSV`);

--
-- Indexes for table `GiangVien`
--
ALTER TABLE `GiangVien`
  ADD PRIMARY KEY (`MaGV`),
  ADD UNIQUE KEY `giangvien_email_unique` (`email`),
  ADD UNIQUE KEY `giangvien_user_id_unique` (`user_id`);

--
-- Indexes for table `hoi_dong`
--
ALTER TABLE `hoi_dong`
  ADD PRIMARY KEY (`MaHD`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `SinhVien`
--
ALTER TABLE `SinhVien`
  ADD PRIMARY KEY (`MSSV`),
  ADD UNIQUE KEY `sinhvien_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `sinhvien_email_unique` (`email`),
  ADD KEY `sinhvien_giang_vien_huong_dan_foreign` (`Giang_vien_huong_dan`),
  ADD KEY `sinhvien_madt_foreign` (`MaDT`);

--
-- Indexes for table `temp_import`
--
ALTER TABLE `temp_import`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ThoiGian`
--
ALTER TABLE `ThoiGian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thuky`
--
ALTER TABLE `thuky`
  ADD PRIMARY KEY (`MaTK`),
  ADD UNIQUE KEY `thuky_email_unique` (`email`),
  ADD UNIQUE KEY `thuky_user_id_unique` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chi_tiet_hoi_dong`
--
ALTER TABLE `chi_tiet_hoi_dong`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `diem_huong_dan`
--
ALTER TABLE `diem_huong_dan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `diem_phan_bien`
--
ALTER TABLE `diem_phan_bien`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `temp_import`
--
ALTER TABLE `temp_import`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `ThoiGian`
--
ALTER TABLE `ThoiGian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chi_tiet_hoi_dong`
--
ALTER TABLE `chi_tiet_hoi_dong`
  ADD CONSTRAINT `chi_tiet_hoi_dong_magv_foreign` FOREIGN KEY (`MaGV`) REFERENCES `GiangVien` (`MaGV`) ON DELETE CASCADE,
  ADD CONSTRAINT `chi_tiet_hoi_dong_mahd_foreign` FOREIGN KEY (`MaHD`) REFERENCES `hoi_dong` (`MaHD`) ON DELETE CASCADE;

--
-- Constraints for table `DeTai`
--
ALTER TABLE `DeTai`
  ADD CONSTRAINT `detai_magv_foreign` FOREIGN KEY (`MaGV`) REFERENCES `GiangVien` (`MaGV`) ON DELETE SET NULL,
  ADD CONSTRAINT `detai_magvpb_foreign` FOREIGN KEY (`MaGVPB`) REFERENCES `GiangVien` (`MaGV`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `GiangVien`
--
ALTER TABLE `GiangVien`
  ADD CONSTRAINT `giangvien_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `SinhVien`
--
ALTER TABLE `SinhVien`
  ADD CONSTRAINT `sinhvien_giang_vien_huong_dan_foreign` FOREIGN KEY (`Giang_vien_huong_dan`) REFERENCES `GiangVien` (`MaGV`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvien_madt_foreign` FOREIGN KEY (`MaDT`) REFERENCES `DeTai` (`MaDT`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvien_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `thuky`
--
ALTER TABLE `thuky`
  ADD CONSTRAINT `thuky_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
