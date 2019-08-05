--合併table的方法：join用法
select EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.LAST_NAME, 
DEPARTMENTS.LOCATION_ID, DEPARTMENTS.DEPARTMENT_ID, 
DEPARTMENTS.DEPARTMENT_NAME
from employees join departments
on EMPLOYEES.DEPARTMENT_ID  = DEPARTMENTS.DEPARTMENT_ID

--cross join用法，注意沒有值的列也會被對應到
select EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.LAST_NAME,
DEPARTMENTS.LOCATION_ID, EMPLOYEES.DEPARTMENT_ID, 
DEPARTMENTS.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
from employees cross join departments

--合併三個表格
select e.EMPLOYEE_ID, l.CITY, d.DEPARTMENT_NAME
from EMPLOYEES e join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join LOCATIONS l
on d.LOCATION_ID = l.LOCATION_ID

--join加指定條件
select e.EMPLOYEE_ID, e.LAST_NAME, d.LOCATION_ID, d.DEPARTMENT_ID
from employees e join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
and e.MANAGER_ID =149

select e.EMPLOYEE_ID, e.LAST_NAME, d.LOCATION_ID, d.DEPARTMENT_ID
from employees e join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.MANAGER_ID =149

--outer join 用法
select e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e full outer join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID

select e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e left outer join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID

select e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e right outer join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID

--Non Euijoins 用法
select e.LAST_NAME, e.SALARY, j.GRADE_LEVEL 'grade'
from employees e join job_grades j
on e.SALARY between j.LOWEST_SAL and j.HIGHEST_SAL

select e.LAST_NAME, e.SALARY, j.GRADE_LEVEL 'grade'
from employees e join job_grades j
on e.SALARY >= j.LOWEST_SAL
and e.SALARY <= j.HIGHEST_SAL

--self joins 用法
select w.LAST_NAME + ' works for ' + m.LAST_NAME 'Workers & Managers'
from employees w full outer join employees m
on w.MANAGER_ID = m.EMPLOYEE_ID
or w.EMPLOYEE_ID = m.EMPLOYEE_ID

--彙總函數
select AVG( SALARY) 'Average Salary'
from employees

select COUNT(*) 'Staff Number' , COUNT(COMMISSION_PCT) 'Staff earns a commission'
from employees

select COUNT(COMMISSION_PCT) 'AVG', AVG(ISNULL(COMMISSION_PCT, 0))
from employees

select DEPARTMENT_ID, AVG(SALARY) 'AVG', SUM(SALARY) 'SUM'
from employees
group by DEPARTMENT_ID

select DEPARTMENT_ID, JOB_ID, SUM(SALARY) 'Total Salary'
from employees
group by DEPARTMENT_ID, JOB_ID
having SUM(SALARY) > 5000
order by DEPARTMENT_ID


--彙總函數
select DEPARTMENT_ID, JOB_ID, SUM(SALARY) 'Total Salary'
from employees
where SALARY > 5000
group by DEPARTMENT_ID, JOB_ID
having SUM(SALARY) > 5000
order by DEPARTMENT_ID

--子查詢
select LAST_NAME, SALARY
from EMPLOYEES
where SALARY > (select SALARY
                              from EMPLOYEES
							  where LAST_NAME = 'Abel'
                              )

select LAST_NAME
from EMPLOYEES
where EMPLOYEE_ID Not in (
                                                select MANAGER_ID
												from EMPLOYEES
												where MANAGER_ID is not null
)

