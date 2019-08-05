--�R�����
drop table emp
drop table ck_sal
go

--�إߪ��θ��
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

--�إ�Ĳ�o�{�� ��ק� �~��� �|�Q�O��
CREATE TRIGGER salary_check 
ON emp  
AFTER UPDATE
AS
BEGIN
  declare @old int
  declare @old_emp int
  declare @new int

  --�d�X �ק�e�Ϋ᪺��  
  select @old_emp= empno, @old= sal from DELETED  
  select @new= sal from INSERTED

  --�g�J �]�֪�
  insert into dbo.ck_sal values(getdate(),user, @old_emp,@old, @new);

END


update emp set sal = sal + 1000 where empno = 102

select * from ck_sal

--�ΤW�z�Ҥl�ԭ����ʬY�@��, �Y�@����s�h����,�u��O���̫�@��---------------

--�ץ��إ�Ĳ�o�{�� ��ק�h�� �~��� ���|�Q�O��
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

--���� �@���ק�h�����
truncate table ck_sal

update emp set sal = sal + 1000 where empno >= 102

select * from ck_sal

--��ʬd table�ؤF���� trigger 
select * from sys.triggers 
where parent_id in  (select  object_id from sys.tables where name = 'emp' )

 
