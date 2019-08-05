--設 PK FK 時 加 on update cascade

create table cust5
(  id int     primary key
)

create table ord5
(ono int primary key,
 id  int foreign key references cust5(id) ON UPDATE CASCADE
) 

insert into cust5 values(101)
insert into cust5 values(102)
insert into cust5 values(103)

insert into ord5 values(1, 101)
insert into ord5 values(2, 101)
insert into ord5 values(3, 102)

select * from cust5
select * from ord5

--test

delete from cust5 where id = 101          --刪除失敗
update cust5 set id = 901 where id = 101  --連鎖所更新成功

select * from cust5
select * from ord5




create table cust5
(  id int     primary key
)

create table ord5
(ono int primary key,
 id  int foreign key references cust5(id) ON UPDATE CASCADE
) 

insert into cust5 values(101)
insert into cust5 values(102)
insert into cust5 values(103)

insert into ord5 values(1, 101)
insert into ord5 values(2, 101)
insert into ord5 values(3, 102)

select * from cust5
select * from ord5

--test

delete from cust5 where id = 101
update cust5 set id = 901 where id = 101

select * from cust5
select * from ord5


