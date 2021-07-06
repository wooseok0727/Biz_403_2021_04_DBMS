CREATE DATABASE amind;

use amind;

CREATE TABLE tbl_user (
	u_seq	BIGINT	auto_increment	PRIMARY KEY,
	u_prof	BIGINT	NOT NULL,	
	u_id	VARCHAR(125)	NOT NULL	UNIQUE,
	u_pw	VARCHAR(125)	NOT NULL,	
	u_nick	VARCHAR(125)	NOT NULL	UNIQUE,
	u_mail	VARCHAR(125)	NOT NULL	UNIQUE,
	u_warning	INT	
);

CREATE TABLE tbl_userProf (
	prof_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	prof_user	BIGINT	NOT NULL,	
	prof_url	VARCHAR(300)		
);

CREATE TABLE tbl_writing (
	wr_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	wr_user	BIGINT	NOT NULL,	
	wr_nick	VARCHAR(50)	NOT NULL,	
	wr_content	VARCHAR(3000)	NOT NULL,
	wr_like_count	INT,		
	wr_warning_count	INT,		
	wr_write_date		TIMESTAMP DEFAULT NOW(),
	wr_last_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	wr_origin	VARCHAR(50)		
);

CREATE TABLE tbl_warning (
	wa_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	wa_writing	BIGINT	NOT NULL,	
	wa_user	BIGINT	NOT NULL,	
	wa_content	VARCHAR(3000)	NOT NULL,	
	wa_check	TINYINT(1),		
	wa_date	TIMESTAMP DEFAULT NOW()
);

CREATE TABLE tbl_like (
	li_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	li_wr_seq	BIGINT	NOT NULL,	
	li_fan	BIGINT	NOT NULL,	
	li_date	TIMESTAMP DEFAULT NOW(), 		
	li_check	TINYINT(2)		
);

SELECT * FROM tbl_writing;