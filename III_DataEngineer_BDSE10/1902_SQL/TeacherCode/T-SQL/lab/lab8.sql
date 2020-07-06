--T_SQL  Lab

--Lab 8�i���d��-�l�d��(Subquery)

--1.	Write a query to display the last name and hire date of  any employee in the same
	--department as Zlotkey. Exclude Zlotkey.
    --��X �P���u�m�W last_name �� Zlotkey �ۦP�����s��department_id�����u, �C�X���u�m�W last_name�δN¾���hire_date, ���t Zlotkey���H
	select LAST_NAME, HIRE_DATE
	from employees
	where DEPARTMENT_ID = (
	   select DEPARTMENT_ID
	   from EMPLOYEES
	   where LAST_NAME = 'Zlotkey'
	)
	and LAST_NAME != 'Zlotkey'

--2.	Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.
   --�d�X���u�~��salary �j�󥭧��~�ꪺ���u, �C�X���u�m�W last_name���~��salary�è��~��salary
   --�q�p��j�ƦC

   select LAST_NAME, SALARY
   from employees
   where SALARY > (
      select AVG(SALARY)
	  from EMPLOYEES
   )
   order by SALARY

--3. 	Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a u. Place your SQL statement in a text file named lab8_3.sql. Run your query.
    --��X �P���u�m�W last_name ���t�� ��u�� �����u��, �ۦP�����s��department_id�����u, �C�X���u�s��employee_id, ���u�m�W last_name

select EMPLOYEE_ID, LAST_NAME
from employees
where DEPARTMENT_ID in (
   select DEPARTMENT_ID
   from EMPLOYEES
   where LAST_NAME like '%u%'
)

--4.	Display the last name and salary of every employee who reports to King.
    --�d�X ���ǭ��u���D�ެOKing, �C�X ���u�m�W last_name, �~��salary
select LAST_NAME, SALARY
from employees
where MANAGER_ID = (
   select EMPLOYEE_ID
   from EMPLOYEES
   where LAST_NAME = 'King'
)

--5.	Display the department number, last name, and job ID for every employee in the Executive department.
    --�d�X ���ǭ��u����¾�󳡪��W��(department_name) Executive, �C�X �����s��department_id, ���u�m�W last_name, ¾�ȥN��job_id
	select DEPARTMENT_ID, LAST_NAME, JOB_ID
	from employees
	where DEPARTMENT_ID = (
	   select DEPARTMENT_ID
	   from DEPARTMENTS
	   where DEPARTMENT_NAME = 'Executive'
	)
