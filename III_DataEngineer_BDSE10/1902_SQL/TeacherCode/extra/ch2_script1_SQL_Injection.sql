/*

--SQL Injection
--�b�Ѽƫ�[�䥦�c�N���O
--�p tablename �᭱�[ where 1=1  �� ; drop table T1 �� ; select name from sys.databases

--�쥻
C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection.sql -v cols="employeeid, lastname" tabname="employees"

--�אּ

C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection.sql -v cols="employeeid, lastname" tabname="employees where 1=1"

C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection.sql -v cols="employeeid, lastname" tabname="employees; drop table t1"

C:\> sqlcmd -E -i c:\ch2_script1_SQL_Injection.sql-v cols="employeeid, lastname" tabname="employees; select name from sys.databases"



*/

USE northwind
GO
SELECT  $(cols)  FROM  $(tabname)
GO


