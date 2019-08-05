
-- 使用計算資料行的運算式
--例 1 利用 ((low + high)/2) 運算式來計算 myavg 計算資料行。


CREATE TABLE dbo.mytable 
( low   int, 
  high  int, 
  myavg AS (low + high)/2
) ;
GO


--測試  不能輸入 計算欄位
insert into mytable values(10,20)
insert into mytable(low,high) values(20,30)

select * from mytable 
GO

--error
insert into mytable values(10,20,15)

--訊息 213，層級 16，狀態 1，行 1
--資料行名稱或提供的數值數量與資料表定義不相符。


--例 2 使用計算資料行的 USER_NAME 函數
--下列範例會使用 myuser_name 資料行中的 USER_NAME() 函數

CREATE TABLE dbo.mylogintable
( date_in     datetime,
  user_id     int,
  myuser_name AS USER_NAME()
) ;
GO

--測試
insert into mylogintable values('2009-12-08', 101)

select * from mylogintable
GO