-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2024-03-06 09:42:07
-- 伺服器版本： 8.2.0
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `jp`
--

-- --------------------------------------------------------

--
-- 資料表結構 `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `attendanceid` int NOT NULL AUTO_INCREMENT,
  `attendanceno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班別編號',
  `attendancename` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班別名稱',
  `week` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '星期(一~日)',
  `classno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classname` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ontime` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上班時間',
  `offtime` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下班時間',
  `addontime` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加班上班時間',
  `addofftime` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加班下班時間',
  `latetime` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '遲到起計時間',
  `resttime1` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第一次休息起',
  `resttime2` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第一次休息迄',
  `resttime3` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第二次休息起',
  `resttime4` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第二次休息迄',
  `worktime` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出勤分鐘數',
  `mealtime` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '誤餐時間',
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '設定出勤日(工作日、休息日、例假日)',
  PRIMARY KEY (`attendanceid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `attendance`
--

INSERT INTO `attendance` (`attendanceid`, `attendanceno`, `attendancename`, `week`, `classno`, `classname`, `ontime`, `offtime`, `addontime`, `addofftime`, `latetime`, `resttime1`, `resttime2`, `resttime3`, `resttime4`, `worktime`, `mealtime`, `type`) VALUES
(1, 'A', 'A1', '一', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(2, 'A', 'A1', '二', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(3, 'A', 'A1', '三', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(4, 'A', 'A1', '四', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(5, 'A', 'A1', '五', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(6, 'A', 'A1', '六', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(7, 'A', 'A1', '日', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(8, 'B', 'B1', '一', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(9, 'B', 'B1', '二', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(10, 'B', 'B1', '三', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(11, 'B', 'B1', '四', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(12, 'B', 'B1', '五', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(13, 'B', 'B1', '六', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '例假日'),
(14, 'B', 'B1', '日', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '休息日'),
(15, 'G', 'G1', '一', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(16, 'G', 'G1', '二', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(17, 'G', 'G1', '三', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(18, 'G', 'G1', '四', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(19, 'G', 'G1', '五', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(20, 'G', 'G1', '六', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '例假日'),
(21, 'G', 'G1', '日', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '休息日'),
(22, 'D', 'D1', '一', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(23, 'D', 'D1', '二', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(24, 'D', 'D1', '三', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(25, 'D', 'D1', '四', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(26, 'D', 'D1', '五', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '工作日'),
(27, 'D', 'D1', '六', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '例假日'),
(28, 'D', 'D1', '日', NULL, NULL, '0830', '1800', '1801', '1801', '0831', '1200', '1330', '1200', '1330', '480', '1200', '休息日');

-- --------------------------------------------------------

--
-- 資料表結構 `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `bankno` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '銀行編號',
  `bankname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '銀行名稱',
  PRIMARY KEY (`bankno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `bank`
--

INSERT INTO `bank` (`bankno`, `bankname`) VALUES
('822', '中國信託商業銀行'),
('000', '中央信託局'),
('001', '中央信託局'),
('003', '交通銀行'),
('004', '臺灣銀行'),
('005', '土地銀行'),
('006', '合作金庫'),
('007', '第一商業銀行'),
('008', '華南商業銀行'),
('009', '彰化商業銀行'),
('011', '上海商業儲蓄銀行'),
('012', '台北富邦銀行'),
('013', '國泰世華商業銀行'),
('015', '中國輸出入銀行'),
('016', '高雄銀行'),
('017', '兆豐國際商業銀行'),
('021', '花旗銀行'),
('040', '中華開發工業銀行'),
('048', '臺灣工業銀行'),
('050', '臺灣中小企業銀行'),
('052', '渣打國際商業銀行'),
('053', '台中商業銀行'),
('054', '京城商業銀行'),
('081', '匯豐銀行'),
('101', '大台北銀行'),
('102', '華泰商業銀行'),
('103', '新光商業銀行'),
('108', '陽信商業銀行'),
('118', '板信商業銀行'),
('147', '三信商業銀行'),
('700', '中華郵政'),
('803', '聯邦商業銀行'),
('805', '遠東國際商業銀行'),
('806', '元大商業銀行'),
('807', '永豐商業銀行'),
('808', '玉山商業銀行'),
('809', '萬華商業銀行'),
('810', '寶華商業銀行'),
('812', '台新國際商業銀行'),
('814', '大眾商業銀行'),
('815', '日盛國際商業銀行'),
('816', '安泰商業銀行');

-- --------------------------------------------------------

--
-- 資料表結構 `comp`
--

DROP TABLE IF EXISTS `comp`;
CREATE TABLE IF NOT EXISTS `comp` (
  `cono` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公司編號',
  `coname1` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司簡號',
  `coname2` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名稱',
  `coper` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '負 責 人',
  `couno` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '統一編號',
  `cotel1` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電    話',
  `cofax1` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '傳    真',
  `coaddr1` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地    址',
  `cowww` char(68) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '網路地址',
  `coemail` char(68) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電子信箱',
  `comemo1` char(68) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備    註',
  `xa1no` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xa1name` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copaths` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copatha` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copathc` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk11` decimal(1,0) DEFAULT NULL,
  `colnk11no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk12` decimal(1,0) DEFAULT NULL,
  `colnk12no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk13` decimal(1,0) DEFAULT NULL,
  `colnk13no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk14` decimal(1,0) DEFAULT NULL,
  `colnk14no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk15` decimal(1,0) DEFAULT NULL,
  `colnk15no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk16` decimal(1,0) DEFAULT NULL,
  `colnk16no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk17` decimal(1,0) DEFAULT NULL,
  `colnk17no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk18` decimal(1,0) DEFAULT NULL,
  `colnk18no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk19` decimal(1,0) DEFAULT NULL,
  `colnk19no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk1a` decimal(1,0) DEFAULT NULL,
  `colnk1ano` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk21` decimal(1,0) DEFAULT NULL,
  `colnk21no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk22` decimal(1,0) DEFAULT NULL,
  `colnk22no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk23` decimal(1,0) DEFAULT NULL,
  `colnk23no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk24` decimal(1,0) DEFAULT NULL,
  `colnk24no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk25` decimal(1,0) DEFAULT NULL,
  `colnk25no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk26` decimal(1,0) DEFAULT NULL,
  `colnk26no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk27` decimal(1,0) DEFAULT NULL,
  `colnk27no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk28` decimal(1,0) DEFAULT NULL,
  `colnk28no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colnk29` decimal(1,0) DEFAULT NULL,
  `colnk29no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `laobaono` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '勞保投保代號',
  `jianbaono` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '健保投保代號',
  PRIMARY KEY (`cono`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `comp`
--

INSERT INTO `comp` (`cono`, `coname1`, `coname2`, `coper`, `couno`, `cotel1`, `cofax1`, `coaddr1`, `cowww`, `coemail`, `comemo1`, `xa1no`, `xa1name`, `copaths`, `copatha`, `copathc`, `colnk11`, `colnk11no`, `colnk12`, `colnk12no`, `colnk13`, `colnk13no`, `colnk14`, `colnk14no`, `colnk15`, `colnk15no`, `colnk16`, `colnk16no`, `colnk17`, `colnk17no`, `colnk18`, `colnk18no`, `colnk19`, `colnk19no`, `colnk1a`, `colnk1ano`, `colnk21`, `colnk21no`, `colnk22`, `colnk22no`, `colnk23`, `colnk23no`, `colnk24`, `colnk24no`, `colnk25`, `colnk25no`, `colnk26`, `colnk26no`, `colnk27`, `colnk27no`, `colnk28`, `colnk28no`, `colnk29`, `colnk29no`, `laobaono`, `jianbaono`) VALUES
('01', '庫點子', '庫點子文創資訊產業有限公司', '廖石龍', '04235868', '0423586802', '0423586807', '407台中市西屯區中工二路120號', NULL, 'bmidp888@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1234', '1234');

-- --------------------------------------------------------

--
-- 資料表結構 `deduction`
--

DROP TABLE IF EXISTS `deduction`;
CREATE TABLE IF NOT EXISTS `deduction` (
  `deductionno` varchar(10) NOT NULL COMMENT '加扣款編號',
  `deductionname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加扣款名稱',
  `dedtype` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加(減)項',
  `dedmny` decimal(19,4) DEFAULT NULL COMMENT '加扣款金額',
  PRIMARY KEY (`deductionno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `deduction`
--

INSERT INTO `deduction` (`deductionno`, `deductionname`, `dedtype`, `dedmny`) VALUES
('12', 'test3', NULL, 1231.1234);

-- --------------------------------------------------------

--
-- 資料表結構 `education`
--

DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `educationno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '學歷編號',
  `educationname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '學歷名稱',
  PRIMARY KEY (`educationno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `education`
--

INSERT INTO `education` (`educationno`, `educationname`) VALUES
('07', '博士'),
('01', '小學'),
('02', '國中'),
('03', '高中'),
('04', '二專'),
('05', '大學'),
('06', '碩士');

-- --------------------------------------------------------

--
-- 資料表結構 `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `employid` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employname` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appno` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appname` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partno` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partname` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EngName` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marry` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `born` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '等同add',
  `tel` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bornday` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bornday2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workday` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workday2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expireday` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expireday2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mphone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add1` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add2` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactrelation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacttel1` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacttel2` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactadd` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PresentType` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PresentName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildday` int DEFAULT NULL,
  `buildday2` int DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `family`
--

DROP TABLE IF EXISTS `family`;
CREATE TABLE IF NOT EXISTS `family` (
  `relationno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `relationship` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`relationno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `family`
--

INSERT INTO `family` (`relationno`, `relationship`) VALUES
('9', '外曾祖父母'),
('1', '配偶'),
('2', '父母'),
('3', '子女'),
('4', '祖父母'),
('5', '孫子女'),
('6', '外祖父母'),
('7', '外孫子女'),
('8', '曾祖父母');

-- --------------------------------------------------------

--
-- 資料表結構 `holidays`
--

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE IF NOT EXISTS `holidays` (
  `holidayid` int NOT NULL AUTO_INCREMENT,
  `holiday` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期',
  `holidayName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期名稱',
  `niandu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年度',
  `attendanceno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班別',
  `AttendDay` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期型態(國定日、休息日等)',
  PRIMARY KEY (`holidayid`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `holidays`
--

INSERT INTO `holidays` (`holidayid`, `holiday`, `holidayName`, `niandu`, `attendanceno`, `AttendDay`) VALUES
(77, '0228', '和平紀念日', '113', NULL, '國定日'),
(78, '0404', '兒童節及民族掃墓節', '113', NULL, '國定日'),
(76, '0217', '補行上班', '113', NULL, '工作日'),
(75, '0214', '補假', '113', NULL, '國定日'),
(74, '0213', '補假', '113', NULL, '國定日'),
(73, '0212', '春節', '113', NULL, '國定日'),
(72, '0211', '春節', '113', NULL, '國定日'),
(71, '0210', '春節', '113', NULL, '國定日'),
(70, '0209', '農曆除夕', '113', NULL, '國定日'),
(69, '0208', '小年夜', '113', NULL, '國定日'),
(68, '0101', '開國紀念日', '113', NULL, '國定日'),
(98, '0228', '和平紀念日', '112', NULL, '國定日'),
(97, '0227', '調整放假', '112', NULL, '國定日'),
(96, '0218', '補行上班', '112', NULL, '工作日'),
(95, '0204', '補行上班', '112', NULL, '工作日'),
(94, '0127', '調整放假', '112', NULL, '國定日'),
(93, '0126', '補假', '112', NULL, '國定日'),
(92, '0125', '補假', '112', NULL, '國定日'),
(91, '0124', '春節', '112', NULL, '國定日'),
(90, '0123', '春節', '112', NULL, '國定日'),
(89, '0122', '春節', '112', NULL, '國定日'),
(88, '0121', '農曆除夕', '112', NULL, '國定日'),
(87, '0120', '小年夜', '112', NULL, '國定日'),
(86, '0107', '補行上班', '112', NULL, '工作日'),
(85, '0102', '補假', '112', NULL, '國定日'),
(84, '0101', '開國紀念日', '112', NULL, '國定日'),
(53, '0101', '開國紀念日', '111', NULL, '國定日'),
(54, '0122', '補行上班', '111', NULL, '工作日'),
(55, '0131', '農曆除夕', '111', NULL, '國定日'),
(56, '0201', '春節', '111', NULL, '國定日'),
(57, '0202', '春節', '111', NULL, '國定日'),
(58, '0203', '春節', '111', NULL, '國定日'),
(59, '0204', '調整放假', '111', NULL, '國定日'),
(60, '0228', '和平紀念日', '111', NULL, '國定日'),
(61, '0404', '兒童節', '111', NULL, '國定日'),
(62, '0405', '民族掃墓節', '111', NULL, '國定日'),
(63, '0603', '端午節', '111', NULL, '國定日'),
(64, '0909', '補假', '111', NULL, '國定日'),
(65, '0910', '中秋節', '111', NULL, '國定日'),
(66, '1010', '國慶日', '111', NULL, '國定日'),
(67, '0501', '勞動節', '111', NULL, '國定日'),
(79, '0405', '補假', '113', NULL, '國定日'),
(80, '0610', '端午節', '113', NULL, '國定日'),
(81, '0917', '中秋節', '113', NULL, '國定日'),
(82, '1010', '國慶日', '113', NULL, '國定日'),
(83, '0501', '勞動節', '113', NULL, '國定日'),
(99, '0325', '補行上班', '112', NULL, '工作日'),
(100, '0403', '調整放假', '112', NULL, '國定日'),
(101, '0404', '兒童節', '112', NULL, '國定日'),
(102, '0405', '民族掃墓節', '112', NULL, '國定日'),
(103, '0617', '補行上班', '112', NULL, '工作日'),
(104, '0622', '端午節', '112', NULL, '國定日'),
(105, '0623', '調整放假', '112', NULL, '國定日'),
(106, '0923', '補行上班', '112', NULL, '工作日'),
(107, '0929', '中秋節', '112', NULL, '國定日'),
(108, '1009', '調整放假', '112', NULL, '國定日'),
(109, '1010', '國慶日', '112', NULL, '國定日'),
(110, '0501', '勞動節', '112', NULL, '國定日');

-- --------------------------------------------------------

--
-- 資料表結構 `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `appno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `appname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '職稱',
  PRIMARY KEY (`appno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `jobs`
--

INSERT INTO `jobs` (`appno`, `appname`) VALUES
('BE', '後端工程師');

-- --------------------------------------------------------

--
-- 資料表結構 `mod_recaptcha`
--

DROP TABLE IF EXISTS `mod_recaptcha`;
CREATE TABLE IF NOT EXISTS `mod_recaptcha` (
  `Admin_ID` int NOT NULL COMMENT '管理者',
  `Recaptcha_JS_url` varchar(80) DEFAULT NULL COMMENT 'JS引用路徑',
  `Recaptcha_API_url` varchar(80) DEFAULT NULL COMMENT 'API路徑',
  `Recaptcha_SiteKey` varchar(40) DEFAULT NULL COMMENT '公鑰',
  `Recaptcha_SecretKey` varchar(40) DEFAULT NULL COMMENT '私鑰',
  PRIMARY KEY (`Admin_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='驗證碼資料表';

--
-- 傾印資料表的資料 `mod_recaptcha`
--

INSERT INTO `mod_recaptcha` (`Admin_ID`, `Recaptcha_JS_url`, `Recaptcha_API_url`, `Recaptcha_SiteKey`, `Recaptcha_SecretKey`) VALUES
(2, 'https://www.google.com/recaptcha/api.js?render=', 'https://www.google.com/recaptcha/api/siteverify', '6LdR6OoZAAAAAACvFK7gm5n04k9tSmhlxnwjQqbV', '6LdR6OoZAAAAALzpwdNsH8_3-QJV79QMPldqRo9f');

-- --------------------------------------------------------

--
-- 資料表結構 `part`
--

DROP TABLE IF EXISTS `part`;
CREATE TABLE IF NOT EXISTS `part` (
  `partno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部門編號',
  `partname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部門名稱',
  PRIMARY KEY (`partno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `part`
--

INSERT INTO `part` (`partno`, `partname`) VALUES
('WD', '網設部');

-- --------------------------------------------------------

--
-- 資料表結構 `purchaser1`
--

DROP TABLE IF EXISTS `purchaser1`;
CREATE TABLE IF NOT EXISTS `purchaser1` (
  `pid` int NOT NULL AUTO_INCREMENT COMMENT 'IDENTITY(1,1)',
  `purchaserno` int DEFAULT NULL COMMENT '等級',
  `purchasermny` decimal(19,4) DEFAULT NULL COMMENT '投保金額',
  `purchaserhmny` decimal(19,4) DEFAULT NULL COMMENT '健保費',
  `employerPurchaserhmny` decimal(19,4) DEFAULT NULL COMMENT '雇主負擔金額',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `purchaser1`
--

INSERT INTO `purchaser1` (`pid`, `purchaserno`, `purchasermny`, `purchaserhmny`, `employerPurchaserhmny`) VALUES
(5, 1, 4.0000, 4.0000, NULL),
(6, 2, 23.0000, 32.0000, NULL),
(7, 3, 44.0000, 55.0000, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `reason`
--

DROP TABLE IF EXISTS `reason`;
CREATE TABLE IF NOT EXISTS `reason` (
  `reasonno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reasonno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `reason`
--

INSERT INTO `reason` (`reasonno`, `reason`) VALUES
('U', '喪失健保資格'),
('M', '死亡'),
('B', '眷屬轉換單位'),
('C', '其他'),
('E', '失蹤'),
('I', '受刑'),
('R', '堃');

-- --------------------------------------------------------

--
-- 資料表結構 `seclab1`
--

DROP TABLE IF EXISTS `seclab1`;
CREATE TABLE IF NOT EXISTS `seclab1` (
  `sid` int NOT NULL AUTO_INCREMENT COMMENT 'IDENTITY(1,1)',
  `seclabNo` int DEFAULT NULL COMMENT '等級',
  `seclabMny` decimal(19,4) DEFAULT '0.0000' COMMENT '投保金額',
  `seclablMny` decimal(19,4) DEFAULT '0.0000' COMMENT '本國勞保費(個人)',
  `ForeignMny` decimal(19,4) DEFAULT '0.0000' COMMENT '外勞勞保費',
  `employerSeclablMny` decimal(19,4) DEFAULT '0.0000' COMMENT '本國雇主負擔',
  `employerForeignMny` decimal(19,4) DEFAULT '0.0000' COMMENT '外勞雇主負擔',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `seclab1`
--

INSERT INTO `seclab1` (`sid`, `seclabNo`, `seclabMny`, `seclablMny`, `ForeignMny`, `employerSeclablMny`, `employerForeignMny`) VALUES
(28, 1, 2.0000, 2.0000, 2.0000, 0.0000, 0.0000),
(29, 2, 3.0000, 3.0000, 3.0000, 0.0000, 0.0000),
(30, 3, 7.0000, 7.0000, 7.0000, 0.0000, 0.0000),
(31, 4, 8.0000, 8.0000, 8.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- 資料表結構 `sys_admin`
--

DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE IF NOT EXISTS `sys_admin` (
  `Admin_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Admin_Acc` varchar(20) NOT NULL COMMENT '管理者帳號',
  `Admin_Pwd` varchar(32) NOT NULL COMMENT '管理者密碼',
  `Admin_Name` varchar(20) DEFAULT NULL COMMENT '管理者名稱',
  `Admin_Depart` varchar(12) DEFAULT NULL COMMENT '部門',
  `Admin_Permissions` tinyint UNSIGNED DEFAULT '0' COMMENT '管理者權限',
  `Group_ID` tinyint UNSIGNED DEFAULT NULL COMMENT '管理者群組',
  `Depart_ID` varchar(11) DEFAULT NULL COMMENT '部門',
  `Tables_ID` int UNSIGNED DEFAULT NULL COMMENT '管理者資料庫',
  `Admin_Code` varchar(32) DEFAULT NULL COMMENT '登入碼',
  `Admin_Sdate` datetime DEFAULT '1911-00-00 00:00:00' COMMENT '建立時間',
  `Admin_LastLogin` datetime DEFAULT NULL COMMENT '最後登入日期',
  `Admin_IP` varchar(20) DEFAULT NULL COMMENT '登入IP',
  `Admin_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  `Admin_Checkbox` tinyint UNSIGNED DEFAULT '0' COMMENT '切換資料庫啟用',
  PRIMARY KEY (`Admin_ID`),
  UNIQUE KEY `Admin_Acc` (`Admin_Acc`),
  KEY `Admin_Code` (`Admin_Code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='系統管理員表';

--
-- 傾印資料表的資料 `sys_admin`
--

INSERT INTO `sys_admin` (`Admin_ID`, `Admin_Acc`, `Admin_Pwd`, `Admin_Name`, `Admin_Depart`, `Admin_Permissions`, `Group_ID`, `Depart_ID`, `Tables_ID`, `Admin_Code`, `Admin_Sdate`, `Admin_LastLogin`, `Admin_IP`, `Admin_Open`, `Admin_Checkbox`) VALUES
(1, 'bm', '4e90bf5c6e89b179005004f6ef56fda1', '系統管理員', NULL, 255, 1, NULL, 0, '5de5d0007c762a77a203093e0803b2b7', '2019-08-12 21:27:51', '2024-03-05 08:47:21', '61.218.134.131', 1, 1),
(2, 'xingcloud', '3fe9acc5277ea28c3db57e4b71024ed2', '一般管理員', NULL, 0, 2, NULL, 0, 'a85fefb06a0317e2bb04b88aba7185aa', '2019-08-12 21:27:51', '2023-09-12 20:10:15', '27.105.64.246', 1, 0),
(7, 'a810724@yahoo.com.tw', '3fe9acc5277ea28c3db57e4b71024ed2', '美編', NULL, 0, 6, NULL, NULL, '4c5baab89b82dd19dd7fed876e7dceb9', '2021-01-22 15:35:43', '2023-09-13 07:12:30', '27.105.64.246', 1, 0),
(8, 'qq500124qq@yahoo.com', '3fe9acc5277ea28c3db57e4b71024ed2', '複製人員', NULL, 0, 6, NULL, NULL, NULL, '2021-01-22 15:38:33', NULL, NULL, 1, 0),
(9, 'm84m05m15m@yahoo.com', '3fe9acc5277ea28c3db57e4b71024ed2', '工作人員', NULL, 0, 6, NULL, NULL, 'df1c062c26144eebff683cf45d7c0e14', '2021-01-22 15:40:52', '2023-03-17 10:41:18', '61.62.164.134', 1, 0),
(10, 'admin', 'eb51d166b0a11d5cd1403907047dafee', '華越員工', NULL, 0, 2, NULL, 0, 'ad9c118c1a09468d259135c84018bfb1', '2021-03-15 14:01:41', '2021-03-15 14:03:28', '61.218.134.131', 1, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `sys_download`
--

DROP TABLE IF EXISTS `sys_download`;
CREATE TABLE IF NOT EXISTS `sys_download` (
  `DL_Session` varchar(32) NOT NULL COMMENT '下載碼',
  `DL_DownLoadInfo` varchar(100) DEFAULT NULL COMMENT '下載資訊',
  `DL_DownLoadPath` varchar(100) DEFAULT NULL COMMENT '檔案路徑',
  `DL_DownLoadUrl` varchar(100) DEFAULT NULL COMMENT '下載位址',
  PRIMARY KEY (`DL_Session`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='下載資料表';

-- --------------------------------------------------------

--
-- 資料表結構 `sys_group`
--

DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE IF NOT EXISTS `sys_group` (
  `Group_ID` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '群組ID',
  `Group_Name` varchar(30) DEFAULT NULL COMMENT '群組名稱',
  `Group_Lv` tinyint UNSIGNED DEFAULT '1' COMMENT '群組級別',
  `Group_MenuUse` text COMMENT '群組目錄權限',
  PRIMARY KEY (`Group_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='系統群組表';

--
-- 傾印資料表的資料 `sys_group`
--

INSERT INTO `sys_group` (`Group_ID`, `Group_Name`, `Group_Lv`, `Group_MenuUse`) VALUES
(1, '系統管理員', 0, 'a:123:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";i:8;s:1:\"0\";i:9;s:1:\"0\";i:10;s:1:\"0\";i:11;s:1:\"0\";i:12;s:1:\"0\";i:13;s:1:\"0\";i:14;s:1:\"0\";i:15;s:1:\"0\";i:16;s:1:\"0\";i:17;s:1:\"0\";i:18;s:1:\"0\";i:19;s:1:\"0\";i:20;s:1:\"0\";i:21;s:1:\"0\";i:22;s:1:\"0\";i:23;s:1:\"0\";i:24;s:1:\"0\";i:25;s:1:\"0\";i:26;s:1:\"0\";i:27;s:1:\"0\";i:28;s:1:\"0\";i:29;s:1:\"0\";i:30;s:1:\"0\";i:31;s:1:\"0\";i:32;s:1:\"0\";i:33;s:1:\"0\";i:34;s:1:\"0\";i:35;s:1:\"0\";i:36;s:1:\"0\";i:37;s:1:\"0\";i:38;s:1:\"0\";i:39;s:1:\"0\";i:40;s:1:\"0\";i:41;s:1:\"0\";i:42;s:1:\"0\";i:43;s:1:\"0\";i:44;s:1:\"0\";i:45;s:1:\"0\";i:46;s:1:\"0\";i:47;s:1:\"0\";i:48;s:1:\"0\";i:49;s:1:\"0\";i:50;s:1:\"0\";i:51;s:1:\"0\";i:52;s:1:\"0\";i:53;s:1:\"0\";i:54;s:1:\"0\";i:55;s:1:\"0\";i:56;s:1:\"0\";i:57;s:1:\"0\";i:58;s:1:\"0\";i:59;s:1:\"0\";i:60;s:1:\"0\";i:61;s:1:\"0\";i:62;s:1:\"0\";i:63;s:1:\"0\";i:64;s:1:\"0\";i:65;s:1:\"0\";i:66;s:1:\"0\";i:67;s:1:\"0\";i:68;s:1:\"0\";i:69;s:1:\"0\";i:70;s:1:\"0\";i:71;s:1:\"0\";i:72;s:1:\"0\";i:73;s:1:\"0\";i:74;s:1:\"0\";i:75;s:1:\"0\";i:76;s:1:\"0\";i:77;s:1:\"0\";i:78;s:1:\"0\";i:79;s:1:\"0\";i:80;s:1:\"0\";i:81;s:1:\"0\";i:82;s:1:\"0\";i:83;s:1:\"0\";i:84;s:1:\"0\";i:85;s:1:\"0\";i:86;s:1:\"0\";i:87;s:1:\"0\";i:88;s:1:\"0\";i:89;s:1:\"0\";i:90;s:1:\"0\";i:91;s:1:\"0\";i:92;s:1:\"0\";i:93;s:1:\"0\";i:94;s:1:\"0\";i:95;s:1:\"0\";i:96;s:1:\"0\";i:97;s:1:\"0\";i:98;s:1:\"0\";i:99;s:1:\"0\";i:100;s:1:\"0\";i:101;s:1:\"0\";i:102;s:1:\"0\";i:103;s:1:\"0\";i:104;s:1:\"0\";i:105;s:1:\"0\";i:106;s:1:\"0\";i:107;s:1:\"0\";i:108;s:1:\"0\";i:109;s:1:\"0\";i:110;s:1:\"0\";i:111;s:1:\"0\";i:112;s:1:\"0\";i:113;s:1:\"0\";i:114;s:1:\"0\";i:115;s:1:\"0\";i:116;s:1:\"0\";i:117;s:1:\"0\";i:118;s:1:\"0\";i:119;s:1:\"0\";i:120;s:1:\"0\";i:121;s:1:\"0\";i:122;s:1:\"0\";}'),
(2, '最高管理員', 1, 'a:123:{i:0;s:9:\"191024003\";i:1;s:9:\"191022001\";i:2;s:11:\"191022001_1\";i:3;s:11:\"191022001_2\";i:4;s:11:\"191022001_3\";i:5;s:11:\"191022001_4\";i:6;s:9:\"191024001\";i:7;s:9:\"191024004\";i:8;s:11:\"191024004_2\";i:9;s:9:\"191024002\";i:10;s:11:\"191024002_2\";i:11;s:11:\"191024002_4\";i:12;s:9:\"191022002\";i:13;s:11:\"191022002_2\";i:14;s:9:\"191018004\";i:15;s:9:\"191018003\";i:16;s:11:\"191018003_1\";i:17;s:11:\"191018003_2\";i:18;s:11:\"191018003_3\";i:19;s:9:\"191018002\";i:20;s:11:\"191018002_1\";i:21;s:11:\"191018002_2\";i:22;s:11:\"191018002_3\";i:23;s:9:\"191016002\";i:24;s:9:\"191017001\";i:25;s:11:\"191017001_1\";i:26;s:11:\"191017001_2\";i:27;s:11:\"191017001_3\";i:28;s:9:\"191016001\";i:29;s:9:\"191015004\";i:30;s:11:\"191015004_1\";i:31;s:11:\"191015004_2\";i:32;s:11:\"191015004_3\";i:33;s:9:\"191015003\";i:34;s:11:\"191015003_1\";i:35;s:11:\"191015003_2\";i:36;s:11:\"191015003_3\";i:37;s:9:\"190818002\";i:38;s:9:\"201123001\";i:39;s:11:\"201123001_2\";i:40;s:9:\"200717001\";i:41;s:11:\"200717001_2\";i:42;s:9:\"191101001\";i:43;s:11:\"191101001_1\";i:44;s:11:\"191101001_2\";i:45;s:11:\"191101001_3\";i:46;s:9:\"191025001\";i:47;s:11:\"191025001_2\";i:48;s:9:\"191018001\";i:49;s:11:\"191018001_3\";i:50;s:11:\"191018001_4\";i:51;s:9:\"191017002\";i:52;s:11:\"191017002_1\";i:53;s:11:\"191017002_2\";i:54;s:11:\"191017002_3\";i:55;s:9:\"190812007\";i:56;s:9:\"190819999\";i:57;s:11:\"190819999_2\";i:58;s:9:\"190812010\";i:59;s:11:\"190812010_2\";i:60;s:9:\"190812009\";i:61;s:11:\"190812009_2\";i:62;s:9:\"190812001\";i:63;s:9:\"190812006\";i:64;s:11:\"190812006_1\";i:65;s:11:\"190812006_2\";i:66;s:11:\"190812006_3\";i:67;s:11:\"190812006_4\";i:68;s:9:\"190812005\";i:69;s:11:\"190812005_1\";i:70;s:11:\"190812005_2\";i:71;s:11:\"190812005_3\";i:72;s:9:\"190812004\";i:73;s:11:\"190812004_2\";i:74;s:1:\"0\";i:75;s:1:\"0\";i:76;s:1:\"0\";i:77;s:1:\"0\";i:78;s:1:\"0\";i:79;s:1:\"0\";i:80;s:1:\"0\";i:81;s:1:\"0\";i:82;s:1:\"0\";i:83;s:1:\"0\";i:84;s:1:\"0\";i:85;s:1:\"0\";i:86;s:1:\"0\";i:87;s:1:\"0\";i:88;s:1:\"0\";i:89;s:1:\"0\";i:90;s:1:\"0\";i:91;s:1:\"0\";i:92;s:1:\"0\";i:93;s:1:\"0\";i:94;s:1:\"0\";i:95;s:1:\"0\";i:96;s:1:\"0\";i:97;s:1:\"0\";i:98;s:1:\"0\";i:99;s:1:\"0\";i:100;s:1:\"0\";i:101;s:1:\"0\";i:102;s:1:\"0\";i:103;s:1:\"0\";i:104;s:1:\"0\";i:105;s:1:\"0\";i:106;s:1:\"0\";i:107;s:1:\"0\";i:108;s:1:\"0\";i:109;s:1:\"0\";i:110;s:1:\"0\";i:111;s:1:\"0\";i:112;s:1:\"0\";i:113;s:1:\"0\";i:114;s:1:\"0\";i:115;s:1:\"0\";i:116;s:1:\"0\";i:117;s:1:\"0\";i:118;s:1:\"0\";i:119;s:1:\"0\";i:120;s:1:\"0\";i:121;s:1:\"0\";i:122;s:1:\"0\";}'),
(6, '門市人員', 2, 'a:123:{i:0;s:9:\"191024003\";i:1;s:9:\"191022001\";i:2;s:11:\"191022001_1\";i:3;s:11:\"191022001_2\";i:4;s:11:\"191022001_3\";i:5;s:11:\"191022001_4\";i:6;s:9:\"191024004\";i:7;s:11:\"191024004_2\";i:8;s:9:\"191024002\";i:9;s:11:\"191024002_2\";i:10;s:11:\"191024002_4\";i:11;s:9:\"191022002\";i:12;s:11:\"191022002_2\";i:13;s:9:\"191018003\";i:14;s:11:\"191018003_1\";i:15;s:11:\"191018003_2\";i:16;s:11:\"191018003_3\";i:17;s:9:\"191018002\";i:18;s:11:\"191018002_1\";i:19;s:11:\"191018002_2\";i:20;s:11:\"191018002_3\";i:21;s:9:\"191017001\";i:22;s:11:\"191017001_1\";i:23;s:11:\"191017001_2\";i:24;s:11:\"191017001_3\";i:25;s:9:\"191015004\";i:26;s:11:\"191015004_1\";i:27;s:11:\"191015004_2\";i:28;s:11:\"191015004_3\";i:29;s:9:\"191015003\";i:30;s:11:\"191015003_1\";i:31;s:11:\"191015003_2\";i:32;s:11:\"191015003_3\";i:33;s:9:\"201123001\";i:34;s:11:\"201123001_2\";i:35;s:9:\"201117001\";i:36;s:11:\"201117001_2\";i:37;s:9:\"200717001\";i:38;s:11:\"200717001_2\";i:39;s:9:\"191101001\";i:40;s:11:\"191101001_1\";i:41;s:11:\"191101001_2\";i:42;s:9:\"191025001\";i:43;s:11:\"191025001_2\";i:44;s:9:\"191018001\";i:45;s:11:\"191018001_3\";i:46;s:11:\"191018001_4\";i:47;s:9:\"191017002\";i:48;s:11:\"191017002_1\";i:49;s:11:\"191017002_2\";i:50;s:11:\"191017002_3\";i:51;s:9:\"190819999\";i:52;s:11:\"190819999_2\";i:53;s:9:\"190812010\";i:54;s:11:\"190812010_2\";i:55;s:9:\"190812009\";i:56;s:11:\"190812009_2\";i:57;s:9:\"190812008\";i:58;s:11:\"190812008_2\";i:59;s:9:\"190812001\";i:60;s:9:\"190812006\";i:61;s:11:\"190812006_1\";i:62;s:11:\"190812006_2\";i:63;s:11:\"190812006_3\";i:64;s:11:\"190812006_4\";i:65;s:9:\"190812005\";i:66;s:11:\"190812005_1\";i:67;s:11:\"190812005_2\";i:68;s:11:\"190812005_3\";i:69;s:9:\"190812004\";i:70;s:11:\"190812004_1\";i:71;s:11:\"190812004_2\";i:72;s:11:\"190812004_3\";i:73;s:1:\"0\";i:74;s:1:\"0\";i:75;s:1:\"0\";i:76;s:1:\"0\";i:77;s:1:\"0\";i:78;s:1:\"0\";i:79;s:1:\"0\";i:80;s:1:\"0\";i:81;s:1:\"0\";i:82;s:1:\"0\";i:83;s:1:\"0\";i:84;s:1:\"0\";i:85;s:1:\"0\";i:86;s:1:\"0\";i:87;s:1:\"0\";i:88;s:1:\"0\";i:89;s:1:\"0\";i:90;s:1:\"0\";i:91;s:1:\"0\";i:92;s:1:\"0\";i:93;s:1:\"0\";i:94;s:1:\"0\";i:95;s:1:\"0\";i:96;s:1:\"0\";i:97;s:1:\"0\";i:98;s:1:\"0\";i:99;s:1:\"0\";i:100;s:1:\"0\";i:101;s:1:\"0\";i:102;s:1:\"0\";i:103;s:1:\"0\";i:104;s:1:\"0\";i:105;s:1:\"0\";i:106;s:1:\"0\";i:107;s:1:\"0\";i:108;s:1:\"0\";i:109;s:1:\"0\";i:110;s:1:\"0\";i:111;s:1:\"0\";i:112;s:1:\"0\";i:113;s:1:\"0\";i:114;s:1:\"0\";i:115;s:1:\"0\";i:116;s:1:\"0\";i:117;s:1:\"0\";i:118;s:1:\"0\";i:119;s:1:\"0\";i:120;s:1:\"0\";i:121;s:1:\"0\";i:122;s:1:\"0\";}');

-- --------------------------------------------------------

--
-- 資料表結構 `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `Menu_ID` varchar(11) NOT NULL COMMENT '目錄編號',
  `Menu_Name` varchar(20) DEFAULT NULL COMMENT '目錄名稱',
  `Menu_Lv` tinyint UNSIGNED DEFAULT '1' COMMENT '目錄層級',
  `Menu_Exec` varchar(60) DEFAULT NULL COMMENT '執行檔',
  `Menu_Path` varchar(20) DEFAULT NULL COMMENT '執行檔位置',
  `Menu_Sort` int DEFAULT '0' COMMENT '目錄排序',
  `Menu_UpMID` varchar(11) DEFAULT NULL COMMENT '上層類別',
  `Menu_Permissions` tinyint UNSIGNED DEFAULT '0' COMMENT '目錄權限',
  `Menu_Smallpic` varchar(20) DEFAULT NULL COMMENT '目錄小圖示',
  `Menu_TableName` varchar(30) DEFAULT NULL COMMENT '資料表名稱',
  `Menu_TableName1` varchar(30) DEFAULT NULL COMMENT '擴充資料表名稱',
  `Menu_TableName2` varchar(30) DEFAULT NULL COMMENT '分類資料表名稱',
  `Menu_TableKey` varchar(20) DEFAULT NULL COMMENT '資料表主鍵',
  `Menu_TableKey1` varchar(20) DEFAULT NULL COMMENT '擴充資料表主鍵',
  `Menu_TableKey2` varchar(20) DEFAULT NULL COMMENT '分類資料表主鍵',
  `Menu_TablePre` varchar(10) DEFAULT NULL COMMENT '資料表前輟',
  `Menu_TablePre1` varchar(10) DEFAULT NULL COMMENT '擴充資料表前輟',
  `Menu_TablePre2` varchar(10) DEFAULT NULL COMMENT '分類資料表前輟',
  `Menu_OrderBy` varchar(60) DEFAULT NULL COMMENT '自定義排序',
  `Menu_ClassMax` tinyint UNSIGNED DEFAULT '1' COMMENT '分類最大層數',
  `Menu_Mode` tinyint(1) DEFAULT '0' COMMENT '目錄模式',
  `Menu_Model` varchar(10) DEFAULT NULL COMMENT '目錄模組',
  `Menu_Link` varchar(100) DEFAULT NULL COMMENT '目錄連結',
  `Menu_CstSnPre` varchar(5) DEFAULT NULL COMMENT '自定編號前輟',
  `Menu_CstSnType` varchar(6) DEFAULT NULL COMMENT '自訂編號種類',
  `Menu_CstSnNum` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '自訂編號流水碼數',
  `Menu_Add` tinyint UNSIGNED DEFAULT '0' COMMENT '允許新增資料',
  `Menu_Edt` tinyint UNSIGNED DEFAULT '0' COMMENT '允許編輯資料',
  `Menu_Del` tinyint UNSIGNED DEFAULT '0' COMMENT '允許刪除資料',
  `Menu_View` tinyint UNSIGNED DEFAULT '0' COMMENT '允許檢視資料',
  `Menu_Albums_Edt` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '允許編輯相片',
  `Menu_Albums_Mpc` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '允許設封面圖',
  `Menu_SysUse` tinyint UNSIGNED DEFAULT '0' COMMENT '系統使用',
  `Menu_SysAdminUse` tinyint UNSIGNED DEFAULT '0' COMMENT '系統管理員使用',
  PRIMARY KEY (`Menu_ID`),
  KEY `Menu_Exec` (`Menu_Exec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='系統目錄表';

--
-- 傾印資料表的資料 `sys_menu`
--

INSERT INTO `sys_menu` (`Menu_ID`, `Menu_Name`, `Menu_Lv`, `Menu_Exec`, `Menu_Path`, `Menu_Sort`, `Menu_UpMID`, `Menu_Permissions`, `Menu_Smallpic`, `Menu_TableName`, `Menu_TableName1`, `Menu_TableName2`, `Menu_TableKey`, `Menu_TableKey1`, `Menu_TableKey2`, `Menu_TablePre`, `Menu_TablePre1`, `Menu_TablePre2`, `Menu_OrderBy`, `Menu_ClassMax`, `Menu_Mode`, `Menu_Model`, `Menu_Link`, `Menu_CstSnPre`, `Menu_CstSnType`, `Menu_CstSnNum`, `Menu_Add`, `Menu_Edt`, `Menu_Del`, `Menu_View`, `Menu_Albums_Edt`, `Menu_Albums_Mpc`, `Menu_SysUse`, `Menu_SysAdminUse`) VALUES
('190812001', '後台管理', 1, NULL, NULL, 0, NULL, 255, 'fa-gears', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '0', 0, 0, 0, 0, 0, 0, 0, 1, 0),
('190812002', '資料庫log檔', 2, 'logList.php', 'php_sys/log', 0, '190812001', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', 0, 0, 'SYS_LOGS', NULL, NULL, '0', 0, 0, 0, 0, 0, 0, 0, 1, 1),
('190812003', '資料庫設定', 2, 'tablesList.php', 'php_sys/tables', 0, '190812001', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, 1, 0, 'SYS_TABLES', NULL, NULL, '0', 0, 1, 1, 1, 0, 0, 0, 1, 1),
('190812004', '目錄設定', 2, 'menuList.php', 'php_sys/menu', 0, '190812001', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, 1, 0, 'SYS_MENU', NULL, NULL, '0', 0, 1, 1, 1, 0, 0, 0, 1, 0),
('190812005', '群組設定', 2, 'groupList.php', 'php_sys/group', 0, '190812001', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, 1, 0, 'SYS_GROUP', NULL, NULL, '0', 0, 1, 1, 1, 0, 0, 0, 1, 0),
('190812006', '管理者設定', 2, 'adminList.php', 'php_sys/admin', 0, '190812001', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, 1, 0, 'SYS_ADMIN', NULL, NULL, '0', 0, 1, 1, 1, 1, 0, 0, 1, 0),
('190812007', '網站管理', 1, NULL, NULL, 0, NULL, 255, 'fa-hdd-o', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '0', 0, 0, 0, 0, 0, 0, 0, 1, 0),
('190812008', '郵件設定', 2, 'woList.php?type=3', 'php_sys/weboption', 0, '190812007', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, 1, 0, 'SYS_WEBOP', NULL, NULL, '0', 0, 0, 1, 0, 0, 0, 0, 1, 0),
('190812009', '網站設定', 2, 'woList.php?type=2', 'php_sys/weboption', 0, '190812007', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, 1, 0, 'SYS_WEBOP', NULL, NULL, '0', 0, 0, 1, 0, 0, 0, 0, 1, 0),
('190812010', '公司資訊', 2, 'woList.php?type=1', 'php_sys/weboption', 0, '190812007', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', 1, 0, 'SYS_WEBOP', NULL, '', '0', 0, 0, 1, 0, 0, 0, 0, 1, 0),
('190818002', '前台管理', 1, 'web_menu', NULL, 0, NULL, 0, 'fa-th-list', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('191022001', '會員資料管理', 2, NULL, NULL, 0, '191024003', 0, NULL, 'web_member', NULL, '', 'Member_ID', NULL, '0', 'Member', NULL, '', '', 1, 3, 'table', NULL, 'M', 'YYMMDD', 4, 1, 1, 1, 1, 0, 0, 0, 0),
('191024003', '會員管理', 1, NULL, NULL, 0, NULL, 0, 'fa-user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('190819999', '設計參數管理', 2, 'woList.php?type=5', 'php_sys/weboption', 0, '190812007', 255, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', 1, 0, 'SYS_WEBOP', NULL, '', '0', 0, 0, 1, 0, 0, 0, 0, 1, 0),
('231211001', '公司會員管理', 2, NULL, NULL, 2, '191024003', 0, NULL, 'web_company', NULL, '', 'Company_bid', NULL, '0', 'Company', NULL, '', '', 1, 3, 'table', NULL, '', '', 0, 1, 1, 1, 1, 0, 0, 0, 0),
('231211002', '使用紀錄', 2, 'recordclassList.php', 'php/record', 1, '190818002', 0, NULL, 'sys_mysql_log', NULL, NULL, 'ML_ID', NULL, NULL, 'ML', NULL, NULL, '', 1, 1, NULL, NULL, '', '', 0, 0, 0, 0, 1, 0, 0, 0, 0),
('240102001', '公司方案申請', 2, NULL, NULL, 1, '191024003', 0, NULL, 'web_company_splan', NULL, '', 'CS_ID', NULL, '0', 'CS', NULL, '', '', 1, 3, 'table', NULL, '', '', 0, 0, 1, 1, 1, 0, 0, 0, 0),
('240129001', '聯絡我們管理', 2, NULL, NULL, 2, '190818002', 0, NULL, 'web_contact', NULL, NULL, 'CT_ID', NULL, NULL, 'CT', NULL, NULL, '', 1, 3, 'message', NULL, '', '', 0, 0, 0, 1, 1, 0, 0, 0, 0),
('240217001', '數據生成', 2, 'generateList.php', 'php/generate', 0, '190818002', 0, NULL, 'web_mysql_log', NULL, NULL, 'ML_ID', NULL, NULL, 'ML', NULL, NULL, '', 1, 1, NULL, NULL, '', '', 0, 0, 0, 0, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `sys_mysql_log`
--

DROP TABLE IF EXISTS `sys_mysql_log`;
CREATE TABLE IF NOT EXISTS `sys_mysql_log` (
  `ML_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ML_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '建立時間',
  `ML_USER` varchar(30) DEFAULT NULL COMMENT '使用者',
  `ML_DATA_ID` varchar(30) DEFAULT NULL COMMENT '資料ID',
  `ML_COMMENT` text COMMENT '註解',
  `ML_SQL_CON` text COMMENT '執行內容',
  `ML_SQL_EXEC_TYPE` varchar(10) DEFAULT NULL COMMENT '訊息種類',
  `ML_EXEC_FILE` varchar(255) DEFAULT NULL COMMENT '執行檔案',
  PRIMARY KEY (`ML_ID`),
  KEY `ML_DATE` (`ML_DATE`),
  KEY `ML_USER` (`ML_USER`),
  KEY `ML_DATA_ID` (`ML_DATA_ID`),
  KEY `ML_SQL_EXEC_TYPE` (`ML_SQL_EXEC_TYPE`),
  KEY `ML_EXEC_FILE` (`ML_EXEC_FILE`)
) ENGINE=MyISAM AUTO_INCREMENT=620 DEFAULT CHARSET=utf8mb3 COMMENT='執行訊息';

--
-- 傾印資料表的資料 `sys_mysql_log`
--

INSERT INTO `sys_mysql_log` (`ML_ID`, `ML_DATE`, `ML_USER`, `ML_DATA_ID`, `ML_COMMENT`, `ML_SQL_CON`, `ML_SQL_EXEC_TYPE`, `ML_EXEC_FILE`) VALUES
(1, '2024-02-21 17:04:51', '', '', '', 'UPDATE sys_admin SET `Admin_Code` = \'ed73cba70194a14690a4ea0e88bdbcfa\',`Admin_LastLogin` = NOW(),`Admin_IP` = \'61.218.134.131\'  WHERE Admin_ID = \'1\';', 'UPDATE', '/jp/system/post/SPOST_Login.php'),
(2, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'125\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(3, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'124\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(4, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'121\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(5, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'120\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(6, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'119\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(7, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'118\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(8, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'117\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(9, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'116\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(10, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'115\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(11, '2024-02-21 17:05:16', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'114\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(12, '2024-02-21 17:05:33', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'112\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(13, '2024-02-21 17:05:33', '系統管理員', '1', '', 'DELETE FROM web_company  WHERE Company_bid = \'111\';', 'DELETE', '/jp/system/mods/table/table.post.php?fun=231211001'),
(14, '2024-02-21 17:12:43', '系統管理員', '1', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(15, '2024-02-22 10:18:01', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(16, '2024-02-22 14:44:36', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(17, '2024-02-22 14:45:25', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(18, '2024-02-22 14:50:49', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(19, '2024-02-22 14:51:48', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(20, '2024-02-22 14:53:27', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(21, '2024-02-22 14:56:28', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(22, '2024-02-22 15:00:46', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(23, '2024-02-23 08:45:17', '', '', '', 'UPDATE web_company SET `Company_PW` = \'e5248681094860252687e6475300ea76\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'e5248681094860252687e6475300ea76\' OR BINARY Company_RePwd = \'e5248681094860252687e6475300ea76\');', 'UPDATE', '/jp/web_post.php'),
(24, '2024-02-23 14:50:27', '', '', '', 'UPDATE comp SET `cono` = \'123\',`coname1` = \'321\',`coname2` = \'123\',`coper` = \'312\',`couno` = \'321\',`cotel1` = \'123\',`cofax1` = \'312\',`coaddr1` = \'312\',`coemail` = \'123@gmail.com\',`laobaono` = \'123\',`jianbaono` = \'321\'  WHERE  1 = 1;', 'UPDATE', '/jp/web_post.php'),
(25, '2024-02-23 14:51:19', '', '', '', 'UPDATE sys_admin SET `Admin_Code` = \'f269e203996701b7a5eb8afb159648ea\',`Admin_LastLogin` = NOW(),`Admin_IP` = \'61.218.134.131\'  WHERE Admin_ID = \'1\';', 'UPDATE', '/jp/system/post/SPOST_Login.php'),
(26, '2024-02-23 14:57:43', '系統管理員', '1', '', 'UPDATE comp SET `cono` = \'A01\',`coname1` = \'庫點子\',`coname2` = \'庫點子文創資訊產業有限公司\',`coper` = \'1\',`couno` = \'1\',`cotel1` = \'1\',`cofax1` = \'1\',`coaddr1` = \'1\',`coemail` = \'bmidp888@gmail.com\',`laobaono` = \'1\',`jianbaono` = \'1\'  WHERE  1 = 1;', 'UPDATE', '/jp/web_post.php'),
(27, '2024-02-23 14:58:24', '系統管理員', '1', '', 'UPDATE comp SET `cono` = \'A01\',`coname1` = \'庫點子\',`coname2` = \'庫點子文創資訊產業有限公司\',`coper` = \'1\',`couno` = \'0423586802\',`cotel1` = \'1\',`cofax1` = \'1\',`coaddr1` = \'407台中市西屯區中工二路120號\',`coemail` = \'bmidp888@gmail.com\',`laobaono` = \'1\',`jianbaono` = \'1\'  WHERE  1 = 1;', 'UPDATE', '/jp/web_post.php'),
(28, '2024-02-23 15:00:48', '系統管理員', '1', '', 'INSERT INTO comp (`cono`,`coname1`,`coname2`,`coper`,`couno`,`cotel1`,`cofax1`,`coaddr1`,`coemail`,`laobaono`,`jianbaono`) VALUES (\'A01\',\'庫點子\',\'庫點子文創資訊產業有限公司\',\'1\',\'0423586802\',\'1\',\'1\',\'407台中市西屯區中工二路120號\',\'bmidp888@gmail.com\',\'1\',\'1\');', 'INSERT', '/jp/web_post.php'),
(29, '2024-02-23 15:29:10', '系統管理員', '1', 'Unknown column \'Member_Pwd\' in \'field list\'', 'UPDATE web_company SET `Member_Pwd` = \'767f2e385cba483c5e3a0f41d9d78cc3\'  WHERE  1 = 1 ;', 'ERROR', '/jp/web_post.php'),
(30, '2024-02-23 15:29:35', '系統管理員', '1', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\'  WHERE  1 = 1 ;', 'UPDATE', '/jp/web_post.php'),
(31, '2024-02-23 15:30:43', '系統管理員', '1', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(32, '2024-02-23 15:35:28', '系統管理員', '1', '', 'UPDATE comp SET `cono` = \'A01\',`coname1` = \'庫點子\',`coname2` = \'庫點子文創資訊產業有限公司\',`coper` = \'廖石龍\',`couno` = \'04235868\',`cotel1` = \'0423586802\',`cofax1` = \'0423586807\',`coaddr1` = \'407台中市西屯區中工二路120號\',`coemail` = \'bmidp888@gmail.com\',`laobaono` = \'1234\',`jianbaono` = \'1234\'  WHERE  1 = 1;', 'UPDATE', '/jp/web_post.php'),
(33, '2024-02-23 17:13:12', '系統管理員', '1', '', 'UPDATE comp SET `cono` = \'A01\',`coname1` = \'庫點子\',`coname2` = \'庫點子文創資訊產業有限公司\',`coper` = \'廖石龍\',`couno` = \'04235868\',`cotel1` = \'0423586802\',`cofax1` = \'0423586807\',`coaddr1` = \'407台中市西屯區中工二路120號\',`coemail` = \'bmidp888@gmail.com\',`laobaono` = \'1234\',`jianbaono` = \'1234\'  WHERE  1 = 1;', 'UPDATE', '/jp/web_post.php'),
(34, '2024-02-23 17:13:24', '系統管理員', '1', '', 'UPDATE comp SET `cono` = \'01\',`coname1` = \'庫點子\',`coname2` = \'庫點子文創資訊產業有限公司\',`coper` = \'廖石龍\',`couno` = \'04235868\',`cotel1` = \'0423586802\',`cofax1` = \'0423586807\',`coaddr1` = \'407台中市西屯區中工二路120號\',`coemail` = \'bmidp888@gmail.com\',`laobaono` = \'1234\',`jianbaono` = \'1234\'  WHERE  1 = 1;', 'UPDATE', '/jp/web_post.php'),
(35, '2024-02-23 17:45:19', '系統管理員', '1', '', 'INSERT INTO bank () VALUES ();', 'INSERT', '/jp/web_post.php'),
(36, '2024-02-23 17:46:19', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'822\',\'中國信託商業銀行\');', 'INSERT', '/jp/web_post.php'),
(37, '2024-02-23 17:52:27', '系統管理員', '1', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'07\',\'博士\');', 'INSERT', '/jp/web_post.php'),
(38, '2024-02-23 17:57:30', '系統管理員', '1', '', 'INSERT INTO jobs (`appno`,`appname`) VALUES (\'BE\',\'後端工程師\');', 'INSERT', '/jp/web_post.php'),
(39, '2024-02-23 17:57:35', '系統管理員', '1', '', 'UPDATE jobs SET `appno` = \'BE1\',`appname` = \'後端工程師\'  WHERE  1 = 1;', 'UPDATE', '/jp/web_post.php'),
(40, '2024-02-23 17:57:39', '系統管理員', '1', '', 'UPDATE jobs SET `appno` = \'BE\',`appname` = \'後端工程師\'  WHERE  1 = 1;', 'UPDATE', '/jp/web_post.php'),
(41, '2024-02-26 08:51:00', '', '', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(42, '2024-02-26 10:20:26', '', '', '', 'INSERT INTO part (`partno`,`partname`) VALUES (\'WD\',\'網設部\');', 'INSERT', '/jp/web_post.php'),
(43, '2024-02-26 10:40:06', '', '', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(44, '2024-02-26 13:49:05', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(45, '2024-02-26 13:49:06', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(46, '2024-02-26 13:49:06', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(47, '2024-02-26 13:49:06', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(48, '2024-02-26 13:49:07', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(49, '2024-02-26 13:49:07', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(50, '2024-02-26 13:49:08', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(51, '2024-02-26 13:49:38', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(52, '2024-02-26 13:49:39', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 1\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(53, '2024-02-26 13:54:15', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(54, '2024-02-26 13:54:24', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(55, '2024-02-26 13:54:30', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(56, '2024-02-26 13:54:36', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(57, '2024-02-26 13:58:14', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(58, '2024-02-26 13:58:53', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(59, '2024-02-26 13:58:54', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(60, '2024-02-26 13:58:54', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(61, '2024-02-26 13:59:05', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(62, '2024-02-26 13:59:06', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(63, '2024-02-26 13:59:06', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(64, '2024-02-26 13:59:06', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where bankno = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(65, '2024-02-26 13:59:33', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where `bankno` = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(66, '2024-02-26 13:59:34', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where `bankno` = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(67, '2024-02-26 13:59:35', '', '', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'\' at line 1', 'SELECT * FROM bank Where `bankno` = 822\'   ;', 'ERROR', '/jp/m_bank.php?c=2KFtk5g%3D'),
(68, '2024-02-26 14:05:01', '', '', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'411\',\'請輸入銀行名稱全名。\');', 'INSERT', '/jp/web_post.php'),
(69, '2024-02-26 14:05:09', '', '', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'41132131\',\'請輸入銀行名稱全名。\');', 'INSERT', '/jp/web_post.php'),
(70, '2024-02-26 14:21:32', '', '', '', 'UPDATE bank SET `bankno` = \'4111\',`bankname` = \'請輸入銀行名稱全名。\'  WHERE  bankno = 41132131;', 'UPDATE', '/jp/web_post.php'),
(71, '2024-02-26 14:21:42', '', '', '', 'UPDATE bank SET `bankno` = \'411\',`bankname` = \'test\'  WHERE  bankno = 411;', 'UPDATE', '/jp/web_post.php'),
(72, '2024-02-26 14:22:37', '', '', '', 'UPDATE bank SET `bankno` = \'822\',`bankname` = \'中國信託商業銀行\'  WHERE  bankno = 822;', 'UPDATE', '/jp/web_post.php'),
(73, '2024-02-26 14:22:42', '', '', '', 'UPDATE bank SET `bankno` = \'822\',`bankname` = \'中國信託商業銀行123\'  WHERE  bankno = 822;', 'UPDATE', '/jp/web_post.php'),
(74, '2024-02-26 14:22:48', '', '', '', 'UPDATE bank SET `bankno` = \'8221\',`bankname` = \'中國信託商業銀行\'  WHERE  bankno = 822;', 'UPDATE', '/jp/web_post.php'),
(75, '2024-02-26 14:22:54', '', '', '', 'UPDATE bank SET `bankno` = \'822\',`bankname` = \'中國信託商業銀行\'  WHERE  bankno = 8221;', 'UPDATE', '/jp/web_post.php'),
(76, '2024-02-26 14:34:47', '', '', 'Unknown column \'2KFpkpc\' in \'where clause\'', 'DELETE FROM bank  WHERE  bankno = 2KFpkpc%3D;', 'ERROR', '/jp/web_post.php'),
(77, '2024-02-26 14:34:52', '', '', 'Unknown column \'2KFpkpc\' in \'where clause\'', 'DELETE FROM bank  WHERE  bankno = 2KFpkpc%3D;', 'ERROR', '/jp/web_post.php'),
(78, '2024-02-26 14:36:27', '', '', 'Unknown column \'Array\' in \'where clause\'', 'DELETE FROM bank  WHERE  bankno = Array;', 'ERROR', '/jp/web_post.php'),
(79, '2024-02-26 14:41:37', '', '', 'Unknown column \'Array\' in \'where clause\'', 'DELETE FROM bank  WHERE  bankno = Array;', 'ERROR', '/jp/web_post.php'),
(80, '2024-02-26 14:41:40', '', '', 'Unknown column \'Array\' in \'where clause\'', 'DELETE FROM bank  WHERE  bankno = Array;', 'ERROR', '/jp/web_post.php'),
(81, '2024-02-26 14:42:23', '', '', '', 'DELETE FROM bank  WHERE  bankno = 4111;', 'DELETE', '/jp/web_post.php'),
(82, '2024-02-26 14:53:29', '', '', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'01\',\'阿瓜\');', 'INSERT', '/jp/web_post.php'),
(83, '2024-02-26 14:53:38', '', '', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'071\',\'博士\');', 'INSERT', '/jp/web_post.php'),
(84, '2024-02-26 14:53:54', '', '', '', 'UPDATE education SET `educationno` = \'07\',`educationname` = \'博士123\'  WHERE  educationno = 07;', 'UPDATE', '/jp/web_post.php'),
(85, '2024-02-26 14:53:59', '', '', 'Unknown column \'educationno\' in \'where clause\'', 'DELETE FROM bank  WHERE  educationno = 071;', 'ERROR', '/jp/web_post.php'),
(86, '2024-02-26 14:55:18', '', '', 'Unknown column \'educationno\' in \'where clause\'', 'DELETE FROM bank  WHERE  educationno = 071;', 'ERROR', '/jp/web_post.php'),
(87, '2024-02-26 14:56:43', '', '', '', 'UPDATE education SET `educationno` = \'07123\',`educationname` = \'博士123\'  WHERE  educationno = 07;', 'UPDATE', '/jp/web_post.php'),
(88, '2024-02-26 14:56:45', '', '', 'Unknown column \'educationno\' in \'where clause\'', 'DELETE FROM bank  WHERE  educationno = 07123;', 'ERROR', '/jp/web_post.php'),
(89, '2024-02-26 14:58:00', '', '', '', 'DELETE FROM education  WHERE  educationno = 07123;', 'DELETE', '/jp/web_post.php'),
(90, '2024-02-26 14:58:04', '', '', '', 'UPDATE education SET `educationno` = \'07\',`educationname` = \'博士\'  WHERE  educationno = 071;', 'UPDATE', '/jp/web_post.php'),
(91, '2024-02-26 14:58:19', '', '', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'02\',\'阿天\');', 'INSERT', '/jp/web_post.php'),
(92, '2024-02-26 14:58:41', '', '', '', 'UPDATE education SET `educationno` = \'02\',`educationname` = \'阿天3\'  WHERE  educationno = 02;', 'UPDATE', '/jp/web_post.php'),
(93, '2024-02-26 14:58:46', '', '', 'Duplicate entry \'01\' for key \'education.PRIMARY\'', 'UPDATE education SET `educationno` = \'01\',`educationname` = \'阿天3\'  WHERE  educationno = 02;', 'ERROR', '/jp/web_post.php'),
(94, '2024-02-26 14:58:48', '', '', 'Duplicate entry \'01\' for key \'education.PRIMARY\'', 'UPDATE education SET `educationno` = \'01\',`educationname` = \'阿天3\'  WHERE  educationno = 02;', 'ERROR', '/jp/web_post.php'),
(95, '2024-02-26 14:58:55', '', '', 'Duplicate entry \'01\' for key \'education.PRIMARY\'', 'UPDATE education SET `educationno` = \'01\',`educationname` = \'阿天3\'  WHERE  educationno = 02;', 'ERROR', '/jp/web_post.php'),
(96, '2024-02-26 14:59:43', '', '', '', 'UPDATE education SET `educationno` = \'02\',`educationname` = \'阿天3\'  WHERE  educationno = 02;', 'UPDATE', '/jp/web_post.php'),
(97, '2024-02-26 14:59:48', '', '', 'Duplicate entry \'02\' for key \'education.PRIMARY\'', 'UPDATE education SET `educationno` = \'02\',`educationname` = \'阿瓜\'  WHERE  educationno = 01;', 'ERROR', '/jp/web_post.php'),
(98, '2024-02-26 14:59:58', '', '', 'Duplicate entry \'02\' for key \'education.PRIMARY\'', 'UPDATE education SET `educationno` = \'02\',`educationname` = \'阿瓜\'  WHERE  educationno = 01;', 'ERROR', '/jp/web_post.php'),
(99, '2024-02-26 15:00:18', '', '', 'Duplicate entry \'02\' for key \'education.PRIMARY\'', 'UPDATE education SET `educationno` = \'02\',`educationname` = \'阿瓜\'  WHERE  educationno = 01;', 'ERROR', '/jp/web_post.php'),
(100, '2024-02-26 15:00:25', '', '', 'Duplicate entry \'02\' for key \'education.PRIMARY\'', 'UPDATE education SET `educationno` = \'02\',`educationname` = \'阿瓜\'  WHERE  educationno = 01;', 'ERROR', '/jp/web_post.php'),
(101, '2024-02-26 15:08:10', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(102, '2024-02-26 15:09:37', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(103, '2024-02-26 15:09:38', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(104, '2024-02-26 15:09:38', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(105, '2024-02-26 15:09:39', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(106, '2024-02-26 15:09:54', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(107, '2024-02-26 15:09:55', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(108, '2024-02-26 15:10:00', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(109, '2024-02-26 15:10:01', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(110, '2024-02-26 15:10:02', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs Where appno = BE   ;', 'ERROR', '/jp/m_jobs.php?c=qHSjdQ%3D%3D'),
(111, '2024-02-26 15:10:41', '', '', 'Unknown column \'BE\' in \'where clause\'', 'SELECT * FROM jobs  WHERE  appno = BE   ;', 'ERROR', '/jp/web_post.php'),
(112, '2024-02-26 15:10:41', '', '', '', 'INSERT INTO jobs (`appno`,`appname`) VALUES (\'BE11\',\'後端工程師\');', 'INSERT', '/jp/web_post.php'),
(113, '2024-02-26 15:10:58', '', '', 'Unknown column \'BE11\' in \'where clause\'', 'SELECT * FROM jobs  WHERE  appno = BE11   ;', 'ERROR', '/jp/web_post.php'),
(114, '2024-02-26 15:10:58', '', '', 'Duplicate entry \'BE11\' for key \'jobs.PRIMARY\'', 'INSERT INTO jobs (`appno`,`appname`) VALUES (\'BE11\',\'後端工程師1\');', 'ERROR', '/jp/web_post.php'),
(115, '2024-02-26 15:11:35', '', '', 'Unknown column \'BE11\' in \'where clause\'', 'SELECT * FROM jobs  WHERE  appno = BE11   ;', 'ERROR', '/jp/web_post.php'),
(116, '2024-02-26 15:11:35', '', '', 'Duplicate entry \'BE11\' for key \'jobs.PRIMARY\'', 'INSERT INTO jobs (`appno`,`appname`) VALUES (\'BE11\',\'後端工程師1\');', 'ERROR', '/jp/web_post.php'),
(117, '2024-02-26 15:11:48', '', '', 'Unknown column \'BE11\' in \'where clause\'', 'SELECT * FROM jobs  WHERE  appno = BE11   ;', 'ERROR', '/jp/web_post.php'),
(118, '2024-02-26 15:11:48', '', '', 'Duplicate entry \'BE11\' for key \'jobs.PRIMARY\'', 'INSERT INTO jobs (`appno`,`appname`) VALUES (\'BE11\',\'後端工程師\');', 'ERROR', '/jp/web_post.php'),
(119, '2024-02-26 15:12:54', '', '', 'Unknown column \'BE11\' in \'where clause\'', 'DELETE FROM jobs  WHERE  appno = BE11;', 'ERROR', '/jp/web_post.php'),
(120, '2024-02-26 15:12:56', '', '', 'Unknown column \'BE11\' in \'where clause\'', 'DELETE FROM jobs  WHERE  appno = BE11;', 'ERROR', '/jp/web_post.php'),
(121, '2024-02-26 15:13:49', '', '', '', 'UPDATE jobs SET `appno` = \'BE11\',`appname` = \'後端工程師123\'  WHERE  appno = \'BE11\';', 'UPDATE', '/jp/web_post.php'),
(122, '2024-02-26 15:13:54', '', '', '', 'UPDATE jobs SET `appno` = \'BE2\',`appname` = \'後端工程師123\'  WHERE  appno = \'BE11\';', 'UPDATE', '/jp/web_post.php'),
(123, '2024-02-26 15:13:56', '', '', '', 'DELETE FROM jobs  WHERE  appno = \'BE2\';', 'DELETE', '/jp/web_post.php'),
(124, '2024-02-26 15:22:53', '', '', '', 'DELETE FROM bank  WHERE  bankno = 411;', 'DELETE', '/jp/web_post.php'),
(125, '2024-02-26 15:22:59', '', '', '', 'DELETE FROM education  WHERE  educationno = 01;', 'DELETE', '/jp/web_post.php'),
(126, '2024-02-26 15:23:01', '', '', '', 'DELETE FROM education  WHERE  educationno = 02;', 'DELETE', '/jp/web_post.php'),
(127, '2024-02-26 15:27:16', '', '', 'Unknown column \'WD\' in \'where clause\'', 'SELECT * FROM part  WHERE  partno = WD   ;', 'ERROR', '/jp/web_post.php'),
(128, '2024-02-26 15:27:16', '', '', 'Duplicate entry \'WD\' for key \'part.PRIMARY\'', 'INSERT INTO part (`partno`,`partname`) VALUES (\'WD\',\'網設部1\');', 'ERROR', '/jp/web_post.php'),
(129, '2024-02-26 15:27:54', '', '', 'Unknown column \'WD\' in \'where clause\'', 'SELECT * FROM part  WHERE  partno = WD   ;', 'ERROR', '/jp/web_post.php'),
(130, '2024-02-26 15:27:54', '', '', 'Duplicate entry \'WD\' for key \'part.PRIMARY\'', 'INSERT INTO part (`partno`,`partname`) VALUES (\'WD\',\'網設部\');', 'ERROR', '/jp/web_post.php'),
(131, '2024-02-26 15:29:19', '', '', '', 'UPDATE part SET `partno` = \'WD\',`partname` = \'網設部1\'  WHERE  partno = \'WD\';', 'UPDATE', '/jp/web_post.php'),
(132, '2024-02-26 15:29:22', '', '', '', 'UPDATE part SET `partno` = \'WD1\',`partname` = \'網設部1\'  WHERE  partno = \'WD\';', 'UPDATE', '/jp/web_post.php'),
(133, '2024-02-26 15:29:28', '', '', '', 'UPDATE part SET `partno` = \'WD\',`partname` = \'網設部\'  WHERE  partno = \'WD1\';', 'UPDATE', '/jp/web_post.php'),
(134, '2024-02-26 15:29:59', '', '', '', 'INSERT INTO part (`partno`,`partname`) VALUES (\'HR\',\'人資部門\');', 'INSERT', '/jp/web_post.php'),
(135, '2024-02-26 15:30:04', '', '', '', 'UPDATE part SET `partno` = \'HR1\',`partname` = \'人資部門\'  WHERE  partno = \'HR\';', 'UPDATE', '/jp/web_post.php'),
(136, '2024-02-26 15:30:06', '', '', 'Unknown column \'partno\' in \'where clause\'', 'DELETE FROM education  WHERE  partno = \'HR1\';', 'ERROR', '/jp/web_post.php'),
(137, '2024-02-26 15:30:53', '', '', 'Unknown column \'partno\' in \'where clause\'', 'DELETE FROM education  WHERE  partno = \'HR1\';', 'ERROR', '/jp/web_post.php'),
(138, '2024-02-26 15:31:31', '', '', '', 'DELETE FROM part  WHERE  partno = \'HR1\';', 'DELETE', '/jp/web_post.php'),
(139, '2024-02-26 15:40:29', '', '', 'Unknown column \'familyno\' in \'where clause\'', 'SELECT * FROM family  WHERE  familyno = \'9\'   ;', 'ERROR', '/jp/web_post.php'),
(140, '2024-02-26 15:40:29', '', '', 'Unknown column \'familyno\' in \'field list\'', 'INSERT INTO family (`familyno`,`familyname`) VALUES (\'9\',\'外曾祖父母\');', 'ERROR', '/jp/web_post.php'),
(141, '2024-02-26 15:44:17', '', '', 'Unknown column \'relationname\' in \'field list\'', 'INSERT INTO family (`relationno`,`relationname`) VALUES (\'9\',\'外曾祖父母\');', 'ERROR', '/jp/web_post.php'),
(142, '2024-02-26 15:44:21', '', '', 'Unknown column \'relationname\' in \'field list\'', 'INSERT INTO family (`relationno`,`relationname`) VALUES (\'9\',\'外曾祖父母\');', 'ERROR', '/jp/web_post.php'),
(143, '2024-02-26 15:44:25', '', '', 'Unknown column \'relationname\' in \'field list\'', 'INSERT INTO family (`relationno`,`relationname`) VALUES (\'1\',\'123\');', 'ERROR', '/jp/web_post.php'),
(144, '2024-02-26 15:46:52', '', '', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'9\',\'外曾祖父母\');', 'INSERT', '/jp/web_post.php'),
(145, '2024-02-26 15:47:03', '', '', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'1\',\'test\');', 'INSERT', '/jp/web_post.php'),
(146, '2024-02-26 15:47:07', '', '', '', 'UPDATE family SET `relationno` = \'12\',`relationship` = \'test\'  WHERE  relationno = \'1\';', 'UPDATE', '/jp/web_post.php'),
(147, '2024-02-26 15:47:10', '', '', '', 'UPDATE family SET `relationno` = \'12\',`relationship` = \'test2\'  WHERE  relationno = \'12\';', 'UPDATE', '/jp/web_post.php'),
(148, '2024-02-26 15:47:15', '', '', '', 'UPDATE family SET `relationno` = \'123\',`relationship` = \'test24\'  WHERE  relationno = \'12\';', 'UPDATE', '/jp/web_post.php'),
(149, '2024-02-26 15:47:30', '', '', '', 'DELETE FROM family  WHERE  relationno = \'123\';', 'DELETE', '/jp/web_post.php'),
(150, '2024-02-26 15:55:01', '', '', 'Unknown column \'reasonname\' in \'field list\'', 'INSERT INTO reason (`reasonno`,`reasonname`) VALUES (\'U\',\'喪失健保資格\');', 'ERROR', '/jp/web_post.php'),
(151, '2024-02-26 15:56:47', '', '', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'U\',\'喪失健保資格\');', 'INSERT', '/jp/web_post.php'),
(152, '2024-02-26 15:59:10', '', '', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'A\',\'TEST\');', 'INSERT', '/jp/web_post.php'),
(153, '2024-02-26 15:59:15', '', '', '', 'UPDATE reason SET `reasonno` = \'AB\',`reason` = \'TESTC\'  WHERE  reasonno = \'A\';', 'UPDATE', '/jp/web_post.php'),
(154, '2024-02-26 15:59:18', '', '', '', 'DELETE FROM reason  WHERE  reasonno = \'AB\';', 'DELETE', '/jp/web_post.php'),
(155, '2024-02-26 16:46:19', '', '', '', 'INSERT INTO deduction (`deductionno`,`deductionname`,`dedmny`) VALUES (\'1\',\'test\',\'123\');', 'INSERT', '/jp/web_post.php'),
(156, '2024-02-26 16:47:57', '', '', '', 'UPDATE deduction SET `deductionno` = \'1\',`deductionname` = \'test\',`dedmny` = \'123\'  WHERE  deductionno = \'1\';', 'UPDATE', '/jp/web_post.php'),
(157, '2024-02-26 16:49:17', '', '', '', 'UPDATE deduction SET `deductionno` = \'1\',`deductionname` = \'test\',`dedmny` = \'123.1234\'  WHERE  deductionno = \'1\';', 'UPDATE', '/jp/web_post.php'),
(158, '2024-02-26 16:49:21', '', '', '', 'UPDATE deduction SET `deductionno` = \'1\',`deductionname` = \'test\',`dedmny` = \'123.123411\'  WHERE  deductionno = \'1\';', 'UPDATE', '/jp/web_post.php'),
(159, '2024-02-26 16:53:17', '', '', '', 'UPDATE deduction SET `deductionno` = \'12\',`deductionname` = \'test3\',`dedmny` = \'1231.1234\'  WHERE  deductionno = \'1\';', 'UPDATE', '/jp/web_post.php'),
(160, '2024-02-26 16:53:29', '', '', '', 'INSERT INTO deduction (`deductionno`,`deductionname`,`dedmny`) VALUES (\'77\',\'77\',\'1\');', 'INSERT', '/jp/web_post.php'),
(161, '2024-02-26 16:53:37', '', '', '', 'UPDATE deduction SET `deductionno` = \'771\',`deductionname` = \'772\',`dedmny` = \'1.000303\'  WHERE  deductionno = \'77\';', 'UPDATE', '/jp/web_post.php'),
(162, '2024-02-26 16:53:40', '', '', '', 'DELETE FROM deduction  WHERE  deductionno = \'771\';', 'DELETE', '/jp/web_post.php'),
(163, '2024-02-27 09:38:24', '', '', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(164, '2024-02-27 14:58:30', '', '', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(165, '2024-02-27 14:58:30', '', '', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'123\',\'4321\',\'1234\');', 'INSERT', '/jp/web_post.php'),
(166, '2024-02-27 14:58:36', '', '', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(167, '2024-02-27 14:58:36', '', '', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'123\',\'4321\',\'1234\');', 'INSERT', '/jp/web_post.php'),
(168, '2024-02-27 14:58:36', '', '', 'Duplicate entry \'0\' for key \'seclab1.PRIMARY\'', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'321\',\'123\',\'321\');', 'ERROR', '/jp/web_post.php'),
(169, '2024-02-27 14:58:40', '', '', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(170, '2024-02-27 14:58:40', '', '', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'123\',\'4321\',\'1234\');', 'INSERT', '/jp/web_post.php'),
(171, '2024-02-27 14:58:40', '', '', 'Duplicate entry \'0\' for key \'seclab1.PRIMARY\'', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'321\',\'123\',\'321\');', 'ERROR', '/jp/web_post.php'),
(172, '2024-02-27 14:58:45', '', '', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(173, '2024-02-27 14:58:45', '', '', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'123\',\'4321\',\'1234\');', 'INSERT', '/jp/web_post.php'),
(174, '2024-02-27 14:59:14', '', '', '', 'UPDATE sys_admin SET `Admin_Code` = \'a444f4028dee60ea8fe3e0ff1619fc4e\',`Admin_LastLogin` = NOW(),`Admin_IP` = \'61.218.134.131\'  WHERE Admin_ID = \'1\';', 'UPDATE', '/jp/system/post/SPOST_Login.php'),
(175, '2024-02-27 14:59:50', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(176, '2024-02-27 14:59:50', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'123\',\'4321\',\'1234\');', 'INSERT', '/jp/web_post.php'),
(177, '2024-02-27 14:59:50', '系統管理員', '1', 'Duplicate entry \'0\' for key \'seclab1.PRIMARY\'', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'\',\'\',\'\');', 'ERROR', '/jp/web_post.php'),
(178, '2024-02-27 14:59:59', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(179, '2024-02-27 14:59:59', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'1231\',\'4321\',\'1234\');', 'INSERT', '/jp/web_post.php'),
(180, '2024-02-27 15:00:08', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(181, '2024-02-27 15:00:08', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'1231\',\'4321\',\'1234\');', 'INSERT', '/jp/web_post.php'),
(182, '2024-02-27 15:00:08', '系統管理員', '1', 'Duplicate entry \'0\' for key \'seclab1.PRIMARY\'', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'2\',\'2\',\'2\');', 'ERROR', '/jp/web_post.php'),
(183, '2024-02-27 15:00:49', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(184, '2024-02-27 15:00:49', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'1\',\'1\',\'1\');', 'INSERT', '/jp/web_post.php'),
(185, '2024-02-27 15:00:53', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(186, '2024-02-27 15:00:53', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'1\',\'1\',\'1\');', 'INSERT', '/jp/web_post.php'),
(187, '2024-02-27 15:00:53', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'2\',\'2\',\'2\');', 'INSERT', '/jp/web_post.php'),
(188, '2024-02-27 15:00:58', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(189, '2024-02-27 15:00:58', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'2\',\'2\',\'2\');', 'INSERT', '/jp/web_post.php'),
(190, '2024-02-27 15:01:22', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(191, '2024-02-27 15:01:22', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'2\',\'2\',\'2\');', 'INSERT', '/jp/web_post.php'),
(192, '2024-02-27 15:01:22', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'3\',\'3\',\'3\');', 'INSERT', '/jp/web_post.php'),
(193, '2024-02-27 15:01:22', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'3\',\'4\',\'4\',\'4\');', 'INSERT', '/jp/web_post.php'),
(194, '2024-02-27 15:01:22', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'4\',\'5\',\'5\',\'5\');', 'INSERT', '/jp/web_post.php'),
(195, '2024-02-27 15:01:22', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'5\',\'6\',\'6\',\'6\');', 'INSERT', '/jp/web_post.php'),
(196, '2024-02-27 15:01:22', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'6\',\'7\',\'7\',\'7\');', 'INSERT', '/jp/web_post.php'),
(197, '2024-02-27 15:01:22', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'7\',\'8\',\'8\',\'8\');', 'INSERT', '/jp/web_post.php'),
(198, '2024-02-27 16:03:44', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(199, '2024-02-27 16:03:44', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'2\',\'2\',\'2\');', 'INSERT', '/jp/web_post.php'),
(200, '2024-02-27 16:03:44', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'3\',\'3\',\'3\');', 'INSERT', '/jp/web_post.php'),
(201, '2024-02-27 16:03:44', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'3\',\'7\',\'7\',\'7\');', 'INSERT', '/jp/web_post.php'),
(202, '2024-02-27 16:03:44', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'4\',\'8\',\'8\',\'8\');', 'INSERT', '/jp/web_post.php'),
(203, '2024-02-27 16:18:09', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(204, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'2\',\'2\',\'2\');', 'INSERT', '/jp/web_post.php'),
(205, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'3\',\'3\',\'3\');', 'INSERT', '/jp/web_post.php'),
(206, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'3\',\'7\',\'7\',\'7\');', 'INSERT', '/jp/web_post.php'),
(207, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'4\',\'8\',\'8\',\'8\');', 'INSERT', '/jp/web_post.php'),
(208, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'5\',\'\',\'\',\'\');', 'INSERT', '/jp/web_post.php'),
(209, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'6\',\'\',\'\',\'\');', 'INSERT', '/jp/web_post.php'),
(210, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'7\',\'\',\'\',\'\');', 'INSERT', '/jp/web_post.php'),
(211, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'8\',\'\',\'\',\'\');', 'INSERT', '/jp/web_post.php'),
(212, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'9\',\'\',\'\',\'\');', 'INSERT', '/jp/web_post.php'),
(213, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'10\',\'\',\'\',\'\');', 'INSERT', '/jp/web_post.php'),
(214, '2024-02-27 16:18:09', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'11\',\'\',\'\',\'\');', 'INSERT', '/jp/web_post.php'),
(215, '2024-02-27 16:18:18', '系統管理員', '1', '', 'DELETE FROM seclab1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(216, '2024-02-27 16:18:18', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'1\',\'2\',\'2\',\'2\');', 'INSERT', '/jp/web_post.php'),
(217, '2024-02-27 16:18:18', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'2\',\'3\',\'3\',\'3\');', 'INSERT', '/jp/web_post.php'),
(218, '2024-02-27 16:18:18', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'3\',\'7\',\'7\',\'7\');', 'INSERT', '/jp/web_post.php'),
(219, '2024-02-27 16:18:18', '系統管理員', '1', '', 'INSERT INTO seclab1 (`seclabNo`,`seclabMny`,`seclablMny`,`ForeignMny`) VALUES (\'4\',\'8\',\'8\',\'8\');', 'INSERT', '/jp/web_post.php'),
(220, '2024-02-27 16:27:38', '系統管理員', '1', '', 'DELETE FROM purchaser1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(221, '2024-02-27 16:27:38', '系統管理員', '1', 'Unknown column \'seclabNo\' in \'field list\'', 'INSERT INTO purchaser1 (`seclabNo`,`purchaserhmny`,`purchasermny`) VALUES (\'1\',\'4\',\'4\');', 'ERROR', '/jp/web_post.php'),
(222, '2024-02-27 16:27:38', '系統管理員', '1', 'Unknown column \'seclabNo\' in \'field list\'', 'INSERT INTO purchaser1 (`seclabNo`,`purchaserhmny`,`purchasermny`) VALUES (\'2\',\'23\',\'12\');', 'ERROR', '/jp/web_post.php'),
(223, '2024-02-27 16:27:38', '系統管理員', '1', 'Unknown column \'seclabNo\' in \'field list\'', 'INSERT INTO purchaser1 (`seclabNo`,`purchaserhmny`,`purchasermny`) VALUES (\'3\',\'56\',\'34\');', 'ERROR', '/jp/web_post.php'),
(224, '2024-02-27 16:28:01', '系統管理員', '1', '', 'DELETE FROM purchaser1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(225, '2024-02-27 16:28:01', '系統管理員', '1', '', 'INSERT INTO purchaser1 (`purchaserno`,`purchaserhmny`,`purchasermny`) VALUES (\'1\',\'4\',\'4\');', 'INSERT', '/jp/web_post.php'),
(226, '2024-02-27 16:28:01', '系統管理員', '1', '', 'INSERT INTO purchaser1 (`purchaserno`,`purchaserhmny`,`purchasermny`) VALUES (\'2\',\'23\',\'12\');', 'INSERT', '/jp/web_post.php'),
(227, '2024-02-27 16:28:01', '系統管理員', '1', '', 'INSERT INTO purchaser1 (`purchaserno`,`purchaserhmny`,`purchasermny`) VALUES (\'3\',\'56\',\'34\');', 'INSERT', '/jp/web_post.php'),
(228, '2024-02-27 16:28:20', '系統管理員', '1', '', 'DELETE FROM purchaser1  WHERE  1 = 1;', 'DELETE', '/jp/web_post.php'),
(229, '2024-02-27 16:28:20', '系統管理員', '1', '', 'INSERT INTO purchaser1 (`purchaserno`,`purchaserhmny`,`purchasermny`) VALUES (\'1\',\'4\',\'4\');', 'INSERT', '/jp/web_post.php'),
(230, '2024-02-27 16:28:20', '系統管理員', '1', '', 'INSERT INTO purchaser1 (`purchaserno`,`purchaserhmny`,`purchasermny`) VALUES (\'2\',\'32\',\'23\');', 'INSERT', '/jp/web_post.php'),
(231, '2024-02-27 16:28:20', '系統管理員', '1', '', 'INSERT INTO purchaser1 (`purchaserno`,`purchaserhmny`,`purchasermny`) VALUES (\'3\',\'55\',\'44\');', 'INSERT', '/jp/web_post.php'),
(232, '2024-02-29 08:47:22', '', '', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(233, '2024-02-29 10:17:55', '', '', '', 'UPDATE sys_admin SET `Admin_Code` = \'9508a627166da0c528b2d49ba623a54f\',`Admin_LastLogin` = NOW(),`Admin_IP` = \'61.218.134.131\'  WHERE Admin_ID = \'1\';', 'UPDATE', '/jp/system/post/SPOST_Login.php'),
(234, '2024-02-29 16:02:27', '系統管理員', '1', 'Unknown column \'daytype\' in \'field list\'', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`daytype`) VALUES (\'B\',\'B123\',\'一\',\'08:30\',\'08:31\',\'12:00\',\'13:30\',\'12:00\',\'13:30\',\'18:00\',\'18:01\',\'18:01\',\'12:00\',\'480\',\'工作日\');', 'ERROR', '/jp/web_post.php'),
(235, '2024-02-29 16:02:27', '系統管理員', '1', 'Unknown column \'daytype\' in \'field list\'', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`daytype`) VALUES (\'B\',\'B123\',\'二\',\'08:30\',\'08:31\',\'12:00\',\'13:30\',\'12:00\',\'13:30\',\'18:00\',\'18:01\',\'18:01\',\'12:00\',\'480\',\'工作日\');', 'ERROR', '/jp/web_post.php'),
(236, '2024-02-29 16:02:27', '系統管理員', '1', 'Unknown column \'daytype\' in \'field list\'', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`daytype`) VALUES (\'B\',\'B123\',\'三\',\'08:30\',\'08:31\',\'12:00\',\'13:30\',\'12:00\',\'13:30\',\'18:00\',\'18:01\',\'18:01\',\'12:00\',\'480\',\'工作日\');', 'ERROR', '/jp/web_post.php'),
(237, '2024-02-29 16:02:27', '系統管理員', '1', 'Unknown column \'daytype\' in \'field list\'', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`daytype`) VALUES (\'B\',\'B123\',\'四\',\'08:30\',\'08:31\',\'12:00\',\'13:30\',\'12:00\',\'13:30\',\'18:00\',\'18:01\',\'18:01\',\'12:00\',\'480\',\'工作日\');', 'ERROR', '/jp/web_post.php'),
(238, '2024-02-29 16:02:27', '系統管理員', '1', 'Unknown column \'daytype\' in \'field list\'', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`daytype`) VALUES (\'B\',\'B123\',\'五\',\'08:30\',\'08:31\',\'12:00\',\'13:30\',\'12:00\',\'13:30\',\'18:00\',\'18:01\',\'18:01\',\'12:00\',\'480\',\'工作日\');', 'ERROR', '/jp/web_post.php'),
(239, '2024-02-29 16:02:27', '系統管理員', '1', 'Unknown column \'daytype\' in \'field list\'', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`daytype`) VALUES (\'B\',\'B123\',\'六\',\'08:30\',\'08:31\',\'12:00\',\'13:30\',\'12:00\',\'13:30\',\'18:00\',\'18:01\',\'18:01\',\'12:00\',\'480\',\'例假日\');', 'ERROR', '/jp/web_post.php'),
(240, '2024-02-29 16:02:27', '系統管理員', '1', 'Unknown column \'daytype\' in \'field list\'', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`daytype`) VALUES (\'B\',\'B123\',\'日\',\'08:30\',\'08:31\',\'12:00\',\'13:30\',\'12:00\',\'13:30\',\'18:00\',\'18:01\',\'18:01\',\'12:00\',\'480\',\'休息日\');', 'ERROR', '/jp/web_post.php');
INSERT INTO `sys_mysql_log` (`ML_ID`, `ML_DATE`, `ML_USER`, `ML_DATA_ID`, `ML_COMMENT`, `ML_SQL_CON`, `ML_SQL_EXEC_TYPE`, `ML_EXEC_FILE`) VALUES
(241, '2024-02-29 16:03:01', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'一\',\'08:30\',\'08:31\',\'12:00\',\'13:30\',\'12:00\',\'13:30\',\'18:00\',\'18:01\',\'18:01\',\'12:00\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(242, '2024-02-29 16:06:15', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(243, '2024-02-29 16:06:45', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(244, '2024-02-29 16:13:56', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(245, '2024-02-29 16:21:50', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'B123\',\'一\',\'1721\',\'1622\',\'1921\',\'1624\',\'1921\',\'1721\',\'1623\',\'1821\',\'1624\',\'1821\',\'655\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(246, '2024-02-29 16:21:50', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'B123\',\'二\',\'1721\',\'1622\',\'1921\',\'1624\',\'1921\',\'1721\',\'1623\',\'1821\',\'1624\',\'1821\',\'655\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(247, '2024-02-29 16:21:50', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'B123\',\'三\',\'1721\',\'1622\',\'1921\',\'1624\',\'1921\',\'1721\',\'1623\',\'1821\',\'1624\',\'1821\',\'655\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(248, '2024-02-29 16:21:50', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'B123\',\'四\',\'1721\',\'1622\',\'1921\',\'1624\',\'1921\',\'1721\',\'1623\',\'1821\',\'1624\',\'1821\',\'655\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(249, '2024-02-29 16:21:50', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'B123\',\'五\',\'1721\',\'1622\',\'1921\',\'1624\',\'1921\',\'1721\',\'1623\',\'1821\',\'1624\',\'1821\',\'655\',\'空班日\');', 'INSERT', '/jp/web_post.php'),
(250, '2024-02-29 16:21:50', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'B123\',\'六\',\'1721\',\'1622\',\'1921\',\'1624\',\'1921\',\'1721\',\'1623\',\'1821\',\'1624\',\'1821\',\'655\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(251, '2024-02-29 16:21:50', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'B123\',\'日\',\'1721\',\'1622\',\'1921\',\'1624\',\'1921\',\'1721\',\'1623\',\'1821\',\'1624\',\'1821\',\'655\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(252, '2024-02-29 16:30:42', '系統管理員', '1', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'Grouo By attendanceno Order By attendanceid asc\' at line 1', 'SELECT * FROM attendance Where 1 = 1 Grouo By attendanceno Order By attendanceid asc ;', 'ERROR', '/jp/m_attendancelist.php'),
(253, '2024-02-29 16:30:43', '系統管理員', '1', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'Grouo By attendanceno Order By attendanceid asc\' at line 1', 'SELECT * FROM attendance Where 1 = 1 Grouo By attendanceno Order By attendanceid asc ;', 'ERROR', '/jp/m_attendancelist.php'),
(254, '2024-02-29 16:30:43', '系統管理員', '1', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'Grouo By attendanceno Order By attendanceid asc\' at line 1', 'SELECT * FROM attendance Where 1 = 1 Grouo By attendanceno Order By attendanceid asc ;', 'ERROR', '/jp/m_attendancelist.php'),
(255, '2024-02-29 16:31:23', '系統管理員', '1', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'Grouo By attendanceno Order By attendanceid asc\' at line 1', 'SELECT * FROM attendance Where 1 = 1 Grouo By attendanceno Order By attendanceid asc ;', 'ERROR', '/jp/m_attendancelist.php'),
(256, '2024-02-29 16:31:24', '系統管理員', '1', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'Grouo By attendanceno Order By attendanceid asc\' at line 1', 'SELECT * FROM attendance Where 1 = 1 Grouo By attendanceno Order By attendanceid asc ;', 'ERROR', '/jp/m_attendancelist.php'),
(257, '2024-02-29 17:23:05', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'一\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(258, '2024-02-29 17:23:05', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'二\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(259, '2024-02-29 17:23:05', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'三\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'休息日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(260, '2024-02-29 17:23:05', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'四\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(261, '2024-02-29 17:23:05', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'五\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'空班日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(262, '2024-02-29 17:23:05', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'六\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(263, '2024-02-29 17:23:05', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'日\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'8\';', 'UPDATE', '/jp/web_post.php'),
(264, '2024-02-29 17:24:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'一\',`ontime` = \'1921\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(265, '2024-02-29 17:24:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'二\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(266, '2024-02-29 17:24:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'三\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'休息日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(267, '2024-02-29 17:24:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'四\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(268, '2024-02-29 17:24:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'五\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'空班日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(269, '2024-02-29 17:24:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'六\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(270, '2024-02-29 17:24:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'B1\',`week` = \'日\',`ontime` = \'1721\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'8\';', 'UPDATE', '/jp/web_post.php'),
(271, '2024-02-29 17:24:18', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'C\',`attendancename` = \'B1\',`week` = \'一\',`ontime` = \'1921\',`latetime` = \'1622\',`resttime1` = \'1921\',`resttime2` = \'1624\',`resttime3` = \'1921\',`resttime4` = \'1721\',`offtime` = \'1623\',`addontime` = \'1821\',`addofftime` = \'1624\',`mealtime` = \'1821\',`worktime` = \'655\',`type` = \'例假日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(272, '2024-02-29 17:27:56', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(273, '2024-02-29 17:33:10', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(274, '2024-02-29 17:33:10', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'二\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(275, '2024-02-29 17:33:10', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'三\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(276, '2024-02-29 17:33:10', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'四\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(277, '2024-02-29 17:33:10', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'五\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(278, '2024-02-29 17:33:10', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'六\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(279, '2024-02-29 17:33:10', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'日\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(280, '2024-02-29 17:33:52', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(281, '2024-02-29 17:33:52', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'二\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(282, '2024-02-29 17:33:52', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'三\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(283, '2024-02-29 17:33:52', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'四\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(284, '2024-02-29 17:33:52', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'五\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(285, '2024-02-29 17:33:52', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'六\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(286, '2024-02-29 17:33:52', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'A\',\'A123\',\'日\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(287, '2024-02-29 17:34:11', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(288, '2024-02-29 17:34:11', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'二\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(289, '2024-02-29 17:34:11', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'三\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(290, '2024-02-29 17:34:11', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'四\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(291, '2024-02-29 17:34:11', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'五\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(292, '2024-02-29 17:34:11', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'六\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(293, '2024-02-29 17:34:11', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'B\',\'B123\',\'日\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(294, '2024-02-29 17:34:25', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'C\',\'C123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(295, '2024-02-29 17:34:25', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'C\',\'C123\',\'二\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(296, '2024-02-29 17:34:25', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'C\',\'C123\',\'三\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(297, '2024-02-29 17:34:25', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'C\',\'C123\',\'四\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(298, '2024-02-29 17:34:25', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'C\',\'C123\',\'五\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(299, '2024-02-29 17:34:25', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'C\',\'C123\',\'六\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(300, '2024-02-29 17:34:25', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'C\',\'C123\',\'日\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(301, '2024-02-29 17:34:39', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'D\',\'D123\',\'一\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(302, '2024-02-29 17:34:39', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'D\',\'D123\',\'二\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(303, '2024-02-29 17:34:39', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'D\',\'D123\',\'三\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(304, '2024-02-29 17:34:39', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'D\',\'D123\',\'四\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(305, '2024-02-29 17:34:39', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'D\',\'D123\',\'五\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(306, '2024-02-29 17:34:39', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'D\',\'D123\',\'六\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(307, '2024-02-29 17:34:39', '系統管理員', '1', '', 'INSERT INTO attendance (`attendanceno`,`attendancename`,`week`,`ontime`,`latetime`,`resttime1`,`resttime2`,`resttime3`,`resttime4`,`offtime`,`addontime`,`addofftime`,`mealtime`,`worktime`,`type`) VALUES (\'D\',\'D123\',\'日\',\'0830\',\'0831\',\'1200\',\'1330\',\'1200\',\'1330\',\'1800\',\'1801\',\'1801\',\'1200\',\'480\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(308, '2024-02-29 17:36:18', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(309, '2024-02-29 17:36:18', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(310, '2024-02-29 17:36:18', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(311, '2024-02-29 17:36:18', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(312, '2024-02-29 17:36:18', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(313, '2024-02-29 17:36:18', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(314, '2024-02-29 17:36:18', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(315, '2024-02-29 17:36:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(316, '2024-02-29 17:36:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(317, '2024-02-29 17:36:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(318, '2024-02-29 17:36:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(319, '2024-02-29 17:36:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(320, '2024-02-29 17:36:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(321, '2024-02-29 17:36:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(322, '2024-02-29 17:36:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(323, '2024-02-29 17:36:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(324, '2024-02-29 17:36:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(325, '2024-02-29 17:36:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(326, '2024-02-29 17:36:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(327, '2024-02-29 17:36:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(328, '2024-02-29 17:36:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(329, '2024-02-29 17:37:44', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(330, '2024-02-29 17:37:44', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(331, '2024-02-29 17:37:44', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(332, '2024-02-29 17:37:44', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(333, '2024-02-29 17:37:44', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(334, '2024-02-29 17:37:44', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(335, '2024-02-29 17:37:44', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(336, '2024-02-29 17:39:34', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(337, '2024-02-29 17:39:34', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(338, '2024-02-29 17:39:34', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(339, '2024-02-29 17:39:34', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(340, '2024-02-29 17:39:34', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(341, '2024-02-29 17:39:34', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(342, '2024-02-29 17:39:34', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(343, '2024-02-29 17:39:54', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(344, '2024-02-29 17:39:54', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(345, '2024-02-29 17:39:54', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(346, '2024-02-29 17:39:54', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(347, '2024-02-29 17:39:54', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(348, '2024-02-29 17:39:54', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(349, '2024-02-29 17:39:54', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(350, '2024-02-29 17:40:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(351, '2024-02-29 17:40:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(352, '2024-02-29 17:40:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(353, '2024-02-29 17:40:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(354, '2024-02-29 17:40:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php');
INSERT INTO `sys_mysql_log` (`ML_ID`, `ML_DATE`, `ML_USER`, `ML_DATA_ID`, `ML_COMMENT`, `ML_SQL_CON`, `ML_SQL_EXEC_TYPE`, `ML_EXEC_FILE`) VALUES
(355, '2024-02-29 17:40:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(356, '2024-02-29 17:40:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(357, '2024-02-29 17:41:00', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(358, '2024-02-29 17:41:00', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(359, '2024-02-29 17:41:00', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(360, '2024-02-29 17:41:00', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(361, '2024-02-29 17:41:00', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(362, '2024-02-29 17:41:00', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(363, '2024-02-29 17:41:00', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(364, '2024-02-29 17:41:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(365, '2024-02-29 17:41:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(366, '2024-02-29 17:41:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(367, '2024-02-29 17:41:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(368, '2024-02-29 17:41:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(369, '2024-02-29 17:41:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(370, '2024-02-29 17:41:08', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(371, '2024-02-29 17:42:26', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(372, '2024-02-29 17:42:26', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(373, '2024-02-29 17:42:26', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(374, '2024-02-29 17:42:26', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(375, '2024-02-29 17:42:26', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(376, '2024-02-29 17:42:26', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(377, '2024-02-29 17:42:26', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'H\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(378, '2024-02-29 17:43:17', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1300\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(379, '2024-02-29 17:43:17', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(380, '2024-02-29 17:43:17', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(381, '2024-02-29 17:43:17', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(382, '2024-02-29 17:43:17', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(383, '2024-02-29 17:43:17', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(384, '2024-02-29 17:43:17', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(385, '2024-02-29 17:43:25', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(386, '2024-02-29 17:43:25', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(387, '2024-02-29 17:43:25', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(388, '2024-02-29 17:43:25', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(389, '2024-02-29 17:43:25', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(390, '2024-02-29 17:43:25', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(391, '2024-02-29 17:43:25', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0930\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(392, '2024-02-29 17:43:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'一\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'1\';', 'UPDATE', '/jp/web_post.php'),
(393, '2024-02-29 17:43:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'二\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'2\';', 'UPDATE', '/jp/web_post.php'),
(394, '2024-02-29 17:43:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'三\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'3\';', 'UPDATE', '/jp/web_post.php'),
(395, '2024-02-29 17:43:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'四\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'4\';', 'UPDATE', '/jp/web_post.php'),
(396, '2024-02-29 17:43:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'五\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'5\';', 'UPDATE', '/jp/web_post.php'),
(397, '2024-02-29 17:43:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'六\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'6\';', 'UPDATE', '/jp/web_post.php'),
(398, '2024-02-29 17:43:32', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'A\',`attendancename` = \'A1\',`week` = \'日\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'7\';', 'UPDATE', '/jp/web_post.php'),
(399, '2024-02-29 17:43:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'G1\',`week` = \'一\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'15\';', 'UPDATE', '/jp/web_post.php'),
(400, '2024-02-29 17:43:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'G1\',`week` = \'二\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'16\';', 'UPDATE', '/jp/web_post.php'),
(401, '2024-02-29 17:43:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'G1\',`week` = \'三\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'17\';', 'UPDATE', '/jp/web_post.php'),
(402, '2024-02-29 17:43:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'G1\',`week` = \'四\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'18\';', 'UPDATE', '/jp/web_post.php'),
(403, '2024-02-29 17:43:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'G1\',`week` = \'五\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'工作日\'  WHERE attendanceid = \'19\';', 'UPDATE', '/jp/web_post.php'),
(404, '2024-02-29 17:43:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'G1\',`week` = \'六\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'例假日\'  WHERE attendanceid = \'20\';', 'UPDATE', '/jp/web_post.php'),
(405, '2024-02-29 17:43:43', '系統管理員', '1', '', 'UPDATE attendance SET `attendanceno` = \'G\',`attendancename` = \'G1\',`week` = \'日\',`ontime` = \'0830\',`latetime` = \'0831\',`resttime1` = \'1200\',`resttime2` = \'1330\',`resttime3` = \'1200\',`resttime4` = \'1330\',`offtime` = \'1800\',`addontime` = \'1801\',`addofftime` = \'1801\',`mealtime` = \'1200\',`worktime` = \'480\',`type` = \'休息日\'  WHERE attendanceid = \'21\';', 'UPDATE', '/jp/web_post.php'),
(406, '2024-03-01 08:46:42', '', '', '', 'UPDATE sys_admin SET `Admin_Code` = \'6b73c84686200456fb8111ebd7173959\',`Admin_LastLogin` = NOW(),`Admin_IP` = \'61.218.134.131\'  WHERE Admin_ID = \'1\';', 'UPDATE', '/jp/system/post/SPOST_Login.php'),
(407, '2024-03-01 08:50:57', '系統管理員', '1', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(408, '2024-03-01 09:38:58', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'000\',\'中央信託局\');', 'INSERT', '/jp/web_post.php'),
(409, '2024-03-01 09:45:54', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'001\',\'中央信託局\');', 'INSERT', '/jp/web_post.php'),
(410, '2024-03-01 09:46:05', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'003\',\'交通銀行\');', 'INSERT', '/jp/web_post.php'),
(411, '2024-03-01 09:46:18', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'004\',\'臺灣銀行\');', 'INSERT', '/jp/web_post.php'),
(412, '2024-03-01 09:47:13', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'005\',\'土地銀行\');', 'INSERT', '/jp/web_post.php'),
(413, '2024-03-01 09:47:22', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'006\',\'合作金庫\');', 'INSERT', '/jp/web_post.php'),
(414, '2024-03-01 09:47:34', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'007\',\'第一商業銀行\');', 'INSERT', '/jp/web_post.php'),
(415, '2024-03-01 09:47:46', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'008\',\'華南商業銀行\');', 'INSERT', '/jp/web_post.php'),
(416, '2024-03-01 09:47:57', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'009\',\'彰化商業銀行\');', 'INSERT', '/jp/web_post.php'),
(417, '2024-03-01 09:48:14', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'011\',\'上海商業儲蓄銀行\');', 'INSERT', '/jp/web_post.php'),
(418, '2024-03-01 09:48:26', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'012\',\'台北富邦銀行\');', 'INSERT', '/jp/web_post.php'),
(419, '2024-03-01 09:48:41', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'013\',\'國泰世華商業銀行\');', 'INSERT', '/jp/web_post.php'),
(420, '2024-03-01 09:48:57', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'015\',\'中國輸出入銀行\');', 'INSERT', '/jp/web_post.php'),
(421, '2024-03-01 09:49:15', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'016\',\'高雄銀行\');', 'INSERT', '/jp/web_post.php'),
(422, '2024-03-01 09:49:38', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'017\',\'兆豐國際商業銀行\');', 'INSERT', '/jp/web_post.php'),
(423, '2024-03-01 09:49:59', '系統管理員', '1', '', 'UPDATE bank SET `bankno` = \'017\',`bankname` = \'1\'  WHERE  bankno = \'017\';', 'UPDATE', '/jp/web_post.php'),
(424, '2024-03-01 09:50:14', '系統管理員', '1', '', 'UPDATE bank SET `bankno` = \'017\',`bankname` = \'兆豐國際商業銀行\'  WHERE  bankno = \'017\';', 'UPDATE', '/jp/web_post.php'),
(425, '2024-03-01 09:53:40', '系統管理員', '1', '', 'UPDATE bank SET `bankno` = \'017\',`bankname` = \'12\'  WHERE  bankno = \'017\';', 'UPDATE', '/jp/web_post.php'),
(426, '2024-03-01 09:53:48', '系統管理員', '1', '', 'UPDATE bank SET `bankno` = \'017\',`bankname` = \'兆豐國際商業銀行\'  WHERE  bankno = \'017\';', 'UPDATE', '/jp/web_post.php'),
(427, '2024-03-01 09:55:21', '系統管理員', '1', 'Duplicate entry \'017\' for key \'bank.PRIMARY\'', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'017\',\'123\');', 'ERROR', '/jp/web_post.php'),
(428, '2024-03-01 09:55:25', '系統管理員', '1', 'Duplicate entry \'017\' for key \'bank.PRIMARY\'', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'017\',\'123\');', 'ERROR', '/jp/web_post.php'),
(429, '2024-03-01 10:41:17', '系統管理員', '1', '', 'UPDATE bank SET `bankno` = \'017\',`bankname` = \'兆豐國際商業銀行\'  WHERE  bankno = \'017\';', 'UPDATE', '/jp/web_post.php'),
(430, '2024-03-01 10:41:42', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'021\',\'花旗銀行\');', 'INSERT', '/jp/web_post.php'),
(431, '2024-03-01 10:52:26', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'040\',\'中華開發工業銀行\');', 'INSERT', '/jp/web_post.php'),
(432, '2024-03-01 10:52:44', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'048\',\'臺灣工業銀行\');', 'INSERT', '/jp/web_post.php'),
(433, '2024-03-01 10:53:23', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'050\',\'臺灣中小企業銀行\');', 'INSERT', '/jp/web_post.php'),
(434, '2024-03-01 10:53:37', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'052\',\'渣打國際商業銀行\');', 'INSERT', '/jp/web_post.php'),
(435, '2024-03-01 10:53:58', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'053\',\'台中商業銀行\');', 'INSERT', '/jp/web_post.php'),
(436, '2024-03-01 10:54:13', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'054\',\'京城商業銀行\');', 'INSERT', '/jp/web_post.php'),
(437, '2024-03-01 10:54:22', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'081\',\'匯豐銀行\');', 'INSERT', '/jp/web_post.php'),
(438, '2024-03-01 10:54:36', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'101\',\'大台北銀行\');', 'INSERT', '/jp/web_post.php'),
(439, '2024-03-01 10:54:46', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'102\',\'華泰商業銀行\');', 'INSERT', '/jp/web_post.php'),
(440, '2024-03-01 10:54:57', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'103\',\'新光商業銀行\');', 'INSERT', '/jp/web_post.php'),
(441, '2024-03-01 10:55:09', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'108\',\'陽信商業銀行\');', 'INSERT', '/jp/web_post.php'),
(442, '2024-03-01 10:55:25', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'118\',\'板信商業銀行\');', 'INSERT', '/jp/web_post.php'),
(443, '2024-03-01 11:03:06', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'147\',\'三信商業銀行\');', 'INSERT', '/jp/web_post.php'),
(444, '2024-03-01 11:03:45', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'700\',\'中華郵政\');', 'INSERT', '/jp/web_post.php'),
(445, '2024-03-01 11:04:01', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'803\',\'聯邦商業銀行\');', 'INSERT', '/jp/web_post.php'),
(446, '2024-03-01 11:04:18', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'805\',\'遠東國際商業銀行\');', 'INSERT', '/jp/web_post.php'),
(447, '2024-03-01 11:04:32', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'806\',\'元大商業銀行\');', 'INSERT', '/jp/web_post.php'),
(448, '2024-03-01 11:04:42', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'807\',\'永豐商業銀行\');', 'INSERT', '/jp/web_post.php'),
(449, '2024-03-01 11:04:55', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'808\',\'玉山商業銀行\');', 'INSERT', '/jp/web_post.php'),
(450, '2024-03-01 11:05:52', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'809\',\'萬華商業銀行\');', 'INSERT', '/jp/web_post.php'),
(451, '2024-03-01 11:06:04', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'810\',\'寶華商業銀行\');', 'INSERT', '/jp/web_post.php'),
(452, '2024-03-01 11:06:19', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'812\',\'台新國際商業銀行\');', 'INSERT', '/jp/web_post.php'),
(453, '2024-03-01 11:06:28', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'814\',\'大眾商業銀行\');', 'INSERT', '/jp/web_post.php'),
(454, '2024-03-01 11:06:44', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'815\',\'日盛國際商業銀行\');', 'INSERT', '/jp/web_post.php'),
(455, '2024-03-01 11:06:53', '系統管理員', '1', '', 'INSERT INTO bank (`bankno`,`bankname`) VALUES (\'816\',\'安泰商業銀行\');', 'INSERT', '/jp/web_post.php'),
(456, '2024-03-01 11:10:07', '系統管理員', '1', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'01\',\'小學\');', 'INSERT', '/jp/web_post.php'),
(457, '2024-03-01 11:10:14', '系統管理員', '1', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'02\',\'國中\');', 'INSERT', '/jp/web_post.php'),
(458, '2024-03-01 11:10:24', '系統管理員', '1', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'03\',\'高中\');', 'INSERT', '/jp/web_post.php'),
(459, '2024-03-01 11:12:20', '系統管理員', '1', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'04\',\'二專\');', 'INSERT', '/jp/web_post.php'),
(460, '2024-03-01 11:12:30', '系統管理員', '1', '', 'UPDATE education SET `educationno` = \'06\',`educationname` = \'小學\'  WHERE  educationno = \'01\';', 'UPDATE', '/jp/web_post.php'),
(461, '2024-03-01 11:12:38', '系統管理員', '1', 'Duplicate entry \'02\' for key \'education.PRIMARY\'', 'UPDATE education SET `educationno` = \'02\',`educationname` = \'小學\'  WHERE  educationno = \'06\';', 'ERROR', '/jp/web_post.php'),
(462, '2024-03-01 11:12:46', '系統管理員', '1', '', 'UPDATE education SET `educationno` = \'01\',`educationname` = \'小學\'  WHERE  educationno = \'06\';', 'UPDATE', '/jp/web_post.php'),
(463, '2024-03-01 11:12:54', '系統管理員', '1', 'Duplicate entry \'04\' for key \'education.PRIMARY\'', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'04\',\'大學\');', 'ERROR', '/jp/web_post.php'),
(464, '2024-03-01 11:12:57', '系統管理員', '1', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'05\',\'大學\');', 'INSERT', '/jp/web_post.php'),
(465, '2024-03-01 11:13:08', '系統管理員', '1', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'06\',\'碩士\');', 'INSERT', '/jp/web_post.php'),
(466, '2024-03-01 11:13:10', '系統管理員', '1', '', 'DELETE FROM education  WHERE  educationno = \'01\';', 'DELETE', '/jp/web_post.php'),
(467, '2024-03-01 11:13:22', '系統管理員', '1', '', 'INSERT INTO education (`educationno`,`educationname`) VALUES (\'01\',\'小學\');', 'INSERT', '/jp/web_post.php'),
(468, '2024-03-01 11:13:52', '系統管理員', '1', 'Duplicate entry \'U\' for key \'reason.PRIMARY\'', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'U\',\'123\');', 'ERROR', '/jp/web_post.php'),
(469, '2024-03-01 11:14:00', '系統管理員', '1', 'Duplicate entry \'U\' for key \'reason.PRIMARY\'', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'U\',\'死亡\');', 'ERROR', '/jp/web_post.php'),
(470, '2024-03-01 11:14:03', '系統管理員', '1', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'M\',\'死亡\');', 'INSERT', '/jp/web_post.php'),
(471, '2024-03-01 11:14:13', '系統管理員', '1', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'B\',\'眷屬轉換單位\');', 'INSERT', '/jp/web_post.php'),
(472, '2024-03-01 11:14:20', '系統管理員', '1', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'C\',\'其他\');', 'INSERT', '/jp/web_post.php'),
(473, '2024-03-01 11:14:28', '系統管理員', '1', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'E\',\'失蹤\');', 'INSERT', '/jp/web_post.php'),
(474, '2024-03-01 11:14:37', '系統管理員', '1', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'I\',\'受刑\');', 'INSERT', '/jp/web_post.php'),
(475, '2024-03-01 11:14:57', '系統管理員', '1', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'R\',\'堃\');', 'INSERT', '/jp/web_post.php'),
(476, '2024-03-01 11:15:02', '系統管理員', '1', '', 'DELETE FROM reason  WHERE  reasonno = \'I\';', 'DELETE', '/jp/web_post.php'),
(477, '2024-03-01 11:15:10', '系統管理員', '1', '', 'INSERT INTO reason (`reasonno`,`reason`) VALUES (\'I\',\'受刑\');', 'INSERT', '/jp/web_post.php'),
(478, '2024-03-01 11:15:15', '系統管理員', '1', 'Duplicate entry \'C\' for key \'reason.PRIMARY\'', 'UPDATE reason SET `reasonno` = \'C\',`reason` = \'眷屬轉換單位\'  WHERE  reasonno = \'B\';', 'ERROR', '/jp/web_post.php'),
(479, '2024-03-01 11:15:17', '系統管理員', '1', '', 'UPDATE reason SET `reasonno` = \'B\',`reason` = \'眷屬轉換單位\'  WHERE  reasonno = \'B\';', 'UPDATE', '/jp/web_post.php'),
(480, '2024-03-01 11:16:49', '系統管理員', '1', '', 'UPDATE reason SET `reasonno` = \'M\',`reason` = \'死亡\'  WHERE  reasonno = \'M\';', 'UPDATE', '/jp/web_post.php'),
(481, '2024-03-01 11:17:13', '系統管理員', '1', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'1\',\'配偶\');', 'INSERT', '/jp/web_post.php'),
(482, '2024-03-01 11:17:20', '系統管理員', '1', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'2\',\'父母\');', 'INSERT', '/jp/web_post.php'),
(483, '2024-03-01 11:17:29', '系統管理員', '1', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'3\',\'子女\');', 'INSERT', '/jp/web_post.php'),
(484, '2024-03-01 11:17:37', '系統管理員', '1', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'4\',\'祖父母\');', 'INSERT', '/jp/web_post.php'),
(485, '2024-03-01 11:17:44', '系統管理員', '1', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'5\',\'孫子女\');', 'INSERT', '/jp/web_post.php'),
(486, '2024-03-01 11:17:51', '系統管理員', '1', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'6\',\'外祖父母\');', 'INSERT', '/jp/web_post.php'),
(487, '2024-03-01 11:18:00', '系統管理員', '1', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'7\',\'外孫子女\');', 'INSERT', '/jp/web_post.php'),
(488, '2024-03-01 11:18:08', '系統管理員', '1', '', 'INSERT INTO family (`relationno`,`relationship`) VALUES (\'8\',\'曾祖父母\');', 'INSERT', '/jp/web_post.php'),
(489, '2024-03-01 14:06:10', '系統管理員', '1', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(490, '2024-03-01 17:50:32', '系統管理員', '1', '', 'UPDATE sys_web_option SET `WO_Keywords` = \'\',`WO_Name` = \'JP雲端出勤任意打卡平台\',`WO_Tel` = \'04-23586802\',`WO_Email` = \'bm888@ms39.hinet.net\',`WO_OpenTime` = \'早上10：00~晚上22：00\',`WO_Addr` = \'0\',`WO_Addr1` = \'0\',`WO_Addr2` = \'中工二路120號\'  WHERE Admin_ID = \'2\';', 'UPDATE', '/jp/system/post/SPOST_WOption.php?fun=190812010'),
(491, '2024-03-01 17:50:55', '系統管理員', '1', '', 'UPDATE sys_web_option SET `WO_Keywords` = \'\',`WO_Title` = \'JP雲端出勤任意打卡平台\',`WO_Url` = \'http://localhost/jp/\',`WO_Description` = \'JP雲端出勤任意打卡平台\',`WO_LineLink` = \'\',`WO_FBLink` = \'https://www.facebook.com/jbscloudbusinesssoftware\',`WO_IGLink` = \'\',`WO_YoutubeLink` = \'\',`WO_GMAP` = \'<iframe src=\\\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3639.809862072403!2d120.61331897611298!3d24.178400178380745!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346915ff68fbd3f3%3A0xd8eaff09a7c70a3d!2zNDA35Y-w5Lit5biC6KW_5bGv5Y2A5Lit5bel5LqM6LevMTIw6Jmf!5e0!3m2!1szh-TW!2stw!4v1694596684280!5m2!1szh-TW!2stw\\\" width=\\\"600\\\" height=\\\"450\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" loading=\\\"lazy\\\" referrerpolicy=\\\"no-referrer-when-downgrade\\\"></iframe>\',`WO_GMAP_Link` = \'https://goo.gl/maps/25a3Wnv8c69mAT926\',`WO_Open` = \'0\',`WO_Debug` = \'0\'  WHERE Admin_ID = \'2\';', 'UPDATE', '/jp/system/post/SPOST_WOption.php?fun=190812009'),
(492, '2024-03-04 08:54:50', '', '', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(493, '2024-03-04 10:32:08', '', '', '', 'UPDATE sys_admin SET `Admin_Code` = \'35f0fe50c60dff64b8f8a4cc41a473ce\',`Admin_LastLogin` = NOW(),`Admin_IP` = \'61.218.134.131\'  WHERE Admin_ID = \'1\';', 'UPDATE', '/jp/system/post/SPOST_Login.php'),
(494, '2024-03-04 11:12:47', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'115\',\'0101\',\'Test\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(495, '2024-03-04 11:12:47', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'115\',\'0109\',\'123\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(496, '2024-03-04 11:12:47', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'115\',\'0123\',\'test123\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(497, '2024-03-04 14:09:37', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'115\';', 'DELETE', '/jp/web_post.php'),
(498, '2024-03-04 14:09:37', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'115\',\'0101\',\'Test\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(499, '2024-03-04 14:09:37', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'115\',\'0109\',\'123\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(500, '2024-03-04 14:09:37', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'115\',\'0123\',\'test123\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(501, '2024-03-04 14:18:02', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'115\';', 'DELETE', '/jp/web_post.php'),
(502, '2024-03-04 14:18:02', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'115\',\'0123\',\'test123\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(503, '2024-03-04 14:18:02', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'115\',\'0101\',\'Test\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(504, '2024-03-04 14:19:07', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0101\',\'元旦\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(505, '2024-03-04 14:19:17', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'113\';', 'DELETE', '/jp/web_post.php'),
(506, '2024-03-04 14:19:17', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0101\',\'元旦\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(507, '2024-03-04 14:22:33', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'113\';', 'DELETE', '/jp/web_post.php'),
(508, '2024-03-04 14:22:33', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0101\',\'元旦\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(509, '2024-03-04 14:22:33', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0104\',\'測試\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(510, '2024-03-04 14:27:41', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'113\';', 'DELETE', '/jp/web_post.php'),
(511, '2024-03-04 14:27:41', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'1201\',\'元旦\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(512, '2024-03-04 14:27:41', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0104\',\'測試\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(513, '2024-03-04 14:28:09', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'113\';', 'DELETE', '/jp/web_post.php'),
(514, '2024-03-04 14:28:09', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0104\',\'測試\',\'例假日\');', 'INSERT', '/jp/web_post.php'),
(515, '2024-03-04 14:28:09', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0101\',\'元旦\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(516, '2024-03-04 14:29:39', '系統管理員', '1', 'Unknown column \'niandu\' in \'where clause\'', 'DELETE FROM attendance  WHERE niandu = \'113\';', 'ERROR', '/jp/web_post.php'),
(517, '2024-03-04 14:35:51', '系統管理員', '1', 'Unknown column \'niandu\' in \'where clause\'', 'DELETE FROM attendance  WHERE niandu = \'115\';', 'ERROR', '/jp/web_post.php'),
(518, '2024-03-04 14:36:20', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'115\';', 'DELETE', '/jp/web_post.php'),
(519, '2024-03-04 17:36:18', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'113\';', 'DELETE', '/jp/web_post.php'),
(520, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0101\',\'開國紀念日\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(521, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0208\',\'小年夜\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(522, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0209\',\'農曆除夕\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(523, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0210\',\'春節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(524, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0211\',\'春節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(525, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0212\',\'春節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(526, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0213\',\'補假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(527, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0214\',\'補假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(528, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0228\',\'和平紀念日\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(529, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0404\',\'兒童節及民族掃墓節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(530, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0405\',\'補假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(531, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0610\',\'端午節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(532, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0917\',\'中秋節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(533, '2024-03-04 17:36:18', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'1010\',\'國慶日\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(534, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0101\',\'開國紀念日\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(535, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0102\',\'補假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(536, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0120\',\'小年夜\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(537, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0121\',\'農曆除夕\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(538, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0122\',\'春節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(539, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0123\',\'春節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(540, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0124\',\'春節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(541, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0125\',\'補假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(542, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0126\',\'補假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(543, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0127\',\'調整放假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(544, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0227\',\'調整放假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(545, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0228\',\'和平紀念日\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(546, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0403\',\'調整放假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(547, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0404\',\'兒童節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(548, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0405\',\'民族掃墓節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(549, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0622\',\'端午節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(550, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0623\',\'調整放假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(551, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0929\',\'中秋節\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(552, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'1009\',\'調整放假\',\'休息日\');', 'INSERT', '/jp/web_post.php'),
(553, '2024-03-04 17:43:59', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'1010\',\'國慶日\',\'休息日\');', 'INSERT', '/jp/web_post.php');
INSERT INTO `sys_mysql_log` (`ML_ID`, `ML_DATE`, `ML_USER`, `ML_DATA_ID`, `ML_COMMENT`, `ML_SQL_CON`, `ML_SQL_EXEC_TYPE`, `ML_EXEC_FILE`) VALUES
(554, '2024-03-04 17:48:28', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'105\',\'0101\',\'\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(555, '2024-03-04 17:50:06', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'105\';', 'DELETE', '/jp/web_post.php'),
(556, '2024-03-04 17:50:06', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'105\',\'0101\',\'元旦\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(557, '2024-03-04 17:50:17', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'105\';', 'DELETE', '/jp/web_post.php'),
(558, '2024-03-05 08:47:21', '', '', '', 'UPDATE sys_admin SET `Admin_Code` = \'5de5d0007c762a77a203093e0803b2b7\',`Admin_LastLogin` = NOW(),`Admin_IP` = \'61.218.134.131\'  WHERE Admin_ID = \'1\';', 'UPDATE', '/jp/system/post/SPOST_Login.php'),
(559, '2024-03-05 08:57:49', '系統管理員', '1', '', 'UPDATE web_company SET `Company_PW` = \'767f2e385cba483c5e3a0f41d9d78cc3\',`Company_RePwd` = \'\',`Company_Is_RePwd` = \'0\'  WHERE (BINARY Company_Acc = \'JBS123\' OR BINARY Company_Email = \'JBS123\') AND (BINARY Company_PW = \'767f2e385cba483c5e3a0f41d9d78cc3\' OR BINARY Company_RePwd = \'767f2e385cba483c5e3a0f41d9d78cc3\');', 'UPDATE', '/jp/web_post.php'),
(560, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0101\',\'開國紀念日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(561, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0122\',\'補行上班\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(562, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0131\',\'農曆除夕\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(563, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0201\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(564, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0202\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(565, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0203\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(566, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0204\',\'調整放假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(567, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0228\',\'和平紀念日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(568, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0404\',\'兒童節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(569, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0405\',\'民族掃墓節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(570, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0603\',\'端午節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(571, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0909\',\'補假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(572, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0910\',\'中秋節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(573, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'1010\',\'國慶日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(574, '2024-03-05 11:25:56', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'111\',\'0501\',\'勞動節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(575, '2024-03-05 11:28:30', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'113\';', 'DELETE', '/jp/web_post.php'),
(576, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0101\',\'開國紀念日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(577, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0208\',\'小年夜\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(578, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0209\',\'農曆除夕\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(579, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0210\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(580, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0211\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(581, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0212\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(582, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0213\',\'補假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(583, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0214\',\'補假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(584, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0217\',\'補行上班\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(585, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0228\',\'和平紀念日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(586, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0404\',\'兒童節及民族掃墓節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(587, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0405\',\'補假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(588, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0610\',\'端午節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(589, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0917\',\'中秋節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(590, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'1010\',\'國慶日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(591, '2024-03-05 11:28:30', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'113\',\'0501\',\'勞動節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(592, '2024-03-05 11:29:52', '系統管理員', '1', '', 'DELETE FROM holidays  WHERE niandu = \'112\';', 'DELETE', '/jp/web_post.php'),
(593, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0101\',\'開國紀念日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(594, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0102\',\'補假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(595, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0107\',\'補行上班\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(596, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0120\',\'小年夜\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(597, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0121\',\'農曆除夕\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(598, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0122\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(599, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0123\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(600, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0124\',\'春節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(601, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0125\',\'補假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(602, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0126\',\'補假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(603, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0127\',\'調整放假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(604, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0204\',\'補行上班\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(605, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0218\',\'補行上班\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(606, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0227\',\'調整放假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(607, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0228\',\'和平紀念日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(608, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0325\',\'補行上班\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(609, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0403\',\'調整放假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(610, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0404\',\'兒童節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(611, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0405\',\'民族掃墓節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(612, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0617\',\'補行上班\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(613, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0622\',\'端午節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(614, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0623\',\'調整放假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(615, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0923\',\'補行上班\',\'工作日\');', 'INSERT', '/jp/web_post.php'),
(616, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0929\',\'中秋節\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(617, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'1009\',\'調整放假\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(618, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'1010\',\'國慶日\',\'國定日\');', 'INSERT', '/jp/web_post.php'),
(619, '2024-03-05 11:29:52', '系統管理員', '1', '', 'INSERT INTO holidays (`niandu`,`holiday`,`holidayName`,`AttendDay`) VALUES (\'112\',\'0501\',\'勞動節\',\'國定日\');', 'INSERT', '/jp/web_post.php');

-- --------------------------------------------------------

--
-- 資料表結構 `sys_tables`
--

DROP TABLE IF EXISTS `sys_tables`;
CREATE TABLE IF NOT EXISTS `sys_tables` (
  `Tables_ID` int UNSIGNED NOT NULL COMMENT '資料庫ID',
  `Tables_Name` varchar(30) DEFAULT NULL COMMENT '資料庫名稱',
  `Tables_Name1` varchar(30) DEFAULT NULL COMMENT '資料庫中文名稱',
  `Tables_Open` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '資料庫啟用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='系統資料庫表';

--
-- 傾印資料表的資料 `sys_tables`
--

INSERT INTO `sys_tables` (`Tables_ID`, `Tables_Name`, `Tables_Name1`, `Tables_Open`) VALUES
(1, 'new_sys_demo', '基本功能DEMO', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `sys_tables_option`
--

DROP TABLE IF EXISTS `sys_tables_option`;
CREATE TABLE IF NOT EXISTS `sys_tables_option` (
  `TO_Name` varchar(30) DEFAULT NULL COMMENT '資料表名稱',
  `TO_Field` varchar(20) DEFAULT NULL COMMENT '資料表欄位',
  `TO_Comment1` varchar(30) DEFAULT NULL COMMENT '欄位註解1',
  `TO_Comment2` varchar(30) DEFAULT NULL COMMENT '欄位註解2',
  `TO_InShow` tinyint UNSIGNED DEFAULT '0' COMMENT '欄位內顯示',
  `TO_InEdit` tinyint UNSIGNED DEFAULT '0' COMMENT '欄位內編輯',
  `TO_OutShow` tinyint UNSIGNED DEFAULT '0' COMMENT '欄位外顯示',
  `TO_OutEdit` tinyint UNSIGNED DEFAULT '0' COMMENT '欄位外編輯',
  `TO_Must` tinyint UNSIGNED DEFAULT '0' COMMENT '欄位必填',
  `TO_InType` varchar(15) DEFAULT NULL COMMENT '欄位種類',
  `TO_ChkType` varchar(15) DEFAULT NULL COMMENT '欄位種類1',
  `TO_NumOpen` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '數字大小啟用',
  `TO_Max` int DEFAULT '0' COMMENT '數字最大值',
  `TO_Min` int DEFAULT '0' COMMENT '數字最小值',
  `TO_ConnectField` varchar(20) DEFAULT NULL COMMENT '相互作用欄位',
  `TO_ConnectField1` varchar(20) DEFAULT NULL COMMENT '互相作用欄位1',
  `TO_SelPicSize` varchar(30) DEFAULT NULL COMMENT '選擇圖片大小',
  `TO_SelStates` varchar(30) DEFAULT NULL COMMENT '欄位狀態選擇',
  `TO_UploadSize` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '欄位上傳大小',
  `TO_TimeFormat` varchar(20) DEFAULT NULL COMMENT '時間格式',
  `TO_Sort` int UNSIGNED DEFAULT '0' COMMENT '欄位排序',
  UNIQUE KEY `TO_Name` (`TO_Name`,`TO_Field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='系統資料表設定';

--
-- 傾印資料表的資料 `sys_tables_option`
--

INSERT INTO `sys_tables_option` (`TO_Name`, `TO_Field`, `TO_Comment1`, `TO_Comment2`, `TO_InShow`, `TO_InEdit`, `TO_OutShow`, `TO_OutEdit`, `TO_Must`, `TO_InType`, `TO_ChkType`, `TO_NumOpen`, `TO_Max`, `TO_Min`, `TO_ConnectField`, `TO_ConnectField1`, `TO_SelPicSize`, `TO_SelStates`, `TO_UploadSize`, `TO_TimeFormat`, `TO_Sort`) VALUES
('web_department', 'Depart_Name', NULL, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1),
('web_department', 'Depart_Sort', NULL, NULL, 1, 1, 1, 0, 0, 'sortdesc', NULL, 1, 99999, 0, NULL, NULL, NULL, NULL, 0, NULL, 96),
('web_department', 'Depart_Open', NULL, NULL, 1, 1, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 97),
('web_Identity', 'IDEN_Title', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_Identity', 'IDEN_Sort', '', '', 1, 1, 1, 1, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 96),
('web_Identity', 'IDEN_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_Identity', 'IDEN_Sdate', '', '', 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_identity', 'IDEN_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_depart', 'Depart_Title', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_depart', 'Depart_Sort', '', '', 1, 1, 1, 1, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 96),
('web_depart', 'Depart_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_depart', 'Depart_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_affidavit', 'AFF_Title', NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0),
('web_affidavit', 'AFF_Intro', NULL, NULL, 1, 1, 0, 0, 0, 'textarea', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 2),
('web_affidavit', 'AFF_Sort', NULL, NULL, 1, 1, 1, 1, 0, 'sortdesc', NULL, 1, 99999, 0, NULL, NULL, NULL, NULL, 0, NULL, 96),
('web_affidavit', 'AFF_Open', NULL, NULL, 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, 'open_states', 0, NULL, 97),
('web_affidavit', 'AFF_Sdate', NULL, NULL, 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 99),
('web_affidavit', 'AFF_Edate', NULL, NULL, 1, 0, 1, 0, 0, 'dateedit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 98),
('web_equipment', 'EQU_Title', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_equipment', 'EQU_Sort', '', '', 1, 1, 1, 1, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 96),
('web_equipment', 'EQU_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_equipment', 'EQU_Sdate', '', '', 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_equipment', 'EQU_Edate', '', '', 1, 0, 1, 0, 0, 'dateedit', NULL, 0, 0, 0, '', '', '', '', 0, '', 98),
('web_equipment', 'EQU_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_equipment', 'EQU_Intro', NULL, NULL, 1, 1, 0, 0, 0, 'textarea', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 2),
('web_equipment', 'EQU_Unit', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 10),
('web_control_table', 'Contrl_Title', NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0),
('web_control_table', 'Contrl_Sdate', NULL, NULL, 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 99),
('web_control_table', 'Contrl_Edate', NULL, NULL, 1, 0, 1, 0, 0, 'dateedit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 98),
('web_control_table', 'Contrl_Sdate2', NULL, NULL, 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 99),
('web_control_table', 'Contrl_Edate2', NULL, NULL, 1, 0, 1, 0, 0, 'dateedit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 98),
('web_jobtitel', 'JT_Title', NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0),
('web_jobtitel', 'JT_Sort', NULL, NULL, 1, 1, 1, 1, 0, 'sortdesc', NULL, 1, 99999, 0, NULL, NULL, NULL, NULL, 0, NULL, 96),
('web_jobtitel', 'JT_Open', NULL, NULL, 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, 'open_states', 0, NULL, 97),
('web_jobtitel', 'JT_Sdate', NULL, NULL, 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 99),
('web_equ_group', 'EG_Name', NULL, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1),
('web_equ_group', 'EG_Sort', NULL, NULL, 1, 1, 1, 0, 0, 'sortdesc', NULL, 1, 99999, 0, NULL, NULL, NULL, NULL, 0, NULL, 96),
('web_equ_group', 'EG_Open', NULL, NULL, 1, 1, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 97),
('web_handover', 'HD_Sdate', NULL, NULL, 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 99),
('web_workplace', 'WP_Name', NULL, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1),
('web_workplace', 'WP_Sort', NULL, NULL, 1, 1, 1, 0, 0, 'sortdesc', NULL, 1, 99999, 0, NULL, NULL, NULL, NULL, 0, NULL, 96),
('web_workplace', 'WP_Open', NULL, NULL, 1, 1, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 97),
('web_schedule', 'SC_Title', NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0),
('web_schedule', 'SC_Sdate', NULL, NULL, 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 99),
('web_commandlist', 'Command_Title', NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0),
('web_commandlist', 'Command_Sdate', NULL, NULL, 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 99),
('web_commandlist', 'Command_Edate', NULL, NULL, 1, 0, 1, 0, 0, 'dateedit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 98),
('web_news', 'News_Title', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_news', 'News_Content', '', '', 1, 1, 0, 0, 0, 'textedit', NULL, 0, 0, 0, '', '', '', '', 0, '', 3),
('web_news', 'News_Mcp', '', '( 建議尺寸 600 * 450 )', 1, 1, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 5),
('web_news', 'News_Sort', '', '', 1, 1, 1, 1, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 96),
('web_news', 'News_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_news', 'News_Sdate', '', '', 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_news', 'NewsC_ID', '', '', 1, 1, 1, 0, 0, 'select', NULL, 0, 0, 0, '', '', '', '0', 0, '', 1),
('web_newsclass', 'NewsC_Name', NULL, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1),
('web_newsclass', 'NewsC_Sort', NULL, NULL, 1, 1, 1, 0, 0, 'sortdesc', NULL, 1, 99999, 0, NULL, NULL, NULL, NULL, 0, NULL, 96),
('web_newsclass', 'NewsC_Open', NULL, NULL, 1, 1, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 97),
('web_abouts', 'Abouts_Name', '', '', 1, 1, 0, 0, 1, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_abouts', 'Abouts_Sort', '', '', 1, 1, 1, 0, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 96),
('web_abouts', 'Abouts_Open', '', '', 1, 1, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 97),
('web_abouts', 'Abouts_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_abouts', 'Abouts_Lv', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_abouts', 'Abouts_UpMID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_abouts', 'Abouts_Content', NULL, NULL, 1, 1, 0, 0, 0, 'textedit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 3),
('web_qa', 'QA_Name', '', '', 1, 1, 0, 0, 1, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_qa', 'QA_Sort', '', '', 1, 1, 1, 0, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 96),
('web_qa', 'QA_Open', '', '', 1, 1, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 97),
('web_qa', 'QA_Content', '', '', 1, 1, 0, 0, 0, 'textedit', NULL, 0, 0, 0, '', '', '', '', 0, '', 3),
('web_qa', 'QA_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_qa', 'QA_Lv', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_qa', 'QA_UpMID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_contact', 'CT_Name', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_contact', 'CT_Tel', '', '', 1, 0, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_contact', 'CT_Mobile', '', '', 0, 0, 0, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 2),
('web_contact', 'CT_Email', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 3),
('web_contact', 'CT_Address', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 4),
('web_contact', 'CT_Title', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 5),
('web_contact', 'CT_Content', '', '', 1, 0, 0, 0, 0, 'textarea', NULL, 0, 0, 0, '', '', '', '', 0, '', 6),
('web_contact', 'CT_Sdate', '', '', 1, 0, 1, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_product', 'Product_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_product', 'Product_Name', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_product', 'Product_Intro', '', '', 1, 1, 0, 0, 0, 'textarea', NULL, 0, 0, 0, '', '', '', '', 0, '', 3),
('web_product', 'Product_Content', '', '', 1, 1, 0, 0, 0, 'textedit', NULL, 0, 0, 0, '', '', '', '', 0, '', 4),
('web_product', 'Product_Unit', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 5),
('web_product', 'Product_Price', '', '', 1, 1, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 6),
('web_product', 'Product_Price1', '', '', 1, 1, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 7),
('web_product', 'Product_Mcp', '', '( 建議尺寸 600 * 450 )', 1, 1, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 8),
('web_product', 'Product_Img1', '', '( 建議尺寸 600 * 450 )', 1, 1, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 9),
('web_product', 'Product_Img2', '', '( 建議尺寸 600 * 450 )', 1, 1, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 10),
('web_product', 'Product_Img3', '', '( 建議尺寸 600 * 450 )', 1, 1, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 11),
('web_product', 'Product_Img4', '', '( 建議尺寸 XXX * XXX )', 1, 1, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 9),
('web_product', 'Product_Sort', '', '', 1, 1, 1, 1, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 95),
('web_product', 'Product_OpenNew', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 96),
('web_product', 'Product_OpenHot', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_product', 'Product_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 98),
('web_product', 'Product_Sdate', '', '', 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_product', 'ProductC_ID', '', '', 1, 1, 1, 0, 0, 'select', NULL, 0, 0, 0, '', '', '', '0', 0, '', 2),
('web_productclass', 'ProductC_Name', NULL, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1),
('web_productclass', 'ProductC_Sort', NULL, NULL, 1, 1, 1, 0, 0, 'sortdesc', NULL, 1, 99999, 0, NULL, NULL, NULL, NULL, 0, NULL, 96),
('web_productclass', 'ProductC_Open', NULL, NULL, 1, 1, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 97),
('web_member', 'Member_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_member', 'Member_Acc', '', '', 1, 1, 0, 0, 0, 'unique', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_member', 'Member_Pwd', '', '( 輸入新密碼, 儲存後直接更新密碼 )', 1, 1, 0, 0, 0, 'password', NULL, 0, 0, 0, '', '', '', '', 0, '', 2),
('web_member', 'Member_Email', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 5),
('web_member', 'Member_Name', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 3),
('web_member', 'Member_Sex', '', '', 1, 1, 0, 0, 0, 'radio', NULL, 0, 0, 0, '', '', '', 'gender_states', 0, '', 4),
('web_member', 'Member_Birthday', NULL, NULL, 1, 1, 0, 0, 0, 'datestart', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 'YYYY-MM-DD', 6),
('web_member', 'Member_Tel', '', '', 0, 0, 0, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 7),
('web_member', 'Member_Mobile', '', '', 1, 1, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 8),
('web_member', 'Member_Fax', NULL, NULL, 1, 1, 0, 0, 0, 'number', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 9),
('web_member', 'Member_Company', NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 10),
('web_member', 'Member_Uniform', NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 11),
('web_member', 'Member_City', '', '', 1, 1, 0, 0, 0, 'city', NULL, 0, 0, 0, 'Member_County', 'Member_Zipcode', '', '', 0, '', 12),
('web_member', 'Member_County', '', '', 1, 1, 0, 0, 0, 'county', NULL, 0, 0, 0, '', '', '', '', 0, '', 13),
('web_member', 'Member_Address', '', '', 1, 1, 0, 0, 0, 'address', NULL, 0, 0, 0, '', 'Member_Zipcode', '', '', 0, '', 15),
('web_member', 'Member_Intro', NULL, NULL, 1, 1, 0, 0, 0, 'textarea', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 16),
('web_member', 'Member_Sdate', '', '', 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 19),
('web_member', 'Member_Edate', '', '', 0, 0, 0, 0, 0, 'dateedit', NULL, 0, 0, 0, '', '', '', '', 0, '', 17),
('web_member', 'Member_LastLogin', '', '', 1, 0, 0, 0, 0, 'datestart', NULL, 0, 0, 0, '', '', '', '', 0, 'YYYY-MM-DD HH:mm:ss', 18),
('web_member', 'Member_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 20),
('web_member', 'Member_Emailauth', NULL, NULL, 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 21),
('web_delivery', 'Delivery_Name', '', '', 1, 0, 1, 0, 1, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_delivery', 'Delivery_Price', '', '', 1, 1, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_delivery', 'Delivery_Free', '', '', 1, 1, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 2),
('web_delivery', 'Delivery_Sort', '', '', 0, 0, 0, 0, 0, 'sortdesc', NULL, 0, 99999, 0, '', '', '', '', 0, '', 96),
('web_delivery', 'Delivery_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_delivery', 'Delivery_Sdate', '', '', 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_delivery', 'Delivery_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_VideoList', 'Videos_Name', '', '', 1, 1, 0, 0, 1, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_VideoList', 'Videos_Sort', '', '', 1, 1, 1, 0, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 96),
('web_VideoList', 'Videos_Open', '', '', 1, 1, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 97),
('web_videolist', 'Videos_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_videolist', 'Videos_Lv', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_videolist', 'Videos_UpMID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_videolist', 'Videos_File', NULL, '', 1, 1, 1, 0, 0, 'uploadfile', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 7),
('web_member', 'Member_Zipcode', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_member', 'Member_FBID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_member', 'Member_GoogleID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_contact', 'CT_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_contact', 'CT_Verify', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_banner', 'Banner_Title', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_banner', 'Banner_Mcp', '', '( 建議尺寸 1263 * 377 )', 1, 1, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 5),
('web_banner', 'Banner_Sort', '', '', 1, 1, 1, 1, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 96),
('web_banner', 'Banner_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_banner', 'Banner_Sdate', '', '', 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_news', 'News_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_ad', 'Ad_Title', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_ad', 'Ad_Intro', '', '', 0, 0, 0, 0, 0, 'textarea', NULL, 0, 0, 0, '', '', '', '', 0, '', 2),
('web_index_ad', 'Ad_Sort', '', '', 0, 0, 0, 0, 0, 'sortdesc', NULL, 0, 99999, 0, '', '', '', '', 0, '', 96),
('web_index_ad', 'Ad_Open', '', '', 0, 0, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_index_ad', 'Ad_Sdate', '', '', 0, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_index_ad', 'Ad_Mcp', '', '', 0, 0, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 5),
('web_index_ad', 'Ad_Qty', '', '', 0, 0, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_index_adl', 'Adl_Title', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_adl', 'Adl_Intro', '', '', 0, 0, 0, 0, 0, 'textarea', NULL, 0, 0, 0, '', '', '', '', 0, '', 2),
('web_index_adl', 'Adl_Sort', '', '', 1, 1, 0, 0, 0, 'sortdesc', NULL, 1, 99999, 0, '', '', '', '', 0, '', 0),
('web_index_adl', 'Adl_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_index_adl', 'Adl_Sdate', '', '', 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_index_adl', 'Adl_Img', '', '', 1, 0, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 0),
('web_index_ad', 'Ad_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_ad', 'Ad_Img', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_adl', 'Adl_Link', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 4),
('web_index_adl', 'Adl_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_adl', 'Ad_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_adl', 'Adl_LinkT', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_album', 'Indalb_Title', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_album', 'Indalb_Intro', '', '', 0, 0, 0, 0, 0, 'textarea', NULL, 0, 0, 0, '', '', '', '', 0, '', 2),
('web_index_album', 'Indalb_Sort', '', '', 0, 0, 0, 0, 0, 'sortdesc', NULL, 0, 99999, 0, '', '', '', '', 0, '', 96),
('web_index_album', 'Indalb_Open', '', '', 0, 0, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 97),
('web_index_album', 'Indalb_Sdate', '', '', 0, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 99),
('web_index_album', 'Indalb_Mcp', '', '', 0, 0, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 5),
('web_index_album', 'Indalb_Qty', '', '', 0, 0, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_index_albuml', 'Indalbl_Title', NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0),
('web_index_albuml', 'Indalbl_Intro', NULL, NULL, 1, 1, 0, 0, 0, 'textarea', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 2),
('web_index_albuml', 'Indalbl_Sort', NULL, NULL, 1, 1, 0, 0, 0, 'sortdesc', NULL, 1, 99999, 0, NULL, NULL, NULL, NULL, 0, NULL, 0),
('web_index_albuml', 'Indalbl_Open', NULL, NULL, 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, NULL, NULL, NULL, 'open_states', 0, NULL, 97),
('web_index_albuml', 'Indalbl_Sdate', NULL, NULL, 1, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 99),
('web_index_albuml', 'Indalbl_Img', NULL, NULL, 1, 0, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0),
('web_index_album', 'Indalb_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_index_album', 'Indalb_Img', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_banner', 'Banner_Link', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 4),
('web_function', 'Func_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_function', 'Func_Title', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_function', 'Func_Intro', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_function', 'Func_Link', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_function', 'Func_Sort', '', '', 0, 0, 0, 0, 0, 'sortdesc', NULL, 0, 99999, 0, '', '', '', '', 0, '', 0),
('web_function', 'Func_Open', '', '', 1, 1, 1, 1, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', 'open_states', 0, '', 0),
('web_delivery', 'Delivery_Limit', '', '', 1, 1, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 3),
('web_banner', 'Banner_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_banner', 'Banner_LinkT', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_productclass', 'ProductC_Mcp', '', '( 建議尺寸 600 * 450 )', 1, 1, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 8),
('web_productclass', 'ProductC_Img1', '', '( 建議尺寸 600 * 450 )', 1, 1, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 9),
('web_productclass', 'ProductC_Img2', '', '( 建議尺寸 600 * 450 )', 1, 1, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 10),
('web_productclass', 'ProductC_Img3', '', '( 建議尺寸 600 * 450 )', 1, 1, 0, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 11),
('web_company', 'Company_bid', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_PW', '( 輸入新密碼, 儲存後直接更新密碼 )', '', 1, 1, 0, 0, 0, 'password', NULL, 0, 0, 0, '', '', '', '', 0, '', 2),
('web_company', 'Company_NAME', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 3),
('web_company', 'Company_EDITORIAL', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 4),
('web_company', 'Company_CTEL', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 5),
('web_company', 'Company_ADDRESS', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 7),
('web_company', 'Industry_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_PER', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 8),
('web_company', 'Company_TEL', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 9),
('web_company', 'Company_EMAIL', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 6),
('web_company', 'Company_NDATE', '', '', 1, 0, 0, 0, 0, 'datestart', NULL, 0, 0, 0, '', '', '', '', 0, 'YYYY-MM-DD HH:mm:ss', 15),
('web_company', 'Company_EDATE', '', '', 0, 0, 0, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_VERSION', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_END', '', '', 1, 1, 0, 0, 0, 'dateend', NULL, 0, 0, 0, '', '', '', '', 0, 'YYYY-MM-DD HH:mm:ss', 16),
('web_company', 'Company_OPEN', '', '', 1, 1, 1, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 18),
('web_coupon', 'Coupon_ID', '', '', 1, 1, 1, 0, 0, 'unique', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_coupon', 'Coupon_CID', '', '', 1, 1, 1, 0, 0, 'unique', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_coupon', 'Coupon_SID', '', '', 1, 1, 1, 0, 0, 'unique', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_coupon', 'Coupon_Title', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_coupon', 'Coupon_Content', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_coupon', 'Coupon_Logo', '', '', 1, 1, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 0),
('web_coupon', 'Coupon_Uploadimg', '', '', 1, 1, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 0),
('web_coupon', 'Coupon_Start_date', '', '', 1, 1, 1, 0, 0, 'datestart', NULL, 0, 0, 0, '', '', '', '', 0, 'YYYY-MM-DD HH:mm:ss', 0),
('web_coupon', 'Coupon_End_date', '', '', 1, 1, 1, 0, 0, 'dateend', NULL, 0, 0, 0, '', '', '', '', 0, 'YYYY-MM-DD HH:mm:ss', 0),
('web_coupon', 'Coupon_Open', '', '', 1, 1, 1, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 0),
('web_coupon', 'Coupon_Sdate', '', '', 1, 0, 1, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_customer_coupon', 'CC_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_customer_coupon', 'CC_Coup_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_customer_coupon', 'CC_Enable', '', '', 0, 0, 0, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 0),
('web_customer_coupon', 'CC_usedate', '', '', 0, 0, 0, 0, 0, 'dateedit', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_ID', '', '', 1, 0, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_CID', '', '', 1, 0, 1, 0, 0, 'number', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Attr', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Industry', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Business', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Title', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Subtitle', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Tag', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Version', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Logo', '', '', 1, 0, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 0),
('web_survey', 'Survey_Banner', '', '', 1, 0, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 0),
('web_survey', 'Survey_Backgroundimg', '', '', 1, 0, 1, 0, 0, 'uploadimg', NULL, 0, 0, 0, '', '', '0', '', 0, '', 0),
('web_survey', 'Survey_CoupID', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Open', '', '', 1, 0, 1, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 0),
('web_survey', 'Survey_Sdate', '', '', 1, 0, 1, 0, 0, 'datecreat', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_Plan', '', '', 1, 1, 0, 0, 0, 'select', NULL, 0, 0, 0, '', '', '', 'plan', 0, '', 11),
('web_company', 'Company_Pay_Type', '', '', 1, 1, 0, 0, 0, 'select', NULL, 0, 0, 0, '', '', '', 'pay_type', 0, '', 12),
('web_company', 'Company_Invoice_Addr', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_Invoice_Type', '', '', 1, 1, 0, 0, 0, 'select', NULL, 0, 0, 0, '', '', '', 'invoice_type', 0, '', 13),
('web_company', 'Company_Is_Pay', '', '', 1, 1, 1, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 17),
('web_company', 'Company_Acc', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_member', 'Member_Verify', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_member', 'Member_Line_id', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_member', 'Member_RePwd', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_member', 'Member_Is_RePwd', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_RePwd', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_Is_RePwd', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company', 'Company_Verify', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Ttitle_Color', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_survey', 'Survey_Bg_Color', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company_splan', 'CS_ID', '', '', 0, 0, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 0),
('web_company_splan', 'CS_CID', '', '', 1, 0, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 1),
('web_company_splan', 'CS_Plan', '', '', 1, 1, 0, 0, 0, 'select', NULL, 0, 0, 0, '', '', '', 'plan', 0, '', 2),
('web_company_splan', 'CS_Invoice_type', '', '', 1, 1, 0, 0, 0, 'select', NULL, 0, 0, 0, '', '', '', 'invoice_type', 0, '', 3),
('web_company_splan', 'CS_Invoice_Address', '', '', 1, 1, 1, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 4),
('web_company_splan', 'CS_Is_Pay', '', '', 1, 1, 1, 0, 0, 'checkbox', NULL, 0, 0, 0, '', '', '', '0', 0, '', 5),
('web_company_splan', 'CS_Sdate', '', '', 1, 0, 1, 0, 0, 'datestart', NULL, 0, 0, 0, '', '', '', '', 0, 'YYYY-MM-DD HH:mm:ss', 6),
('web_company', 'Company_IndepID', '', '', 1, 1, 0, 0, 0, '', NULL, 0, 0, 0, '', '', '', '', 0, '', 11);

-- --------------------------------------------------------

--
-- 資料表結構 `sys_web_option`
--

DROP TABLE IF EXISTS `sys_web_option`;
CREATE TABLE IF NOT EXISTS `sys_web_option` (
  `Admin_ID` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理者',
  `WO_Name` varchar(20) DEFAULT NULL COMMENT '公司名稱',
  `WO_Addr` varchar(10) DEFAULT NULL COMMENT '縣市',
  `WO_Addr1` varchar(10) DEFAULT NULL COMMENT '區域',
  `WO_Addr2` varchar(100) DEFAULT NULL COMMENT '地址',
  `WO_Tel` varchar(20) DEFAULT NULL COMMENT '公司電話',
  `WO_Tel1` varchar(20) DEFAULT NULL COMMENT '公司手機',
  `WO_Fax` varchar(12) DEFAULT NULL COMMENT '公司傳真',
  `WO_Email` varchar(60) DEFAULT NULL COMMENT '公司信箱',
  `WO_OpenTime` text COMMENT '營業時間',
  `WO_Idn` varchar(8) DEFAULT NULL COMMENT '公司統編',
  `WO_About` text COMMENT '關於我們',
  `WO_Privacy` text COMMENT '隱私權政策',
  `WO_Title` varchar(35) DEFAULT NULL COMMENT '網站標題',
  `WO_Url` varchar(100) DEFAULT NULL COMMENT '網站網址',
  `WO_FBLink` varchar(100) DEFAULT NULL COMMENT 'Facebook',
  `WO_IGLink` varchar(100) DEFAULT NULL COMMENT 'Instagram',
  `WO_LineLink` varchar(100) DEFAULT NULL COMMENT 'LineID',
  `WO_Youtube` varchar(12) DEFAULT NULL COMMENT 'Youtube影片碼',
  `WO_YoutubeLink` varchar(100) DEFAULT NULL COMMENT 'Youtube影片連結',
  `WO_Description` text COMMENT '網站介紹',
  `WO_Keywords` tinytext COMMENT '網站關鍵字',
  `WO_GMAP` text COMMENT 'Google MAP',
  `WO_GMAP_Link` text COMMENT 'GOOGLE地圖連結',
  `WO_GAnalytics` text COMMENT 'Google Analytics',
  `WO_MapLat` varchar(20) DEFAULT NULL COMMENT '地圖北緯',
  `WO_MapLng` varchar(20) DEFAULT NULL COMMENT '地圖東經',
  `WO_Open` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '網站開啟',
  `WO_Debug` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '網站Debug',
  `WO_StmpHost` varchar(100) DEFAULT NULL COMMENT '郵件伺服器(SMTP)',
  `WO_StmpPort` varchar(6) DEFAULT NULL COMMENT '郵件伺服器(PORT)',
  `WO_SendName` varchar(20) DEFAULT NULL COMMENT '寄件者名稱',
  `WO_SendEmail` varchar(60) DEFAULT NULL COMMENT '寄件者Email',
  `WO_StmpAuth` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '啟用驗證',
  `WO_StmpAcc` varchar(30) DEFAULT NULL COMMENT '驗證帳號',
  `WO_StmpPass` varchar(30) DEFAULT NULL COMMENT '驗證密碼',
  `WO_StmpSecure` varchar(3) DEFAULT NULL COMMENT '加密方式',
  `WO_AddrName` varchar(20) DEFAULT NULL COMMENT '測試收件者名稱',
  `WO_AddrEmail` varchar(60) DEFAULT NULL COMMENT '測試收件者信箱',
  `WO_MailSubject` varchar(100) DEFAULT NULL COMMENT '測試信件主題',
  `WO_MailBody` text COMMENT '測試信件內容',
  `WO_Version` varchar(20) DEFAULT NULL COMMENT '目前版本',
  `WO_LOGO` varchar(60) DEFAULT NULL COMMENT '網站LOGO',
  `WO_LOGO2` varchar(60) DEFAULT NULL COMMENT '後台登入頁LOGO',
  `WO_favicon` varchar(60) DEFAULT NULL COMMENT '網址小圖標',
  `WO_ShareIcon` varchar(60) DEFAULT NULL COMMENT '社群分享預覽圖',
  `WO_FooterImg` varchar(60) DEFAULT NULL COMMENT '版尾廣告圖上傳',
  `WO_FooterLOGO` varchar(60) DEFAULT NULL COMMENT '版尾LOGO',
  PRIMARY KEY (`Admin_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='網站資料設定';

--
-- 傾印資料表的資料 `sys_web_option`
--

INSERT INTO `sys_web_option` (`Admin_ID`, `WO_Name`, `WO_Addr`, `WO_Addr1`, `WO_Addr2`, `WO_Tel`, `WO_Tel1`, `WO_Fax`, `WO_Email`, `WO_OpenTime`, `WO_Idn`, `WO_About`, `WO_Privacy`, `WO_Title`, `WO_Url`, `WO_FBLink`, `WO_IGLink`, `WO_LineLink`, `WO_Youtube`, `WO_YoutubeLink`, `WO_Description`, `WO_Keywords`, `WO_GMAP`, `WO_GMAP_Link`, `WO_GAnalytics`, `WO_MapLat`, `WO_MapLng`, `WO_Open`, `WO_Debug`, `WO_StmpHost`, `WO_StmpPort`, `WO_SendName`, `WO_SendEmail`, `WO_StmpAuth`, `WO_StmpAcc`, `WO_StmpPass`, `WO_StmpSecure`, `WO_AddrName`, `WO_AddrEmail`, `WO_MailSubject`, `WO_MailBody`, `WO_Version`, `WO_LOGO`, `WO_LOGO2`, `WO_favicon`, `WO_ShareIcon`, `WO_FooterImg`, `WO_FooterLOGO`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'smtp.gmail.com', '465', '小明', 'sfb122405@gmail.com', 1, 'b9413077@gmail.com', 'zdiwuwoiliqzvxeo', 'SSL', '王大明', 'sfb122405@gmail.com', '這是gmail測試寄信', '這是gmail測試寄信內容', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'JP雲端出勤任意打卡平台', '0', '0', '中工二路120號', '04-23586802', '', '0', 'bm888@ms39.hinet.net', '早上10：00~晚上22：00', NULL, NULL, '', 'JP雲端出勤任意打卡平台', 'http://localhost/jp/', 'https://www.facebook.com/jbscloudbusinesssoftware', '', '', NULL, '', 'JP雲端出勤任意打卡平台', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3639.809862072403!2d120.61331897611298!3d24.178400178380745!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346915ff68fbd3f3%3A0xd8eaff09a7c70a3d!2zNDA35Y-w5Lit5biC6KW_5bGv5Y2A5Lit5bel5LqM6LevMTIw6Jmf!5e0!3m2!1szh-TW!2stw!4v1694596684280!5m2!1szh-TW!2stw\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'https://goo.gl/maps/25a3Wnv8c69mAT926', NULL, NULL, NULL, 0, 0, 'smtp.gmail.com', '465', 'Ai2Bi', 'sfb122405@gmail.com', 1, 'bmidp888@gmail.com', 'fhgxltgnumjgvnmo', 'SSL', '王大明', 'sfb122405@gmail.com', '這是gmail測試寄信', '這是gmail測試寄信內容', '20201124095325', 'WO_LOGO1694596451.png', 'WO_LOGO21694597050.png', NULL, NULL, 'WO_FooterImg1605163215.jpg', 'WO_FooterLOGO1694596510.png');

-- --------------------------------------------------------

--
-- 資料表結構 `web_abouts`
--

DROP TABLE IF EXISTS `web_abouts`;
CREATE TABLE IF NOT EXISTS `web_abouts` (
  `Abouts_ID` varchar(11) NOT NULL COMMENT '分類編號',
  `Abouts_Name` varchar(20) DEFAULT NULL COMMENT '故事標題',
  `Abouts_Lv` tinyint UNSIGNED DEFAULT '1' COMMENT '目錄層級',
  `Abouts_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Abouts_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '顯示',
  `Abouts_UpMID` varchar(11) DEFAULT NULL COMMENT '上層目錄ID',
  `Abouts_Content` text COMMENT '內容',
  PRIMARY KEY (`Abouts_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_abouts`
--

INSERT INTO `web_abouts` (`Abouts_ID`, `Abouts_Name`, `Abouts_Lv`, `Abouts_Sort`, `Abouts_Open`, `Abouts_UpMID`, `Abouts_Content`) VALUES
('Ab0002', '公司簡介', 1, 3, 1, NULL, '<div style=\"text-align:center\"><em>何か書いて</em>ください</div>\r\n\r\n<div><br />\r\n&nbsp;</div>'),
('Ab0003', '其他', 1, 1, 1, NULL, '<em>何か書いて</em>ください'),
('Ab0004', '關於我們', 1, 2, 1, NULL, '<div style=\"text-align:center\"><em>何か書いて</em>ください</div>');

-- --------------------------------------------------------

--
-- 資料表結構 `web_banner`
--

DROP TABLE IF EXISTS `web_banner`;
CREATE TABLE IF NOT EXISTS `web_banner` (
  `Banner_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Banner_Title` varchar(60) DEFAULT NULL COMMENT '輪播標題',
  `Banner_Mcp` varchar(60) DEFAULT NULL COMMENT '輪播圖',
  `Banner_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Banner_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  `Banner_Sdate` datetime DEFAULT NULL COMMENT '建立時間',
  `Banner_LinkT` tinyint UNSIGNED DEFAULT '0' COMMENT '連結跳轉目標',
  `Banner_Link` varchar(100) DEFAULT NULL COMMENT '連結',
  PRIMARY KEY (`Banner_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_company`
--

DROP TABLE IF EXISTS `web_company`;
CREATE TABLE IF NOT EXISTS `web_company` (
  `Company_bid` int NOT NULL AUTO_INCREMENT,
  `Company_ID` varchar(20) DEFAULT NULL COMMENT '公司編號',
  `Company_Acc` varchar(50) DEFAULT NULL COMMENT '公司帳號',
  `Company_PW` varchar(50) DEFAULT NULL COMMENT '公司密碼',
  `Company_RePwd` varchar(32) DEFAULT NULL COMMENT '忘記密碼專用',
  `Company_Is_RePwd` tinyint UNSIGNED DEFAULT '0' COMMENT '是否使用忘記密碼',
  `Company_NAME` varchar(10) DEFAULT NULL COMMENT '公司名稱',
  `Company_EDITORIAL` varchar(8) DEFAULT NULL COMMENT '公司統編',
  `Company_CTEL` varchar(20) DEFAULT NULL COMMENT '公司電話',
  `Company_ADDRESS` varchar(60) DEFAULT NULL COMMENT '公司地址',
  `Company_PER` varchar(10) DEFAULT NULL COMMENT '公司負責人',
  `Company_TEL` varchar(20) DEFAULT NULL COMMENT '負責人電話',
  `Company_EMAIL` varchar(68) DEFAULT NULL COMMENT '公司E-MAIL',
  `Company_NDATE` datetime DEFAULT NULL COMMENT '加入日期',
  `Company_EDATE` datetime DEFAULT NULL COMMENT '修改日期',
  `Company_END` varchar(20) DEFAULT NULL COMMENT '到期日',
  `Company_Plan` int UNSIGNED DEFAULT '0' COMMENT '方案選擇',
  `Company_Pay_Type` int UNSIGNED DEFAULT '0' COMMENT '付款方式',
  `Company_Invoice_Title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '發票抬頭',
  `Company_Invoice_Address` varchar(150) DEFAULT NULL COMMENT '發票地址',
  `Company_Invoice_Type` int UNSIGNED DEFAULT '0' COMMENT '發票形式',
  `Company_Is_Pay` tinyint UNSIGNED DEFAULT '0' COMMENT '是否付款',
  `Company_Verify` varchar(150) DEFAULT NULL COMMENT '驗證碼',
  `Company_OPEN` tinyint(1) DEFAULT NULL COMMENT '帳號啟用',
  PRIMARY KEY (`Company_bid`),
  KEY `Company_Acc` (`Company_Acc`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_company`
--

INSERT INTO `web_company` (`Company_bid`, `Company_ID`, `Company_Acc`, `Company_PW`, `Company_RePwd`, `Company_Is_RePwd`, `Company_NAME`, `Company_EDITORIAL`, `Company_CTEL`, `Company_ADDRESS`, `Company_PER`, `Company_TEL`, `Company_EMAIL`, `Company_NDATE`, `Company_EDATE`, `Company_END`, `Company_Plan`, `Company_Pay_Type`, `Company_Invoice_Title`, `Company_Invoice_Address`, `Company_Invoice_Type`, `Company_Is_Pay`, `Company_Verify`, `Company_OPEN`) VALUES
(109, 'C2312150001', 'JBS123', '767f2e385cba483c5e3a0f41d9d78cc3', '', 0, '華越資訊', '25686802', '09132456789', '台中市', '測試', '0912345678', 'kerry19820813@gmail.com', '2023-12-15 16:22:34', '2023-12-29 16:29:35', '2024-02-10 11:19:30', 1, 0, NULL, '407台中市西屯區中工二路120號', 1, 1, 'CT657C0CCA', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `web_contact`
--

DROP TABLE IF EXISTS `web_contact`;
CREATE TABLE IF NOT EXISTS `web_contact` (
  `CT_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `CT_Name` varchar(30) DEFAULT NULL COMMENT '聯絡人',
  `CT_Tel` varchar(20) DEFAULT NULL COMMENT '聯絡電話',
  `CT_Mobile` varchar(20) DEFAULT NULL COMMENT '聯絡手機',
  `CT_Email` varchar(100) DEFAULT NULL COMMENT '電子信箱',
  `CT_Address` varchar(100) DEFAULT NULL COMMENT '聯絡地址',
  `CT_Title` varchar(60) DEFAULT NULL COMMENT '標題',
  `CT_Verify` varchar(60) DEFAULT NULL COMMENT '辨別碼',
  `CT_Content` text COMMENT '詳細內容',
  `CT_Sdate` datetime DEFAULT NULL COMMENT '建立時間',
  PRIMARY KEY (`CT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_delivery`
--

DROP TABLE IF EXISTS `web_delivery`;
CREATE TABLE IF NOT EXISTS `web_delivery` (
  `Delivery_ID` varchar(5) NOT NULL,
  `Delivery_Name` varchar(30) DEFAULT NULL COMMENT '付款方式',
  `Delivery_Type` varchar(10) DEFAULT '0' COMMENT '類型',
  `Delivery_Free` int DEFAULT '0' COMMENT '免運金額',
  `Delivery_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Delivery_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  `Delivery_Sdate` datetime DEFAULT NULL COMMENT '建立時間',
  PRIMARY KEY (`Delivery_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_delivery`
--

INSERT INTO `web_delivery` (`Delivery_ID`, `Delivery_Name`, `Delivery_Type`, `Delivery_Free`, `Delivery_Sort`, `Delivery_Open`, `Delivery_Sdate`) VALUES
('DT01', '線上刷卡一次付清', 'Credit', 0, 99, 0, '2017-12-05 11:38:08'),
('DT02', 'ATM轉帳', 'ATM', 0, 98, 0, '2017-12-05 11:38:22'),
('DT03', '臨櫃匯款', 'Transfer', 0, 97, 1, '2021-07-30 11:38:22');

-- --------------------------------------------------------

--
-- 資料表結構 `web_function`
--

DROP TABLE IF EXISTS `web_function`;
CREATE TABLE IF NOT EXISTS `web_function` (
  `Func_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Func_Name` varchar(60) DEFAULT NULL COMMENT '標題',
  `Func_Intro` varchar(255) DEFAULT NULL COMMENT '簡介',
  `Func_Link` varchar(100) DEFAULT NULL COMMENT '連結',
  `Func_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Func_Lv` int DEFAULT NULL,
  `Func_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  PRIMARY KEY (`Func_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2011180 DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_function`
--

INSERT INTO `web_function` (`Func_ID`, `Func_Name`, `Func_Intro`, `Func_Link`, `Func_Sort`, `Func_Lv`, `Func_Open`) VALUES
(2011171, '關於我們', '關於我們', 'about', 0, 1, 1),
(2011172, '最新消息', '消息公告', 'news', 0, 1, 1),
(2011173, '聯絡我們', '介紹商品、不帶購物功能', 'contact', 0, 1, 1),
(2011174, '隱私權政策', '連絡表單\r\ngoogle地圖\r\n聯絡資訊', 'privacy', 0, 1, 1),
(2011175, '購物須知', '相簿列表', 'qa', 0, 1, 1),
(2011176, '所有商品', '型錄或介紹等等可供下載的地方', 'product', 0, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `web_index_ad`
--

DROP TABLE IF EXISTS `web_index_ad`;
CREATE TABLE IF NOT EXISTS `web_index_ad` (
  `Ad_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Ad_Title` varchar(60) DEFAULT NULL COMMENT '相簿標題',
  `Ad_Intro` varchar(255) DEFAULT NULL COMMENT '相簿簡介',
  `Ad_Mcp` varchar(60) DEFAULT NULL COMMENT '封面圖',
  `Ad_Img` varchar(60) DEFAULT NULL COMMENT '圖片',
  `Ad_Qty` int DEFAULT '0' COMMENT '相簿張數',
  `Ad_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Ad_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  `Ad_Sdate` datetime DEFAULT NULL COMMENT '建立時間',
  PRIMARY KEY (`Ad_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_index_ad`
--

INSERT INTO `web_index_ad` (`Ad_ID`, `Ad_Title`, `Ad_Intro`, `Ad_Mcp`, `Ad_Img`, `Ad_Qty`, `Ad_Sort`, `Ad_Open`, `Ad_Sdate`) VALUES
(1, '首頁廣告圖片', '', NULL, NULL, 0, 0, 1, '2020-07-17 15:07:41');

-- --------------------------------------------------------

--
-- 資料表結構 `web_index_adl`
--

DROP TABLE IF EXISTS `web_index_adl`;
CREATE TABLE IF NOT EXISTS `web_index_adl` (
  `Adl_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Ad_ID` int UNSIGNED DEFAULT NULL COMMENT '相簿主編號',
  `Adl_Title` varchar(60) DEFAULT NULL COMMENT '相片標題',
  `Adl_Intro` varchar(255) DEFAULT NULL COMMENT '相片簡介',
  `Adl_Img` varchar(60) DEFAULT NULL COMMENT '批次圖片',
  `Adl_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Adl_Open` tinyint UNSIGNED DEFAULT '1' COMMENT '啟用',
  `Adl_Sdate` datetime DEFAULT NULL COMMENT '建立時間',
  `Adl_LinkT` tinyint UNSIGNED DEFAULT '0' COMMENT '連結跳轉目標',
  `Adl_Link` varchar(100) DEFAULT NULL COMMENT '連結',
  PRIMARY KEY (`Adl_ID`),
  KEY `Ad_ID` (`Ad_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_member`
--

DROP TABLE IF EXISTS `web_member`;
CREATE TABLE IF NOT EXISTS `web_member` (
  `Member_ID` varchar(11) NOT NULL COMMENT '會員編號',
  `Member_Acc` varchar(50) DEFAULT NULL COMMENT '會員帳號',
  `Member_Pwd` varchar(32) DEFAULT NULL COMMENT '會員密碼',
  `Member_Email` varchar(68) DEFAULT NULL COMMENT '電子信箱',
  `Member_Name` varchar(50) DEFAULT NULL COMMENT '會員名稱',
  `Member_Sex` varchar(2) DEFAULT NULL COMMENT '會員性別',
  `Member_Tel` varchar(20) DEFAULT NULL COMMENT '聯絡電話',
  `Member_Mobile` varchar(16) DEFAULT NULL COMMENT '聯絡手機',
  `Member_Zipcode` varchar(10) DEFAULT NULL COMMENT '區域碼',
  `Member_City` varchar(30) DEFAULT NULL COMMENT '區住縣市',
  `Member_County` varchar(30) DEFAULT NULL COMMENT '區住地區',
  `Member_Address` varchar(60) DEFAULT NULL COMMENT '區住地址',
  `Member_Sdate` datetime DEFAULT NULL COMMENT '加入時間',
  `Member_Edate` datetime DEFAULT NULL COMMENT '編輯時間',
  `Member_LastLogin` datetime DEFAULT NULL COMMENT '最後登入時間',
  `Member_Verify` varchar(150) DEFAULT NULL COMMENT '驗證碼',
  `Member_RePwd` varchar(32) DEFAULT NULL COMMENT '忘記密碼專用',
  `Member_Is_RePwd` tinyint UNSIGNED DEFAULT NULL COMMENT '是否使用忘記密碼',
  `Member_Open` tinyint(1) DEFAULT NULL COMMENT '帳號啟用',
  `Member_FBID` varchar(20) DEFAULT NULL COMMENT 'FacebookID',
  `Member_GoogleID` varchar(25) DEFAULT NULL COMMENT 'GoogleID',
  `Member_Line_id` varchar(60) DEFAULT NULL COMMENT 'Line使用者ID',
  PRIMARY KEY (`Member_ID`),
  UNIQUE KEY `Member_Acc` (`Member_Acc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_member`
--

INSERT INTO `web_member` (`Member_ID`, `Member_Acc`, `Member_Pwd`, `Member_Email`, `Member_Name`, `Member_Sex`, `Member_Tel`, `Member_Mobile`, `Member_Zipcode`, `Member_City`, `Member_County`, `Member_Address`, `Member_Sdate`, `Member_Edate`, `Member_LastLogin`, `Member_Verify`, `Member_RePwd`, `Member_Is_RePwd`, `Member_Open`, `Member_FBID`, `Member_GoogleID`, `Member_Line_id`) VALUES
('M2312150005', 'testtest123', 'e5248681094860252687e6475300ea76', 'z19820813@yahoo.com.tw', 'test', '男', NULL, '0912345678', '313', '臺中市', '西屯區', '', '2023-12-15 16:45:17', '2023-12-19 11:26:40', NULL, 'CT657C121D', '', 0, 1, NULL, NULL, NULL),
('M2312150006', 'JBS1123', '767f2e385cba483c5e3a0f41d9d78cc3', 'kerry19820813@gmail.com', 'MyTest', '男', NULL, '0912345678', '407', '臺中市', '西屯區', '', '2023-12-14 11:24:16', '2024-01-11 16:13:03', NULL, 'CT657A7560', '', 0, 1, NULL, NULL, NULL),
('M2312190001', 'JBStest', '767f2e385cba483c5e3a0f41d9d78cc3', 'a25932356@gmail.com', 'MyTest', '男', NULL, '0912345678', NULL, '臺中市', '西屯區', '', '2023-12-19 16:03:18', NULL, NULL, 'CT65814E46', '', 0, 1, NULL, NULL, NULL),
('M2312220001', 'chen168', '767f2e385cba483c5e3a0f41d9d78cc3', 'leslie.chen168@msa.hinet.net', '華越', '男', NULL, '0912345678', NULL, '臺中市', '中區', NULL, '2023-12-22 08:44:29', NULL, NULL, 'CT6584DBEC', NULL, NULL, 1, NULL, NULL, NULL),
('M2401120001', 'chantal', '30ec4b5ab03426226e08bd6309a70bb8', 'cathy830409@gmail.com', '陳蓉', '女', NULL, '092832033', NULL, '臺北市', '大同區', NULL, '2024-01-12 14:42:59', NULL, NULL, 'CT65A0DF73', '', 0, 1, NULL, NULL, NULL),
('M2401290001', 'BMIDP', '4e90bf5c6e89b179005004f6ef56fda1', 'f129138777@gmail.com', '庭宏', '男', NULL, '0912345678', '407', '臺中市', '西屯區', '', '2023-12-14 11:24:16', '2024-05-31 16:13:03', NULL, 'CT657A7560', '', 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `web_mysql_log`
--

DROP TABLE IF EXISTS `web_mysql_log`;
CREATE TABLE IF NOT EXISTS `web_mysql_log` (
  `ML_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ML_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '建立時間',
  `ML_USER` varchar(30) DEFAULT NULL COMMENT '使用者',
  `ML_DATA_ID` varchar(30) DEFAULT NULL COMMENT '資料ID',
  `ML_COMMENT` text COMMENT '註解',
  `ML_SQL_CON` text COMMENT '執行內容',
  `ML_SQL_EXEC_TYPE` varchar(10) DEFAULT NULL COMMENT '訊息種類',
  `ML_EXEC_FILE` varchar(255) DEFAULT NULL COMMENT '執行檔案',
  PRIMARY KEY (`ML_ID`),
  KEY `ML_DATE` (`ML_DATE`),
  KEY `ML_USER` (`ML_USER`),
  KEY `ML_DATA_ID` (`ML_DATA_ID`),
  KEY `ML_SQL_EXEC_TYPE` (`ML_SQL_EXEC_TYPE`),
  KEY `ML_EXEC_FILE` (`ML_EXEC_FILE`)
) ENGINE=MyISAM AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb3 COMMENT='執行訊息';

--
-- 傾印資料表的資料 `web_mysql_log`
--

INSERT INTO `web_mysql_log` (`ML_ID`, `ML_DATE`, `ML_USER`, `ML_DATA_ID`, `ML_COMMENT`, `ML_SQL_CON`, `ML_SQL_EXEC_TYPE`, `ML_EXEC_FILE`) VALUES
(1, '2024-01-02 11:05:00', '54909107', '', '9', '登入', 'login', ''),
(2, '2024-01-02 11:05:00', '54909107', '', '2', '折扣券設定', 'coupon', ''),
(3, '2024-01-02 11:05:00', '54909107', '', '10', '查看數據分析', 'analyze', ''),
(4, '2024-01-03 11:05:00', '54909107', '', '8', '登入', 'login', ''),
(5, '2024-01-03 11:05:00', '54909107', '', '6', '折扣券設定', 'coupon', ''),
(6, '2024-01-03 11:05:00', '54909107', '', '8', '查看數據分析', 'analyze', ''),
(7, '2024-01-04 11:05:00', '54909107', '', '5', '登入', 'login', ''),
(8, '2024-01-04 11:05:00', '54909107', '', '2', '折扣券設定', 'coupon', ''),
(9, '2024-01-04 11:05:00', '54909107', '', '4', '查看數據分析', 'analyze', ''),
(10, '2024-01-05 11:05:00', '54909107', '', '5', '登入', 'login', ''),
(11, '2024-01-05 11:05:00', '54909107', '', '2', '折扣券設定', 'coupon', ''),
(12, '2024-01-05 11:05:00', '54909107', '', '10', '查看數據分析', 'analyze', ''),
(13, '2024-01-05 11:05:00', '54909107', '', '4', '會員設定', 'setting', ''),
(14, '2024-01-08 11:05:00', '54909107', '', '12', '登入', 'login', ''),
(15, '2024-01-08 11:05:00', '54909107', '', '5', '折扣券設定', 'coupon', ''),
(16, '2024-01-08 11:05:00', '54909107', '', '9', '查看數據分析', 'analyze', ''),
(17, '2024-01-09 11:05:00', '54909107', '', '12', '登入', 'login', ''),
(18, '2024-01-09 11:05:00', '54909107', '', '3', '折扣券設定', 'coupon', ''),
(19, '2024-01-09 11:05:00', '54909107', '', '8', '查看數據分析', 'analyze', ''),
(20, '2024-01-11 11:05:00', '54909107', '', '7', '登入', 'login', ''),
(21, '2024-01-11 11:05:00', '54909107', '', '8', '折扣券設定', 'coupon', ''),
(22, '2024-01-11 11:05:00', '54909107', '', '6', '查看數據分析', 'analyze', ''),
(23, '2024-01-11 11:05:00', '54909107', '', '3', '會員設定', 'setting', ''),
(24, '2024-01-16 11:05:00', '54909107', '', '9', '登入', 'login', ''),
(25, '2024-01-16 11:05:00', '54909107', '', '6', '折扣券設定', 'coupon', ''),
(26, '2024-01-16 11:05:00', '54909107', '', '2', '查看數據分析', 'analyze', ''),
(27, '2024-01-17 11:05:00', '54909107', '', '8', '登入', 'login', ''),
(28, '2024-01-17 11:05:00', '54909107', '', '10', '折扣券設定', 'coupon', ''),
(29, '2024-01-17 11:05:00', '54909107', '', '3', '查看數據分析', 'analyze', ''),
(30, '2024-01-22 11:05:00', '54909107', '', '10', '登入', 'login', ''),
(31, '2024-01-22 11:05:00', '54909107', '', '9', '折扣券設定', 'coupon', ''),
(32, '2024-01-22 11:05:00', '54909107', '', '2', '查看數據分析', 'analyze', ''),
(33, '2024-01-23 11:05:00', '54909107', '', '14', '登入', 'login', ''),
(34, '2024-01-23 11:05:00', '54909107', '', '10', '折扣券設定', 'coupon', ''),
(35, '2024-01-23 11:05:00', '54909107', '', '4', '查看數據分析', 'analyze', ''),
(36, '2024-01-24 11:05:00', '54909107', '', '10', '登入', 'login', ''),
(37, '2024-01-24 11:05:00', '54909107', '', '9', '折扣券設定', 'coupon', ''),
(38, '2024-01-24 11:05:00', '54909107', '', '9', '查看數據分析', 'analyze', ''),
(39, '2024-01-26 11:05:00', '54909107', '', '1', '登入', 'login', ''),
(40, '2024-01-26 11:05:00', '54909107', '', '2', '生成問券', 'generate', ''),
(42, '2024-01-29 11:05:00', '54909107', '', '13', '登入', 'login', ''),
(43, '2024-01-29 11:05:00', '54909107', '', '9', '折扣券設定', 'coupon', ''),
(44, '2024-01-29 11:05:00', '54909107', '', '7', '查看數據分析', 'analyze', ''),
(45, '2024-01-02 11:05:00', '54909107', '', '7', '登入', 'login', ''),
(46, '2024-01-02 11:05:00', '54909107', '', '7', '折扣券設定', 'coupon', ''),
(47, '2024-01-02 11:05:00', '54909107', '', '1', '查看數據分析', 'analyze', ''),
(48, '2024-01-03 11:05:00', '54909107', '', '13', '登入', 'login', ''),
(49, '2024-01-03 11:05:00', '54909107', '', '7', '折扣券設定', 'coupon', ''),
(50, '2024-01-03 11:05:00', '54909107', '', '4', '查看數據分析', 'analyze', ''),
(51, '2024-01-04 11:05:00', '54909107', '', '10', '登入', 'login', ''),
(52, '2024-01-04 11:05:00', '54909107', '', '2', '折扣券設定', 'coupon', ''),
(53, '2024-01-04 11:05:00', '54909107', '', '6', '查看數據分析', 'analyze', ''),
(54, '2024-01-05 11:05:00', '54909107', '', '8', '登入', 'login', ''),
(55, '2024-01-05 11:05:00', '54909107', '', '3', '折扣券設定', 'coupon', ''),
(56, '2024-01-05 11:05:00', '54909107', '', '10', '查看數據分析', 'analyze', ''),
(57, '2024-01-08 11:05:00', '54909107', '', '6', '登入', 'login', ''),
(58, '2024-01-08 11:05:00', '54909107', '', '1', '折扣券設定', 'coupon', ''),
(59, '2024-01-08 11:05:00', '54909107', '', '7', '查看數據分析', 'analyze', ''),
(60, '2024-01-10 11:05:00', '54909107', '', '7', '登入', 'login', ''),
(61, '2024-01-10 11:05:00', '54909107', '', '8', '折扣券設定', 'coupon', ''),
(62, '2024-01-10 11:05:00', '54909107', '', '4', '查看數據分析', 'analyze', ''),
(63, '2024-01-15 11:05:00', '54909107', '', '6', '登入', 'login', ''),
(64, '2024-01-15 11:05:00', '54909107', '', '1', '折扣券設定', 'coupon', ''),
(65, '2024-01-15 11:05:00', '54909107', '', '8', '查看數據分析', 'analyze', ''),
(66, '2024-01-15 11:05:00', '54909107', '', '3', '會員設定', 'setting', ''),
(67, '2024-01-16 11:05:00', '54909107', '', '9', '登入', 'login', ''),
(68, '2024-01-16 11:05:00', '54909107', '', '1', '折扣券設定', 'coupon', ''),
(69, '2024-01-16 11:05:00', '54909107', '', '6', '查看數據分析', 'analyze', ''),
(70, '2024-01-16 11:05:00', '54909107', '', '3', '會員設定', 'setting', ''),
(71, '2024-01-17 11:05:00', '54909107', '', '14', '登入', 'login', ''),
(72, '2024-01-17 11:05:00', '54909107', '', '7', '折扣券設定', 'coupon', ''),
(73, '2024-01-17 11:05:00', '54909107', '', '7', '查看數據分析', 'analyze', ''),
(74, '2024-01-17 11:05:00', '54909107', '', '3', '會員設定', 'setting', ''),
(75, '2024-01-19 11:05:00', '54909107', '', '9', '登入', 'login', ''),
(76, '2024-01-19 11:05:00', '54909107', '', '10', '折扣券設定', 'coupon', ''),
(77, '2024-01-19 11:05:00', '54909107', '', '9', '查看數據分析', 'analyze', ''),
(78, '2024-01-22 11:05:00', '54909107', '', '11', '登入', 'login', ''),
(79, '2024-01-22 11:05:00', '54909107', '', '10', '折扣券設定', 'coupon', ''),
(80, '2024-01-22 11:05:00', '54909107', '', '1', '查看數據分析', 'analyze', ''),
(81, '2024-01-23 11:05:00', '54909107', '', '6', '登入', 'login', ''),
(82, '2024-01-23 11:05:00', '54909107', '', '6', '折扣券設定', 'coupon', ''),
(83, '2024-01-23 11:05:00', '54909107', '', '2', '查看數據分析', 'analyze', ''),
(84, '2024-01-26 11:05:00', '54909107', '', '1', '登入', 'login', ''),
(85, '2024-01-26 11:05:00', '54909107', '', '1', '生成問券', 'generate', ''),
(86, '2024-01-26 11:05:00', '54909107', '', '1', '投放問券347張', 'send', ''),
(112, '2024-02-07 12:49:31', '117', NULL, '6', '折扣券設定', 'coupon', NULL),
(111, '2024-02-06 12:49:31', '117', NULL, '9', '折扣券設定', 'coupon', NULL),
(110, '2024-02-05 12:49:31', '117', NULL, '12', '折扣券設定', 'coupon', NULL),
(109, '2024-02-02 12:49:31', '117', NULL, '8', '折扣券設定', 'coupon', NULL),
(108, '2024-02-01 12:49:31', '117', NULL, '11', '折扣券設定', 'coupon', NULL),
(113, '2024-02-08 12:49:31', '117', NULL, '7', '折扣券設定', 'coupon', NULL),
(114, '2024-02-09 12:49:31', '117', NULL, '12', '折扣券設定', 'coupon', NULL),
(115, '2024-02-12 12:49:31', '117', NULL, '11', '折扣券設定', 'coupon', NULL),
(116, '2024-02-13 12:49:31', '117', NULL, '13', '折扣券設定', 'coupon', NULL),
(117, '2024-02-14 12:49:31', '117', NULL, '10', '折扣券設定', 'coupon', NULL),
(118, '2024-02-15 12:49:31', '117', NULL, '9', '折扣券設定', 'coupon', NULL),
(119, '2024-02-16 12:49:31', '117', NULL, '7', '折扣券設定', 'coupon', NULL),
(120, '2024-02-19 12:49:31', '117', NULL, '11', '折扣券設定', 'coupon', NULL),
(121, '2024-02-20 12:49:31', '117', NULL, '9', '折扣券設定', 'coupon', NULL),
(122, '2024-02-21 12:49:31', '117', NULL, '7', '折扣券設定', 'coupon', NULL),
(123, '2024-02-22 12:49:31', '117', NULL, '11', '折扣券設定', 'coupon', NULL),
(124, '2024-02-23 12:49:31', '117', NULL, '10', '折扣券設定', 'coupon', NULL),
(125, '2024-02-26 12:49:31', '117', NULL, '7', '折扣券設定', 'coupon', NULL),
(126, '2024-02-27 12:49:31', '117', NULL, '8', '折扣券設定', 'coupon', NULL),
(127, '2024-02-28 12:49:31', '117', NULL, '9', '折扣券設定', 'coupon', NULL),
(128, '2024-02-29 12:49:31', '117', NULL, '13', '折扣券設定', 'coupon', NULL),
(129, '2024-02-01 12:49:31', '117', NULL, '6', '登入', 'login', NULL),
(130, '2024-02-02 12:49:31', '117', NULL, '4', '登入', 'login', NULL),
(131, '2024-02-05 12:49:31', '117', NULL, '2', '登入', 'login', NULL),
(132, '2024-02-06 12:49:31', '117', NULL, '6', '登入', 'login', NULL),
(133, '2024-02-07 12:49:31', '117', NULL, '3', '登入', 'login', NULL),
(134, '2024-02-08 12:49:31', '117', NULL, '4', '登入', 'login', NULL),
(135, '2024-02-09 12:49:31', '117', NULL, '5', '登入', 'login', NULL),
(136, '2024-02-12 12:49:31', '117', NULL, '5', '登入', 'login', NULL),
(137, '2024-02-13 12:49:31', '117', NULL, '4', '登入', 'login', NULL),
(138, '2024-02-14 12:49:31', '117', NULL, '6', '登入', 'login', NULL),
(139, '2024-02-15 12:49:31', '117', NULL, '9', '登入', 'login', NULL),
(140, '2024-02-16 12:49:31', '117', NULL, '2', '登入', 'login', NULL),
(141, '2024-02-19 12:49:31', '117', NULL, '7', '登入', 'login', NULL),
(142, '2024-02-20 12:49:31', '117', NULL, '5', '登入', 'login', NULL),
(143, '2024-02-21 12:49:31', '117', NULL, '3', '登入', 'login', NULL),
(144, '2024-02-22 12:49:31', '117', NULL, '6', '登入', 'login', NULL),
(145, '2024-02-23 12:49:31', '117', NULL, '4', '登入', 'login', NULL),
(146, '2024-02-26 12:49:31', '117', NULL, '1', '登入', 'login', NULL),
(147, '2024-02-27 12:49:31', '117', NULL, '7', '登入', 'login', NULL),
(148, '2024-02-28 12:49:31', '117', NULL, '4', '登入', 'login', NULL),
(149, '2024-02-29 12:49:31', '117', NULL, '7', '登入', 'login', NULL),
(150, '2024-02-01 12:49:31', '117', '', '2', '生成問券', 'generate', ''),
(151, '2024-02-02 12:49:31', '117', '', '4', '生成問券', 'generate', ''),
(152, '2024-02-05 12:49:31', '117', '', '8', '生成問券', 'generate', ''),
(153, '2024-02-06 12:49:31', '117', '', '5', '生成問券', 'generate', ''),
(154, '2024-02-07 12:49:31', '117', '', '3', '生成問券', 'generate', ''),
(155, '2024-02-08 12:49:31', '117', '', '9', '生成問券', 'generate', ''),
(156, '2024-02-09 12:49:31', '117', '', '3', '生成問券', 'generate', ''),
(157, '2024-02-12 12:49:31', '117', '', '5', '生成問券', 'generate', ''),
(158, '2024-02-13 12:49:31', '117', '', '5', '生成問券', 'generate', ''),
(159, '2024-02-14 12:49:31', '117', '', '6', '生成問券', 'generate', ''),
(160, '2024-02-15 12:49:31', '117', '', '5', '生成問券', 'generate', ''),
(161, '2024-02-16 12:49:31', '117', '', '3', '生成問券', 'generate', ''),
(162, '2024-02-19 12:49:31', '117', '', '4', '生成問券', 'generate', ''),
(163, '2024-02-20 12:49:31', '117', '', '5', '生成問券', 'generate', ''),
(164, '2024-02-21 12:49:31', '117', '', '3', '生成問券', 'generate', ''),
(165, '2024-02-22 12:49:31', '117', '', '4', '生成問券', 'generate', ''),
(166, '2024-02-23 12:49:31', '117', '', '12', '生成問券', 'generate', ''),
(167, '2024-02-26 12:49:31', '117', '', '4', '生成問券', 'generate', ''),
(168, '2024-02-27 12:49:31', '117', '', '5', '生成問券', 'generate', ''),
(169, '2024-02-28 12:49:31', '117', '', '4', '生成問券', 'generate', ''),
(170, '2024-02-29 12:49:31', '117', '', '1', '生成問券', 'generate', ''),
(171, '2024-02-01 12:49:31', '117', '', '4', '投放問券347張', 'send', ''),
(172, '2024-02-02 12:49:31', '117', '', '4', '投放問券347張', 'send', ''),
(173, '2024-02-05 12:49:31', '117', '', '7', '投放問券347張', 'send', ''),
(174, '2024-02-06 12:49:31', '117', '', '8', '投放問券347張', 'send', ''),
(175, '2024-02-07 12:49:31', '117', '', '4', '投放問券347張', 'send', ''),
(176, '2024-02-08 12:49:31', '117', '', '3', '投放問券347張', 'send', ''),
(177, '2024-02-09 12:49:31', '117', '', '5', '投放問券347張', 'send', ''),
(178, '2024-02-12 12:49:31', '117', '', '2', '投放問券347張', 'send', ''),
(179, '2024-02-13 12:49:31', '117', '', '4', '投放問券347張', 'send', ''),
(180, '2024-02-14 12:49:31', '117', '', '6', '投放問券347張', 'send', ''),
(181, '2024-02-15 12:49:31', '117', '', '7', '投放問券347張', 'send', ''),
(182, '2024-02-16 12:49:31', '117', '', '2', '投放問券347張', 'send', ''),
(183, '2024-02-19 12:49:31', '117', '', '3', '投放問券347張', 'send', ''),
(184, '2024-02-20 12:49:31', '117', '', '6', '投放問券347張', 'send', ''),
(185, '2024-02-21 12:49:31', '117', '', '1', '投放問券347張', 'send', ''),
(186, '2024-02-22 12:49:31', '117', '', '4', '投放問券347張', 'send', ''),
(187, '2024-02-23 12:49:31', '117', '', '8', '投放問券347張', 'send', ''),
(188, '2024-02-26 12:49:31', '117', '', '5', '投放問券347張', 'send', ''),
(189, '2024-02-27 12:49:31', '117', '', '8', '投放問券347張', 'send', ''),
(190, '2024-02-28 12:49:31', '117', '', '4', '投放問券347張', 'send', ''),
(191, '2024-02-29 12:49:31', '117', '', '5', '投放問券347張', 'send', ''),
(192, '2024-02-01 12:49:31', '117', '', '3', '查看數據分析', 'analyze', ''),
(193, '2024-02-02 12:49:31', '117', '', '2', '查看數據分析', 'analyze', ''),
(194, '2024-02-05 12:49:31', '117', '', '6', '查看數據分析', 'analyze', ''),
(195, '2024-02-06 12:49:31', '117', '', '3', '查看數據分析', 'analyze', ''),
(196, '2024-02-07 12:49:31', '117', '', '10', '查看數據分析', 'analyze', ''),
(197, '2024-02-08 12:49:31', '117', '', '6', '查看數據分析', 'analyze', ''),
(198, '2024-02-09 12:49:31', '117', '', '8', '查看數據分析', 'analyze', ''),
(199, '2024-02-12 12:49:31', '117', '', '7', '查看數據分析', 'analyze', ''),
(200, '2024-02-13 12:49:31', '117', '', '2', '查看數據分析', 'analyze', ''),
(201, '2024-02-14 12:49:31', '117', '', '4', '查看數據分析', 'analyze', ''),
(202, '2024-02-15 12:49:31', '117', '', '5', '查看數據分析', 'analyze', ''),
(203, '2024-02-16 12:49:31', '117', '', '3', '查看數據分析', 'analyze', ''),
(204, '2024-02-19 12:49:31', '117', '', '4', '查看數據分析', 'analyze', ''),
(205, '2024-02-20 12:49:31', '117', '', '4', '查看數據分析', 'analyze', ''),
(206, '2024-02-21 12:49:31', '117', '', '7', '查看數據分析', 'analyze', ''),
(207, '2024-02-22 12:49:31', '117', '', '4', '查看數據分析', 'analyze', ''),
(208, '2024-02-23 12:49:31', '117', '', '6', '查看數據分析', 'analyze', ''),
(209, '2024-02-26 12:49:31', '117', '', '3', '查看數據分析', 'analyze', ''),
(210, '2024-02-27 12:49:31', '117', '', '1', '查看數據分析', 'analyze', ''),
(211, '2024-02-28 12:49:31', '117', '', '3', '查看數據分析', 'analyze', ''),
(212, '2024-02-29 12:49:31', '117', '', '9', '查看數據分析', 'analyze', ''),
(213, '2024-02-01 12:49:31', '117', '', '3', '會員設定', 'setting', ''),
(214, '2024-02-02 12:49:31', '117', '', '3', '會員設定', 'setting', ''),
(215, '2024-02-05 12:49:31', '117', '', '2', '會員設定', 'setting', ''),
(216, '2024-02-06 12:49:31', '117', '', '2', '會員設定', 'setting', ''),
(217, '2024-02-07 12:49:31', '117', '', '3', '會員設定', 'setting', ''),
(218, '2024-02-08 12:49:31', '117', '', '10', '會員設定', 'setting', ''),
(219, '2024-02-09 12:49:31', '117', '', '6', '會員設定', 'setting', ''),
(220, '2024-02-12 12:49:31', '117', '', '4', '會員設定', 'setting', ''),
(221, '2024-02-13 12:49:31', '117', '', '7', '會員設定', 'setting', ''),
(222, '2024-02-14 12:49:31', '117', '', '6', '會員設定', 'setting', ''),
(223, '2024-02-15 12:49:31', '117', '', '5', '會員設定', 'setting', ''),
(224, '2024-02-16 12:49:31', '117', '', '4', '會員設定', 'setting', ''),
(225, '2024-02-19 12:49:31', '117', '', '4', '會員設定', 'setting', ''),
(226, '2024-02-20 12:49:31', '117', '', '3', '會員設定', 'setting', ''),
(227, '2024-02-21 12:49:31', '117', '', '3', '會員設定', 'setting', ''),
(228, '2024-02-22 12:49:31', '117', '', '12', '會員設定', 'setting', ''),
(229, '2024-02-23 12:49:31', '117', '', '6', '會員設定', 'setting', ''),
(230, '2024-02-26 12:49:31', '117', '', '3', '會員設定', 'setting', ''),
(231, '2024-02-27 12:49:31', '117', '', '2', '會員設定', 'setting', ''),
(232, '2024-02-28 12:49:31', '117', '', '7', '會員設定', 'setting', ''),
(233, '2024-02-29 12:49:31', '117', '', '5', '會員設定', 'setting', '');

-- --------------------------------------------------------

--
-- 資料表結構 `web_news`
--

DROP TABLE IF EXISTS `web_news`;
CREATE TABLE IF NOT EXISTS `web_news` (
  `News_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `NewsC_ID` varchar(11) DEFAULT NULL COMMENT '消息分類',
  `News_Title` varchar(60) DEFAULT NULL COMMENT '消息標題',
  `News_Content` text COMMENT '消息內容',
  `News_Mcp` varchar(60) DEFAULT NULL COMMENT '封面圖',
  `News_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `News_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  `News_Sdate` datetime DEFAULT NULL COMMENT '建立時間',
  PRIMARY KEY (`News_ID`),
  KEY `NewsC_ID` (`NewsC_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_news`
--

INSERT INTO `web_news` (`News_ID`, `NewsC_ID`, `News_Title`, `News_Content`, `News_Mcp`, `News_Sort`, `News_Open`, `News_Sdate`) VALUES
(8, 'Ne0003', '優惠活動', '<div style=\"text-align:center\"><em>何か書いて</em>ください</div>', '', 0, 1, '2020-04-17 15:38:58');

-- --------------------------------------------------------

--
-- 資料表結構 `web_newsclass`
--

DROP TABLE IF EXISTS `web_newsclass`;
CREATE TABLE IF NOT EXISTS `web_newsclass` (
  `NewsC_ID` varchar(11) NOT NULL COMMENT '分類編號',
  `NewsC_Name` varchar(20) DEFAULT NULL COMMENT '分類名稱',
  `NewsC_Lv` tinyint UNSIGNED DEFAULT '1' COMMENT '目錄層級',
  `NewsC_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `NewsC_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '顯示',
  `NewsC_UpMID` varchar(11) DEFAULT NULL COMMENT '上層目錄ID',
  PRIMARY KEY (`NewsC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_newsclass`
--

INSERT INTO `web_newsclass` (`NewsC_ID`, `NewsC_Name`, `NewsC_Lv`, `NewsC_Sort`, `NewsC_Open`, `NewsC_UpMID`) VALUES
('Ne0003', '優惠活動', 1, 99, 1, NULL),
('Ne0004', '公告訊息', 1, 98, 1, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `web_orderdetail`
--

DROP TABLE IF EXISTS `web_orderdetail`;
CREATE TABLE IF NOT EXISTS `web_orderdetail` (
  `Orderd_ID` int NOT NULL AUTO_INCREMENT,
  `Orderm_ID` varchar(11) NOT NULL COMMENT '訂單編號',
  `Product_ID` varchar(11) DEFAULT NULL COMMENT '產品編號',
  `ProductC_ID` varchar(11) DEFAULT NULL COMMENT '分類',
  `Orderd_Name` varchar(100) DEFAULT NULL COMMENT '產品名稱',
  `Orderd_Content` text COMMENT '內容物',
  `Orderd_Unit` varchar(60) DEFAULT NULL COMMENT '規格',
  `Orderd_Count` int DEFAULT NULL COMMENT '產品數量',
  `Orderd_Price` int DEFAULT NULL COMMENT '產品原價',
  `Orderd_Price1` int DEFAULT NULL COMMENT '產品售價',
  `Orderd_Sdate` datetime DEFAULT NULL COMMENT '訂單日期',
  `Product_NID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Orderd_ID`),
  UNIQUE KEY `Orderm_ID` (`Orderm_ID`,`Orderd_ID`,`Orderd_Unit`),
  KEY `ProductC_ID` (`ProductC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_orderid`
--

DROP TABLE IF EXISTS `web_orderid`;
CREATE TABLE IF NOT EXISTS `web_orderid` (
  `Order_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_ordermain`
--

DROP TABLE IF EXISTS `web_ordermain`;
CREATE TABLE IF NOT EXISTS `web_ordermain` (
  `Orderm_ID` varchar(11) NOT NULL COMMENT '訂單編號',
  `Member_ID` varchar(11) NOT NULL COMMENT '會員編號',
  `Orderm_TotalSub` varchar(10) DEFAULT NULL COMMENT '總商品金額',
  `Orderm_Freight` int DEFAULT '0' COMMENT '運費',
  `Orderm_TotalPrice` int DEFAULT '0' COMMENT '總金額',
  `Orderm_RName` varchar(30) DEFAULT NULL COMMENT '收件人名稱',
  `Orderm_RCity` varchar(5) DEFAULT NULL COMMENT '收件人縣市',
  `Orderm_RCounty` varchar(5) DEFAULT NULL COMMENT '收件人區域',
  `Orderm_RAddr` varchar(100) DEFAULT NULL COMMENT '收件人地址',
  `Orderm_RZipcode` varchar(6) DEFAULT NULL COMMENT '收件人郵遞區號',
  `Orderm_RTel` varchar(12) DEFAULT NULL COMMENT '收件人電話',
  `Orderm_RMobile` varchar(12) DEFAULT NULL COMMENT '收件人手機',
  `Orderm_Delivery` varchar(30) DEFAULT NULL COMMENT '付款方式',
  `Orderm_payTime` varchar(60) DEFAULT NULL COMMENT '付款時間',
  `Orderm_Note` text COMMENT '備註',
  `Orderm_States` tinyint UNSIGNED DEFAULT '0' COMMENT '狀態',
  `Orderm_Sdate` datetime DEFAULT NULL COMMENT '訂單日期',
  `Orderm_Outdate` datetime DEFAULT NULL COMMENT '出貨日期',
  `Orderm_card5no` int DEFAULT NULL,
  `Orderm_cardno` varchar(20) DEFAULT NULL COMMENT '信用卡卡號',
  `Orderm_payAmt` int NOT NULL DEFAULT '0',
  `Orderm_Success` tinyint(1) DEFAULT '0' COMMENT '訂單完成',
  PRIMARY KEY (`Orderm_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_ordertdetail`
--

DROP TABLE IF EXISTS `web_ordertdetail`;
CREATE TABLE IF NOT EXISTS `web_ordertdetail` (
  `Ordertm_Sn` varchar(12) NOT NULL COMMENT '訂單編號',
  `Member_ID` varchar(11) DEFAULT NULL COMMENT '會員編號',
  `Product_ID` varchar(12) DEFAULT NULL COMMENT '產品編號',
  `Ordertd_Unit` varchar(60) DEFAULT NULL COMMENT '規格',
  `Ordertd_Count` int DEFAULT NULL COMMENT '產品數量',
  `Ordertd_Price` int DEFAULT NULL COMMENT '產品原價',
  `Ordertd_Price1` int DEFAULT NULL COMMENT '產品售價',
  UNIQUE KEY `Ordertm_ID` (`Ordertm_Sn`,`Product_ID`,`Ordertd_Unit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_ordertmain`
--

DROP TABLE IF EXISTS `web_ordertmain`;
CREATE TABLE IF NOT EXISTS `web_ordertmain` (
  `Ordertm_Sn` varchar(12) NOT NULL COMMENT '訂單編號',
  `Delivery_ID` int UNSIGNED DEFAULT NULL COMMENT '付款方式',
  `Member_ID` varchar(11) DEFAULT NULL,
  `Ordertm_Name` varchar(30) DEFAULT NULL,
  `Ordertm_Uniform` varchar(8) DEFAULT NULL COMMENT '統一編號',
  `Ordertm_City` varchar(5) DEFAULT NULL,
  `Ordertm_County` varchar(5) DEFAULT NULL,
  `Ordertm_Address` varchar(100) DEFAULT NULL,
  `Ordertm_Tel` varchar(12) DEFAULT NULL,
  `Ordertm_Mobile` varchar(12) DEFAULT NULL,
  `Ordertm_Email` varchar(120) DEFAULT NULL COMMENT '訂購人信箱',
  `Ordertm_RName` varchar(30) DEFAULT NULL,
  `Ordertm_RCity` varchar(5) DEFAULT NULL,
  `Ordertm_RCounty` varchar(5) DEFAULT NULL,
  `Ordertm_RAddr` varchar(100) DEFAULT NULL,
  `Ordertm_RTel` varchar(12) DEFAULT NULL,
  `Ordertm_RMobile` varchar(12) DEFAULT NULL,
  `Ordertm_Note` text,
  PRIMARY KEY (`Ordertm_Sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_ordert_sn`
--

DROP TABLE IF EXISTS `web_ordert_sn`;
CREATE TABLE IF NOT EXISTS `web_ordert_sn` (
  `Ord_UID` varchar(12) DEFAULT NULL COMMENT '使用者編號',
  `Ord_Sn` varchar(12) DEFAULT NULL COMMENT '訂單編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `web_product`
--

DROP TABLE IF EXISTS `web_product`;
CREATE TABLE IF NOT EXISTS `web_product` (
  `Product_ID` varchar(11) NOT NULL COMMENT '產品編號',
  `ProductC_ID` varchar(11) DEFAULT NULL COMMENT '產品分類',
  `Product_Name` varchar(50) DEFAULT NULL COMMENT '產品名稱',
  `Product_Intro` varchar(255) DEFAULT NULL COMMENT '產品簡介',
  `Product_Content` text COMMENT '詳細內容',
  `Product_Unit_ID` text COMMENT '規格UID',
  `Product_Unit_NO` text COMMENT '進銷存產品編號',
  `Product_Unit` text COMMENT '規格',
  `Product_Price` varchar(255) DEFAULT NULL COMMENT '原價',
  `Product_Price1` varchar(255) DEFAULT NULL COMMENT '售價',
  `Product_Mcp` varchar(60) DEFAULT NULL COMMENT '封面圖',
  `Product_Img1` varchar(60) DEFAULT NULL COMMENT '產品圖一',
  `Product_Img2` varchar(60) DEFAULT NULL COMMENT '產品圖二',
  `Product_Img3` varchar(60) DEFAULT NULL COMMENT '產品圖三',
  `Product_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Product_OpenNew` tinyint UNSIGNED DEFAULT '0' COMMENT '新品',
  `Product_OpenHot` tinyint UNSIGNED DEFAULT '0' COMMENT '人氣',
  `Product_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  `Product_Sdate` datetime DEFAULT NULL COMMENT '建立時間',
  PRIMARY KEY (`Product_ID`),
  KEY `Product_Name` (`Product_Name`),
  KEY `Product_Price` (`Product_Price`),
  KEY `ProductC_ID` (`ProductC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_product`
--

INSERT INTO `web_product` (`Product_ID`, `ProductC_ID`, `Product_Name`, `Product_Intro`, `Product_Content`, `Product_Unit_ID`, `Product_Unit_NO`, `Product_Unit`, `Product_Price`, `Product_Price1`, `Product_Mcp`, `Product_Img1`, `Product_Img2`, `Product_Img3`, `Product_Sort`, `Product_OpenNew`, `Product_OpenHot`, `Product_Open`, `Product_Sdate`) VALUES
('P2309130001', 'Pr0007', '111', '111', '111', 'a:1:{i:0;s:12:\"U16945922991\";}', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:1:\"1\";}', 'a:1:{i:0;s:3:\"100\";}', 'a:1:{i:0;s:3:\"100\";}', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-09-13 16:04:59'),
('P2309130002', 'Pr0007', '112', '112', '112', 'a:1:{i:0;s:12:\"U16945923841\";}', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:1:\"1\";}', 'a:1:{i:0;s:3:\"100\";}', 'a:1:{i:0;s:3:\"100\";}', NULL, NULL, NULL, NULL, 0, 0, 1, 1, '2023-09-13 16:06:24'),
('P2309130003', 'Pr0008', '121', '121', '121', 'a:1:{i:0;s:12:\"U16945924701\";}', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:1:\"1\";}', 'a:1:{i:0;s:3:\"100\";}', 'a:1:{i:0;s:3:\"100\";}', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-09-13 16:07:50'),
('P2309130004', 'Pr0008', '122', '122', '<div class=\"ckeditor-html5-video\" style=\"text-align:center\">\r\n<video src=\"/upload/userfiles/files/file_example_MP4_480_1_5MG.mp4\">&nbsp;</video>\r\n</div>\r\n<br />\r\n<img alt=\"\" src=\"/upload/userfiles/images/04(119).jpg\" style=\"height:800px; width:800px\" />', 'a:2:{i:0;s:12:\"U16945924931\";i:1;s:12:\"U17006410431\";}', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:3:\"100\";i:1;s:3:\"120\";}', 'a:2:{i:0;s:3:\"100\";i:1;s:3:\"120\";}', 'Product_McpP2309130004.jpg', 'Product_Img1P2309130004.jpg', '', '', 0, 0, 1, 1, '2023-09-13 16:08:13');

-- --------------------------------------------------------

--
-- 資料表結構 `web_productclass`
--

DROP TABLE IF EXISTS `web_productclass`;
CREATE TABLE IF NOT EXISTS `web_productclass` (
  `ProductC_ID` varchar(11) NOT NULL COMMENT '分類編號',
  `ProductC_Name` varchar(20) DEFAULT NULL COMMENT '分類名稱',
  `ProductC_Lv` tinyint UNSIGNED DEFAULT '1' COMMENT '目錄層級',
  `ProductC_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `ProductC_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '顯示',
  `ProductC_UpMID` varchar(11) DEFAULT NULL COMMENT '上層目錄ID',
  `ProductC_Mcp` varchar(60) DEFAULT NULL COMMENT '封面圖',
  `ProductC_Img1` varchar(60) DEFAULT NULL COMMENT '產品圖一',
  `ProductC_Img2` varchar(60) DEFAULT NULL COMMENT '產品圖二',
  `ProductC_Img3` varchar(60) DEFAULT NULL COMMENT '產品圖三',
  PRIMARY KEY (`ProductC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_productclass`
--

INSERT INTO `web_productclass` (`ProductC_ID`, `ProductC_Name`, `ProductC_Lv`, `ProductC_Sort`, `ProductC_Open`, `ProductC_UpMID`, `ProductC_Mcp`, `ProductC_Img1`, `ProductC_Img2`, `ProductC_Img3`) VALUES
('Pr0001', '一類', 1, 0, 1, NULL, NULL, NULL, NULL, NULL),
('Pr0002', '二類', 1, 0, 1, NULL, NULL, NULL, NULL, NULL),
('Pr0003', '三類', 1, 0, 1, NULL, NULL, NULL, NULL, NULL),
('Pr0004', '四類', 1, 0, 1, NULL, NULL, NULL, NULL, NULL),
('Pr0005', '五類', 1, 0, 1, NULL, NULL, NULL, NULL, NULL),
('Pr0006', '六類', 1, 0, 1, NULL, NULL, NULL, NULL, NULL),
('Pr0007', '一類一', 2, 0, 1, 'Pr0001', NULL, NULL, NULL, NULL),
('Pr0008', '一類二', 2, 0, 1, 'Pr0001', NULL, NULL, NULL, NULL),
('Pr0009', '二類一', 2, 0, 1, 'Pr0002', NULL, NULL, NULL, NULL),
('Pr0010', '二類二', 2, 0, 1, 'Pr0002', NULL, NULL, NULL, NULL),
('Pr0011', '三類一', 2, 0, 1, 'Pr0003', NULL, NULL, NULL, NULL),
('Pr0012', '三類二', 2, 0, 1, 'Pr0003', NULL, NULL, NULL, NULL),
('Pr0013', '四類一', 2, 0, 1, 'Pr0004', NULL, NULL, NULL, NULL),
('Pr0014', '四類二', 2, 0, 1, 'Pr0004', NULL, NULL, NULL, NULL),
('Pr0015', '五類一', 2, 0, 1, 'Pr0005', NULL, NULL, NULL, NULL),
('Pr0016', '五類二', 2, 0, 1, 'Pr0005', NULL, NULL, NULL, NULL),
('Pr0017', '六類一', 2, 0, 1, 'Pr0006', NULL, NULL, NULL, NULL),
('Pr0018', '六類二', 2, 0, 1, 'Pr0006', 'ProductC_McpPr0018.jpg', 'ProductC_Img1Pr0018.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `web_qa`
--

DROP TABLE IF EXISTS `web_qa`;
CREATE TABLE IF NOT EXISTS `web_qa` (
  `QA_ID` varchar(11) NOT NULL COMMENT '編號',
  `QA_Name` varchar(20) DEFAULT NULL COMMENT '資訊標題',
  `QA_Lv` tinyint UNSIGNED DEFAULT '1' COMMENT '目錄層級',
  `QA_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `QA_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '顯示',
  `QA_UpMID` varchar(11) DEFAULT NULL COMMENT '上層目錄ID',
  `QA_Content` text COMMENT '資訊內容',
  PRIMARY KEY (`QA_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_qa`
--

INSERT INTO `web_qa` (`QA_ID`, `QA_Name`, `QA_Lv`, `QA_Sort`, `QA_Open`, `QA_UpMID`, `QA_Content`) VALUES
('QA0001', '運送方式', 1, 2, 1, NULL, '<em>何か書いて</em>ください'),
('QA0002', '付款方式', 1, 3, 1, NULL, '<em>何か書いて</em>ください'),
('QA0003', '售後服務', 1, 1, 1, NULL, '<div style=\"text-align:center\"><em>何か書いて</em>ください</div>'),
('QA0005', '優惠活動', 1, 5, 0, NULL, '<div style=\"text-align:center\"><em>何か書いて</em>ください</div>'),
('QA0004', '購物須知', 1, 4, 1, NULL, '<div style=\"text-align:center\"><em>何か書いて</em>ください</div>');

-- --------------------------------------------------------

--
-- 資料表結構 `web_setting`
--

DROP TABLE IF EXISTS `web_setting`;
CREATE TABLE IF NOT EXISTS `web_setting` (
  `Admin_ID` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理者',
  `Setting_BankCode` varchar(30) DEFAULT NULL COMMENT '銀行代號+銀行名',
  `Setting_BankAcc` varchar(20) DEFAULT NULL COMMENT '銀行帳號',
  `Setting_BankName` varchar(20) DEFAULT NULL COMMENT '銀行戶名',
  `Setting_Index01` text COMMENT '首頁品牌故事簡介',
  `Setting_Index02` text COMMENT '首頁訂做文字',
  `Setting_privacy` text COMMENT '隱私權',
  `Setting_PriceLimit` varchar(10) DEFAULT NULL COMMENT '貨到付款限制金額	',
  `Setting_Alert` text COMMENT '首頁彈跳視窗',
  PRIMARY KEY (`Admin_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_setting`
--

INSERT INTO `web_setting` (`Admin_ID`, `Setting_BankCode`, `Setting_BankAcc`, `Setting_BankName`, `Setting_Index01`, `Setting_Index02`, `Setting_privacy`, `Setting_PriceLimit`, `Setting_Alert`) VALUES
(2, '700 中華郵政', '01234567890123', '收款人', '專業網站平台設計團隊，讓您的購物網站快速建置完成，\r\n多功能完整操作簡易的後台，新手也能輕鬆上手，\r\n立即聯絡我們為您打造專屬於您的個性化網店。', '專業網站平台設計團隊\r\n打造專屬您品牌的個人風格', '%bm%1%bm%ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(87, 89, 91); font-family: Meiryo, 微軟正黑體, &quot;Microsoft JhengHei&quot;; font-size: 14px;\"%bm%2%bm%\n	%bm%1%bm%li style=\"box-sizing: border-box;\"%bm%2%bm%個人資料之安全%bm%1%bm%br style=\"box-sizing: border-box;\" /%bm%2%bm%\n	保護會員的個人隱私是重要的理念，在未經會員同意之下，我們絕不會將會員的個人資料提供予任何與本網站服務無關之第三人。會員應妥善保密自己的網路密碼及個人資料，不要將任何個人資料，網路密碼提供給任何人。在使用本網站提供的各項服務功能後，務必記得登出帳戶，若是與他人共享電腦或使用公共電腦，切記要關閉瀏覽器視窗。%bm%1%bm%/li%bm%2%bm%\n%bm%1%bm%/ul%bm%2%bm%\n\n%bm%1%bm%ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(87, 89, 91); font-family: Meiryo, 微軟正黑體, &quot;Microsoft JhengHei&quot;; font-size: 14px;\"%bm%2%bm%\n	%bm%1%bm%li style=\"box-sizing: border-box;\"%bm%2%bm%個人資料的蒐集、處理、利用%bm%1%bm%br style=\"box-sizing: border-box;\" /%bm%2%bm%\n	本網站所取得的個人資料，都僅供本公司內部、依照原來所說明的使用目的和範圍，除非事先說明、或依照相關法律規定，否則不會將資料提供給第三人、或移作其他目的使用。%bm%1%bm%/li%bm%2%bm%\n%bm%1%bm%/ul%bm%2%bm%\n\n%bm%1%bm%ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(87, 89, 91); font-family: Meiryo, 微軟正黑體, &quot;Microsoft JhengHei&quot;; font-size: 14px; list-style-type: circle;\"%bm%2%bm%\n	%bm%1%bm%li style=\"box-sizing: border-box;\"%bm%2%bm%蒐集之目的：蒐集之目的在於進行行銷業務、管理與服務及其他電子服務及與調查、統計與研究分析(法定特定目的項目編號為Ｏ四Ｏ、Ｏ九Ｏ、一四八、一五七)。將藉由加入會員之過程或進行交易之過程來蒐集個人資料。%bm%1%bm%/li%bm%2%bm%\n	%bm%1%bm%li style=\"box-sizing: border-box;\"%bm%2%bm%蒐集之個人資料類別：網站內蒐集的個人資料包括，辨識個人者：如會員之姓名、地址、電話、電子郵件等資訊。辨識財務者：如金融機構帳戶資訊。個人描述：例如：性別、出生年月日等。%bm%1%bm%/li%bm%2%bm%\n	%bm%1%bm%li style=\"box-sizing: border-box;\"%bm%2%bm%利用期間、地區、對象及方式：期間：會員當事人要求停止使用本公司提供服務之日為止。地區：會員之個人資料將用於台灣地區。利用對象及方式：會員之個人資料蒐集除用於本公司之會員管理、客戶管理之檢索查詢等功能外，亦將利用於辨識身份、金流服務、物流服務、行銷廣宣等。例示如下：以會員身份使用本公司提供之各項服務時，於頁面中自動顯示會員資訊。宣傳廣告或行銷等：提供會員各種電子雜誌等資訊、透過電子郵件、郵件、電話等提供與服務有關之資訊。將會員所瀏覽之內容或廣告，依客戶之個人屬性或購買紀錄、本公司網站之瀏覽紀錄等項目，進行個人化作業、會員使用服務之分析、新服務之開發或既有服務之改善等。其他服務關連事項，與會員進行聯繫。回覆客戶之詢問：針對會員透過電子郵件、郵件、電話或其他任何直接間接連絡方式向本公司所提出之詢問進行回覆。%bm%1%bm%/li%bm%2%bm%\n	%bm%1%bm%li style=\"box-sizing: border-box;\"%bm%2%bm%如拒絕提供加入會員所需必要之資料，將可能導致無法享受完整服務或完全無法使用該項服務。%bm%1%bm%/li%bm%2%bm%\n%bm%1%bm%/ul%bm%2%bm%', '3000', '');

-- --------------------------------------------------------

--
-- 資料表結構 `web_version`
--

DROP TABLE IF EXISTS `web_version`;
CREATE TABLE IF NOT EXISTS `web_version` (
  `Version_ID` int UNSIGNED NOT NULL,
  `Version_Title` varchar(60) DEFAULT NULL COMMENT '版本名稱',
  `Version_Price` text COMMENT '版本金額',
  `Version_Day` int NOT NULL DEFAULT '0' COMMENT '購買天數',
  `Version_Count` int NOT NULL DEFAULT '0' COMMENT '人數',
  `Version_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Version_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  `Version_Sdate` datetime DEFAULT NULL COMMENT '建立時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_version`
--

INSERT INTO `web_version` (`Version_ID`, `Version_Title`, `Version_Price`, `Version_Day`, `Version_Count`, `Version_Sort`, `Version_Open`, `Version_Sdate`) VALUES
(99999999, '試用版', '0', 30, 5, 99, 0, '2017-11-30 15:11:35'),
(17113002, '10人版', '1000', 365, 10, 98, 0, '2017-11-30 15:11:48'),
(17113003, '20人', '4000', 365, 20, 97, 0, '2017-11-30 15:12:18'),
(17113004, '50人版', '10000', 365, 50, 96, 0, '2017-11-30 15:37:35'),
(17122101, '10人版', '12000', 99999, 10, 98, 0, '2017-12-21 17:42:39'),
(17122501, '50人版', '25000', 99999, 50, 96, 0, '2017-12-25 10:53:55'),
(17122102, '20人', '18000', 99999, 20, 97, 0, '2017-12-21 17:47:52'),
(21051802, '40人以下正式版', '15000', 120, 40, 97, 0, '2017-12-21 17:47:52'),
(21051801, '20人以下正式版', '30000', 365, 20, 98, 0, '2017-12-21 17:47:52'),
(100000002, '20人(打卡)', '30000', 365, 20, 94, 1, '2021-06-28 14:46:52'),
(21051803, '40人以下正式版', '40000', 365, 40, 96, 0, '2017-12-21 17:47:52'),
(21051804, '40人以上專業版', '30000', 120, 40, 95, 0, '2017-12-21 17:47:52'),
(21051805, '40人以上專業版', '50000', 365, 40, 94, 0, '2017-12-21 17:47:52'),
(100000003, '40人(打卡)', '60000', 365, 40, 94, 1, '2021-06-28 14:47:52'),
(100000004, '60人以上(打卡)', '270000', 365, 99999, 94, 0, '2021-07-02 14:30:52'),
(100000005, '20人(打卡+薪資)', '100000', 120, 20, 93, 1, '2022-04-29 09:22:13'),
(100000006, '40人(打卡+薪資)', '300000', 120, 40, 93, 1, '2022-04-29 09:22:13'),
(100000007, '60人以上(打卡+薪資)', '400000', 120, 99999, 93, 1, '2022-04-29 09:30:44');

-- --------------------------------------------------------

--
-- 資料表結構 `web_video`
--

DROP TABLE IF EXISTS `web_video`;
CREATE TABLE IF NOT EXISTS `web_video` (
  `Video_ID` int UNSIGNED NOT NULL,
  `Video_Title` varchar(60) DEFAULT NULL COMMENT '標題',
  `Video_YouTube` varchar(11) DEFAULT NULL COMMENT 'YouTube',
  `Video_Sort` int UNSIGNED DEFAULT '0' COMMENT '排序',
  `Video_Open` tinyint UNSIGNED DEFAULT '0' COMMENT '啟用',
  `Video_Sdate` datetime DEFAULT NULL COMMENT '建立時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `web_video`
--

INSERT INTO `web_video` (`Video_ID`, `Video_Title`, `Video_YouTube`, `Video_Sort`, `Video_Open`, `Video_Sdate`) VALUES
(17120401, '任意卡教學 | IOS版本 |', 'sFpkDJfh5mo', 0, 1, '2017-12-04 13:57:48');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
