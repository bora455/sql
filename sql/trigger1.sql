USE sqldb;
CREATE TABLE if NOT EXISTS testtbl (id INT, txt VARCHAR(10));
INSERT INTO testtbl VALUES(1, '이엑스아이디');
INSERT INTO testtbl VALUES(2, '애프터스쿨');
INSERT INTO testtbl VALUES(3, '에이오에이');

DROP TRIGGER if EXISTS testtrg;
delimiter //
CREATE TRIGGER testtrg
	AFTER delete
	ON testtbl
	FOR EACH row
begin
	SET @msg = '가수 그룹이 삭제됨';
END //
delimiter ;

SET @msg = '';
INSERT INTO testtbl VALUES(4, '나인뮤지스');
SELECT @msg;
UPDATE testtbl SET txt = '에이핑크' WHERE id=3;
SELECT @msg;
DELETE FROM testtbl WHERE id=4;
SELECT @msg;

CREATE TABLE backup_usertbl
(  userid CHAR(8) NOT NULL PRIMARY KEY,
	userNAME VARCHAR(10) NOT NULL,
	birthyear INT NOT NULL,
	addr CHAR(2) NOT NULL,
	mobile1 CHAR(2),
	mobile2 CHAR(8),
	height SMALLINT,
	mdate DATE,
	modtype CHAR(2),
	moddate DATE,
	moduser VARCHAR(256)
	);

USE sqldb;	
DROP TRIGGER if EXISTS backusertbl_deletetrg;
delimiter //
CREATE TRIGGER backusertbl_updatetrg
	AFTER UPDATE
	ON usertbl
	FOR EACH row
BEGIN
	INSERT INTO backup_usertbl VALUES (OLD.userid, OLD.username, OLD.birthyear,
		OLD.addr, OLD.mobile1, OLD.mobile2, OLD.height, OLD.mdate,
		'수정', CURDATE(), CURRENT_USER() );
END //
delimiter ;

DROP TRIGGER IF EXISTS backUserTbl_DeleteTrg;
DELIMITER // 
CREATE TRIGGER backUserTbl_DeleteTrg  
	AFTER DELETE 
	ON usertbl 
	FOR EACH ROW 
BEGIN 
	INSERT INTO backup_usertbl VALUES( OLD.userID, OLD.username, OLD.birthYear, 
		OLD.addr, OLD.mobile1, OLD.mobile2, OLD.height, OLD.mDate, 
		'삭제', CURDATE(), CURRENT_USER() );
END // 
DELIMITER ; 

UPDATE usertbl SET addr = '몽고' WHERE userid = 'JKW';
DELETE FROM usertbl WHERE height >= 177;

SELECT * FROM backup_usertbl;
SELECT * FROM backup_usertbl;