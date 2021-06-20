CREATE DATABASE score;

USE score;

CREATE TABLE tbl_student (
	st_num		CHAR(8)		PRIMARY KEY,
	st_name		VARCHAR(20)	NOT NULL,	
	st_dept		VARCHAR(20)	NOT NULL,	
	st_grade	INT			NOT NULL,	
	st_tel		VARCHAR(15)	NOT NULL,	
	st_addr		VARCHAR(125)	
);

CREATE TABLE tbl_score (
	sc_seq		CHAR(8)		PRIMARY KEY,
	sc_stnum	CHAR(8)		NOT NULL,
	sc_subject	VARCHAR(20)	NOT NULL,
	sc_score	INT			NOT NULL	
);

ALTER TABLE tbl_score
ADD CONSTRAINT fk_student
FOREIGN KEY(sc_stnum)
REFERENCES tbl_student(st_num) ON DELETE CASCADE;

ALTER TABLE tbl_score
DROP FOREIGN KEY fk_student;

ALTER TABLE tbl_student
ADD UNIQUE (st_name, st_dept,st_tel);

SELECT * FROM tbl_student;
SELECT * FROM tbl_score;

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210001","홍길동","컴퓨터공학",2,"010-555-5555","서울특별시");

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210002","홍길동","컴퓨터공학",2,"010-666-5555","서울특별시");

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210003","홍길동","컴퓨터공학",2,"010-655-5555","서울특별시");

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210005","최길동","컴퓨터공학",2,"010-655-5555","서울특별시");

INSERT INTO tbl_score (sc_seq,sc_stnum,sc_subject,sc_score)
VALUES ("0000001","20210001","수학",80);

INSERT INTO tbl_score (sc_seq,sc_stnum,sc_subject,sc_score)
VALUES ("0000002","20210001","국어",90);

INSERT INTO tbl_score (sc_seq,sc_stnum,sc_subject,sc_score)
VALUES ("0000003","20210002","국어",90);


CREATE VIEW view_학생성적정보 AS 
(
	SELECT ST.st_num AS st_num,
		   ST.st_name AS st_name,
           ST.st_dept AS st_dept,
           ST.st_grade AS st_grade,
           COUNT(SC.sc_subject) AS sc_subject,
		   SUM(SC.sc_score) AS sc_scores,
           ROUND(AVG(SC.sc_score),1) AS sc_avg
    FROM tbl_student AS ST
		LEFT OUTER JOIN tbl_score AS SC
			ON ST.st_num = SC.sc_stnum
	GROUP BY ST.st_num
);    
SELECT * FROM view_학생성적정보;
DROP VIEW view_학생성적정보;

CREATE VIEW view_성적일람표 AS
(
SELECT ST.st_num AS st_num,
	   ST.st_name AS st_name,
       SUM(IF(SC.sc_subject = '국어', SC.sc_score, 0)) AS sc_kor,
       SUM(IF(SC.sc_subject = '영어', SC.sc_score, 0)) AS sc_eng,
       SUM(IF(SC.sc_subject = '수학', SC.sc_score, 0)) AS sc_math,
       SUM(IF(SC.sc_subject = '과학', SC.sc_score, 0)) AS sc_sci,
       SUM(SC.sc_score) AS sc_scores,
       ROUND(AVG(SC.sc_score),1) AS sc_avg
FROM tbl_student AS ST
	LEFT OUTER JOIN tbl_score AS SC
		ON ST.st_num = SC.sc_stnum
GROUP BY ST.st_num
);