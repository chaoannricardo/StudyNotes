--http://ithelp.ithome.com.tw/question/10010829
--預設輸出是以 被運算欄位的位數來訂
--如 salary整數 *1.1 ,  *1.25 , *1.275 輸出就是分別小數點 1, 2 3位
--除非用 CAST 控制

select last_name, salary,  salary*1.1, salary*1.25, salary*1.275
from employees

--雖是四捨五入到小數兩位 但仍顯示三位 45.930,  46.000,  50.000
select ROUND(45.926,2),ROUND(45.926,0), ROUND(45.926,-1)

--除非 CAST  45.93
select CAST(ROUND(45.926,2) as decimal(5,2)) ,
       ROUND(45.926,0), ROUND(45.926,-1)


--限定輸出為小數點幾位, 以 CHARINDEX查 "." 位置 再搭配 LEFT函數
DECLARE @pi float  
  
-- 設定初始值   
SET @pi=3.1415926   
  
-- 顯示原本的值   
SELECT 原本的值 = @pi   
  
-- 取到小數點後第 1 位   
SELECT [取到小數點後第 1 位] = LEFT(@pi, CHARINDEX('.', @pi) + 1) 

--也可以使用這個方式來計算小數位數 , 結果為 3.142 這樣會自動四捨五入

SELECT [取到小數點後第 3 位] = convert(decimal(8,3),@pi)  

--如果不要四捨五入，可以在 @pi 減去 .(想取位數+1)5 值
--如取到小數第三位 @pi-0.0005

SELECT [取到小數點後第 1 位] = convert(decimal(8,3),@pi-0.0005)  


-- 建立使用者自訂函數   
CREATE FUNCTION dbo.GetDecimal(@number float, @point int)   
RETURNS float  
AS   
BEGIN   
    RETURN LEFT(@number, CHARINDEX('.', @number) + @point)   
END   
GO   
  
-- 測試看看   
SELECT [取到小數點後第 3 位] = dbo.GetDecimal(3.1415926, 3)  
