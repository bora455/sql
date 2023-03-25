SELECT if (100>200, '참이다', '거짓이다');

SELECT IFNULL(NULL, '널이군요'),
IFNULL(100, '널이군요');

SELECT NULLIF(100, 100),
NULLIF(200, 100);

SELECT ascII('A'), CHAR(65);

SELECT BIT_LENGTH('ABC'), CHAR_LENGTH('ABC'), LENGTH('ABC')
, bit_LENGTH('강은희'), CHAR_LENGTH('강은희'), LENGTH('강은희');

SELECT CONCAT_WS('♥', '강','은','희');

SELECT FORMAT(123456.123456, 4);

SELECT INSTR('kangeunhee', 'h');

SELECT LOCATE('h', 'kangeunhee');

SELECT bin(10), HEX(10), OCT(10);

SELECT INSERT('kangeunhee', 5, 3, 'joung');

SELECT LEFT('kangeunhee', 4), RIGHT('kangeunhee', 6) ,
UPPER('KangEunHee'), LOWER('KangEunHee');

SELECT LPAD('eunhee', 10, 'kang'), RPAD('kang', 10, 'eunhee');

SELECT LTRIM('   eunhee   '), RTRIM('    eunhee   '),
TRIM('    eunhee   ');

SELECT repeat('eunhee  ', 2),
REPLACE('kang eunhee', 'eunhee', 'jounghi'),
reverse('eunhee');

SELECT SPACE(5),
SUBSTRING('KangEunHee', 5, 6),
SUBSTRING_INDEX('KangEunHee', 'e', 2);

SELECT ABS(5), SIN(5), COS(5), TAN(5);

SELECT CEILING(3.5), FLOOR(3.5), ROUND(3.5),
CONV(10, 10, 2), CONV(10, 2, 10);

SELECT MOD(5, 2), 5%2, 5 MOD 2;

select POW(2, 4), SQRT(9);

SELECT FLOOR(1 + (RAND() * (10-1)));

SELECT SIGN(-3), SIGN(3),
TRUNCATE(12345.25689, 2), TRUNCATE(12345.25689, -2);
