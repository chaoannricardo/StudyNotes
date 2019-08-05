use northwind
go

create view v3
as
select * from Employees
where City = 'London'
with check option

select * from v3

update v3 set city = 'Taipei' where employeeid = 5