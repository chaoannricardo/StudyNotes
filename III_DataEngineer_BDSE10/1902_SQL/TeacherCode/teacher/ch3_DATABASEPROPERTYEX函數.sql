--ms-help://MS.SQLCC.v10/MS.SQLSVR.v10.zh-CHT/s10de_6tsql/html/8a9e0ffb-28b5-4640-95b2-a54e3e5ad941.htm

exec sp_helpdb DB03

select  name,  collation_name from  sys.databases
where name = 'DB03'



select  DATABASEPROPERTYEX('DB03', 'collation')

或

select name, collation_name from sys.databases 

或

select SERVERPROPERTY('collation')
select SERVERPROPERTY('Edition')      --查版本 Enterprise Edition
select SERVERPROPERTY('EngineEdition') 

/* 安裝在伺服器上之 Database Engine 版的 SQL Server 執行個體。
1 = Personal 或 Desktop Engine (不適用於 SQL Server。)
2 = Standard (Standard 和 Workgroup 會傳回這個值。)
3 = Enterprise (Enterprise、Enterprise Evaluation 和 Developer 都會傳回這個項目。)
4 = Express (Express、Express with Advanced Services 和 Windows Embedded SQL 都會傳回這個值。)
*/

select SERVERPROPERTY('SqlCharSetName')     --cp950
