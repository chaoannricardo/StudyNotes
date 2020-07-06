--T_SQL  Lab
--Lab 6�i���d��-�X�֬d��(Join)
--1. 	Write a query to display the last name, department number, and department name for
	--all employees. 
    --�C�X ���u�m�Wlast_name, �����s��department_id, �� ���ݳ����W�� department_name

	select LAST_NAME, e.DEPARTMENT_ID, DEPARTMENT_NAME
	from employees e full outer join departments d
	on e.DEPARTMENT_ID = d.DEPARTMENT_ID

--2.	Create a unique listing of all jobs that are in department 80. Include the location of the department in the output.
  -- �C�X�����s��department_id�� 80�� ���u¾��job_id�γ�����mlocation_id, ���h���ƭ�
  select distinct e.DEPARTMENT_ID, JOB_ID, d.LOCATION_ID
  from employees e full outer join DEPARTMENTS d
  on  e.DEPARTMENT_ID = d.DEPARTMENT_ID
  full outer join LOCATIONS l
  on d.LOCATION_ID = l.LOCATION_ID

--3. 	Write a query to display the employee last name, department name, location ID, and city of all employees who earn a commission.
  -- �q���u��ƪ�employees, ������departments, ��m��locations �T�Ӫ�椤��X����Ī�commission_pct�����u�m�Wlast_name, 
  --�����W��department_name,������mlocation_id, �γ����Ҧb����city
   select e.LAST_NAME, d.DEPARTMENT_NAME, d.LOCATION_ID, l.CITY
   from employees e full outer join departments d
   on e.DEPARTMENT_ID = d.DEPARTMENT_ID
   full outer join LOCATIONS l
   on d.LOCATION_ID = l.LOCATION_ID
   where e.COMMISSION_PCT > 0

--4.	Display the employee last name and employee number along with their manager��s last name and 	manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
  --  �C�X ���u�m�Wlast_name �O�W Employee, ���u�s��employee_id �O�W Emp#,�D�ީm�W
    --�O�W Manager�� �D�޽s�� �O�W Mgr#, �s�ɦ� lab6_4.sql

	select emp.LAST_NAME 'Employee', emp.EMPLOYEE_ID 'Emp#', man.LAST_NAME 'Manager', emp.MANAGER_ID 'Mgr#' 
	from employees emp join employees man 
	on emp.MANAGER_ID = man.EMPLOYEE_ID

--5.	Modify lab6_4.sql to display all employees including King, who has no manager. Order the results by the employee number.  Place your SQL statement in a text file named lab6_5.sql. 
  --  �ק� lab6_4.sql �W�[�C�X ���u�m�Wlast_name�� King �B�S���D�ު����u

    select distinct emp.LAST_NAME 'Employee', emp.EMPLOYEE_ID 'Emp#', man.LAST_NAME 'Manager', emp.MANAGER_ID 'Mgr#' 
	from employees emp join employees man 
	on emp.MANAGER_ID = man.EMPLOYEE_ID
	or emp.LAST_NAME = 'King'



