use DB01
go

--origional data
select employee_id, last_name, job_id,salary from employees where employee_id = 101

--mode 1: Autocommit (Default) 每個別指令就算一個交易馬上確認

update employees set job_id  ='IT_PROG' where employee_id = 101
go
--check data
select employee_id, last_name, job_id,salary from employees where employee_id = 101
go

--Mode 2: Explict tran明確交易, 需手動宣告交易開始
BEGIN TRANSACTION
  update employees set job_id  ='ST_MAN' where employee_id = 101
go
select employee_id, last_name, job_id,salary from employees where employee_id = 101
go

--Session 2 can not see and HOLDING
select employee_id, last_name, job_id,salary from employees where employee_id = 101
go

--Session 1  確認或取消交易後, Session 2 才能查詢
commit transaction
--rollback transaction


--Session 2 若查尋條件有設 Primary Key 或 建 UNIQUE INDEX 時, 可查其它筆資料, 
select employee_id, last_name, job_id,salary from employees where employee_id = 102
go



--Mode 3: Implict tran 隱含交易, 馬上進入交易
SET  IMPLICIT_TRANSACTIONS  ON
update employees set job_id  ='ST_CLERK' where employee_id = 101

--Session 2 query Holding

--Session 1 取消
rollback transaction


--設Isolation level
BEGIN TRANSACTION
  update employees set job_id  ='AD_VP' where employee_id = 101
go
select employee_id, last_name, job_id,salary from employees where employee_id = 101
go

--Session 2 設 成 read uncommitted 可 query dirty data
SET  TRANSACTION  ISOLATION  LEVEL  READ  UNCOMMITTED
select employee_id, last_name, job_id,salary from employees where employee_id = 101

--Session 1 commit
commit transaction


--SET  IMPLICIT_TRANSACTIONS  Off

--傳回目前的 ISOLATION level

DBCC USEROPTIONS
