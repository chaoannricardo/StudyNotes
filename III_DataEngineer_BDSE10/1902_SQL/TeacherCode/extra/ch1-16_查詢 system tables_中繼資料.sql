use Northwind
go

SELECT USER_NAME()    --�ϥΪ�
SELECT SUSER_NAME()   --�n�J  sa �� Administrator

SELECT 2+3   from employees  

SELECT * FROM  SYS.SYSUSERS  

select * from INFORMATION_SCHEMA.tables where table_type = 'BASE TABLE'
select * from sys.TABLES


exec sp_databases        --�d�߸�Ʈw
exec sp_tables           --�d�߸�ƪ�
exec sp_help  employees  --�d�߸�ƪ�ԲӸ�T  (�άd²���T sp_tables employees)

