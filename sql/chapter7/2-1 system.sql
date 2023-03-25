SELECT CURRENT_USER(), DATABASE();

USE cookdb;
SELECT * FROM usertbl;
SELECT FOUND_ROWS();

USE sqldb;
UPDATE buytbl SET
price=price * 2;
SELECT ROW_COUNT();

SELECT SLEEP(5),
'짠~ 5초가 지나서 제가 보여요';