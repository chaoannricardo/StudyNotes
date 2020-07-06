--原始順序 120的是 10398, 10451, 10515
SELECT orderid, productid, quantity
FROM [order details]
where  quantity in (120,130)

10398	55	120   <--10398, 10451, 10515
10451	55	120
10515	27	120
10595	61	120
10678	41	120
10711	53	120
10764	39	130
10776	51	120
10894	75	120
11072	64	130

--純排序 時 120的是  10776, 10711, 10894

USE northwind
go
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
GO

10764	39	130
11072	64	130
10776	51	120    <--10776, 10711, 10894
10711	53	120
10894	75	120
10398	55	120    <--10398,10451, 10515 order by順序在後 
10451	55	120
10515	27	120

 
--排行榜  TOP n 雖是先遞減排序, 但是 TOP n 篩選資料時確是從原始順序找

--驗證
USE northwind
SELECT TOP 5 orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
GO

10764	39	130
11072	64	130
10398	55	120     <--10398 雖120 但非 Order by 的順序第一位 
10451	55	120     <--10451
10515	27	120     <--10515


