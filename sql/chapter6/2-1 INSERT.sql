DROP TABLE if EXISTS `last_insert_id_table`;

CREATE TABLE `last_insert_id_table` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`col` VARCHAR(10) DEFAULT NULL,
PRIMARY KEY(`id`)
);

INSERT INTO last_insert_id_table(col)
VALUES('1row'),('2row'),('3row');

SELECT LAST_INSERT_ID();
SELECT * from last_insert_id_table;



DROP TABLE IF EXISTS `last_insert_id_tabletwo`;
CREATE TABLE `last_insert_id_tabletwo` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`col` VARCHAR(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
PRIMARY KEY (`id`)
);

INSERT INTO last_insert_id_tabletwo(col)
VALUES('1row');
INSERT INTO last_insert_id_tabletwo(col)
VALUES('2row');
INSERT INTO last_insert_id_tabletwo(col)
VALUES('3row');

SELECT LAST_INSERT_ID();
SELECT * from last_insert_id_tabletwo;
