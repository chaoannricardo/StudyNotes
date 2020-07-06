--T_SQL  Lab

--Lab 8進階查詢-子查詢(Subquery)

--1.	Write a query to display the last name and hire date of  any employee in the same
	--department as Zlotkey. Exclude Zlotkey.
    --找出 與員工姓名 last_name 為 Zlotkey 相同部門編號department_id的員工, 列出員工姓名 last_name及就職日期hire_date, 不含 Zlotkey本人
	select LAST_NAME, HIRE_DATE
	from employees
	where DEPARTMENT_ID = (
	   select DEPARTMENT_ID
	   from EMPLOYEES
	   where LAST_NAME = 'Zlotkey'
	)
	and LAST_NAME != 'Zlotkey'

--2.	Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.
   --查出員工薪資salary 大於平均薪資的員工, 列出員工姓名 last_name及薪資salary並依薪資salary
   --從小到大排列

   select LAST_NAME, SALARY
   from employees
   where SALARY > (
      select AVG(SALARY)
	  from EMPLOYEES
   )
   order by SALARY

--3. 	Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a u. Place your SQL statement in a text file named lab8_3.sql. Run your query.
    --找出 與員工姓名 last_name 中含有 ‘u’ 的員工中, 相同部門編號department_id的員工, 列出員工編號employee_id, 員工姓名 last_name

select EMPLOYEE_ID, LAST_NAME
from employees
where DEPARTMENT_ID in (
   select DEPARTMENT_ID
   from EMPLOYEES
   where LAST_NAME like '%u%'
)

--4.	Display the last name and salary of every employee who reports to King.
    --查出 那些員工的主管是King, 列出 員工姓名 last_name, 薪資salary
select LAST_NAME, SALARY
from employees
where MANAGER_ID = (
   select EMPLOYEE_ID
   from EMPLOYEES
   where LAST_NAME = 'King'
)

--5.	Display the department number, last name, and job ID for every employee in the Executive department.
    --查出 那些員工的任職於部門名稱(department_name) Executive, 列出 部門編號department_id, 員工姓名 last_name, 職務代號job_id
	select DEPARTMENT_ID, LAST_NAME, JOB_ID
	from employees
	where DEPARTMENT_ID = (
	   select DEPARTMENT_ID
	   from DEPARTMENTS
	   where DEPARTMENT_NAME = 'Executive'
	)
