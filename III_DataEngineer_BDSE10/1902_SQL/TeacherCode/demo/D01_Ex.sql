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

--�d�� �ϥΪ̦W�� : dbo
SELECT USER_NAME()

--�d�� �n�J(Login)�W�� : sa  �� Student  
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

--�d�� �n�J(Login)�W�� : �� OS �n�J: OS�b��,  SQL Server �n�J: sa
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




