employeesDROP procedure if EXISTS ifproc;
delimiter $$
CREATE PROCEDURE ifproc()
BEGIN
	declare var1 INT;
	SET var1 = 100;
	
	if var1 = 100 then
SELECT '100입니다.';
	ELSE
		SELECT '100이 아닙니다.';
	End if;
END $$
delimiter;
CALL ifproc();



DROP PROCEDURE if EXISTS ifproc2;
USE employees;

delimiter $$
CREATE PROCEDURE ifproc2()
BEGIN
DECLARE hireDATE DATE;
DECLARE CURDATE DATE;
DECLARE days INT;

SELECT hire_date INTO hiredate
	FROM employees.employees
	WHERE emp_no = 10001;

SET CURDATE = CURRENT_DATE();
SET days = DATEDIFF(CURDATE, hiredate);

if (days/365) >= 5 then
	SELECT CONCAT('입사한지', days, '일이나 지났습니다. 축하합니다!');
ELSE
	SELECT '입사한지' + days + '일밖에 안되었네요. 열심히 일하세요.';
END if;
END $$
delimiter;
CALL ifproc2();



DROP PROCEDURE if EXISTS ifProc3;
delimiter $$
CREATE PROCEDURE ifProc3()
BEGIN
	DECLARE POINT INT;
	DECLARE credit CHAR(1);
	SET POINT = 77;
	
	if POINT >= 90 then
SET credit = 'A';
	elseif POINT >= 80 then
SET credit = 'B';
	elseif POINT >= 70 then
SET credit = 'C';
	elseif POINT >= 60 then
SET credit = 'D';
	else
SET credit = 'F';
	END if;
	SELECT CONCAT('취득점수==>', POINT), CONCAT('학점==>', credit);
END $$
delimiter ;
CALL ifProc3();