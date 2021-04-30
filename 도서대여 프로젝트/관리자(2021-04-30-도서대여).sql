-- 여기는 관리자 접속

-- 과제 : DDL SQL 명령을 사용하여 객체 삭제 후 다시 생성
-- 각체 : TableSpace, User
-- 1. USER 삭제
-- 2. TABLESPACE 삭제
-- 3. TableSpace 명 : RentBookDB
-- 4. User 명 : bookuser, PW : bookuser

-- USER 삭제
DROP USER bookuser CASCADE;

-- TABLESPACE 삭제
DROP TABLESPACE RentBookDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-------------------------------------------

-- TABLESPACE 생성
CREATE TABLESPACE RentBookDB
DATAFILE 'C:/oraclexe/data/rentbook.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- USER 생성
CREATE USER bookuser IDENTIFIED BY bookuser
DEFAULT TABLESPACE RentBookDB;

-- USER 권한 부여
GRANT DBA TO bookuser;

-- USER 권한 회수
REVOKE DBA FROM bookuser;

