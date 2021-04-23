-- 여기는 SCUSER 접속

-- SCHEMA(USER) : scuser
-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : Table 생성
-- 1. Table 명 : tbl_score
-- 2. 속성 list
--    학번 : st_num, 고정 문자열5
--    국어 : st_kor, 숫자형
--    영어 : st_eng, 숫자형
--    수학 : st_math, 숫자형

CREATE TABLE tbl_score(
        st_num CHAR(5) PRIMARY KEY,
        st_kor NUMBER NOT NULL,
        st_eng NUMBER NOT NULL,
        st_math NUMBER NOT NULL
);

-- table의 구조보는 키워드 : DESC , DESCRIBE
DESCRIBE tbl_score;

INSERT INTO tbl_score(st_num, st_kor, st_eng, st_math)
VALUES('00001',90,96,94);

INSERT INTO tbl_score(st_num, st_kor, st_eng, st_math)
VALUES('00002',48,33,86);

INSERT INTO tbl_score(st_num, st_kor, st_eng, st_math)
VALUES('00003',58,99,83);

SELECT * FROM tbl_score;

SELECT st_num, st_kor FROM tbl_score;

SELECT st_num, st_kor, st_eng FROM tbl_score
WHERE st_num = '00001';

SELECT st_num, st_kor FROM tbl_score;

DROP TABLE tbl_score;

-- SCHEMA(USER) : scuser
-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : Table 생성
-- 1. Table 명 : tbl_score
-- 2. 속성 list
--    학번 : st_num, 고정 문자열5
--    국어 : st_kor, 숫자형
--    영어 : st_eng, 숫자형
--    수학 : st_math, 숫자형
-- 3. tbl_score Table을 삭제 한후
--    다음 조건을 추가하여 다시 생성
--    가. 학번은 중복되거나 NULL 값을 저장할 수 없다.
--    나. 과목은 NULL값을 저장 할 수 없다.
-- 고정문자열 : CHAR(최대크기)
-- 가변문자열 : VARCHAR2(최대크기)
-- 한글가변문자열 : nVARCHAR2(최대크기)
-- 숫자 : NUMBER(자릿수,소수)

CREATE TABLE tbl_score(
        sc_num CHAR(5) PRIMARY KEY,
        sc_kor NUMBER NOT NULL,
        sc_eng NUMBER NOT NUll,
        sc_math NUMBER NOT NULL
);

-- CREATE 로 작성한 칼럼의 순서대로 모든 데이터를 포함하여
-- INSERT 수행하기
-- 항상 CREATE로 작성한 칼럼의 순서를 기억해야 하고
--      순서가 바뀌면 전혀 엉뚱한 데이터가 INSERT 될수 있다
-- 모든 칼럼에 데이터를 포함해야 한다
INSERT INTO tbl_score
VALUES('00001',50,30,40);

-- INSERT를 수행할 때 데이터칼럼을 나열하면
-- 순서를 몰라도 상관없고, 필요한 칼럼만 데이터를 포함하여
-- 수행할 수 있다.
INSERT INTO tbl_score(sc_kor, sc_eng, sc_math, sc_num)
VALUES(90,80,50,'00001');

SELECT * FROM tbl_score;

-- 위에서 생성한 tbl_score에 제약조건이 없으면 
-- 중복된 학번의 점수가 INSERT 될수 있다
-- 한 학생의 점수가 2중 3중으로 INSERT 되어 엉뚱한 결과가 
-- 나타날 수 있다
-- 제약조건부여
-- 1. 학번은 중복될수 없고 절대 NULL이어서는 안된다.
--      NOT NULL UNIQUE : PK(PRIMARY KEY) 선언하는 것도 좋은 방법
-- 2. 점수가 없는 학생의 데이터는 이후에 연산을 수행할 때
--      문제를 일으킬 수 있기 때문에 NULL 값이 없도록 하자
DROP TABLE tbl_score;

CREATE TABLE tbl_score(
    sc_num CHAR(5),
    sc_kor NUMBER NOT NULL,
    sc_eng NUMBER NOT NULL,
    sc_math NUMBER NOT NULL,
    PRIMARY KEY(sc_num)
);

CREATE TABLE tbl_score(
    sc_num	CHAR(5)		PRIMARY KEY,
    sc_kor	NUMBER	NOT NULL,	
    sc_eng	NUMBER	NOT NULL,	
    sc_math	NUMBER	NOT NULL	
);

SELECT * FROM tbl_score;

-- 국어점수가 90점 이상인 리스트
SELECT * FROM tbl_score
WHERE sc_kor >= 90;

-- 데이터를 보여줄때 머릿글(칼럼제목)을 바꾸어서 보이기
-- AS(Alias, 별명)
SELECT sc_num AS 학번, sc_kor AS 국어, sc_eng AS 영어, sc_math AS 수학,
       sc_kor + sc_eng + sc_math AS 총점 
FROM tbl_score;

-- 총점이 250 이상인 학생만 보여라
SELECT sc_num AS 학번, sc_kor AS 국어, sc_eng AS 영어, sc_math AS 수학,
       sc_kor + sc_eng + sc_math AS 총점 
FROM tbl_score
WHERE (sc_kor + sc_eng + sc_math) >= 250;

-- 총점이 150 이상이고 250이하인 학생만 보여라
SELECT sc_num AS 학번, sc_kor AS 국어, sc_eng AS 영어, sc_math AS 수학,
       sc_kor + sc_eng + sc_math AS 총점 
FROM tbl_score
WHERE (sc_kor + sc_eng + sc_math) <= 250 AND (sc_kor + sc_eng + sc_math) >= 150;

-- SELECT를 사용하여 데이터를 조회하는데
-- 계산하는 칼럼도 있고
-- 자꾸 문법이 복잡해 지려고 한다
-- SELECT 된 명령문을 VIEW 객체로 생성을 해둔다
-- VIEW 는 사용법이 TABLE과 같다
--      단, 기본은 SELECT만 된다.
CREATE VIEW view_score
AS
(
    SELECT sc_num AS 학번, sc_kor AS 국어, sc_eng AS 영어, sc_math AS 수학,
           sc_kor + sc_eng + sc_math AS 총점 
    FROM tbl_score
);

SELECT *
FROM view_score
WHERE 총점 >= 150 AND 총점 <= 250;

-- 영어선생님에게 전체학생의 정보를 보여줘야 한다
-- 다른과목의 점수는 감추고 싶다
-- 보안적인 측면에서 사용자별로
-- 보여줄 항목, 보이지 않을 항목을 선별하여 VIEW를 작성해 두면
-- 불필요한 정보가 노출되는 것을 최소화 할 수 있다.

CREATE VIEW view_영어점수
AS
(
    SELECT sc_num AS 학번, sc_eng AS 영어
    FROM tbl_score
);

SELECT *
FROM view_영어점수;

DROP VIEW view_영어점수;

CREATE VIEW view_1반학생
AS
(
    SELECT sc_num AS 학번, sc_eng AS 영어, sc_kor AS 국어, sc_math AS 수학
    FROM tbl_score
    WHERE sc_num >= 'S0010' AND sc_num <= 'S0020'
);
SELECT *
FROM view_1반학생;

        
