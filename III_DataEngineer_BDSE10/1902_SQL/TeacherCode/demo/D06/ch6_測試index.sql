--1 開啟 效能工具/ SQL Profiler / 新增追蹤
--2 載入 底下批次 SQL指令 模擬workload
--3 停止 SQL Profiler / 儲存檔 *.trc
--4 開啟 效能工具/ Database Engine Tuning Advisor/ 讀入檔案 *.trc / 選擇資料庫/ 
--       微調選項 進階 空間 2M以上 / 開始分析
--5 將建議  貼到剪貼簿 
   /*
     CREATE NONCLUSTERED INDEX i5 ON [dbo].[Orders] ([CustomerID] ASC,[OrderID] ASC)
     INCLUDE ( [OrderDate]) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
   */ 
--6 到 SQL 編輯器執行建立index
--7 再用 "顯示估計執行計畫" 該SQL 指令看是否有運用到該index
    --反而不是以 where之 customerid 為建議 而是 以 SELECT 之 三個欄位
    select customerid, orderid, orderdate from orders where customerid= 'VINET' and OrderID    = 10248
    select customerid, orderid, orderdate from orders where customerid= 'VINET'

--更多 INCLUDE的例子
    CREATE INDEX i52 ON Orders (CustomerID ) INCLUDE ( OrderID, OrderDate, shipcity)
    select customerid, orderid, orderdate,ShipCity from orders where customerid= 'VINET'
  
--批次 SQL指令 模擬workload 
use northwind
go

select *  from customers

select *  from customers where customerid = 'VINET'
select customerid, companyname from customers where customerid = 'VINET'
select customerid, orderid, orderdate from orders where customerid= 'VINET'

--其它欄位

select *  from customers where companyname=  'Vins et alcools Chevalier'
select *  from customers where companyname like 'Vins%'
select *  from customers where companyname like '%lier'


--合併查詢 customers --> orders ---> [order details]
--關聯             customerid   orderid
--查出 customer 'VINET' 所下 orders

select c.customerid, c.companyname, o.customerid, o.orderid, o.orderdate
from customers c JOIN orders  o
ON   c.customerid = o.customerid
where  c.customerid= 'VINET'

--查出 orders 10248 之  orders details

select o.customerid, o.orderid, o.orderdate, od.orderid, od.productid, od.quantity
from orders  o JOIN [order details] od
ON   o.orderid = od.orderid
where  o.orderid = 10248

--查出 customer 'VINET 所下 ordder 10248 之orders details

select c.customerid cid, c.companyname cname, o.customerid ocid, 
       o.orderid oid , o.orderdate odate,
       od.orderid odid, od.productid odpid , od.quantity odqty
from   customers c JOIN orders  o
ON     c.customerid = o.customerid
JOIN   [order details] od
ON     o.orderid = od.orderid
where  c.customerid= 'VINET' and
       o.orderid = 10248
