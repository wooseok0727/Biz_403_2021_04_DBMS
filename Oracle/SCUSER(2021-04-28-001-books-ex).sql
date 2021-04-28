-- 여기는 scuser 접속

-- SCHEMA(USER) : scuser
-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : tbl_books Table 생성
-- 1. 다음 예시의 데이터를 저장할 Table을 설계하시오
-- 2. Table 명세를 작성한 후 Table을 생성
-- 3. 생성된 Table에 데이터를 Insert 실행

CREATE TABLE tbl_books(
    bk_num	CHAR(13)		PRIMARY KEY,
    bk_pname	nVARCHAR2(20)	NOT NULL,	
    bk_bname	nVARCHAR2(30)	NOT NULL,	
    bk_author	nVARCHAR2(20)	NOT NULL,	
    bk_trans	nVARCHAR2(10),		
    bk_pdate	VARCHAR2(10)	NOT NULL,	
    bk_page	NUMBER	NOT NULL,	
    bk_price	NUMBER	NOT NULL	
);

DROP TABLE tbl_books;

DESCRIBE tbl_books;

INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_trans, bk_pdate, bk_page, bk_price)
VALUES('9791162540770', '비즈니스북스', '데스 바이 아마존', '시로타 마코토', '신희원', '2019-04-15',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_trans, bk_pdate, bk_page, bk_price)
VALUES('9791188850549', '북라이프', '4주 만에 완성하는 레깅스핏 스트레칭', '모리 다쿠로', '김현정', '2019-04-11',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_pdate, bk_page, bk_price)
VALUES('9791188850518', '북라이프', '왕이된 남자2', '김선덕', '2019-04-10',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_pdate, bk_page, bk_price)
VALUES('9791188850501', '북라이프', '왕이된 남자1', '김선덕', '2019-04-10',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_pdate, bk_page, bk_price)
VALUES('9791162540756', '비즈니스북스', '새벽에 읽는 유대인 인생 특강', '장대은', '2019-04-10',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_pdate, bk_page, bk_price)
VALUES('9791188850471', '북라이프', '왕이 된 남자 포토에세이', '스튜디오 드래곤', '2019-04-10',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_trans, bk_pdate, bk_page, bk_price)
VALUES('9791162540732', '비즈니스북스', '오토노미 제2의 이동 혁명', '로렌스 번스 - 크리스토퍼 슐건', '김현정', '2019-03-31',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_trans, bk_pdate, bk_page, bk_price)
VALUES('9791162540718', '비즈니스북스', '쓴다 쓴다 쓰는 대로 된다', '후루카와 다케시', '유나현', '2019-03-30',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_pdate, bk_page, bk_price)
VALUES('9791162540695', '비즈니스북스', '머니패턴', '이요셉 - 김채송화', '2019-04-25',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_pdate, bk_page, bk_price)
VALUES('9791162540671', '비즈니스북스', '1日 1行의 기적', '유근용', '2019-04-20',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_pdate, bk_page, bk_price)
VALUES('9791188850440', '북라이프', '오늘도 울컥하고 말았습니다', '정민지', '2019-04-15',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_trans, bk_pdate, bk_page, bk_price)
VALUES('9791188850426', '북라이프', '엘리트 제국의 몰락', '미하엘 하르트만', '이덕임', '2019-04-15',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_trans, bk_pdate, bk_page, bk_price)
VALUES('9791162540640', '비즈니스북스', '아주 작은 습관의 힘', '제임스 클리어', '이한이', '2019-04-15',272,15000);
INSERT INTO tbl_books_v2(bk_num, bk_pname, bk_bname, bk_author, bk_trans, bk_pdate, bk_page, bk_price)
VALUES('9791186805398', '비즈니스북스', '그릿 GRIT(100쇄 기념 리커버 에디션)', '엔절라 더크워스', '김미정', '2019-04-15',272,15000);
