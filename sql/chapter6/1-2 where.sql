SELECT * FROM usertbl WHERE userName ='강호동';

SELECT DISTINCT addr FROM usertbl;

SELECT * FROM `sqldb`.`usertbl` ORDER BY `username` ASC LIMIT 2;

CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buytbl3;
