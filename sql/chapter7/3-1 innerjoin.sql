USE sqldb;
CREATE TABLE stdtbl
( stdname VARCHAR(10) NOT NULL PRIMARY KEY,
addr CHAR(4) NOT NULL
);
CREATE TABLE clubtbl
(clubname VARCHAR(10) not NULL primary key,
roomno CHAR(4) NOT NULL
);
CREATE TABLE stdclubtbl
(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
stdname VARCHAR(10) NOT NULL,
clubname VARCHAR(10) NOT NULL,
foreign KEY(stdname) REFERENCES stdtbl (STDNAME),
foreign KEY(clubname) REFERENCES clubtbl (clubname)
);

INSERT INTO stdtbl VALUES ('강호동', '경북'), ('김제동', '경남'),
('김용만', '서울'), ('이휘재', '경기'), ('박수홍', '서울');
INSERT INTO clubtbl VALUES ('수영', '101호'), ('바둑', '102호'),
('축구','103호'), ('봉사', '104호');
INSERT INTO stdclubtbl VALUES (NULL, '강호동', '바둑'), (NULL,
'강호동', '축구'), (NULL, '김용만', '축구'), (NULL, '이휘재', '축구'),
(NULL, '이휘재', '봉사'), (NULL, '박수홍', '봉사');

SELECT S.stdName, S.addr, C.clubName, C.roomNo 
FROM stdTBL S 
INNER JOIN stdclubTBL SC ON S.stdName = SC.stdName 
INNER JOIN clubTBL C ON SC.clubName = C.clubName 
ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr 
FROM stdTBL S 
INNER JOIN stdclubTBL SC ON SC.stdName = S.stdName 
INNER JOIN clubTBL C ON SC.clubName = C.clubName 
ORDER BY C.clubName;