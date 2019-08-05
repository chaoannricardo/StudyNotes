--basic

create table member1
( id    INT,
  name  char(10),
  bdate datetime
);

--with filegroup

create table member2
( id    INT,
  name  char(10),
  bdate datetime
)
ON [PRIMARY]     


--修改 table
--加欄位

alter table member1 add tel char(15)

--改寬度
alter table member1 ALTER COLUMN name char(15)

--刪欄位
alter table member1 DROP COLUMN tel 

--改欄位名稱  name --->  ename
sp_rename 'member1.name', 'ename', 'COLUMN' 

--改表格名稱  member1 --> customer
sp_rename N'member1', N'customer', 'OBJECT'  

--刪除表格
drop table customer


--建立資料表 with identity 流水號
create table member3
( id    INT IDENTITY(10,1),
  name  char(10),
  bdate datetime
)

insert into member3(name, bdate) values('John','1980-12-01')
insert into member3(name, bdate) values('Mary','1981-10-21')

select * from member3

--以 $identity 取代 id 欄位名
select $identity, id, name from member3

/*
id  id  name
------------
10	10	John      
11	11	Mary      
*/
--error 不可強迫輸入

insert into member3 values(15,'Smith','1982-02-15')

--除非 設 IDENTITY_INSERT 及 指定欄位名稱
set IDENTITY_INSERT dbo.member3 ON
insert into member3(id,name,bdate) values(15,'Smith','1982-02-15')

--且不可 不指定欄位名稱
insert into member3 values(15,'Smith','1982-02-15')

--查詢流水號目前編到幾號
select @@IDENTITY as '目前值'

select IDENT_CURRENT('member3')  as '目前值',  
       IDENT_SEED('member3')     as '啟始值', 
       IDENT_INCR('member3')     as '遞增值'  


--補充 若 刪除資料列 id = 12 後, 重新 insert的資料, 流水號是從幾號開始 ? 12 ? 最後一個號碼的下一個
set IDENTITY_INSERT dbo.member3 OFF
delete from  member3 where id = 12
insert into member3(name, bdate) values('Mary2','1981-10-21')
select * from member3


--2012 T-SQL 流水號2  

 CREATE SEQUENCE dbo.myseq
 AS INT
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 1000
 CYCLE
 CACHE;
go

--建立資料表
create table tseq ( id int, c2 char(20))
go

insert into tseq values (NEXT VALUE FOR dbo.myseq, 'John')
insert into tseq values (NEXT VALUE FOR dbo.myseq, 'Mary')
select * from tseq;
go

-- 原始方法
--建立資料表 with identity 流水號
create table member3
( id    INT IDENTITY(10,1),
  name  char(10),
  bdate datetime
)

insert into member3(name, bdate) values('John2','1980-12-01')
insert into member3(name, bdate) values('Mary2','1981-10-21')

select * from member3

--產生唯一值 講義範例寫法: uniqueidentifier 欄位 16 位元組的 GUID, 36字長度

USE Northwind
GO
CREATE TABLE Customer
(CustID uniqueidentifier NOT NULL
	DEFAULT NEWID(),
	CustName char(30) NOT NULL) 
GO

insert into customer(Custname) values('John');
insert into customer(Custname) values('Mary');
select * from customer
go

--ex 2 以 $ROWGUID 取得 custid 欄位值

CREATE TABLE Customer2
(CustID   uniqueidentifier NOT NULL DEFAULT NEWID() ROWGUIDCOL,
 CustName char(30) NOT NULL) 
GO

insert into customer2 (Custname) values('John');
insert into customer2 (Custname) values('Mary');
select * from customer2
select $ROWGUID, custid, Custname from customer2
go
/*
CustID                               custid                               Custname
------------------------------------ ------------------------------------ ------------------------------
340F5F75-D4A1-46D8-9212-8AD06AF60EA0 340F5F75-D4A1-46D8-9212-8AD06AF60EA0 John                          
FC6B2227-09BC-4E8B-A9BE-99A05383E483 FC6B2227-09BC-4E8B-A9BE-99A05383E483 Mary                          
*/
