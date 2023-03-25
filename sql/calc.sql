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


-- calc 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `calc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `calc`;

-- 테이블 calc.calc 구조 내보내기
CREATE TABLE IF NOT EXISTS `calc` (
  `n1` int(11) NOT NULL,
  `op` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `n2` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  PRIMARY KEY (`n1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 calc.calc:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `calc` DISABLE KEYS */;
INSERT INTO `calc` (`n1`, `op`, `n2`, `result`) VALUES
	(5, '*', 6, 0),
	(44, '+', 44, 88);
/*!40000 ALTER TABLE `calc` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
