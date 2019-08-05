--check 
--例 1
create table ck1
(  id int ,
   qty  int  check (qty >=10)
  )

--ok
insert into ck1 values(101, 25)

--not ok
insert into ck1 values(102, 5)

/*
訊息 547，層級 16，狀態 0，行 1
INSERT 陳述式與 CHECK 條件約束 "CK__ck1__qty__1367E606" 衝突。衝突發生在資料庫 "sample2"，資料表 "dbo.ck1", column 'qty'。
陳述式已經結束。
*/

--例 2 加 Constraint name
create table ck11
(  id int ,
   qty  int  constraint ck_ck11_qty_greater_than_10 check (qty >=10)
)
go

--not ok
insert into ck11 values(102, 5)

/*
訊息 547，層級 16，狀態 0，行 2
INSERT 陳述式與 CHECK 條件約束 "ck_ck11_qty_greater_than_10" 衝突。衝突發生在資料庫 "sample2"，資料表 "dbo.ck11", column 'qty'。
陳述式已經結束。
*/


--查詢 check 設定
sp_help ck1
