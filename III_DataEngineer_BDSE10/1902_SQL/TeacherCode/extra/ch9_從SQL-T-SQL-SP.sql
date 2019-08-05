
use Northwind 
go

--SQL 

select ProductID, UnitPrice, UnitsInStock  from products
update products set UnitPrice = UnitPrice + 2  where ProductID =1

--T-SQL

DECLARE @p int;
BEGIN
  select @p= UnitPrice  from products where ProductID =1
  if @p >= 50
    update products set UnitPrice = UnitPrice + 2 where ProductID =1
  else
    update products set UnitPrice = UnitPrice + 1 where ProductID =1

END

--stored procdure

go;


create procedure p1 @pid int, @v int
as
begin
DECLARE @p int;
  begin
  select @p= UnitPrice  from products where ProductID = @pid
  if @p >= 50
    update products set UnitPrice = UnitPrice + @v +2 where ProductID = @pid
  else
    update products set UnitPrice = UnitPrice + @v +1where ProductID = @pid

   END
END


--run

exec  p1  1, 5
exec  p1  @pid=1, @v=5   
exec  p1  @v=5 , @pid=1
go

--java

--  call   p1( ?, ? )

--function
create  function f_price ( @v_unitprice money)
RETURNS money
AS
begin
  declare @x money;
  if @v_unitprice > 50 
    set @x =  @v_unitprice + 2
  else
    set @x =  @v_unitprice + 1
  
  RETURN @x  
       
end
go
--run


select ProductID, UnitPrice, dbo.f_price(UnitPrice)  from products

--Java call procedure
/*
http://stackoverflow.com/questions/6113674/how-do-i-execute-a-ms-sql-server-stored-procedure-in-java-jsp-returning-table-d

CREATE PROCEDURE sp_test AS
BEGIN
PRINT 'HELLO WORLD'
END


--in java

Class.forName("net.sourceforge.jtds.jdbc.Driver");
java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:jtds:sqlserver://MySQLServer:1433/test", "user", "pass");
java.sql.CallableStatement cs = conn.prepareCall("{call sp_test}"); 
java.sql.ResultSet ResultSet = cs.execute();


*/

