-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 23, 2024 lúc 12:21 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nghiencuukhoahoc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bangphancong`
--

CREATE TABLE `bangphancong` (
  `MAPHANCONG` int(11) NOT NULL,
  `MAHKNK` int(11) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `THOIGIANLAP` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bao_cao_ket_thuc_mon`
--

CREATE TABLE `bao_cao_ket_thuc_mon` (
  `MADANHGIAKETTHUC` int(11) NOT NULL,
  `MACHITIETPHANCONG` int(11) NOT NULL,
  `LANDANHGIA` int(11) DEFAULT NULL,
  `NGAYDANHGIA` date DEFAULT NULL,
  `NGAYBAOCAOKETTHUC` date DEFAULT NULL,
  `TRANG_THAI_DANG_KY` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bomon`
--

CREATE TABLE `bomon` (
  `MABOMON` int(11) NOT NULL,
  `MAKHOA` int(11) NOT NULL,
  `TENBOMON` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bomon`
--

INSERT INTO `bomon` (`MABOMON`, `MAKHOA`, `TENBOMON`) VALUES
(2, 1, 'Bộ Môn Công Nghệ Phần Mềm'),
(16, 11, 'Bộ môn Công nghệ thông tin'),
(18, 12, 'Ngoài trường'),
(19, 11, 'Bộ môn Cơ khí - Động lực'),
(20, 11, 'Bộ môn Điện - Điện tử');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietphancong`
--

CREATE TABLE `chitietphancong` (
  `MACHITIETPHANCONG` int(11) NOT NULL,
  `MAMONHOC` int(11) NOT NULL,
  `MAPHANCONG` int(11) NOT NULL,
  `MALOP` varchar(255) NOT NULL,
  `TONG_SO_GIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chon_khung`
--

CREATE TABLE `chon_khung` (
  `MAGV` varchar(255) NOT NULL,
  `MANAMHOC` int(11) NOT NULL,
  `MAKHUNG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucdanh`
--

CREATE TABLE `chucdanh` (
  `MACHUCDANH` int(11) NOT NULL,
  `TENCHUCDANH` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chucdanh`
--

INSERT INTO `chucdanh` (`MACHUCDANH`, `TENCHUCDANH`) VALUES
(1, 'Giảng viên cao cấp (Hạng I)'),
(2, 'Giảng viên chính (Hạng II)'),
(3, 'Giảng viên (Hạng III)'),
(4, 'Trợ Giảng'),
(5, 'Giảng viên Tập sự');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucvu`
--

CREATE TABLE `chucvu` (
  `MACHUCVU` int(11) NOT NULL,
  `TENCHUCVU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chucvu`
--

INSERT INTO `chucvu` (`MACHUCVU`, `TENCHUCVU`) VALUES
(1, 'Phó Trưởng Khoa'),
(2, 'Trưởng Bộ Môn'),
(3, 'Phó Trưởng Bộ Môn'),
(4, 'Giảng Viên Chính'),
(5, 'Giảng Viên'),
(6, 'Trưởng Khoa'),
(7, 'Bộ môn Công nghệ thông tin'),
(8, 'Phó Trưởng bộ môn CNTT'),
(9, 'Trưởng bộ môn CNTT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuongtrinhdaotao`
--

CREATE TABLE `chuongtrinhdaotao` (
  `MACHUONGTRINH` int(11) NOT NULL,
  `MABOMON` int(11) NOT NULL,
  `TENCHUONGTRINH` text DEFAULT NULL,
  `SO_QUYET_DINH` text DEFAULT NULL,
  `TRINH_DO` varchar(255) DEFAULT NULL,
  `TONG_SO_TIN_CHI` int(11) DEFAULT NULL,
  `MO_TA_HOC_KY` text DEFAULT NULL,
  `GHI_CHUONG_TRINH` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuongtrinhdaotao`
--

INSERT INTO `chuongtrinhdaotao` (`MACHUONGTRINH`, `MABOMON`, `TENCHUONGTRINH`, `SO_QUYET_DINH`, `TRINH_DO`, `TONG_SO_TIN_CHI`, `MO_TA_HOC_KY`, `GHI_CHUONG_TRINH`) VALUES
(1, 16, 'CÔNG NGHỆ THÔNG TIN', '3455/QĐ-ĐHTV, ngày 12 tháng 7 năm 2018', 'ĐẠI HỌC', 138, 'Chính quy', NULL),
(2, 19, 'Công nghệ ô tô', '        /QĐ – ĐHTV, ngày       tháng       năm 20', 'Đại học', 140, 'Chính quy', NULL),
(3, 19, 'Cơ khí chế tạo máy', '        /QĐ – ĐHTV, ngày       tháng       năm 20', 'Đại học', 140, 'Chính quy', NULL),
(4, 20, 'Điện công nghiệp', 'số: /QĐ – ĐHTV, ngày tháng năm 201', 'Đại học', 150, 'Chính quy', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyen_mon_giang_vien`
--

CREATE TABLE `chuyen_mon_giang_vien` (
  `MACMGV` int(11) NOT NULL,
  `MA_GV_CMGV` varchar(255) DEFAULT NULL,
  `MA_MON_CMGV` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuyen_mon_giang_vien`
--

INSERT INTO `chuyen_mon_giang_vien` (`MACMGV`, `MA_GV_CMGV`, `MA_MON_CMGV`) VALUES
(1, '99999', '39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `co_chuc_danh`
--

CREATE TABLE `co_chuc_danh` (
  `MACHUCDANH` int(11) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `THOIGIANNHAN` date DEFAULT NULL,
  `TRANGTHAI` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `co_chuc_danh`
--

INSERT INTO `co_chuc_danh` (`MACHUCDANH`, `MAGV`, `THOIGIANNHAN`, `TRANGTHAI`) VALUES
(1, '00245', '2024-07-08', 'Đang giữ chức danh'),
(1, '00254', '2024-07-09', 'Đang giữ chức danh'),
(1, '0122', '2024-08-08', 'Đang giữ chức danh'),
(1, '0123', '2024-08-14', 'Đang giữ chức danh'),
(1, '99997', '2024-09-20', 'Đang giữ chức danh'),
(1, '99999', '2024-06-30', 'Đang giữ chức danh'),
(2, '00249', '2024-07-09', 'Đang giữ chức danh'),
(2, '00250', '2024-07-08', 'Đang giữ chức danh'),
(3, '12705', '2024-07-08', 'Đang giữ chức danh'),
(5, '00248', '2024-07-08', 'Đang giữ chức danh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `co_ty_le`
--

CREATE TABLE `co_ty_le` (
  `MA_QUY_DOI` int(11) NOT NULL,
  `MA_LOAI_DANH_MUC` int(11) NOT NULL,
  `MA_LOAI_TAC_GIA` int(11) NOT NULL,
  `SO_TAC_GIA_THUOC_LOAI` int(11) DEFAULT NULL,
  `NHOM_CHIA_GIO` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `co_ty_le`
--

INSERT INTO `co_ty_le` (`MA_QUY_DOI`, `MA_LOAI_DANH_MUC`, `MA_LOAI_TAC_GIA`, `SO_TAC_GIA_THUOC_LOAI`, `NHOM_CHIA_GIO`) VALUES
(1, 1, 1, 0, 'Không'),
(1, 3, 1, 2, 'Không'),
(2, 1, 2, 0, '1'),
(2, 1, 3, 0, '1'),
(2, 3, 2, 0, '1'),
(2, 3, 3, 0, '1'),
(3, 1, 1, 0, 'Không'),
(3, 3, 1, 2, 'Không'),
(4, 1, 2, 2, 'Không'),
(4, 3, 2, 2, 'Không'),
(5, 1, 2, 1, 'Không'),
(5, 3, 2, 1, 'Không'),
(6, 1, 1, 0, '1'),
(6, 1, 3, 0, '1'),
(6, 3, 1, 1, '1'),
(6, 3, 3, 0, '1'),
(7, 1, 1, 0, 'Không'),
(7, 3, 1, 1, 'Không'),
(8, 1, 1, 0, '1'),
(8, 1, 2, 0, '1'),
(8, 1, 3, 0, '1'),
(8, 3, 1, 1, '1'),
(8, 3, 2, 0, '1'),
(8, 3, 3, 0, '1'),
(9, 2, 8, 0, 'Không'),
(10, 2, 1, 0, 'Không'),
(11, 2, 1, 0, 'Không'),
(12, 2, 1, 0, 'Không'),
(13, 2, 2, 0, '1'),
(13, 2, 3, 0, '1'),
(14, 5, 8, 0, 'Không'),
(15, 5, 8, 0, 'Không'),
(16, 5, 8, 0, 'Không'),
(17, 6, 8, 0, 'Không'),
(17, 7, 8, 0, 'Không'),
(18, 6, 8, 0, 'Không'),
(18, 7, 8, 0, 'Không'),
(19, 6, 8, 0, 'Không'),
(19, 7, 8, 0, 'Không'),
(20, 4, 6, 0, 'Không'),
(21, 4, 6, 0, 'Không'),
(22, 4, 6, 0, 'Không'),
(23, 4, 7, 0, '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dang_ky_thuc_hien_quy_doi`
--

CREATE TABLE `dang_ky_thuc_hien_quy_doi` (
  `MA_DANH_MUC` int(11) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `MANAMHOC` int(11) NOT NULL,
  `MA_LOAI_TAC_GIA` int(11) NOT NULL,
  `TEN_DE_TAI` varchar(255) NOT NULL,
  `SOGIOQUYDOI` int(11) DEFAULT NULL,
  `TRANG_THAI_DANG_KY` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmucquydoispkhcn`
--

CREATE TABLE `danhmucquydoispkhcn` (
  `MA_DANH_MUC` int(11) NOT NULL,
  `MA_LOAI_DANH_MUC` int(11) NOT NULL,
  `GIO_CHUAN` int(11) DEFAULT NULL,
  `NOI_DUNG_DANH_MUC` text DEFAULT NULL,
  `ISBN` varchar(50) DEFAULT NULL,
  `WOS_SCOUPUS` varchar(50) DEFAULT NULL,
  `HANG_WOS_SCOUPUS` varchar(10) DEFAULT NULL,
  `LOI_NHUAN` varchar(100) DEFAULT NULL,
  `DON_VI_TINH` varchar(50) DEFAULT NULL,
  `GIAI_THUONG` varchar(50) DEFAULT NULL,
  `XEP_HANG_QUARTILES` varchar(50) DEFAULT NULL,
  `NAM_THUC_HIEN` text DEFAULT NULL,
  `TRANG_THAI_DANH_MUC` varchar(100) DEFAULT NULL,
  `GHI_CHU_DANH_MUC` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmucquydoispkhcn`
--

INSERT INTO `danhmucquydoispkhcn` (`MA_DANH_MUC`, `MA_LOAI_DANH_MUC`, `GIO_CHUAN`, `NOI_DUNG_DANH_MUC`, `ISBN`, `WOS_SCOUPUS`, `HANG_WOS_SCOUPUS`, `LOI_NHUAN`, `DON_VI_TINH`, `GIAI_THUONG`, `XEP_HANG_QUARTILES`, `NAM_THUC_HIEN`, `TRANG_THAI_DANH_MUC`, `GHI_CHU_DANH_MUC`) VALUES
(1, 1, 195, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 1 Điều 11.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu có mã số ISBN'),
(2, 1, 98, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 1 Điều 11.', 'Không', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu không có mã số ISBN'),
(3, 1, 255, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 2 Điều 11.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu (proceedings) có mã số ISBN'),
(4, 1, 195, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 2 Điều 11.', 'Không', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu (proceedings) không có mã số ISBN'),
(5, 1, 98, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 3 Điều 11.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu/proceedings có mã số ISBN'),
(6, 1, 49, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 3 Điều 11.', 'Không', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu/proceedings không có mã số ISBN'),
(7, 1, 64, 'Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu hội nghị hội thảo chuyên ngành bên ngoài trường có phản biện, sử dụng ngôn ngữ tiếng Việt và các hội thảo hội nghị khác có chỉ số ISBN', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(8, 1, 234, 'Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu (proceedings) hội nghị hội thảo quốc tế xuất bản bằng ngôn ngữ tiếng Anh có phản biện, có chỉ số ISBN không thuộc danh mục WoS/Scopus.', 'Có', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(9, 1, 378, ' Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu (proceedings) hội nghị hội thảo quốc tế xuất bản bằng ngôn ngữ tiếng Anh, có chỉ số ISBN thuộc danh mục WoS/Scopus.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(10, 1, 0, 'Các báo cáo khoa học/ tham luận đăng toàn văn hoặc tóm tắt tại hội thảo/hội nghị đặc biệt khác phục vụ cho quan hệ đối ngoại, nâng cao hình ảnh và vị thế của Trường ĐHTV, thì các đơn vị được giao tổ chức/tham gia sự kiện phối hợp với Phòng KHCN để trình Hiệu trưởng xem xét, quyết định mức giờ chuẩn quy đổi cụ thể trước khi thực hiện.', 'Không rõ', 'Không rõ', 'Không rõ', 'Không rõ', 'Không rõ', 'Không rõ', 'Không rõ', '2024-2025', 'Đang áp dụng', 'Hiệu trưởng xem xét, quyết định mức giờ chuẩn quy đổi cụ thể trước khi thực hiện.'),
(11, 2, 195, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, không được tính điểm công trình của HĐGSNN.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Tạp chí khoa học Trường ĐHTV'),
(12, 2, 146, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, không được tính điểm công trình của HĐGSNN.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các tập chí khác'),
(13, 2, 235, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, được tính điểm công trình của HĐGSNN (tạp chí khoa học trong nước có uy tín).', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Tạp chí khoa học Trường ĐHTV'),
(14, 2, 195, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, được tính điểm công trình của HĐGSNN (tạp chí khoa học trong nước có uy tín).', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các tạp chí khác'),
(15, 2, 244, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước hoặc quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, không có trong danh mục WoS/Scopus', 'Có', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Tạp chí khoa học Trường ĐHTV'),
(16, 2, 195, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước hoặc quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, không có trong danh mục WoS/Scopus', 'Có', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các tạp chí khác'),
(17, 2, 420, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS/Scopus (tạp chí khoa học quốc tế uy tín), không được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không được xếp hạng'),
(18, 2, 855, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q1', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(19, 2, 642, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q2', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(20, 2, 535, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q3', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(21, 2, 428, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q4', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(22, 2, 1050, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q1', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(23, 2, 855, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q2', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(24, 2, 642, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q3', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(25, 2, 535, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q4', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(26, 2, 98, 'Các sản phẩm KH&CN công bố bởi viên chức (chỉ tính đối với tác giả thứ nhất hoặc tác giả chịu trách nhiệm trong trường hợp tác giả thứ nhất không phải viên chức của Trường ĐHTV, trường hợp đồng tác giả thứ nhất hoặc đồng tác giả chịu trách nhiệm thì chia đôi) được xuất bản bởi các tạp chí và nhà xuất bản quốc tế uy tín (nằm trong danh mục WoS/Scopus) mà tên đơn vị của Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations) thì được tính giờ nhiệm vụ NCKH là 98 giờ, đứng thứ nhất được tính 195 giờ.', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations)'),
(27, 2, 195, 'Các sản phẩm KH&CN công bố bởi viên chức (chỉ tính đối với tác giả thứ nhất hoặc tác giả chịu trách nhiệm trong trường hợp tác giả thứ nhất không phải viên chức của Trường ĐHTV, trường hợp đồng tác giả thứ nhất hoặc đồng tác giả chịu trách nhiệm thì chia đôi) được xuất bản bởi các tạp chí và nhà xuất bản quốc tế uy tín (nằm trong danh mục WoS/Scopus) mà tên đơn vị của Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations) thì được tính giờ nhiệm vụ NCKH là 98 giờ, đứng thứ nhất được tính 195 giờ.', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Trường ĐHTV đứng thứ nhất'),
(28, 3, 390, 'Bằng độc quyền Giải pháp hữu ích Việt Nam', 'Không', 'Không', 'Không', 'Không', 'Bằng', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các sản phẩm SHTT (đơn vị tính trên 01 bằng).'),
(29, 3, 488, 'Bằng độc quyền sáng chế (chuẩn patent Việt Nam)', 'Không', 'Không', 'Không', 'Không', 'Bằng', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các sản phẩm SHTT (đơn vị tính trên 01 bằng).'),
(30, 3, 585, 'Bằng độc quyền sáng chế chuẩn Patent của Mỹ/ của Châu Âu/ của Đông Bắc Á', 'Không', 'Không', 'Không', 'Không', 'Bằng', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các sản phẩm SHTT (đơn vị tính trên 01 bằng).'),
(31, 4, 295, 'Sách chuyên khảo', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(32, 4, 295, 'Giáo trình', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(33, 4, 295, 'Sách tham khảo', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(34, 4, 295, 'Sách hướng dẫn, tự điển chuyên ngành, sách bài tập, sách dịch', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(35, 4, 1500, 'Xuất bản sách phục vụ đào tạo do một nhà xuất bản có uy tín (top 10, thuộc danh mục WoS/Scopus) trên thế giới xuất bản', 'Có', 'Có', 'Top 10', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Top 10, thuộc danh mục WoS/Scopus'),
(36, 4, 342, 'Xuất bản sách phục vụ đào tạo do một nhà xuất bản có uy tín (top 1000, thuộc danh mục WoS/Scopus) trên thế giới xuất bản', 'Có', 'Có', 'Top 1000', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Top 1000, thuộc danh mục WoS/Scopus'),
(37, 4, 390, 'Xuất bản chương sách phục vụ đào tạo do một nhà xuất bản có uy tín (top 10, thuộc danh mục WoS/Scopus) trên thế giới xuất bản', 'Có', 'Có', 'Top 10', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Top 10, thuộc danh mục WoS/Scopus'),
(38, 4, 145, 'Xuất bản chương sách phục vụ đào tạo do một nhà xuất bản có uy tín (top 1000, thuộc danh mục WoS/Scopus) trên thế giới xuất bản', 'Có', 'Có', 'Top 1000', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Top 1000, thuộc danh mục WoS/Scopus'),
(39, 4, 115, 'Chương sách nằm trong bộ sách nâng cấp từ bài báo khoa học/báo cáo khoa học (tham luận toàn văn) đã công bố thuộc danh mục WoS/Scopus.', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(40, 5, 100, 'Viết thuyết minh nhiệm vụ KH&CN cấp quốc gia, cấp bộ và tương đương;', 'Không', 'Không', 'Không', 'Không', 'Thuyết minh', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(41, 5, 50, 'Viết thuyết minh nhiệm vụ KH&CN cấp tỉnh và tương đương;', 'Không', 'Không', 'Không', 'Không', 'Thuyết minh', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(42, 5, 40, 'Viết thuyết minh/đề xuất dự án quốc tế được Trường ĐHTV giao', 'Không', 'Không', 'Không', 'Không', 'Thuyết minh', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(43, 5, 98, 'Viết hồ sơ đăng ký sáng chế Việt Nam được Trường ĐHTV giao;', 'Không', 'Không', 'Không', 'Không', 'Hồ sơ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(44, 5, 195, 'Viết hồ sơ đăng ký sáng chế quốc tế được Trường ĐHTV giao;', 'Không', 'Không', 'Không', 'Không', 'Hồ sơ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(45, 5, 78, 'Viết hồ sơ đăng ký giải pháp hữu ích Việt Nam được Trường ĐHTV giao;', 'Không', 'Không', 'Không', 'Không', 'Hồ sơ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(46, 5, 98, 'Thiết kế đồ hoạ sản phẩm SHTT được Trường ĐHTV sử dụng đăng ký;', 'Không', 'Không', 'Không', 'Không', 'Sản Phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(47, 5, 10, 'Phản biện bài báo khoa học trong nước;', 'Không', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(48, 5, 20, 'Phản biện bài báo khoa học quốc tế;', 'Không', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(49, 5, 8, 'Phản biện bài báo cáo (tham luận) hội thảo hội nghị khoa học trong nước;', 'Không', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(50, 5, 15, 'Phản biện bài báo cáo (tham luận) hội thảo hội nghị khoa học quốc tế;', 'Không', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(51, 5, 10, 'Bài báo khoa học đăng trên các tạp chí quốc tế nằm trong danh mục WoS/Scopus có trích dẫn bài báo khoa học đăng trên tạp chí khoa học Trường ĐHTV (tính cho tác giả thứ nhất, trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV thì tính cho tác giả chịu trách nhiệm)', 'Không', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(52, 5, 46, 'Hướng dẫn người học thực hiện đề tài NCKH cấp Trường và tương đương được nghiệm thu đạt;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(53, 5, 98, 'Hướng dẫn người học thực hiện đề tài NCKH cấp Trường và tương đương được nghiệm thu đạt loại xuất sắc;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(54, 5, 195, 'Hướng dẫn người học có kết quả nghiên cứu được áp dụng, triển khai đem lại lợi nhuận tính theo mỗi 25 triệu đồng', 'Không', 'Không', 'Không', '25 triệu đồng', 'Sản Phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', '195/25 triệu đồng'),
(55, 5, 195, 'Hướng dẫn người học tham gia các giải thưởng KH&CN trong nước cấp tỉnh hoặc tương đương đạt huy chương vàng (giải nhất)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Vàng (giải nhất)', 'Không', '2024-2025', 'Đang áp dụng', 'Vàng (giải nhất)'),
(56, 5, 137, 'Hướng dẫn người học tham gia các giải thưởng KH&CN trong nước cấp tỉnh hoặc tương đương đạt huy chương bạc (giải nhì)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Bạc (giải nhì)', 'Không', '2024-2025', 'Đang áp dụng', 'Bạc (giải nhì)'),
(57, 5, 98, 'Hướng dẫn người học tham gia các giải thưởng KH&CN trong nước cấp tỉnh hoặc tương đương đạt huy chương đồng (giải ba);', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Đồng (giải ba);', 'Không', '2024-2025', 'Đang áp dụng', 'Đồng (giải ba);'),
(58, 5, 390, 'Hướng dẫn người học tham gia các 3 giải thưởng KH&CN trong nước cấp vùng trở lên đạt huy chương vàng (giải nhất)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Vàng (giải nhất)', 'Không', '2024-2025', 'Đang áp dụng', 'Vàng (giải nhất)'),
(59, 5, 273, 'Hướng dẫn người học tham gia các 3 giải thưởng KH&CN trong nước cấp vùng trở lên đạt huy chương bạc (giải nhì)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Bạc (giải nhì)', 'Không', '2024-2025', 'Đang áp dụng', 'Bạc (giải nhì)'),
(60, 5, 195, 'Hướng dẫn người học tham gia các 3 giải thưởng KH&CN trong nước cấp vùng trở lên đạt huy chương đồng (giải ba)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Đồng (giải ba);', 'Không', '2024-2025', 'Đang áp dụng', 'Đồng (giải ba);'),
(61, 5, 49, 'Hướng dẫn người học tham gia các 3 giải thưởng KH&CN trong nước cấp vùng trở lên đạt giải khuyến khích và không đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Giải khuyến khích và không đạt giải;', 'Không', '2024-2025', 'Đang áp dụng', 'Giải khuyến khích và không đạt giải;'),
(62, 5, 273, 'Hướng dẫn người học tham gia các 2 cuộc thi về học thuật (Olympic Tin học, Toán học, Hóa học,...) trong nước cấp vùng trở lên đạt huy chương vàng (giải nhất)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Vàng (giải nhất)', 'Không', '2024-2025', 'Đang áp dụng', 'Vàng (giải nhất)'),
(63, 5, 195, 'Hướng dẫn người học tham gia các 2 cuộc thi về học thuật (Olympic Tin học, Toán học, Hóa học,...) trong nước cấp vùng trở lên đạt huy chương bạc (giải nhì)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Bạc (giải nhì)', 'Không', '2024-2025', 'Đang áp dụng', 'Bạc (giải nhì)'),
(64, 5, 137, 'Hướng dẫn người học tham gia các 2 cuộc thi về học thuật (Olympic Tin học, Toán học, Hóa học,...) trong nước cấp vùng trở lên đạt huy chương đồng (giải ba)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Đồng (giải ba);', 'Không', '2024-2025', 'Đang áp dụng', 'Đồng (giải ba);'),
(65, 5, 49, 'Hướng dẫn người học tham gia các 2 cuộc thi về học thuật (Olympic Tin học, Toán học, Hóa học,...) trong nước cấp vùng trở lên đạt khuyến khích và không đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Giải khuyến khích và không đạt giải;', 'Không', '2024-2025', 'Đang áp dụng', 'Giải khuyến khích và không đạt giải;'),
(66, 5, 390, 'Hướng dẫn người học tham gia các giải thưởng khởi nghiệp từ cấp bộ hoặc tương đương trở lên.', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(67, 5, 195, 'Tham gia thực hiện Dự án nghiên cứu bên ngoài Trường với mức kinh phí dự án từ 100 triệu trở lên (do đơn vị bên ngoài Trường cấp kinh phí thực hiện và thông qua BGH kí Hợp đồng) và có số tiền trích nộp về Trường/giảng viên từ 25 triệu đồng trở lên;', 'Không', 'Không', 'Không', '25 triệu đồng', 'Dự án', 'Không', 'Không', '2024-2025', 'Đang áp dụng', '195 giờ/thành viên có trích nộp về Trường theo quy định.'),
(68, 5, 195, 'Tham gia thực hiện hoạt động sản xuất dịch vụ với lợi nhuận có trích nộp về Trường/giảng viên từ 25 triệu đồng trở lên;', 'Không', 'Không', 'Không', '25 triệu đồng', 'Hoạt động', 'Không', 'Không', '2024-2025', 'Đang áp dụng', '195 giờ/thành viên có trích nộp về Trường theo quy định.'),
(69, 5, 195, 'Biên soạn 01 bộ ngân hàng câu hỏi trắc nghiệm trên máy tính (tối thiểu 400 câu) không nhận thù lao biên soạn.', 'Không', 'Không', 'Không', 'Không', 'Bộ ngân hàng câu hỏi', 'Không', 'Không', '2024-2025', 'Đang áp dụng', '(tối thiểu 400 câu) không nhận thù lao biên soạn.'),
(70, 6, 195, 'Đề tài KH&CN cấp Trường ĐHTV, cấp huyện hoặc tương đương được nghiệm thu đạt;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(71, 6, 390, 'Đề tài KH&CN cấp Bộ, Tỉnh, Thành phố (TP) thuộc Trung ương được nghiệm thu đạt có kinh phí ≥ 500 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Được nghiệm thu đạt có kinh phí ≥ 500 triệu đồng;'),
(72, 6, 244, 'Đề tài KH&CN cấp Bộ, Tỉnh, TP thuộc Trung ương được nghiệm thu đạt có kinh phí < 500 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Được nghiệm thu đạt có kinh phí < 500 triệu đồng;'),
(73, 6, 488, 'Đề tài KH&CN cấp Quốc gia được nghiệm thu đạt;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(74, 6, 293, 'Dự án KH&CN đem lại lợi nhuận trên 100 triệu và dưới 300 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Dự án', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Lợi nhuận trên 100 triệu và dưới 300 triệu đồng;'),
(75, 6, 390, 'Dự án KH&CN đem lại lợi nhuận từ trên 300 triệu đồng đến 500 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Dự án', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Lợi nhuận từ trên 300 triệu đồng đến 500 triệu đồng;'),
(76, 6, 585, 'Dự án KH&CN đem lại lợi nhuận từ trên 500 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Dự án', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Lợi nhuận từ trên 500 triệu đồng;'),
(77, 6, 0, 'Các trường hợp khác (đề tài/dự án hợp tác doanh nghiệp, hợp tác quốc tế, nghị định thư, ...) không nêu trong quy chế các đơn vị làm tờ trình trình Hiệu trưởng quyết định trước khi thực hiện.', 'Không', 'Không', 'Không', 'Không', 'Theo tờ trình được duyệt', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Làm tờ trình trình Hiệu trưởng quyết định trước khi thực hiện.'),
(78, 7, 250, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp tỉnh và tương đương) đạt huy chương vàng', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Vàng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(79, 7, 200, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp tỉnh và tương đương) đạt huy chương bạc', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Bạc', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(80, 7, 150, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp tỉnh và tương đương) đạt huy chương đồng;', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Đồng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(81, 7, 400, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc gia) đạt huy chương vàng', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Vàng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(82, 7, 300, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc gia) đạt huy chương bạc', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Bạc', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(83, 7, 200, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc gia) đạt huy chương đồng;', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Đồng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(84, 7, 600, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc tế) đạt huy chương vàng', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Vàng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(85, 7, 500, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc tế) đạt huy chương bạc', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Bạc', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(86, 7, 400, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc tế) đạt huy chương đồng;', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Đồng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(87, 7, 195, 'Sáng tác một tác phẩm âm nhạc, múa, điện ảnh được công diễn từ cấp tỉnh trở lên và đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Tác phẩm', 'Có', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(88, 7, 195, 'Dàn dựng/Biên đạo Đạo diễn một tác phẩm âm nhạc, múa, điện ảnh được công diễn từ cấp tỉnh trở lên và đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Tác phẩm', 'Có', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(89, 7, 195, 'Sáng tác và Dàn dựng/Biên đạo Đạo diễn một tác phẩm âm nhạc, múa, điện ảnh được công diễn cấp tỉnh trở lên và đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Tác phẩm', 'Có', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(90, 7, 195, 'Đạo diễn trọn một vở diễn cấp tỉnh trở lên có thời gian từ 30 phút trở lên;', 'Không', 'Không', 'Không', 'Không', 'Vở diễn', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(91, 7, 195, 'Biên đạo múa (một vở kịch múa từ ba màn trở lên hoặc một chương trình từ 5 tiết mục trở lên được dựng ở các Nhà hát cấp tỉnh trở lên);', 'Không', 'Không', 'Không', 'Không', 'Vở kịch múa', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Một vở kịch múa từ ba màn trở lên hoặc một chương trình từ 5 tiết mục trở lên được dựng ở các Nhà hát cấp tỉnh trở lên'),
(92, 7, 195, 'Dàn dựng, chỉ huy hoặc biểu diễn một chương trình hòa nhạc có độ dài trên 45 phút cấp tỉnh trở lên;', 'Không', 'Không', 'Không', 'Không', 'Không rõ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Dàn dựng, chỉ huy hoặc biểu diễn một chương trình hòa nhạc có độ dài trên 45 phút cấp tỉnh trở lên;'),
(93, 7, 195, 'Sáng tác và dàn dựng một tác phẩm âm nhạc/tác phẩm múa/ tác phẩm kịch hoặc tuồng được công diễn từ cấp tỉnh trở lên có độ dài trên 30 phút;', 'Không', 'Không', 'Không', 'Không', 'Không rõ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Từ cấp tỉnh trở lên có độ dài trên 30 phút;'),
(94, 7, 98, 'Các bài hát, bài thơ sáng tác mới và được cấp phép sử dụng;', 'Không', 'Không', 'Không', 'Không', 'Không rõ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `MAGV` varchar(255) NOT NULL,
  `MABOMON` int(11) NOT NULL,
  `TENGV` varchar(100) DEFAULT NULL,
  `EMAIL` text DEFAULT NULL,
  `DIENTHOAI` varchar(50) DEFAULT NULL,
  `DIACHI` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`MAGV`, `MABOMON`, `TENGV`, `EMAIL`, `DIENTHOAI`, `DIACHI`) VALUES
('00241', 16, 'Nguyễn Hoàng Duy Thiện', 'duythien@tvu.edu.vn', '0912345678', '123 Đường ABC, Trà Vinh'),
('00242', 16, 'Dương Ngọc Vân Khanh', 'vankhanh@tvu.edu.vn', '0912345679', '456 Đường DEF, Trà Vinh'),
('00243', 16, 'Huỳnh Văn Thanh', 'vanthanh@tvu.edu.vn', '0912345680', '789 Đường GHI, Trà Vinh'),
('00244', 16, 'Nguyễn Nhứt Lam', 'nhutlam@tvu.edu.vn', '0912345681', '101 Đường JKL, Trà Vinh'),
('00245', 16, 'Anh Tư', 'annb@tvu.edu.vn', '0369258147', 'Mỹ'),
('00246', 16, 'Nguyễn Ngọc Đan Thanh', 'danthanh@tvu.edu.vn', '0912345682', '102 Đường MNO, Trà Vinh'),
('00248', 16, 'Hồ Hoàng Phúc Fix', 'duongminh@tvu.edu.vn', '0258741369', 'Đáy biển Đen'),
('00249', 16, 'Hà Thị Thúy Vi', 'Hattvi201084@tvu.edu.vn', '0123654987', 'Trà Vinh'),
('00250', 16, 'Võ Thanh C', 'vothanhc@tvu.edu.vn', '0912345683', '103 Đường PQR, Trà Vinh'),
('00251', 16, 'Trịnh Quốc Việt', 'quocviet@tvu.edu.vn', '0912345684', '104 Đường STU, Trà Vinh'),
('00252', 16, 'Trầm Hoàng Nam', 'hoangnam@tvu.edu.vn', '0912345685', '105 Đường VWX, Trà Vinh'),
('00253', 16, 'Đoàn Phước Miền', 'phuocmien@tvu.edu.vn', '0912345686', '106 Đường YZ, Trà Vinh'),
('00254', 16, 'Ngô Thanh Huy', 'huyngocntt@tvu.edu.vn', '0912345687', '107 Đường ABC, Trà Vinh'),
('00255', 16, 'Phạm Thị Trúc Mai', 'trucmai@tvu.edu.vn', '0912345688', '108 Đường DEF, Trà Vinh'),
('00257', 16, 'Nguyễn Mộng Hiền', 'hientvu@tvu.edu.vn', '0123456987', 'TV'),
('01027', 16, 'Nguyễn Khánh Duy', 'khanhduy@tvu.edu.vn', '0912345689', '109 Đường GHI, Trà Vinh'),
('0122', 16, 'Nguyễn Tín Thành', 'tinthanhtv2014@gmail.com', '0325698741', 'Sao Hỏa'),
('0123', 16, 'Hồ Hoàng Phúc', 'hohoangphucjob@gmail.com', '0327434821', 'Sao Hỏa'),
('01548', 16, 'Thạch Kọng SaOane', 'saone@tvu.edu.vn', '0912345690', '110 Đường JKL, Trà Vinh'),
('03539', 16, 'Lê Minh Tự', 'minhtu@tvu.edu.vn', '0912345691', '111 Đường MNO, Trà Vinh'),
('03546', 16, 'Phan Thị Phương Nam', 'phuongnam@tvu.edu.vn', '0912345692', '112 Đường PQR, Trà Vinh'),
('03562', 16, 'Nguyễn Khắc Quốc', 'khacquoc@tvu.edu.vn', '0912345693', '113 Đường STU, Trà Vinh'),
('11012', 2, 'Nguyễn Văn A', 'vana@tvu.edu.vn', '0912345694', '114 Đường VWX, Trà Vinh'),
('12700', 16, 'Khấu Văn Nhựt', 'vannhut@tvu.edu.vn', '0912345695', '115 Đường YZ, Trà Vinh'),
('12701', 16, 'Trần Văn Nam', 'vannam@tvu.edu.vn', '0912345696', '116 Đường ABC, Trà Vinh'),
('12702', 16, 'Nguyễn Thừa Phát Tài', 'phattai@tvu.edu.vn', '0912345697', '117 Đường DEF, Trà Vinh'),
('12705', 16, 'Lê Văn B', 'vanb@tvu.edu.vn', '0912345698', '118 Đường GHI, Trà Vinh'),
('14204', 16, 'Nguyễn Bá Nhiệm', 'banhiem@tvu.edu.vn', '0912345699', '119 Đường JKL, Trà Vinh'),
('99997', 16, 'Bảo Trưởng Khoa', 'baoquocone@gmail.com', '0325698741', 'Sao Hỏa'),
('99999', 16, 'Nguyễn Lâm Quốc Bảo', 'baoquoczero@gmail.com', '0987654321', 'Sao Hỏa'),
('GVNT22424', 16, 'Nguyễn Ngọc Đan Thanh', 'ngocdanthanhdt@tvu.edu.vn', '0325641789', 'Mặt Trăng'),
('GVNT8909', 18, 'Hana', 'hana@gmail.com', '3210456987', 'Bắc Cực');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giu_chuc_vu`
--

CREATE TABLE `giu_chuc_vu` (
  `MAGV` varchar(255) NOT NULL,
  `MACHUCVU` int(11) NOT NULL,
  `SOQUYETDINH` varchar(255) DEFAULT NULL,
  `TUNGAY` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giu_chuc_vu`
--

INSERT INTO `giu_chuc_vu` (`MAGV`, `MACHUCVU`, `SOQUYETDINH`, `TUNGAY`) VALUES
('00244', 9, NULL, NULL),
('00245', 2, '99', '2024-07-08'),
('00248', 8, '99', '2024-07-08'),
('00249', 1, '99', '2024-07-09'),
('00254', 1, '99', '2024-07-09'),
('00257', 1, '99', '2024-07-08'),
('0122', 1, '21', '2024-08-08'),
('01548', 8, NULL, NULL),
('12705', 8, NULL, NULL),
('14204', 8, NULL, NULL),
('99997', 6, '', '2024-09-20'),
('99999', 6, '', '2024-08-13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhthucdanhgia`
--

CREATE TABLE `hinhthucdanhgia` (
  `MADANHGIAKETTHUC` int(11) NOT NULL,
  `TENDANHGIA` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhthucdanhgia`
--

INSERT INTO `hinhthucdanhgia` (`MADANHGIAKETTHUC`, `TENDANHGIA`) VALUES
(1, 'Trắc nghiệm'),
(2, 'Tự luận'),
(3, 'Thực hành');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hockynienkhoa`
--

CREATE TABLE `hockynienkhoa` (
  `MAHKNK` int(11) NOT NULL,
  `TENHKNK` text DEFAULT NULL,
  `TEN_NAM_HOC` varchar(255) DEFAULT NULL,
  `NGAYBATDAUNIENKHOA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hockynienkhoa`
--

INSERT INTO `hockynienkhoa` (`MAHKNK`, `TENHKNK`, `TEN_NAM_HOC`, `NGAYBATDAUNIENKHOA`) VALUES
(23, 'Học Kì 1', 'Năm học 2020-2021', '2020-09-01'),
(24, 'Học Kì 2', 'Năm học 2020-2021', '2021-02-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `MAKHOA` int(11) NOT NULL,
  `TENKHOA` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`MAKHOA`, `TENKHOA`) VALUES
(1, 'Khoa Công Nghệ Thông Tin'),
(11, 'Khoa Kỹ Thuật Công Nghệ'),
(12, 'Ngoài trường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khunggiochuan`
--

CREATE TABLE `khunggiochuan` (
  `MAKHUNG` int(11) NOT NULL,
  `MACHUCDANH` int(11) NOT NULL,
  `TENKHUNGCHUAN` text DEFAULT NULL,
  `GIOGIANGDAY_HANHCHINH` int(11) DEFAULT NULL,
  `GIOGIANGDAY_CHUAN` int(11) DEFAULT NULL,
  `GIONGHIENCUUKHOAHOC_HANHCHINH` int(11) DEFAULT NULL,
  `GIONGHIENCUUKHOAHOC_CHUAN` int(11) DEFAULT NULL,
  `GIOPHUCVUCONGDONG_HANHCHINH` int(11) DEFAULT NULL,
  `GIOPHUCVUCONGDONG_CHUAN` int(11) DEFAULT NULL,
  `GHICHU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khunggiochuan`
--

INSERT INTO `khunggiochuan` (`MAKHUNG`, `MACHUCDANH`, `TENKHUNGCHUAN`, `GIOGIANGDAY_HANHCHINH`, `GIOGIANGDAY_CHUAN`, `GIONGHIENCUUKHOAHOC_HANHCHINH`, `GIONGHIENCUUKHOAHOC_CHUAN`, `GIOPHUCVUCONGDONG_HANHCHINH`, `GIOPHUCVUCONGDONG_CHUAN`, `GHICHU`) VALUES
(10, 1, 'Khung 1', 630, 210, 855, 285, 275, 91, NULL),
(11, 1, 'Khung 2', 810, 270, 720, 240, 230, 76, NULL),
(12, 1, 'Khung 3', 990, 330, 585, 195, 185, 61, NULL),
(13, 2, 'Khung 1', 630, 210, 765, 255, 365, 121, NULL),
(14, 2, 'Khung 2', 810, 270, 630, 210, 320, 106, NULL),
(15, 2, 'Khung 3', 990, 330, 495, 165, 275, 91, NULL),
(16, 3, 'Khung 1', 630, 210, 675, 225, 455, 151, NULL),
(17, 3, 'Khung 2', 810, 270, 540, 180, 410, 136, NULL),
(18, 3, 'Khung 3', 990, 330, 405, 135, 365, 121, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_danh_muc`
--

CREATE TABLE `loai_danh_muc` (
  `MA_LOAI_DANH_MUC` int(11) NOT NULL,
  `TEN_LOAI_DANH_MUC` text DEFAULT NULL,
  `TRANG_THAI_DANH_MUC` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_danh_muc`
--

INSERT INTO `loai_danh_muc` (`MA_LOAI_DANH_MUC`, `TEN_LOAI_DANH_MUC`, `TRANG_THAI_DANH_MUC`) VALUES
(1, 'Điều 17. Quy đổi sản phẩm KH&CN là các báo cáo khoa học tại các hội thảo được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(2, 'Điều 18. Quy đổi sản phẩm KH&CN là các sản phẩm SHTT', 'Đang áp dụng'),
(3, 'Điều 18. Quy đổi sản phẩm KH&CN là bài báo khoa học đăng trên các tạp chí khoa học được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(4, 'Điều 19. Quy đổi sản phẩm KH&CN là sách phục vụ đào tạo được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(5, 'Điều 20. Quy đổi hoạt động viết thuyết minh các đề tài, dự án, các hoạt động KH&CN khác được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(6, 'Điều 21. Quy đổi các hoạt động thực hiện đề tài, dự án các cấp được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(7, 'Điều 22. Quy đổi các hoạt động thể dục thể thao, sáng tác, biểu diễn nghệ thuật đặc thù được tính giờ chuẩn NCKH', 'Đang áp dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_tac_gia`
--

CREATE TABLE `loai_tac_gia` (
  `MA_LOAI_TAC_GIA` int(11) NOT NULL,
  `TEN_LOAI_TAC_GIA` text DEFAULT NULL,
  `DO_UU_TIEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_tac_gia`
--

INSERT INTO `loai_tac_gia` (`MA_LOAI_TAC_GIA`, `TEN_LOAI_TAC_GIA`, `DO_UU_TIEN`) VALUES
(1, 'Tác giả thứ nhất', 1),
(2, 'Tác giả chịu trách nhiệm', 2),
(3, 'Tác giả còn lại', 3),
(4, 'Chủ đơn', 1),
(5, 'Đồng chủ đơn', 2),
(6, 'Chủ biên', 1),
(7, 'Đồng chủ biên', 2),
(8, 'Cá nhân', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

CREATE TABLE `lop` (
  `MALOP` varchar(255) NOT NULL,
  `MACHUONGTRINH` int(11) NOT NULL,
  `TENLOP` text DEFAULT NULL,
  `NAMTUYENSINH` int(11) DEFAULT NULL,
  `SISO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lop`
--

INSERT INTO `lop` (`MALOP`, `MACHUONGTRINH`, `TENLOP`, `NAMTUYENSINH`, `SISO`) VALUES
('DA20TTA', 1, 'Đại học Công nghệ thông tin A 2020', 2020, 30),
('DA20TTB', 1, 'Đại học Công nghệ thông tin B 2020', 2020, 44),
('DA21TTA', 1, 'Đại học Công nghệ thông tin A 2021', 2021, 44),
('DA21TTB', 1, 'Đại học Công nghệ thông tin B 2021', 2021, 46),
('DA21TTC', 1, 'Đại học Công nghệ thông tin C 2021', 2021, 46),
('DA22TTA', 1, 'Đại học Công nghệ thông tin A 2022', 2022, 50),
('DA22TTB', 1, 'Đại học Công nghệ thông tin B 2022', 2022, 47),
('DA22TTC', 1, 'Đại học Công nghệ thông tin C 2022', 2022, 47),
('DA22TTD', 1, 'Đại học Công nghệ thông tin D 2022', 2022, 53),
('DA23TTA', 1, 'Đại học Công nghệ thông tin A 2023', 2023, 48),
('DA23TTB', 1, 'Đại học Công nghệ thông tin B 2023', 2023, 53),
('DA23TTC', 1, 'Đại học Công nghệ thông tin C 2023', 2023, 50),
('DA23TTD', 1, 'Đại học Công nghệ thông tin D 2023', 2023, 48),
('DA24TTA', 1, 'Đại học Công nghệ thông tin A 2024', 2024, 45),
('DA24TTB', 1, 'Đại học Công nghệ thông tin B 2024', 2024, 39),
('DA24TTC', 1, 'Đại học Công nghệ thông tin C 2024', 2024, 42),
('DA24TTD', 1, 'Đại học Công nghệ thông tin D 2024', 2024, 43);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `MAMONHOC` int(11) NOT NULL,
  `TENMONHOC` text DEFAULT NULL,
  `SOTINCHILYTHUYET` int(11) DEFAULT NULL,
  `SOTINCHITHUCHANH` int(11) DEFAULT NULL,
  `GHICHU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`MAMONHOC`, `TENMONHOC`, `SOTINCHILYTHUYET`, `SOTINCHITHUCHANH`, `GHICHU`) VALUES
(1, 'Giáo dục quốc phòng - An ninh', 2, 6, 'bb'),
(2, 'Giáo dục thể chất 1*', 0, 1, 'bb'),
(3, 'Triết học Mác - Lênin', 3, 0, 'bb'),
(4, 'Anh văn không chuyên 1', 2, 1, 'bb'),
(5, 'Pháp luật đại cương', 1, 1, 'bb'),
(6, 'Nhập môn công nghệ thông tin', 1, 1, 'bb'),
(7, 'Vi tích phân A1', 2, 1, 'bb'),
(8, 'Đại số tuyến tính', 1, 1, 'bb'),
(9, 'Kỹ thuật lập trình', 2, 2, 'bb'),
(10, 'Giáo dục thể chất 2*', 0, 1, 'bb'),
(11, 'Kinh tế chính trị Mác - Lênin', 2, 0, 'bb'),
(12, 'Anh văn không chuyên 2', 2, 2, 'bb'),
(13, 'Phương pháp NC khoa học', 1, 1, 'bb'),
(14, 'Tiếng Việt thực hành', 1, 1, 'bb'),
(15, 'Logic học đại cương', 1, 1, 'bb'),
(16, 'Toán rời rạc', 1, 1, 'bb'),
(17, 'Đại số đại cương', 1, 1, 'bb'),
(18, 'Cấu trúc dữ liệu và giải thuật', 2, 2, 'bb'),
(19, 'Giáo dục thể chất 3*', 0, 1, 'bb'),
(20, 'Chủ nghĩa xã hội khoa học', 2, 0, 'bb'),
(21, 'Anh văn không chuyên 3', 2, 1, 'bb'),
(22, 'Cơ sở dữ liệu', 2, 1, 'bb'),
(23, 'Vi tích phân A2', 2, 0, 'bb'),
(24, 'Lý thuyết đồ thị', 2, 1, 'bb'),
(25, 'Kiến trúc máy tính', 2, 1, 'bb'),
(26, 'Lập trình hướng đối tượng', 2, 1, 'bb'),
(27, 'Lịch sử Đảng cộng sản', 2, 0, 'bb'),
(28, 'Anh văn không chuyên 4', 2, 1, 'bb'),
(29, 'Hệ điều hành', 2, 1, 'bb'),
(30, 'Thiết kế Web', 2, 1, 'bb'),
(31, 'Mạng máy tính', 2, 1, 'bb'),
(32, 'Tiếng Anh chuyên ngành CNTT', 2, 1, 'bb'),
(33, 'Lý thuyết xếp hàng', 1, 1, 'tc'),
(34, 'Quy hoạch tuyến tính', 1, 1, 'tc'),
(35, 'Vật lý đại cương', 1, 1, 'tc'),
(36, 'Tư tưởng Hồ Chí Minh', 2, 0, 'bb'),
(37, 'Điện toán đám mây', 2, 1, 'tc'),
(38, 'Thống kê và Phân tích dữ liệu', 2, 1, 'bb'),
(39, 'Đồ án CSN', 0, 3, 'bb'),
(40, 'Chuyên đề Linux', 2, 1, 'bb'),
(41, 'Phân tích thiết kế hệ thống thông tin', 2, 1, 'bb'),
(42, 'Lập trình ứng dụng trên Windows', 2, 1, 'tc'),
(43, 'Thương mại điện tử', 2, 1, 'tc'),
(44, 'Đồ họa ứng dụng', 2, 1, 'tc'),
(45, 'An toàn và bảo mật thông tin', 2, 1, 'bb'),
(46, 'Công nghệ phần mềm', 2, 1, 'bb'),
(47, 'Lập trình thiết bị di động', 2, 1, 'bb'),
(48, 'Khai khoáng dữ liệu', 2, 1, 'bb'),
(49, 'Cơ sở trí tuệ nhân tạo', 2, 1, 'bb'),
(50, 'Hệ quản trị cơ sở dữ liệu', 2, 1, 'bb'),
(51, 'Nguyên lý kế toán', 1, 1, 'tc'),
(52, 'Kĩ thuật xây dựng và ban hành văn bản', 1, 1, 'tc'),
(53, 'Tâm lí học đại cương', 1, 1, 'tc'),
(54, 'Quản trị doanh nghiệp', 1, 1, 'tc'),
(55, 'Phát triển ứng dụng Web với mã nguồn mở', 2, 1, 'bb'),
(56, 'Xây dựng phần mềm HĐT', 2, 1, 'bb'),
(57, 'Phát triển ứng dụng hướng dịch vụ', 2, 1, 'bb'),
(58, 'Quản trị dự án công nghệ thông tin', 2, 1, 'bb'),
(59, 'Đồ án chuyên ngành', 0, 3, 'bb'),
(60, 'Xử lý ảnh', 2, 1, 'bb'),
(61, 'Tương tác người máy', 2, 1, 'tc'),
(62, 'Hệ hỗ trợ ra quyết định', 2, 1, 'tc'),
(63, 'Chuyên đề ASP.net', 2, 1, 'tc'),
(64, 'Blockchaine', 2, 1, 'tc'),
(65, 'Máy học ứng dụng', 2, 1, 'bb'),
(66, 'Thực tập tốt nghiệp', 0, 3, 'bb'),
(67, 'Khóa luận tốt nghiệp', 0, 7, 'bb'),
(68, 'Hệ thống thông tin quản lý', 2, 1, 'bb'),
(69, 'Thị giác máy tính', 2, 2, 'bb'),
(70, 'Những nguyên lý cơ bản của Chủ nghĩa Mác - Lênin', 5, 0, 'bb'),
(71, 'Giáo dục thể chất 1', 0, 1, 'bb'),
(72, 'Giáo dục Quốc phòng- An ninh', 2, 6, 'bb'),
(73, 'Tin học đại cương', 1, 2, 'bb'),
(74, 'Nhập môn ngành công nghệ kỹ thuật cơ khí', 1, 1, 'bb'),
(75, 'Toán cao cấp A1', 2, 1, 'bb'),
(76, 'Vật lý đại cương A1', 2, 1, 'bb'),
(77, 'Giáo dục thể chất 2', 0, 1, 'bb'),
(78, 'Toán cao cấp A2', 1, 1, 'bb'),
(79, 'Vật lý đại cương A2', 2, 1, 'bb'),
(80, 'Hình họa - Vẽ kỹ thuật', 1, 1, 'bb'),
(81, 'Dung sai – kỹ thuật đo', 1, 1, 'bb'),
(82, 'An toàn lao động và môi trường công nghiệp', 2, 0, 'bb'),
(83, 'Tâm lý học đại cương', 1, 1, 'tc'),
(84, 'Maketing căn bản', 1, 1, 'tc'),
(85, 'Tiếng Việt thực hành ', 1, 1, 'tc'),
(86, 'Kinh tế học đại cương', 2, 0, 'tc'),
(87, 'Giáo dục thể chất 3', 0, 1, 'bb'),
(88, 'Đường lối cách mạng của Đảng Cộng sản Việt Nam', 3, 0, 'bb'),
(89, 'Phương pháp Nghiên cứu khoa học', 1, 1, 'bb'),
(90, 'Cơ lý thuyết', 2, 0, 'bb'),
(91, 'Thực hành nguội ', 0, 2, 'bb'),
(92, 'Vật liệu cơ khí', 2, 0, 'bb'),
(93, 'Văn hóa Việt Nam', 1, 1, 'tc'),
(94, 'Kỹ năng chăm sóc khách hàng', 1, 1, 'tc'),
(95, 'Kỹ năng giao tiếp', 1, 1, 'tc'),
(96, 'Tư duy hệ thống', 1, 1, 'tc'),
(97, 'Xác suất thống kê', 1, 1, 'bb'),
(98, 'Kỹ thuật nhiệt         ', 2, 0, 'bb'),
(99, 'Vẽ Kỹ thuật với CAD', 1, 1, 'bb'),
(100, 'Kỹ thuật điện – điện tử      ', 2, 1, 'bb'),
(101, 'Sức bền vật liệu', 1, 1, 'bb'),
(102, 'Nguyên lý - Chi tiết máy ', 3, 0, 'bb'),
(103, 'Đồ án nguyên lý- chi tiết máy', 0, 1, 'bb'),
(104, 'Cơ sở Công nghệ chế tạo máy', 2, 0, 'tc'),
(105, 'Cơ học lưu chất', 2, 0, 'tc'),
(106, 'Kỹ thuật số ', 1, 1, 'tc'),
(107, 'Tổ chức quản lý kinh tế kỹ thuật', 2, 0, 'tc'),
(108, 'Thực hành cơ khí cơ bản', 0, 2, 'tc'),
(109, 'Nguyên lý động cơ đốt trong', 2, 1, 'bb'),
(110, 'Lý thuyết ô tô', 3, 0, 'bb'),
(111, 'Thực hành hệ thống truyền động ô tô', 0, 3, 'bb'),
(112, 'Hệ thống điện động cơ', 2, 2, 'bb'),
(113, 'Kỹ thuật máy nâng vận chuyển', 2, 0, 'tc'),
(114, 'Cảm biến trên ô tô', 1, 1, 'tc'),
(115, 'Vi điều khiển', 1, 1, 'tc'),
(116, 'Kỹ thuật khí nén – Thủy lực', 1, 1, 'tc'),
(117, 'Dao động trong kỹ thuật', 2, 0, 'tc'),
(118, 'Kết cấu và tính toán động cơ đốt trong', 2, 1, 'bb'),
(119, 'Thực hành Động cơ đốt trong', 0, 4, 'bb'),
(120, 'Hệ thống điện thân xe ', 2, 2, 'bb'),
(121, 'Kết cấu tính toán ô tô', 2, 1, 'bb'),
(122, 'Anh văn chuyên ngành ô tô', 2, 0, 'tc'),
(123, 'Chẩn đoán và bảo trì động cơ', 1, 1, 'tc'),
(124, 'Thí nghiệm điện – điện tử ô tô', 0, 2, 'tc'),
(125, 'Ô tô điện', 1, 1, 'tc'),
(126, 'Ô tô và môi trường', 1, 1, 'tc'),
(127, 'Hệ thống điều hòa không khí trên ô tô', 0, 2, 'tc'),
(128, 'Thực hành hệ thống vận hành và điều khiển ô tô', 0, 3, 'bb'),
(129, 'Đồ án chuyên ngành ô tô', 0, 1, 'bb'),
(130, 'Hệ thống điều khiển động cơ', 2, 2, 'bb'),
(131, 'Thực tập xí nghiệp', 0, 2, 'bb'),
(132, 'Kỹ thuật mô tô xe máy', 0, 2, 'tc'),
(133, 'Kiểm định và Chẩn đoán kỹ thuật ô tô', 1, 1, 'tc'),
(134, 'Xe chuyên dùng', 0, 2, 'tc'),
(135, 'Ô tô Hybrid', 1, 1, 'tc'),
(136, 'Hệ thống định vị ô tô (GPS)', 1, 1, 'tc'),
(137, 'Ô tô sử dụng năng lượng mới', 1, 1, 'tc'),
(138, 'Đồ án tốt nghiệp ', 0, 7, 'bb'),
(139, 'Chuyên đề tính toán, thiết kế ô tô', 1, 1, 'bb'),
(140, 'Chuyên đề hệ thống điều khiển ô tô', 2, 1, 'bb'),
(141, 'Chuyên đề công nghệ mới trên ô tô', 1, 1, 'bb'),
(142, 'An toàn lao động và môi trường CN', 2, 0, 'bb'),
(143, 'Anh văn chuyên ngành cơ khí', 2, 0, 'tc'),
(144, 'Quản trị sản xuất và chất lượng', 2, 0, 'tc'),
(145, 'Thí nghiệm cơ học', 0, 1, 'bb'),
(146, 'Trang bị điện, Điện tử trong máy công nghiệp', 1, 1, 'bb'),
(147, 'Thực hành hàn', 0, 2, 'bb'),
(148, 'Thực hành tiện 1', 0, 3, 'bb'),
(149, 'Công nghệ nano', 2, 0, 'tc'),
(150, 'Tối ưu hóa trong kỹ thuật', 2, 0, 'tc'),
(151, 'Kỹ thuật độ tin cậy', 2, 0, 'tc'),
(152, 'Điều khiển tự động', 1, 1, 'tc'),
(153, 'Công nghệ chế tạo máy', 2, 0, 'bb'),
(154, 'Đồ án Công nghệ chế tạo máy', 0, 1, 'bb'),
(155, 'Công nghệ kim loại', 2, 0, 'bb'),
(156, 'Công nghệ khí nén – Thủy lực', 2, 1, 'bb'),
(157, 'Thực hành tiện 2', 0, 3, 'bb'),
(158, 'Thực hành phay', 0, 2, 'bb'),
(159, 'Bảo trì và bảo dưỡng công nghiệp', 1, 1, 'tc'),
(160, 'Công nghệ khuôn mẫu', 2, 0, 'tc'),
(161, 'Máy chế biến lương thực', 2, 0, 'tc'),
(162, 'Công nghệ và thiết bị sấy', 2, 0, 'tc'),
(163, 'Máy cắt kim loại', 2, 0, 'bb'),
(164, 'Tự động hóa quá trình sản xuất', 1, 1, 'bb'),
(165, 'Công nghệ CAD/CAM/CNC', 1, 1, 'bb'),
(166, 'Thực hành CNC', 0, 2, 'bb'),
(167, 'Robot công nghiệp', 1, 1, 'bb'),
(168, 'Thiết kế sản phẩm công nghiệp', 1, 1, 'tc'),
(169, 'Ma sát học', 2, 0, 'tc'),
(170, 'Thiết kế mô phỏng hệ thống máy', 1, 1, 'tc'),
(171, 'Năng lượng và quản lý năng lượng', 2, 0, 'tc'),
(172, 'Các phương pháp gia công đặc biệt', 2, 0, 'tc'),
(173, 'Hoặc học bổ sung kiến thức:', 4, 3, 'bb'),
(174, 'Chuyên đề tính toán, thiết kế trong cơ khí', 1, 1, 'bb'),
(175, 'Chuyên đề các phương pháp gia công mới', 2, 1, 'bb'),
(176, 'Chuyên đề công nghệ và vật liệu mới', 1, 1, 'bb'),
(177, 'Giáo dục thể chất 1 ', 0, 1, 'bb'),
(178, 'Những nguyên lý cơ bản của  Chủ nghĩa Mác - Lênin ', 5, 0, 'bb'),
(179, 'Anh văn không chuyên 1 ', 2, 2, 'bb'),
(180, 'Tin học đại cương ', 1, 2, 'bb'),
(181, 'Pháp luật đại cương ', 1, 1, 'bb'),
(182, 'Đại số tuyến tính ', 1, 1, 'bb'),
(183, 'Toán cao cấp A1 ', 2, 1, 'bb'),
(184, 'Vật lý đại cương A1 ', 2, 1, 'bb'),
(185, 'Giáo dục thể chất 2 ', 0, 1, 'bb'),
(186, 'Nhập môn ngành công nghệ  kỹ thuật Điện ', 1, 1, 'bb'),
(187, 'Anh văn không chuyên 2 ', 2, 1, 'bb'),
(188, 'Tư tưởng Hồ Chí Minh ', 2, 0, 'bb'),
(189, 'Toán cao cấp A2 ', 1, 1, 'bb'),
(190, 'Môi trường và con người ', 2, 0, 'bb'),
(191, 'Vật lý đại cương A2 ', 2, 1, 'bb'),
(192, 'Vẽ kỹ thuật điện với CAD ', 1, 2, 'bb'),
(193, 'Mạch điện 1 ', 3, 0, 'bb'),
(194, 'Giáo dục thể chất 3 ', 0, 1, 'bb'),
(195, 'Đường lối cách mạng của  Đảng Cộng sản Việt Nam ', 3, 0, 'bb'),
(196, 'Anh văn không chuyên 3 ', 2, 1, 'bb'),
(197, 'Thực hành Điện cơ bản ', 0, 2, 'bb'),
(198, 'Điện tử cơ bản ', 3, 0, 'bb'),
(199, 'Hàm biến phức và phép biến  đổi Laplace ', 2, 0, 'tc'),
(200, 'Kỹ thuật lập trình ', 1, 1, 'tc'),
(201, 'Khởi tạo doanh nghiệp ', 1, 1, 'tc'),
(202, 'Hoá học đại cương ', 3, 1, 'tc'),
(203, 'Xác suất thống kê ', 1, 1, 'tc'),
(204, 'Anh văn chuyên ngành ', 1, 1, 'bb'),
(205, 'Đo lường điện ', 2, 0, 'bb'),
(206, 'Vi mạch tương tự và số ', 3, 0, 'bb'),
(207, 'An toàn điện ', 2, 0, 'bb'),
(208, 'Mạch điện 2 (MĐ 2) ', 2, 0, 'bb'),
(209, 'Thiết bị điện trong truyền tải  và phân phối điện ', 2, 0, 'bb'),
(210, 'Vật liệu điện ', 2, 0, 'bb'),
(211, 'Máy điện 1 ', 3, 0, 'bb'),
(212, 'Thực hành điện tử cơ bản ', 0, 1, 'bb'),
(213, 'Máy điện 2 ', 2, 0, 'bb'),
(214, 'Kỹ thuật điều khiển tự động ', 2, 0, 'bb'),
(215, 'Đồ án máy điện ', 0, 1, 'bb'),
(216, 'Điện tử công suất ', 3, 0, 'bb'),
(217, 'Trang bị điện ', 2, 0, 'bb'),
(218, 'Mạng cung cấp điện ', 3, 0, 'bb'),
(219, 'Phương pháp nghiên cứu khoa  học ', 1, 1, 'bb'),
(220, 'Thực hành đo lường điện ', 0, 1, 'bb'),
(221, 'Thực hành vi mạch ', 0, 1, 'bb'),
(222, 'Vi điều khiển ', 2, 0, 'bb'),
(223, 'Thí nghiệm máy điện ', 0, 2, 'bb'),
(224, 'Ngắn mạch trong hệ thống  điện ', 3, 0, 'bb'),
(225, 'Đồ án điện tử công suất ', 0, 1, 'bb'),
(226, 'Thực hành Điện tử công suất ', 0, 2, 'bb'),
(227, 'Truyền động điện ', 2, 0, 'bb'),
(228, 'Thực hành trang bị điện – khí  nén ', 0, 3, 'bb'),
(229, 'Đồ án Mạng cung cấp điện ', 0, 1, 'bb'),
(230, 'Thực hành cảm biến ', 0, 2, 'bb'),
(231, 'Thực hành PLC ', 0, 3, 'bb'),
(232, 'Lập trình giao diện điều khiển  người – máy (HMI) ', 0, 2, 'bb'),
(233, 'Thực hành Vi điều khiển ', 0, 2, 'tc'),
(234, 'Truyền số liệu ', 2, 0, 'tc'),
(235, 'Thực hành máy điện ', 0, 2, 'tc'),
(236, 'Đo lường và điều khiển bằng  máy tính ', 2, 0, 'tc'),
(237, 'Tự động hoá quá trình sản  xuất ', 2, 0, 'tc'),
(238, 'Máy điện đặc biệt trong các  thiết bị tự động ', 2, 0, 'tc'),
(239, 'Năng lượng tái tạo ', 2, 0, 'tc'),
(240, 'Quản lý dự án công trình điện ', 2, 0, 'tc'),
(241, 'Thiết kế chiếu sáng ', 2, 0, 'bb'),
(242, 'Thực hành Điều khiển động  cơ bằng biến tần ', 0, 2, 'bb'),
(243, 'Thực tập tốt nghiệp ', 0, 3, 'bb'),
(244, 'Kỹ thuật thuỷ khí ', 2, 0, 'tc'),
(245, 'Bảo vệ rơ le trong hệ thống  điện ', 3, 0, 'tc'),
(246, 'Phần điện trong nhà máy điện  và trạm biến áp ', 3, 0, 'tc'),
(247, 'Robot công nghiệp ', 2, 0, 'tc'),
(248, 'Thiết kế máy biến áp ', 2, 0, 'tc'),
(249, 'CAD trong điện công nghiệp ', 0, 2, 'tc'),
(250, 'Kỹ thuật cao áp ', 2, 0, 'tc'),
(251, 'Thực hành Mạng cung cấp  điện ', 0, 2, 'tc'),
(252, 'Quản trị công nghiệp ', 2, 0, 'tc'),
(253, '- Mạng truyền thông và điều  khiển công nghiệp (CC ', 1, 2, 'bb'),
(254, '- Giải tích và điều khiển  máy điện ', 4, 0, 'bb');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `namhoc`
--

CREATE TABLE `namhoc` (
  `MANAMHOC` int(11) NOT NULL,
  `TENNAMHOC` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `namhoc`
--

INSERT INTO `namhoc` (`MANAMHOC`, `TENNAMHOC`) VALUES
(5, 'Năm học 2020-2021'),
(6, 'Năm học 2021-2022'),
(7, 'Năm học 2022-2023'),
(8, 'Năm học 2023-2024'),
(9, 'Năm Học 2024-2025');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nghien_cuu_kh`
--

CREATE TABLE `nghien_cuu_kh` (
  `TEN_DE_TAI` varchar(255) NOT NULL,
  `THOI_GIAN_DANG_KY` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_cong_gv_tu_dong`
--

CREATE TABLE `phan_cong_gv_tu_dong` (
  `MAPCGVTD` int(11) NOT NULL,
  `MAGV_PCGVTD` varchar(255) DEFAULT NULL,
  `MA_MON_HOC_PCGVTD` varchar(255) DEFAULT NULL,
  `MA_LOP_PCGVTD` varchar(255) DEFAULT NULL,
  `DO_UU_TIEN_PCGVTD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phan_cong_gv_tu_dong`
--

INSERT INTO `phan_cong_gv_tu_dong` (`MAPCGVTD`, `MAGV_PCGVTD`, `MA_MON_HOC_PCGVTD`, `MA_LOP_PCGVTD`, `DO_UU_TIEN_PCGVTD`) VALUES
(1, '00241', '36', 'DA21TTA', '60'),
(2, '00241', '37', 'DA21TTA', '60'),
(3, '00241', '38', 'DA21TTA', '60'),
(4, '00241', '39', 'DA21TTA', '60'),
(5, '00241', '40', 'DA21TTA', '60'),
(6, '00241', '41', 'DA21TTA', '60'),
(7, '00241', '42', 'DA21TTA', '60'),
(8, '00241', '43', 'DA21TTA', '60'),
(9, '00241', '44', 'DA21TTA', '60'),
(10, '00242', '36', 'DA21TTA', '60'),
(11, '00242', '37', 'DA21TTA', '60'),
(12, '00242', '38', 'DA21TTA', '60'),
(13, '00242', '39', 'DA21TTA', '60'),
(14, '00242', '40', 'DA21TTA', '60'),
(15, '00242', '41', 'DA21TTA', '60'),
(16, '00242', '42', 'DA21TTA', '60'),
(17, '00242', '43', 'DA21TTA', '60'),
(18, '00242', '44', 'DA21TTA', '60'),
(19, '00243', '36', 'DA21TTA', '60'),
(20, '00243', '37', 'DA21TTA', '60'),
(21, '00243', '38', 'DA21TTA', '60'),
(22, '00243', '39', 'DA21TTA', '60'),
(23, '00243', '40', 'DA21TTA', '60'),
(24, '00243', '41', 'DA21TTA', '60'),
(25, '00243', '42', 'DA21TTA', '60'),
(26, '00243', '43', 'DA21TTA', '60'),
(27, '00243', '44', 'DA21TTA', '60'),
(28, '00244', '36', 'DA21TTA', '60'),
(29, '00244', '37', 'DA21TTA', '60'),
(30, '00244', '38', 'DA21TTA', '60'),
(31, '00244', '39', 'DA21TTA', '60'),
(32, '00244', '40', 'DA21TTA', '60'),
(33, '00244', '41', 'DA21TTA', '60'),
(34, '00244', '42', 'DA21TTA', '60'),
(35, '00244', '43', 'DA21TTA', '60'),
(36, '00244', '44', 'DA21TTA', '60'),
(37, '00245', '36', 'DA21TTA', '60'),
(38, '00245', '37', 'DA21TTA', '60'),
(39, '00245', '38', 'DA21TTA', '60'),
(40, '00245', '39', 'DA21TTA', '60'),
(41, '00245', '40', 'DA21TTA', '60'),
(42, '00245', '41', 'DA21TTA', '60'),
(43, '00245', '42', 'DA21TTA', '60'),
(44, '00245', '43', 'DA21TTA', '60'),
(45, '00245', '44', 'DA21TTA', '60'),
(46, '00246', '36', 'DA21TTA', '60'),
(47, '00246', '37', 'DA21TTA', '60'),
(48, '00246', '38', 'DA21TTA', '60'),
(49, '00246', '39', 'DA21TTA', '60'),
(50, '00246', '40', 'DA21TTA', '60'),
(51, '00246', '41', 'DA21TTA', '60'),
(52, '00246', '42', 'DA21TTA', '60'),
(53, '00246', '43', 'DA21TTA', '60'),
(54, '00246', '44', 'DA21TTA', '60'),
(55, '00248', '36', 'DA21TTA', '60'),
(56, '00248', '37', 'DA21TTA', '60'),
(57, '00248', '38', 'DA21TTA', '60'),
(58, '00248', '39', 'DA21TTA', '60'),
(59, '00248', '40', 'DA21TTA', '60'),
(60, '00248', '41', 'DA21TTA', '60'),
(61, '00248', '42', 'DA21TTA', '60'),
(62, '00248', '43', 'DA21TTA', '60'),
(63, '00248', '44', 'DA21TTA', '60'),
(64, '00249', '36', 'DA21TTA', '60'),
(65, '00249', '37', 'DA21TTA', '60'),
(66, '00249', '38', 'DA21TTA', '60'),
(67, '00249', '39', 'DA21TTA', '60'),
(68, '00249', '40', 'DA21TTA', '60'),
(69, '00249', '41', 'DA21TTA', '60'),
(70, '00249', '42', 'DA21TTA', '60'),
(71, '00249', '43', 'DA21TTA', '60'),
(72, '00249', '44', 'DA21TTA', '60'),
(73, '00250', '36', 'DA21TTA', '60'),
(74, '00250', '37', 'DA21TTA', '60'),
(75, '00250', '38', 'DA21TTA', '60'),
(76, '00250', '39', 'DA21TTA', '60'),
(77, '00250', '40', 'DA21TTA', '60'),
(78, '00250', '41', 'DA21TTA', '60'),
(79, '00250', '42', 'DA21TTA', '60'),
(80, '00250', '43', 'DA21TTA', '60'),
(81, '00250', '44', 'DA21TTA', '60'),
(82, '00251', '36', 'DA21TTA', '60'),
(83, '00251', '37', 'DA21TTA', '60'),
(84, '00251', '38', 'DA21TTA', '60'),
(85, '00251', '39', 'DA21TTA', '60'),
(86, '00251', '40', 'DA21TTA', '60'),
(87, '00251', '41', 'DA21TTA', '60'),
(88, '00251', '42', 'DA21TTA', '60'),
(89, '00251', '43', 'DA21TTA', '60'),
(90, '00251', '44', 'DA21TTA', '60'),
(91, '00252', '36', 'DA21TTA', '60'),
(92, '00252', '37', 'DA21TTA', '60'),
(93, '00252', '38', 'DA21TTA', '60'),
(94, '00252', '39', 'DA21TTA', '60'),
(95, '00252', '40', 'DA21TTA', '60'),
(96, '00252', '41', 'DA21TTA', '60'),
(97, '00252', '42', 'DA21TTA', '60'),
(98, '00252', '43', 'DA21TTA', '60'),
(99, '00252', '44', 'DA21TTA', '60'),
(100, '00253', '36', 'DA21TTA', '60'),
(101, '00253', '37', 'DA21TTA', '60'),
(102, '00253', '38', 'DA21TTA', '60'),
(103, '00253', '39', 'DA21TTA', '60'),
(104, '00253', '40', 'DA21TTA', '60'),
(105, '00253', '41', 'DA21TTA', '60'),
(106, '00253', '42', 'DA21TTA', '60'),
(107, '00253', '43', 'DA21TTA', '60'),
(108, '00253', '44', 'DA21TTA', '60'),
(109, '00254', '36', 'DA21TTA', '60'),
(110, '00254', '37', 'DA21TTA', '60'),
(111, '00254', '38', 'DA21TTA', '60'),
(112, '00254', '39', 'DA21TTA', '60'),
(113, '00254', '40', 'DA21TTA', '60'),
(114, '00254', '41', 'DA21TTA', '60'),
(115, '00254', '42', 'DA21TTA', '60'),
(116, '00254', '43', 'DA21TTA', '60'),
(117, '00254', '44', 'DA21TTA', '60'),
(118, '00255', '36', 'DA21TTA', '60'),
(119, '00255', '37', 'DA21TTA', '60'),
(120, '00255', '38', 'DA21TTA', '60'),
(121, '00255', '39', 'DA21TTA', '60'),
(122, '00255', '40', 'DA21TTA', '60'),
(123, '00255', '41', 'DA21TTA', '60'),
(124, '00255', '42', 'DA21TTA', '60'),
(125, '00255', '43', 'DA21TTA', '60'),
(126, '00255', '44', 'DA21TTA', '60'),
(127, '00257', '36', 'DA21TTA', '60'),
(128, '00257', '37', 'DA21TTA', '60'),
(129, '00257', '38', 'DA21TTA', '60'),
(130, '00257', '39', 'DA21TTA', '60'),
(131, '00257', '40', 'DA21TTA', '60'),
(132, '00257', '41', 'DA21TTA', '60'),
(133, '00257', '42', 'DA21TTA', '60'),
(134, '00257', '43', 'DA21TTA', '60'),
(135, '00257', '44', 'DA21TTA', '60'),
(136, '01027', '36', 'DA21TTA', '60'),
(137, '01027', '37', 'DA21TTA', '60'),
(138, '01027', '38', 'DA21TTA', '60'),
(139, '01027', '39', 'DA21TTA', '60'),
(140, '01027', '40', 'DA21TTA', '60'),
(141, '01027', '41', 'DA21TTA', '60'),
(142, '01027', '42', 'DA21TTA', '60'),
(143, '01027', '43', 'DA21TTA', '60'),
(144, '01027', '44', 'DA21TTA', '60'),
(145, '0122', '36', 'DA21TTA', '60'),
(146, '0122', '37', 'DA21TTA', '60'),
(147, '0122', '38', 'DA21TTA', '60'),
(148, '0122', '39', 'DA21TTA', '60'),
(149, '0122', '40', 'DA21TTA', '60'),
(150, '0122', '41', 'DA21TTA', '60'),
(151, '0122', '42', 'DA21TTA', '60'),
(152, '0122', '43', 'DA21TTA', '60'),
(153, '0122', '44', 'DA21TTA', '60'),
(154, '0123', '36', 'DA21TTA', '60'),
(155, '0123', '37', 'DA21TTA', '60'),
(156, '0123', '38', 'DA21TTA', '60'),
(157, '0123', '39', 'DA21TTA', '60'),
(158, '0123', '40', 'DA21TTA', '60'),
(159, '0123', '41', 'DA21TTA', '60'),
(160, '0123', '42', 'DA21TTA', '60'),
(161, '0123', '43', 'DA21TTA', '60'),
(162, '0123', '44', 'DA21TTA', '60'),
(163, '01548', '36', 'DA21TTA', '60'),
(164, '01548', '37', 'DA21TTA', '60'),
(165, '01548', '38', 'DA21TTA', '60'),
(166, '01548', '39', 'DA21TTA', '60'),
(167, '01548', '40', 'DA21TTA', '60'),
(168, '01548', '41', 'DA21TTA', '60'),
(169, '01548', '42', 'DA21TTA', '60'),
(170, '01548', '43', 'DA21TTA', '60'),
(171, '01548', '44', 'DA21TTA', '60'),
(172, '03539', '36', 'DA21TTA', '60'),
(173, '03539', '37', 'DA21TTA', '60'),
(174, '03539', '38', 'DA21TTA', '60'),
(175, '03539', '39', 'DA21TTA', '60'),
(176, '03539', '40', 'DA21TTA', '60'),
(177, '03539', '41', 'DA21TTA', '60'),
(178, '03539', '42', 'DA21TTA', '60'),
(179, '03539', '43', 'DA21TTA', '60'),
(180, '03539', '44', 'DA21TTA', '60'),
(181, '03546', '36', 'DA21TTA', '60'),
(182, '03546', '37', 'DA21TTA', '60'),
(183, '03546', '38', 'DA21TTA', '60'),
(184, '03546', '39', 'DA21TTA', '60'),
(185, '03546', '40', 'DA21TTA', '60'),
(186, '03546', '41', 'DA21TTA', '60'),
(187, '03546', '42', 'DA21TTA', '60'),
(188, '03546', '43', 'DA21TTA', '60'),
(189, '03546', '44', 'DA21TTA', '60'),
(190, '03562', '36', 'DA21TTA', '60'),
(191, '03562', '37', 'DA21TTA', '60'),
(192, '03562', '38', 'DA21TTA', '60'),
(193, '03562', '39', 'DA21TTA', '60'),
(194, '03562', '40', 'DA21TTA', '60'),
(195, '03562', '41', 'DA21TTA', '60'),
(196, '03562', '42', 'DA21TTA', '60'),
(197, '03562', '43', 'DA21TTA', '60'),
(198, '03562', '44', 'DA21TTA', '60'),
(199, '12700', '36', 'DA21TTA', '60'),
(200, '12700', '37', 'DA21TTA', '60'),
(201, '12700', '38', 'DA21TTA', '60'),
(202, '12700', '39', 'DA21TTA', '60'),
(203, '12700', '40', 'DA21TTA', '60'),
(204, '12700', '41', 'DA21TTA', '60'),
(205, '12700', '42', 'DA21TTA', '60'),
(206, '12700', '43', 'DA21TTA', '60'),
(207, '12700', '44', 'DA21TTA', '60'),
(208, '12701', '36', 'DA21TTA', '60'),
(209, '12701', '37', 'DA21TTA', '60'),
(210, '12701', '38', 'DA21TTA', '60'),
(211, '12701', '39', 'DA21TTA', '60'),
(212, '12701', '40', 'DA21TTA', '60'),
(213, '12701', '41', 'DA21TTA', '60'),
(214, '12701', '42', 'DA21TTA', '60'),
(215, '12701', '43', 'DA21TTA', '60'),
(216, '12701', '44', 'DA21TTA', '60'),
(217, '12702', '36', 'DA21TTA', '60'),
(218, '12702', '37', 'DA21TTA', '60'),
(219, '12702', '38', 'DA21TTA', '60'),
(220, '12702', '39', 'DA21TTA', '60'),
(221, '12702', '40', 'DA21TTA', '60'),
(222, '12702', '41', 'DA21TTA', '60'),
(223, '12702', '42', 'DA21TTA', '60'),
(224, '12702', '43', 'DA21TTA', '60'),
(225, '12702', '44', 'DA21TTA', '60'),
(226, '12705', '36', 'DA21TTA', '60'),
(227, '12705', '37', 'DA21TTA', '60'),
(228, '12705', '38', 'DA21TTA', '60'),
(229, '12705', '39', 'DA21TTA', '60'),
(230, '12705', '40', 'DA21TTA', '60'),
(231, '12705', '41', 'DA21TTA', '60'),
(232, '12705', '42', 'DA21TTA', '60'),
(233, '12705', '43', 'DA21TTA', '60'),
(234, '12705', '44', 'DA21TTA', '60'),
(235, '14204', '36', 'DA21TTA', '60'),
(236, '14204', '37', 'DA21TTA', '60'),
(237, '14204', '38', 'DA21TTA', '60'),
(238, '14204', '39', 'DA21TTA', '60'),
(239, '14204', '40', 'DA21TTA', '60'),
(240, '14204', '41', 'DA21TTA', '60'),
(241, '14204', '42', 'DA21TTA', '60'),
(242, '14204', '43', 'DA21TTA', '60'),
(243, '14204', '44', 'DA21TTA', '60'),
(244, '99997', '36', 'DA21TTA', '60'),
(245, '99997', '37', 'DA21TTA', '60'),
(246, '99997', '38', 'DA21TTA', '60'),
(247, '99997', '39', 'DA21TTA', '60'),
(248, '99997', '40', 'DA21TTA', '60'),
(249, '99997', '41', 'DA21TTA', '60'),
(250, '99997', '42', 'DA21TTA', '60'),
(251, '99997', '43', 'DA21TTA', '60'),
(252, '99997', '44', 'DA21TTA', '60'),
(253, '99999', '36', 'DA21TTA', '60'),
(254, '99999', '37', 'DA21TTA', '60'),
(255, '99999', '38', 'DA21TTA', '60'),
(256, '99999', '39', 'DA21TTA', '75'),
(257, '99999', '40', 'DA21TTA', '60'),
(258, '99999', '41', 'DA21TTA', '60'),
(259, '99999', '42', 'DA21TTA', '60'),
(260, '99999', '43', 'DA21TTA', '60'),
(261, '99999', '44', 'DA21TTA', '60'),
(262, 'GVNT22424', '36', 'DA21TTA', '60'),
(263, 'GVNT22424', '37', 'DA21TTA', '60'),
(264, 'GVNT22424', '38', 'DA21TTA', '60'),
(265, 'GVNT22424', '39', 'DA21TTA', '60'),
(266, 'GVNT22424', '40', 'DA21TTA', '60'),
(267, 'GVNT22424', '41', 'DA21TTA', '60'),
(268, 'GVNT22424', '42', 'DA21TTA', '60'),
(269, 'GVNT22424', '43', 'DA21TTA', '60'),
(270, 'GVNT22424', '44', 'DA21TTA', '60'),
(271, '00241', '55', 'DA20TTA', '60'),
(272, '00241', '56', 'DA20TTA', '60'),
(273, '00241', '57', 'DA20TTA', '60'),
(274, '00241', '58', 'DA20TTA', '60'),
(275, '00241', '59', 'DA20TTA', '60'),
(276, '00241', '60', 'DA20TTA', '60'),
(277, '00241', '61', 'DA20TTA', '60'),
(278, '00241', '62', 'DA20TTA', '60'),
(279, '00241', '63', 'DA20TTA', '60'),
(280, '00241', '64', 'DA20TTA', '60'),
(281, '00242', '55', 'DA20TTA', '60'),
(282, '00242', '56', 'DA20TTA', '60'),
(283, '00242', '57', 'DA20TTA', '60'),
(284, '00242', '58', 'DA20TTA', '60'),
(285, '00242', '59', 'DA20TTA', '60'),
(286, '00242', '60', 'DA20TTA', '60'),
(287, '00242', '61', 'DA20TTA', '60'),
(288, '00242', '62', 'DA20TTA', '60'),
(289, '00242', '63', 'DA20TTA', '60'),
(290, '00242', '64', 'DA20TTA', '60'),
(291, '00243', '55', 'DA20TTA', '60'),
(292, '00243', '56', 'DA20TTA', '60'),
(293, '00243', '57', 'DA20TTA', '60'),
(294, '00243', '58', 'DA20TTA', '60'),
(295, '00243', '59', 'DA20TTA', '60'),
(296, '00243', '60', 'DA20TTA', '60'),
(297, '00243', '61', 'DA20TTA', '60'),
(298, '00243', '62', 'DA20TTA', '60'),
(299, '00243', '63', 'DA20TTA', '60'),
(300, '00243', '64', 'DA20TTA', '60'),
(301, '00244', '55', 'DA20TTA', '60'),
(302, '00244', '56', 'DA20TTA', '60'),
(303, '00244', '57', 'DA20TTA', '60'),
(304, '00244', '58', 'DA20TTA', '60'),
(305, '00244', '59', 'DA20TTA', '60'),
(306, '00244', '60', 'DA20TTA', '60'),
(307, '00244', '61', 'DA20TTA', '60'),
(308, '00244', '62', 'DA20TTA', '60'),
(309, '00244', '63', 'DA20TTA', '60'),
(310, '00244', '64', 'DA20TTA', '60'),
(311, '00245', '55', 'DA20TTA', '60'),
(312, '00245', '56', 'DA20TTA', '60'),
(313, '00245', '57', 'DA20TTA', '60'),
(314, '00245', '58', 'DA20TTA', '60'),
(315, '00245', '59', 'DA20TTA', '60'),
(316, '00245', '60', 'DA20TTA', '60'),
(317, '00245', '61', 'DA20TTA', '60'),
(318, '00245', '62', 'DA20TTA', '60'),
(319, '00245', '63', 'DA20TTA', '60'),
(320, '00245', '64', 'DA20TTA', '60'),
(321, '00246', '55', 'DA20TTA', '60'),
(322, '00246', '56', 'DA20TTA', '60'),
(323, '00246', '57', 'DA20TTA', '60'),
(324, '00246', '58', 'DA20TTA', '60'),
(325, '00246', '59', 'DA20TTA', '60'),
(326, '00246', '60', 'DA20TTA', '60'),
(327, '00246', '61', 'DA20TTA', '60'),
(328, '00246', '62', 'DA20TTA', '60'),
(329, '00246', '63', 'DA20TTA', '60'),
(330, '00246', '64', 'DA20TTA', '60'),
(331, '00248', '55', 'DA20TTA', '60'),
(332, '00248', '56', 'DA20TTA', '60'),
(333, '00248', '57', 'DA20TTA', '60'),
(334, '00248', '58', 'DA20TTA', '60'),
(335, '00248', '59', 'DA20TTA', '60'),
(336, '00248', '60', 'DA20TTA', '60'),
(337, '00248', '61', 'DA20TTA', '60'),
(338, '00248', '62', 'DA20TTA', '60'),
(339, '00248', '63', 'DA20TTA', '60'),
(340, '00248', '64', 'DA20TTA', '60'),
(341, '00249', '55', 'DA20TTA', '60'),
(342, '00249', '56', 'DA20TTA', '60'),
(343, '00249', '57', 'DA20TTA', '60'),
(344, '00249', '58', 'DA20TTA', '60'),
(345, '00249', '59', 'DA20TTA', '60'),
(346, '00249', '60', 'DA20TTA', '60'),
(347, '00249', '61', 'DA20TTA', '60'),
(348, '00249', '62', 'DA20TTA', '60'),
(349, '00249', '63', 'DA20TTA', '60'),
(350, '00249', '64', 'DA20TTA', '60'),
(351, '00250', '55', 'DA20TTA', '60'),
(352, '00250', '56', 'DA20TTA', '60'),
(353, '00250', '57', 'DA20TTA', '60'),
(354, '00250', '58', 'DA20TTA', '60'),
(355, '00250', '59', 'DA20TTA', '60'),
(356, '00250', '60', 'DA20TTA', '60'),
(357, '00250', '61', 'DA20TTA', '60'),
(358, '00250', '62', 'DA20TTA', '60'),
(359, '00250', '63', 'DA20TTA', '60'),
(360, '00250', '64', 'DA20TTA', '60'),
(361, '00251', '55', 'DA20TTA', '60'),
(362, '00251', '56', 'DA20TTA', '60'),
(363, '00251', '57', 'DA20TTA', '60'),
(364, '00251', '58', 'DA20TTA', '60'),
(365, '00251', '59', 'DA20TTA', '60'),
(366, '00251', '60', 'DA20TTA', '60'),
(367, '00251', '61', 'DA20TTA', '60'),
(368, '00251', '62', 'DA20TTA', '60'),
(369, '00251', '63', 'DA20TTA', '60'),
(370, '00251', '64', 'DA20TTA', '60'),
(371, '00252', '55', 'DA20TTA', '60'),
(372, '00252', '56', 'DA20TTA', '60'),
(373, '00252', '57', 'DA20TTA', '60'),
(374, '00252', '58', 'DA20TTA', '60'),
(375, '00252', '59', 'DA20TTA', '60'),
(376, '00252', '60', 'DA20TTA', '60'),
(377, '00252', '61', 'DA20TTA', '60'),
(378, '00252', '62', 'DA20TTA', '60'),
(379, '00252', '63', 'DA20TTA', '60'),
(380, '00252', '64', 'DA20TTA', '60'),
(381, '00253', '55', 'DA20TTA', '60'),
(382, '00253', '56', 'DA20TTA', '60'),
(383, '00253', '57', 'DA20TTA', '60'),
(384, '00253', '58', 'DA20TTA', '60'),
(385, '00253', '59', 'DA20TTA', '60'),
(386, '00253', '60', 'DA20TTA', '60'),
(387, '00253', '61', 'DA20TTA', '60'),
(388, '00253', '62', 'DA20TTA', '60'),
(389, '00253', '63', 'DA20TTA', '60'),
(390, '00253', '64', 'DA20TTA', '60'),
(391, '00254', '55', 'DA20TTA', '60'),
(392, '00254', '56', 'DA20TTA', '60'),
(393, '00254', '57', 'DA20TTA', '60'),
(394, '00254', '58', 'DA20TTA', '60'),
(395, '00254', '59', 'DA20TTA', '60'),
(396, '00254', '60', 'DA20TTA', '60'),
(397, '00254', '61', 'DA20TTA', '60'),
(398, '00254', '62', 'DA20TTA', '60'),
(399, '00254', '63', 'DA20TTA', '60'),
(400, '00254', '64', 'DA20TTA', '60'),
(401, '00255', '55', 'DA20TTA', '60'),
(402, '00255', '56', 'DA20TTA', '60'),
(403, '00255', '57', 'DA20TTA', '60'),
(404, '00255', '58', 'DA20TTA', '60'),
(405, '00255', '59', 'DA20TTA', '60'),
(406, '00255', '60', 'DA20TTA', '60'),
(407, '00255', '61', 'DA20TTA', '60'),
(408, '00255', '62', 'DA20TTA', '60'),
(409, '00255', '63', 'DA20TTA', '60'),
(410, '00255', '64', 'DA20TTA', '60'),
(411, '00257', '55', 'DA20TTA', '60'),
(412, '00257', '56', 'DA20TTA', '60'),
(413, '00257', '57', 'DA20TTA', '60'),
(414, '00257', '58', 'DA20TTA', '60'),
(415, '00257', '59', 'DA20TTA', '60'),
(416, '00257', '60', 'DA20TTA', '60'),
(417, '00257', '61', 'DA20TTA', '60'),
(418, '00257', '62', 'DA20TTA', '60'),
(419, '00257', '63', 'DA20TTA', '60'),
(420, '00257', '64', 'DA20TTA', '60'),
(421, '01027', '55', 'DA20TTA', '60'),
(422, '01027', '56', 'DA20TTA', '60'),
(423, '01027', '57', 'DA20TTA', '60'),
(424, '01027', '58', 'DA20TTA', '60'),
(425, '01027', '59', 'DA20TTA', '60'),
(426, '01027', '60', 'DA20TTA', '60'),
(427, '01027', '61', 'DA20TTA', '60'),
(428, '01027', '62', 'DA20TTA', '60'),
(429, '01027', '63', 'DA20TTA', '60'),
(430, '01027', '64', 'DA20TTA', '60'),
(431, '0122', '55', 'DA20TTA', '60'),
(432, '0122', '56', 'DA20TTA', '60'),
(433, '0122', '57', 'DA20TTA', '60'),
(434, '0122', '58', 'DA20TTA', '60'),
(435, '0122', '59', 'DA20TTA', '60'),
(436, '0122', '60', 'DA20TTA', '60'),
(437, '0122', '61', 'DA20TTA', '60'),
(438, '0122', '62', 'DA20TTA', '60'),
(439, '0122', '63', 'DA20TTA', '60'),
(440, '0122', '64', 'DA20TTA', '60'),
(441, '0123', '55', 'DA20TTA', '60'),
(442, '0123', '56', 'DA20TTA', '60'),
(443, '0123', '57', 'DA20TTA', '60'),
(444, '0123', '58', 'DA20TTA', '60'),
(445, '0123', '59', 'DA20TTA', '60'),
(446, '0123', '60', 'DA20TTA', '60'),
(447, '0123', '61', 'DA20TTA', '60'),
(448, '0123', '62', 'DA20TTA', '60'),
(449, '0123', '63', 'DA20TTA', '60'),
(450, '0123', '64', 'DA20TTA', '60'),
(451, '01548', '55', 'DA20TTA', '60'),
(452, '01548', '56', 'DA20TTA', '60'),
(453, '01548', '57', 'DA20TTA', '60'),
(454, '01548', '58', 'DA20TTA', '60'),
(455, '01548', '59', 'DA20TTA', '60'),
(456, '01548', '60', 'DA20TTA', '60'),
(457, '01548', '61', 'DA20TTA', '60'),
(458, '01548', '62', 'DA20TTA', '60'),
(459, '01548', '63', 'DA20TTA', '60'),
(460, '01548', '64', 'DA20TTA', '60'),
(461, '03539', '55', 'DA20TTA', '60'),
(462, '03539', '56', 'DA20TTA', '60'),
(463, '03539', '57', 'DA20TTA', '60'),
(464, '03539', '58', 'DA20TTA', '60'),
(465, '03539', '59', 'DA20TTA', '60'),
(466, '03539', '60', 'DA20TTA', '60'),
(467, '03539', '61', 'DA20TTA', '60'),
(468, '03539', '62', 'DA20TTA', '60'),
(469, '03539', '63', 'DA20TTA', '60'),
(470, '03539', '64', 'DA20TTA', '60'),
(471, '03546', '55', 'DA20TTA', '60'),
(472, '03546', '56', 'DA20TTA', '60'),
(473, '03546', '57', 'DA20TTA', '60'),
(474, '03546', '58', 'DA20TTA', '60'),
(475, '03546', '59', 'DA20TTA', '60'),
(476, '03546', '60', 'DA20TTA', '60'),
(477, '03546', '61', 'DA20TTA', '60'),
(478, '03546', '62', 'DA20TTA', '60'),
(479, '03546', '63', 'DA20TTA', '60'),
(480, '03546', '64', 'DA20TTA', '60'),
(481, '03562', '55', 'DA20TTA', '60'),
(482, '03562', '56', 'DA20TTA', '60'),
(483, '03562', '57', 'DA20TTA', '60'),
(484, '03562', '58', 'DA20TTA', '60'),
(485, '03562', '59', 'DA20TTA', '60'),
(486, '03562', '60', 'DA20TTA', '60'),
(487, '03562', '61', 'DA20TTA', '60'),
(488, '03562', '62', 'DA20TTA', '60'),
(489, '03562', '63', 'DA20TTA', '60'),
(490, '03562', '64', 'DA20TTA', '60'),
(491, '12700', '55', 'DA20TTA', '60'),
(492, '12700', '56', 'DA20TTA', '60'),
(493, '12700', '57', 'DA20TTA', '60'),
(494, '12700', '58', 'DA20TTA', '60'),
(495, '12700', '59', 'DA20TTA', '60'),
(496, '12700', '60', 'DA20TTA', '60'),
(497, '12700', '61', 'DA20TTA', '60'),
(498, '12700', '62', 'DA20TTA', '60'),
(499, '12700', '63', 'DA20TTA', '60'),
(500, '12700', '64', 'DA20TTA', '60'),
(501, '12701', '55', 'DA20TTA', '60'),
(502, '12701', '56', 'DA20TTA', '60'),
(503, '12701', '57', 'DA20TTA', '60'),
(504, '12701', '58', 'DA20TTA', '60'),
(505, '12701', '59', 'DA20TTA', '60'),
(506, '12701', '60', 'DA20TTA', '60'),
(507, '12701', '61', 'DA20TTA', '60'),
(508, '12701', '62', 'DA20TTA', '60'),
(509, '12701', '63', 'DA20TTA', '60'),
(510, '12701', '64', 'DA20TTA', '60'),
(511, '12702', '55', 'DA20TTA', '60'),
(512, '12702', '56', 'DA20TTA', '60'),
(513, '12702', '57', 'DA20TTA', '60'),
(514, '12702', '58', 'DA20TTA', '60'),
(515, '12702', '59', 'DA20TTA', '60'),
(516, '12702', '60', 'DA20TTA', '60'),
(517, '12702', '61', 'DA20TTA', '60'),
(518, '12702', '62', 'DA20TTA', '60'),
(519, '12702', '63', 'DA20TTA', '60'),
(520, '12702', '64', 'DA20TTA', '60'),
(521, '12705', '55', 'DA20TTA', '60'),
(522, '12705', '56', 'DA20TTA', '60'),
(523, '12705', '57', 'DA20TTA', '60'),
(524, '12705', '58', 'DA20TTA', '60'),
(525, '12705', '59', 'DA20TTA', '60'),
(526, '12705', '60', 'DA20TTA', '60'),
(527, '12705', '61', 'DA20TTA', '60'),
(528, '12705', '62', 'DA20TTA', '60'),
(529, '12705', '63', 'DA20TTA', '60'),
(530, '12705', '64', 'DA20TTA', '60'),
(531, '14204', '55', 'DA20TTA', '60'),
(532, '14204', '56', 'DA20TTA', '60'),
(533, '14204', '57', 'DA20TTA', '60'),
(534, '14204', '58', 'DA20TTA', '60'),
(535, '14204', '59', 'DA20TTA', '60'),
(536, '14204', '60', 'DA20TTA', '60'),
(537, '14204', '61', 'DA20TTA', '60'),
(538, '14204', '62', 'DA20TTA', '60'),
(539, '14204', '63', 'DA20TTA', '60'),
(540, '14204', '64', 'DA20TTA', '60'),
(541, '99997', '55', 'DA20TTA', '60'),
(542, '99997', '56', 'DA20TTA', '60'),
(543, '99997', '57', 'DA20TTA', '60'),
(544, '99997', '58', 'DA20TTA', '60'),
(545, '99997', '59', 'DA20TTA', '60'),
(546, '99997', '60', 'DA20TTA', '60'),
(547, '99997', '61', 'DA20TTA', '60'),
(548, '99997', '62', 'DA20TTA', '60'),
(549, '99997', '63', 'DA20TTA', '60'),
(550, '99997', '64', 'DA20TTA', '60'),
(551, '99999', '55', 'DA20TTA', '60'),
(552, '99999', '56', 'DA20TTA', '60'),
(553, '99999', '57', 'DA20TTA', '60'),
(554, '99999', '58', 'DA20TTA', '60'),
(555, '99999', '59', 'DA20TTA', '60'),
(556, '99999', '60', 'DA20TTA', '60'),
(557, '99999', '61', 'DA20TTA', '60'),
(558, '99999', '62', 'DA20TTA', '60'),
(559, '99999', '63', 'DA20TTA', '60'),
(560, '99999', '64', 'DA20TTA', '60'),
(561, 'GVNT22424', '55', 'DA20TTA', '60'),
(562, 'GVNT22424', '56', 'DA20TTA', '60'),
(563, 'GVNT22424', '57', 'DA20TTA', '60'),
(564, 'GVNT22424', '58', 'DA20TTA', '60'),
(565, 'GVNT22424', '59', 'DA20TTA', '60'),
(566, 'GVNT22424', '60', 'DA20TTA', '60'),
(567, 'GVNT22424', '61', 'DA20TTA', '60'),
(568, 'GVNT22424', '62', 'DA20TTA', '60'),
(569, 'GVNT22424', '63', 'DA20TTA', '60'),
(570, 'GVNT22424', '64', 'DA20TTA', '60'),
(571, '00241', '55', 'DA20TTB', '60'),
(572, '00241', '56', 'DA20TTB', '60'),
(573, '00241', '57', 'DA20TTB', '60'),
(574, '00241', '58', 'DA20TTB', '60'),
(575, '00241', '59', 'DA20TTB', '60'),
(576, '00241', '60', 'DA20TTB', '60'),
(577, '00241', '61', 'DA20TTB', '60'),
(578, '00241', '62', 'DA20TTB', '60'),
(579, '00241', '63', 'DA20TTB', '60'),
(580, '00241', '64', 'DA20TTB', '60'),
(581, '00242', '55', 'DA20TTB', '60'),
(582, '00242', '56', 'DA20TTB', '60'),
(583, '00242', '57', 'DA20TTB', '60'),
(584, '00242', '58', 'DA20TTB', '60'),
(585, '00242', '59', 'DA20TTB', '60'),
(586, '00242', '60', 'DA20TTB', '60'),
(587, '00242', '61', 'DA20TTB', '60'),
(588, '00242', '62', 'DA20TTB', '60'),
(589, '00242', '63', 'DA20TTB', '60'),
(590, '00242', '64', 'DA20TTB', '60'),
(591, '00243', '55', 'DA20TTB', '60'),
(592, '00243', '56', 'DA20TTB', '60'),
(593, '00243', '57', 'DA20TTB', '60'),
(594, '00243', '58', 'DA20TTB', '60'),
(595, '00243', '59', 'DA20TTB', '60'),
(596, '00243', '60', 'DA20TTB', '60'),
(597, '00243', '61', 'DA20TTB', '60'),
(598, '00243', '62', 'DA20TTB', '60'),
(599, '00243', '63', 'DA20TTB', '60'),
(600, '00243', '64', 'DA20TTB', '60'),
(601, '00244', '55', 'DA20TTB', '60'),
(602, '00244', '56', 'DA20TTB', '60'),
(603, '00244', '57', 'DA20TTB', '60'),
(604, '00244', '58', 'DA20TTB', '60'),
(605, '00244', '59', 'DA20TTB', '60'),
(606, '00244', '60', 'DA20TTB', '60'),
(607, '00244', '61', 'DA20TTB', '60'),
(608, '00244', '62', 'DA20TTB', '60'),
(609, '00244', '63', 'DA20TTB', '60'),
(610, '00244', '64', 'DA20TTB', '60'),
(611, '00245', '55', 'DA20TTB', '60'),
(612, '00245', '56', 'DA20TTB', '60'),
(613, '00245', '57', 'DA20TTB', '60'),
(614, '00245', '58', 'DA20TTB', '60'),
(615, '00245', '59', 'DA20TTB', '60'),
(616, '00245', '60', 'DA20TTB', '60'),
(617, '00245', '61', 'DA20TTB', '60'),
(618, '00245', '62', 'DA20TTB', '60'),
(619, '00245', '63', 'DA20TTB', '60'),
(620, '00245', '64', 'DA20TTB', '60'),
(621, '00246', '55', 'DA20TTB', '60'),
(622, '00246', '56', 'DA20TTB', '60'),
(623, '00246', '57', 'DA20TTB', '60'),
(624, '00246', '58', 'DA20TTB', '60'),
(625, '00246', '59', 'DA20TTB', '60'),
(626, '00246', '60', 'DA20TTB', '60'),
(627, '00246', '61', 'DA20TTB', '60'),
(628, '00246', '62', 'DA20TTB', '60'),
(629, '00246', '63', 'DA20TTB', '60'),
(630, '00246', '64', 'DA20TTB', '60'),
(631, '00248', '55', 'DA20TTB', '60'),
(632, '00248', '56', 'DA20TTB', '60'),
(633, '00248', '57', 'DA20TTB', '60'),
(634, '00248', '58', 'DA20TTB', '60'),
(635, '00248', '59', 'DA20TTB', '60'),
(636, '00248', '60', 'DA20TTB', '60'),
(637, '00248', '61', 'DA20TTB', '60'),
(638, '00248', '62', 'DA20TTB', '60'),
(639, '00248', '63', 'DA20TTB', '60'),
(640, '00248', '64', 'DA20TTB', '60'),
(641, '00249', '55', 'DA20TTB', '60'),
(642, '00249', '56', 'DA20TTB', '60'),
(643, '00249', '57', 'DA20TTB', '60'),
(644, '00249', '58', 'DA20TTB', '60'),
(645, '00249', '59', 'DA20TTB', '60'),
(646, '00249', '60', 'DA20TTB', '60'),
(647, '00249', '61', 'DA20TTB', '60'),
(648, '00249', '62', 'DA20TTB', '60'),
(649, '00249', '63', 'DA20TTB', '60'),
(650, '00249', '64', 'DA20TTB', '60'),
(651, '00250', '55', 'DA20TTB', '60'),
(652, '00250', '56', 'DA20TTB', '60'),
(653, '00250', '57', 'DA20TTB', '60'),
(654, '00250', '58', 'DA20TTB', '60'),
(655, '00250', '59', 'DA20TTB', '60'),
(656, '00250', '60', 'DA20TTB', '60'),
(657, '00250', '61', 'DA20TTB', '60'),
(658, '00250', '62', 'DA20TTB', '60'),
(659, '00250', '63', 'DA20TTB', '60'),
(660, '00250', '64', 'DA20TTB', '60'),
(661, '00251', '55', 'DA20TTB', '60'),
(662, '00251', '56', 'DA20TTB', '60'),
(663, '00251', '57', 'DA20TTB', '60'),
(664, '00251', '58', 'DA20TTB', '60'),
(665, '00251', '59', 'DA20TTB', '60'),
(666, '00251', '60', 'DA20TTB', '60'),
(667, '00251', '61', 'DA20TTB', '60'),
(668, '00251', '62', 'DA20TTB', '60'),
(669, '00251', '63', 'DA20TTB', '60'),
(670, '00251', '64', 'DA20TTB', '60'),
(671, '00252', '55', 'DA20TTB', '60'),
(672, '00252', '56', 'DA20TTB', '60'),
(673, '00252', '57', 'DA20TTB', '60'),
(674, '00252', '58', 'DA20TTB', '60'),
(675, '00252', '59', 'DA20TTB', '60'),
(676, '00252', '60', 'DA20TTB', '60'),
(677, '00252', '61', 'DA20TTB', '60'),
(678, '00252', '62', 'DA20TTB', '60'),
(679, '00252', '63', 'DA20TTB', '60'),
(680, '00252', '64', 'DA20TTB', '60'),
(681, '00253', '55', 'DA20TTB', '60'),
(682, '00253', '56', 'DA20TTB', '60'),
(683, '00253', '57', 'DA20TTB', '60'),
(684, '00253', '58', 'DA20TTB', '60'),
(685, '00253', '59', 'DA20TTB', '60'),
(686, '00253', '60', 'DA20TTB', '60'),
(687, '00253', '61', 'DA20TTB', '60'),
(688, '00253', '62', 'DA20TTB', '60'),
(689, '00253', '63', 'DA20TTB', '60'),
(690, '00253', '64', 'DA20TTB', '60'),
(691, '00254', '55', 'DA20TTB', '60'),
(692, '00254', '56', 'DA20TTB', '60'),
(693, '00254', '57', 'DA20TTB', '60'),
(694, '00254', '58', 'DA20TTB', '60'),
(695, '00254', '59', 'DA20TTB', '60'),
(696, '00254', '60', 'DA20TTB', '60'),
(697, '00254', '61', 'DA20TTB', '60'),
(698, '00254', '62', 'DA20TTB', '60'),
(699, '00254', '63', 'DA20TTB', '60'),
(700, '00254', '64', 'DA20TTB', '60'),
(701, '00255', '55', 'DA20TTB', '60'),
(702, '00255', '56', 'DA20TTB', '60'),
(703, '00255', '57', 'DA20TTB', '60'),
(704, '00255', '58', 'DA20TTB', '60'),
(705, '00255', '59', 'DA20TTB', '60'),
(706, '00255', '60', 'DA20TTB', '60'),
(707, '00255', '61', 'DA20TTB', '60'),
(708, '00255', '62', 'DA20TTB', '60'),
(709, '00255', '63', 'DA20TTB', '60'),
(710, '00255', '64', 'DA20TTB', '60'),
(711, '00257', '55', 'DA20TTB', '60'),
(712, '00257', '56', 'DA20TTB', '60'),
(713, '00257', '57', 'DA20TTB', '60'),
(714, '00257', '58', 'DA20TTB', '60'),
(715, '00257', '59', 'DA20TTB', '60'),
(716, '00257', '60', 'DA20TTB', '60'),
(717, '00257', '61', 'DA20TTB', '60'),
(718, '00257', '62', 'DA20TTB', '60'),
(719, '00257', '63', 'DA20TTB', '60'),
(720, '00257', '64', 'DA20TTB', '60'),
(721, '01027', '55', 'DA20TTB', '60'),
(722, '01027', '56', 'DA20TTB', '60'),
(723, '01027', '57', 'DA20TTB', '60'),
(724, '01027', '58', 'DA20TTB', '60'),
(725, '01027', '59', 'DA20TTB', '60'),
(726, '01027', '60', 'DA20TTB', '60'),
(727, '01027', '61', 'DA20TTB', '60'),
(728, '01027', '62', 'DA20TTB', '60'),
(729, '01027', '63', 'DA20TTB', '60'),
(730, '01027', '64', 'DA20TTB', '60'),
(731, '0122', '55', 'DA20TTB', '60'),
(732, '0122', '56', 'DA20TTB', '60'),
(733, '0122', '57', 'DA20TTB', '60'),
(734, '0122', '58', 'DA20TTB', '60'),
(735, '0122', '59', 'DA20TTB', '60'),
(736, '0122', '60', 'DA20TTB', '60'),
(737, '0122', '61', 'DA20TTB', '60'),
(738, '0122', '62', 'DA20TTB', '60'),
(739, '0122', '63', 'DA20TTB', '60'),
(740, '0122', '64', 'DA20TTB', '60'),
(741, '0123', '55', 'DA20TTB', '60'),
(742, '0123', '56', 'DA20TTB', '60'),
(743, '0123', '57', 'DA20TTB', '60'),
(744, '0123', '58', 'DA20TTB', '60'),
(745, '0123', '59', 'DA20TTB', '60'),
(746, '0123', '60', 'DA20TTB', '60'),
(747, '0123', '61', 'DA20TTB', '60'),
(748, '0123', '62', 'DA20TTB', '60'),
(749, '0123', '63', 'DA20TTB', '60'),
(750, '0123', '64', 'DA20TTB', '60'),
(751, '01548', '55', 'DA20TTB', '60'),
(752, '01548', '56', 'DA20TTB', '60'),
(753, '01548', '57', 'DA20TTB', '60'),
(754, '01548', '58', 'DA20TTB', '60'),
(755, '01548', '59', 'DA20TTB', '60'),
(756, '01548', '60', 'DA20TTB', '60'),
(757, '01548', '61', 'DA20TTB', '60'),
(758, '01548', '62', 'DA20TTB', '60'),
(759, '01548', '63', 'DA20TTB', '60'),
(760, '01548', '64', 'DA20TTB', '60'),
(761, '03539', '55', 'DA20TTB', '60'),
(762, '03539', '56', 'DA20TTB', '60'),
(763, '03539', '57', 'DA20TTB', '60'),
(764, '03539', '58', 'DA20TTB', '60'),
(765, '03539', '59', 'DA20TTB', '60'),
(766, '03539', '60', 'DA20TTB', '60'),
(767, '03539', '61', 'DA20TTB', '60'),
(768, '03539', '62', 'DA20TTB', '60'),
(769, '03539', '63', 'DA20TTB', '60'),
(770, '03539', '64', 'DA20TTB', '60'),
(771, '03546', '55', 'DA20TTB', '60'),
(772, '03546', '56', 'DA20TTB', '60'),
(773, '03546', '57', 'DA20TTB', '60'),
(774, '03546', '58', 'DA20TTB', '60'),
(775, '03546', '59', 'DA20TTB', '60'),
(776, '03546', '60', 'DA20TTB', '60'),
(777, '03546', '61', 'DA20TTB', '60'),
(778, '03546', '62', 'DA20TTB', '60'),
(779, '03546', '63', 'DA20TTB', '60'),
(780, '03546', '64', 'DA20TTB', '60'),
(781, '03562', '55', 'DA20TTB', '60'),
(782, '03562', '56', 'DA20TTB', '60'),
(783, '03562', '57', 'DA20TTB', '60'),
(784, '03562', '58', 'DA20TTB', '60'),
(785, '03562', '59', 'DA20TTB', '60'),
(786, '03562', '60', 'DA20TTB', '60'),
(787, '03562', '61', 'DA20TTB', '60'),
(788, '03562', '62', 'DA20TTB', '60'),
(789, '03562', '63', 'DA20TTB', '60'),
(790, '03562', '64', 'DA20TTB', '60'),
(791, '12700', '55', 'DA20TTB', '60'),
(792, '12700', '56', 'DA20TTB', '60'),
(793, '12700', '57', 'DA20TTB', '60'),
(794, '12700', '58', 'DA20TTB', '60'),
(795, '12700', '59', 'DA20TTB', '60'),
(796, '12700', '60', 'DA20TTB', '60'),
(797, '12700', '61', 'DA20TTB', '60'),
(798, '12700', '62', 'DA20TTB', '60'),
(799, '12700', '63', 'DA20TTB', '60'),
(800, '12700', '64', 'DA20TTB', '60'),
(801, '12701', '55', 'DA20TTB', '60'),
(802, '12701', '56', 'DA20TTB', '60'),
(803, '12701', '57', 'DA20TTB', '60'),
(804, '12701', '58', 'DA20TTB', '60'),
(805, '12701', '59', 'DA20TTB', '60'),
(806, '12701', '60', 'DA20TTB', '60'),
(807, '12701', '61', 'DA20TTB', '60'),
(808, '12701', '62', 'DA20TTB', '60'),
(809, '12701', '63', 'DA20TTB', '60'),
(810, '12701', '64', 'DA20TTB', '60'),
(811, '12702', '55', 'DA20TTB', '60'),
(812, '12702', '56', 'DA20TTB', '60'),
(813, '12702', '57', 'DA20TTB', '60'),
(814, '12702', '58', 'DA20TTB', '60'),
(815, '12702', '59', 'DA20TTB', '60'),
(816, '12702', '60', 'DA20TTB', '60'),
(817, '12702', '61', 'DA20TTB', '60'),
(818, '12702', '62', 'DA20TTB', '60'),
(819, '12702', '63', 'DA20TTB', '60'),
(820, '12702', '64', 'DA20TTB', '60'),
(821, '12705', '55', 'DA20TTB', '60'),
(822, '12705', '56', 'DA20TTB', '60'),
(823, '12705', '57', 'DA20TTB', '60'),
(824, '12705', '58', 'DA20TTB', '60'),
(825, '12705', '59', 'DA20TTB', '60'),
(826, '12705', '60', 'DA20TTB', '60'),
(827, '12705', '61', 'DA20TTB', '60'),
(828, '12705', '62', 'DA20TTB', '60'),
(829, '12705', '63', 'DA20TTB', '60'),
(830, '12705', '64', 'DA20TTB', '60'),
(831, '14204', '55', 'DA20TTB', '60'),
(832, '14204', '56', 'DA20TTB', '60'),
(833, '14204', '57', 'DA20TTB', '60'),
(834, '14204', '58', 'DA20TTB', '60'),
(835, '14204', '59', 'DA20TTB', '60'),
(836, '14204', '60', 'DA20TTB', '60'),
(837, '14204', '61', 'DA20TTB', '60'),
(838, '14204', '62', 'DA20TTB', '60'),
(839, '14204', '63', 'DA20TTB', '60'),
(840, '14204', '64', 'DA20TTB', '60'),
(841, '99997', '55', 'DA20TTB', '60'),
(842, '99997', '56', 'DA20TTB', '60'),
(843, '99997', '57', 'DA20TTB', '60'),
(844, '99997', '58', 'DA20TTB', '60'),
(845, '99997', '59', 'DA20TTB', '60'),
(846, '99997', '60', 'DA20TTB', '60'),
(847, '99997', '61', 'DA20TTB', '60'),
(848, '99997', '62', 'DA20TTB', '60'),
(849, '99997', '63', 'DA20TTB', '60'),
(850, '99997', '64', 'DA20TTB', '60'),
(851, '99999', '55', 'DA20TTB', '60'),
(852, '99999', '56', 'DA20TTB', '60'),
(853, '99999', '57', 'DA20TTB', '60'),
(854, '99999', '58', 'DA20TTB', '60'),
(855, '99999', '59', 'DA20TTB', '60'),
(856, '99999', '60', 'DA20TTB', '60'),
(857, '99999', '61', 'DA20TTB', '60'),
(858, '99999', '62', 'DA20TTB', '60'),
(859, '99999', '63', 'DA20TTB', '60'),
(860, '99999', '64', 'DA20TTB', '60'),
(861, 'GVNT22424', '55', 'DA20TTB', '60'),
(862, 'GVNT22424', '56', 'DA20TTB', '60'),
(863, 'GVNT22424', '57', 'DA20TTB', '60'),
(864, 'GVNT22424', '58', 'DA20TTB', '60'),
(865, 'GVNT22424', '59', 'DA20TTB', '60'),
(866, 'GVNT22424', '60', 'DA20TTB', '60'),
(867, 'GVNT22424', '61', 'DA20TTB', '60'),
(868, 'GVNT22424', '62', 'DA20TTB', '60'),
(869, 'GVNT22424', '63', 'DA20TTB', '60'),
(870, 'GVNT22424', '64', 'DA20TTB', '60'),
(871, '00241', '19', 'DA22TTA', '60'),
(872, '00241', '20', 'DA22TTA', '60'),
(873, '00241', '21', 'DA22TTA', '60'),
(874, '00241', '22', 'DA22TTA', '60'),
(875, '00241', '23', 'DA22TTA', '60'),
(876, '00241', '24', 'DA22TTA', '60'),
(877, '00241', '25', 'DA22TTA', '60'),
(878, '00241', '26', 'DA22TTA', '60'),
(879, '00242', '19', 'DA22TTA', '60'),
(880, '00242', '20', 'DA22TTA', '60'),
(881, '00242', '21', 'DA22TTA', '60'),
(882, '00242', '22', 'DA22TTA', '60'),
(883, '00242', '23', 'DA22TTA', '60'),
(884, '00242', '24', 'DA22TTA', '60'),
(885, '00242', '25', 'DA22TTA', '60'),
(886, '00242', '26', 'DA22TTA', '60'),
(887, '00243', '19', 'DA22TTA', '60'),
(888, '00243', '20', 'DA22TTA', '60'),
(889, '00243', '21', 'DA22TTA', '60'),
(890, '00243', '22', 'DA22TTA', '60'),
(891, '00243', '23', 'DA22TTA', '60'),
(892, '00243', '24', 'DA22TTA', '60'),
(893, '00243', '25', 'DA22TTA', '60'),
(894, '00243', '26', 'DA22TTA', '60'),
(895, '00244', '19', 'DA22TTA', '60'),
(896, '00244', '20', 'DA22TTA', '60'),
(897, '00244', '21', 'DA22TTA', '60'),
(898, '00244', '22', 'DA22TTA', '60'),
(899, '00244', '23', 'DA22TTA', '60'),
(900, '00244', '24', 'DA22TTA', '60'),
(901, '00244', '25', 'DA22TTA', '60'),
(902, '00244', '26', 'DA22TTA', '60'),
(903, '00245', '19', 'DA22TTA', '60'),
(904, '00245', '20', 'DA22TTA', '60'),
(905, '00245', '21', 'DA22TTA', '60'),
(906, '00245', '22', 'DA22TTA', '60'),
(907, '00245', '23', 'DA22TTA', '60'),
(908, '00245', '24', 'DA22TTA', '60'),
(909, '00245', '25', 'DA22TTA', '60'),
(910, '00245', '26', 'DA22TTA', '60'),
(911, '00246', '19', 'DA22TTA', '60'),
(912, '00246', '20', 'DA22TTA', '60'),
(913, '00246', '21', 'DA22TTA', '60'),
(914, '00246', '22', 'DA22TTA', '60'),
(915, '00246', '23', 'DA22TTA', '60'),
(916, '00246', '24', 'DA22TTA', '60'),
(917, '00246', '25', 'DA22TTA', '60'),
(918, '00246', '26', 'DA22TTA', '60'),
(919, '00248', '19', 'DA22TTA', '60'),
(920, '00248', '20', 'DA22TTA', '60'),
(921, '00248', '21', 'DA22TTA', '60'),
(922, '00248', '22', 'DA22TTA', '60'),
(923, '00248', '23', 'DA22TTA', '60'),
(924, '00248', '24', 'DA22TTA', '60'),
(925, '00248', '25', 'DA22TTA', '60'),
(926, '00248', '26', 'DA22TTA', '60'),
(927, '00249', '19', 'DA22TTA', '60'),
(928, '00249', '20', 'DA22TTA', '60'),
(929, '00249', '21', 'DA22TTA', '60'),
(930, '00249', '22', 'DA22TTA', '60'),
(931, '00249', '23', 'DA22TTA', '60'),
(932, '00249', '24', 'DA22TTA', '60'),
(933, '00249', '25', 'DA22TTA', '60'),
(934, '00249', '26', 'DA22TTA', '60'),
(935, '00250', '19', 'DA22TTA', '60'),
(936, '00250', '20', 'DA22TTA', '60'),
(937, '00250', '21', 'DA22TTA', '60'),
(938, '00250', '22', 'DA22TTA', '60'),
(939, '00250', '23', 'DA22TTA', '60'),
(940, '00250', '24', 'DA22TTA', '60'),
(941, '00250', '25', 'DA22TTA', '60'),
(942, '00250', '26', 'DA22TTA', '60'),
(943, '00251', '19', 'DA22TTA', '60'),
(944, '00251', '20', 'DA22TTA', '60'),
(945, '00251', '21', 'DA22TTA', '60'),
(946, '00251', '22', 'DA22TTA', '60'),
(947, '00251', '23', 'DA22TTA', '60'),
(948, '00251', '24', 'DA22TTA', '60'),
(949, '00251', '25', 'DA22TTA', '60'),
(950, '00251', '26', 'DA22TTA', '60'),
(951, '00252', '19', 'DA22TTA', '60'),
(952, '00252', '20', 'DA22TTA', '60'),
(953, '00252', '21', 'DA22TTA', '60'),
(954, '00252', '22', 'DA22TTA', '60'),
(955, '00252', '23', 'DA22TTA', '60'),
(956, '00252', '24', 'DA22TTA', '60'),
(957, '00252', '25', 'DA22TTA', '60'),
(958, '00252', '26', 'DA22TTA', '60'),
(959, '00253', '19', 'DA22TTA', '60'),
(960, '00253', '20', 'DA22TTA', '60'),
(961, '00253', '21', 'DA22TTA', '60'),
(962, '00253', '22', 'DA22TTA', '60'),
(963, '00253', '23', 'DA22TTA', '60'),
(964, '00253', '24', 'DA22TTA', '60'),
(965, '00253', '25', 'DA22TTA', '60'),
(966, '00253', '26', 'DA22TTA', '60'),
(967, '00254', '19', 'DA22TTA', '60'),
(968, '00254', '20', 'DA22TTA', '60'),
(969, '00254', '21', 'DA22TTA', '60'),
(970, '00254', '22', 'DA22TTA', '60'),
(971, '00254', '23', 'DA22TTA', '60'),
(972, '00254', '24', 'DA22TTA', '60'),
(973, '00254', '25', 'DA22TTA', '60'),
(974, '00254', '26', 'DA22TTA', '60'),
(975, '00255', '19', 'DA22TTA', '60'),
(976, '00255', '20', 'DA22TTA', '60'),
(977, '00255', '21', 'DA22TTA', '60'),
(978, '00255', '22', 'DA22TTA', '60'),
(979, '00255', '23', 'DA22TTA', '60'),
(980, '00255', '24', 'DA22TTA', '60'),
(981, '00255', '25', 'DA22TTA', '60'),
(982, '00255', '26', 'DA22TTA', '60'),
(983, '00257', '19', 'DA22TTA', '60'),
(984, '00257', '20', 'DA22TTA', '60'),
(985, '00257', '21', 'DA22TTA', '60'),
(986, '00257', '22', 'DA22TTA', '60'),
(987, '00257', '23', 'DA22TTA', '60'),
(988, '00257', '24', 'DA22TTA', '60'),
(989, '00257', '25', 'DA22TTA', '60'),
(990, '00257', '26', 'DA22TTA', '60'),
(991, '01027', '19', 'DA22TTA', '60'),
(992, '01027', '20', 'DA22TTA', '60'),
(993, '01027', '21', 'DA22TTA', '60'),
(994, '01027', '22', 'DA22TTA', '60'),
(995, '01027', '23', 'DA22TTA', '60'),
(996, '01027', '24', 'DA22TTA', '60'),
(997, '01027', '25', 'DA22TTA', '60'),
(998, '01027', '26', 'DA22TTA', '60'),
(999, '0122', '19', 'DA22TTA', '60'),
(1000, '0122', '20', 'DA22TTA', '60'),
(1001, '0122', '21', 'DA22TTA', '60'),
(1002, '0122', '22', 'DA22TTA', '60'),
(1003, '0122', '23', 'DA22TTA', '60'),
(1004, '0122', '24', 'DA22TTA', '60'),
(1005, '0122', '25', 'DA22TTA', '60'),
(1006, '0122', '26', 'DA22TTA', '60'),
(1007, '0123', '19', 'DA22TTA', '60'),
(1008, '0123', '20', 'DA22TTA', '60'),
(1009, '0123', '21', 'DA22TTA', '60'),
(1010, '0123', '22', 'DA22TTA', '60'),
(1011, '0123', '23', 'DA22TTA', '60'),
(1012, '0123', '24', 'DA22TTA', '60'),
(1013, '0123', '25', 'DA22TTA', '60'),
(1014, '0123', '26', 'DA22TTA', '60'),
(1015, '01548', '19', 'DA22TTA', '60'),
(1016, '01548', '20', 'DA22TTA', '60'),
(1017, '01548', '21', 'DA22TTA', '60'),
(1018, '01548', '22', 'DA22TTA', '60'),
(1019, '01548', '23', 'DA22TTA', '60'),
(1020, '01548', '24', 'DA22TTA', '60'),
(1021, '01548', '25', 'DA22TTA', '60'),
(1022, '01548', '26', 'DA22TTA', '60'),
(1023, '03539', '19', 'DA22TTA', '60'),
(1024, '03539', '20', 'DA22TTA', '60'),
(1025, '03539', '21', 'DA22TTA', '60'),
(1026, '03539', '22', 'DA22TTA', '60'),
(1027, '03539', '23', 'DA22TTA', '60'),
(1028, '03539', '24', 'DA22TTA', '60'),
(1029, '03539', '25', 'DA22TTA', '60'),
(1030, '03539', '26', 'DA22TTA', '60'),
(1031, '03546', '19', 'DA22TTA', '60'),
(1032, '03546', '20', 'DA22TTA', '60'),
(1033, '03546', '21', 'DA22TTA', '60'),
(1034, '03546', '22', 'DA22TTA', '60'),
(1035, '03546', '23', 'DA22TTA', '60'),
(1036, '03546', '24', 'DA22TTA', '60'),
(1037, '03546', '25', 'DA22TTA', '60'),
(1038, '03546', '26', 'DA22TTA', '60'),
(1039, '03562', '19', 'DA22TTA', '60'),
(1040, '03562', '20', 'DA22TTA', '60'),
(1041, '03562', '21', 'DA22TTA', '60'),
(1042, '03562', '22', 'DA22TTA', '60'),
(1043, '03562', '23', 'DA22TTA', '60'),
(1044, '03562', '24', 'DA22TTA', '60'),
(1045, '03562', '25', 'DA22TTA', '60'),
(1046, '03562', '26', 'DA22TTA', '60'),
(1047, '12700', '19', 'DA22TTA', '60'),
(1048, '12700', '20', 'DA22TTA', '60'),
(1049, '12700', '21', 'DA22TTA', '60'),
(1050, '12700', '22', 'DA22TTA', '60'),
(1051, '12700', '23', 'DA22TTA', '60'),
(1052, '12700', '24', 'DA22TTA', '60'),
(1053, '12700', '25', 'DA22TTA', '60'),
(1054, '12700', '26', 'DA22TTA', '60'),
(1055, '12701', '19', 'DA22TTA', '60'),
(1056, '12701', '20', 'DA22TTA', '60'),
(1057, '12701', '21', 'DA22TTA', '60'),
(1058, '12701', '22', 'DA22TTA', '60'),
(1059, '12701', '23', 'DA22TTA', '60'),
(1060, '12701', '24', 'DA22TTA', '60'),
(1061, '12701', '25', 'DA22TTA', '60'),
(1062, '12701', '26', 'DA22TTA', '60'),
(1063, '12702', '19', 'DA22TTA', '60'),
(1064, '12702', '20', 'DA22TTA', '60'),
(1065, '12702', '21', 'DA22TTA', '60'),
(1066, '12702', '22', 'DA22TTA', '60'),
(1067, '12702', '23', 'DA22TTA', '60'),
(1068, '12702', '24', 'DA22TTA', '60'),
(1069, '12702', '25', 'DA22TTA', '60'),
(1070, '12702', '26', 'DA22TTA', '60'),
(1071, '12705', '19', 'DA22TTA', '60'),
(1072, '12705', '20', 'DA22TTA', '60'),
(1073, '12705', '21', 'DA22TTA', '60'),
(1074, '12705', '22', 'DA22TTA', '60'),
(1075, '12705', '23', 'DA22TTA', '60'),
(1076, '12705', '24', 'DA22TTA', '60'),
(1077, '12705', '25', 'DA22TTA', '60'),
(1078, '12705', '26', 'DA22TTA', '60'),
(1079, '14204', '19', 'DA22TTA', '60'),
(1080, '14204', '20', 'DA22TTA', '60'),
(1081, '14204', '21', 'DA22TTA', '60'),
(1082, '14204', '22', 'DA22TTA', '60'),
(1083, '14204', '23', 'DA22TTA', '60'),
(1084, '14204', '24', 'DA22TTA', '60'),
(1085, '14204', '25', 'DA22TTA', '60'),
(1086, '14204', '26', 'DA22TTA', '60'),
(1087, '99997', '19', 'DA22TTA', '60'),
(1088, '99997', '20', 'DA22TTA', '60'),
(1089, '99997', '21', 'DA22TTA', '60'),
(1090, '99997', '22', 'DA22TTA', '60'),
(1091, '99997', '23', 'DA22TTA', '60'),
(1092, '99997', '24', 'DA22TTA', '60'),
(1093, '99997', '25', 'DA22TTA', '60'),
(1094, '99997', '26', 'DA22TTA', '60'),
(1095, '99999', '19', 'DA22TTA', '60'),
(1096, '99999', '20', 'DA22TTA', '60'),
(1097, '99999', '21', 'DA22TTA', '60'),
(1098, '99999', '22', 'DA22TTA', '60'),
(1099, '99999', '23', 'DA22TTA', '60'),
(1100, '99999', '24', 'DA22TTA', '60'),
(1101, '99999', '25', 'DA22TTA', '60'),
(1102, '99999', '26', 'DA22TTA', '60'),
(1103, 'GVNT22424', '19', 'DA22TTA', '60'),
(1104, 'GVNT22424', '20', 'DA22TTA', '60'),
(1105, 'GVNT22424', '21', 'DA22TTA', '60'),
(1106, 'GVNT22424', '22', 'DA22TTA', '60'),
(1107, 'GVNT22424', '23', 'DA22TTA', '60'),
(1108, 'GVNT22424', '24', 'DA22TTA', '60'),
(1109, 'GVNT22424', '25', 'DA22TTA', '60'),
(1110, 'GVNT22424', '26', 'DA22TTA', '60'),
(1111, '00241', '1', 'DA23TTA', '60'),
(1112, '00241', '2', 'DA23TTA', '60'),
(1113, '00241', '3', 'DA23TTA', '60'),
(1114, '00241', '4', 'DA23TTA', '60'),
(1115, '00241', '5', 'DA23TTA', '60'),
(1116, '00241', '6', 'DA23TTA', '60'),
(1117, '00241', '7', 'DA23TTA', '60'),
(1118, '00241', '8', 'DA23TTA', '60'),
(1119, '00241', '9', 'DA23TTA', '60'),
(1120, '00242', '1', 'DA23TTA', '60'),
(1121, '00242', '2', 'DA23TTA', '60'),
(1122, '00242', '3', 'DA23TTA', '60'),
(1123, '00242', '4', 'DA23TTA', '60'),
(1124, '00242', '5', 'DA23TTA', '60'),
(1125, '00242', '6', 'DA23TTA', '60'),
(1126, '00242', '7', 'DA23TTA', '60'),
(1127, '00242', '8', 'DA23TTA', '60'),
(1128, '00242', '9', 'DA23TTA', '60'),
(1129, '00243', '1', 'DA23TTA', '60'),
(1130, '00243', '2', 'DA23TTA', '60'),
(1131, '00243', '3', 'DA23TTA', '60'),
(1132, '00243', '4', 'DA23TTA', '60'),
(1133, '00243', '5', 'DA23TTA', '60'),
(1134, '00243', '6', 'DA23TTA', '60'),
(1135, '00243', '7', 'DA23TTA', '60'),
(1136, '00243', '8', 'DA23TTA', '60'),
(1137, '00243', '9', 'DA23TTA', '60'),
(1138, '00244', '1', 'DA23TTA', '60'),
(1139, '00244', '2', 'DA23TTA', '60'),
(1140, '00244', '3', 'DA23TTA', '60'),
(1141, '00244', '4', 'DA23TTA', '60'),
(1142, '00244', '5', 'DA23TTA', '60'),
(1143, '00244', '6', 'DA23TTA', '60'),
(1144, '00244', '7', 'DA23TTA', '60'),
(1145, '00244', '8', 'DA23TTA', '60'),
(1146, '00244', '9', 'DA23TTA', '60'),
(1147, '00245', '1', 'DA23TTA', '60'),
(1148, '00245', '2', 'DA23TTA', '60'),
(1149, '00245', '3', 'DA23TTA', '60'),
(1150, '00245', '4', 'DA23TTA', '60'),
(1151, '00245', '5', 'DA23TTA', '60'),
(1152, '00245', '6', 'DA23TTA', '60'),
(1153, '00245', '7', 'DA23TTA', '60'),
(1154, '00245', '8', 'DA23TTA', '60'),
(1155, '00245', '9', 'DA23TTA', '60'),
(1156, '00246', '1', 'DA23TTA', '60'),
(1157, '00246', '2', 'DA23TTA', '60'),
(1158, '00246', '3', 'DA23TTA', '60'),
(1159, '00246', '4', 'DA23TTA', '60'),
(1160, '00246', '5', 'DA23TTA', '60'),
(1161, '00246', '6', 'DA23TTA', '60'),
(1162, '00246', '7', 'DA23TTA', '60'),
(1163, '00246', '8', 'DA23TTA', '60'),
(1164, '00246', '9', 'DA23TTA', '60'),
(1165, '00248', '1', 'DA23TTA', '60'),
(1166, '00248', '2', 'DA23TTA', '60'),
(1167, '00248', '3', 'DA23TTA', '60'),
(1168, '00248', '4', 'DA23TTA', '60'),
(1169, '00248', '5', 'DA23TTA', '60'),
(1170, '00248', '6', 'DA23TTA', '60'),
(1171, '00248', '7', 'DA23TTA', '60'),
(1172, '00248', '8', 'DA23TTA', '60'),
(1173, '00248', '9', 'DA23TTA', '60'),
(1174, '00249', '1', 'DA23TTA', '60'),
(1175, '00249', '2', 'DA23TTA', '60'),
(1176, '00249', '3', 'DA23TTA', '60'),
(1177, '00249', '4', 'DA23TTA', '60'),
(1178, '00249', '5', 'DA23TTA', '60'),
(1179, '00249', '6', 'DA23TTA', '60'),
(1180, '00249', '7', 'DA23TTA', '60'),
(1181, '00249', '8', 'DA23TTA', '60'),
(1182, '00249', '9', 'DA23TTA', '60'),
(1183, '00250', '1', 'DA23TTA', '60'),
(1184, '00250', '2', 'DA23TTA', '60'),
(1185, '00250', '3', 'DA23TTA', '60'),
(1186, '00250', '4', 'DA23TTA', '60'),
(1187, '00250', '5', 'DA23TTA', '60'),
(1188, '00250', '6', 'DA23TTA', '60'),
(1189, '00250', '7', 'DA23TTA', '60'),
(1190, '00250', '8', 'DA23TTA', '60'),
(1191, '00250', '9', 'DA23TTA', '60'),
(1192, '00251', '1', 'DA23TTA', '60'),
(1193, '00251', '2', 'DA23TTA', '60'),
(1194, '00251', '3', 'DA23TTA', '60'),
(1195, '00251', '4', 'DA23TTA', '60'),
(1196, '00251', '5', 'DA23TTA', '60'),
(1197, '00251', '6', 'DA23TTA', '60'),
(1198, '00251', '7', 'DA23TTA', '60'),
(1199, '00251', '8', 'DA23TTA', '60'),
(1200, '00251', '9', 'DA23TTA', '60'),
(1201, '00252', '1', 'DA23TTA', '60'),
(1202, '00252', '2', 'DA23TTA', '60'),
(1203, '00252', '3', 'DA23TTA', '60'),
(1204, '00252', '4', 'DA23TTA', '60'),
(1205, '00252', '5', 'DA23TTA', '60'),
(1206, '00252', '6', 'DA23TTA', '60'),
(1207, '00252', '7', 'DA23TTA', '60'),
(1208, '00252', '8', 'DA23TTA', '60'),
(1209, '00252', '9', 'DA23TTA', '60'),
(1210, '00253', '1', 'DA23TTA', '60'),
(1211, '00253', '2', 'DA23TTA', '60'),
(1212, '00253', '3', 'DA23TTA', '60'),
(1213, '00253', '4', 'DA23TTA', '60'),
(1214, '00253', '5', 'DA23TTA', '60'),
(1215, '00253', '6', 'DA23TTA', '60'),
(1216, '00253', '7', 'DA23TTA', '60'),
(1217, '00253', '8', 'DA23TTA', '60'),
(1218, '00253', '9', 'DA23TTA', '60'),
(1219, '00254', '1', 'DA23TTA', '60'),
(1220, '00254', '2', 'DA23TTA', '60'),
(1221, '00254', '3', 'DA23TTA', '60'),
(1222, '00254', '4', 'DA23TTA', '60'),
(1223, '00254', '5', 'DA23TTA', '60'),
(1224, '00254', '6', 'DA23TTA', '60'),
(1225, '00254', '7', 'DA23TTA', '60'),
(1226, '00254', '8', 'DA23TTA', '60'),
(1227, '00254', '9', 'DA23TTA', '60'),
(1228, '00255', '1', 'DA23TTA', '60'),
(1229, '00255', '2', 'DA23TTA', '60'),
(1230, '00255', '3', 'DA23TTA', '60'),
(1231, '00255', '4', 'DA23TTA', '60'),
(1232, '00255', '5', 'DA23TTA', '60'),
(1233, '00255', '6', 'DA23TTA', '60'),
(1234, '00255', '7', 'DA23TTA', '60'),
(1235, '00255', '8', 'DA23TTA', '60'),
(1236, '00255', '9', 'DA23TTA', '60'),
(1237, '00257', '1', 'DA23TTA', '60'),
(1238, '00257', '2', 'DA23TTA', '60'),
(1239, '00257', '3', 'DA23TTA', '60'),
(1240, '00257', '4', 'DA23TTA', '60'),
(1241, '00257', '5', 'DA23TTA', '60'),
(1242, '00257', '6', 'DA23TTA', '60'),
(1243, '00257', '7', 'DA23TTA', '60'),
(1244, '00257', '8', 'DA23TTA', '60'),
(1245, '00257', '9', 'DA23TTA', '60'),
(1246, '01027', '1', 'DA23TTA', '60'),
(1247, '01027', '2', 'DA23TTA', '60'),
(1248, '01027', '3', 'DA23TTA', '60'),
(1249, '01027', '4', 'DA23TTA', '60'),
(1250, '01027', '5', 'DA23TTA', '60'),
(1251, '01027', '6', 'DA23TTA', '60'),
(1252, '01027', '7', 'DA23TTA', '60'),
(1253, '01027', '8', 'DA23TTA', '60'),
(1254, '01027', '9', 'DA23TTA', '60'),
(1255, '0122', '1', 'DA23TTA', '60'),
(1256, '0122', '2', 'DA23TTA', '60'),
(1257, '0122', '3', 'DA23TTA', '60'),
(1258, '0122', '4', 'DA23TTA', '60'),
(1259, '0122', '5', 'DA23TTA', '60'),
(1260, '0122', '6', 'DA23TTA', '60'),
(1261, '0122', '7', 'DA23TTA', '60'),
(1262, '0122', '8', 'DA23TTA', '60'),
(1263, '0122', '9', 'DA23TTA', '60'),
(1264, '0123', '1', 'DA23TTA', '60'),
(1265, '0123', '2', 'DA23TTA', '60'),
(1266, '0123', '3', 'DA23TTA', '60'),
(1267, '0123', '4', 'DA23TTA', '60'),
(1268, '0123', '5', 'DA23TTA', '60'),
(1269, '0123', '6', 'DA23TTA', '60'),
(1270, '0123', '7', 'DA23TTA', '60'),
(1271, '0123', '8', 'DA23TTA', '60'),
(1272, '0123', '9', 'DA23TTA', '60'),
(1273, '01548', '1', 'DA23TTA', '60'),
(1274, '01548', '2', 'DA23TTA', '60'),
(1275, '01548', '3', 'DA23TTA', '60'),
(1276, '01548', '4', 'DA23TTA', '60'),
(1277, '01548', '5', 'DA23TTA', '60'),
(1278, '01548', '6', 'DA23TTA', '60'),
(1279, '01548', '7', 'DA23TTA', '60'),
(1280, '01548', '8', 'DA23TTA', '60'),
(1281, '01548', '9', 'DA23TTA', '60'),
(1282, '03539', '1', 'DA23TTA', '60'),
(1283, '03539', '2', 'DA23TTA', '60'),
(1284, '03539', '3', 'DA23TTA', '60'),
(1285, '03539', '4', 'DA23TTA', '60'),
(1286, '03539', '5', 'DA23TTA', '60'),
(1287, '03539', '6', 'DA23TTA', '60'),
(1288, '03539', '7', 'DA23TTA', '60'),
(1289, '03539', '8', 'DA23TTA', '60'),
(1290, '03539', '9', 'DA23TTA', '60'),
(1291, '03546', '1', 'DA23TTA', '60'),
(1292, '03546', '2', 'DA23TTA', '60'),
(1293, '03546', '3', 'DA23TTA', '60'),
(1294, '03546', '4', 'DA23TTA', '60'),
(1295, '03546', '5', 'DA23TTA', '60'),
(1296, '03546', '6', 'DA23TTA', '60'),
(1297, '03546', '7', 'DA23TTA', '60'),
(1298, '03546', '8', 'DA23TTA', '60'),
(1299, '03546', '9', 'DA23TTA', '60'),
(1300, '03562', '1', 'DA23TTA', '60'),
(1301, '03562', '2', 'DA23TTA', '60'),
(1302, '03562', '3', 'DA23TTA', '60'),
(1303, '03562', '4', 'DA23TTA', '60'),
(1304, '03562', '5', 'DA23TTA', '60'),
(1305, '03562', '6', 'DA23TTA', '60'),
(1306, '03562', '7', 'DA23TTA', '60'),
(1307, '03562', '8', 'DA23TTA', '60'),
(1308, '03562', '9', 'DA23TTA', '60'),
(1309, '12700', '1', 'DA23TTA', '60'),
(1310, '12700', '2', 'DA23TTA', '60'),
(1311, '12700', '3', 'DA23TTA', '60'),
(1312, '12700', '4', 'DA23TTA', '60'),
(1313, '12700', '5', 'DA23TTA', '60'),
(1314, '12700', '6', 'DA23TTA', '60'),
(1315, '12700', '7', 'DA23TTA', '60'),
(1316, '12700', '8', 'DA23TTA', '60'),
(1317, '12700', '9', 'DA23TTA', '60'),
(1318, '12701', '1', 'DA23TTA', '60'),
(1319, '12701', '2', 'DA23TTA', '60'),
(1320, '12701', '3', 'DA23TTA', '60'),
(1321, '12701', '4', 'DA23TTA', '60'),
(1322, '12701', '5', 'DA23TTA', '60'),
(1323, '12701', '6', 'DA23TTA', '60'),
(1324, '12701', '7', 'DA23TTA', '60'),
(1325, '12701', '8', 'DA23TTA', '60'),
(1326, '12701', '9', 'DA23TTA', '60'),
(1327, '12702', '1', 'DA23TTA', '60'),
(1328, '12702', '2', 'DA23TTA', '60'),
(1329, '12702', '3', 'DA23TTA', '60'),
(1330, '12702', '4', 'DA23TTA', '60'),
(1331, '12702', '5', 'DA23TTA', '60'),
(1332, '12702', '6', 'DA23TTA', '60'),
(1333, '12702', '7', 'DA23TTA', '60'),
(1334, '12702', '8', 'DA23TTA', '60'),
(1335, '12702', '9', 'DA23TTA', '60'),
(1336, '12705', '1', 'DA23TTA', '60'),
(1337, '12705', '2', 'DA23TTA', '60'),
(1338, '12705', '3', 'DA23TTA', '60'),
(1339, '12705', '4', 'DA23TTA', '60'),
(1340, '12705', '5', 'DA23TTA', '60'),
(1341, '12705', '6', 'DA23TTA', '60'),
(1342, '12705', '7', 'DA23TTA', '60'),
(1343, '12705', '8', 'DA23TTA', '60'),
(1344, '12705', '9', 'DA23TTA', '60'),
(1345, '14204', '1', 'DA23TTA', '60'),
(1346, '14204', '2', 'DA23TTA', '60');
INSERT INTO `phan_cong_gv_tu_dong` (`MAPCGVTD`, `MAGV_PCGVTD`, `MA_MON_HOC_PCGVTD`, `MA_LOP_PCGVTD`, `DO_UU_TIEN_PCGVTD`) VALUES
(1347, '14204', '3', 'DA23TTA', '60'),
(1348, '14204', '4', 'DA23TTA', '60'),
(1349, '14204', '5', 'DA23TTA', '60'),
(1350, '14204', '6', 'DA23TTA', '60'),
(1351, '14204', '7', 'DA23TTA', '60'),
(1352, '14204', '8', 'DA23TTA', '60'),
(1353, '14204', '9', 'DA23TTA', '60'),
(1354, '99997', '1', 'DA23TTA', '60'),
(1355, '99997', '2', 'DA23TTA', '60'),
(1356, '99997', '3', 'DA23TTA', '60'),
(1357, '99997', '4', 'DA23TTA', '60'),
(1358, '99997', '5', 'DA23TTA', '60'),
(1359, '99997', '6', 'DA23TTA', '60'),
(1360, '99997', '7', 'DA23TTA', '60'),
(1361, '99997', '8', 'DA23TTA', '60'),
(1362, '99997', '9', 'DA23TTA', '60'),
(1363, '99999', '1', 'DA23TTA', '60'),
(1364, '99999', '2', 'DA23TTA', '60'),
(1365, '99999', '3', 'DA23TTA', '60'),
(1366, '99999', '4', 'DA23TTA', '60'),
(1367, '99999', '5', 'DA23TTA', '60'),
(1368, '99999', '6', 'DA23TTA', '60'),
(1369, '99999', '7', 'DA23TTA', '60'),
(1370, '99999', '8', 'DA23TTA', '60'),
(1371, '99999', '9', 'DA23TTA', '60'),
(1372, 'GVNT22424', '1', 'DA23TTA', '60'),
(1373, 'GVNT22424', '2', 'DA23TTA', '60'),
(1374, 'GVNT22424', '3', 'DA23TTA', '60'),
(1375, 'GVNT22424', '4', 'DA23TTA', '60'),
(1376, 'GVNT22424', '5', 'DA23TTA', '60'),
(1377, 'GVNT22424', '6', 'DA23TTA', '60'),
(1378, 'GVNT22424', '7', 'DA23TTA', '60'),
(1379, 'GVNT22424', '8', 'DA23TTA', '60'),
(1380, 'GVNT22424', '9', 'DA23TTA', '60'),
(1381, '00241', '36', 'DA21TTC', '60'),
(1382, '00241', '37', 'DA21TTC', '60'),
(1383, '00241', '38', 'DA21TTC', '60'),
(1384, '00241', '39', 'DA21TTC', '60'),
(1385, '00241', '40', 'DA21TTC', '60'),
(1386, '00241', '41', 'DA21TTC', '60'),
(1387, '00241', '42', 'DA21TTC', '60'),
(1388, '00241', '43', 'DA21TTC', '60'),
(1389, '00241', '44', 'DA21TTC', '60'),
(1390, '00242', '36', 'DA21TTC', '60'),
(1391, '00242', '37', 'DA21TTC', '60'),
(1392, '00242', '38', 'DA21TTC', '60'),
(1393, '00242', '39', 'DA21TTC', '60'),
(1394, '00242', '40', 'DA21TTC', '60'),
(1395, '00242', '41', 'DA21TTC', '60'),
(1396, '00242', '42', 'DA21TTC', '60'),
(1397, '00242', '43', 'DA21TTC', '60'),
(1398, '00242', '44', 'DA21TTC', '60'),
(1399, '00243', '36', 'DA21TTC', '60'),
(1400, '00243', '37', 'DA21TTC', '60'),
(1401, '00243', '38', 'DA21TTC', '60'),
(1402, '00243', '39', 'DA21TTC', '60'),
(1403, '00243', '40', 'DA21TTC', '60'),
(1404, '00243', '41', 'DA21TTC', '60'),
(1405, '00243', '42', 'DA21TTC', '60'),
(1406, '00243', '43', 'DA21TTC', '60'),
(1407, '00243', '44', 'DA21TTC', '60'),
(1408, '00244', '36', 'DA21TTC', '60'),
(1409, '00244', '37', 'DA21TTC', '60'),
(1410, '00244', '38', 'DA21TTC', '60'),
(1411, '00244', '39', 'DA21TTC', '60'),
(1412, '00244', '40', 'DA21TTC', '60'),
(1413, '00244', '41', 'DA21TTC', '60'),
(1414, '00244', '42', 'DA21TTC', '60'),
(1415, '00244', '43', 'DA21TTC', '60'),
(1416, '00244', '44', 'DA21TTC', '60'),
(1417, '00245', '36', 'DA21TTC', '60'),
(1418, '00245', '37', 'DA21TTC', '60'),
(1419, '00245', '38', 'DA21TTC', '60'),
(1420, '00245', '39', 'DA21TTC', '60'),
(1421, '00245', '40', 'DA21TTC', '60'),
(1422, '00245', '41', 'DA21TTC', '60'),
(1423, '00245', '42', 'DA21TTC', '60'),
(1424, '00245', '43', 'DA21TTC', '60'),
(1425, '00245', '44', 'DA21TTC', '60'),
(1426, '00246', '36', 'DA21TTC', '60'),
(1427, '00246', '37', 'DA21TTC', '60'),
(1428, '00246', '38', 'DA21TTC', '60'),
(1429, '00246', '39', 'DA21TTC', '60'),
(1430, '00246', '40', 'DA21TTC', '60'),
(1431, '00246', '41', 'DA21TTC', '60'),
(1432, '00246', '42', 'DA21TTC', '60'),
(1433, '00246', '43', 'DA21TTC', '60'),
(1434, '00246', '44', 'DA21TTC', '60'),
(1435, '00248', '36', 'DA21TTC', '60'),
(1436, '00248', '37', 'DA21TTC', '60'),
(1437, '00248', '38', 'DA21TTC', '60'),
(1438, '00248', '39', 'DA21TTC', '60'),
(1439, '00248', '40', 'DA21TTC', '60'),
(1440, '00248', '41', 'DA21TTC', '60'),
(1441, '00248', '42', 'DA21TTC', '60'),
(1442, '00248', '43', 'DA21TTC', '60'),
(1443, '00248', '44', 'DA21TTC', '60'),
(1444, '00249', '36', 'DA21TTC', '60'),
(1445, '00249', '37', 'DA21TTC', '60'),
(1446, '00249', '38', 'DA21TTC', '60'),
(1447, '00249', '39', 'DA21TTC', '60'),
(1448, '00249', '40', 'DA21TTC', '60'),
(1449, '00249', '41', 'DA21TTC', '60'),
(1450, '00249', '42', 'DA21TTC', '60'),
(1451, '00249', '43', 'DA21TTC', '60'),
(1452, '00249', '44', 'DA21TTC', '60'),
(1453, '00250', '36', 'DA21TTC', '60'),
(1454, '00250', '37', 'DA21TTC', '60'),
(1455, '00250', '38', 'DA21TTC', '60'),
(1456, '00250', '39', 'DA21TTC', '60'),
(1457, '00250', '40', 'DA21TTC', '60'),
(1458, '00250', '41', 'DA21TTC', '60'),
(1459, '00250', '42', 'DA21TTC', '60'),
(1460, '00250', '43', 'DA21TTC', '60'),
(1461, '00250', '44', 'DA21TTC', '60'),
(1462, '00251', '36', 'DA21TTC', '60'),
(1463, '00251', '37', 'DA21TTC', '60'),
(1464, '00251', '38', 'DA21TTC', '60'),
(1465, '00251', '39', 'DA21TTC', '60'),
(1466, '00251', '40', 'DA21TTC', '60'),
(1467, '00251', '41', 'DA21TTC', '60'),
(1468, '00251', '42', 'DA21TTC', '60'),
(1469, '00251', '43', 'DA21TTC', '60'),
(1470, '00251', '44', 'DA21TTC', '60'),
(1471, '00252', '36', 'DA21TTC', '60'),
(1472, '00252', '37', 'DA21TTC', '60'),
(1473, '00252', '38', 'DA21TTC', '60'),
(1474, '00252', '39', 'DA21TTC', '60'),
(1475, '00252', '40', 'DA21TTC', '60'),
(1476, '00252', '41', 'DA21TTC', '60'),
(1477, '00252', '42', 'DA21TTC', '60'),
(1478, '00252', '43', 'DA21TTC', '60'),
(1479, '00252', '44', 'DA21TTC', '60'),
(1480, '00253', '36', 'DA21TTC', '60'),
(1481, '00253', '37', 'DA21TTC', '60'),
(1482, '00253', '38', 'DA21TTC', '60'),
(1483, '00253', '39', 'DA21TTC', '60'),
(1484, '00253', '40', 'DA21TTC', '60'),
(1485, '00253', '41', 'DA21TTC', '60'),
(1486, '00253', '42', 'DA21TTC', '60'),
(1487, '00253', '43', 'DA21TTC', '60'),
(1488, '00253', '44', 'DA21TTC', '60'),
(1489, '00254', '36', 'DA21TTC', '60'),
(1490, '00254', '37', 'DA21TTC', '60'),
(1491, '00254', '38', 'DA21TTC', '60'),
(1492, '00254', '39', 'DA21TTC', '60'),
(1493, '00254', '40', 'DA21TTC', '60'),
(1494, '00254', '41', 'DA21TTC', '60'),
(1495, '00254', '42', 'DA21TTC', '60'),
(1496, '00254', '43', 'DA21TTC', '60'),
(1497, '00254', '44', 'DA21TTC', '60'),
(1498, '00255', '36', 'DA21TTC', '60'),
(1499, '00255', '37', 'DA21TTC', '60'),
(1500, '00255', '38', 'DA21TTC', '60'),
(1501, '00255', '39', 'DA21TTC', '60'),
(1502, '00255', '40', 'DA21TTC', '60'),
(1503, '00255', '41', 'DA21TTC', '60'),
(1504, '00255', '42', 'DA21TTC', '60'),
(1505, '00255', '43', 'DA21TTC', '60'),
(1506, '00255', '44', 'DA21TTC', '60'),
(1507, '00257', '36', 'DA21TTC', '60'),
(1508, '00257', '37', 'DA21TTC', '60'),
(1509, '00257', '38', 'DA21TTC', '60'),
(1510, '00257', '39', 'DA21TTC', '60'),
(1511, '00257', '40', 'DA21TTC', '60'),
(1512, '00257', '41', 'DA21TTC', '60'),
(1513, '00257', '42', 'DA21TTC', '60'),
(1514, '00257', '43', 'DA21TTC', '60'),
(1515, '00257', '44', 'DA21TTC', '60'),
(1516, '01027', '36', 'DA21TTC', '60'),
(1517, '01027', '37', 'DA21TTC', '60'),
(1518, '01027', '38', 'DA21TTC', '60'),
(1519, '01027', '39', 'DA21TTC', '60'),
(1520, '01027', '40', 'DA21TTC', '60'),
(1521, '01027', '41', 'DA21TTC', '60'),
(1522, '01027', '42', 'DA21TTC', '60'),
(1523, '01027', '43', 'DA21TTC', '60'),
(1524, '01027', '44', 'DA21TTC', '60'),
(1525, '0122', '36', 'DA21TTC', '60'),
(1526, '0122', '37', 'DA21TTC', '60'),
(1527, '0122', '38', 'DA21TTC', '60'),
(1528, '0122', '39', 'DA21TTC', '60'),
(1529, '0122', '40', 'DA21TTC', '60'),
(1530, '0122', '41', 'DA21TTC', '60'),
(1531, '0122', '42', 'DA21TTC', '60'),
(1532, '0122', '43', 'DA21TTC', '60'),
(1533, '0122', '44', 'DA21TTC', '60'),
(1534, '0123', '36', 'DA21TTC', '60'),
(1535, '0123', '37', 'DA21TTC', '60'),
(1536, '0123', '38', 'DA21TTC', '60'),
(1537, '0123', '39', 'DA21TTC', '60'),
(1538, '0123', '40', 'DA21TTC', '60'),
(1539, '0123', '41', 'DA21TTC', '60'),
(1540, '0123', '42', 'DA21TTC', '60'),
(1541, '0123', '43', 'DA21TTC', '60'),
(1542, '0123', '44', 'DA21TTC', '60'),
(1543, '01548', '36', 'DA21TTC', '60'),
(1544, '01548', '37', 'DA21TTC', '60'),
(1545, '01548', '38', 'DA21TTC', '60'),
(1546, '01548', '39', 'DA21TTC', '60'),
(1547, '01548', '40', 'DA21TTC', '60'),
(1548, '01548', '41', 'DA21TTC', '60'),
(1549, '01548', '42', 'DA21TTC', '60'),
(1550, '01548', '43', 'DA21TTC', '60'),
(1551, '01548', '44', 'DA21TTC', '60'),
(1552, '03539', '36', 'DA21TTC', '60'),
(1553, '03539', '37', 'DA21TTC', '60'),
(1554, '03539', '38', 'DA21TTC', '60'),
(1555, '03539', '39', 'DA21TTC', '60'),
(1556, '03539', '40', 'DA21TTC', '60'),
(1557, '03539', '41', 'DA21TTC', '60'),
(1558, '03539', '42', 'DA21TTC', '60'),
(1559, '03539', '43', 'DA21TTC', '60'),
(1560, '03539', '44', 'DA21TTC', '60'),
(1561, '03546', '36', 'DA21TTC', '60'),
(1562, '03546', '37', 'DA21TTC', '60'),
(1563, '03546', '38', 'DA21TTC', '60'),
(1564, '03546', '39', 'DA21TTC', '60'),
(1565, '03546', '40', 'DA21TTC', '60'),
(1566, '03546', '41', 'DA21TTC', '60'),
(1567, '03546', '42', 'DA21TTC', '60'),
(1568, '03546', '43', 'DA21TTC', '60'),
(1569, '03546', '44', 'DA21TTC', '60'),
(1570, '03562', '36', 'DA21TTC', '60'),
(1571, '03562', '37', 'DA21TTC', '60'),
(1572, '03562', '38', 'DA21TTC', '60'),
(1573, '03562', '39', 'DA21TTC', '60'),
(1574, '03562', '40', 'DA21TTC', '60'),
(1575, '03562', '41', 'DA21TTC', '60'),
(1576, '03562', '42', 'DA21TTC', '60'),
(1577, '03562', '43', 'DA21TTC', '60'),
(1578, '03562', '44', 'DA21TTC', '60'),
(1579, '12700', '36', 'DA21TTC', '60'),
(1580, '12700', '37', 'DA21TTC', '60'),
(1581, '12700', '38', 'DA21TTC', '60'),
(1582, '12700', '39', 'DA21TTC', '60'),
(1583, '12700', '40', 'DA21TTC', '60'),
(1584, '12700', '41', 'DA21TTC', '60'),
(1585, '12700', '42', 'DA21TTC', '60'),
(1586, '12700', '43', 'DA21TTC', '60'),
(1587, '12700', '44', 'DA21TTC', '60'),
(1588, '12701', '36', 'DA21TTC', '60'),
(1589, '12701', '37', 'DA21TTC', '60'),
(1590, '12701', '38', 'DA21TTC', '60'),
(1591, '12701', '39', 'DA21TTC', '60'),
(1592, '12701', '40', 'DA21TTC', '60'),
(1593, '12701', '41', 'DA21TTC', '60'),
(1594, '12701', '42', 'DA21TTC', '60'),
(1595, '12701', '43', 'DA21TTC', '60'),
(1596, '12701', '44', 'DA21TTC', '60'),
(1597, '12702', '36', 'DA21TTC', '60'),
(1598, '12702', '37', 'DA21TTC', '60'),
(1599, '12702', '38', 'DA21TTC', '60'),
(1600, '12702', '39', 'DA21TTC', '60'),
(1601, '12702', '40', 'DA21TTC', '60'),
(1602, '12702', '41', 'DA21TTC', '60'),
(1603, '12702', '42', 'DA21TTC', '60'),
(1604, '12702', '43', 'DA21TTC', '60'),
(1605, '12702', '44', 'DA21TTC', '60'),
(1606, '12705', '36', 'DA21TTC', '60'),
(1607, '12705', '37', 'DA21TTC', '60'),
(1608, '12705', '38', 'DA21TTC', '60'),
(1609, '12705', '39', 'DA21TTC', '60'),
(1610, '12705', '40', 'DA21TTC', '60'),
(1611, '12705', '41', 'DA21TTC', '60'),
(1612, '12705', '42', 'DA21TTC', '60'),
(1613, '12705', '43', 'DA21TTC', '60'),
(1614, '12705', '44', 'DA21TTC', '60'),
(1615, '14204', '36', 'DA21TTC', '60'),
(1616, '14204', '37', 'DA21TTC', '60'),
(1617, '14204', '38', 'DA21TTC', '60'),
(1618, '14204', '39', 'DA21TTC', '60'),
(1619, '14204', '40', 'DA21TTC', '60'),
(1620, '14204', '41', 'DA21TTC', '60'),
(1621, '14204', '42', 'DA21TTC', '60'),
(1622, '14204', '43', 'DA21TTC', '60'),
(1623, '14204', '44', 'DA21TTC', '60'),
(1624, '99997', '36', 'DA21TTC', '60'),
(1625, '99997', '37', 'DA21TTC', '60'),
(1626, '99997', '38', 'DA21TTC', '60'),
(1627, '99997', '39', 'DA21TTC', '60'),
(1628, '99997', '40', 'DA21TTC', '60'),
(1629, '99997', '41', 'DA21TTC', '60'),
(1630, '99997', '42', 'DA21TTC', '60'),
(1631, '99997', '43', 'DA21TTC', '60'),
(1632, '99997', '44', 'DA21TTC', '60'),
(1633, '99999', '36', 'DA21TTC', '60'),
(1634, '99999', '37', 'DA21TTC', '60'),
(1635, '99999', '38', 'DA21TTC', '60'),
(1636, '99999', '39', 'DA21TTC', '75'),
(1637, '99999', '40', 'DA21TTC', '60'),
(1638, '99999', '41', 'DA21TTC', '60'),
(1639, '99999', '42', 'DA21TTC', '60'),
(1640, '99999', '43', 'DA21TTC', '60'),
(1641, '99999', '44', 'DA21TTC', '60'),
(1642, 'GVNT22424', '36', 'DA21TTC', '60'),
(1643, 'GVNT22424', '37', 'DA21TTC', '60'),
(1644, 'GVNT22424', '38', 'DA21TTC', '60'),
(1645, 'GVNT22424', '39', 'DA21TTC', '60'),
(1646, 'GVNT22424', '40', 'DA21TTC', '60'),
(1647, 'GVNT22424', '41', 'DA21TTC', '60'),
(1648, 'GVNT22424', '42', 'DA21TTC', '60'),
(1649, 'GVNT22424', '43', 'DA21TTC', '60'),
(1650, 'GVNT22424', '44', 'DA21TTC', '60'),
(1651, '00241', '19', 'DA22TTD', '60'),
(1652, '00241', '20', 'DA22TTD', '60'),
(1653, '00241', '21', 'DA22TTD', '60'),
(1654, '00241', '22', 'DA22TTD', '60'),
(1655, '00241', '23', 'DA22TTD', '60'),
(1656, '00241', '24', 'DA22TTD', '60'),
(1657, '00241', '25', 'DA22TTD', '60'),
(1658, '00241', '26', 'DA22TTD', '60'),
(1659, '00242', '19', 'DA22TTD', '60'),
(1660, '00242', '20', 'DA22TTD', '60'),
(1661, '00242', '21', 'DA22TTD', '60'),
(1662, '00242', '22', 'DA22TTD', '60'),
(1663, '00242', '23', 'DA22TTD', '60'),
(1664, '00242', '24', 'DA22TTD', '60'),
(1665, '00242', '25', 'DA22TTD', '60'),
(1666, '00242', '26', 'DA22TTD', '60'),
(1667, '00243', '19', 'DA22TTD', '60'),
(1668, '00243', '20', 'DA22TTD', '60'),
(1669, '00243', '21', 'DA22TTD', '60'),
(1670, '00243', '22', 'DA22TTD', '60'),
(1671, '00243', '23', 'DA22TTD', '60'),
(1672, '00243', '24', 'DA22TTD', '60'),
(1673, '00243', '25', 'DA22TTD', '60'),
(1674, '00243', '26', 'DA22TTD', '60'),
(1675, '00244', '19', 'DA22TTD', '60'),
(1676, '00244', '20', 'DA22TTD', '60'),
(1677, '00244', '21', 'DA22TTD', '60'),
(1678, '00244', '22', 'DA22TTD', '60'),
(1679, '00244', '23', 'DA22TTD', '60'),
(1680, '00244', '24', 'DA22TTD', '60'),
(1681, '00244', '25', 'DA22TTD', '60'),
(1682, '00244', '26', 'DA22TTD', '60'),
(1683, '00245', '19', 'DA22TTD', '60'),
(1684, '00245', '20', 'DA22TTD', '60'),
(1685, '00245', '21', 'DA22TTD', '60'),
(1686, '00245', '22', 'DA22TTD', '60'),
(1687, '00245', '23', 'DA22TTD', '60'),
(1688, '00245', '24', 'DA22TTD', '60'),
(1689, '00245', '25', 'DA22TTD', '60'),
(1690, '00245', '26', 'DA22TTD', '60'),
(1691, '00246', '19', 'DA22TTD', '60'),
(1692, '00246', '20', 'DA22TTD', '60'),
(1693, '00246', '21', 'DA22TTD', '60'),
(1694, '00246', '22', 'DA22TTD', '60'),
(1695, '00246', '23', 'DA22TTD', '60'),
(1696, '00246', '24', 'DA22TTD', '60'),
(1697, '00246', '25', 'DA22TTD', '60'),
(1698, '00246', '26', 'DA22TTD', '60'),
(1699, '00248', '19', 'DA22TTD', '60'),
(1700, '00248', '20', 'DA22TTD', '60'),
(1701, '00248', '21', 'DA22TTD', '60'),
(1702, '00248', '22', 'DA22TTD', '60'),
(1703, '00248', '23', 'DA22TTD', '60'),
(1704, '00248', '24', 'DA22TTD', '60'),
(1705, '00248', '25', 'DA22TTD', '60'),
(1706, '00248', '26', 'DA22TTD', '60'),
(1707, '00249', '19', 'DA22TTD', '60'),
(1708, '00249', '20', 'DA22TTD', '60'),
(1709, '00249', '21', 'DA22TTD', '60'),
(1710, '00249', '22', 'DA22TTD', '60'),
(1711, '00249', '23', 'DA22TTD', '60'),
(1712, '00249', '24', 'DA22TTD', '60'),
(1713, '00249', '25', 'DA22TTD', '60'),
(1714, '00249', '26', 'DA22TTD', '60'),
(1715, '00250', '19', 'DA22TTD', '60'),
(1716, '00250', '20', 'DA22TTD', '60'),
(1717, '00250', '21', 'DA22TTD', '60'),
(1718, '00250', '22', 'DA22TTD', '60'),
(1719, '00250', '23', 'DA22TTD', '60'),
(1720, '00250', '24', 'DA22TTD', '60'),
(1721, '00250', '25', 'DA22TTD', '60'),
(1722, '00250', '26', 'DA22TTD', '60'),
(1723, '00251', '19', 'DA22TTD', '60'),
(1724, '00251', '20', 'DA22TTD', '60'),
(1725, '00251', '21', 'DA22TTD', '60'),
(1726, '00251', '22', 'DA22TTD', '60'),
(1727, '00251', '23', 'DA22TTD', '60'),
(1728, '00251', '24', 'DA22TTD', '60'),
(1729, '00251', '25', 'DA22TTD', '60'),
(1730, '00251', '26', 'DA22TTD', '60'),
(1731, '00252', '19', 'DA22TTD', '60'),
(1732, '00252', '20', 'DA22TTD', '60'),
(1733, '00252', '21', 'DA22TTD', '60'),
(1734, '00252', '22', 'DA22TTD', '60'),
(1735, '00252', '23', 'DA22TTD', '60'),
(1736, '00252', '24', 'DA22TTD', '60'),
(1737, '00252', '25', 'DA22TTD', '60'),
(1738, '00252', '26', 'DA22TTD', '60'),
(1739, '00253', '19', 'DA22TTD', '60'),
(1740, '00253', '20', 'DA22TTD', '60'),
(1741, '00253', '21', 'DA22TTD', '60'),
(1742, '00253', '22', 'DA22TTD', '60'),
(1743, '00253', '23', 'DA22TTD', '60'),
(1744, '00253', '24', 'DA22TTD', '60'),
(1745, '00253', '25', 'DA22TTD', '60'),
(1746, '00253', '26', 'DA22TTD', '60'),
(1747, '00254', '19', 'DA22TTD', '60'),
(1748, '00254', '20', 'DA22TTD', '60'),
(1749, '00254', '21', 'DA22TTD', '60'),
(1750, '00254', '22', 'DA22TTD', '60'),
(1751, '00254', '23', 'DA22TTD', '60'),
(1752, '00254', '24', 'DA22TTD', '60'),
(1753, '00254', '25', 'DA22TTD', '60'),
(1754, '00254', '26', 'DA22TTD', '60'),
(1755, '00255', '19', 'DA22TTD', '60'),
(1756, '00255', '20', 'DA22TTD', '60'),
(1757, '00255', '21', 'DA22TTD', '60'),
(1758, '00255', '22', 'DA22TTD', '60'),
(1759, '00255', '23', 'DA22TTD', '60'),
(1760, '00255', '24', 'DA22TTD', '60'),
(1761, '00255', '25', 'DA22TTD', '60'),
(1762, '00255', '26', 'DA22TTD', '60'),
(1763, '00257', '19', 'DA22TTD', '60'),
(1764, '00257', '20', 'DA22TTD', '60'),
(1765, '00257', '21', 'DA22TTD', '60'),
(1766, '00257', '22', 'DA22TTD', '60'),
(1767, '00257', '23', 'DA22TTD', '60'),
(1768, '00257', '24', 'DA22TTD', '60'),
(1769, '00257', '25', 'DA22TTD', '60'),
(1770, '00257', '26', 'DA22TTD', '60'),
(1771, '01027', '19', 'DA22TTD', '60'),
(1772, '01027', '20', 'DA22TTD', '60'),
(1773, '01027', '21', 'DA22TTD', '60'),
(1774, '01027', '22', 'DA22TTD', '60'),
(1775, '01027', '23', 'DA22TTD', '60'),
(1776, '01027', '24', 'DA22TTD', '60'),
(1777, '01027', '25', 'DA22TTD', '60'),
(1778, '01027', '26', 'DA22TTD', '60'),
(1779, '0122', '19', 'DA22TTD', '60'),
(1780, '0122', '20', 'DA22TTD', '60'),
(1781, '0122', '21', 'DA22TTD', '60'),
(1782, '0122', '22', 'DA22TTD', '60'),
(1783, '0122', '23', 'DA22TTD', '60'),
(1784, '0122', '24', 'DA22TTD', '60'),
(1785, '0122', '25', 'DA22TTD', '60'),
(1786, '0122', '26', 'DA22TTD', '60'),
(1787, '0123', '19', 'DA22TTD', '60'),
(1788, '0123', '20', 'DA22TTD', '60'),
(1789, '0123', '21', 'DA22TTD', '60'),
(1790, '0123', '22', 'DA22TTD', '60'),
(1791, '0123', '23', 'DA22TTD', '60'),
(1792, '0123', '24', 'DA22TTD', '60'),
(1793, '0123', '25', 'DA22TTD', '60'),
(1794, '0123', '26', 'DA22TTD', '60'),
(1795, '01548', '19', 'DA22TTD', '60'),
(1796, '01548', '20', 'DA22TTD', '60'),
(1797, '01548', '21', 'DA22TTD', '60'),
(1798, '01548', '22', 'DA22TTD', '60'),
(1799, '01548', '23', 'DA22TTD', '60'),
(1800, '01548', '24', 'DA22TTD', '60'),
(1801, '01548', '25', 'DA22TTD', '60'),
(1802, '01548', '26', 'DA22TTD', '60'),
(1803, '03539', '19', 'DA22TTD', '60'),
(1804, '03539', '20', 'DA22TTD', '60'),
(1805, '03539', '21', 'DA22TTD', '60'),
(1806, '03539', '22', 'DA22TTD', '60'),
(1807, '03539', '23', 'DA22TTD', '60'),
(1808, '03539', '24', 'DA22TTD', '60'),
(1809, '03539', '25', 'DA22TTD', '60'),
(1810, '03539', '26', 'DA22TTD', '60'),
(1811, '03546', '19', 'DA22TTD', '60'),
(1812, '03546', '20', 'DA22TTD', '60'),
(1813, '03546', '21', 'DA22TTD', '60'),
(1814, '03546', '22', 'DA22TTD', '60'),
(1815, '03546', '23', 'DA22TTD', '60'),
(1816, '03546', '24', 'DA22TTD', '60'),
(1817, '03546', '25', 'DA22TTD', '60'),
(1818, '03546', '26', 'DA22TTD', '60'),
(1819, '03562', '19', 'DA22TTD', '60'),
(1820, '03562', '20', 'DA22TTD', '60'),
(1821, '03562', '21', 'DA22TTD', '60'),
(1822, '03562', '22', 'DA22TTD', '60'),
(1823, '03562', '23', 'DA22TTD', '60'),
(1824, '03562', '24', 'DA22TTD', '60'),
(1825, '03562', '25', 'DA22TTD', '60'),
(1826, '03562', '26', 'DA22TTD', '60'),
(1827, '12700', '19', 'DA22TTD', '60'),
(1828, '12700', '20', 'DA22TTD', '60'),
(1829, '12700', '21', 'DA22TTD', '60'),
(1830, '12700', '22', 'DA22TTD', '60'),
(1831, '12700', '23', 'DA22TTD', '60'),
(1832, '12700', '24', 'DA22TTD', '60'),
(1833, '12700', '25', 'DA22TTD', '60'),
(1834, '12700', '26', 'DA22TTD', '60'),
(1835, '12701', '19', 'DA22TTD', '60'),
(1836, '12701', '20', 'DA22TTD', '60'),
(1837, '12701', '21', 'DA22TTD', '60'),
(1838, '12701', '22', 'DA22TTD', '60'),
(1839, '12701', '23', 'DA22TTD', '60'),
(1840, '12701', '24', 'DA22TTD', '60'),
(1841, '12701', '25', 'DA22TTD', '60'),
(1842, '12701', '26', 'DA22TTD', '60'),
(1843, '12702', '19', 'DA22TTD', '60'),
(1844, '12702', '20', 'DA22TTD', '60'),
(1845, '12702', '21', 'DA22TTD', '60'),
(1846, '12702', '22', 'DA22TTD', '60'),
(1847, '12702', '23', 'DA22TTD', '60'),
(1848, '12702', '24', 'DA22TTD', '60'),
(1849, '12702', '25', 'DA22TTD', '60'),
(1850, '12702', '26', 'DA22TTD', '60'),
(1851, '12705', '19', 'DA22TTD', '60'),
(1852, '12705', '20', 'DA22TTD', '60'),
(1853, '12705', '21', 'DA22TTD', '60'),
(1854, '12705', '22', 'DA22TTD', '60'),
(1855, '12705', '23', 'DA22TTD', '60'),
(1856, '12705', '24', 'DA22TTD', '60'),
(1857, '12705', '25', 'DA22TTD', '60'),
(1858, '12705', '26', 'DA22TTD', '60'),
(1859, '14204', '19', 'DA22TTD', '60'),
(1860, '14204', '20', 'DA22TTD', '60'),
(1861, '14204', '21', 'DA22TTD', '60'),
(1862, '14204', '22', 'DA22TTD', '60'),
(1863, '14204', '23', 'DA22TTD', '60'),
(1864, '14204', '24', 'DA22TTD', '60'),
(1865, '14204', '25', 'DA22TTD', '60'),
(1866, '14204', '26', 'DA22TTD', '60'),
(1867, '99997', '19', 'DA22TTD', '60'),
(1868, '99997', '20', 'DA22TTD', '60'),
(1869, '99997', '21', 'DA22TTD', '60'),
(1870, '99997', '22', 'DA22TTD', '60'),
(1871, '99997', '23', 'DA22TTD', '60'),
(1872, '99997', '24', 'DA22TTD', '60'),
(1873, '99997', '25', 'DA22TTD', '60'),
(1874, '99997', '26', 'DA22TTD', '60'),
(1875, '99999', '19', 'DA22TTD', '60'),
(1876, '99999', '20', 'DA22TTD', '60'),
(1877, '99999', '21', 'DA22TTD', '60'),
(1878, '99999', '22', 'DA22TTD', '60'),
(1879, '99999', '23', 'DA22TTD', '60'),
(1880, '99999', '24', 'DA22TTD', '60'),
(1881, '99999', '25', 'DA22TTD', '60'),
(1882, '99999', '26', 'DA22TTD', '60'),
(1883, 'GVNT22424', '19', 'DA22TTD', '60'),
(1884, 'GVNT22424', '20', 'DA22TTD', '60'),
(1885, 'GVNT22424', '21', 'DA22TTD', '60'),
(1886, 'GVNT22424', '22', 'DA22TTD', '60'),
(1887, 'GVNT22424', '23', 'DA22TTD', '60'),
(1888, 'GVNT22424', '24', 'DA22TTD', '60'),
(1889, 'GVNT22424', '25', 'DA22TTD', '60'),
(1890, 'GVNT22424', '26', 'DA22TTD', '60'),
(1891, '00241', '19', 'DA22TTB', '60'),
(1892, '00241', '20', 'DA22TTB', '60'),
(1893, '00241', '21', 'DA22TTB', '60'),
(1894, '00241', '22', 'DA22TTB', '60'),
(1895, '00241', '23', 'DA22TTB', '60'),
(1896, '00241', '24', 'DA22TTB', '60'),
(1897, '00241', '25', 'DA22TTB', '60'),
(1898, '00241', '26', 'DA22TTB', '60'),
(1899, '00242', '19', 'DA22TTB', '60'),
(1900, '00242', '20', 'DA22TTB', '60'),
(1901, '00242', '21', 'DA22TTB', '60'),
(1902, '00242', '22', 'DA22TTB', '60'),
(1903, '00242', '23', 'DA22TTB', '60'),
(1904, '00242', '24', 'DA22TTB', '60'),
(1905, '00242', '25', 'DA22TTB', '60'),
(1906, '00242', '26', 'DA22TTB', '60'),
(1907, '00243', '19', 'DA22TTB', '60'),
(1908, '00243', '20', 'DA22TTB', '60'),
(1909, '00243', '21', 'DA22TTB', '60'),
(1910, '00243', '22', 'DA22TTB', '60'),
(1911, '00243', '23', 'DA22TTB', '60'),
(1912, '00243', '24', 'DA22TTB', '60'),
(1913, '00243', '25', 'DA22TTB', '60'),
(1914, '00243', '26', 'DA22TTB', '60'),
(1915, '00244', '19', 'DA22TTB', '60'),
(1916, '00244', '20', 'DA22TTB', '60'),
(1917, '00244', '21', 'DA22TTB', '60'),
(1918, '00244', '22', 'DA22TTB', '60'),
(1919, '00244', '23', 'DA22TTB', '60'),
(1920, '00244', '24', 'DA22TTB', '60'),
(1921, '00244', '25', 'DA22TTB', '60'),
(1922, '00244', '26', 'DA22TTB', '60'),
(1923, '00245', '19', 'DA22TTB', '60'),
(1924, '00245', '20', 'DA22TTB', '60'),
(1925, '00245', '21', 'DA22TTB', '60'),
(1926, '00245', '22', 'DA22TTB', '60'),
(1927, '00245', '23', 'DA22TTB', '60'),
(1928, '00245', '24', 'DA22TTB', '60'),
(1929, '00245', '25', 'DA22TTB', '60'),
(1930, '00245', '26', 'DA22TTB', '60'),
(1931, '00246', '19', 'DA22TTB', '60'),
(1932, '00246', '20', 'DA22TTB', '60'),
(1933, '00246', '21', 'DA22TTB', '60'),
(1934, '00246', '22', 'DA22TTB', '60'),
(1935, '00246', '23', 'DA22TTB', '60'),
(1936, '00246', '24', 'DA22TTB', '60'),
(1937, '00246', '25', 'DA22TTB', '60'),
(1938, '00246', '26', 'DA22TTB', '60'),
(1939, '00248', '19', 'DA22TTB', '60'),
(1940, '00248', '20', 'DA22TTB', '60'),
(1941, '00248', '21', 'DA22TTB', '60'),
(1942, '00248', '22', 'DA22TTB', '60'),
(1943, '00248', '23', 'DA22TTB', '60'),
(1944, '00248', '24', 'DA22TTB', '60'),
(1945, '00248', '25', 'DA22TTB', '60'),
(1946, '00248', '26', 'DA22TTB', '60'),
(1947, '00249', '19', 'DA22TTB', '60'),
(1948, '00249', '20', 'DA22TTB', '60'),
(1949, '00249', '21', 'DA22TTB', '60'),
(1950, '00249', '22', 'DA22TTB', '60'),
(1951, '00249', '23', 'DA22TTB', '60'),
(1952, '00249', '24', 'DA22TTB', '60'),
(1953, '00249', '25', 'DA22TTB', '60'),
(1954, '00249', '26', 'DA22TTB', '60'),
(1955, '00250', '19', 'DA22TTB', '60'),
(1956, '00250', '20', 'DA22TTB', '60'),
(1957, '00250', '21', 'DA22TTB', '60'),
(1958, '00250', '22', 'DA22TTB', '60'),
(1959, '00250', '23', 'DA22TTB', '60'),
(1960, '00250', '24', 'DA22TTB', '60'),
(1961, '00250', '25', 'DA22TTB', '60'),
(1962, '00250', '26', 'DA22TTB', '60'),
(1963, '00251', '19', 'DA22TTB', '60'),
(1964, '00251', '20', 'DA22TTB', '60'),
(1965, '00251', '21', 'DA22TTB', '60'),
(1966, '00251', '22', 'DA22TTB', '60'),
(1967, '00251', '23', 'DA22TTB', '60'),
(1968, '00251', '24', 'DA22TTB', '60'),
(1969, '00251', '25', 'DA22TTB', '60'),
(1970, '00251', '26', 'DA22TTB', '60'),
(1971, '00252', '19', 'DA22TTB', '60'),
(1972, '00252', '20', 'DA22TTB', '60'),
(1973, '00252', '21', 'DA22TTB', '60'),
(1974, '00252', '22', 'DA22TTB', '60'),
(1975, '00252', '23', 'DA22TTB', '60'),
(1976, '00252', '24', 'DA22TTB', '60'),
(1977, '00252', '25', 'DA22TTB', '60'),
(1978, '00252', '26', 'DA22TTB', '60'),
(1979, '00253', '19', 'DA22TTB', '60'),
(1980, '00253', '20', 'DA22TTB', '60'),
(1981, '00253', '21', 'DA22TTB', '60'),
(1982, '00253', '22', 'DA22TTB', '60'),
(1983, '00253', '23', 'DA22TTB', '60'),
(1984, '00253', '24', 'DA22TTB', '60'),
(1985, '00253', '25', 'DA22TTB', '60'),
(1986, '00253', '26', 'DA22TTB', '60'),
(1987, '00254', '19', 'DA22TTB', '60'),
(1988, '00254', '20', 'DA22TTB', '60'),
(1989, '00254', '21', 'DA22TTB', '60'),
(1990, '00254', '22', 'DA22TTB', '60'),
(1991, '00254', '23', 'DA22TTB', '60'),
(1992, '00254', '24', 'DA22TTB', '60'),
(1993, '00254', '25', 'DA22TTB', '60'),
(1994, '00254', '26', 'DA22TTB', '60'),
(1995, '00255', '19', 'DA22TTB', '60'),
(1996, '00255', '20', 'DA22TTB', '60'),
(1997, '00255', '21', 'DA22TTB', '60'),
(1998, '00255', '22', 'DA22TTB', '60'),
(1999, '00255', '23', 'DA22TTB', '60'),
(2000, '00255', '24', 'DA22TTB', '60'),
(2001, '00255', '25', 'DA22TTB', '60'),
(2002, '00255', '26', 'DA22TTB', '60'),
(2003, '00257', '19', 'DA22TTB', '60'),
(2004, '00257', '20', 'DA22TTB', '60'),
(2005, '00257', '21', 'DA22TTB', '60'),
(2006, '00257', '22', 'DA22TTB', '60'),
(2007, '00257', '23', 'DA22TTB', '60'),
(2008, '00257', '24', 'DA22TTB', '60'),
(2009, '00257', '25', 'DA22TTB', '60'),
(2010, '00257', '26', 'DA22TTB', '60'),
(2011, '01027', '19', 'DA22TTB', '60'),
(2012, '01027', '20', 'DA22TTB', '60'),
(2013, '01027', '21', 'DA22TTB', '60'),
(2014, '01027', '22', 'DA22TTB', '60'),
(2015, '01027', '23', 'DA22TTB', '60'),
(2016, '01027', '24', 'DA22TTB', '60'),
(2017, '01027', '25', 'DA22TTB', '60'),
(2018, '01027', '26', 'DA22TTB', '60'),
(2019, '0122', '19', 'DA22TTB', '60'),
(2020, '0122', '20', 'DA22TTB', '60'),
(2021, '0122', '21', 'DA22TTB', '60'),
(2022, '0122', '22', 'DA22TTB', '60'),
(2023, '0122', '23', 'DA22TTB', '60'),
(2024, '0122', '24', 'DA22TTB', '60'),
(2025, '0122', '25', 'DA22TTB', '60'),
(2026, '0122', '26', 'DA22TTB', '60'),
(2027, '0123', '19', 'DA22TTB', '60'),
(2028, '0123', '20', 'DA22TTB', '60'),
(2029, '0123', '21', 'DA22TTB', '60'),
(2030, '0123', '22', 'DA22TTB', '60'),
(2031, '0123', '23', 'DA22TTB', '60'),
(2032, '0123', '24', 'DA22TTB', '60'),
(2033, '0123', '25', 'DA22TTB', '60'),
(2034, '0123', '26', 'DA22TTB', '60'),
(2035, '01548', '19', 'DA22TTB', '60'),
(2036, '01548', '20', 'DA22TTB', '60'),
(2037, '01548', '21', 'DA22TTB', '60'),
(2038, '01548', '22', 'DA22TTB', '60'),
(2039, '01548', '23', 'DA22TTB', '60'),
(2040, '01548', '24', 'DA22TTB', '60'),
(2041, '01548', '25', 'DA22TTB', '60'),
(2042, '01548', '26', 'DA22TTB', '60'),
(2043, '03539', '19', 'DA22TTB', '60'),
(2044, '03539', '20', 'DA22TTB', '60'),
(2045, '03539', '21', 'DA22TTB', '60'),
(2046, '03539', '22', 'DA22TTB', '60'),
(2047, '03539', '23', 'DA22TTB', '60'),
(2048, '03539', '24', 'DA22TTB', '60'),
(2049, '03539', '25', 'DA22TTB', '60'),
(2050, '03539', '26', 'DA22TTB', '60'),
(2051, '03546', '19', 'DA22TTB', '60'),
(2052, '03546', '20', 'DA22TTB', '60'),
(2053, '03546', '21', 'DA22TTB', '60'),
(2054, '03546', '22', 'DA22TTB', '60'),
(2055, '03546', '23', 'DA22TTB', '60'),
(2056, '03546', '24', 'DA22TTB', '60'),
(2057, '03546', '25', 'DA22TTB', '60'),
(2058, '03546', '26', 'DA22TTB', '60'),
(2059, '03562', '19', 'DA22TTB', '60'),
(2060, '03562', '20', 'DA22TTB', '60'),
(2061, '03562', '21', 'DA22TTB', '60'),
(2062, '03562', '22', 'DA22TTB', '60'),
(2063, '03562', '23', 'DA22TTB', '60'),
(2064, '03562', '24', 'DA22TTB', '60'),
(2065, '03562', '25', 'DA22TTB', '60'),
(2066, '03562', '26', 'DA22TTB', '60'),
(2067, '12700', '19', 'DA22TTB', '60'),
(2068, '12700', '20', 'DA22TTB', '60'),
(2069, '12700', '21', 'DA22TTB', '60'),
(2070, '12700', '22', 'DA22TTB', '60'),
(2071, '12700', '23', 'DA22TTB', '60'),
(2072, '12700', '24', 'DA22TTB', '60'),
(2073, '12700', '25', 'DA22TTB', '60'),
(2074, '12700', '26', 'DA22TTB', '60'),
(2075, '12701', '19', 'DA22TTB', '60'),
(2076, '12701', '20', 'DA22TTB', '60'),
(2077, '12701', '21', 'DA22TTB', '60'),
(2078, '12701', '22', 'DA22TTB', '60'),
(2079, '12701', '23', 'DA22TTB', '60'),
(2080, '12701', '24', 'DA22TTB', '60'),
(2081, '12701', '25', 'DA22TTB', '60'),
(2082, '12701', '26', 'DA22TTB', '60'),
(2083, '12702', '19', 'DA22TTB', '60'),
(2084, '12702', '20', 'DA22TTB', '60'),
(2085, '12702', '21', 'DA22TTB', '60'),
(2086, '12702', '22', 'DA22TTB', '60'),
(2087, '12702', '23', 'DA22TTB', '60'),
(2088, '12702', '24', 'DA22TTB', '60'),
(2089, '12702', '25', 'DA22TTB', '60'),
(2090, '12702', '26', 'DA22TTB', '60'),
(2091, '12705', '19', 'DA22TTB', '60'),
(2092, '12705', '20', 'DA22TTB', '60'),
(2093, '12705', '21', 'DA22TTB', '60'),
(2094, '12705', '22', 'DA22TTB', '60'),
(2095, '12705', '23', 'DA22TTB', '60'),
(2096, '12705', '24', 'DA22TTB', '60'),
(2097, '12705', '25', 'DA22TTB', '60'),
(2098, '12705', '26', 'DA22TTB', '60'),
(2099, '14204', '19', 'DA22TTB', '60'),
(2100, '14204', '20', 'DA22TTB', '60'),
(2101, '14204', '21', 'DA22TTB', '60'),
(2102, '14204', '22', 'DA22TTB', '60'),
(2103, '14204', '23', 'DA22TTB', '60'),
(2104, '14204', '24', 'DA22TTB', '60'),
(2105, '14204', '25', 'DA22TTB', '60'),
(2106, '14204', '26', 'DA22TTB', '60'),
(2107, '99997', '19', 'DA22TTB', '60'),
(2108, '99997', '20', 'DA22TTB', '60'),
(2109, '99997', '21', 'DA22TTB', '60'),
(2110, '99997', '22', 'DA22TTB', '60'),
(2111, '99997', '23', 'DA22TTB', '60'),
(2112, '99997', '24', 'DA22TTB', '60'),
(2113, '99997', '25', 'DA22TTB', '60'),
(2114, '99997', '26', 'DA22TTB', '60'),
(2115, '99999', '19', 'DA22TTB', '60'),
(2116, '99999', '20', 'DA22TTB', '60'),
(2117, '99999', '21', 'DA22TTB', '60'),
(2118, '99999', '22', 'DA22TTB', '60'),
(2119, '99999', '23', 'DA22TTB', '60'),
(2120, '99999', '24', 'DA22TTB', '60'),
(2121, '99999', '25', 'DA22TTB', '60'),
(2122, '99999', '26', 'DA22TTB', '60'),
(2123, 'GVNT22424', '19', 'DA22TTB', '60'),
(2124, 'GVNT22424', '20', 'DA22TTB', '60'),
(2125, 'GVNT22424', '21', 'DA22TTB', '60'),
(2126, 'GVNT22424', '22', 'DA22TTB', '60'),
(2127, 'GVNT22424', '23', 'DA22TTB', '60'),
(2128, 'GVNT22424', '24', 'DA22TTB', '60'),
(2129, 'GVNT22424', '25', 'DA22TTB', '60'),
(2130, 'GVNT22424', '26', 'DA22TTB', '60'),
(2131, '00241', '1', 'DA23TTB', '60'),
(2132, '00241', '2', 'DA23TTB', '60'),
(2133, '00241', '3', 'DA23TTB', '60'),
(2134, '00241', '4', 'DA23TTB', '60'),
(2135, '00241', '5', 'DA23TTB', '60'),
(2136, '00241', '6', 'DA23TTB', '60'),
(2137, '00241', '7', 'DA23TTB', '60'),
(2138, '00241', '8', 'DA23TTB', '60'),
(2139, '00241', '9', 'DA23TTB', '60'),
(2140, '00242', '1', 'DA23TTB', '60'),
(2141, '00242', '2', 'DA23TTB', '60'),
(2142, '00242', '3', 'DA23TTB', '60'),
(2143, '00242', '4', 'DA23TTB', '60'),
(2144, '00242', '5', 'DA23TTB', '60'),
(2145, '00242', '6', 'DA23TTB', '60'),
(2146, '00242', '7', 'DA23TTB', '60'),
(2147, '00242', '8', 'DA23TTB', '60'),
(2148, '00242', '9', 'DA23TTB', '60'),
(2149, '00243', '1', 'DA23TTB', '60'),
(2150, '00243', '2', 'DA23TTB', '60'),
(2151, '00243', '3', 'DA23TTB', '60'),
(2152, '00243', '4', 'DA23TTB', '60'),
(2153, '00243', '5', 'DA23TTB', '60'),
(2154, '00243', '6', 'DA23TTB', '60'),
(2155, '00243', '7', 'DA23TTB', '60'),
(2156, '00243', '8', 'DA23TTB', '60'),
(2157, '00243', '9', 'DA23TTB', '60'),
(2158, '00244', '1', 'DA23TTB', '60'),
(2159, '00244', '2', 'DA23TTB', '60'),
(2160, '00244', '3', 'DA23TTB', '60'),
(2161, '00244', '4', 'DA23TTB', '60'),
(2162, '00244', '5', 'DA23TTB', '60'),
(2163, '00244', '6', 'DA23TTB', '60'),
(2164, '00244', '7', 'DA23TTB', '60'),
(2165, '00244', '8', 'DA23TTB', '60'),
(2166, '00244', '9', 'DA23TTB', '60'),
(2167, '00245', '1', 'DA23TTB', '60'),
(2168, '00245', '2', 'DA23TTB', '60'),
(2169, '00245', '3', 'DA23TTB', '60'),
(2170, '00245', '4', 'DA23TTB', '60'),
(2171, '00245', '5', 'DA23TTB', '60'),
(2172, '00245', '6', 'DA23TTB', '60'),
(2173, '00245', '7', 'DA23TTB', '60'),
(2174, '00245', '8', 'DA23TTB', '60'),
(2175, '00245', '9', 'DA23TTB', '60'),
(2176, '00246', '1', 'DA23TTB', '60'),
(2177, '00246', '2', 'DA23TTB', '60'),
(2178, '00246', '3', 'DA23TTB', '60'),
(2179, '00246', '4', 'DA23TTB', '60'),
(2180, '00246', '5', 'DA23TTB', '60'),
(2181, '00246', '6', 'DA23TTB', '60'),
(2182, '00246', '7', 'DA23TTB', '60'),
(2183, '00246', '8', 'DA23TTB', '60'),
(2184, '00246', '9', 'DA23TTB', '60'),
(2185, '00248', '1', 'DA23TTB', '60'),
(2186, '00248', '2', 'DA23TTB', '60'),
(2187, '00248', '3', 'DA23TTB', '60'),
(2188, '00248', '4', 'DA23TTB', '60'),
(2189, '00248', '5', 'DA23TTB', '60'),
(2190, '00248', '6', 'DA23TTB', '60'),
(2191, '00248', '7', 'DA23TTB', '60'),
(2192, '00248', '8', 'DA23TTB', '60'),
(2193, '00248', '9', 'DA23TTB', '60'),
(2194, '00249', '1', 'DA23TTB', '60'),
(2195, '00249', '2', 'DA23TTB', '60'),
(2196, '00249', '3', 'DA23TTB', '60'),
(2197, '00249', '4', 'DA23TTB', '60'),
(2198, '00249', '5', 'DA23TTB', '60'),
(2199, '00249', '6', 'DA23TTB', '60'),
(2200, '00249', '7', 'DA23TTB', '60'),
(2201, '00249', '8', 'DA23TTB', '60'),
(2202, '00249', '9', 'DA23TTB', '60'),
(2203, '00250', '1', 'DA23TTB', '60'),
(2204, '00250', '2', 'DA23TTB', '60'),
(2205, '00250', '3', 'DA23TTB', '60'),
(2206, '00250', '4', 'DA23TTB', '60'),
(2207, '00250', '5', 'DA23TTB', '60'),
(2208, '00250', '6', 'DA23TTB', '60'),
(2209, '00250', '7', 'DA23TTB', '60'),
(2210, '00250', '8', 'DA23TTB', '60'),
(2211, '00250', '9', 'DA23TTB', '60'),
(2212, '00251', '1', 'DA23TTB', '60'),
(2213, '00251', '2', 'DA23TTB', '60'),
(2214, '00251', '3', 'DA23TTB', '60'),
(2215, '00251', '4', 'DA23TTB', '60'),
(2216, '00251', '5', 'DA23TTB', '60'),
(2217, '00251', '6', 'DA23TTB', '60'),
(2218, '00251', '7', 'DA23TTB', '60'),
(2219, '00251', '8', 'DA23TTB', '60'),
(2220, '00251', '9', 'DA23TTB', '60'),
(2221, '00252', '1', 'DA23TTB', '60'),
(2222, '00252', '2', 'DA23TTB', '60'),
(2223, '00252', '3', 'DA23TTB', '60'),
(2224, '00252', '4', 'DA23TTB', '60'),
(2225, '00252', '5', 'DA23TTB', '60'),
(2226, '00252', '6', 'DA23TTB', '60'),
(2227, '00252', '7', 'DA23TTB', '60'),
(2228, '00252', '8', 'DA23TTB', '60'),
(2229, '00252', '9', 'DA23TTB', '60'),
(2230, '00253', '1', 'DA23TTB', '60'),
(2231, '00253', '2', 'DA23TTB', '60'),
(2232, '00253', '3', 'DA23TTB', '60'),
(2233, '00253', '4', 'DA23TTB', '60'),
(2234, '00253', '5', 'DA23TTB', '60'),
(2235, '00253', '6', 'DA23TTB', '60'),
(2236, '00253', '7', 'DA23TTB', '60'),
(2237, '00253', '8', 'DA23TTB', '60'),
(2238, '00253', '9', 'DA23TTB', '60'),
(2239, '00254', '1', 'DA23TTB', '60'),
(2240, '00254', '2', 'DA23TTB', '60'),
(2241, '00254', '3', 'DA23TTB', '60'),
(2242, '00254', '4', 'DA23TTB', '60'),
(2243, '00254', '5', 'DA23TTB', '60'),
(2244, '00254', '6', 'DA23TTB', '60'),
(2245, '00254', '7', 'DA23TTB', '60'),
(2246, '00254', '8', 'DA23TTB', '60'),
(2247, '00254', '9', 'DA23TTB', '60'),
(2248, '00255', '1', 'DA23TTB', '60'),
(2249, '00255', '2', 'DA23TTB', '60'),
(2250, '00255', '3', 'DA23TTB', '60'),
(2251, '00255', '4', 'DA23TTB', '60'),
(2252, '00255', '5', 'DA23TTB', '60'),
(2253, '00255', '6', 'DA23TTB', '60'),
(2254, '00255', '7', 'DA23TTB', '60'),
(2255, '00255', '8', 'DA23TTB', '60'),
(2256, '00255', '9', 'DA23TTB', '60'),
(2257, '00257', '1', 'DA23TTB', '60'),
(2258, '00257', '2', 'DA23TTB', '60'),
(2259, '00257', '3', 'DA23TTB', '60'),
(2260, '00257', '4', 'DA23TTB', '60'),
(2261, '00257', '5', 'DA23TTB', '60'),
(2262, '00257', '6', 'DA23TTB', '60'),
(2263, '00257', '7', 'DA23TTB', '60'),
(2264, '00257', '8', 'DA23TTB', '60'),
(2265, '00257', '9', 'DA23TTB', '60'),
(2266, '01027', '1', 'DA23TTB', '60'),
(2267, '01027', '2', 'DA23TTB', '60'),
(2268, '01027', '3', 'DA23TTB', '60'),
(2269, '01027', '4', 'DA23TTB', '60'),
(2270, '01027', '5', 'DA23TTB', '60'),
(2271, '01027', '6', 'DA23TTB', '60'),
(2272, '01027', '7', 'DA23TTB', '60'),
(2273, '01027', '8', 'DA23TTB', '60'),
(2274, '01027', '9', 'DA23TTB', '60'),
(2275, '0122', '1', 'DA23TTB', '60'),
(2276, '0122', '2', 'DA23TTB', '60'),
(2277, '0122', '3', 'DA23TTB', '60'),
(2278, '0122', '4', 'DA23TTB', '60'),
(2279, '0122', '5', 'DA23TTB', '60'),
(2280, '0122', '6', 'DA23TTB', '60'),
(2281, '0122', '7', 'DA23TTB', '60'),
(2282, '0122', '8', 'DA23TTB', '60'),
(2283, '0122', '9', 'DA23TTB', '60'),
(2284, '0123', '1', 'DA23TTB', '60'),
(2285, '0123', '2', 'DA23TTB', '60'),
(2286, '0123', '3', 'DA23TTB', '60'),
(2287, '0123', '4', 'DA23TTB', '60'),
(2288, '0123', '5', 'DA23TTB', '60'),
(2289, '0123', '6', 'DA23TTB', '60'),
(2290, '0123', '7', 'DA23TTB', '60'),
(2291, '0123', '8', 'DA23TTB', '60'),
(2292, '0123', '9', 'DA23TTB', '60'),
(2293, '01548', '1', 'DA23TTB', '60'),
(2294, '01548', '2', 'DA23TTB', '60'),
(2295, '01548', '3', 'DA23TTB', '60'),
(2296, '01548', '4', 'DA23TTB', '60'),
(2297, '01548', '5', 'DA23TTB', '60'),
(2298, '01548', '6', 'DA23TTB', '60'),
(2299, '01548', '7', 'DA23TTB', '60'),
(2300, '01548', '8', 'DA23TTB', '60'),
(2301, '01548', '9', 'DA23TTB', '60'),
(2302, '03539', '1', 'DA23TTB', '60'),
(2303, '03539', '2', 'DA23TTB', '60'),
(2304, '03539', '3', 'DA23TTB', '60'),
(2305, '03539', '4', 'DA23TTB', '60'),
(2306, '03539', '5', 'DA23TTB', '60'),
(2307, '03539', '6', 'DA23TTB', '60'),
(2308, '03539', '7', 'DA23TTB', '60'),
(2309, '03539', '8', 'DA23TTB', '60'),
(2310, '03539', '9', 'DA23TTB', '60'),
(2311, '03546', '1', 'DA23TTB', '60'),
(2312, '03546', '2', 'DA23TTB', '60'),
(2313, '03546', '3', 'DA23TTB', '60'),
(2314, '03546', '4', 'DA23TTB', '60'),
(2315, '03546', '5', 'DA23TTB', '60'),
(2316, '03546', '6', 'DA23TTB', '60'),
(2317, '03546', '7', 'DA23TTB', '60'),
(2318, '03546', '8', 'DA23TTB', '60'),
(2319, '03546', '9', 'DA23TTB', '60'),
(2320, '03562', '1', 'DA23TTB', '60'),
(2321, '03562', '2', 'DA23TTB', '60'),
(2322, '03562', '3', 'DA23TTB', '60'),
(2323, '03562', '4', 'DA23TTB', '60'),
(2324, '03562', '5', 'DA23TTB', '60'),
(2325, '03562', '6', 'DA23TTB', '60'),
(2326, '03562', '7', 'DA23TTB', '60'),
(2327, '03562', '8', 'DA23TTB', '60'),
(2328, '03562', '9', 'DA23TTB', '60'),
(2329, '12700', '1', 'DA23TTB', '60'),
(2330, '12700', '2', 'DA23TTB', '60'),
(2331, '12700', '3', 'DA23TTB', '60'),
(2332, '12700', '4', 'DA23TTB', '60'),
(2333, '12700', '5', 'DA23TTB', '60'),
(2334, '12700', '6', 'DA23TTB', '60'),
(2335, '12700', '7', 'DA23TTB', '60'),
(2336, '12700', '8', 'DA23TTB', '60'),
(2337, '12700', '9', 'DA23TTB', '60'),
(2338, '12701', '1', 'DA23TTB', '60'),
(2339, '12701', '2', 'DA23TTB', '60'),
(2340, '12701', '3', 'DA23TTB', '60'),
(2341, '12701', '4', 'DA23TTB', '60'),
(2342, '12701', '5', 'DA23TTB', '60'),
(2343, '12701', '6', 'DA23TTB', '60'),
(2344, '12701', '7', 'DA23TTB', '60'),
(2345, '12701', '8', 'DA23TTB', '60'),
(2346, '12701', '9', 'DA23TTB', '60'),
(2347, '12702', '1', 'DA23TTB', '60'),
(2348, '12702', '2', 'DA23TTB', '60'),
(2349, '12702', '3', 'DA23TTB', '60'),
(2350, '12702', '4', 'DA23TTB', '60'),
(2351, '12702', '5', 'DA23TTB', '60'),
(2352, '12702', '6', 'DA23TTB', '60'),
(2353, '12702', '7', 'DA23TTB', '60'),
(2354, '12702', '8', 'DA23TTB', '60'),
(2355, '12702', '9', 'DA23TTB', '60'),
(2356, '12705', '1', 'DA23TTB', '60'),
(2357, '12705', '2', 'DA23TTB', '60'),
(2358, '12705', '3', 'DA23TTB', '60'),
(2359, '12705', '4', 'DA23TTB', '60'),
(2360, '12705', '5', 'DA23TTB', '60'),
(2361, '12705', '6', 'DA23TTB', '60'),
(2362, '12705', '7', 'DA23TTB', '60'),
(2363, '12705', '8', 'DA23TTB', '60'),
(2364, '12705', '9', 'DA23TTB', '60'),
(2365, '14204', '1', 'DA23TTB', '60'),
(2366, '14204', '2', 'DA23TTB', '60'),
(2367, '14204', '3', 'DA23TTB', '60'),
(2368, '14204', '4', 'DA23TTB', '60'),
(2369, '14204', '5', 'DA23TTB', '60'),
(2370, '14204', '6', 'DA23TTB', '60'),
(2371, '14204', '7', 'DA23TTB', '60'),
(2372, '14204', '8', 'DA23TTB', '60'),
(2373, '14204', '9', 'DA23TTB', '60'),
(2374, '99997', '1', 'DA23TTB', '60'),
(2375, '99997', '2', 'DA23TTB', '60'),
(2376, '99997', '3', 'DA23TTB', '60'),
(2377, '99997', '4', 'DA23TTB', '60'),
(2378, '99997', '5', 'DA23TTB', '60'),
(2379, '99997', '6', 'DA23TTB', '60'),
(2380, '99997', '7', 'DA23TTB', '60'),
(2381, '99997', '8', 'DA23TTB', '60'),
(2382, '99997', '9', 'DA23TTB', '60'),
(2383, '99999', '1', 'DA23TTB', '60'),
(2384, '99999', '2', 'DA23TTB', '60'),
(2385, '99999', '3', 'DA23TTB', '60'),
(2386, '99999', '4', 'DA23TTB', '60'),
(2387, '99999', '5', 'DA23TTB', '60'),
(2388, '99999', '6', 'DA23TTB', '60'),
(2389, '99999', '7', 'DA23TTB', '60'),
(2390, '99999', '8', 'DA23TTB', '60'),
(2391, '99999', '9', 'DA23TTB', '60'),
(2392, 'GVNT22424', '1', 'DA23TTB', '60'),
(2393, 'GVNT22424', '2', 'DA23TTB', '60'),
(2394, 'GVNT22424', '3', 'DA23TTB', '60'),
(2395, 'GVNT22424', '4', 'DA23TTB', '60'),
(2396, 'GVNT22424', '5', 'DA23TTB', '60'),
(2397, 'GVNT22424', '6', 'DA23TTB', '60'),
(2398, 'GVNT22424', '7', 'DA23TTB', '60'),
(2399, 'GVNT22424', '8', 'DA23TTB', '60'),
(2400, 'GVNT22424', '9', 'DA23TTB', '60'),
(2401, '00241', '1', 'DA23TTD', '60'),
(2402, '00241', '2', 'DA23TTD', '60'),
(2403, '00241', '3', 'DA23TTD', '60'),
(2404, '00241', '4', 'DA23TTD', '60'),
(2405, '00241', '5', 'DA23TTD', '60'),
(2406, '00241', '6', 'DA23TTD', '60'),
(2407, '00241', '7', 'DA23TTD', '60'),
(2408, '00241', '8', 'DA23TTD', '60'),
(2409, '00241', '9', 'DA23TTD', '60'),
(2410, '00242', '1', 'DA23TTD', '60'),
(2411, '00242', '2', 'DA23TTD', '60'),
(2412, '00242', '3', 'DA23TTD', '60'),
(2413, '00242', '4', 'DA23TTD', '60'),
(2414, '00242', '5', 'DA23TTD', '60'),
(2415, '00242', '6', 'DA23TTD', '60'),
(2416, '00242', '7', 'DA23TTD', '60'),
(2417, '00242', '8', 'DA23TTD', '60'),
(2418, '00242', '9', 'DA23TTD', '60'),
(2419, '00243', '1', 'DA23TTD', '60'),
(2420, '00243', '2', 'DA23TTD', '60'),
(2421, '00243', '3', 'DA23TTD', '60'),
(2422, '00243', '4', 'DA23TTD', '60'),
(2423, '00243', '5', 'DA23TTD', '60'),
(2424, '00243', '6', 'DA23TTD', '60'),
(2425, '00243', '7', 'DA23TTD', '60'),
(2426, '00243', '8', 'DA23TTD', '60'),
(2427, '00243', '9', 'DA23TTD', '60'),
(2428, '00244', '1', 'DA23TTD', '60'),
(2429, '00244', '2', 'DA23TTD', '60'),
(2430, '00244', '3', 'DA23TTD', '60'),
(2431, '00244', '4', 'DA23TTD', '60'),
(2432, '00244', '5', 'DA23TTD', '60'),
(2433, '00244', '6', 'DA23TTD', '60'),
(2434, '00244', '7', 'DA23TTD', '60'),
(2435, '00244', '8', 'DA23TTD', '60'),
(2436, '00244', '9', 'DA23TTD', '60'),
(2437, '00245', '1', 'DA23TTD', '60'),
(2438, '00245', '2', 'DA23TTD', '60'),
(2439, '00245', '3', 'DA23TTD', '60'),
(2440, '00245', '4', 'DA23TTD', '60'),
(2441, '00245', '5', 'DA23TTD', '60'),
(2442, '00245', '6', 'DA23TTD', '60'),
(2443, '00245', '7', 'DA23TTD', '60'),
(2444, '00245', '8', 'DA23TTD', '60'),
(2445, '00245', '9', 'DA23TTD', '60'),
(2446, '00246', '1', 'DA23TTD', '60'),
(2447, '00246', '2', 'DA23TTD', '60'),
(2448, '00246', '3', 'DA23TTD', '60'),
(2449, '00246', '4', 'DA23TTD', '60'),
(2450, '00246', '5', 'DA23TTD', '60'),
(2451, '00246', '6', 'DA23TTD', '60'),
(2452, '00246', '7', 'DA23TTD', '60'),
(2453, '00246', '8', 'DA23TTD', '60'),
(2454, '00246', '9', 'DA23TTD', '60'),
(2455, '00248', '1', 'DA23TTD', '60'),
(2456, '00248', '2', 'DA23TTD', '60'),
(2457, '00248', '3', 'DA23TTD', '60'),
(2458, '00248', '4', 'DA23TTD', '60'),
(2459, '00248', '5', 'DA23TTD', '60'),
(2460, '00248', '6', 'DA23TTD', '60'),
(2461, '00248', '7', 'DA23TTD', '60'),
(2462, '00248', '8', 'DA23TTD', '60'),
(2463, '00248', '9', 'DA23TTD', '60'),
(2464, '00249', '1', 'DA23TTD', '60'),
(2465, '00249', '2', 'DA23TTD', '60'),
(2466, '00249', '3', 'DA23TTD', '60'),
(2467, '00249', '4', 'DA23TTD', '60'),
(2468, '00249', '5', 'DA23TTD', '60'),
(2469, '00249', '6', 'DA23TTD', '60'),
(2470, '00249', '7', 'DA23TTD', '60'),
(2471, '00249', '8', 'DA23TTD', '60'),
(2472, '00249', '9', 'DA23TTD', '60'),
(2473, '00250', '1', 'DA23TTD', '60'),
(2474, '00250', '2', 'DA23TTD', '60'),
(2475, '00250', '3', 'DA23TTD', '60'),
(2476, '00250', '4', 'DA23TTD', '60'),
(2477, '00250', '5', 'DA23TTD', '60'),
(2478, '00250', '6', 'DA23TTD', '60'),
(2479, '00250', '7', 'DA23TTD', '60'),
(2480, '00250', '8', 'DA23TTD', '60'),
(2481, '00250', '9', 'DA23TTD', '60'),
(2482, '00251', '1', 'DA23TTD', '60'),
(2483, '00251', '2', 'DA23TTD', '60'),
(2484, '00251', '3', 'DA23TTD', '60'),
(2485, '00251', '4', 'DA23TTD', '60'),
(2486, '00251', '5', 'DA23TTD', '60'),
(2487, '00251', '6', 'DA23TTD', '60'),
(2488, '00251', '7', 'DA23TTD', '60'),
(2489, '00251', '8', 'DA23TTD', '60'),
(2490, '00251', '9', 'DA23TTD', '60'),
(2491, '00252', '1', 'DA23TTD', '60'),
(2492, '00252', '2', 'DA23TTD', '60'),
(2493, '00252', '3', 'DA23TTD', '60'),
(2494, '00252', '4', 'DA23TTD', '60'),
(2495, '00252', '5', 'DA23TTD', '60'),
(2496, '00252', '6', 'DA23TTD', '60'),
(2497, '00252', '7', 'DA23TTD', '60'),
(2498, '00252', '8', 'DA23TTD', '60'),
(2499, '00252', '9', 'DA23TTD', '60'),
(2500, '00253', '1', 'DA23TTD', '60'),
(2501, '00253', '2', 'DA23TTD', '60'),
(2502, '00253', '3', 'DA23TTD', '60'),
(2503, '00253', '4', 'DA23TTD', '60'),
(2504, '00253', '5', 'DA23TTD', '60'),
(2505, '00253', '6', 'DA23TTD', '60'),
(2506, '00253', '7', 'DA23TTD', '60'),
(2507, '00253', '8', 'DA23TTD', '60'),
(2508, '00253', '9', 'DA23TTD', '60'),
(2509, '00254', '1', 'DA23TTD', '60'),
(2510, '00254', '2', 'DA23TTD', '60'),
(2511, '00254', '3', 'DA23TTD', '60'),
(2512, '00254', '4', 'DA23TTD', '60'),
(2513, '00254', '5', 'DA23TTD', '60'),
(2514, '00254', '6', 'DA23TTD', '60'),
(2515, '00254', '7', 'DA23TTD', '60'),
(2516, '00254', '8', 'DA23TTD', '60'),
(2517, '00254', '9', 'DA23TTD', '60'),
(2518, '00255', '1', 'DA23TTD', '60'),
(2519, '00255', '2', 'DA23TTD', '60'),
(2520, '00255', '3', 'DA23TTD', '60'),
(2521, '00255', '4', 'DA23TTD', '60'),
(2522, '00255', '5', 'DA23TTD', '60'),
(2523, '00255', '6', 'DA23TTD', '60'),
(2524, '00255', '7', 'DA23TTD', '60'),
(2525, '00255', '8', 'DA23TTD', '60'),
(2526, '00255', '9', 'DA23TTD', '60'),
(2527, '00257', '1', 'DA23TTD', '60'),
(2528, '00257', '2', 'DA23TTD', '60'),
(2529, '00257', '3', 'DA23TTD', '60'),
(2530, '00257', '4', 'DA23TTD', '60'),
(2531, '00257', '5', 'DA23TTD', '60'),
(2532, '00257', '6', 'DA23TTD', '60'),
(2533, '00257', '7', 'DA23TTD', '60'),
(2534, '00257', '8', 'DA23TTD', '60'),
(2535, '00257', '9', 'DA23TTD', '60'),
(2536, '01027', '1', 'DA23TTD', '60'),
(2537, '01027', '2', 'DA23TTD', '60'),
(2538, '01027', '3', 'DA23TTD', '60'),
(2539, '01027', '4', 'DA23TTD', '60'),
(2540, '01027', '5', 'DA23TTD', '60'),
(2541, '01027', '6', 'DA23TTD', '60'),
(2542, '01027', '7', 'DA23TTD', '60'),
(2543, '01027', '8', 'DA23TTD', '60'),
(2544, '01027', '9', 'DA23TTD', '60'),
(2545, '0122', '1', 'DA23TTD', '60'),
(2546, '0122', '2', 'DA23TTD', '60'),
(2547, '0122', '3', 'DA23TTD', '60'),
(2548, '0122', '4', 'DA23TTD', '60'),
(2549, '0122', '5', 'DA23TTD', '60'),
(2550, '0122', '6', 'DA23TTD', '60'),
(2551, '0122', '7', 'DA23TTD', '60'),
(2552, '0122', '8', 'DA23TTD', '60'),
(2553, '0122', '9', 'DA23TTD', '60'),
(2554, '0123', '1', 'DA23TTD', '60'),
(2555, '0123', '2', 'DA23TTD', '60'),
(2556, '0123', '3', 'DA23TTD', '60'),
(2557, '0123', '4', 'DA23TTD', '60'),
(2558, '0123', '5', 'DA23TTD', '60'),
(2559, '0123', '6', 'DA23TTD', '60'),
(2560, '0123', '7', 'DA23TTD', '60'),
(2561, '0123', '8', 'DA23TTD', '60'),
(2562, '0123', '9', 'DA23TTD', '60'),
(2563, '01548', '1', 'DA23TTD', '60'),
(2564, '01548', '2', 'DA23TTD', '60'),
(2565, '01548', '3', 'DA23TTD', '60'),
(2566, '01548', '4', 'DA23TTD', '60'),
(2567, '01548', '5', 'DA23TTD', '60'),
(2568, '01548', '6', 'DA23TTD', '60'),
(2569, '01548', '7', 'DA23TTD', '60'),
(2570, '01548', '8', 'DA23TTD', '60'),
(2571, '01548', '9', 'DA23TTD', '60'),
(2572, '03539', '1', 'DA23TTD', '60'),
(2573, '03539', '2', 'DA23TTD', '60'),
(2574, '03539', '3', 'DA23TTD', '60'),
(2575, '03539', '4', 'DA23TTD', '60'),
(2576, '03539', '5', 'DA23TTD', '60'),
(2577, '03539', '6', 'DA23TTD', '60'),
(2578, '03539', '7', 'DA23TTD', '60'),
(2579, '03539', '8', 'DA23TTD', '60'),
(2580, '03539', '9', 'DA23TTD', '60'),
(2581, '03546', '1', 'DA23TTD', '60'),
(2582, '03546', '2', 'DA23TTD', '60'),
(2583, '03546', '3', 'DA23TTD', '60'),
(2584, '03546', '4', 'DA23TTD', '60'),
(2585, '03546', '5', 'DA23TTD', '60'),
(2586, '03546', '6', 'DA23TTD', '60'),
(2587, '03546', '7', 'DA23TTD', '60'),
(2588, '03546', '8', 'DA23TTD', '60'),
(2589, '03546', '9', 'DA23TTD', '60'),
(2590, '03562', '1', 'DA23TTD', '60'),
(2591, '03562', '2', 'DA23TTD', '60'),
(2592, '03562', '3', 'DA23TTD', '60'),
(2593, '03562', '4', 'DA23TTD', '60'),
(2594, '03562', '5', 'DA23TTD', '60'),
(2595, '03562', '6', 'DA23TTD', '60'),
(2596, '03562', '7', 'DA23TTD', '60'),
(2597, '03562', '8', 'DA23TTD', '60'),
(2598, '03562', '9', 'DA23TTD', '60'),
(2599, '12700', '1', 'DA23TTD', '60'),
(2600, '12700', '2', 'DA23TTD', '60'),
(2601, '12700', '3', 'DA23TTD', '60'),
(2602, '12700', '4', 'DA23TTD', '60'),
(2603, '12700', '5', 'DA23TTD', '60'),
(2604, '12700', '6', 'DA23TTD', '60'),
(2605, '12700', '7', 'DA23TTD', '60'),
(2606, '12700', '8', 'DA23TTD', '60'),
(2607, '12700', '9', 'DA23TTD', '60'),
(2608, '12701', '1', 'DA23TTD', '60'),
(2609, '12701', '2', 'DA23TTD', '60'),
(2610, '12701', '3', 'DA23TTD', '60'),
(2611, '12701', '4', 'DA23TTD', '60'),
(2612, '12701', '5', 'DA23TTD', '60'),
(2613, '12701', '6', 'DA23TTD', '60'),
(2614, '12701', '7', 'DA23TTD', '60'),
(2615, '12701', '8', 'DA23TTD', '60'),
(2616, '12701', '9', 'DA23TTD', '60'),
(2617, '12702', '1', 'DA23TTD', '60'),
(2618, '12702', '2', 'DA23TTD', '60'),
(2619, '12702', '3', 'DA23TTD', '60'),
(2620, '12702', '4', 'DA23TTD', '60'),
(2621, '12702', '5', 'DA23TTD', '60'),
(2622, '12702', '6', 'DA23TTD', '60'),
(2623, '12702', '7', 'DA23TTD', '60'),
(2624, '12702', '8', 'DA23TTD', '60'),
(2625, '12702', '9', 'DA23TTD', '60'),
(2626, '12705', '1', 'DA23TTD', '60'),
(2627, '12705', '2', 'DA23TTD', '60'),
(2628, '12705', '3', 'DA23TTD', '60'),
(2629, '12705', '4', 'DA23TTD', '60'),
(2630, '12705', '5', 'DA23TTD', '60'),
(2631, '12705', '6', 'DA23TTD', '60'),
(2632, '12705', '7', 'DA23TTD', '60'),
(2633, '12705', '8', 'DA23TTD', '60'),
(2634, '12705', '9', 'DA23TTD', '60'),
(2635, '14204', '1', 'DA23TTD', '60'),
(2636, '14204', '2', 'DA23TTD', '60'),
(2637, '14204', '3', 'DA23TTD', '60'),
(2638, '14204', '4', 'DA23TTD', '60'),
(2639, '14204', '5', 'DA23TTD', '60'),
(2640, '14204', '6', 'DA23TTD', '60'),
(2641, '14204', '7', 'DA23TTD', '60'),
(2642, '14204', '8', 'DA23TTD', '60'),
(2643, '14204', '9', 'DA23TTD', '60'),
(2644, '99997', '1', 'DA23TTD', '60'),
(2645, '99997', '2', 'DA23TTD', '60'),
(2646, '99997', '3', 'DA23TTD', '60'),
(2647, '99997', '4', 'DA23TTD', '60'),
(2648, '99997', '5', 'DA23TTD', '60'),
(2649, '99997', '6', 'DA23TTD', '60'),
(2650, '99997', '7', 'DA23TTD', '60'),
(2651, '99997', '8', 'DA23TTD', '60'),
(2652, '99997', '9', 'DA23TTD', '60'),
(2653, '99999', '1', 'DA23TTD', '60'),
(2654, '99999', '2', 'DA23TTD', '60'),
(2655, '99999', '3', 'DA23TTD', '60'),
(2656, '99999', '4', 'DA23TTD', '60'),
(2657, '99999', '5', 'DA23TTD', '60'),
(2658, '99999', '6', 'DA23TTD', '60'),
(2659, '99999', '7', 'DA23TTD', '60'),
(2660, '99999', '8', 'DA23TTD', '60'),
(2661, '99999', '9', 'DA23TTD', '60'),
(2662, 'GVNT22424', '1', 'DA23TTD', '60'),
(2663, 'GVNT22424', '2', 'DA23TTD', '60'),
(2664, 'GVNT22424', '3', 'DA23TTD', '60'),
(2665, 'GVNT22424', '4', 'DA23TTD', '60'),
(2666, 'GVNT22424', '5', 'DA23TTD', '60'),
(2667, 'GVNT22424', '6', 'DA23TTD', '60'),
(2668, 'GVNT22424', '7', 'DA23TTD', '60'),
(2669, 'GVNT22424', '8', 'DA23TTD', '60'),
(2670, 'GVNT22424', '9', 'DA23TTD', '60');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quy_dinh`
--

CREATE TABLE `quy_dinh` (
  `MA_QUY_DINH` int(11) NOT NULL,
  `TEN_QUY_DINH` text DEFAULT NULL,
  `TRANG_THAI_QUY_DINH` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quy_dinh`
--

INSERT INTO `quy_dinh` (`MA_QUY_DINH`, `TEN_QUY_DINH`, `TRANG_THAI_QUY_DINH`) VALUES
(1, 'Tỷ lệ quy đổi giữa các tác giả đối với bài tham luận (báo cáo khoa học) và bài báo khoa học', 'Đang áp dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `TENDANGNHAP` varchar(255) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `MATKHAU` text DEFAULT NULL,
  `PHANQUYEN` text DEFAULT NULL,
  `TRANGTHAITAIKHOAN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`TENDANGNHAP`, `MAGV`, `MATKHAU`, `PHANQUYEN`, `TRANGTHAITAIKHOAN`) VALUES
('annb@tvu.edu.vn', '00245', NULL, 'Trưởng Khoa', 'Đang hoạt động'),
('baoquocone@gmail.com', '99997', NULL, 'Trưởng Bộ Môn', 'Đang hoạt động'),
('baoquoczero@gmail.com', '99999', NULL, 'Admin', 'Đang hoạt động'),
('diemhanh_tvu@tvu.edu.vn', '12705', NULL, 'Giảng Viên', 'Đang hoạt động'),
('duongminh@tvu.edu.vn', '00248', NULL, 'Trưởng Bộ Môn', 'Đang hoạt động'),
('Hattvi201084@tvu.edu.vn', '00249', NULL, 'Trưởng Khoa', 'Đang hoạt động'),
('hientvu@tvu.edu.vn', '00257', NULL, 'Admin', 'Đang hoạt động'),
('hohoangphucjob@gmail.com', '0123', NULL, 'Admin', 'Đang hoạt động'),
('huyngocntt@tvu.edu.vn', '00254', NULL, 'Admin', 'Đang hoạt động'),
('hvthanh@tvu.edu.vn', '00243', NULL, 'Giảng Viên', 'Đang hoạt động'),
('lamnn@tvu.edu.vn', '00244', NULL, 'Giảng Viên', 'Đang hoạt động'),
('lmtu@tvu.edu.vn', '03539', NULL, 'Giảng Viên', 'Đang hoạt động'),
('namtv@tvu.edu.vn', '12701', NULL, 'Giảng Viên', 'Đang hoạt động'),
('ngocdanthanhdt@tvu.edu.vn', '00246', NULL, 'Giảng Viên', 'Đang hoạt động'),
('nhiemnb@tvu.edu.vn', '14204', NULL, 'Giảng Viên', 'Đang hoạt động'),
('nhutkhau@tvu.edu.vn', '12700', NULL, 'Giảng Viên', 'Đang hoạt động'),
('nkduy@tvu.edu.vn', '01027', NULL, 'Giảng Viên', 'Đang hoạt động'),
('nkquoc@tvu.edu.vn', '03562', NULL, 'Giảng Viên', 'Đang hoạt động'),
('oane@tvu.edu.vn', '01548', NULL, 'Giảng Viên', 'Đang hoạt động'),
('phattai@tvu.edu.vn', '12702', NULL, 'Giảng Viên', 'Đang hoạt động'),
('phuocmien@tvu.edu.vn', '00253', NULL, 'Giảng Viên', 'Đang hoạt động'),
('ptpnam@tvu.edu.vn', '03546', NULL, 'Giảng Viên', 'Đang hoạt động'),
('pttmai@tvu.edu.vn', '00255', NULL, 'Giảng Viên', 'Đang hoạt động'),
('thiennhd@tvu.edu.vn', '00241', NULL, 'Giảng Viên', 'Đang hoạt động'),
('tinthanhtv2014@gmail.com', '0122', NULL, 'Admin', 'Đang hoạt động'),
('tqviettv@tvu.edu.vn', '00251', NULL, 'Giảng Viên', 'Đang hoạt động'),
('tramhoangnam@tvu.edu.vn', '00252', NULL, 'Giảng Viên', 'Đang hoạt động'),
('vankhanh@tvu.edu.vn', '00242', NULL, 'Giảng Viên', 'Đang hoạt động'),
('vothanhc@tvu.edu.vn', '00250', NULL, 'Giảng Viên', 'Đang hoạt động');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thoigian_xacnhan`
--

CREATE TABLE `thoigian_xacnhan` (
  `MA_THOIGIAN_XACNHAN` int(11) NOT NULL,
  `THOIGIANBATDAU` datetime DEFAULT NULL,
  `THOIGIANKETTHUC` datetime DEFAULT NULL,
  `TEN_KHOA` text DEFAULT NULL,
  `GHICHU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thoigian_xacnhan`
--

INSERT INTO `thoigian_xacnhan` (`MA_THOIGIAN_XACNHAN`, `THOIGIANBATDAU`, `THOIGIANKETTHUC`, `TEN_KHOA`, `GHICHU`) VALUES
(9, '2024-08-06 20:29:00', '2030-12-01 20:29:00', 'Khoa Kỹ Thuật Công Nghệ', 'CHONKHUNG'),
(22, '2024-08-06 20:29:00', '2030-12-01 20:29:00', 'Khoa Công Nghệ Thông Tin', 'CHONKHUNG'),
(34, '2024-08-31 19:03:38', '2030-08-01 19:03:38', 'Khoa Công Nghệ Thông Tin', 'NGHIENCUU'),
(35, '2024-08-31 19:03:38', '2030-08-01 19:03:38', 'Khoa Kỹ Thuật Công Nghệ', 'NGHIENCUU'),
(36, '2024-08-31 19:03:38', '2030-08-01 19:03:38', 'Ngoài trường', 'NGHIENCUU');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoc`
--

CREATE TABLE `thuoc` (
  `MACHUONGTRINH` int(11) NOT NULL,
  `MAMONHOC` int(11) NOT NULL,
  `SOTHUTUHOCKI` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thuoc`
--

INSERT INTO `thuoc` (`MACHUONGTRINH`, `MAMONHOC`, `SOTHUTUHOCKI`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 1),
(1, 9, 1),
(1, 10, 2),
(1, 11, 2),
(1, 12, 2),
(1, 13, 2),
(1, 14, 2),
(1, 15, 2),
(1, 16, 2),
(1, 17, 2),
(1, 18, 2),
(1, 19, 3),
(1, 20, 3),
(1, 21, 3),
(1, 22, 3),
(1, 23, 3),
(1, 24, 3),
(1, 25, 3),
(1, 26, 3),
(1, 27, 4),
(1, 28, 4),
(1, 29, 4),
(1, 30, 4),
(1, 31, 4),
(1, 32, 4),
(1, 33, 4),
(1, 34, 4),
(1, 35, 4),
(1, 36, 5),
(1, 37, 5),
(1, 38, 5),
(1, 39, 5),
(1, 40, 5),
(1, 41, 5),
(1, 42, 5),
(1, 43, 5),
(1, 44, 5),
(1, 45, 6),
(1, 46, 6),
(1, 47, 6),
(1, 48, 6),
(1, 49, 6),
(1, 50, 6),
(1, 51, 6),
(1, 52, 6),
(1, 53, 6),
(1, 54, 6),
(1, 55, 7),
(1, 56, 7),
(1, 57, 7),
(1, 58, 7),
(1, 59, 7),
(1, 60, 7),
(1, 61, 7),
(1, 62, 7),
(1, 63, 7),
(1, 64, 7),
(1, 65, 8),
(1, 66, 8),
(1, 67, 8),
(1, 68, 8),
(1, 69, 8),
(2, 4, 1),
(2, 5, 1),
(2, 8, 3),
(2, 9, 4),
(2, 12, 2),
(2, 15, 2),
(2, 21, 3),
(2, 36, 2),
(2, 54, 3),
(2, 66, 8),
(2, 70, 1),
(2, 71, 1),
(2, 72, 1),
(2, 73, 1),
(2, 74, 1),
(2, 75, 1),
(2, 76, 1),
(2, 77, 2),
(2, 78, 2),
(2, 79, 2),
(2, 80, 2),
(2, 81, 2),
(2, 82, 2),
(2, 83, 2),
(2, 84, 2),
(2, 85, 2),
(2, 86, 2),
(2, 87, 3),
(2, 88, 3),
(2, 89, 3),
(2, 90, 3),
(2, 91, 3),
(2, 92, 3),
(2, 93, 3),
(2, 94, 3),
(2, 95, 3),
(2, 96, 3),
(2, 97, 4),
(2, 98, 4),
(2, 99, 4),
(2, 100, 4),
(2, 101, 4),
(2, 102, 4),
(2, 103, 4),
(2, 104, 4),
(2, 105, 4),
(2, 106, 4),
(2, 107, 4),
(2, 108, 4),
(2, 109, 5),
(2, 110, 5),
(2, 111, 5),
(2, 112, 5),
(2, 113, 5),
(2, 114, 5),
(2, 115, 5),
(2, 116, 5),
(2, 117, 5),
(2, 118, 6),
(2, 119, 6),
(2, 120, 6),
(2, 121, 6),
(2, 122, 6),
(2, 123, 6),
(2, 124, 6),
(2, 125, 6),
(2, 126, 6),
(2, 127, 6),
(2, 128, 7),
(2, 129, 7),
(2, 130, 7),
(2, 131, 7),
(2, 132, 7),
(2, 133, 7),
(2, 134, 7),
(2, 135, 7),
(2, 136, 7),
(2, 137, 7),
(2, 138, 8),
(2, 139, 8),
(2, 140, 8),
(2, 141, 8),
(3, 1, 1),
(3, 4, 1),
(3, 5, 1),
(3, 8, 3),
(3, 9, 4),
(3, 12, 2),
(3, 15, 2),
(3, 21, 3),
(3, 36, 2),
(3, 54, 3),
(3, 66, 8),
(3, 70, 1),
(3, 71, 1),
(3, 73, 1),
(3, 74, 1),
(3, 75, 1),
(3, 76, 1),
(3, 77, 2),
(3, 78, 2),
(3, 79, 2),
(3, 80, 2),
(3, 81, 2),
(3, 83, 2),
(3, 84, 2),
(3, 85, 2),
(3, 86, 2),
(3, 87, 3),
(3, 88, 3),
(3, 89, 3),
(3, 90, 3),
(3, 91, 3),
(3, 92, 3),
(3, 93, 3),
(3, 94, 3),
(3, 95, 3),
(3, 96, 3),
(3, 97, 4),
(3, 98, 4),
(3, 99, 4),
(3, 100, 4),
(3, 101, 4),
(3, 102, 4),
(3, 103, 4),
(3, 104, 5),
(3, 105, 5),
(3, 106, 4),
(3, 107, 4),
(3, 113, 6),
(3, 117, 5),
(3, 131, 7),
(3, 138, 8),
(3, 142, 2),
(3, 143, 4),
(3, 144, 4),
(3, 145, 5),
(3, 146, 5),
(3, 147, 5),
(3, 148, 5),
(3, 149, 5),
(3, 150, 5),
(3, 151, 5),
(3, 152, 5),
(3, 153, 6),
(3, 154, 6),
(3, 155, 6),
(3, 156, 6),
(3, 157, 6),
(3, 158, 6),
(3, 159, 6),
(3, 160, 6),
(3, 161, 6),
(3, 162, 6),
(3, 163, 7),
(3, 164, 7),
(3, 165, 7),
(3, 166, 7),
(3, 167, 7),
(3, 168, 7),
(3, 169, 7),
(3, 170, 7),
(3, 171, 7),
(3, 172, 7),
(3, 173, 8),
(3, 174, 8),
(3, 175, 8),
(3, 176, 8),
(4, 1, 1),
(4, 138, 9),
(4, 177, 1),
(4, 178, 1),
(4, 179, 1),
(4, 180, 1),
(4, 181, 1),
(4, 182, 1),
(4, 183, 1),
(4, 184, 1),
(4, 185, 2),
(4, 186, 2),
(4, 187, 2),
(4, 188, 2),
(4, 189, 2),
(4, 190, 2),
(4, 191, 2),
(4, 192, 2),
(4, 193, 2),
(4, 194, 3),
(4, 195, 3),
(4, 196, 3),
(4, 197, 3),
(4, 198, 3),
(4, 199, 3),
(4, 200, 3),
(4, 201, 3),
(4, 202, 3),
(4, 203, 3),
(4, 204, 4),
(4, 205, 4),
(4, 206, 4),
(4, 207, 4),
(4, 208, 4),
(4, 209, 4),
(4, 210, 4),
(4, 211, 4),
(4, 212, 4),
(4, 213, 5),
(4, 214, 5),
(4, 215, 5),
(4, 216, 5),
(4, 217, 5),
(4, 218, 5),
(4, 219, 5),
(4, 220, 5),
(4, 221, 5),
(4, 222, 6),
(4, 223, 6),
(4, 224, 6),
(4, 225, 6),
(4, 226, 6),
(4, 227, 6),
(4, 228, 6),
(4, 229, 7),
(4, 230, 7),
(4, 231, 7),
(4, 232, 7),
(4, 233, 7),
(4, 234, 7),
(4, 235, 7),
(4, 236, 7),
(4, 237, 7),
(4, 238, 7),
(4, 239, 7),
(4, 240, 7),
(4, 241, 8),
(4, 242, 8),
(4, 243, 8),
(4, 244, 8),
(4, 245, 8),
(4, 246, 8),
(4, 247, 8),
(4, 248, 8),
(4, 249, 8),
(4, 250, 8),
(4, 251, 8),
(4, 252, 8),
(4, 253, 9),
(4, 254, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ty_le_quy_doi_gio_chuan`
--

CREATE TABLE `ty_le_quy_doi_gio_chuan` (
  `MA_QUY_DOI` int(11) NOT NULL,
  `MA_QUY_DINH` int(11) NOT NULL,
  `TEN_QUY_DOI` text DEFAULT NULL,
  `TY_LE` float DEFAULT NULL,
  `VIEN_CHUC_TRUONG` varchar(50) DEFAULT NULL,
  `THUC_HIEN_CHUAN` varchar(50) DEFAULT NULL,
  `TRANG_THAI_QUY_DOI` text DEFAULT NULL,
  `GHI_CHU_QUY_DOI` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ty_le_quy_doi_gio_chuan`
--

INSERT INTO `ty_le_quy_doi_gio_chuan` (`MA_QUY_DOI`, `MA_QUY_DINH`, `TEN_QUY_DOI`, `TY_LE`, `VIEN_CHUC_TRUONG`, `THUC_HIEN_CHUAN`, `TRANG_THAI_QUY_DOI`, `GHI_CHU_QUY_DOI`) VALUES
(1, 1, '16.2.b.Tác giả thứ nhất (bài có nhiều tác giả) là viên chức Trường ĐHTV: 50% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18, trường hợp đồng tác giả thứ nhất thì chia đều 50% cho đồng tác giả thứ nhất; 50% còn lại được chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có); tác giả độc lập hưởng 50% như tác giả thứ nhất;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chia đều cho các Tác giả thứ nhất'),
(2, 1, '16.2.b.Tác giả thứ nhất (bài có nhiều tác giả) là viên chức Trường ĐHTV: 50% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18, trường hợp đồng tác giả thứ nhất thì chia đều 50% cho đồng tác giả thứ nhất; 50% còn lại được chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có); tác giả độc lập hưởng 50% như tác giả thứ nhất;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có). Trừ tác giả thứ nhất'),
(3, 1, '16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);', 0, 'Không', 'Có', 'Đang áp dụng', 'Tác giả thứ nhất không thuộc trường'),
(4, 1, '16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chia cho 2 tác giả chịu trách nhiệm, chia đều'),
(5, 1, '16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);', 0.3, 'Có', 'Có', 'Đang áp dụng', 'Chia cho 1  tác giả chịu trách nhiệm'),
(6, 1, '16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Các đồng tác giả còn lại (trừ tác giả chịu trách nhiệm) được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất ngoài trường);'),
(7, 1, '16.2.dTrường hợp tác giả thứ nhất là viên chức của Trường ĐHTV nhưng không phải thực hiện chuẩn thì các tác giả còn lại hưởng 50% chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Tác giả thứ nhất được thưởng giờ dư theo quy định.', 0, 'Có', 'Không', 'Đang áp dụng', 'Tác giả thứ nhất không thực hiện chuẩn'),
(8, 1, '16.2.dTrường hợp tác giả thứ nhất là viên chức của Trường ĐHTV nhưng không phải thực hiện chuẩn thì các tác giả còn lại hưởng 50% chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Tác giả thứ nhất được thưởng giờ dư theo quy định.', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Trừ tác giả thứ nhất'),
(9, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 1, 'Có', 'Có', 'Đang áp dụng', 'Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi;'),
(10, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 0, 'Không', 'Có', 'Đang áp dụng', 'Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV'),
(11, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 0, 'Có', 'Không', 'Đang áp dụng', 'Trường hợp tác giả thứ nhất không thực hiện chuẩn (Không được luật nhắc đến)'),
(12, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV)'),
(13, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;'),
(14, 1, '20.3. Quy đổi viết thuyết minh đề tài, dự án và các hoạt động KH&CN ra giờ chuẩn NCKH.', 0, 'Có', 'Không', 'Đang áp dụng', 'Trường hợp không thực hiện chuẩn'),
(15, 1, '20.3. Quy đổi viết thuyết minh đề tài, dự án và các hoạt động KH&CN ra giờ chuẩn NCKH.', 0, 'Không', 'Có', 'Đang áp dụng', 'Trường hợp không thuộc trường'),
(16, 1, '20.3. Quy đổi viết thuyết minh đề tài, dự án và các hoạt động KH&CN ra giờ chuẩn NCKH.', 1, 'Có', 'Có', 'Đang áp dụng', 'Cá nhân thực hiện'),
(17, 1, '21.1. Chủ nhiệm đề tài quyết tỷ lệ hưởng giờ quy chuẩn NCKH cho các thành viên thực hiện đề tài trên cơ sở đồng thuận bằng văn bản (quyết định của chủ nhiệm đề tài là quyết định cuối cùng); trong trường hợp chủ nhiệm đề tài không phải là viên chức Trường ĐHTV thì lấy 50% số giờ được quy chuẩn quy định tại khoản 2 Điều này chia đều cho tổng số thành viên thực hiện đề tài (bao gồm chủ nhiệm đề tài).', 0, 'Có', 'Không', 'Đang áp dụng', 'Trường hợp không thực hiện chuẩn'),
(18, 1, '21.1. Chủ nhiệm đề tài quyết tỷ lệ hưởng giờ quy chuẩn NCKH cho các thành viên thực hiện đề tài trên cơ sở đồng thuận bằng văn bản (quyết định của chủ nhiệm đề tài là quyết định cuối cùng); trong trường hợp chủ nhiệm đề tài không phải là viên chức Trường ĐHTV thì lấy 50% số giờ được quy chuẩn quy định tại khoản 2 Điều này chia đều cho tổng số thành viên thực hiện đề tài (bao gồm chủ nhiệm đề tài).', 0, 'Không', 'Có', 'Đang áp dụng', 'Trường hợp không thuộc trường'),
(19, 1, '21.1. Chủ nhiệm đề tài quyết tỷ lệ hưởng giờ quy chuẩn NCKH cho các thành viên thực hiện đề tài trên cơ sở đồng thuận bằng văn bản (quyết định của chủ nhiệm đề tài là quyết định cuối cùng); trong trường hợp chủ nhiệm đề tài không phải là viên chức Trường ĐHTV thì lấy 50% số giờ được quy chuẩn quy định tại khoản 2 Điều này chia đều cho tổng số thành viên thực hiện đề tài (bao gồm chủ nhiệm đề tài).', 1, 'Có', 'Có', 'Đang áp dụng', 'Cá nhân thực hiện'),
(20, 1, 'Điều 19.d. Trường hợp sản phẩm có chủ biên/tác giả thứ nhất là viên chức thuộc khối phục vụ đào tạo và các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG; chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;', 0, 'Có', 'Không', 'Đang áp dụng', 'Trường hợp chủ biên không thực hiện chuẩn'),
(21, 1, 'Điều 19.d. Trường hợp sản phẩm có chủ biên/tác giả thứ nhất là viên chức thuộc khối phục vụ đào tạo và các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG; chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;', 0, 'Không', 'Có', 'Đang áp dụng', 'Trường hợp chủ biên không thuộc trường'),
(22, 1, 'Điều 19.d. Trường hợp sản phẩm có chủ biên/tác giả thứ nhất là viên chức thuộc khối phục vụ đào tạo và các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG; chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;'),
(23, 1, 'Điều 19.d. Trường hợp sản phẩm có chủ biên/tác giả thứ nhất là viên chức thuộc khối phục vụ đào tạo và các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG; chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG;');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bangphancong`
--
ALTER TABLE `bangphancong`
  ADD PRIMARY KEY (`MAPHANCONG`),
  ADD KEY `FK_PHAN_CONG_HOC_KY` (`MAHKNK`),
  ADD KEY `FK__UOC_PHAN_CONG` (`MAGV`);

--
-- Chỉ mục cho bảng `bao_cao_ket_thuc_mon`
--
ALTER TABLE `bao_cao_ket_thuc_mon`
  ADD PRIMARY KEY (`MADANHGIAKETTHUC`,`MACHITIETPHANCONG`),
  ADD KEY `FK_BAO_CAO_KET_THUC_MON2` (`MACHITIETPHANCONG`);

--
-- Chỉ mục cho bảng `bomon`
--
ALTER TABLE `bomon`
  ADD PRIMARY KEY (`MABOMON`),
  ADD KEY `FK_THUOC_KHOA` (`MAKHOA`);

--
-- Chỉ mục cho bảng `chitietphancong`
--
ALTER TABLE `chitietphancong`
  ADD PRIMARY KEY (`MACHITIETPHANCONG`),
  ADD KEY `FK_CO` (`MAPHANCONG`),
  ADD KEY `FK_PHAN_CONG_DAY` (`MALOP`),
  ADD KEY `FK_PHAN_CONG_MON_HOC` (`MAMONHOC`);

--
-- Chỉ mục cho bảng `chon_khung`
--
ALTER TABLE `chon_khung`
  ADD PRIMARY KEY (`MAGV`,`MANAMHOC`,`MAKHUNG`),
  ADD KEY `FK_CHON_KHUNG2` (`MANAMHOC`),
  ADD KEY `FK_CHON_KHUNG3` (`MAKHUNG`);

--
-- Chỉ mục cho bảng `chucdanh`
--
ALTER TABLE `chucdanh`
  ADD PRIMARY KEY (`MACHUCDANH`);

--
-- Chỉ mục cho bảng `chucvu`
--
ALTER TABLE `chucvu`
  ADD PRIMARY KEY (`MACHUCVU`);

--
-- Chỉ mục cho bảng `chuongtrinhdaotao`
--
ALTER TABLE `chuongtrinhdaotao`
  ADD PRIMARY KEY (`MACHUONGTRINH`),
  ADD KEY `FK_THUOC_CHUONG_TRINH__AO_TAO` (`MABOMON`);

--
-- Chỉ mục cho bảng `chuyen_mon_giang_vien`
--
ALTER TABLE `chuyen_mon_giang_vien`
  ADD PRIMARY KEY (`MACMGV`);

--
-- Chỉ mục cho bảng `co_chuc_danh`
--
ALTER TABLE `co_chuc_danh`
  ADD PRIMARY KEY (`MACHUCDANH`,`MAGV`),
  ADD KEY `FK_CO_CHUC_DANH2` (`MAGV`);

--
-- Chỉ mục cho bảng `co_ty_le`
--
ALTER TABLE `co_ty_le`
  ADD PRIMARY KEY (`MA_QUY_DOI`,`MA_LOAI_DANH_MUC`,`MA_LOAI_TAC_GIA`),
  ADD KEY `FK_CO_TY_LE2` (`MA_LOAI_DANH_MUC`),
  ADD KEY `FK_CO_TY_LE3` (`MA_LOAI_TAC_GIA`);

--
-- Chỉ mục cho bảng `dang_ky_thuc_hien_quy_doi`
--
ALTER TABLE `dang_ky_thuc_hien_quy_doi`
  ADD PRIMARY KEY (`MA_DANH_MUC`,`MAGV`,`MANAMHOC`,`MA_LOAI_TAC_GIA`,`TEN_DE_TAI`),
  ADD KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI2` (`MAGV`),
  ADD KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI3` (`MANAMHOC`),
  ADD KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI4` (`MA_LOAI_TAC_GIA`),
  ADD KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI5` (`TEN_DE_TAI`);

--
-- Chỉ mục cho bảng `danhmucquydoispkhcn`
--
ALTER TABLE `danhmucquydoispkhcn`
  ADD PRIMARY KEY (`MA_DANH_MUC`),
  ADD KEY `FK_THUOC_DANH_MUC` (`MA_LOAI_DANH_MUC`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`MAGV`),
  ADD KEY `FK_THUOC_BO_MON` (`MABOMON`);

--
-- Chỉ mục cho bảng `giu_chuc_vu`
--
ALTER TABLE `giu_chuc_vu`
  ADD PRIMARY KEY (`MAGV`,`MACHUCVU`),
  ADD KEY `FK_GIU_CHUC_VU2` (`MACHUCVU`);

--
-- Chỉ mục cho bảng `hinhthucdanhgia`
--
ALTER TABLE `hinhthucdanhgia`
  ADD PRIMARY KEY (`MADANHGIAKETTHUC`);

--
-- Chỉ mục cho bảng `hockynienkhoa`
--
ALTER TABLE `hockynienkhoa`
  ADD PRIMARY KEY (`MAHKNK`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`MAKHOA`);

--
-- Chỉ mục cho bảng `khunggiochuan`
--
ALTER TABLE `khunggiochuan`
  ADD PRIMARY KEY (`MAKHUNG`),
  ADD KEY `FK_CO_KHUNG_GIO_CHUAN` (`MACHUCDANH`);

--
-- Chỉ mục cho bảng `loai_danh_muc`
--
ALTER TABLE `loai_danh_muc`
  ADD PRIMARY KEY (`MA_LOAI_DANH_MUC`);

--
-- Chỉ mục cho bảng `loai_tac_gia`
--
ALTER TABLE `loai_tac_gia`
  ADD PRIMARY KEY (`MA_LOAI_TAC_GIA`);

--
-- Chỉ mục cho bảng `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`MALOP`),
  ADD KEY `FK_HOC` (`MACHUONGTRINH`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`MAMONHOC`);

--
-- Chỉ mục cho bảng `namhoc`
--
ALTER TABLE `namhoc`
  ADD PRIMARY KEY (`MANAMHOC`);

--
-- Chỉ mục cho bảng `nghien_cuu_kh`
--
ALTER TABLE `nghien_cuu_kh`
  ADD PRIMARY KEY (`TEN_DE_TAI`);

--
-- Chỉ mục cho bảng `phan_cong_gv_tu_dong`
--
ALTER TABLE `phan_cong_gv_tu_dong`
  ADD PRIMARY KEY (`MAPCGVTD`);

--
-- Chỉ mục cho bảng `quy_dinh`
--
ALTER TABLE `quy_dinh`
  ADD PRIMARY KEY (`MA_QUY_DINH`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`TENDANGNHAP`),
  ADD KEY `FK_TAI_KHOAN_CUA_GIANG_VIEN` (`MAGV`);

--
-- Chỉ mục cho bảng `thoigian_xacnhan`
--
ALTER TABLE `thoigian_xacnhan`
  ADD PRIMARY KEY (`MA_THOIGIAN_XACNHAN`);

--
-- Chỉ mục cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD PRIMARY KEY (`MACHUONGTRINH`,`MAMONHOC`),
  ADD KEY `FK_THUOC2` (`MAMONHOC`);

--
-- Chỉ mục cho bảng `ty_le_quy_doi_gio_chuan`
--
ALTER TABLE `ty_le_quy_doi_gio_chuan`
  ADD PRIMARY KEY (`MA_QUY_DOI`),
  ADD KEY `FK_DUOC_QUY_DINH` (`MA_QUY_DINH`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bangphancong`
--
ALTER TABLE `bangphancong`
  MODIFY `MAPHANCONG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `bomon`
--
ALTER TABLE `bomon`
  MODIFY `MABOMON` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `chitietphancong`
--
ALTER TABLE `chitietphancong`
  MODIFY `MACHITIETPHANCONG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `chucdanh`
--
ALTER TABLE `chucdanh`
  MODIFY `MACHUCDANH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chucvu`
--
ALTER TABLE `chucvu`
  MODIFY `MACHUCVU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `chuongtrinhdaotao`
--
ALTER TABLE `chuongtrinhdaotao`
  MODIFY `MACHUONGTRINH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chuyen_mon_giang_vien`
--
ALTER TABLE `chuyen_mon_giang_vien`
  MODIFY `MACMGV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `danhmucquydoispkhcn`
--
ALTER TABLE `danhmucquydoispkhcn`
  MODIFY `MA_DANH_MUC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT cho bảng `hinhthucdanhgia`
--
ALTER TABLE `hinhthucdanhgia`
  MODIFY `MADANHGIAKETTHUC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `hockynienkhoa`
--
ALTER TABLE `hockynienkhoa`
  MODIFY `MAHKNK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `khoa`
--
ALTER TABLE `khoa`
  MODIFY `MAKHOA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `khunggiochuan`
--
ALTER TABLE `khunggiochuan`
  MODIFY `MAKHUNG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `loai_danh_muc`
--
ALTER TABLE `loai_danh_muc`
  MODIFY `MA_LOAI_DANH_MUC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `loai_tac_gia`
--
ALTER TABLE `loai_tac_gia`
  MODIFY `MA_LOAI_TAC_GIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  MODIFY `MAMONHOC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT cho bảng `namhoc`
--
ALTER TABLE `namhoc`
  MODIFY `MANAMHOC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `phan_cong_gv_tu_dong`
--
ALTER TABLE `phan_cong_gv_tu_dong`
  MODIFY `MAPCGVTD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2671;

--
-- AUTO_INCREMENT cho bảng `quy_dinh`
--
ALTER TABLE `quy_dinh`
  MODIFY `MA_QUY_DINH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `thoigian_xacnhan`
--
ALTER TABLE `thoigian_xacnhan`
  MODIFY `MA_THOIGIAN_XACNHAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `ty_le_quy_doi_gio_chuan`
--
ALTER TABLE `ty_le_quy_doi_gio_chuan`
  MODIFY `MA_QUY_DOI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bangphancong`
--
ALTER TABLE `bangphancong`
  ADD CONSTRAINT `FK_PHAN_CONG_HOC_KY` FOREIGN KEY (`MAHKNK`) REFERENCES `hockynienkhoa` (`MAHKNK`),
  ADD CONSTRAINT `FK__UOC_PHAN_CONG` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`);

--
-- Các ràng buộc cho bảng `bao_cao_ket_thuc_mon`
--
ALTER TABLE `bao_cao_ket_thuc_mon`
  ADD CONSTRAINT `FK_BAO_CAO_KET_THUC_MON` FOREIGN KEY (`MADANHGIAKETTHUC`) REFERENCES `hinhthucdanhgia` (`MADANHGIAKETTHUC`),
  ADD CONSTRAINT `FK_BAO_CAO_KET_THUC_MON2` FOREIGN KEY (`MACHITIETPHANCONG`) REFERENCES `chitietphancong` (`MACHITIETPHANCONG`);

--
-- Các ràng buộc cho bảng `bomon`
--
ALTER TABLE `bomon`
  ADD CONSTRAINT `FK_THUOC_KHOA` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`);

--
-- Các ràng buộc cho bảng `chitietphancong`
--
ALTER TABLE `chitietphancong`
  ADD CONSTRAINT `FK_CO` FOREIGN KEY (`MAPHANCONG`) REFERENCES `bangphancong` (`MAPHANCONG`),
  ADD CONSTRAINT `FK_PHAN_CONG_DAY` FOREIGN KEY (`MALOP`) REFERENCES `lop` (`MALOP`),
  ADD CONSTRAINT `FK_PHAN_CONG_MON_HOC` FOREIGN KEY (`MAMONHOC`) REFERENCES `monhoc` (`MAMONHOC`);

--
-- Các ràng buộc cho bảng `chon_khung`
--
ALTER TABLE `chon_khung`
  ADD CONSTRAINT `FK_CHON_KHUNG` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  ADD CONSTRAINT `FK_CHON_KHUNG2` FOREIGN KEY (`MANAMHOC`) REFERENCES `namhoc` (`MANAMHOC`),
  ADD CONSTRAINT `FK_CHON_KHUNG3` FOREIGN KEY (`MAKHUNG`) REFERENCES `khunggiochuan` (`MAKHUNG`);

--
-- Các ràng buộc cho bảng `chuongtrinhdaotao`
--
ALTER TABLE `chuongtrinhdaotao`
  ADD CONSTRAINT `FK_THUOC_CHUONG_TRINH__AO_TAO` FOREIGN KEY (`MABOMON`) REFERENCES `bomon` (`MABOMON`);

--
-- Các ràng buộc cho bảng `co_chuc_danh`
--
ALTER TABLE `co_chuc_danh`
  ADD CONSTRAINT `FK_CO_CHUC_DANH` FOREIGN KEY (`MACHUCDANH`) REFERENCES `chucdanh` (`MACHUCDANH`),
  ADD CONSTRAINT `FK_CO_CHUC_DANH2` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`);

--
-- Các ràng buộc cho bảng `co_ty_le`
--
ALTER TABLE `co_ty_le`
  ADD CONSTRAINT `FK_CO_TY_LE` FOREIGN KEY (`MA_QUY_DOI`) REFERENCES `ty_le_quy_doi_gio_chuan` (`MA_QUY_DOI`),
  ADD CONSTRAINT `FK_CO_TY_LE2` FOREIGN KEY (`MA_LOAI_DANH_MUC`) REFERENCES `loai_danh_muc` (`MA_LOAI_DANH_MUC`),
  ADD CONSTRAINT `FK_CO_TY_LE3` FOREIGN KEY (`MA_LOAI_TAC_GIA`) REFERENCES `loai_tac_gia` (`MA_LOAI_TAC_GIA`);

--
-- Các ràng buộc cho bảng `dang_ky_thuc_hien_quy_doi`
--
ALTER TABLE `dang_ky_thuc_hien_quy_doi`
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI` FOREIGN KEY (`MA_DANH_MUC`) REFERENCES `danhmucquydoispkhcn` (`MA_DANH_MUC`),
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI2` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI3` FOREIGN KEY (`MANAMHOC`) REFERENCES `namhoc` (`MANAMHOC`),
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI4` FOREIGN KEY (`MA_LOAI_TAC_GIA`) REFERENCES `loai_tac_gia` (`MA_LOAI_TAC_GIA`),
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI5` FOREIGN KEY (`TEN_DE_TAI`) REFERENCES `nghien_cuu_kh` (`TEN_DE_TAI`);

--
-- Các ràng buộc cho bảng `danhmucquydoispkhcn`
--
ALTER TABLE `danhmucquydoispkhcn`
  ADD CONSTRAINT `FK_THUOC_DANH_MUC` FOREIGN KEY (`MA_LOAI_DANH_MUC`) REFERENCES `loai_danh_muc` (`MA_LOAI_DANH_MUC`);

--
-- Các ràng buộc cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD CONSTRAINT `FK_THUOC_BO_MON` FOREIGN KEY (`MABOMON`) REFERENCES `bomon` (`MABOMON`);

--
-- Các ràng buộc cho bảng `giu_chuc_vu`
--
ALTER TABLE `giu_chuc_vu`
  ADD CONSTRAINT `FK_GIU_CHUC_VU` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  ADD CONSTRAINT `FK_GIU_CHUC_VU2` FOREIGN KEY (`MACHUCVU`) REFERENCES `chucvu` (`MACHUCVU`);

--
-- Các ràng buộc cho bảng `khunggiochuan`
--
ALTER TABLE `khunggiochuan`
  ADD CONSTRAINT `FK_CO_KHUNG_GIO_CHUAN` FOREIGN KEY (`MACHUCDANH`) REFERENCES `chucdanh` (`MACHUCDANH`);

--
-- Các ràng buộc cho bảng `lop`
--
ALTER TABLE `lop`
  ADD CONSTRAINT `FK_HOC` FOREIGN KEY (`MACHUONGTRINH`) REFERENCES `chuongtrinhdaotao` (`MACHUONGTRINH`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `FK_TAI_KHOAN_CUA_GIANG_VIEN` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`);

--
-- Các ràng buộc cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD CONSTRAINT `FK_THUOC` FOREIGN KEY (`MACHUONGTRINH`) REFERENCES `chuongtrinhdaotao` (`MACHUONGTRINH`),
  ADD CONSTRAINT `FK_THUOC2` FOREIGN KEY (`MAMONHOC`) REFERENCES `monhoc` (`MAMONHOC`);

--
-- Các ràng buộc cho bảng `ty_le_quy_doi_gio_chuan`
--
ALTER TABLE `ty_le_quy_doi_gio_chuan`
  ADD CONSTRAINT `FK_DUOC_QUY_DINH` FOREIGN KEY (`MA_QUY_DINH`) REFERENCES `quy_dinh` (`MA_QUY_DINH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
