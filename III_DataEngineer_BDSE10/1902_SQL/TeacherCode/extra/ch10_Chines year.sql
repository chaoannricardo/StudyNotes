alter FUNCTION fn_DateFormat 
   (@indate datetime, @separator char(1))
RETURNS Nchar(20)
AS
BEGIN
   RETURN 
    CONVERT(Nvarchar(20), datepart(yy, @indate) - 1911)
	  + @separator+
   format( datepart(mm,@indate) , '00')
   + @separator
   + CONVERT(Nvarchar(20), datepart(dd, @indate))

END
go

-- Calling the function
SELECT dbo.fn_DateFormat(GETDATE(), '/')

--比較 以內建函數來設定日期格式, 差別在前者 mm月份 沒有補0
select convert( varchar(20), GETDATE(), 101)
go
