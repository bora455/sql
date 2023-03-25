USE sqldb;

SET @myVar1 =5;
SET @myVar2 =3;
SET @myVar3 =4.25;
SET @myVar4 ='가수 이름 ==> ';
SELECT @myVar1;
SELECT @myVar2 + @myVar3 ;

SELECT @myVar4, userName FROM usertbl WHERE height > 180 ;

USE sqldb;
SET @myVar1 =3;
PREPARE myQuery FROM 'select userName, height from userTBL order by height limit ?';
EXECUTE myQuery USING @myVar1;