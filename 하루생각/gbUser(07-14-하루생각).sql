CREATE DATABASE amind;

use amind;

CREATE TABLE tbl_user (
	u_seq	BIGINT			auto_increment	PRIMARY KEY,
	u_prof	BIGINT 			UNIQUE,		
	u_id	VARCHAR(125)	NOT NULL	UNIQUE,
	u_pw	VARCHAR(125)	NOT NULL,	
	u_nick	VARCHAR(125)	NOT NULL	UNIQUE,
	u_mail	VARCHAR(125)	NOT NULL	UNIQUE,
	u_warning	INT DEFAULT 0,
	u_ban INT DEFAULT 0,
    u_level INT
);

CREATE TABLE tbl_userProf (
	prof_seq	BIGINT			AUTO_INCREMENT	PRIMARY KEY,
	prof_url	VARCHAR(300)		
);

CREATE TABLE tbl_writing (
	wr_seq				BIGINT			AUTO_INCREMENT	PRIMARY KEY,
	wr_user				BIGINT			NOT NULL,	
	wr_nick				VARCHAR(50)		NOT NULL,	
	wr_content			VARCHAR(3000)	NOT NULL,	
	wr_like_count		INT DEFAULT 0,		
	wr_warning_count	INT DEFAULT 0,	
	wr_write_date		TIMESTAMP DEFAULT NOW(),	
	wr_last_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	
	wr_origin			VARCHAR(50)		
);

CREATE TABLE tbl_warning (
	wa_seq		BIGINT			AUTO_INCREMENT	PRIMARY KEY,
	wa_writing	BIGINT			NOT NULL,	
	wa_user		BIGINT			NOT NULL,	
	wa_content	VARCHAR(3000)	NOT NULL,	
	wa_check	INT DEFAULT 0,		
	wa_date		TIMESTAMP DEFAULT NOW()
);

CREATE TABLE tbl_like (
	li_seq		BIGINT		AUTO_INCREMENT	PRIMARY KEY,
	li_wr_seq	BIGINT		NOT NULL,	
	li_fan		BIGINT		NOT NULL,	
	li_date		TIMESTAMP DEFAULT NOW()		
);


SELECT * FROM tbl_writing;
SELECT * FROM tbl_like;
SELECT * FROM tbl_warning;
SELECT * FROM tbl_user;
SELECT * FROM tbl_userProf;

DROP TABLE tbl_writing;
DROP TABLE tbl_like;
DROP TABLE tbl_warning;
DROP TABLE tbl_user;
DROP TABLE tbl_userProf;


ALTER TABLE tbl_userProf
ADD CONSTRAINT fk_prof
FOREIGN KEY (prof_seq)
REFERENCES tbl_user(u_prof)
ON DELETE CASCADE;

ALTER TABLE tbl_writing
ADD CONSTRAINT fk_wr_user
FOREIGN KEY(wr_user)
REFERENCES tbl_user(u_seq)
ON DELETE CASCADE;

ALTER TABLE tbl_warning
ADD CONSTRAINT fk_wa_writing
FOREIGN KEY(wa_writing)
REFERENCES tbl_writing(wr_seq)
ON DELETE CASCADE;

ALTER TABLE tbl_warning
ADD CONSTRAINT fk_wa_user
FOREIGN KEY(wa_user)
REFERENCES tbl_user(u_seq);

ALTER TABLE tbl_like
ADD CONSTRAINT fk_li_writing
FOREIGN KEY(li_wr_seq)
REFERENCES tbl_writing(wr_seq)
ON DELETE CASCADE;

ALTER TABLE tbl_like
ADD CONSTRAINT fk_li_user
FOREIGN KEY(li_fan)
REFERENCES tbl_user(u_seq)
ON DELETE CASCADE;