--PIVOT ¤Î UNPIVOT »yªk

use DB01
go
create table Orders
( cust  char(10),
  prod  char(10),
  qty   int
)
insert into Orders values ('Mike','Bike', 3);
insert into Orders values ('Mike','Chain',2);
insert into Orders values ('Mike','Bike', 5);
insert into Orders values ('Lisa','Bike', 3);
insert into Orders values ('Lisa','Chain',3);
insert into Orders values ('Lisa','Chain',4);
select * from orders

--PIVOT
SELECT * FROM Orders  
PIVOT (SUM(Qty) FOR Prod IN ([Bike],[Chain])) PVT

--UNPIVOT
create table PivotedOrders
( cust  char(10),
  bike  char(10),
  chain char(10)
)
go
insert into PivotedOrders 
SELECT * FROM Orders  
PIVOT (SUM(Qty) FOR Prod IN ([Bike],[Chain])) PVT
go
select * from PivotedOrders 
go

SELECT Cust, Prod, Qty
FROM PivotedOrders  
UNPIVOT (Qty FOR Prod IN ([Bike],[Chain])) UnPVT
go

