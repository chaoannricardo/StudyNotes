use Northwind
go

--�إ� schema  (�H dbo �ϥΪ̫إߨ䥦 schema)

CREATE SCHEMA hr
GO

----�� tables�ɫ��w schema
create table t1(id int);
create table hr.t1(id int);

insert into t1 values (101);
insert into t1 values (102);

insert into hr.t1 values (103);

select *  from hr.t1;
select *  from    t1;
select *  from dbo.t1;
go


