--T_SQL  Lab

--Lab 5-1�򥻬d��
--1 �U�C�y�k�ন�\����� ?

 SELECT last_name, job_id, salary AS Sal
 FROM   employees;

	--True/False

--2	�U�C�y�k���|�ӿ��~ �z���X�Ӷ�? 

SELECT    employee_id, last_name, SALARY * 12 'ANNUAL SALARY'
FROM      employees;

--3  Create a query to display the last name, job code, hire date, and employee number 
--for each employee, with employee number appearing first. Provide an alias STARTDATE 
--for the HIRE_DATE column. Save your SQL statement to a file named lab1_3.sql.
  -- �إߤ@�Ӭd�� ��� ���u last name, job code, hire date, �� employee number 
   --���u�s����ܩ�̫e��, HIRE_DATE���O�W �H STARTDATE��� ���O�s��lab1_3.sql
select LAST_NAME, JOB_ID, HIRE_DATE 'STARTDATE', EMPLOYEE_ID
from employees

--4.	Create a query to display unique job codes from the EMPLOYEES table.
  --  ��� EMPLOYEES��� �� JOB_ID , �ۦP�ȥu��ܤ@��
  select distinct JOB_ID
  from employees

--5.	Display the last name concatenated with the job ID, separated by a comma and space, and name the column Employee and Title.
  --      ��� EMPLOYEES�� last name �P job ID ���p���@�ӷs���r��, �����H ���r�ᡦ���j,
    --���Хܬ� ��Employee and Title.��
	select LAST_NAME + ', ' + JOB_ID 'Employee and Title.'
	from employees


