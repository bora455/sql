USE sqldb

CREATE TABLE bigTBL1 (SELECT * FROM EMPLOYEES.employees);
CREATE TABLE bigTBL2 (SELECT * FROM EMPLOYEES.employees);
CREATE TABLE bigTBL3 (SELECT * FROM EMPLOYEES.employees);

DELETE FROM bigTBL1;
DROP TABLE bigTBL2;
TRUNCATE TABLE bigTBL3;