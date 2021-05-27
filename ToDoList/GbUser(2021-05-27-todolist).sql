USE myDB;

SELECT * FROM tbl_todolist;

DELETE FROM tbl_todolist
WHERE td_seq > 5;

SELECT * FROM tbl_todolist
ORDER BY td_edate, td_sdate, td_stime;