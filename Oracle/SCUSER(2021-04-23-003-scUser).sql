-- 여기는 SCUSER 접속

CREATE TABLE tbl_score(
    st_num CHAR(5) PRIMARY KEY,
    st_name nVARCHAR2(20) NOT NULL,
    st_kor NUMBER NOT NULL,
    st_eng NUMBER NOT NULL,
    st_math NUMBER NOT NULL
);

DESCRIBE tbl_score;

INSERT INTO tbl_score(st_num, st_name, st_kor, st_eng, st_math)
VALUES('00001','홍길동',88,84,33);

SELECT st_num, st_name
FROM tbl_score
WHERE st_kor > 70;

SELECT st_num AS 학번, st_name AS 이름
FROM tbl_score;

CREATE VIEW view_score AS(
    SELECT st_num AS 학번,
           st_name AS 이름,
           st_kor AS 국어,
           st_eng AS 영어,
           st_math AS 수학,
           st_kor + st_eng + st_math AS 총점
    FROM tbl_score
);

SELECT * FROM view_score;

DROP VIEW view_score;

DROP TABLE tbl_score;

