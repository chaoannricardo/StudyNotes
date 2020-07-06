--九九乘法表

DECLARE   @i INT = 1,
          @j int = 1;
BEGIN
  WHILE ( @i<=9 )
    BEGIN
      WHILE ( @j <=9 )
        BEGIN
            -- PRINT i * j= i*j
            -- SET      
      
        END;
      --
      --
   END;
END;


--輸出格式
/*

1 補0 的方法之一 3--> 03,  12-->12 
  PRINT  RIGHT('0'+CONVERT(varchar(2), @i),2)
  PRINT  format(@i,'00')

2 顯示 @i * @j = @i * @j 的方法之一  03*04=12  
  
  用加號加字串串起 :  @i + '*' + @j + '=' + @i*@j

PRINT right('0'+convert(varchar(2), @i),2) 
    + '*'
    + right('0'+convert(varchar(2), @j),2) 
    + '=' 
    + right('0'+convert(varchar(2), @i*@j),2);
      

SQL 2012 新增 format函數

declare  @str varchar(150)
set @str= ''
set @str += format(@i,'00') + '*' + format(@j,'00') + '=' + format(@i*@j,'00') + CHAR(9)

*/