/*

--SQL Injection
--�b�Ѽƫ�[�䥦�c�N���O
--�p tablename �᭱�[ where 1=1  �� ; drop table T1 �� ; select name from sys.databases

--�쥻
C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection_DB01.sql -v cols="employee_id, last_name" tabname="employees"

--�אּ
 
C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection_DB01.sql -v cols="employee_id, last_name" tabname="employees where 1=1"

C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection_DB01.sql -v cols="employee_id, last_name" tabname="employees; drop table t1"

C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection_DB01.sql -v cols="employee_id, last_name" tabname="employees; select name from sys.databases"



*/

USE db01
GO
SELECT  $(cols)  FROM  $(tabname)
GO


