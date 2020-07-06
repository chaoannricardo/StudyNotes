select *
from DEPARTMENTS

exec sp_columns employees

select last_name , salary , 12 * salary + 100 [¦~Á~]
from employees

select last_name "Name", COMMISSION_PCT, SALARY*12 "¦~Á~" 
from EMPLOYEES

select LAST_NAME + JOB_ID "Employees"
from employees

select LAST_NAME + JOB_ID + '  is a pig.' "Employees"
from employees

select distinct DEPARTMENT_ID
from employees

select EMPLOYEE_ID, LAST_NAME, JOB_ID, DEPARTMENT_ID
from employees 
where DEPARTMENT_ID = 90

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
from employees
where LAST_NAME = 'Whalen'

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, HIRE_DATE
from employees
where HIRE_DATE = '1994-06-07'

select LAST_NAME, SALARY
from employees
where SALARY >= 2500 and SALARY <= 3500

select LAST_NAME, SALARY
from employees
where SALARY between 2500 and 3500

select EMPLOYEE_ID, LAST_NAME, SALARY, MANAGER_ID 
from EMPLOYEES
where MANAGER_ID in (100, 101, 201)

select FIRST_NAME
from employees
where FIRST_NAME like '%e%'

select FIRST_NAME
from employees
where FIRST_NAME like 'S%'

select FIRST_NAME
from employees
where FIRST_NAME like '%S'

select FIRST_NAME
from employees
where FIRST_NAME like '[a-d]%'

select LAST_NAME, MANAGER_ID
from employees
where MANAGER_ID is NULL

select LAST_NAME, MANAGER_ID
from employees
where MANAGER_ID is not Null

select EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
from employees
where  SALARY >= 10000
and JOB_ID like '%MAN%'

select EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
from employees
where (JOB_ID = 'SA_REP'
or JOB_ID = 'AD_PRES')
and SALARY > 15000

select  LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY
from employees
order by SALARY Desc

select LAST_NAME, DEPARTMENT_ID, SALARY
from employees
order by DEPARTMENT_ID, SALARY desc

select top(3) SALARY, EMPLOYEE_ID, LAST_NAME
from employees
order by SALARY desc

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
from employees
where Lower(LAST_NAME) = 'higgins'

select LAST_NAME, JOB_ID, len(LAST_NAME) "Length", CHARINDEX('a', LAST_NAME) "INSTR"
from employees
where  SUBSTRING(JOB_ID, 4, 3) = 'REP'


select LAST_NAME, JOB_ID, LEN(LAST_NAME) "Length", CHARINDEX('a', LAST_NAME) "INSTR"
from employees
where RTRIM(LAST_NAME) = 'higgins'

select ROUND(19.265487761, 0)

select DATEADD(Month, 6, '2009-03-30')

select cast ('3' as int)

select LAST_NAME, SALARY, COMMISSION_PCT, ISNULL(COMMISSION_PCT, 0)
from employees


select LAST_NAME, JOB_ID, SALARY,
	case job_id when 'IT_PROG' then 1.1 * SALARY
	when 'ST_CLERk' then 0
	else SALARY
	end
from employees

select LAST_NAME, JOB_ID, SALARY,
	case JOB_ID 
		when 'IT_PROG' then 1.10 * SALARY
		when 'ST_CLERK' then 1.15 * SALARY
		when 'SA_REP' then 1.20 * SALARY
		else SALARY
		end "REVISED SALARY"
from employees

select LAST_NAME, JOB_ID, SALARY,
	case JOB_ID 
	when 'IT_PROG' then 1.10 * SALARY
	when 'ST_CLERK' then 1.15 * SALARY
	when 'SA_REP' then 1.20 * SALARY
	else SALARY
	end  "NEW SALARY"
from employees

