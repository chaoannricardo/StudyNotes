--top
use AdventureWorks 
go

select  TOP  (5)  salary , employee_id, last_name
from    employees 
order by salary desc

select  TOP  (5)  WITH  TIES  salary , employee_id, last_name
from    employees 
order by salary desc

-ex2
select top 5 SalesOrderID,OrderQty
from Sales.SalesOrderDetail
order by OrderQty desc

select top 5 with ties SalesOrderID,OrderQty
from Sales.SalesOrderDetail
order by OrderQty desc

-ex3
use Northwind 
go
select top 3  orderid,Quantity
from dbo.[Order Details]
order by Quantity desc

select top 3 with ties orderid,Quantity
from dbo.[Order Details]
order by Quantity desc
