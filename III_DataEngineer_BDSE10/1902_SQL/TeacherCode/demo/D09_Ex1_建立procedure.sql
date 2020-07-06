/*
   This file contains examples from 'Module 9: Implementing Stored 
   Procedures'.  To use the file, highlight and execute each example.
*/

/*
   «Ø¥ß ¹wÀxµ{§Ç ¨Ò1: Creating Stored Procedures 
   Example
   The following statements create a stored procedure that lists all 
   overdue orders in the Northwind database.
*/

USE Northwind
GO
CREATE PROCEDURE dbo.OverdueOrders     --©Î ¬Ù²¤¬° CREATE PROC dbo.OverdueOrders
AS
  SELECT * 
   FROM dbo.Orders
   WHERE RequiredDate < GETDATE() AND ShippedDate IS Null
GO

/*
  °õ¦æ Executing a Stored Procedure by Itself
  Example 1
  The following statement executes a stored procedure that lists all 
  overdue orders in the Northwind database.
*/

EXEC OverdueOrders
go

--¬d¸ß©w¸q

sp_help     OverdueOrders
sp_helptext OverdueOrders
sp_depends  OverdueOrders
sp_stored_procedures OverdueOrders
go

--°õ¦æ¤èªk2 : ¥H SSMS/¸ê®Æ®w¦W/¥iµ{¦¡©Ê/ ¥kÁä ¹w¦sµ{§Ç ¦W/ °õ¦æ¹w¦sµ{§Ç
--·|¦Û°Ê«Ø¥ß´ú¸Õµ{§Ç

USE [Northwind]
GO

DECLARE	@return_value int
EXEC	@return_value = [dbo].[OverdueOrders]
SELECT	'Return Value' = @return_value
GO

/*
  «Ø¥ß ¹wÀxµ{§Ç ¨Ò2 : ·f°t INSERT «ü¥O Executing a Stored Procedure Within an INSERT Statement
  Example 2
  The following statements create the EmployeeCustomer stored procedure, 
  which inserts employees into the Customers table of the Northwind database. 
*/

USE Northwind
GO

CREATE PROCEDURE  dbo.EmployeeCustomer
AS
SELECT 
   UPPER(SUBSTRING(LastName, 1, 4)+SUBSTRING(FirstName, 1,1)),
   'Northwind Traders', RTRIM(FirstName)+' '+LastName,
   'Employee', Address, City, Region, PostalCode, Country,
   ('(206) 555-1234'+' x'+Extension), NULL
FROM Employees
WHERE HireDate < GETDATE()
GO

/*
  The following statements execute the stored procedure.
*/

--°õ¦æ

USE Northwind
INSERT INTO Customers
EXEC EmployeeCustomer

/*
  ­×§ï ¹wÀxµ{§Ç ¨Ò3: Altering Stored Procedures
  Example
  The following example modifies the OverdueOrders stored procedure to 
  select specific column names only rather than all columns from the 
  Orders tabletable, as well as to sort the result set.
*/

USE Northwind
GO
ALTER PROCEDURE  dbo.OverdueOrders
AS
SELECT CONVERT(char(8), RequiredDate, 1) RequiredDate, 
  CONVERT(char(8), OrderDate, 1) OrderDate,
  OrderID, CustomerID, EmployeeID
  FROM Orders
WHERE RequiredDate < GETDATE() AND ShippedDate IS Null
ORDER BY RequiredDate 
GO

/* 
   The following statement executes the stored procedure.
*/
--°õ¦æ

EXEC OverdueOrders

/*
 §R°£ ¹wÀxµ{§Ç ¨Ò4: Dropping Stored Procedures
 This example drops the OverdueOrders stored procedure.
*/

USE Northwind
GO
DROP PROCEDURE  OverdueOrders
GO

/*
  «Ø¥ß ¹wÀxµ{§Ç ¨Ò5: ±a°Ñ¼Æ Using Input Parameters
  The following example returns all sales between two specified dates.
*/

USE Northwind
GO

CREATE PROCEDURE [Year to Year Sales]  	@BeginningDate DateTime, 
                                        @EndingDate DateTime 
AS
SELECT 
   Orders.ShippedDate,  Orders.OrderID,  [Order Subtotals].Subtotal, 
   DATENAME(yy,ShippedDate) AS Year
FROM  Orders INNER JOIN [Order Subtotals] 
ON    Orders.OrderID = [Order Subtotals].OrderID
WHERE Orders.ShippedDate Between @BeginningDate And @EndingDate
GO

--°õ¦æ

EXEC [Year to Year Sales] '1996-07-16', '1996-07-23'
EXEC [Year to Year Sales] @BeginningDate = '1996-07-16', @EndingDate = '1996-07-23'

--µ¥¦P©ó
SELECT  Orders.ShippedDate,  Orders.OrderID,  [Order Subtotals].Subtotal, 
        DATENAME(yy,ShippedDate) AS Year
FROM  Orders INNER JOIN [Order Subtotals] 
ON    Orders.OrderID = [Order Subtotals].OrderID
WHERE Orders.ShippedDate Between '1996-07-16' And '1996-07-23'

GO

/*
Returning Values with Output Parameters
Example 1
This example creates a MathTutor stored procedure that calculates the product of two numbers. 
This example uses the SET statement. However, you can also use the SELECT statement to dynamically concatenate a string. 
A SET statement requires a variable to be declared to print the string “The result is:?

*/

USE Northwind
GO
CREATE PROCEDURE dbo.MathTutor
	@m1 smallint,
	@m2 smallint,
	@result smallint OUTPUT
AS
	SET @result = @m1* @m2 
GO

/*
This batch calls the MathTutor stored procedure and passes the values of 5 and 6. 
These values become variables, which are entered into the SET statement.
*/

DECLARE @answer smallint
EXECUTE MathTutor 5,6, @answer OUTPUT
SELECT 'The result is:', @answer
GO

/*
Example 1 ¨C¦¸°õ¦æ®É, ­«·s recompile

CREATE PROCEDURE [WITH RECOMPILE] 

The following statement creates a stored procedure called OrderCount
that is recompiled each time that it is executed.
*/

USE Northwind
GO
CREATE PROC OrderCount 
@CustomerID nchar (10)
WITH RECOMPILE
AS
	SELECT count(*) FROM [Orders Qry]
	WHERE CustomerID = @CustomerID
GO

 
-- recompiled each time that it is executed.
exec OrderCount 'ALFKI'
GO
 

/*
Example 2 °õ¦æ®É ©I¥s recompile

EXECUTE [WITH RECOMPILE] 

This example recompiles the sp_help system stored procedure at the 
time that it is executed.
*/

EXEC sp_help WITH RECOMPILE
GO

/*
Example 3 ­«½sÄ¶¸ò Customers ¸ê®Æªí¬ÛÃöªº stored procedure ¤Î triggers
This example recompiles all stored procedures or triggers that reference the Customers table in the Northwind database.
*/

EXEC sp_recompile Customers
go


/*
Example 4 ©µ¦ùµ{§Ç
Executing Extended Stored Procedures

This example executes a command that displays a list of files and 
subdirectories.
*/

EXEC master..xp_cmdshell 'dir c:\'
GO


/*
­Y¥X²{ error :SQL Server ¤w«ÊÂê¤¸¥ó 'xp_cmdshell' ¤§¦s¨ú¡A¦]¬°¦¹¤¸¥ó¤w¸g¥Ñ¦¹¦øªA¾¹ªº¦w¥þ©Ê²ÕºAÃö³¬¡C
¨t²ÎºÞ²z­û¥i¥H¨Ï¥Î sp_configure ¨Ó±Ò¥Î 'xp_cmdshell' ªº¨Ï¥Î¡C

¶}±ÒªA°È

EXEC sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell', 1;RECONFIGURE;

*/

/*
This example executes the sp_helptext system stored procedure to display the name of the dll 
that contains the xp_cmdshell extended stored procedure.
*/

EXEC master..sp_helptext xp_cmdshell

/*
Example 5 ¦^¶Çª¬ºA @@ROWCOUNT

RETURN Statement

This example creates a stored procedure that retrieves information 
from the Orders and Customers tables by querying the Orders Qry view. 
The GetOrders stored procedure can be nested within another stored 
procedure. The RETURN statement in the GetOrders stored procedure returns the total number of rows 
from the SELECT statement to another stored procedure. 
*/

USE Northwind
GO
CREATE PROCEDURE GetOrders
	@CustomerID nchar (10)
AS
	SELECT OrderID, CustomerID, EmployeeID
	FROM [Orders Qry]
	WHERE CustomerID = @CustomerID
	RETURN (@@ROWCOUNT)
GO

--run

DECLARE	@return_value int
EXEC	@return_value = [dbo].[GetOrders]
		@CustomerID = 'ALFKI'
SELECT	'Return Value' = @return_value

GO



/*
sp_addmessage
Example 6 ¦Û­q¿ù»~°T®§

This example creates a user-defined error message that requires 
the message to be written to the Windows 2000 application log when it 
occurs.
*/

EXEC sp_addmessage
@msgnum = 50010, 
@severity = 10, 
@msgtext = 'Customer cannot be deleted.',
@lang = us_english
@with_log = 'true'
GO


/*
RAISERROR Statement
Example
This example raises a user-defined error message and writes the 
message to the Windows 2000 application log. 
Remove the in-line comment to create the error message first, if it hasn't already been created.
*/

--EXEC sp_addmessage 50010, 10, 'Customer cannot be deleted.'

RAISERROR(50010, 10, 1) WITH LOG 
GO



/*
¨Ò  °õ¦æ«á, §PÂ_ @@error¬O§_¦³¿ù,  ¨ú®ø¥æ©ö

Example 7
This example creates the AddSupplierProduct stored procedure that uses
the @@error function to determine whether an error occurs when each 
INSERT statement is executed. If the error does occur, the transaction 
is rolled back.
*/
USE Northwind
GO
CREATE PROCEDURE AddSupplierProduct
        @CompanyName nvarchar (40) = NULL,
        @ContactName nvarchar (40) = NULL,
        @ContactTitle nvarchar (40)= NULL,
        @Address nvarchar (60) = NULL,
        @City nvarchar (15) = NULL,
        @Region nvarchar (40)= NULL,
        @PostalCode nvarchar (10) = NULL,
        @Country nvarchar (15) = NULL,
        @Phone nvarchar (24) = NULL,
        @Fax nvarchar (24) = NULL,
        @HomePage ntext = NULL,
        @ProductName nvarchar (40) = NULL,
        @CategoryID int = NULL,
        @QuantityPerUnit nvarchar (20) = NULL, 
        @UnitPrice money = NULL, 
        @UnitsInStock smallint = NULL,
        @UnitsOnOrder smallint = NULL,
        @ReorderLevel smallint = NULL,
        @Discontinued bit  = NULL
AS 
BEGIN TRANSACTION
	INSERT Suppliers (CompanyName,  ContactName,  Address, City, Region,PostalCode, Country, Phone)
	VALUES (@CompanyName, @ContactName, @Address, @City, @Region, @PostalCode, @Country, @Phone)
		IF @@error <> 0
			BEGIN
				ROLLBACK TRAN
				RETURN
			END
	DECLARE @InsertSupplierID int
	SELECT @InsertSupplierID=@@identity
	INSERT Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, Discontinued)
	VALUES (@ProductName, @InsertSupplierID, @CategoryID, @QuantityPerUnit, @Discontinued)
		IF @@error <> 0
			BEGIN
				ROLLBACK TRAN
				RETURN
			END
COMMIT TRANSACTION
GO

/*
** End of File
*/