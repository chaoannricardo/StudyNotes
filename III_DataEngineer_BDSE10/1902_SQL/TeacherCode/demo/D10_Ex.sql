/*
** This file contains examples from Module 10: 
** 'Implementing User-defined Functions'
** To use the file, highlight and execute each example.
*/

USE Northwind
GO

/*
** Creating a User-defined Function
**
*/

--例1 Create the function  省略 AS
CREATE FUNCTION fn_NewRegion (@myinput nvarchar(30)) 
RETURNS nvarchar(30)
BEGIN
  IF @myinput IS NULL
  SET @myinput = 'Not Applicable'
  RETURN @myinput
END   
go
-- Use the function
SELECT LastName, City, Region, dbo.fn_NewRegion(Region) AS RegionConvert, 
   Country 
FROM Employees
go

declare @n varchar(20)
declare @v varchar(20) = 'New York'
--declare @v varchar(20) = null;

set @n = dbo.fn_NewRegion( @v)
select @n
go

--改寫, 若不用函數直接於子句中 運算
SELECT LastName, City, Region, case when Region is null then '不知名城市'
                               else Region
                               end  AS RegionConvert, Country 
FROM Employees
go


--例2 跟據單價 Unitprice 決定價錢高低

CREATE FUNCTION fn_PriceLevel (@v_unitprice money) 
RETURNS nvarchar(4)
BEGIN
  
  RETURN case when @v_unitprice >=90  then '很貴'
              when @v_unitprice >=50  then '合理'
              else '便宜'
         end  
END   
go

--測試
SELECT productid, productname, unitprice ,  dbo.fn_PriceLevel(unitprice) 
FROM products
go

DECLARE @v_priceLevel nvarchar(4)
SET     @v_priceLevel = dbo.fn_PriceLevel(95)
SELECT  @v_priceLevel

--改寫, 若不用函數直接於子句中 運算

SELECT productid, productname, unitprice , case when unitprice >=90  then '很貴'
                                                when unitprice >=50  then '合理'
                                           else '便宜'
                               end  AS price_level 
FROM products
go


/*
** Altering and Dropping User-defined Functions
*/
-- Altering a function
ALTER FUNCTION dbo.fn_NewRegion (@myinput nvarchar(30)) 
RETURNS nvarchar(30)
AS
BEGIN
  IF @myinput IS NULL
  SET @myinput = '不明'
  RETURN @myinput
END 
go

-- Dropping a function
DROP FUNCTION dbo.fn_NewRegion
go

/*
** 例1 Scalar User-defined Function
*/
-- Creating the function
CREATE FUNCTION fn_DateFormat 
   (@indate datetime, @separator char(1))
RETURNS Nchar(20)
AS
BEGIN
   RETURN 
   CONVERT(Nvarchar(20), datepart(mm,@indate))
   + @separator
   + CONVERT(Nvarchar(20), datepart(dd, @indate))
   + @separator
   + CONVERT(Nvarchar(20), datepart(yy, @indate))
END
go

-- Calling the function
SELECT dbo.fn_DateFormat(GETDATE(), '/')

--比較 以內建函數來設定日期格式, 差別在前者 mm月份 沒有補0
select convert( varchar(20), GETDATE(), 101)
go


--補充 改寫為 mm月份有補0

-- Modifu the function
ALTER FUNCTION fn_DateFormat 
   (@indate datetime, @separator char(1))
RETURNS Nchar(20)
AS
BEGIN
   RETURN 
   format( datepart(mm,@indate) ,'00')  
   + @separator
   + CONVERT(Nvarchar(20), datepart(dd, @indate))
   + @separator
   + CONVERT(Nvarchar(20), datepart(yy, @indate))
END
go


-- 例1b 改寫上述純量函數 由日期格式為 電話格式 ('0921333333','-')   --->   0921-333-333
CREATE FUNCTION fn_phone
   (@inphone char(20), @separator char(1))
RETURNS Nchar(20)
AS
BEGIN
   RETURN 
     '(' 
   +
     substring(@inphone,1,4)
   + ')'
   + @separator
   +  substring(@inphone,5,3)
   + @separator
   +  substring(@inphone,8,3)
END
go

-- Calling the function

select   dbo.fn_phone ('0921345678','-')   --->   0921-345-678

drop function fn_phone
go

/*
** 例2 Multi-statement Table-valued Function
*/
-- Creating the Function
CREATE FUNCTION fn_Employees  (@length nvarchar(9))
RETURNS @fn_Employees TABLE
                           (EmployeeID int PRIMARY KEY NOT NULL,
                            [Employee Name] Nvarchar(61) NOT NULL)
AS
BEGIN
   IF @length = 'ShortName'
      INSERT @fn_Employees SELECT EmployeeID, LastName 
      FROM Employees
   ELSE IF @length = 'LongName'
      INSERT @fn_Employees SELECT EmployeeID, 
      (FirstName + ' ' + LastName) FROM Employees
RETURN
END
go

-- Calling the Function
SELECT * FROM dbo.fn_Employees('LongName')

SELECT * FROM dbo.fn_Employees('ShortName')
go

/*
** 例3 InLine Table-valued Function
*/
-- Creating the Function
CREATE FUNCTION fn_CustomerNamesInRegion
   ( @RegionParameter nvarchar(30) )
RETURNS table
AS
RETURN ( SELECT CustomerID, CompanyName
         FROM   Northwind.dbo.Customers
         WHERE  Region = @RegionParameter
   )
go

-- Calling the Function with a Parameter

SELECT * FROM fn_CustomerNamesInRegion('WA')

--等同於
SELECT CustomerID, CompanyName
FROM   Northwind.dbo.Customers
WHERE  Region = 'WA'



