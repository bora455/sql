-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- triggerdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `triggerdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `triggerdb`;

-- 테이블 triggerdb.delivertbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `delivertbl` (
  `deliverno` int(11) NOT NULL AUTO_INCREMENT,
  `prodname` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACCOUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`deliverno`),
  UNIQUE KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 triggerdb.delivertbl:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `delivertbl` DISABLE KEYS */;
INSERT INTO `delivertbl` (`deliverno`, `prodname`, `ACCOUNT`) VALUES
	(1, '배', 5),
	(5, '배', 20),
	(6, '사과', 9),
	(7, '귤', 30);
/*!40000 ALTER TABLE `delivertbl` ENABLE KEYS */;

-- 테이블 triggerdb.ordertbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `ordertbl` (
  `orderno` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prodname` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderamount` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 triggerdb.ordertbl:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `ordertbl` DISABLE KEYS */;
INSERT INTO `ordertbl` (`orderno`, `userid`, `prodname`, `orderamount`) VALUES
	(1, 'JOHN', '배', 5),
	(5, 'JOHN', '배', 20),
	(7, 'BOM', '귤', 30);
/*!40000 ALTER TABLE `ordertbl` ENABLE KEYS */;

-- 테이블 triggerdb.prodtbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `prodtbl` (
  `prodname` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACCOUNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 triggerdb.prodtbl:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `prodtbl` DISABLE KEYS */;
INSERT INTO `prodtbl` (`prodname`, `ACCOUNT`) VALUES
	('사과', 91),
	('배', 75),
	('귤', 70);
/*!40000 ALTER TABLE `prodtbl` ENABLE KEYS */;

-- 트리거 triggerdb.ordertrg 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER ordertrg
	AFTER insert
	ON ordertbl
	FOR EACH row
BEGIN
	UPDATE prodtbl SET ACCOUNT = ACCOUNT - NEW.orderamount
		WHERE prodname = NEW.prodname;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 triggerdb.prodTrg 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER prodTrg
	AFTER UPDATE 
	ON prodTBL 
	FOR EACH ROW 
BEGIN 
	DECLARE orderAmount INT; 
	SET orderAmount = OLD.account - NEW.account;
	INSERT INTO deliverTbl(prodName, ACCOUNT) 
		VALUES(NEW.prodName, orderAmount);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
