--ms-help://MS.SQLCC.v10/MS.SQLSVR.v10.zh-CHT/s10de_6tsql/html/8a9e0ffb-28b5-4640-95b2-a54e3e5ad941.htm

exec sp_helpdb DB03

select  name,  collation_name from  sys.databases
where name = 'DB03'



select  DATABASEPROPERTYEX('DB03', 'collation')

��

select name, collation_name from sys.databases 

��

select SERVERPROPERTY('collation')
select SERVERPROPERTY('Edition')      --�d���� Enterprise Edition
select SERVERPROPERTY('EngineEdition') 

/* �w�˦b���A���W�� Database Engine ���� SQL Server �������C
1 = Personal �� Desktop Engine (���A�Ω� SQL Server�C)
2 = Standard (Standard �M Workgroup �|�Ǧ^�o�ӭȡC)
3 = Enterprise (Enterprise�BEnterprise Evaluation �M Developer ���|�Ǧ^�o�Ӷ��ءC)
4 = Express (Express�BExpress with Advanced Services �M Windows Embedded SQL ���|�Ǧ^�o�ӭȡC)
*/

select SERVERPROPERTY('SqlCharSetName')     --cp950
