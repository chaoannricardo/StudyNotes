--T_SQL  Lab
--Lab 5-2����d�ߤαƧ�
--1 . Create a query to display the employee last name and department number for employee number 176.
--  �d�� ���u�s��employee_id �� 176 �� �m�Wlast_name�γ����s�� department_id
select LAST_NAME, DEPARTMENT_ID
from employees
where EMPLOYEE_ID = 176

--2.	display the last name and salary for all employees whose salary is not in the range of $5,000 and $12,000. Place your SQL statement in a text file named lab5-2_2.sql. 
--   �d�� ���u�~��salary ������ $5000�� $12000���������u�m�Wlast_name���~��salary
select LAST_NAME, SALARY
from employees
where SALARY not between 5000 and 12000

--3.	Display the last name and department number of all employees in departments 20 and 50 in alphabetical order by name.
--   �d�� ���u�ݩ� ����department_id �ݩ� 20 �� 50���������u�m�Wlast_name�γ����s�� department_id, �̩m�Wlast_name �Ƨ�
select LAST_NAME, DEPARTMENT_ID
from employees
where DEPARTMENT_ID = 20
or DEPARTMENT_ID = 50
order by LAST_NAME

--4. Display the last name and hire date of every employee who was hired in 1994
--�d�� ���uhire_date�� 1994�~�����u�m�Wlast_name�Ψ��u���hire_date
select LAST_NAME, HIRE_DATE
from employees
where YEAR( HIRE_DATE) = 1994

--5. Display the last name, salary, and commission for all employees who earn commissions. Sort data in descending order of salary and commissions.
--�d�� ����Ī�commission_pct�����u�m�Wlast_name, �~��salary, �Ī�commission_pct, ���~��salary�ζĪ�commission_pct�Ƨ�
select LAST_NAME, SALARY, COMMISSION_PCT
from employees
where COMMISSION_PCT is not null
order by SALARY, COMMISSION_PCT
