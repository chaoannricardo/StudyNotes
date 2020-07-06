--九九乘法表
use DB01
go

Create procedure loop99 
   @a int,
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
