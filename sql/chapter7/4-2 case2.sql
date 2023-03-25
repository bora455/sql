USE sqldb;

SELECT userid, SUM(price*amount) AS '총구매액'
	FROM buytbl
	GROUP BY userid
	ORDER BY SUM(price*amount) DESC;
	
SELECT b.userid, u.username, SUM(price*amount) AS '총구매액'
	FROM buytbl b
		INNER JOIN usertbl u
			ON b.userid = u.userid
	GROUP BY b.userid, u.username
	ORDER BY SUM(price*amount) DESC;
	
SELECT b.userid, u.username, SUM(price*amount) AS '총구매액'
	FROM buytbl b
		RIGHT OUTER JOIN usertbl u
			ON b.userid = u.userid
	GROUP BY b.userid, u.username
	ORDER BY SUM(price*amount) DESC;
	
SELECT u.userid, u.username, SUM(price*amount) AS '총구매액'
	FROM buytbl b
		RIGHT OUTER JOIN usertbl u
			ON b.userid = u.userid
	GROUP BY u.userid, u.username
	ORDER BY SUM(price*amount) DESC;
	
SELECT u.userid, u.username, SUM(price*amount) AS '총구매액',
	case
		when (SUM(price*amount) >= 1500) then '최우수고객'
		when (SUM(price*amount) >= 1000) then '우수고객'
		when (SUM(price*amount) >= 1) then '일반고객'
		ELSE '유령고객'
	END AS '고객등급'
FROM buytbl b
	RIGHT OUTER JOIN usertbl u
		ON b.userid = u.userid
	GROUP BY u.userid, u.username
	ORDER BY SUM(price*amount) DESC;