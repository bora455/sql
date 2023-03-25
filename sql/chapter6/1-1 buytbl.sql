CREATE TABLE `buytbl` (
`num` INT(10) NOT NULL AUTO_INCREMENT,
`userID` CHAR(8) NOT NULL COLLATE ,
`prodName` CHAR(6) NOT NULL COLLATE ,
`groupName` CHAR(4) NULL DEFAULT NULL COLLATE ,
`price` INT(10) NOT NULL,
`amount` SMALLINT(5) NOT NULL,
PRIMARY KEY (`num`) USING BTREE,
INDEX `userID` (`userID`) USING BTREE,
CONSTRAINT `FK_buytbl_sqldb.usertbl` FOREIGN KEY (`userID`) REFERENCES
`sqldb`.`usertbl` (`userID`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (1, 'KHD', '운동화', NULL, 480, 2);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (2, 'KHD', '노트북', '전자', 16000, 
1);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (3, 'KYM', '모니터', '전자', 3200, 1);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (4, 'PSH', '모니터', '전자', 3200, 5);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (5, 'KHD', '청바지', '의류', 800, 3);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (6, 'PSH', '메모리', '전자', 1280, 
10);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (7, 'KJD', '책', '서적', 240, 5);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (8, 'LHJ', '책', '서적', 240, 2);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (9, 'LHJ', '청바지', '의류', 800, 1);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (10, 'PSH', '운동화', NULL, 480, 2);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (11, 'LHJ', '책', '서적', 240, 1);
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES (12, 'PSH', '운동화', NULL, 480, 2);
