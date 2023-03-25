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


-- testdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `testdb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `testdb`;

-- 테이블 testdb.buytbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `buytbl` (
  `prodName` varchar(3) DEFAULT NULL,
  `prodObject` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  KEY `fk_buytbl_usertbl_idx` (`prodName`),
  CONSTRAINT `fk_buytbl_usertbl` FOREIGN KEY (`prodName`) REFERENCES `usertbl` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 testdb.buytbl:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `buytbl` DISABLE KEYS */;
INSERT INTO `buytbl` (`prodName`, `prodObject`, `price`, `amount`) VALUES
	('김범수', '운동화', 30, 2),
	('김범수', '노트북', 1000, 1),
	('조용필', '모니터', 200, 1),
	('바비킴', '모니터', 200, 5),
	('김범수', '청바지', 50, 3),
	('바비킴', '메모리', 80, 10),
	('성시경', '책', 15, 5),
	('은지원', '책', 15, 2),
	('바비킴', '운동화', 30, 2),
	('은지원', '책', 15, 1),
	('바비킴', '운동화', 30, 2);
/*!40000 ALTER TABLE `buytbl` ENABLE KEYS */;

-- 테이블 testdb.usertbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `usertbl` (
  `userName` varchar(3) NOT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `userTBLcol` varchar(45) DEFAULT NULL,
  `addr` varchar(2) DEFAULT NULL,
  `mobile` varchar(12) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 testdb.usertbl:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `usertbl` DISABLE KEYS */;
INSERT INTO `usertbl` (`userName`, `birthYear`, `userTBLcol`, `addr`, `mobile`) VALUES
	('김경호', 1971, NULL, '전남', '019-333-3333'),
	('김범수', 1979, NULL, '경남', '011-222-2222'),
	('바비킴', 1973, NULL, '서울', '010-000-0000'),
	('성시경', 1979, NULL, '경남', '안 남김'),
	('윤종신', 1969, NULL, '경남', '안 남김'),
	('은지원', 1978, '', '경북', '011-888-8888'),
	('이승기', 1987, '', '서울', '011-111-1111'),
	('임재범', 1963, NULL, '서울', '016-666-6666'),
	('조관우', 1965, NULL, '경기', '018-999-9999'),
	('조용필', 1950, NULL, '경기', '011-444-4444');
/*!40000 ALTER TABLE `usertbl` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
