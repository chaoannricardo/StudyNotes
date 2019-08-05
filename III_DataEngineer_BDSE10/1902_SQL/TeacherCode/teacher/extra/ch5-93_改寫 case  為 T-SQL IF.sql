--CASE��� �� ���u job_id  �վ� salary

SELECT   last_name,  job_id,  salary,
         CASE  job_id  WHEN  'IT_PROG'  THEN  1.10 * salary
                       WHEN 'ST_CLERK'  THEN  1.15 * salary
                       WHEN 'SA_REP'    THEN  1.20 * salary
                       ELSE      salary 
         END     "REVISED_SALARY"
  FROM   employees;
go

--��g�����1
--��g case  �� T-SQL IF
create function  raise_sal  (@job_id varchar(20), @salary int)
returns int
as
begin

  IF @job_id      = 'IT_PROG' 
        return @salary * 1.1
  ELSE IF @job_id = 'ST_CLERK' 
        return @salary * 1.2
  ELSE  return @salary

  return @salary
end
go

--�I�s���
select  employee_id,  job_id, salary,  dbo.raise_sal(job_id, salary)
from  employees
go

--��g�����2
--��g case  �� T-SQL IF
create function  raise_sal2  (@job_id varchar(20), @salary int)
returns int
as
begin
  SET @salary = CASE  @job_id  WHEN 'IT_PROG'  THEN  1.10 * @salary
                               WHEN 'ST_CLERK' THEN  1.15 * @salary
                               WHEN 'SA_REP'   THEN  1.20 * @salary
                               ELSE  @salary 
                END;

  return @salary
end
go

--�I�s���
select  employee_id,  job_id, salary,  dbo.raise_sal2(job_id, salary)
from    employees
go
