Declare @a int = 1
Declare @s varchar(500) = ' '
Declare @b int = 0
While (@a <= 10)
begin
if(@a <= 9)
set @s = @s + CONVERT(varchar(20), @a) + '+'
else
set @s = @s + CONVERT(varchar(20), @a) + '='
set @a =@a +1
set @b = @b + @a
end
print @s + convert(varchar(20), @b)

Declare @b int = 10
if @b > 10
print 'WWW'
else if @b >5 and @b <= 10
print 'Thats Right'
else print 'Well.....' 

Declare @c int = 11
print cast(@c as varchar(10))

--九九乘法表
use DB01
go

Create procedure loop99 
   @a int
   @b int 
as 
Begin
DECLARE   @i INT = 1,
          @j int = 1,
		  @k varchar(500) = ' ';
BEGIN
  WHILE ( @i<= @a )
    BEGIN
      WHILE ( @j <= @b )
        BEGIN
           set @k = @k + convert(varchar(20), @i) + 'X' + convert(varchar(20), @j) + '=' + convert(varchar(20), @i * @j) + ' '
		   set @j = @j+1
        END;
   print @k
   set @i = @i +1
   set @j = 1
   set @k = ' '
   END;
END;
End;