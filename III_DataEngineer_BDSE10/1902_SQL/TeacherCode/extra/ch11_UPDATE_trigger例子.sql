--刪除表格
drop table emp
drop table ck_sal
go

--建立表格及資料
create table emp( empno int,
                  ename char(20),
                  sal   int
                )
go

insert into emp values(101,'aa',2000)
insert into emp values(102,'bb',2500)
insert into emp values(103,'cc',3000)
insert into emp values(104,'dd',3200)
select * from emp                

create table ck_sal (d     date,
                     u     char(20), 
                     empno int,
                     old   int,
                     new   int)

go

--建立觸發程序 當修改 薪資時 會被記錄
CREATE TRIGGER salary_check 
ON emp  
AFTER UPDATE
AS
BEGIN
  declare @old int
  declare @old_emp int
  declare @new int

  --查出 修改前及後的值  
  select @old_emp= empno, @old= sal from DELETED  
  select @new= sal from INSERTED

  --寫入 稽核表
  insert into dbo.ck_sal values(getdate(),user, @old_emp,@old, @new);

END


update emp set sal = sal + 1000 where empno = 102

select * from ck_sal

--或上述例子謹限於更動某一筆, 若一次更新多筆時,只能記錄最後一筆---------------

--修正建立觸發程序 當修改多筆 薪資時 都會被記錄
ALTER TRIGGER salary_check 
ON emp  
AFTER UPDATE
AS
BEGIN
  
  insert into dbo.ck_sal
   select getdate(),user, D.empno, D.sal, I.sal
   from DELETED D join INSERTED I
   ON D.empno = I.empno
     
END

--測試 一次修改多筆資料
truncate table ck_sal

update emp set sal = sal + 1000 where empno >= 102

select * from ck_sal

--手動查 table建了那些 trigger 
select * from sys.triggers 
where parent_id in  (select  object_id from sys.tables where name = 'emp' )

 
