-- 여기는 TestUser 접속

DROP TABLE tbl_books;

CREATE TABLE tbl_books (
    bk_isbn     CHAR(13)        PRIMARY KEY,
    bk_comp     CHAR(5)         NOT NULL,
    bk_title    nVARCHAR2(125)  NOT NULL,
    bk_author   CHAR(5)         NOT NULL,
    bk_date     VARCHAR2(10),
    bk_pages    NUMBER,
    bk_price    NUMBER
);

DESC tbl_books;

DROP TABLE tbl_company;
CREATE TABLE tbl_company (
    cp_code	CHAR(5)		    PRIMARY KEY,
    cp_name	nVARCHAR2(125)	NOT NULL,	
    cp_ceo	nVARCHAR2(30)	NOT NULL,	
    cp_tel	VARCHAR2(20)	NOT NULL,	
    cp_addr	nVARCHAR2(125)		
);

DESC tbl_company;

DROP TABLE tbl_author;
CREATE TABLE tbl_author (
    au_code	CHAR(5)		    PRIMARY KEY,
    au_name	nVARCHAR2(125)	NOT NULL,	
    au_tel	VARCHAR2(20),		
    au_addr	nVARCHAR2(125)		
);

-- import 된 데이터 확인
SELECT COUNT(*) FROM tbl_books;
SELECT COUNT(*) FROM tbl_company;
SELECT COUNT(*) FROM tbl_author;

-- tbl_books 테이블에서
-- 각 출판사별로 몇권의 도서를 출판 했는지 조회
SELECT bk_comp, COUNT(*)
FROM tbl_books
GROUP BY bk_comp;

SELECT B.bk_comp AS 출판사코드 , C.cp_name AS 출판사명 , COUNT(*) AS 권수
FROM tbl_books B
    LEFT JOIN tbl_company C
        ON B.bk_comp = C.cp_code
GROUP BY B.bk_comp, C.cp_name
ORDER BY B.bk_comp;

-- tbl_books 테이블에서
-- 1. 도서 가격이 2만원 이상인 도서들의 리스트
SELECT *
FROM tbl_books
WHERE bk_price >= 20000;

-- 2. 도서 가격이 2만원 이상인 도서들의 전체 합계금액
SELECT COUNT(*),SUM(bk_price)
FROM tbl_books
WHERE bk_price >= 20000;

-- tbl_books, tbl_company, tbl_author 세개의 table JOIN하여 
-- ISBN, 도서명, 출판사명, 출판사대표, 저자명, 저자연락처로 
-- 출력되도록 SQL 작성

SELECT B.bk_isbn AS 일련번호,
       B.bk_title AS 도서명,
       C.cp_name AS 출판사명,
       C.cp_ceo AS 출판사대표,
       A.au_name AS 저자명,
       A.au_tel AS 저자연락처
FROM tbl_books B
    LEFT JOIN tbl_company C
        ON B.bk_comp = C.cp_code
    LEFT JOIN tbl_author A
        ON B.bk_author = A.au_code
ORDER BY B.bk_title;

-- tbl_books, tbl_company, tbl_author 세개의 table JOIN하여 
-- ISBN, 도서명, 출판사명, 출판사대표, 저자명, 저자연락처, 출판일로 
-- 출력되도록 SQL 작성
-- 출판일이 2018년 데이터만

SELECT B.bk_isbn AS 일련번호,
       B.bk_title AS 도서명,
       C.cp_name AS 출판사명,
       C.cp_ceo AS 출판사대표,
       A.au_name AS 저자명,
       A.au_tel AS 저자연락처,
       B.bk_date AS 출판일
FROM tbl_books B
    LEFT JOIN tbl_company C
        ON B.bk_comp = C.cp_code
    LEFT JOIN tbl_author A
        ON B.bk_author = A.au_code
-- WHERE bk_date BETWEEN '2018-01-01' AND '2018-12-31'
-- ORDER BY B.bk_date;

WHERE SUBSTR(B.bk_date,0,4) = '2018'
ORDER BY B.bk_date;
/*
    SUBSTR(문자열칼럼, 시작위치, 개수)
    MySQL : LEFT(문자열 칼럼, 앞에서 몇개)
*/
-- WHERE B.bk_date LIKE '2018%';

CREATE VIEW view_도서정보 AS
(
    SELECT B.bk_isbn AS 일련번호,
           B.bk_title AS 도서명,
           C.cp_name AS 출판사명,
           C.cp_ceo AS 출판사대표,
           A.au_name AS 저자명,
           A.au_tel AS 저자연락처,
           B.bk_date AS 출판일
    FROM tbl_books B
        LEFT JOIN tbl_company C
            ON B.bk_comp = C.cp_code
        LEFT JOIN tbl_author A
            ON B.bk_author = A.au_code
);

SELECT * FROM view_도서정보
WHERE SUBSTR(출판일,0,4) = '2018';

/*
    자주 사용할 것 같은 SELECT SQL은 view로 등록하면
    언제든지 사용이 가능하다
    
    그런데 자주 사용할 것 같지 않은 경우 
    view로 생성하면 아무래도 저장공간을 차지하게 된다
    
    이럴때는 한개의 SQL(SELECT)를 마치 가상의 table처럼
    FROM 절에 부착하여 사용할 수 있다


*/
SELECT * FROM
(
SELECT B.bk_isbn AS 일련번호,
       B.bk_title AS 도서명,
       C.cp_name AS 출판사명,
       C.cp_ceo AS 출판사대표,
       A.au_name AS 저자명,
       A.au_tel AS 저자연락처,
       B.bk_date AS 출판일
FROM tbl_books B
    LEFT JOIN tbl_company C
        ON B.bk_comp = C.cp_code
    LEFT JOIN tbl_author A
        ON B.bk_author = A.au_code
)
WHERE SUBSTR(출판일,0,4) = '2018';


-- tbl_books와 tbl_company, tbl_books와 tbl_author FK 설정
-- bk_comp와 cp_code , bk_author와 au_code

ALTER TABLE tbl_books
ADD CONSTRAINT fk_comp
FOREIGN KEY (bk_comp)
REFERENCES tbl_company(cp_code); 

ALTER TABLE tbl_books
ADD CONSTRAINT fk_author
FOREIGN KEY (bk_author)
REFERENCES tbl_author(au_code);

ALTER TABLE tbl_books
DROP CONSTRAINT fk_comp;

-- PK
-- 개체무결성을 보장하기 위한 조건
-- 내가 어떤 데이터를 수정, 삭제 할 때
-- 수정하거나 삭제해서는 안되는 데이터는 유지하면서
-- 반드시 수정하거나 삭제하는 데이터는 수정, 삭제가 된다
-- 수정이상, 삭제이상을 방지하는 방법
-- 중복된 데이터는 절대 추가될수 없다 : 삽입이상을 방지하는 방법

-- FK
-- 2개이상의 Table을 연결하여 view(조회)를 할 때
-- 어떤 데이터가 NULL 값으로 보이는 것을 방지하기 위한 조치

-- Child(tbl_books) : bk_comp      Parent(tbl_company) : cp_code
-- 있을수 있고, 추가 가능      <<   있는 코드
-- 있어서는 안되고 추가 불가능 <<   없는 코드
-- 있는 코드                   >>   코드 삭제 불가능
-- 있는 코드                   >>   반드시 있어야 한다.

-- 리처드 쇼튼의 연락처가 010-7270-5520 에서
-- 010-9898-6428로 변경이 되었다
-- 리처드 쇼튼의 연락처를 변경해 보기

SELECT *
FROM tbl_author
WHERE au_name = '리처드 쇼튼';

UPDATE tbl_author 
SET au_tel = '010-9898-6428'
WHERE au_code = 'A0006';

-- 정보를 수정, 삭제하는 절차
-- 먼저 내가 수정, 삭제하고자 하는 데이터가 어떤 상태인지 조회
SELECT * 
FROM tbl_author
WHERE au_name = '리처드 쇼튼';

-- 수정하고자 하는 '리처드 쇼튼'의 PK 를 확인했다
-- 수정, 삭제하고자 할때는 먼저 대상 데이터의 PK를 확인하고
-- PK를 WHERE 절에 포함하여 UPDATE, DELETE를 수행하자
UPDATE tbl_author
SET au_tel = '010-9898-6428'
WHERE au_code = 'A0006';

-- 실무에서 UPDATE, DELETE를 2개이상 레코드에 
-- 동시에 적용하는 것은 매우 위험한 코드이다
-- 꼭 필요한 경우가 아니면
-- UPDATE, DELETE 는 PK를 기준으로 한개씩 수행하는 것이 좋다
