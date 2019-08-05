use Northwind
go

SELECT USER_NAME()    --使用者
SELECT SUSER_NAME()   --登入  sa 或 Administrator

SELECT 2+3   from employees  

SELECT * FROM  SYS.SYSUSERS  

select * from INFORMATION_SCHEMA.tables where table_type = 'BASE TABLE'
select * from sys.TABLES


exec sp_databases        --查詢資料庫
exec sp_tables           --查詢資料表
exec sp_help  employees  --查詢資料表詳細資訊  (或查簡單資訊 sp_tables employees)

