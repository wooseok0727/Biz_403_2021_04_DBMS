-- 여기는 관리자 접속

CREATE TABLESPACE schoolDB
DATAFILE 'C:/oraclexe/data/schoolDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER scuser IDENTIFIED BY scuser
DEFAULT TABLESPACE schoolDB;


GRANT DBA TO scuser;

REVOKE DBA FROM scuser;



DROP USER scuser CASCADE;

DROP TABLESPACE schooDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;