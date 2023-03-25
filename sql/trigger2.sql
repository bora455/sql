USE triggerdb;

CREATE TABLE ordertbl
	(orderno INT AUTO_INCREMENT PRIMARY KEY,
	 userid VARCHAR(5),
	 prodname VARCHAR(5),
	 orderamount INT);
CREATE TABLE prodtbl
	(prodname VARCHAR(5),
	 ACCOUNT INT);
CREATE TABLE delivertbl
	(deliverno INT AUTO_INCREMENT PRIMARY KEY,
	 prodname VARCHAR(5),
	 ACCOUNT INT UNIQUE);
	
INSERT INTO prodtbl VALUES ('사과', 100);
INSERT INTO prodtbl VALUES ('배', 100);
INSERT INTO prodtbl VALUES ('귤', 100);


drop TRIGGER if EXISTS ordertrg;
delimiter //
CREATE TRIGGER ordertrg
	AFTER insert
	ON ordertbl
	FOR EACH row
BEGIN
	UPDATE prodtbl SET ACCOUNT = ACCOUNT - NEW.orderamount
		WHERE prodname = NEW.prodname;
END //
delimiter ;

DROP TRIGGER IF EXISTS prodTrg;
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
END //
DELIMITER ;

INSERT INTO ordertbl VALUES (NULL, 'JOHN', '배', 20);

select * from ordertbl;
select * from prodtbl;
select * from delivertbl;

insert into ordertbl values (null, 'DANG', '사과', 9);
insert into ordertbl values (null, 'BOM', '귤', 30);

select * from ordertbl;
select * from prodtbl;
select * from delivertbl;