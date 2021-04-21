-- 여기는 관리자 접속

-- 과제 : DDL SQL 명령을 사용하여 객체 생성
-- 객체 : Oracle TableSpace, User
-- 1. TableSpace 명 : iolistDB
--    DataFile 명 : C:/oraclexe/data/iolist.dbf
--    Size : 1MByte, 자동 증가 1KByte 씩
-- 2. User 명 : iouserm PW : iouser
--    Default TableSpace : iolistDB
--    DBA 권한 부여
-- 3. 생성된 사용자 정보를 사용하여 접속 Profile 작성, Test


-- TABEL SPACE 생성하기
CREATE TABLESPACE iolistDB
DATAFILE 'C:/oraclexe/data/iolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- 새로운 사용자 등록
CREATE USER iouser IDENTIFIED BY iouser
DEFAULT TABLESPACE iolistDB;

-- 사용자에게 DBA 권한부여
GRANT DBA TO iouser;

-- 사용자에게 권한회수
REVOKE DBA FROM iouser;
----------------------------------------
-- 과제 : DDL SQL 명령을 사용하여 객체 삭제
-- 객체 : TableSpace, User
-- 1. USER 삭제
-- 2. TABLESPACE 삭제

-- 사용자 삭제하기
DROP USER iouser CASCADE;

-- TABLESPACE 삭제하기
-- 반드시 옵션을 같이 작성하자
DROP TABLESPACE iolistDB -- 필수
INCLUDING CONTENTS AND DATAFILES -- 옵션
CASCADE CONSTRAINTS; -- 옵션




