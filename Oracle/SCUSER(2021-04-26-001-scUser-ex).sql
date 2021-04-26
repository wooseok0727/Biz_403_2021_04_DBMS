-- 여기는 scuser 접속

CREATE TABLE tbl_student(
    st_num CHAR(5) PRIMARY KEY,
    st_name nVARCHAR2(20) NOT NULL,
    st_dept nVARCHAR2(10),
    st_grade VARCHAR2(5),
    st_tel VARCHAR2(20),
    st_addr nVARCHAR2(125)
);




CREATE TABLE tbl_score(
    sc_num CHAR(5) PRIMARY KEY,
    sc_kor NUMBER NOT NULL,
    sc_eng NUMBER NOT NULL,
    sc_math NUMBER NOT NULL
);

SELECT COUNT(*) 
FROM tbl_student;

SELECT COUNT(*)
FROM tbl_score;

SELECT * 
FROM tbl_student;

SELECT *
FROM tbl_score;

CREATE VIEW view_성적정보 AS
(
SELECT ST.st_num AS 학번,
       ST.st_name AS 이름,
       ST.st_dept AS 학과,
       SC.sc_kor AS 국어,
       SC.sc_eng AS 영어,
       SC.sc_math AS 수학,
       (SC.sc_kor + SC.sc_eng + SC.sc_math) AS 총점
FROM tbl_student ST
    LEFT JOIN tbl_score SC
        ON st_num = sc_num
);


SELECT 학과, SUM(총점) AS 학과총점, COUNT(학과) AS 학과인원수
FROM view_성적정보
GROUP BY 학과
ORDER BY COUNT(학과) DESC;