-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 25, 2011 at 06:26 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ads`
--

CREATE TABLE IF NOT EXISTS `tbl_ads` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `imgfile` varchar(50) NOT NULL,
  `url` char(150) NOT NULL,
  `orders` tinyint(3) NOT NULL DEFAULT '1',
  `publish` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `position` enum('L','R','T','B') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `tbl_ads`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_attribute`
--

CREATE TABLE IF NOT EXISTS `tbl_attribute` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `category` int(5) NOT NULL,
  `type` enum('Integer','Float','Double','Varchar','Text') NOT NULL,
  `nameatt` varchar(255) NOT NULL,
  `unit` varchar(250) NOT NULL,
  `status` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_attribute`
--

INSERT INTO `tbl_attribute` (`id`, `category`, `type`, `nameatt`, `unit`, `status`) VALUES
(1, 2, 'Varchar', 'size', '', 'Yes'),
(2, 2, 'Float', 'tốc độ xử lý', 'GHz', 'Yes'),
(3, 2, 'Integer', 'Memory', 'MB', 'Yes'),
(4, 4, 'Float', 'Cân nặng', 'kg', 'Yes'),
(5, 4, 'Text', 'lấy nét', '', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_att_double`
--

CREATE TABLE IF NOT EXISTS `tbl_att_double` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idatt` int(5) NOT NULL,
  `idp` int(5) NOT NULL,
  `detail` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_att_double`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_att_float`
--

CREATE TABLE IF NOT EXISTS `tbl_att_float` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idatt` int(5) NOT NULL,
  `idp` int(5) NOT NULL,
  `detail` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_att_float`
--

INSERT INTO `tbl_att_float` (`id`, `idatt`, `idp`, `detail`) VALUES
(1, 2, 1, 0.8),
(2, 2, 2, 0.5),
(3, 4, 3, 1.23),
(4, 4, 4, 1.25),
(5, 4, 6, 1.78);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_att_int`
--

CREATE TABLE IF NOT EXISTS `tbl_att_int` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idatt` int(5) NOT NULL,
  `idp` int(5) NOT NULL,
  `detail` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_att_int`
--

INSERT INTO `tbl_att_int` (`id`, `idatt`, `idp`, `detail`) VALUES
(1, 3, 1, 500),
(2, 3, 2, 780);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_att_text`
--

CREATE TABLE IF NOT EXISTS `tbl_att_text` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idatt` int(5) NOT NULL,
  `idp` int(5) NOT NULL,
  `detail` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_att_text`
--

INSERT INTO `tbl_att_text` (`id`, `idatt`, `idp`, `detail`) VALUES
(1, 5, 3, '<p>\r\n	lấy n&eacute;t tốt</p>\r\n<p>\r\n	Nhận dạng khu&ocirc;n mặt</p>\r\n'),
(2, 5, 4, '<p>\r\n	lấy n&eacute;t xấu</p>\r\n'),
(3, 5, 6, '<p>\r\n	Rất hay</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_att_varchar`
--

CREATE TABLE IF NOT EXISTS `tbl_att_varchar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idatt` int(5) NOT NULL,
  `idp` int(5) NOT NULL,
  `detail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_att_varchar`
--

INSERT INTO `tbl_att_varchar` (`id`, `idatt`, `idp`, `detail`) VALUES
(1, 1, 1, '128x12x15'),
(2, 1, 2, '177x15x13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE IF NOT EXISTS `tbl_category` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent` smallint(6) NOT NULL DEFAULT '0',
  `public` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `orders` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`, `parent`, `public`, `orders`) VALUES
(1, 'Điện Thoại', 0, 'Yes', 1),
(2, 'Smart Phone', 1, 'Yes', 1),
(3, 'Điện máy', 0, 'Yes', 1),
(4, 'Máy ảnh KTS', 3, 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE IF NOT EXISTS `tbl_contact` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `phone` char(20) NOT NULL,
  `user` char(50) NOT NULL,
  `pass` char(32) NOT NULL,
  `address` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_contact`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_counter`
--

CREATE TABLE IF NOT EXISTS `tbl_counter` (
  `visit` int(11) NOT NULL,
  `pageview` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_counter`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `age` int(5) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `notice` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `age`, `address`, `phone`, `notice`) VALUES
(1, 'Quân ', 21, 'HCMC', '1387429', ''),
(2, 'quan', 12, '12', '12', ''),
(3, 'rock', 21, '124', '33', ''),
(4, 'hanam', 22, '23', '23', ''),
(5, 'rock', 32, '22', '23', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE IF NOT EXISTS `tbl_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `description` tinytext NOT NULL,
  `content` text NOT NULL,
  `imgfile` varchar(100) NOT NULL,
  `keysearch` varchar(100) NOT NULL,
  `date_create` datetime NOT NULL,
  `publish` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hot` enum('Yes','No') NOT NULL DEFAULT 'No',
  `num_view` mediumint(8) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_news`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_online`
--

CREATE TABLE IF NOT EXISTS `tbl_online` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `time_login` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_online`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE IF NOT EXISTS `tbl_orders` (
  `madondathang` int(10) NOT NULL AUTO_INCREMENT,
  `makhachang` int(10) NOT NULL,
  `ngaydathang` date NOT NULL,
  `tinhtrang` int(11) NOT NULL,
  PRIMARY KEY (`madondathang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`madondathang`, `makhachang`, `ngaydathang`, `tinhtrang`) VALUES
(1, 1, '2011-12-24', 0),
(2, 0, '2011-12-25', 0),
(3, 2, '2011-12-25', 0),
(4, 3, '2011-12-25', 0),
(5, 4, '2011-12-25', 0),
(6, 0, '2011-12-25', 0),
(7, 5, '2011-12-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_details`
--

CREATE TABLE IF NOT EXISTS `tbl_orders_details` (
  `machitietdondathang` int(10) NOT NULL AUTO_INCREMENT,
  `masanpham` int(10) NOT NULL,
  `madondathang` int(10) NOT NULL,
  `soluong` int(10) NOT NULL,
  `dongia` float NOT NULL,
  PRIMARY KEY (`machitietdondathang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_orders_details`
--

INSERT INTO `tbl_orders_details` (`machitietdondathang`, `masanpham`, `madondathang`, `soluong`, `dongia`) VALUES
(1, 4, 1, 10, 6.7e+007),
(2, 2, 2, 2, 6.8e+006),
(3, 3, 2, 4, 4.8e+007),
(4, 2, 3, 1, 3.4e+006),
(5, 3, 4, 1, 1.2e+007),
(6, 1, 5, 1, 6.7e+006),
(7, 2, 6, 2, 6.8e+006),
(8, 2, 7, 3, 1.02e+007);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_price_series`
--

CREATE TABLE IF NOT EXISTS `tbl_price_series` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idp` int(5) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idp` (`idp`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_price_series`
--

INSERT INTO `tbl_price_series` (`id`, `idp`, `price`) VALUES
(1, 1, 8700000),
(2, 1, 5600000),
(3, 1, 6700000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE IF NOT EXISTS `tbl_products` (
  `id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` tinyint(8) NOT NULL,
  `price` double DEFAULT NULL,
  `imgfile` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `detail` text NOT NULL,
  `publish` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `status` enum('Yes','No','Medium') NOT NULL DEFAULT 'Yes',
  `keysearch` varchar(150) DEFAULT NULL,
  `view` mediumint(6) NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL,
  `hot` varchar(5) NOT NULL,
  `store` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`id`, `name`, `category`, `price`, `imgfile`, `description`, `detail`, `publish`, `status`, `keysearch`, `view`, `date_create`, `hot`, `store`) VALUES
(1, 'iphone 5', 2, 6700000, 'img/imgProduct/1.jpg', 'rất tốt', '<p>\r\n	<span style="background-color:#ffff00;">mới nhập về</span></p>\r\n', 'Yes', 'Yes', 'nothing', 8, '2011-12-14 00:00:00', 's', 21),
(2, 'C3', 2, 3400000, 'img/imgProduct/2.jpg', 'Rất hay', '<p>\r\n	<span style="background-color:#008000;">ok</span></p>\r\n', 'Yes', 'Yes', 'nothing', 8, '2011-12-14 00:00:00', 's', 15),
(3, 'canon A', 4, 12000000, 'img/imgProduct/3.jpg', 'Dòng mới của canon', '<p>\r\n	<span style="background-color:#e6e6fa;">Kh&aacute; ốtt</span></p>\r\n', 'Yes', 'Yes', 'nothing', 5, '2011-12-14 00:00:00', 's', 18),
(4, 'Nikon 22', 4, 6700000, 'img/imgProduct/4.jpg', 'R6át hay', '<p>\r\n	ok</p>\r\n', 'Yes', 'Yes', 'nothing', 3, '2011-12-14 00:00:00', 's', 113),
(5, 'Samsung H2', 4, 7680000, 'img/imgProduct/5.jpg', 'hay ghê', '<p>\r\n	tốt qu&aacute;</p>\r\n', 'Yes', 'Yes', 'nothing', 0, '2011-12-14 00:00:00', 's', 22),
(6, 'Sony', 4, 7890000, 'img/imgProduct/6.jpg', 'tốt quá', '<p>\r\n	H&agrave;ng ngon</p>\r\n<p>\r\n	Lắm</p>\r\n', 'Yes', 'Yes', 'nothing', 1, '2011-12-14 00:00:00', 's', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shopcart`
--

CREATE TABLE IF NOT EXISTS `tbl_shopcart` (
  `idc` int(10) NOT NULL,
  `idp` int(10) NOT NULL,
  `number` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_shopcart`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_statistics`
--

CREATE TABLE IF NOT EXISTS `tbl_statistics` (
  `ids` int(10) NOT NULL AUTO_INCREMENT,
  `idp` int(10) NOT NULL,
  `date` date NOT NULL,
  `view` int(10) NOT NULL,
  `buy` int(10) NOT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_statistics`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_support`
--

CREATE TABLE IF NOT EXISTS `tbl_support` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `phone` char(20) NOT NULL,
  `notes` varchar(250) NOT NULL,
  `type` enum('yahoo','skype') NOT NULL DEFAULT 'yahoo',
  `orders` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `publish` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_support`
--

INSERT INTO `tbl_support` (`id`, `nick`, `fullname`, `phone`, `notes`, `type`, `orders`, `publish`) VALUES
(1, 'asd á ? ?', 'asd', 'asd', 'h? lô su?ng  ni?ng h?', 'yahoo', 1, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` char(20) NOT NULL,
  `user_lev` tinyint(4) NOT NULL,
  `forgot` char(32) NOT NULL,
  `user_create` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `email`, `fullname`, `address`, `phone`, `user_lev`, `forgot`, `user_create`) VALUES
(1, 'root', '123', 'tranquansp@gmail.com', 'Tr?n Quân', 'QN', '019320394', 10, '0', 0),
(2, 'lttq', '123', 'xyz@yahoo.com', 'lttq', 'Qu?ng Ngãi', '0906546333', 1, '0', 0),
(3, 'quynhanh', '123', 'qahn@ga.com', 'lê nguy?n qu?nh anh', '12 nd qu?ng ngãi', '0183223367', 0, '', 0),
(9, 'QuanRocker', '12345', 'tranquansp@gmail.com', 'Traáº§n QuÃ¢n', '037859237859', '23875723659', 0, '', 0),
(10, 'rockstorm', '123', 'dsfsdf', 'sdf', '123', '123', 0, '', 0),
(11, 'rockstorm2011', '123', 'tranquansp@gmail.com', 'rock', 'HCMC', '8723648', 0, '', 0);

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `abc`()
BEGIN
SELECT id FROM tbl_customer WHERE id = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hay`()
BEGIN

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themchitiethoadon`(
in maHD int,
in maSP int,
in soSP int,
in giaSP double,
out maCT int
)
BEGIN
INSERT INTO tbl_orders_details(masanpham,madondathang,soluong,dongia) 
VALUES(maHD,maSP,soSP,giaSP);
SET maCT = LAST_INSERT_ID();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themDM`(
in nameloai varchar(45)  CHARACTER SET utf8,
in parent int,
out id int
)
BEGIN
INSERT INTO `shopcart`.`tbl_category` (`id`, `name`, `parent`,
`public`, `orders`) VALUES (NULL, nameloai, parent, 'Yes', '1');
SET id = LAST_INSERT_ID();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themhoadon`(
in maKH VARCHAR (45),
in ngay date,
out maHD int
)
BEGIN
INSERT INTO tbl_orders(makhachang,ngaydathang,tinhtrang) VALUES (maKH,ngay,0); 
SET maHD = LAST_INSERT_ID();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themkhachhang`(
in tenKH VARCHAR (45),
in ageKH int,
in addressKH VARCHAR (45),
in phoneKH VARCHAR (45),
out maKH int
)
BEGIN
INSERT INTO tbl_customer(name,age,address,phone) VALUES (tenKH,ageKH,addressKH,phoneKH); 
SET maKH = LAST_INSERT_ID();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themSanPham`(
in tenSP VARCHAR(45) CHARACTER SET utf8,
in cateSP int,
in giaSP double,
in mieutaSP TEXT CHARACTER SET utf8,
in chitietSP TEXT CHARACTER SET utf8,
in searchSP VARCHAR(45),
out mssp int
)
BEGIN
    INSERT INTO `shopcart`.`tbl_products` (`id`, `name`,
    `category`, `price`, `imgfile`, `description`,
    `detail`, `publish`, `status`, `keysearch`, `view`,
    `date_create`, `hot`,`store`) 
    VALUES (NULL, tenSP, cateSP, giaSP,
    '', mieutaSP, chitietSP, 'Yes', 'Yes',
    'nothing', '0', '2011-12-14 00:00:00', 's',searchSP);
SET mssp = LAST_INSERT_ID();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themsp`(
in tensp VARCHAR(255) CHARACTER SET utf8,
in thumuc int,
in gia double,
in mieuta varchar(255) CHARACTER SET utf8,
in chitiet text CHARACTER SET utf8,
in keysearch varchar(255),
out msp int
)
BEGIN

INSERT INTO `shopcart`.`tbl_products` (`id`, `name`, `category`, `price`, 
`imgfile`, `description`, `detail`, `publish`, `status`, `keysearch`, 
`view`, `date_create`, `hot`,`store`) VALUES (NULL, 
tensp, thumuc, gia, '', mieuta, 
chitiet, 'Yes', 'Yes', keysearch, '0', 
'', 's','1');
SET msp = LAST_INSERT_ID();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themthuoctinh`(
in maloai int,
in typeloai varchar(45),
in field varchar(45)
)
BEGIN

INSERT INTO `db_bestbuy`.`tbl_attribute` 
(`id`, `category`, `type`, `nameatt`) 
VALUES (NULL, maloai, typeloai, field);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themuser`(
in tenU VARCHAR (45),
in passU VARCHAR (45),
in emailU VARCHAR (45),
in fullnameU VARCHAR (45),
in addressU VARCHAR (45),
in phoneU VARCHAR (45),
out maU int
)
BEGIN
INSERT INTO tbl_user(username,password,email,fullname,address,phone)
VALUES (tenU,passU,emailU,fullnameU,addressU,phoneU); 
SET maU = LAST_INSERT_ID();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `timkiemRong`(
in nameSP VARCHAR(55)
)
BEGIN
SELECT * FROM tbl_products WHERE name like CONCAT('%',nameSP,'%')
AND status = 'Yes'
;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `timkiemSau`(
in nameSP VARCHAR(55),
in maloaiSP int,
in min double,
in max double
)
BEGIN
SELECT * FROM tbl_products WHERE name like CONCAT('%',nameSP,'%') 
AND status= 'Yes'
AND category = maloaiSP
AND price > min
AND price < max
;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `xemChiTietHoaDon`(
in maHD int
)
BEGIN
SELECT 
tbl_orders_details.madondathang as maHD,
tbl_products.id as masp,tbl_products.name as tenSP,
price as giaSP,soluong,dongia,
makhachang as maKH,tbl_customer.name as tenKH,
tbl_customer.age as ageKH,tbl_customer.address as diachiKH,
tbl_customer.phone as dienthoaiKH,
ngaydathang
FROM tbl_products, tbl_orders_details,tbl_orders,tbl_customer
WHERE tbl_orders_details.madondathang = maHD
AND tbl_orders_details.madondathang = tbl_orders.madondathang
AND tbl_orders.makhachang = tbl_customer.id
AND masanpham = tbl_products.id

;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `xemHoaDon`(
in maHD int
)
BEGIN
SELECT madondathang,ngaydathang, name, age, address, phone
FROM tbl_orders, tbl_customer
WHERE makhachang = id AND madondathang = maHD;
END$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
