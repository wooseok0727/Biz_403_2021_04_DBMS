-- 여기는 bookuser 접속

-- SCHEMA(USER) : bookuser
-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : Table 생성

-- 1. Table 명 : tbl_books
-- 2. 속성 list
--    ISBN : bk_isbn, 고정문자열 13, PK
--    도서명 : bk_title, 한글가변문자열 125, NN(NOT NULL)
--    출판사코드 : bk_ccode, 고정문자열 5, NN
--    저자코드 : bk_acode, 고정문자열 5, NN
--    출판일 : bk_date, 고정문자열 10
--    가격 : bk_price, 숫자형
--    페이지 : bk_pages, 숫자형
-- 3. 임의의 데이터 INSERT 하여 테스트

CREATE TABLE tbl_books(
    bk_isbn CHAR(13) PRIMARY KEY,
    bk_title nVARCHAR2(125) NOT NULL,
    bk_ccode CHAR(5) NOT NULL,
    bk_acode CHAR(5) NOT NULL,
    bk_date VARCHAR2(10),
    bk_price NUMBER,
    bk_pages NUMBER
);

INSERT INTO tbl_books(
    bk_isbn, bk_title, bk_ccode, bk_acode, bk_date, bk_price, bk_pages)
VALUES('1234567890123','오라클 SQL과 PL/SQL','00001','11111','2021-04-29',25000,350);

SELECT *
FROM tbl_books;

DELETE FROM tbl_books;

DROP TABLE tbl_books;

--------------------------------------------------------------------------------

-- SCHEMA(USER) : bookuser
-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : table 생성

-- 1. Table 명 : tbl_company
-- 2. 속성 list
--    출판사코드 : cp_code, 고정문자열 5, PK
--    출판사명 : cp_title, 한글가변문자열 125, NN
--    대표 : cp_ceo, 한글가변문자열
--    전화번호 : cp_tel, 가변문자열 20
--    주소 : cp_addr, 한글가변문자열 125
--    주요장르 : cp_genre, 한글가변문자열 30
-- 3. 임의의 데이터 INSERT 하여 테스트

CREATE TABLE tbl_company(
    cp_code CHAR(5) PRIMARY KEY,
    cp_title nVARCHAR2(125) NOT NULL,
    cp_ceo nVARCHAR2(20),
    cp_tel VARCHAR2(20),
    cp_addr nVARCHAR2(125),
    cp_genre nVARCHAR2(30)
);

INSERT INTO tbl_company(
    cp_code, cp_title, cp_ceo, cp_tel, cp_addr, cp_genre)
VALUES('00001','빛나라출판사','홍길동','062-0000-0000','광주광역시','컴퓨터/IT');    

SELECT * FROM tbl_company;

DELETE FROM tbl_company;

DROP TABLE tbl_company;

--------------------------------------------------------------------------------

-- SCHEMA(USER) : bookuser
-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : Table 생성
-- 1. Table 명 : tbl_author
-- 2. 속성 list
--    저자코드 : au_code, 고정문자열 5, PK
--    저자명 : au_name, 한글가변문자열 50, NN
--    전화번호 : au_tel, 가변문자열 20
--    주소 : au_addr, 한글가변문자열 125
--    주요장르 : au_genre, 한글가변문자열 30
-- 3. 임의의 데이터 INSERT하여 테스트

CREATE TABLE tbl_author(
    au_code CHAR(5) PRIMARY KEY,
    au_name nVARCHAR2(50) NOT NULL,
    au_tel VARCHAR2(20),
    au_addr nVARCHAR2(125),
    au_genre nVARCHAR2(30)
);

INSERT INTO tbl_author(
    au_code, au_name, au_tel, au_addr, au_genre)
VALUES('11111','이몽룡','02-0000-0001','서울특별시','컴퓨터/IT');

SELECT * FROM tbl_author;

DELETE FROM tbl_author;

DROP TABLE tbl_author;

--------------------------------------------------------------------------------


-- SCHEMA(USER) : bookuser
-- 과제 : DML SQL 명령을 실행
-- 1. tbl_books, tbl_company, tbl_author Table을
--    JOIN 하여 다음과 같은 리스트가 나타나도록 SQL을 작성

SELECT BK.bk_isbn ISBN,
       BK.bk_title 도서명,
       BK.bk_ccode 출판사명,
       CP.cp_ceo 대표,
       AU.au_name 저자명,
       AU.au_tel 저자연락처,
       BK.bk_date 출판일,
       BK.bk_price 가격
FROM tbl_books BK
        LEFT JOIN tbl_company CP
            ON BK.bk_ccode = CP.cp_code
        LEFT JOIN tbl_author AU
            ON BK.bk_acode = AU.au_code;
            