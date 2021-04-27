-- 여기는 scuser 접속

-- SCHEMA(USER) : scuser
-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : Table 생성
-- 1. Table 명 : 학과 정보, tbl_dept
-- 2. 속성 list
--    학과코드 : dp_code, 고정문자열 3
--    학과명 : dp_name, 한글 가변문자열20,
--    담당교수 : dp_prof, 한글 가변문자열 20
-- 3. 다음 조건을 추가하여 생성
--    가. 학과코드는 PK 설정
--    나. 학과명, 담당교수는 NULL이 될 수 없다
-- 4. 테이블 명세를 작성하고, 테이블 생성

DROP TABLE tbl_dept;

CREATE TABLE tbl_dept(
    dp_code	CHAR(3)		PRIMARY KEY,
    dp_name	nVARCHAR2(20)	NOT NULL,	
    dp_prof	nVARCHAR2(20)	NOT NULL
);

-- SCHEMA(USER) : scuser
-- 과제 : DML SQL 명령을 사용하여 데이터 추가
-- Table : tbl_dept
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof)
VALUES ('001','컴퓨터공학','토발즈');

INSERT INTO tbl_dept(dp_code, dp_name, dp_prof)
VALUES  ('002','전자공학','이철기');

DESCRIBE tbl_dept; -- 테이블 구조(칼럼) 확인하기
SELECT * FROM tbl_dept; -- tbl_dept 에 들어있는 모든 정보 조회


-- 학과정보를 저장할 Table 생성
CREATE TABLE tbl_dept(
    dp_code	CHAR(3)		PRIMARY KEY,
    dp_name	nVARCHAR2(20)	NOT NULL,	
    dp_prof	nVARCHAR2(20)	NOT NULL	
);

INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('001','컴퓨터공학','토발즈');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('002','전자공학','이철기');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('003','법학','킹스필드');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('004','관광학','이한우');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('005','국어국문','백석기');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('006','영어영문','권오순');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('007','무역학','심하균');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('008','미술학','필리스');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('009','고전음악학','파파르티');
INSERT INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('010','정보통신공학','최양록');

-- 지금 수행한 INSERT 명령으로 추가된 데이터를
-- 실제 Storage에 반영하라
COMMIT;

DELETE FROM tbl_dept;
COMMIT;

-- 여러개의 데이터를 동시에 INSERT하기
-- 다른테이블로부터 데이터를 복사할때 사용하는 방식
INSERT ALL
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('001','컴퓨터공학','토발즈')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('002','전자공학','이철기')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('003','법학','킹스필드')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('004','관광학','이한우')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('005','국어국문','백석기')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('006','영어영문','권오순')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('007','무역학','심하균')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('008','미술학','필리스')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('009','고전음악학','파파르티')
INTO tbl_dept(dp_code, dp_name, dp_prof) VALUES('010','정보통신공학','최양록')
SELECT * FROM DUAL;
COMMIT;

SELECT * FROM tbl_dept;

-- SCHEMA(USER) : scuser
-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : 기존 Table 삭제 후 생성
-- 1. Table 명 : tbl_student
-- 2. 학번 : st_num, 고정문자열 5,
--    이름 : st_name, 한글가변문자열 20,
--    학과코드 : st_dcode, 고정문자열 3,
--    학년 : st_grade, 고정문자열 1,
--    전화번호 : st_tel, 가변문자열 20,
--    주소 : st_addr, 한글가변문자열 125
-- 3. 학번은 "기본키"로 설정,
--    이름,학과코드,학년,전화번호 NULL값을 허용하지 않음
DROP TABLE tbl_student;

CREATE TABLE tbl_student(
    st_num	CHAR(5)		PRIMARY KEY,
    st_name	nVARCHAR2(20)	NOT NULL,	
    st_dcode	CHAR(3)		NOT NULL,
    st_grade	CHAR(1)		NOT NULL,
    st_tel	VARCHAR2(20)	NOT NULL,
    st_addr	nVARCHAR2(125)		
);

SELECT COUNT(*) FROM tbl_student;
SELECT * FROM tbl_student;

-- 학생테이블과, 학과테이블을
-- 학생의 st_dcode 칼럼과, 학과의 dp_code 칼럼을 연관지어
-- JOIN을 수행하라
--  학생테이블의 모든데이터를 나열하고
--  학과테이블에서 일치하는 데이터를 가져와서 연관하여 보여라
CREATE VIEW view_학생정보 AS 
(
    SELECT ST.st_num 학번,
           ST.st_name 학생이름,
           ST.st_dcode 학과코드,
           DP.dp_name 학과명,
           DP.dp_prof 담당교수,
           ST.st_grade 학년,
           ST.st_tel 전화번호,
           ST.st_addr 주소
    FROM tbl_student ST
        LEFT JOIN tbl_dept DP
            ON ST.st_dcode = DP.dp_code
);        

SELECT * FROM view_학생정보       
ORDER BY 학번;
    
-- 학생정보 테이블에서 학과별로 몇명의 학생이 재학중인지
-- 학과 코드 = 학과명은 항상 같은 값이 되므로
-- 학과코드, 학과명으로 GROUP BY를 하면
-- 학과별로 묶음이 이루어진다
-- 학과별로 묶음을 만들고 묶은 학과에 포함된 레코드가 몇개인가
-- 세어보면, 학과별 학생 인원수가 조회된다.
SELECT 학과코드, 학과명, COUNT(*) 인원수
FROM view_학생정보
GROUP BY 학과코드, 학과명
ORDER BY 학과코드;

SELECT * FROM tbl_score;

CREATE VIEW view_성적일람표 AS
(
    SELECT SC.sc_num 학번, 
           ST.st_name 이름, 
           ST.st_dcode 학과코드, 
           DP.dp_name 학과명,
           DP.dp_prof 담당교수,
           ST.st_tel 전화번호,
           SC.sc_kor 국어,
           SC.sc_eng 영어,
           SC.sc_math 수학,
           (SC.sc_kor + SC.sc_eng + SC.sc_math) 총점,
           ROUND((SC.sc_kor + SC.sc_eng + SC.sc_math) / 3,2) 평균
    FROM tbl_score SC
        LEFT JOIN tbl_student ST
            ON SC.sc_num = ST.st_num
        LEFT JOIN tbl_dept DP
            ON ST.st_dcode = DP.dp_code
);        

SELECT * FROM view_성적일람표
ORDER BY 학번;

-- 생성된 view_성적일람표를 사용하여
-- 1. 총점이 200점 이상인 학생은 몇명?
-- 2. 평균이 75점 이상인 학생들의 평균점수는?
-- 3. 각 학과별로 총점과 평균점수는?

SELECT COUNT(*) 인원수
FROM view_성적일람표
WHERE 총점 >= 200;

SELECT ROUND(AVG(평균),2)
FROM view_성적일람표
WHERE 평균 >= 75; 

-- 학과코드와 학과명으로 그룹을 설정하고
-- 각 그룹의 총점과 평균을 계산

SELECT 학과코드, 학과명,
       COUNT(*) 인원수,
       SUM(총점) 학과총점, 
       ROUND(AVG(평균),2) 학과평균, 
       MAX(평균) 최고점,
       MIN(평균) 최저점
FROM view_성적일람표
GROUP BY 학과코드, 학과명
ORDER BY 학과코드;











