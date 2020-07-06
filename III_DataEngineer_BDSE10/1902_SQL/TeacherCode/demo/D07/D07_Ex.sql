/*
** This file contains examples from Module 8: 
** "Implementing Views"
** To use the file, highlight and execute each example.
*/

USE Northwind
GO

/*
**  Introduction to Views.
*/
CREATE VIEW dbo.EmployeeView
AS 
SELECT LastName, Firstname
FROM   Employees
GO

SELECT * from EmployeeView 
GO

/*
**  Creating Views.
*/
CREATE VIEW OrderSubtotals (OrderID, Subtotal)
AS
SELECT   OrderID, SUM( UnitPrice * Quantity * (1 - Discount)/100)
FROM     [Order Details] 
GROUP BY OrderID
GO

SELECT * FROM OrderSubtotals 
go

/* ��
CREATE VIEW dbo.OrderSubtotals (OrderID, Subtotal)
AS
SELECT OD.OrderID,
       SUM(CONVERT (money,(OD.UnitPrice*Quantity*(1-  Discount)/100))*100)
FROM  [Order Details] OD
GROUP BY OD.OrderID
GO

*/
/*
**  Example: View of Joined Tables.
*/
CREATE VIEW ShipStatusView
AS
SELECT OrderID, ShippedDate, ContactName
FROM   Customers c INNER JOIN Orders o
ON     c.CustomerID = O.CustomerID
WHERE  RequiredDate < ShippedDate
go
SELECT * FROM ShipStatusView 
go

/*
**  Altering and Dropping Views.
*/
ALTER VIEW dbo.EmployeeView
AS 
SELECT LastName, FirstName, Extension
FROM   Employees
go

SELECT * from  dbo.EmployeeView
go

/*
**  Hiding View Definitions.
*/
ALTER VIEW dbo.[Order Subtotals]
WITH ENCRYPTION
AS
SELECT OrderID, SUM( UnitPrice * Quantity * (1 - Discount)/100) AS Subtotal
FROM   [Order Details]
GROUP  BY OrderID
go

--test
select * from dbo.[Order Subtotals]
go

--sp_helptext dbo.[Order Subtotals] �[ dbo schema �y�k��
--���� 'Order Subtotals' ����r�w�[�K�C

sp_helptext [Order Subtotals]
go

exec sp_depends [Order Subtotals]   --�[�K�ᤴ�i�ݨ�̪ۨ�����W��


--with check option �d��
use northwind
go

IF OBJECT_ID ('v3', 'V') IS NOT NULL
  DROP VIEW v3 ;
go

create view v3
as
select * from Employees
where City = 'London'
with check option
go

--�d�� v3  view
select * from v3

--�z�L v3 view �ק� city �� 'Taipei', �W�X��d�� 'London' ����
update v3 set city = 'Taipei' where employeeid = 5

/*
�T�� 550�A�h�� 16�A���A 1�A�� 2
���մ��J�Χ�s�w�g���ѡA�]���ؼ��˵����w�F WITH CHECK OPTION 
�θ�V���w�F WITH CHECK OPTION ���˵��A�Ӹӧ@�~���ͪ��@�өΦh�Ӹ�ƦC
�b CHECK OPTION ��������U�ä��X��C
���z���w�g�����C

*/


--Extra
/*
**  Performance Considerations.
*/
go
CREATE VIEW dbo.TotalPurchaseView
AS
SELECT CompanyName, Sum(CONVERT(money,
       (UnitPrice*Quantity*(1-Discount)/100))*100) AS Subtotal
FROM   Customers c INNER JOIN Orders o
ON     c.CustomerID=o.CustomerID 
INNER JOIN [Order Details] od
ON     o.OrderID = od.OrderID
GROUP BY CompanyName
GO

CREATE VIEW dbo.TopSalesView
AS
SELECT *
FROM   dbo.TotalPurchaseView
WHERE  Subtotal > 50000
GO

SELECT *
FROM   dbo.TopSalesView
WHERE  CompanyName = 'Ernst Handel'

GO
