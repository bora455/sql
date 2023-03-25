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


-- servletex 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `servletex` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `servletex`;

-- 함수 servletex.function_hierarchical 구조 내보내기
DELIMITER //
CREATE FUNCTION `function_hierarchical`() RETURNS int(11)
    READS SQL DATA
BEGIN
	declare v_articleNO INT;
	declare v_parentNO INT;
	declare CONTINUE HANDLER FOR NOT FOUND SET @articleNO = NULL;
	
	SET v_parentNO = @articleNO;
	SET v_articleNO = -1;
	
	if @articleno IS NULL then
		RETURN NULL;
	END if;
	
	loop
	
	SELECT MIN(articleNO) INTO @articleNO
	FROM t_board
	WHERE parentNO = v_parentNO
	AND articleNO > v_articleNO;
	
	if (@articleno IS NOT NULL) OR (v_parentno = @start_with) then
	SET @LEVEL := @LEVEL + 1;
	RETURN @articleno;
	END if;
	
	SET @LEVEL := @LEVEL -1;
	
	SELECT articleno, parentno INTO v_articleno, v_parentno
	FROM t_board
	WHERE articleno = v_parentno;
	
	END loop;
END//
DELIMITER ;

-- 테이블 servletex.t_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_board` (
  `articleNO` int(100) unsigned NOT NULL,
  `parentNO` int(100) DEFAULT 0,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `content` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `imageFileName` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `writeDate` timestamp NULL DEFAULT current_timestamp(),
  `id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`articleNO`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  CONSTRAINT `FK_ID` FOREIGN KEY (`id`) REFERENCES `t_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 servletex.t_board:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_board` DISABLE KEYS */;
INSERT INTO `t_board` (`articleNO`, `parentNO`, `title`, `content`, `imageFileName`, `writeDate`, `id`) VALUES
	(6, 0, '상품 후기입니다.', '이순신씨의 상품 후기를 올립니다!!', '0', '2023-01-11 17:30:59', 'lee'),
	(7, 6, '답변입니다.', '상품 좋습니다.', '0', '2023-01-11 17:30:39', 'lee'),
	(8, 6, '김유신입니다.', '김유신 테스트글입니다.', '0', '2023-01-11 17:30:18', 'ehtm'),
	(9, 0, '11', '11', 'a.jpg', '2023-01-13 13:31:50', 'hong'),
	(10, 0, '11', '11', 'c.jpg', '2023-01-20 17:06:41', 'hong'),
	(11, 0, '11', '11', 'c.jpg', '2023-01-20 17:07:13', 'hong'),
	(12, 0, '11', '111', 'b.jpg', '2023-01-20 17:20:20', 'hong');
/*!40000 ALTER TABLE `t_board` ENABLE KEYS */;

-- 테이블 servletex.t_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_member` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joinDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 servletex.t_member:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
INSERT INTO `t_member` (`id`, `pwd`, `name`, `email`, `joinDate`) VALUES
	('ehtm', '1234', '강은희', 'ehtm@naver.com', '2022-08-29 14:41:04'),
	('hong', '1234', '홍순이', NULL, '2023-01-06 14:39:20'),
	('jspark', '4321', '박지성', 'jspark@test.com', '2023-01-19 16:05:56'),
	('jung', '1234', '이순신', 'dasan@google.com', '2022-07-19 14:41:31'),
	('lee', '1234', '이순신', 'trurtleship@google.com', '2023-01-03 14:40:33'),
	('mong', '1234', '몽실이', 'ehtm@naver.com', '2023-01-06 14:39:42'),
	('pack', '1231', '12313', '12313', '2023-01-06 14:40:05');
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
