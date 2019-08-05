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

--PIVOT 用法
create table PivotedOrders
(cust  char(10),
  bike  char(10),
  chain char(10)
)

insert into PivotedOrders
select *
from Orders
pivot ( sum(qty) for prod
in ([Bike], [Chain])
) pvt

--unpivot 用法
create table UnPivotedOrders
(cust  char(10),
  prod  char(10),
  qty char(10)
)

select cust, prod, qty
from PivotedOrders
unpivot ( qty for prod
in ([bike], [chain])
) unpvt

--cte 臨時表
