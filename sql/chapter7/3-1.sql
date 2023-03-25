USE sqlDB;
SELECT U.userID, U.userName, B.prodName, U.addr, 
CONCAT(U.mobile1, U.mobile2) AS '연락처' 
FROM userTBL U 
INNER JOIN buyTBL B ON U.userID = B.userID 
ORDER BY U.userID;

SELECT DISTINCT u.userID, u.username, u.addr
FROM usertbl u
INNER JOIN buytbl b ON u.userid = b.userID
ORDER BY u.userid;

SELECT u.userID, u.userName, u.addr
FROM usertbl u
WHERE exists (
select *
from buytbl b
WHERE U.userID = b.userID);