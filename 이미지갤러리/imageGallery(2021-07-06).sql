USE myLibs;

CREATE TABLE tbl_gallery(
	g_seq		BIGINT			AUTO_INCREMENT	PRIMARY KEY,
	g_writer	VARCHAR(20)		NOT NULL,	
	g_date		VARCHAR(10)		NOT NULL,	
	g_time		VARCHAR(10)		NOT NULL,	
	g_subject	VARCHAR(50)		NOT NULL,	
	g_content	VARCHAR(1000)	NOT NULL,	
	g_image		VARCHAR(125)		
);

SHOW TABLES;

DROP TABLE tbl_gallery;

