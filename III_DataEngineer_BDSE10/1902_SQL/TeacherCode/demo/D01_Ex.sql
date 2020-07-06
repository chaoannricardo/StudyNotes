/*
**This file contains examples from 'Module1: SQL Server Overview'.
**To use the file, highlight and execute each example.
**
**Partially Specified Names
**
**Example
**The following example creates an OrderHistory table in the Northwind 
**database.
*/

USE Northwind
go

CREATE TABLE Northwind.dbo.OrderHistory
	(OrderID int,
	ProductID int,
	UnitPrice money,
	Quantity int, 
	Discount decimal)
GO

/*
**System Stored Procedures
**
**  Example
**  The following example executes a system stored procedure to get 
**information on the Employees table.
*/

USE Northwind
EXEC sp_help Employees

/*
**System Functions
**
**Example
**The following example uses a system function in a query to get the 
**user name for a user ID of 10.
*/

--查詢 使用者名稱 : dbo
SELECT USER_NAME()

--查詢 登入(Login)名稱 : sa  或 Student  
SELECT SUSER_NAME()

/*
select uid, name from sys.sysusers

uid    name 
------ ------ 
1      dbo
2      guest
3      INFORMATION_SCHEMA
4      sys
           
*/

--查詢 登入(Login)名稱 : 依 OS 登入: OS帳號,  SQL Server 登入: sa
SELECT SUSER_NAME()

/*
**Information Schema Views
**
**Example
**The following example queries an information schema view to get a 
**list of tables in a database.
*/

SELECT * FROM INFORMATION_SCHEMA.TABLES
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
SELECT * FROM SYS.SYSUSERS  

/*
** End of File
*/




