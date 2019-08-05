use Northwind 
go

--刪除原有 view
IF OBJECT_ID ('v1', 'V') IS NOT NULL
   DROP VIEW v1 ;
go

--建立view
create view v1
as
select EmployeeID, LastName , Country  
from employees
where Country = 'UK'
go

--透過view查詢資料
select * 
from  v1
where employeeid = 6

--Same as
select * 
from    (
             select EmployeeID, LastName , Country  
             from employees
             where Country = 'UK'

         ) o

--檢查相依性

EXEC sp_depends  v1           --查詢view參考那些資料表及欄位
EXEC sp_depends  Employees    --查詢資料表有那些view或check條件參考引用

--查詢 view 內容

EXEC sp_helptext v1

select definition 
from sys.sql_modules 
where object_id = (select object_id from sys.views where name = 'v3')

select definition
from sys.sql_modules 
where object_id =  OBJECT_ID ('v3', 'V')


