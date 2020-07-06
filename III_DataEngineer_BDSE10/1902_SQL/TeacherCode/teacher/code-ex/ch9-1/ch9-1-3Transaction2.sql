use DB01
go

--origional data
select employee_id, last_name, job_id,salary from employees where employee_id = 101

--mode 1: Autocommit (Default) �C�ӧO���O�N��@�ӥ�����W�T�{

update employees set job_id  ='IT_PROG' where employee_id = 101
go
--check data
select employee_id, last_name, job_id,salary from employees where employee_id = 101
go

--Mode 2: Explict tran���T���, �ݤ�ʫŧi����}�l
BEGIN TRANSACTION
  update employees set job_id  ='ST_MAN' where employee_id = 101
go
select employee_id, last_name, job_id,salary from employees where employee_id = 101
go

--Session 2 can not see and HOLDING
select employee_id, last_name, job_id,salary from employees where employee_id = 101
go

--Session 1  �T�{�Ψ��������, Session 2 �~��d��
commit transaction
--rollback transaction


--Session 2 �Y�d�M���󦳳] Primary Key �� �� UNIQUE INDEX ��, �i�d�䥦�����, 
select employee_id, last_name, job_id,salary from employees where employee_id = 102
go



--Mode 3: Implict tran ���t���, ���W�i�J���
SET  IMPLICIT_TRANSACTIONS  ON
update employees set job_id  ='ST_CLERK' where employee_id = 101

--Session 2 query Holding

--Session 1 ����
rollback transaction


--�]Isolation level
BEGIN TRANSACTION
  update employees set job_id  ='AD_VP' where employee_id = 101
go
select employee_id, last_name, job_id,salary from employees where employee_id = 101
go

--Session 2 �] �� read uncommitted �i query dirty data
SET  TRANSACTION  ISOLATION  LEVEL  READ  UNCOMMITTED
select employee_id, last_name, job_id,salary from employees where employee_id = 101

--Session 1 commit
commit transaction


--SET  IMPLICIT_TRANSACTIONS  Off

--�Ǧ^�ثe�� ISOLATION level

DBCC USEROPTIONS
