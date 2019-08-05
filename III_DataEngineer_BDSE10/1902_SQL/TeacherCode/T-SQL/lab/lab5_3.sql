--T_SQL  Lab
--Lab 5-3��C���(Single-Row Functions)
--1  For each employee, display the employee number, last_name, salary, and salary increased by 15% and expressed as a whole number. Label the column New Salary. Place your SQL statement in a text file named  lab53_1.sql.
  -- �d�� ���u�s��employee_id, ���u�m�Wlast_name, �~��salary, �� �~��salary����15%������
   --���O�W�� ��New Salary�� �N���O�s�� lab33_1.sql
   select EMPLOYEE_ID, LAST_NAME, SALARY, (SALARY * 1.15) 'Adjusted Salary'
   from employees

--2 Write a query that displays the employee��s last names with lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees�� last names.
  --��X���u�m�Wlast_name�� J,A,M �}�Y��, �C�X�p�g���u�m�Wlast_name , �� �m�W���� ���O�W, �è̩m�Wlast_name �Ƨ�
  select LOWER( LAST_NAME ) 'Last Name', LEN(LAST_NAME) 'Length'
  from employees
  where LAST_NAME like '[JAM]%'
  order by LAST_NAME

--3.	For each employee, display the employee��s last name, and calculate the number of months between  today and the date the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. Round the number of months up to the closest whole number.
  -- �C�X���u�m�Wlast_name �δN¾���(�{�b��� ��h ��¾��hire_date), ���O�W�� MONTHS_WORKED, �è̴N¾��� �Ƨ�
  select LAST_NAME, DATEDIFF(MONTH, HIRE_DATE, GETDATE()) 'MONTHS_WORKED'
  from employees
  order by MONTHS_WORKED

  
--4.	Create a query that displays the employees�� last names and commission amounts. If an employee does not earn commission, put ��No Commission.�� Label the column COMM.
  -- �C�X���u�m�Wlast_name �ζĪ�commission_pct, �Y�S���Ī�commission_pct�����u, ��ܬ�
 --��No Commission�� ���O�W�� COMM
 select LAST_NAME, COMMISSION_PCT, 
 case 
 when COMMISSION_PCT is null then 'No Commission'
 else CONVERT(varchar(50), COMMISSION_PCT) 
 end "COMM"
 from employees

--5.	Using the CASE function, write a query that displays the grade of all employees based on the value of the
--column JOB_ID, as per the following data:
--�ϥ� CASE��ƨ̭��u JOB_ID ���Ŭ��U�C����, ��ܭ��u�m�Wlast_name, ¾��job_id�Τ���

--	Job				Grade	
--	AD_PRES			A	
--	ST_MAN			B	
--	IT_PROG			C	
--	SA_REP			    D	
--	ST_CLERK			E	
--	None of the above		0	

select LAST_NAME, JOB_ID, 
case JOB_ID
when 'AD_PRES' then  'A'
when 'ST_MAN' then 'B'
when 'IT_PROG' then 'C'
when 'SA_REP' then 'D'
when 'ST_CLERK' then 'E'
else '0'
end '����'
from employees 



