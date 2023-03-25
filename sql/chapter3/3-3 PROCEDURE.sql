delimiter //
CREATE PROCEDURE myproc()
BEGIN
	SELECT * FROM membertbl WHERE membername = '당탕이';
	SELECT * FROM producttbl WHERE productname = '냉장고';
END //
delimiter;
CALL myproc();