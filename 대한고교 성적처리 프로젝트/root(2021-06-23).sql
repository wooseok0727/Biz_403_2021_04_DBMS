CREATE DATABASE db_school;

USE db_school;

CREATE TABLE tbl_student (
	st_num		CHAR(8)		PRIMARY KEY,
	st_name		VARCHAR(20)	NOT NULL,	
	st_dept		VARCHAR(20)	NOT NULL,	
	st_grade	INT			NOT NULL,	
	st_tel		VARCHAR(15)	NOT NULL,	
	st_addr		VARCHAR(125)		
);

INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade, st_tel, st_addr)
VALUES('20210001','홍길동','컴퓨터공학',3,'010-111-1234',"서울특별시");

SELECT * FROM tbl_student;

CREATE TABLE tbl_score (
	sc_seq		BIGINT		AUTO_INCREMENT	PRIMARY KEY,
	sc_stnum	CHAR(8)		NOT NULL,	
	sc_sbcode	CHAR(4)		NOT NULL,	
	sc_score	INT			NOT NULL	
);

INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
VALUES('20210001','S001',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
VALUES('20210001','S002',100);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
VALUES('20210001','S003',70);

DROP TABLE tbl_score;

SELECT * FROM tbl_score;

CREATE TABLE tbl_subject(
	sb_code	CHAR(4)		PRIMARY KEY,
	sb_name	VARCHAR(20)	NOT NULL,
	sb_prof	VARCHAR(20)		
);

INSERT INTO tbl_subject(sb_code, sb_name, sb_prof)
VALUES('S001','국어','박길동');
INSERT INTO tbl_subject(sb_code, sb_name, sb_prof)
VALUES('S002','영어','김길동');
INSERT INTO tbl_subject(sb_code, sb_name, sb_prof)
VALUES('S003','수학','최길동');
INSERT INTO tbl_subject(sb_code, sb_name, sb_prof)
VALUES('S004','음악','이길동');
INSERT INTO tbl_subject(sb_code, sb_name, sb_prof)
VALUES('S005','과학','박문수');

DROP TABLE tbl_subject;
SELECT * FROM tbl_subject;