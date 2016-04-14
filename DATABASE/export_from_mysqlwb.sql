SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `shopcart` DEFAULT CHARACTER SET latin1 ;
USE `shopcart` ;

-- -----------------------------------------------------
-- Table `shopcart`.`tbl_ads`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_ads` (
  `id` TINYINT(3) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NOT NULL ,
  `imgfile` VARCHAR(50) NOT NULL ,
  `url` CHAR(150) NOT NULL ,
  `orders` TINYINT(3) NOT NULL DEFAULT '1' ,
  `publish` ENUM('Yes','No') NOT NULL DEFAULT 'Yes' ,
  `position` ENUM('L','R','T','B') NOT NULL DEFAULT 'T' ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_att_double`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_att_double` (
  `id` INT(5) NOT NULL AUTO_INCREMENT ,
  `idatt` INT(5) NOT NULL ,
  `idp` INT(5) NOT NULL ,
  `detail` DOUBLE NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_att_float`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_att_float` (
  `id` INT(5) NOT NULL AUTO_INCREMENT ,
  `idatt` INT(5) NOT NULL ,
  `idp` INT(5) NOT NULL ,
  `detail` FLOAT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_att_int`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_att_int` (
  `id` INT(5) NOT NULL AUTO_INCREMENT ,
  `idatt` INT(5) NOT NULL ,
  `idp` INT(5) NOT NULL ,
  `detail` INT(5) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_att_text`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_att_text` (
  `id` INT(5) NOT NULL AUTO_INCREMENT ,
  `idatt` INT(5) NOT NULL ,
  `idp` INT(5) NOT NULL ,
  `detail` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_att_varchar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_att_varchar` (
  `id` INT(5) NOT NULL AUTO_INCREMENT ,
  `idatt` INT(5) NOT NULL ,
  `idp` INT(5) NOT NULL ,
  `detail` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_attribute`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_attribute` (
  `id` INT(5) NOT NULL AUTO_INCREMENT ,
  `category` INT(5) NOT NULL ,
  `type` ENUM('Integer','Float','Double','Varchar','Text') NOT NULL ,
  `nameatt` VARCHAR(255) NOT NULL ,
  `unit` VARCHAR(250) NOT NULL ,
  `status` ENUM('Yes','No') NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_category` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `parent` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `public` ENUM('Yes','No') NOT NULL DEFAULT 'Yes' ,
  `orders` TINYINT(2) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_contact`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_contact` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `fullname` CHAR(50) NOT NULL ,
  `email` CHAR(50) NOT NULL ,
  `phone` CHAR(20) NOT NULL ,
  `user` CHAR(50) NOT NULL ,
  `pass` CHAR(32) NOT NULL ,
  `address` VARCHAR(250) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_counter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_counter` (
  `visit` INT(11) NOT NULL ,
  `pageview` INT(11) NOT NULL )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_customer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_customer` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(150) NOT NULL ,
  `age` INT(5) NOT NULL ,
  `address` VARCHAR(250) NOT NULL ,
  `phone` VARCHAR(50) NOT NULL ,
  `notice` VARCHAR(250) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_news`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_news` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `subject` VARCHAR(200) NOT NULL ,
  `description` TINYTEXT NOT NULL ,
  `content` TEXT NOT NULL ,
  `imgfile` VARCHAR(100) NOT NULL ,
  `keysearch` VARCHAR(100) NOT NULL ,
  `date_create` DATETIME NOT NULL ,
  `publish` ENUM('Yes','No') NOT NULL DEFAULT 'No' ,
  `hot` ENUM('Yes','No') NOT NULL DEFAULT 'No' ,
  `num_view` MEDIUMINT(8) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_online`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_online` (
  `id` INT(32) NOT NULL AUTO_INCREMENT ,
  `time_login` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_orders`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_orders` (
  `madondathang` INT(10) NOT NULL AUTO_INCREMENT ,
  `makhachang` INT(10) NOT NULL ,
  `ngaydathang` DATE NOT NULL ,
  `tinhtrang` INT(11) NOT NULL ,
  PRIMARY KEY (`madondathang`) )
ENGINE = MyISAM
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_orders_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_orders_details` (
  `machitietdondathang` INT(10) NOT NULL AUTO_INCREMENT ,
  `masanpham` INT(10) NOT NULL ,
  `madondathang` INT(10) NOT NULL ,
  `soluong` INT(10) NOT NULL ,
  `dongia` FLOAT NOT NULL ,
  PRIMARY KEY (`machitietdondathang`) )
ENGINE = MyISAM
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_price_series`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_price_series` (
  `id` INT(5) NOT NULL AUTO_INCREMENT ,
  `idp` INT(5) NOT NULL ,
  `price` DOUBLE NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `idp` (`idp` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_products`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_products` (
  `id` TINYINT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `category` TINYINT(8) NOT NULL ,
  `price` DOUBLE NULL DEFAULT NULL ,
  `imgfile` VARCHAR(250) NOT NULL ,
  `description` TEXT NOT NULL ,
  `detail` TEXT NOT NULL ,
  `publish` ENUM('Yes','No') NOT NULL DEFAULT 'Yes' ,
  `status` ENUM('Yes','No','Medium') NOT NULL DEFAULT 'Yes' ,
  `keysearch` VARCHAR(150) NULL DEFAULT NULL ,
  `view` MEDIUMINT(6) NOT NULL DEFAULT '0' ,
  `date_create` DATETIME NOT NULL ,
  `hot` VARCHAR(5) NOT NULL ,
  `store` INT(5) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_shopcart`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_shopcart` (
  `idc` INT(10) NOT NULL ,
  `idp` INT(10) NOT NULL ,
  `number` INT(10) NOT NULL ,
  `date` DATETIME NOT NULL ,
  `subject` VARCHAR(255) NOT NULL ,
  `content` TEXT NOT NULL )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_statistics`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_statistics` (
  `ids` INT(10) NOT NULL AUTO_INCREMENT ,
  `idp` INT(10) NOT NULL ,
  `date` DATE NOT NULL ,
  `view` INT(10) NOT NULL ,
  `buy` INT(10) NOT NULL ,
  PRIMARY KEY (`ids`) )
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_support`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_support` (
  `id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nick` VARCHAR(50) NOT NULL ,
  `fullname` VARCHAR(50) NOT NULL ,
  `phone` CHAR(20) NOT NULL ,
  `notes` VARCHAR(250) NOT NULL ,
  `type` ENUM('yahoo','skype') NOT NULL DEFAULT 'yahoo' ,
  `orders` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' ,
  `publish` ENUM('Yes','No') NOT NULL DEFAULT 'Yes' ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shopcart`.`tbl_user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `shopcart`.`tbl_user` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(50) NOT NULL ,
  `password` CHAR(32) NOT NULL ,
  `email` VARCHAR(50) NOT NULL ,
  `fullname` VARCHAR(50) NOT NULL ,
  `address` VARCHAR(150) NOT NULL ,
  `phone` CHAR(20) NOT NULL ,
  `user_lev` TINYINT(4) NOT NULL ,
  `forgot` CHAR(32) NOT NULL ,
  `user_create` TINYINT(4) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- procedure abc
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `abc`()
BEGIN
SELECT id FROM tbl_customer WHERE id = 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure hay
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `hay`()
BEGIN

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure themDM
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure themSanPham
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure themchitiethoadon
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure themhoadon
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `themhoadon`(
in maKH VARCHAR (45),
in ngay date,
out maHD int
)
BEGIN
INSERT INTO tbl_orders(makhachang,ngaydathang,tinhtrang) VALUES (maKH,ngay,0); 
SET maHD = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure themkhachhang
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure themsp
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure themthuoctinh
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure themuser
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure timkiemRong
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `timkiemRong`(
in nameSP VARCHAR(55)
)
BEGIN
SELECT * FROM tbl_products WHERE name like CONCAT('%',nameSP,'%')
AND status = 'Yes'
;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure timkiemSau
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure xemChiTietHoaDon
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure xemHoaDon
-- -----------------------------------------------------

DELIMITER $$
USE `shopcart`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemHoaDon`(
in maHD int
)
BEGIN
SELECT madondathang,ngaydathang, name, age, address, phone
FROM tbl_orders, tbl_customer
WHERE makhachang = id AND madondathang = maHD;
END$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
