create table def1
(id    int,
 bdate date default getdate()
)
go
 
insert into def1(id) values (101)
insert into def1 values (102,'2016-03-30')
 
select * from def1
 
create table def2
(id int,
 id2 int  default 100
)
go

insert into def2(id) values (101)
insert into def2(id) values (102)
insert into def2(id) values (103)
insert into def2 values (104, 20)
 
select * from def2

