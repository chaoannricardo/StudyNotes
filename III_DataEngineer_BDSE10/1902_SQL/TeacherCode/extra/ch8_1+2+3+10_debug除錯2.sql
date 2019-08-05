--1+2+3...+10

DECLARE @n int,
        @s  int,
		@str  varchar(200)

SET @n=1;
set @s = 0
set @str = ''

WHILE ( @n <= 10 )
  BEGIN
    PRINT 'n= '+ CAST(@n AS varchar(2));
	set @s = @s  + @n
	if @n< 10
	  set @str = @str + CAST(@n AS varchar(2))  + ' + '
    else
	  set @str = @str + CAST(@n AS varchar(2))  + ' = '

    SET @n = @n + 1 ;   --或 SET @n += 1; 
  END

 PRINT 'S= '+ CAST(@s AS varchar(4));
 PRINT  @str +  CAST(@s AS varchar(4));



--開始debug
-- 點 功能表 / 偵錯 / 視窗 / 區域變數
-- 點程式碼左邊灰色區 設中斷點
-- 按 綠色三角型 / 點 "逐步執行" 或"不進入程式" 或 "跳離程式"
