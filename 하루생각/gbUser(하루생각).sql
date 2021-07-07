CREATE DATABASE amind;

use amind;

CREATE TABLE tbl_user (
	u_seq	BIGINT			auto_increment	PRIMARY KEY,
	u_prof	BIGINT,		
	u_id	VARCHAR(125)	NOT NULL	UNIQUE,
	u_pw	VARCHAR(125)	NOT NULL,	
	u_nick	VARCHAR(125)	NOT NULL	UNIQUE,
	u_mail	VARCHAR(125)	NOT NULL	UNIQUE,
	u_warning	INT		
);

INSERT INTO tbl_user(u_id,u_pw,u_nick,u_mail)
VALUES('korea','12345','홍길동','abc@gmail.com');

INSERT INTO tbl_user(u_id,u_pw,u_nick,u_mail)
VALUES('korea1','12345','박길동','abc1@gmail.com');

INSERT INTO tbl_user(u_id,u_pw,u_nick,u_mail)
VALUES('korea2','12345','김길동','abc2@gmail.com');

INSERT INTO tbl_user(u_id,u_pw,u_nick,u_mail)
VALUES('korea3','12345','최길동','abc3@gmail.com');

CREATE TABLE tbl_userProf (
	prof_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	prof_url	VARCHAR(300)		
);

CREATE TABLE tbl_writing (
	wr_seq				BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	wr_user				BIGINT	NOT NULL,	
	wr_nick				VARCHAR(50)	NOT NULL,	
	wr_content			VARCHAR(3000)	NOT NULL,	
	wr_like_count		INT,		
	wr_warning_count	INT,	
	wr_write_date		TIMESTAMP DEFAULT NOW(),	
	wr_last_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	
	wr_origin			VARCHAR(50)		
);

CREATE TABLE tbl_warning (
	wa_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	wa_writing	BIGINT	NOT NULL,	
	wa_user	BIGINT	NOT NULL,	
	wa_content	VARCHAR(3000)	NOT NULL,	
	wa_check	INT,		
	wa_date	TIMESTAMP DEFAULT NOW()
);

CREATE TABLE tbl_like (
	li_seq		BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	li_wr_seq	BIGINT	NOT NULL,	
	li_fan		BIGINT	NOT NULL,	
	li_date		TIMESTAMP DEFAULT NOW()		
);

INSERT INTO tbl_like (li_wr_seq,li_fan)
VALUES(8,2);

SELECT * FROM tbl_writing;
SELECT * FROM tbl_user;
SELECT * FROM tbl_like;


UPDATE tbl_writing 
SET wr_like_count = wr_like_count + 1
WHERE wr_seq = 1;

UPDATE tbl_writing
SET wr_like_count = wr_like_count - 1
WHERE wr_seq = 1;

SELECT * 
FROM tbl_writing
	LEFT JOIN tbl_like
		ON wr_seq = li_wr_seq
	LEFT JOIN tbl_user
		ON u_seq = li_fan
WHERE u_seq = 2
ORDER BY wr_last_date DESC;


SELECT * FROM tbl_writing
ORDER BY RAND() LIMIT 1;

DROP TABLE tbl_user;
DROP TABLE tbl_userProf;
DROP TABLE tbl_writing;
DROP TABLE tbl_warning;
DROP TABLE tbl_like;

ALTER TABLE tbl_user
ADD CONSTRAINT fk_user_prof
FOREIGN KEY (u_prof)
REFERENCES tbl_userprof(prof_seq);

ALTER TABLE tbl_writing
ADD CONSTRAINT fk_wr_user
FOREIGN KEY(wr_user)
REFERENCES tbl_user(u_seq);

ALTER TABLE tbl_warning
ADD CONSTRAINT fk_wa_writing
FOREIGN KEY(wa_writing)
REFERENCES tbl_writing(wr_seq);

ALTER TABLE tbl_warning
ADD CONSTRAINT fk_wa_user
FOREIGN KEY(wa_user)
REFERENCES tbl_user(u_seq);

ALTER TABLE tbl_like
ADD CONSTRAINT fk_li_writing
FOREIGN KEY(li_wr_seq)
REFERENCES tbl_writing(wr_seq);

ALTER TABLE tbl_like
ADD CONSTRAINT fk_li_user
FOREIGN KEY(li_fan)
REFERENCES tbl_user(u_seq);