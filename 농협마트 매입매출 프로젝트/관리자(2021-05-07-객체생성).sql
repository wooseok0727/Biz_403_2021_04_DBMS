-- 여기는 관리자 접속

-- 과제 : 농협마트 프로젝트를 위한 DataBase 설계
-- 객체 : TableSpace, User, Table 생성

CREATE TABLESPACE nonghyupDB
DATAFILE 'C:/oraclexe/data/nonghyup.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;


CREATE USER nhuser IDENTIFIED BY nhuser
DEFAULT TABLESPACE nonghyupDB;

GRANT DBA TO nhuser;