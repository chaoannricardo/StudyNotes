--建cust 客戶主表 PK in column level

create table cust
(
  cno   int      primary key,
  name  char(10)
);

--或 客戶主表 PK in table level
create table cust2
(
  cno   int,
  name  char(10),
  primary key(cno)
);

--建 ord訂單子表 加 FK

create table ord
(ordno  int  primary key,
 qty    int  check(qty >= 10),
 cno    int  foreign key references cust(cno)
 )
 
--測試
insert into cust values (101,'張三');
insert into cust values (102,'李四');
 
insert into ord values (1, 15, 101);
insert into ord values (2, 12, 102);
 
insert into ord values (3, 12, 109); --error 不存在的客戶
 
select * from cust
select * from ord

--刪除主表失敗 因 子表有資料, 除非子表 FK設成 ON DELETE CASCADE

delete from cust where cno=101 
 
 