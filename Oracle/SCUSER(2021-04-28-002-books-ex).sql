-- 여기는 scuser 접속

-- 테이블 명 변경하기
ALTER TABLE tbl_books_v1 RENAME TO tbl_books;

-- 테이블 복제하기
CREATE TABLE tbl_books_v2 AS SELECT * FROM tbl_books_v1;

-- 복제된 테이블에 적용안된 제약조건 다시 설정하기
ALTER TABLE tbl_books_v2
ADD CONSTRAINT PK_ISBN PRIMARY KEY(bk_isbn);

-- 생성된 PK 제거하기
ALTER TABLE tbl_books_v2 
DROP PRIMARY KEY CASCADE;

-- 테이블 구조 확인하기
DESC tbl_books_v2;

-- 테이블에 칼럼 추가하기
ALTER TABLE tbl_books_v2
ADD bk_author2 nVARCHAR2(50);

-- 칼럼 이름 변경하기
ALTER TABLE tbl_books_v2
RENAME COLUMN bk_author TO bk_author1;

SELECT * FROM tbl_books_v2;
COMMIT;