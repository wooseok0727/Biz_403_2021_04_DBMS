USE myLibs;

CREATE TABLE tbl_gallery(
	g_seq		BIGINT			AUTO_INCREMENT	PRIMARY KEY,
	g_writer	VARCHAR(20)		NOT NULL,	
	g_date		VARCHAR(10)		NOT NULL,	
	g_time		VARCHAR(10)		NOT NULL,	
	g_subject	VARCHAR(50)		NOT NULL,	
	g_content	VARCHAR(1000)	NOT NULL,	
	g_image		VARCHAR(125)		
);

SHOW TABLES;

DROP TABLE tbl_gallery;

CREATE TABLE tbl_files (
	file_seq		BIGINT		AUTO_INCREMENT	PRIMARY KEY,
	file_gseq		BIGINT		NOT NULL,	
	file_originname	VARCHAR(125)	NOT NULL,
	file_upname		VARCHAR(125)	NOT NULL	
);

SHOW TABLES;
DROP TABLE tbl_files;

SELECT * FROM tbl_gallery;
SELECT * FROM tbl_files;

-- 현재 연결된 session에서 INSERT가 수행되고
-- 그 과정에서 AUTO_INCREMENT 컬럼이 변화가 있으면
-- 그 값을 알려주는 함수
SELECT LAST_INSERT_ID();

DESC tbl_gallery;

INSERT INTO tbl_files(file_gseq, file_originname, file_upname)
VALUES
(1,"title1",'uuid-title'),
(1,"title2",'uuid-title'),
(1,"title3",'uuid-title');

-- INSERT를 수행할때
-- AUTO_INCREMENT로 설정된 칼럼에
-- 0 또는 null, ''등을 설정하면
-- AUTO_INCREMENT가 작동된다

INSERT INTO tbl_gallery (g_seq,g_writer,g_date,g_time,g_subject,g_content)
VALUES ( 0, 'ws','2021-01-01','12:00:00','제목','내용');

-- EQ JOIN
-- 카디션 곱
-- 두개의 table을 JOIN하여
-- table1 개수 * table2 개수 만큼 list 출력
SELECT * FROM tbl_gallery G, tbl_files F
WHERE G.g_seq = F.file_gseq AND G.g_seq = 1;

/*
	view_갤러리의 SQL 코드
    EQ JOIN을 만들어서 보여지는 코드
    tbl_gallery 에는 데이터가 있는데
    tbl_files에 연결되는 데이터가 하나도 없는 경우
    tbl_gallery 자체가 출력되지 않는 문제가 있다
*/
CREATE VIEW view_갤러리 AS
(
SELECT G.g_seq AS g_seq, 
	   G.g_writer AS g_writer, 
       G.g_date AS g_date, 
       G.g_time AS g_time, 
       G.g_subject AS g_subject, 
       G.g_content AS g_content, 
       G.g_image AS g_image, 
       F.file_seq AS f_seq,
       F.file_originname AS f_originname, 
       F.file_upname AS f_upname
FROM tbl_gallery G, tbl_files F
WHERE G.g_seq = F.file_gseq
);

/*
	1:N 관계의 table일 경우
    보통은 FK로 설정하여 데이터를 유지한다
    
    1:0..N : child table에 연관된 데이터가 하나도 없는 경우가 있다
	1:1..N : child table에 연관된 데이터가  최소 1개는 있는 경우
    
    1:0..N 인 경우는 
		child table에 데이터가 하나도 없는 경우 EQ JOIN을 수행하면 출력되는 데이터가 한개도 없는 상황이 발생한다
    1:1..N 인 경우는 
		EQ JOIN을 수행해도 실제로 Parent table에 있는 데이터는 무조건 출력이 된다
        
	JOIN을 수행할때는 FK가 설정에 관계없이 
		JOIN은 LEFT(OUTER) JOIN을 수행하는 것이 좋다
*/
SELECT G.g_seq AS g_seq, 
	   G.g_writer AS g_writer, 
       G.g_date AS g_date, 
       G.g_time AS g_time, 
       G.g_subject AS g_subject, 
       G.g_content AS g_content, 
       G.g_image AS g_image, 
       F.file_seq AS f_seq,
       F.file_originname AS f_originname, 
       F.file_upname AS f_upname
FROM tbl_gallery G
	LEFT JOIN tbl_files F
		ON G.g_seq = F.file_gseq
	WHERE G.g_seq = 3;

DELETE FROM tbl_files
WHERE file_seq = 7;



DROP VIEW view_갤러리;
DESC view_갤러리;

SELECT * FROM view_갤러리;

SELECT * FROM tbl_member
WHERE m_userid = 'crash2@naver.com';

