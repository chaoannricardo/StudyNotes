use Northwind
go

--建立 schema  (以 dbo 使用者建立其它 schema)

CREATE SCHEMA hr
GO

----建 tables時指定 schema
create table t1(id int);
create table hr.t1(id int);

insert into t1 values (101);
insert into t1 values (102);

insert into hr.t1 values (103);

select *  from hr.t1;
select *  from    t1;
select *  from dbo.t1;
go


