--T_SQL  Lab
--Lab 5-2條件查詢及排序
--1 . Create a query to display the employee last name and department number for employee number 176.
--  查詢 員工編號employee_id 為 176 之 姓名last_name及部門編號 department_id
select LAST_NAME, DEPARTMENT_ID
from employees
where EMPLOYEE_ID = 176

--2.	display the last name and salary for all employees whose salary is not in the range of $5,000 and $12,000. Place your SQL statement in a text file named lab5-2_2.sql. 
--   查詢 員工薪資salary 不介於 $5000及 $12000之間之員工姓名last_name及薪資salary
select LAST_NAME, SALARY
from employees
where SALARY not between 5000 and 12000

--3.	Display the last name and department number of all employees in departments 20 and 50 in alphabetical order by name.
--   查詢 員工屬於 部門department_id 屬於 20 或 50之間之員工姓名last_name及部門編號 department_id, 依姓名last_name 排序
select LAST_NAME, DEPARTMENT_ID
from employees
where DEPARTMENT_ID = 20
or DEPARTMENT_ID = 50
order by LAST_NAME

--4. Display the last name and hire date of every employee who was hired in 1994
--查詢 受聘hire_date於 1994年之員工姓名last_name及受聘日期hire_date
select LAST_NAME, HIRE_DATE
from employees
where YEAR( HIRE_DATE) = 1994

--5. Display the last name, salary, and commission for all employees who earn commissions. Sort data in descending order of salary and commissions.
--查詢 有領傭金commission_pct之員工姓名last_name, 薪資salary, 傭金commission_pct, 依薪資salary及傭金commission_pct排序
select LAST_NAME, SALARY, COMMISSION_PCT
from employees
where COMMISSION_PCT is not null
order by SALARY, COMMISSION_PCT
