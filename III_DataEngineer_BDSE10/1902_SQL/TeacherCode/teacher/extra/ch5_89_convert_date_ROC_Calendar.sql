--轉換 date 日期格式
SELECT  getdate(),        cast(YEAR(getdate())  - 1911 as varchar(4))+ '/'
  +cast(MONTH(getdate())   as varchar(2) )
  + '/' 
  +cast(DAY(getdate())   as varchar(2) )
go

  create  function  roc_calendar ( @v date)
  returns varchar(20)
  begin
    return  cast(YEAR(getdate())  - 1911 as varchar(4))+ '/'
              +cast(MONTH(getdate())   as varchar(2) )
              + '/' 
              +cast(DAY(getdate())   as varchar(2) )
  end
go

select dbo.roc_calendar( getdate())
