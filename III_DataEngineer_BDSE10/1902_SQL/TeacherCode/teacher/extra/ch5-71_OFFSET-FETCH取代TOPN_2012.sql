--SQL 2012 OFFSET FETCH 語法取代 TOP N, 因 TOP N 非標準語法,且不能指定輸出範圍

--例 1 DB01 DB
USE DB01
GO
--原始資料
select  salary , employee_id, last_name
from    employees 
order by  salary  desc

/*
salary      employee_id last_name
----------- ----------- -------------------------
24000       100         King
17000       101         Kochhar
17000       102         De Haan
13000       201         Hartstein
12000       205         Higgins
11000       174         Abel
10500       149         Zlotkey
9000        103         Hunold
8600        176         Taylor
8300        206         Gietz
7000        178         Grant
:
*/
--TOP (N) - 查詢排行榜前幾名或後幾名, 括號可省略

select  TOP  ( 2 )  salary , employee_id, last_name
from    employees 
order by  salary  desc

/*
salary      employee_id last_name
----------- ----------- -------------------------
24000       100         King
17000       102         De Haan  <--注意此 17000 是 102 非101 
*/


--OFFSET 3  ROWS FETCH NEXT 5 ROWS ONLY : 跳過前3筆, 顯示往後5筆 即 4-8
select  salary , employee_id, last_name
from    employees 
order by  salary  desc
OFFSET 3  ROWS FETCH NEXT 5 ROWS ONLY

/*
salary      employee_id last_name
----------- ----------- -------------------------
13000       201         Hartstein
12000       205         Higgins
11000       174         Abel
10500       149         Zlotkey
9000        103         Hunold
*/

--例 2 Northwind DB
--排行榜  TOP n 

USE northwind
SELECT TOP 5 orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
GO

--OFFSET n 指定跳過幾筆  / FETCH NEXT n 顯示往後幾筆
--OFFSET 0  ROWS FETCH NEXT 5 ROWS ONLY 與 TOP 5 功能相同
USE northwind
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY
GO

/*
orderid     productid   quantity
----------- ----------- --------
10764       39          130
11072       64          130
10398       55          120
10451       55          120
10515       27          120

(5 個資料列受到影響)

*/

--OFFSET 10  ROWS FETCH NEXT 5 ROWS ONLY : 跳過前10筆, 顯示往後5筆 即 11-15
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
OFFSET 10  ROWS FETCH NEXT 5 ROWS ONLY
GO
