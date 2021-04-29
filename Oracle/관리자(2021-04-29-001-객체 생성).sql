-- 여기는 관리자 접속

-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : Oracle TableSpace, User
-- 1. TableSpace 명 : RentBookDB
--    DataFile 명 : C:/oraclexe/data/rentbook.dbf
--    Size : 1MByte, 자동 증가 1KByte 씩

-- 2. User 명 : bookuser, PW : bookuser
--    Default TableSpace : RentBookDB
--    DBA 권한 부여
--    생성된 사용자 정보를 사용하여 접속 Profile 작성, Test

CREATE TABLESPACE RentBookDB
DATAFILE 'C:/oraclexe/data/rentbook.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER bookuser IDENTIFIED BY bookuser
DEFAULT TABLESPACE RentBookDB;

GRANT DBA TO bookuser;

-----------------------------------------------

REVOKE DBA FROM bookuser;

DROP USER bookuser CASCADE;

DROP TABLESPACE RentBookDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-----------------------------------------------
