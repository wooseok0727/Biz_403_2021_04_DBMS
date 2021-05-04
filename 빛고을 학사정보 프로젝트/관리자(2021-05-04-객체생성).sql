-- 여기는 관리자 접속

-- 과제 : 학사정보 프로젝트를 위한 DataBase 설계
-- 객체 : TableSpace, User, Table 생성

CREATE TABLESPACE KschoolDB
DATAFILE 'C:/oraclexe/data/kschool.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER kscuser IDENTIFIED BY kscuser
DEFAULT TABLESPACE KschoolDB;

GRANT DBA TO kscuser;