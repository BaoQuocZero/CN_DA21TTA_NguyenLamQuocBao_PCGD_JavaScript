-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: nghiencuukhoahoc
-- ------------------------------------------------------
-- Server version	5.7.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bangphancong`
--

DROP TABLE IF EXISTS `bangphancong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangphancong` (
  `MAPHANCONG` int(11) NOT NULL AUTO_INCREMENT,
  `MAGV` varchar(255) NOT NULL,
  `THOIGIANLAP` date DEFAULT NULL,
  PRIMARY KEY (`MAPHANCONG`),
  KEY `FK__UOC_PHAN_CONG` (`MAGV`),
  CONSTRAINT `FK__UOC_PHAN_CONG` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangphancong`
--

LOCK TABLES `bangphancong` WRITE;
/*!40000 ALTER TABLE `bangphancong` DISABLE KEYS */;
/*!40000 ALTER TABLE `bangphancong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bao_cao_ket_thuc_mon`
--

DROP TABLE IF EXISTS `bao_cao_ket_thuc_mon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bao_cao_ket_thuc_mon` (
  `MADANHGIAKETTHUC` int(11) NOT NULL,
  `MACHITIETPHANCONG` int(11) NOT NULL,
  `LANDANHGIA` int(11) DEFAULT NULL,
  `NGAYDANHGIA` date DEFAULT NULL,
  `NGAYBAOCAOKETTHUC` date DEFAULT NULL,
  `TRANG_THAI_DANG_KY` text,
  PRIMARY KEY (`MADANHGIAKETTHUC`,`MACHITIETPHANCONG`),
  KEY `FK_BAO_CAO_KET_THUC_MON2` (`MACHITIETPHANCONG`),
  CONSTRAINT `FK_BAO_CAO_KET_THUC_MON` FOREIGN KEY (`MADANHGIAKETTHUC`) REFERENCES `hinhthucdanhgia` (`MADANHGIAKETTHUC`),
  CONSTRAINT `FK_BAO_CAO_KET_THUC_MON2` FOREIGN KEY (`MACHITIETPHANCONG`) REFERENCES `chitietphancong` (`MACHITIETPHANCONG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bao_cao_ket_thuc_mon`
--

LOCK TABLES `bao_cao_ket_thuc_mon` WRITE;
/*!40000 ALTER TABLE `bao_cao_ket_thuc_mon` DISABLE KEYS */;
/*!40000 ALTER TABLE `bao_cao_ket_thuc_mon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bomon`
--

DROP TABLE IF EXISTS `bomon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bomon` (
  `MABOMON` int(11) NOT NULL AUTO_INCREMENT,
  `MAKHOA` int(11) NOT NULL,
  `TENBOMON` text,
  PRIMARY KEY (`MABOMON`),
  KEY `FK_THUOC_KHOA` (`MAKHOA`),
  CONSTRAINT `FK_THUOC_KHOA` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bomon`
--

LOCK TABLES `bomon` WRITE;
/*!40000 ALTER TABLE `bomon` DISABLE KEYS */;
INSERT INTO `bomon` VALUES (2,1,'Bộ Môn Công Nghệ Phần Mềm'),(16,11,'Bộ môn Công nghệ thông tin'),(18,12,'Ngoài trường');
/*!40000 ALTER TABLE `bomon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietphancong`
--

DROP TABLE IF EXISTS `chitietphancong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphancong` (
  `MACHITIETPHANCONG` int(11) NOT NULL,
  `MAMONHOC` int(11) NOT NULL,
  `MAPHANCONG` int(11) NOT NULL,
  `MALOP` varchar(255) NOT NULL,
  `MAHKNK` int(11) NOT NULL,
  `THOIGIANBATDAUPHANCONG` date DEFAULT NULL,
  `THOIGIANKETTHUCPHANCONG` date DEFAULT NULL,
  PRIMARY KEY (`MACHITIETPHANCONG`),
  KEY `FK_CO` (`MAPHANCONG`),
  KEY `FK_PHAN_CONG_DAY` (`MALOP`),
  KEY `FK_PHAN_CONG_HOC_KY_NIEN_KHOA` (`MAHKNK`),
  KEY `FK_PHAN_CONG_MON_HOC` (`MAMONHOC`),
  CONSTRAINT `FK_CO` FOREIGN KEY (`MAPHANCONG`) REFERENCES `bangphancong` (`MAPHANCONG`),
  CONSTRAINT `FK_PHAN_CONG_DAY` FOREIGN KEY (`MALOP`) REFERENCES `lop` (`MALOP`),
  CONSTRAINT `FK_PHAN_CONG_HOC_KY_NIEN_KHOA` FOREIGN KEY (`MAHKNK`) REFERENCES `hockynienkhoa` (`MAHKNK`),
  CONSTRAINT `FK_PHAN_CONG_MON_HOC` FOREIGN KEY (`MAMONHOC`) REFERENCES `monhoc` (`MAMONHOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphancong`
--

LOCK TABLES `chitietphancong` WRITE;
/*!40000 ALTER TABLE `chitietphancong` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitietphancong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chon_khung`
--

DROP TABLE IF EXISTS `chon_khung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chon_khung` (
  `MAGV` varchar(255) NOT NULL,
  `MANAMHOC` int(11) NOT NULL,
  `MAKHUNG` int(11) NOT NULL,
  PRIMARY KEY (`MAGV`,`MANAMHOC`,`MAKHUNG`),
  KEY `FK_CHON_KHUNG2` (`MANAMHOC`),
  KEY `FK_CHON_KHUNG3` (`MAKHUNG`),
  CONSTRAINT `FK_CHON_KHUNG` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  CONSTRAINT `FK_CHON_KHUNG2` FOREIGN KEY (`MANAMHOC`) REFERENCES `namhoc` (`MANAMHOC`),
  CONSTRAINT `FK_CHON_KHUNG3` FOREIGN KEY (`MAKHUNG`) REFERENCES `khunggiochuan` (`MAKHUNG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chon_khung`
--

LOCK TABLES `chon_khung` WRITE;
/*!40000 ALTER TABLE `chon_khung` DISABLE KEYS */;
INSERT INTO `chon_khung` VALUES ('99999',8,10);
/*!40000 ALTER TABLE `chon_khung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucdanh`
--

DROP TABLE IF EXISTS `chucdanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chucdanh` (
  `MACHUCDANH` int(11) NOT NULL AUTO_INCREMENT,
  `TENCHUCDANH` text,
  PRIMARY KEY (`MACHUCDANH`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucdanh`
--

LOCK TABLES `chucdanh` WRITE;
/*!40000 ALTER TABLE `chucdanh` DISABLE KEYS */;
INSERT INTO `chucdanh` VALUES (1,'Giảng viên cao cấp (Hạng I)'),(2,'Giảng viên chính (Hạng II)'),(3,'Giảng viên (Hạng III)'),(4,'Trợ Giảng'),(5,'Giảng viên Tập sự');
/*!40000 ALTER TABLE `chucdanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chucvu` (
  `MACHUCVU` int(11) NOT NULL AUTO_INCREMENT,
  `TENCHUCVU` text,
  PRIMARY KEY (`MACHUCVU`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` VALUES (1,'Phó Trưởng Khoa'),(2,'Trưởng Bộ Môn'),(3,'Phó Trưởng Bộ Môn'),(4,'Giảng Viên Chính'),(5,'Giảng Viên'),(6,'Trưởng Khoa'),(7,'Bộ môn Công nghệ thông tin'),(8,'Phó Trưởng bộ môn CNTT'),(9,'Trưởng bộ môn CNTT');
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuongtrinhdaotao`
--

DROP TABLE IF EXISTS `chuongtrinhdaotao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuongtrinhdaotao` (
  `MACHUONGTRINH` int(11) NOT NULL AUTO_INCREMENT,
  `MABOMON` int(11) NOT NULL,
  `TENCHUONGTRINH` text,
  PRIMARY KEY (`MACHUONGTRINH`),
  KEY `FK_THUOC_CHUONG_TRINH__AO_TAO` (`MABOMON`),
  CONSTRAINT `FK_THUOC_CHUONG_TRINH__AO_TAO` FOREIGN KEY (`MABOMON`) REFERENCES `bomon` (`MABOMON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuongtrinhdaotao`
--

LOCK TABLES `chuongtrinhdaotao` WRITE;
/*!40000 ALTER TABLE `chuongtrinhdaotao` DISABLE KEYS */;
/*!40000 ALTER TABLE `chuongtrinhdaotao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_chuc_danh`
--

DROP TABLE IF EXISTS `co_chuc_danh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_chuc_danh` (
  `MACHUCDANH` int(11) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `THOIGIANNHAN` date DEFAULT NULL,
  `TRANGTHAI` text,
  PRIMARY KEY (`MACHUCDANH`,`MAGV`),
  KEY `FK_CO_CHUC_DANH2` (`MAGV`),
  CONSTRAINT `FK_CO_CHUC_DANH` FOREIGN KEY (`MACHUCDANH`) REFERENCES `chucdanh` (`MACHUCDANH`),
  CONSTRAINT `FK_CO_CHUC_DANH2` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_chuc_danh`
--

LOCK TABLES `co_chuc_danh` WRITE;
/*!40000 ALTER TABLE `co_chuc_danh` DISABLE KEYS */;
INSERT INTO `co_chuc_danh` VALUES (1,'00245','2024-07-08','Đang giữ chức danh'),(1,'00254','2024-07-09','Đang giữ chức danh'),(1,'99999','2024-06-30','Đang giữ chức danh'),(2,'00249','2024-07-09','Đang giữ chức danh'),(2,'00250','2024-07-08','Đang giữ chức danh'),(3,'12705','2024-07-08','Đang giữ chức danh'),(5,'00248','2024-07-08','Đang giữ chức danh');
/*!40000 ALTER TABLE `co_chuc_danh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_ty_le`
--

DROP TABLE IF EXISTS `co_ty_le`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_ty_le` (
  `MA_QUY_DOI` int(11) NOT NULL,
  `MA_LOAI_DANH_MUC` int(11) NOT NULL,
  `MA_LOAI_TAC_GIA` int(11) NOT NULL,
  `DA_LOAI_TAC_GIA` varchar(50) DEFAULT NULL,
  `SO_TAC_GIA_THUOC_LOAI` int(11) DEFAULT NULL,
  PRIMARY KEY (`MA_QUY_DOI`,`MA_LOAI_DANH_MUC`,`MA_LOAI_TAC_GIA`),
  KEY `FK_CO_TY_LE2` (`MA_LOAI_DANH_MUC`),
  KEY `FK_CO_TY_LE3` (`MA_LOAI_TAC_GIA`),
  CONSTRAINT `FK_CO_TY_LE` FOREIGN KEY (`MA_QUY_DOI`) REFERENCES `ty_le_quy_doi_gio_chuan` (`MA_QUY_DOI`),
  CONSTRAINT `FK_CO_TY_LE2` FOREIGN KEY (`MA_LOAI_DANH_MUC`) REFERENCES `loai_danh_muc` (`MA_LOAI_DANH_MUC`),
  CONSTRAINT `FK_CO_TY_LE3` FOREIGN KEY (`MA_LOAI_TAC_GIA`) REFERENCES `loai_tac_gia` (`MA_LOAI_TAC_GIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_ty_le`
--

LOCK TABLES `co_ty_le` WRITE;
/*!40000 ALTER TABLE `co_ty_le` DISABLE KEYS */;
INSERT INTO `co_ty_le` VALUES (8,2,1,'Không',2),(9,2,2,'Có',0),(9,2,3,'Có',0),(10,2,1,'Không',2),(11,2,2,'Không',2),(12,2,2,'Không',1),(13,2,1,'Có',1),(13,2,3,'Có',0),(14,2,1,'Không',1),(15,2,1,'Có',1),(15,2,2,'Có',0),(15,2,3,'Có',0);
/*!40000 ALTER TABLE `co_ty_le` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dang_ky_thuc_hien_quy_doi`
--

DROP TABLE IF EXISTS `dang_ky_thuc_hien_quy_doi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dang_ky_thuc_hien_quy_doi` (
  `MA_DANH_MUC` int(11) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `MANAMHOC` int(11) NOT NULL,
  `MA_LOAI_TAC_GIA` int(11) NOT NULL,
  `SOGIOQUYDOI` int(11) DEFAULT NULL,
  `TEN_NGHIEN_CUU` text,
  `THOI_GIAN_DANG_KY` date DEFAULT NULL,
  `TRANG_THAI_DANG_KY` text,
  PRIMARY KEY (`MA_DANH_MUC`,`MAGV`,`MANAMHOC`,`MA_LOAI_TAC_GIA`),
  KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI2` (`MAGV`),
  KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI3` (`MANAMHOC`),
  KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI4` (`MA_LOAI_TAC_GIA`),
  CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI` FOREIGN KEY (`MA_DANH_MUC`) REFERENCES `danhmucquydoispkhcn` (`MA_DANH_MUC`),
  CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI2` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI3` FOREIGN KEY (`MANAMHOC`) REFERENCES `namhoc` (`MANAMHOC`),
  CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI4` FOREIGN KEY (`MA_LOAI_TAC_GIA`) REFERENCES `loai_tac_gia` (`MA_LOAI_TAC_GIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dang_ky_thuc_hien_quy_doi`
--

LOCK TABLES `dang_ky_thuc_hien_quy_doi` WRITE;
/*!40000 ALTER TABLE `dang_ky_thuc_hien_quy_doi` DISABLE KEYS */;
/*!40000 ALTER TABLE `dang_ky_thuc_hien_quy_doi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmucquydoispkhcn`
--

DROP TABLE IF EXISTS `danhmucquydoispkhcn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmucquydoispkhcn` (
  `MA_DANH_MUC` int(11) NOT NULL AUTO_INCREMENT,
  `MA_LOAI_DANH_MUC` int(11) NOT NULL,
  `GIO_CHUAN` int(11) DEFAULT NULL,
  `NOI_DUNG_DANH_MUC` text,
  `ISBN` varchar(50) DEFAULT NULL,
  `WOS_SCOUPUS` varchar(50) DEFAULT NULL,
  `HANG_WOS_SCOUPUS` varchar(10) DEFAULT NULL,
  `LOI_NHUAN` varchar(100) DEFAULT NULL,
  `DON_VI_TINH` varchar(50) DEFAULT NULL,
  `GIAI_THUONG` varchar(50) DEFAULT NULL,
  `XEP_HANG_QUARTILES` varchar(50) DEFAULT NULL,
  `NAM_THUC_HIEN` text,
  `TRANG_THAI_DANH_MUC` varchar(100) DEFAULT NULL,
  `GHI_CHU_DANH_MUC` text,
  PRIMARY KEY (`MA_DANH_MUC`),
  KEY `FK_THUOC_DANH_MUC` (`MA_LOAI_DANH_MUC`),
  CONSTRAINT `FK_THUOC_DANH_MUC` FOREIGN KEY (`MA_LOAI_DANH_MUC`) REFERENCES `loai_danh_muc` (`MA_LOAI_DANH_MUC`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmucquydoispkhcn`
--

LOCK TABLES `danhmucquydoispkhcn` WRITE;
/*!40000 ALTER TABLE `danhmucquydoispkhcn` DISABLE KEYS */;
INSERT INTO `danhmucquydoispkhcn` VALUES (1,2,195,'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 1 Điều 11.','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Kỷ yếu có mã số ISBN'),(2,2,98,'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 1 Điều 11.','Không','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Kỷ yếu không có mã số ISBN'),(3,2,255,'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 2 Điều 11.','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Kỷ yếu (proceedings) có mã số ISBN'),(4,2,195,'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 2 Điều 11.','Không','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Kỷ yếu (proceedings) không có mã số ISBN'),(5,2,98,'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 3 Điều 11.','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Kỷ yếu/proceedings có mã số ISBN'),(6,2,49,'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 3 Điều 11.','Không','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Kỷ yếu/proceedings không có mã số ISBN'),(7,2,64,'Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu hội nghị hội thảo chuyên ngành bên ngoài trường có phản biện, sử dụng ngôn ngữ tiếng Việt và các hội thảo hội nghị khác có chỉ số ISBN','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Không'),(8,2,234,'Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu (proceedings) hội nghị hội thảo quốc tế xuất bản bằng ngôn ngữ tiếng Anh có phản biện, có chỉ số ISBN không thuộc danh mục WoS/Scopus.','Có','Không','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Không'),(9,2,378,' Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu (proceedings) hội nghị hội thảo quốc tế xuất bản bằng ngôn ngữ tiếng Anh, có chỉ số ISBN thuộc danh mục WoS/Scopus.','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Không'),(10,2,0,'Các báo cáo khoa học/ tham luận đăng toàn văn hoặc tóm tắt tại hội thảo/hội nghị đặc biệt khác phục vụ cho quan hệ đối ngoại, nâng cao hình ảnh và vị thế của Trường ĐHTV, thì các đơn vị được giao tổ chức/tham gia sự kiện phối hợp với Phòng KHCN để trình Hiệu trưởng xem xét, quyết định mức giờ chuẩn quy đổi cụ thể trước khi thực hiện.','Không rõ','Không rõ','Không rõ','Không rõ','Không rõ','Không rõ','Không rõ','2024-2025','Đang áp dụng','Hiệu trưởng xem xét, quyết định mức giờ chuẩn quy đổi cụ thể trước khi thực hiện.'),(11,3,195,'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, không được tính điểm công trình của HĐGSNN.','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Tạp chí khoa học Trường ĐHTV'),(12,3,146,'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, không được tính điểm công trình của HĐGSNN.','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Các tập chí khác'),(13,3,235,'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, được tính điểm công trình của HĐGSNN (tạp chí khoa học trong nước có uy tín).','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Tạp chí khoa học Trường ĐHTV'),(14,3,195,'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, được tính điểm công trình của HĐGSNN (tạp chí khoa học trong nước có uy tín).','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Các tạp chí khác'),(15,3,244,'Bài báo khoa học được công bố trên tạp chí khoa học trong nước hoặc quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, không có trong danh mục WoS/Scopus','Có','Không','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Tạp chí khoa học Trường ĐHTV'),(16,3,195,'Bài báo khoa học được công bố trên tạp chí khoa học trong nước hoặc quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, không có trong danh mục WoS/Scopus','Có','Không','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Các tạp chí khác'),(17,3,420,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS/Scopus (tạp chí khoa học quốc tế uy tín), không được xếp hạng.','Có','Có','Không','Không','Bài','Không','Không','2024-2025','Đang áp dụng','Không được xếp hạng'),(18,3,855,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.','Có','Có','Không','Không','Bài','Không','Q1','2024-2025','Đang áp dụng','Được xếp hạng'),(19,3,642,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.','Có','Có','Không','Không','Bài','Không','Q2','2024-2025','Đang áp dụng','Được xếp hạng'),(20,3,535,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.','Có','Có','Không','Không','Bài','Không','Q3','2024-2025','Đang áp dụng','Được xếp hạng'),(21,3,428,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.','Có','Có','Không','Không','Bài','Không','Q4','2024-2025','Đang áp dụng','Được xếp hạng'),(22,3,1050,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.','Có','Có','Không','Không','Bài','Không','Q1','2024-2025','Đang áp dụng','Được xếp hạng'),(23,3,855,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.','Có','Có','Không','Không','Bài','Không','Q2','2024-2025','Đang áp dụng','Được xếp hạng'),(24,3,642,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.','Có','Có','Không','Không','Bài','Không','Q3','2024-2025','Đang áp dụng','Được xếp hạng'),(25,3,535,'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.','Có','Có','Không','Không','Bài','Không','Q4','2024-2025','Đang áp dụng','Được xếp hạng'),(26,3,98,'Các sản phẩm KH&CN công bố bởi viên chức (chỉ tính đối với tác giả thứ nhất hoặc tác giả chịu trách nhiệm trong trường hợp tác giả thứ nhất không phải viên chức của Trường ĐHTV, trường hợp đồng tác giả thứ nhất hoặc đồng tác giả chịu trách nhiệm thì chia đôi) được xuất bản bởi các tạp chí và nhà xuất bản quốc tế uy tín (nằm trong danh mục WoS/Scopus) mà tên đơn vị của Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations) thì được tính giờ nhiệm vụ NCKH là 98 giờ, đứng thứ nhất được tính 195 giờ.','Có','Có','Không','Không','Sản phẩm','Không','Không','2024-2025','Đang áp dụng','Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations)'),(27,3,195,'Các sản phẩm KH&CN công bố bởi viên chức (chỉ tính đối với tác giả thứ nhất hoặc tác giả chịu trách nhiệm trong trường hợp tác giả thứ nhất không phải viên chức của Trường ĐHTV, trường hợp đồng tác giả thứ nhất hoặc đồng tác giả chịu trách nhiệm thì chia đôi) được xuất bản bởi các tạp chí và nhà xuất bản quốc tế uy tín (nằm trong danh mục WoS/Scopus) mà tên đơn vị của Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations) thì được tính giờ nhiệm vụ NCKH là 98 giờ, đứng thứ nhất được tính 195 giờ.','Có','Có','Không','Không','Sản phẩm','Không','Không','2024-2025','Đang áp dụng','Trường ĐHTV đứng thứ nhất'),(28,3,390,'Bằng độc quyền Giải pháp hữu ích Việt Nam','Không','Không','Không','Không','Bằng','Không','Không','2024-2025','Đang áp dụng','Các sản phẩm SHTT (đơn vị tính trên 01 bằng).'),(29,3,488,'Bằng độc quyền sáng chế (chuẩn patent Việt Nam)','Không','Không','Không','Không','Bằng','Không','Không','2024-2025','Đang áp dụng','Các sản phẩm SHTT (đơn vị tính trên 01 bằng).'),(30,3,585,'Bằng độc quyền sáng chế chuẩn Patent của Mỹ/ của Châu Âu/ của Đông Bắc Á','Không','Không','Không','Không','Bằng','Không','Không','2024-2025','Đang áp dụng','Các sản phẩm SHTT (đơn vị tính trên 01 bằng).');
/*!40000 ALTER TABLE `danhmucquydoispkhcn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giangvien`
--

DROP TABLE IF EXISTS `giangvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giangvien` (
  `MAGV` varchar(255) NOT NULL,
  `MABOMON` int(11) NOT NULL,
  `TENGV` varchar(100) DEFAULT NULL,
  `EMAIL` text,
  `DIENTHOAI` varchar(50) DEFAULT NULL,
  `DIACHI` text,
  PRIMARY KEY (`MAGV`),
  KEY `FK_THUOC_BO_MON` (`MABOMON`),
  CONSTRAINT `FK_THUOC_BO_MON` FOREIGN KEY (`MABOMON`) REFERENCES `bomon` (`MABOMON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giangvien`
--

LOCK TABLES `giangvien` WRITE;
/*!40000 ALTER TABLE `giangvien` DISABLE KEYS */;
INSERT INTO `giangvien` VALUES ('00241',16,'Nguyễn Hoàng Duy Thiện','duythien@tvu.edu.vn','0912345678','123 Đường ABC, Trà Vinh'),('00242',16,'Dương Ngọc Vân Khanh','vankhanh@tvu.edu.vn','0912345679','456 Đường DEF, Trà Vinh'),('00243',16,'Huỳnh Văn Thanh','vanthanh@tvu.edu.vn','0912345680','789 Đường GHI, Trà Vinh'),('00244',16,'Nguyễn Nhứt Lam','nhutlam@tvu.edu.vn','0912345681','101 Đường JKL, Trà Vinh'),('00245',16,'Ưeqweqweq','annb@tvu.edu.vn','0369258147','Mỹ'),('00246',16,'Nguyễn Ngọc Đan Thanh','danthanh@tvu.edu.vn','0912345682','102 Đường MNO, Trà Vinh'),('00248',16,'Hồ Hoàng Phúc Fix','duongminh@tvu.edu.vn','0258741369','Đáy biển Đen'),('00249',16,'Hà Thị Thúy Vi','Hattvi201084@tvu.edu.vn','0123654987','Trà Vinh'),('00250',16,'Võ Thanh C','vothanhc@tvu.edu.vn','0912345683','103 Đường PQR, Trà Vinh'),('00251',16,'Trịnh Quốc Việt','quocviet@tvu.edu.vn','0912345684','104 Đường STU, Trà Vinh'),('00252',16,'Trầm Hoàng Nam','hoangnam@tvu.edu.vn','0912345685','105 Đường VWX, Trà Vinh'),('00253',16,'Đoàn Phước Miền','phuocmien@tvu.edu.vn','0912345686','106 Đường YZ, Trà Vinh'),('00254',16,'Ngô Thanh Huy','huyngocntt@tvu.edu.vn','0912345687','107 Đường ABC, Trà Vinh'),('00255',16,'Phạm Thị Trúc Mai','trucmai@tvu.edu.vn','0912345688','108 Đường DEF, Trà Vinh'),('00257',16,'Nguyễn Mộng Hiền','hientvu@tvu.edu.vn','0123456987','TV'),('01027',16,'Nguyễn Khánh Duy','khanhduy@tvu.edu.vn','0912345689','109 Đường GHI, Trà Vinh'),('0123',16,'Hồ Hoàng Phúc','hohoangphucjob@gmail.com',NULL,'Sao Hỏa'),('01548',16,'Thạch Kọng SaOane','saone@tvu.edu.vn','0912345690','110 Đường JKL, Trà Vinh'),('03539',16,'Lê Minh Tự','minhtu@tvu.edu.vn','0912345691','111 Đường MNO, Trà Vinh'),('03546',16,'Phan Thị Phương Nam','phuongnam@tvu.edu.vn','0912345692','112 Đường PQR, Trà Vinh'),('03562',16,'Nguyễn Khắc Quốc','khacquoc@tvu.edu.vn','0912345693','113 Đường STU, Trà Vinh'),('11012',2,'Nguyễn Văn A','vana@tvu.edu.vn','0912345694','114 Đường VWX, Trà Vinh'),('12700',16,'Khấu Văn Nhựt','vannhut@tvu.edu.vn','0912345695','115 Đường YZ, Trà Vinh'),('12701',16,'Trần Văn Nam','vannam@tvu.edu.vn','0912345696','116 Đường ABC, Trà Vinh'),('12702',16,'Nguyễn Thừa Phát Tài','phattai@tvu.edu.vn','0912345697','117 Đường DEF, Trà Vinh'),('12705',16,'Lê Văn B','vanb@tvu.edu.vn','0912345698','118 Đường GHI, Trà Vinh'),('14204',16,'Nguyễn Bá Nhiệm','banhiem@tvu.edu.vn','0912345699','119 Đường JKL, Trà Vinh'),('99997',16,'Bảo Trưởng Khoa','baoquocone@gmail.com','0325698741','Sao Hỏa'),('99999',16,'Nguyễn Lâm Quốc Bảo','baoquoczero@gmail.com','0987654321','Sao Hỏa');
/*!40000 ALTER TABLE `giangvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giu_chuc_vu`
--

DROP TABLE IF EXISTS `giu_chuc_vu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giu_chuc_vu` (
  `MAGV` varchar(255) NOT NULL,
  `MACHUCVU` int(11) NOT NULL,
  `SOQUYETDINH` varchar(255) DEFAULT NULL,
  `TUNGAY` date DEFAULT NULL,
  PRIMARY KEY (`MAGV`,`MACHUCVU`),
  KEY `FK_GIU_CHUC_VU2` (`MACHUCVU`),
  CONSTRAINT `FK_GIU_CHUC_VU` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  CONSTRAINT `FK_GIU_CHUC_VU2` FOREIGN KEY (`MACHUCVU`) REFERENCES `chucvu` (`MACHUCVU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giu_chuc_vu`
--

LOCK TABLES `giu_chuc_vu` WRITE;
/*!40000 ALTER TABLE `giu_chuc_vu` DISABLE KEYS */;
INSERT INTO `giu_chuc_vu` VALUES ('00244',9,NULL,NULL),('00245',2,'99','2024-07-08'),('00248',8,'99','2024-07-08'),('00249',1,'99','2024-07-09'),('00254',1,'99','2024-07-09'),('00257',1,'99','2024-07-08'),('01548',8,NULL,NULL),('12705',8,NULL,NULL),('14204',8,NULL,NULL),('99997',6,'88','2024-08-09'),('99999',6,'','2024-08-13');
/*!40000 ALTER TABLE `giu_chuc_vu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhthucdanhgia`
--

DROP TABLE IF EXISTS `hinhthucdanhgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hinhthucdanhgia` (
  `MADANHGIAKETTHUC` int(11) NOT NULL,
  `TENDANHGIA` text,
  PRIMARY KEY (`MADANHGIAKETTHUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhthucdanhgia`
--

LOCK TABLES `hinhthucdanhgia` WRITE;
/*!40000 ALTER TABLE `hinhthucdanhgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `hinhthucdanhgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hockynienkhoa`
--

DROP TABLE IF EXISTS `hockynienkhoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hockynienkhoa` (
  `MAHKNK` int(11) NOT NULL,
  `TENHKNK` text,
  `NGAYBATDAUNIENKHOA` date DEFAULT NULL,
  `NGAYKETTHUCNIENKHOA` date DEFAULT NULL,
  PRIMARY KEY (`MAHKNK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hockynienkhoa`
--

LOCK TABLES `hockynienkhoa` WRITE;
/*!40000 ALTER TABLE `hockynienkhoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `hockynienkhoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MAKHOA` int(11) NOT NULL AUTO_INCREMENT,
  `TENKHOA` text,
  PRIMARY KEY (`MAKHOA`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'Khoa Công Nghệ Thông Tin'),(11,'Khoa Kỹ Thuật Công Nghệ'),(12,'Ngoài trường');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khunggiochuan`
--

DROP TABLE IF EXISTS `khunggiochuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khunggiochuan` (
  `MAKHUNG` int(11) NOT NULL AUTO_INCREMENT,
  `MACHUCDANH` int(11) NOT NULL,
  `TENKHUNGCHUAN` text,
  `GIOGIANGDAY_HANHCHINH` int(11) DEFAULT NULL,
  `GIOGIANGDAY_CHUAN` int(11) DEFAULT NULL,
  `GIONGHIENCUUKHOAHOC_HANHCHINH` int(11) DEFAULT NULL,
  `GIONGHIENCUUKHOAHOC_CHUAN` int(11) DEFAULT NULL,
  `GIOPHUCVUCONGDONG_HANHCHINH` int(11) DEFAULT NULL,
  `GIOPHUCVUCONGDONG_CHUAN` int(11) DEFAULT NULL,
  `GHICHU` text,
  PRIMARY KEY (`MAKHUNG`),
  KEY `FK_CO_KHUNG_GIO_CHUAN` (`MACHUCDANH`),
  CONSTRAINT `FK_CO_KHUNG_GIO_CHUAN` FOREIGN KEY (`MACHUCDANH`) REFERENCES `chucdanh` (`MACHUCDANH`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khunggiochuan`
--

LOCK TABLES `khunggiochuan` WRITE;
/*!40000 ALTER TABLE `khunggiochuan` DISABLE KEYS */;
INSERT INTO `khunggiochuan` VALUES (10,1,'Khung 1',630,210,855,285,275,91,NULL),(11,1,'Khung 2',810,270,720,240,230,76,NULL),(12,1,'Khung 3',990,330,585,195,185,61,NULL),(13,2,'Khung 1',630,210,765,255,365,121,NULL),(14,2,'Khung 2',810,270,630,210,320,106,NULL),(15,2,'Khung 3',990,330,495,165,275,91,NULL),(16,3,'Khung 1',630,210,675,225,455,151,NULL),(17,3,'Khung 2',810,270,540,180,410,136,NULL),(18,3,'Khung 3',990,330,405,135,365,121,NULL);
/*!40000 ALTER TABLE `khunggiochuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_danh_muc`
--

DROP TABLE IF EXISTS `loai_danh_muc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_danh_muc` (
  `MA_LOAI_DANH_MUC` int(11) NOT NULL AUTO_INCREMENT,
  `TEN_LOAI_DANH_MUC` text,
  `TRANG_THAI_DANH_MUC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MA_LOAI_DANH_MUC`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_danh_muc`
--

LOCK TABLES `loai_danh_muc` WRITE;
/*!40000 ALTER TABLE `loai_danh_muc` DISABLE KEYS */;
INSERT INTO `loai_danh_muc` VALUES (2,'Điều 17. Quy đổi sản phẩm KH&CN là các báo cáo khoa học tại các hội thảo được tính giờ chuẩn NCKH','Đang áp dụng'),(3,'Điều 18. Quy đổi sản phẩm KH&CN là các sản phẩm SHTT, bài báo khoa học đăng trên các tạp chí khoa học được tính giờ chuẩn NCKH','Đang áp dụng'),(4,'Điều 19. Quy đổi sản phẩm KH&CN là sách phục vụ đào tạo được tính giờ chuẩn NCKH','Đang áp dụng'),(5,'Điều 20. Quy đổi hoạt động viết thuyết minh các đề tài, dự án, các hoạt động KH&CN khác được tính giờ chuẩn NCKH','Đang áp dụng'),(6,'Điều 21. Quy đổi các hoạt động thực hiện đề tài, dự án các cấp được tính giờ chuẩn NCKH','Đang áp dụng'),(7,'Điều 22. Quy đổi các hoạt động thể dục thể thao, sáng tác, biểu diễn nghệ thuật đặc thù được tính giờ chuẩn NCKH','Đang áp dụng');
/*!40000 ALTER TABLE `loai_danh_muc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_tac_gia`
--

DROP TABLE IF EXISTS `loai_tac_gia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_tac_gia` (
  `MA_LOAI_TAC_GIA` int(11) NOT NULL AUTO_INCREMENT,
  `TEN_LOAI_TAC_GIA` text,
  PRIMARY KEY (`MA_LOAI_TAC_GIA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_tac_gia`
--

LOCK TABLES `loai_tac_gia` WRITE;
/*!40000 ALTER TABLE `loai_tac_gia` DISABLE KEYS */;
INSERT INTO `loai_tac_gia` VALUES (1,'Tác giả thứ nhất'),(2,'Tác giả chịu trách nhiệm'),(3,'Tác giả còn lại'),(4,'Chủ đơn'),(5,'Đồng chủ đơn'),(6,'Chủ biên'),(7,'Đồng chủ biên'),(8,'Cá nhân');
/*!40000 ALTER TABLE `loai_tac_gia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop`
--

DROP TABLE IF EXISTS `lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop` (
  `MALOP` varchar(255) NOT NULL,
  `MACHUONGTRINH` int(11) NOT NULL,
  `TENLOP` text,
  `NAMTUYENSINH` int(11) DEFAULT NULL,
  `SISO` int(11) DEFAULT NULL,
  PRIMARY KEY (`MALOP`),
  KEY `FK_HOC` (`MACHUONGTRINH`),
  CONSTRAINT `FK_HOC` FOREIGN KEY (`MACHUONGTRINH`) REFERENCES `chuongtrinhdaotao` (`MACHUONGTRINH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop`
--

LOCK TABLES `lop` WRITE;
/*!40000 ALTER TABLE `lop` DISABLE KEYS */;
/*!40000 ALTER TABLE `lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhoc` (
  `MAMONHOC` int(11) NOT NULL AUTO_INCREMENT,
  `TENMONHOC` text,
  `SOTINCHILYTHUYET` int(11) DEFAULT NULL,
  `SOTINCHITHUCHANH` int(11) DEFAULT NULL,
  PRIMARY KEY (`MAMONHOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `namhoc`
--

DROP TABLE IF EXISTS `namhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `namhoc` (
  `MANAMHOC` int(11) NOT NULL AUTO_INCREMENT,
  `TENNAMHOC` text,
  PRIMARY KEY (`MANAMHOC`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `namhoc`
--

LOCK TABLES `namhoc` WRITE;
/*!40000 ALTER TABLE `namhoc` DISABLE KEYS */;
INSERT INTO `namhoc` VALUES (5,'Năm học 2020-2021'),(6,'Năm học 2021-2022'),(7,'Năm học 2022-2023'),(8,'Năm học 2023-2024');
/*!40000 ALTER TABLE `namhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quy_dinh`
--

DROP TABLE IF EXISTS `quy_dinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quy_dinh` (
  `MA_QUY_DINH` int(11) NOT NULL AUTO_INCREMENT,
  `TEN_QUY_DINH` text,
  `TRANG_THAI_QUY_DINH` text,
  PRIMARY KEY (`MA_QUY_DINH`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quy_dinh`
--

LOCK TABLES `quy_dinh` WRITE;
/*!40000 ALTER TABLE `quy_dinh` DISABLE KEYS */;
INSERT INTO `quy_dinh` VALUES (1,'Tỷ lệ quy đổi giữa các tác giả đối với bài tham luận (báo cáo khoa học) và bài báo khoa học','Đang áp dụng');
/*!40000 ALTER TABLE `quy_dinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `TENDANGNHAP` varchar(255) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `MATKHAU` text,
  `PHANQUYEN` text,
  `TRANGTHAITAIKHOAN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TENDANGNHAP`),
  KEY `FK_TAI_KHOAN_CUA_GIANG_VIEN` (`MAGV`),
  CONSTRAINT `FK_TAI_KHOAN_CUA_GIANG_VIEN` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES ('annb@tvu.edu.vn','00245',NULL,'Trưởng Khoa','Đang hoạt động'),('baoquocone@gmail.com','99997',NULL,'Trưởng Khoa','Đang hoạt động'),('baoquoczero@gmail.com','99999',NULL,'Admin','Đang hoạt động'),('diemhanh_tvu@tvu.edu.vn','12705',NULL,'Giảng Viên','Đang hoạt động'),('duongminh@tvu.edu.vn','00248',NULL,'Trưởng Bộ Môn','Đang hoạt động'),('Hattvi201084@tvu.edu.vn','00249',NULL,'Trưởng Khoa','Đang hoạt động'),('hientvu@tvu.edu.vn','00257',NULL,'Admin','Đang hoạt động'),('hohoangphucjob@gmail.com','0123',NULL,NULL,'Đang hoạt động'),('huyngocntt@tvu.edu.vn','00254',NULL,'Admin','Đang hoạt động'),('hvthanh@tvu.edu.vn','00243',NULL,'Giảng Viên','Đang hoạt động'),('lamnn@tvu.edu.vn','00244',NULL,'Giảng Viên','Đang hoạt động'),('lmtu@tvu.edu.vn','03539',NULL,'Giảng Viên','Đang hoạt động'),('namtv@tvu.edu.vn','12701',NULL,'Giảng Viên','Đang hoạt động'),('ngocdanthanhdt@tvu.edu.vn','00246',NULL,'Giảng Viên','Đang hoạt động'),('nhiemnb@tvu.edu.vn','14204',NULL,'Giảng Viên','Đang hoạt động'),('nhutkhau@tvu.edu.vn','12700',NULL,'Giảng Viên','Đang hoạt động'),('nkduy@tvu.edu.vn','01027',NULL,'Giảng Viên','Đang hoạt động'),('nkquoc@tvu.edu.vn','03562',NULL,'Giảng Viên','Đang hoạt động'),('oane@tvu.edu.vn','01548',NULL,'Giảng Viên','Đang hoạt động'),('phattai@tvu.edu.vn','12702',NULL,'Giảng Viên','Đang hoạt động'),('phuocmien@tvu.edu.vn','00253',NULL,'Giảng Viên','Đang hoạt động'),('ptpnam@tvu.edu.vn','03546',NULL,'Giảng Viên','Đang hoạt động'),('pttmai@tvu.edu.vn','00255',NULL,'Giảng Viên','Đang hoạt động'),('thiennhd@tvu.edu.vn','00241',NULL,'Giảng Viên','Đang hoạt động'),('tqviettv@tvu.edu.vn','00251',NULL,'Giảng Viên','Đang hoạt động'),('tramhoangnam@tvu.edu.vn','00252',NULL,'Giảng Viên','Đang hoạt động'),('vankhanh@tvu.edu.vn','00242',NULL,'Giảng Viên','Đang hoạt động'),('vothanhc@tvu.edu.vn','00250',NULL,'Giảng Viên','Đang hoạt động');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoigian_xacnhan`
--

DROP TABLE IF EXISTS `thoigian_xacnhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thoigian_xacnhan` (
  `MA_THOIGIAN_XACNHAN` int(11) NOT NULL AUTO_INCREMENT,
  `THOIGIANBATDAU` datetime DEFAULT NULL,
  `THOIGIANKETTHUC` datetime DEFAULT NULL,
  `TEN_KHOA` text,
  `GHICHU` text,
  PRIMARY KEY (`MA_THOIGIAN_XACNHAN`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoigian_xacnhan`
--

LOCK TABLES `thoigian_xacnhan` WRITE;
/*!40000 ALTER TABLE `thoigian_xacnhan` DISABLE KEYS */;
INSERT INTO `thoigian_xacnhan` VALUES (9,'2024-08-06 20:29:00','2030-12-01 20:29:00','Khoa Kỹ Thuật Công Nghệ','CHONKHUNG'),(20,'2024-08-01 21:21:00','2024-08-31 21:21:00','Khoa Công Nghệ Thông Tin','NGHIENCUU'),(21,'2024-08-01 21:21:00','2024-08-31 21:21:00','Khoa Kỹ Thuật Công Nghệ','NGHIENCUU'),(22,'2024-08-06 20:29:00','2030-12-01 20:29:00','Khoa Công Nghệ Thông Tin','CHONKHUNG');
/*!40000 ALTER TABLE `thoigian_xacnhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoc`
--

DROP TABLE IF EXISTS `thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoc` (
  `MACHUONGTRINH` int(11) NOT NULL,
  `MAMONHOC` int(11) NOT NULL,
  `SOTHUTUHOCKI` int(11) DEFAULT NULL,
  PRIMARY KEY (`MACHUONGTRINH`,`MAMONHOC`),
  KEY `FK_THUOC2` (`MAMONHOC`),
  CONSTRAINT `FK_THUOC` FOREIGN KEY (`MACHUONGTRINH`) REFERENCES `chuongtrinhdaotao` (`MACHUONGTRINH`),
  CONSTRAINT `FK_THUOC2` FOREIGN KEY (`MAMONHOC`) REFERENCES `monhoc` (`MAMONHOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_le_quy_doi_gio_chuan`
--

DROP TABLE IF EXISTS `ty_le_quy_doi_gio_chuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ty_le_quy_doi_gio_chuan` (
  `MA_QUY_DOI` int(11) NOT NULL AUTO_INCREMENT,
  `MA_QUY_DINH` int(11) NOT NULL,
  `TEN_QUY_DOI` text,
  `TY_LE` float DEFAULT NULL,
  `VIEN_CHUC_TRUONG` varchar(50) DEFAULT NULL,
  `THUC_HIEN_CHUAN` varchar(50) DEFAULT NULL,
  `TRANG_THAI_QUY_DOI` text,
  `GHI_CHU_QUY_DOI` text,
  PRIMARY KEY (`MA_QUY_DOI`),
  KEY `FK_DUOC_QUY_DINH` (`MA_QUY_DINH`),
  CONSTRAINT `FK_DUOC_QUY_DINH` FOREIGN KEY (`MA_QUY_DINH`) REFERENCES `quy_dinh` (`MA_QUY_DINH`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_le_quy_doi_gio_chuan`
--

LOCK TABLES `ty_le_quy_doi_gio_chuan` WRITE;
/*!40000 ALTER TABLE `ty_le_quy_doi_gio_chuan` DISABLE KEYS */;
INSERT INTO `ty_le_quy_doi_gio_chuan` VALUES (8,1,'16.2.b.Tác giả thứ nhất (bài có nhiều tác giả) là viên chức Trường ĐHTV: 50% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18, trường hợp đồng tác giả thứ nhất thì chia đều 50% cho đồng tác giả thứ nhất; 50% còn lại được chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có); tác giả độc lập hưởng 50% như tác giả thứ nhất;',0.5,'Có','Có','Đang áp dụng','Chia đều cho các Tác giả thứ nhất'),(9,1,'16.2.b.Tác giả thứ nhất (bài có nhiều tác giả) là viên chức Trường ĐHTV: 50% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18, trường hợp đồng tác giả thứ nhất thì chia đều 50% cho đồng tác giả thứ nhất; 50% còn lại được chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có); tác giả độc lập hưởng 50% như tác giả thứ nhất;',0.5,'Có','Có','Đang áp dụng','Chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có). Trừ tác giả thứ nhất'),(10,1,'16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);',0,'Không','Có','Đang áp dụng','Tác giả thứ nhất không thuộc trường'),(11,1,'16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);',0.5,'Có','Có','Đang áp dụng','Chia cho 2 tác giả chịu trách nhiệm, chia đều'),(12,1,'16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);',0.3,'Có','Có','Đang áp dụng','Chia cho 1  tác giả chịu trách nhiệm'),(13,1,'16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);',0.5,'Có','Có','Đang áp dụng','Các đồng tác giả còn lại (trừ tác giả chịu trách nhiệm) được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất ngoài trường);'),(14,1,'16.2.dTrường hợp tác giả thứ nhất là viên chức của Trường ĐHTV nhưng không phải thực hiện chuẩn thì các tác giả còn lại hưởng 50% chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Tác giả thứ nhất được thưởng giờ dư theo quy định.',0,'Có','Không','Đang áp dụng','Tác giả thứ nhất không thực hiện chuẩn'),(15,1,'16.2.dTrường hợp tác giả thứ nhất là viên chức của Trường ĐHTV nhưng không phải thực hiện chuẩn thì các tác giả còn lại hưởng 50% chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Tác giả thứ nhất được thưởng giờ dư theo quy định.',0.5,'Có','Có','Đang áp dụng','Chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Trừ tác giả thứ nhất');
/*!40000 ALTER TABLE `ty_le_quy_doi_gio_chuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'nghiencuukhoahoc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15 19:49:43
