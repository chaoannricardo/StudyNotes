--ROW_NUMBER �ƧǨ��
select LAST_NAME, SALARY,
ROW_NUMBER() over (order by salary desc)
from employees

--RANK�ƧǨ��
select LAST_NAME, SALARY, 
RANK() over (order by salary desc)
from employees

--DENSE_RANK �ƧǨ��
select LAST_NAME, SALARY,
DENSE_RANK() over (order by salary desc)
from employees

--SELECT INTO �Ȧs��ƪ�
select EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
into #tmp_sales_reps
from employees
where JOB_ID like '%REP%'

select EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
from #tmp_sales_reps

--�q��L���ƻs���
insert into #tmp_sales_reps(EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT)
select EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
from employees
where JOB_ID like '%REP%'

select *
from #tmp_sales_reps

--Transaction �y�k
