/*
  C:\> sqlcmd -E -i d:\ch2_script1_DB01.sql -v cols="employee_id, last_name" tabname="employees"

*/

USE Db01
GO
SELECT  $(cols)  FROM  $(tabname)
GO
