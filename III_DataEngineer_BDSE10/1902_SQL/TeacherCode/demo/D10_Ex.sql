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

--��1 Create the function  �ٲ� AS
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

--��g, �Y���Ψ�ƪ�����l�y�� �B��
SELECT LastName, City, Region, case when Region is null then '�����W����'
                               else Region
                               end  AS RegionConvert, Country 
FROM Employees
go


--��2 ��ڳ�� Unitprice �M�w�������C

CREATE FUNCTION fn_PriceLevel (@v_unitprice money) 
RETURNS nvarchar(4)
BEGIN
  
  RETURN case when @v_unitprice >=90  then '�ܶQ'
              when @v_unitprice >=50  then '�X�z'
              else '�K�y'
         end  
END   
go

--����
SELECT productid, productname, unitprice ,  dbo.fn_PriceLevel(unitprice) 
FROM products
go

DECLARE @v_priceLevel nvarchar(4)
SET     @v_priceLevel = dbo.fn_PriceLevel(95)
SELECT  @v_priceLevel

--��g, �Y���Ψ�ƪ�����l�y�� �B��

SELECT productid, productname, unitprice , case when unitprice >=90  then '�ܶQ'
                                                when unitprice >=50  then '�X�z'
                                           else '�K�y'
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
  SET @myinput = '����'
  RETURN @myinput
END 
go

-- Dropping a function
DROP FUNCTION dbo.fn_NewRegion
go

/*
** ��1 Scalar User-defined Function
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

--��� �H���ب�ƨӳ]�w����榡, �t�O�b�e�� mm��� �S����0
select convert( varchar(20), GETDATE(), 101)
go


--�ɥR ��g�� mm�������0

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


-- ��1b ��g�W�z�¶q��� �Ѥ���榡�� �q�ܮ榡 ('0921333333','-')   --->   0921-333-333
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
** ��2 Multi-statement Table-valued Function
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
** ��3 InLine Table-valued Function
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

--���P��
SELECT CustomerID, CompanyName
FROM   Northwind.dbo.Customers
WHERE  Region = 'WA'



