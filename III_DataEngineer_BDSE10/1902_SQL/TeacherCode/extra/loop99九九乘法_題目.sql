--�E�E���k��

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


--��X�榡
/*

1 ��0 ����k���@ 3--> 03,  12-->12 
  PRINT  RIGHT('0'+CONVERT(varchar(2), @i),2)
  PRINT  format(@i,'00')

2 ��� @i * @j = @i * @j ����k���@  03*04=12  
  
  �Υ[���[�r���_ :  @i + '*' + @j + '=' + @i*@j

PRINT right('0'+convert(varchar(2), @i),2) 
    + '*'
    + right('0'+convert(varchar(2), @j),2) 
    + '=' 
    + right('0'+convert(varchar(2), @i*@j),2);
      

SQL 2012 �s�W format���

declare  @str varchar(150)
set @str= ''
set @str += format(@i,'00') + '*' + format(@j,'00') + '=' + format(@i*@j,'00') + CHAR(9)

*/