USE sqldb;
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;
SELECT convert(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM
buytbl;

USE sqldb;
SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)), '=') AS
'단가*수량', price * amount AS '구매액' FROM buytbl;