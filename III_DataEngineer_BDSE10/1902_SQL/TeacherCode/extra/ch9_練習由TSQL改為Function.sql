--�бN�U�C�{���� T-SQL �אּ stored function :  sums
--�ð��� P1

DECLARE @n int, @s int;

SET @n=1;
SET @s= 0;
WHILE ( @n <= 10 )
  BEGIN
    PRINT 'n= '+ CAST(@n AS varchar(2));
	set @s = @s + @n
    SET @n = @n + 1 ;   --�� SET @n += 1; 
  END
PRINT 'S= '+ CAST(@s AS varchar(2));


/* �ѦҸѵ�
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
    SET @n = @n + 1 ;   --�� SET @n += 1; 
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