-- 여기는 관리자 접속

-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : Oracle TableSpace, User
-- 1. TableSpace 명 : schoolDB
--    DataFile 명 : C:/oraclexe/data/school.dbf
--    Size : 1MByte, 자동 증가 1KByte 씩
-- 2. User 명 : scUser, PW : scUser
--    Default TableSpace : schoolDB
--    DBA 권한 부여
--    생성된 사용자 정보를 사용하여 접속 Profile 작성, Test
-- 3. schoolDB, scUser가 있는 경우 삭제하고 다시 생성

CREATE TABLESPACE schoolDB
DATAFILE 'C:/oraclexe/data/school.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- 스키마(schema) : table, index, view 등등 데이터의 전체적인 모음집
-- 객체들의 정보를 담는 곳
-- 데이터들의 모음체
-- 표준SQL : CREATE SCHEMA
CREATE USER scUser IDENTIFIED BY scUser
DEFAULT TABLESPACE schoolDB;

-- 권한부여, 실습을 위해서 DBA 권한을 부여하자
-- DBA권한을 남발하면
-- DB 보안적인 측면에서 무결성을 해칠수 있는 여지가 많아진다
-- DB와 관련된 보안용어
-- 보안 침해 : 허가받지 않은 사용자가 접속하여 문제를 일으키는 것
-- 무결성 침해(파괴) : 허가받은 사용자가 권한을 남용하여 문제를 일으키는 것
--                     CUD(추가,수정,삭제)등을 잘못하여 데이터에 문제가 생기는것     
GRANT DBA TO scUser;
-- 권한회수
REVOKE DBA FROM scUser;


-- 과제 : DDL SQL 명령을 사용하여 객체 삭제
-- 객체 : TableSpace, User
-- 1. USER 삭제
-- 2. TALBESPACE 삭제

DROP USER scUser CASCADE;

DROP TABLESPACE schoolDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

