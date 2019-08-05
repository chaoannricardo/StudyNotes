--請將下列程式由 T-SQL 改為 stored function :  sums
--並執行 P1

DECLARE @n int, @s int;

SET @n=1;
SET @s= 0;
WHILE ( @n <= 10 )
  BEGIN
    PRINT 'n= '+ CAST(@n AS varchar(2));
	set @s = @s + @n
    SET @n = @n + 1 ;   --或 SET @n += 1; 
  END
PRINT 'S= '+ CAST(@s AS varchar(2));


/* 參考解答
create function sums (@v int)
returns int
as
begin
DECLARE @n int, @s int;

SET @n=1;
SET @s= 0;
WHILE ( @n <= @v )
  BEGIN
    --PRINT 'n= '+ CAST(@n AS varchar(2));
	set @s = @s + @n
    SET @n = @n + 1 ;   --或 SET @n += 1; 
  END
return @s
end
*/

/*
  select  dbo.sums(10)
 
  declare @s int
  set @s =  dbo.sums(10)
  print @s

*/