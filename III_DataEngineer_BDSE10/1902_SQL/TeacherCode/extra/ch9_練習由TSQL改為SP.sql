--�бN�U�C�{���� T-SQL �אּ stored procedure :  P1
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