--T_SQL  Lab
--Lab 6進階查詢-合併查詢(Join)
--1. 	Write a query to display the last name, department number, and department name for
	--all employees. 
    --列出 員工姓名last_name, 部門編號department_id, 及 所屬部門名稱 department_name

	select LAST_NAME, e.DEPARTMENT_ID, DEPARTMENT_NAME
	from employees e full outer join departments d
	on e.DEPARTMENT_ID = d.DEPARTMENT_ID

--2.	Create a unique listing of all jobs that are in department 80. Include the location of the department in the output.
  -- 列出部門編號department_id為 80的 員工職務job_id及部門位置location_id, 消去重複值
  select distinct e.DEPARTMENT_ID, JOB_ID, d.LOCATION_ID
  from employees e full outer join DEPARTMENTS d
  on  e.DEPARTMENT_ID = d.DEPARTMENT_ID
  full outer join LOCATIONS l
  on d.LOCATION_ID = l.LOCATION_ID

--3. 	Write a query to display the employee last name, department name, location ID, and city of all employees who earn a commission.
  -- 從員工資料表employees, 部門表departments, 位置表locations 三個表格中找出有領傭金commission_pct之員工姓名last_name, 
  --部門名稱department_name,部門位置location_id, 及部門所在都市city
   select e.LAST_NAME, d.DEPARTMENT_NAME, d.LOCATION_ID, l.CITY
   from employees e full outer join departments d
   on e.DEPARTMENT_ID = d.DEPARTMENT_ID
   full outer join LOCATIONS l
   on d.LOCATION_ID = l.LOCATION_ID
   where e.COMMISSION_PCT > 0

--4.	Display the employee last name and employee number along with their manager’s last name and 	manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
  --  列出 員工姓名last_name 別名 Employee, 員工編號employee_id 別名 Emp#,主管姓名
    --別名 Manager及 主管編號 別名 Mgr#, 存檔成 lab6_4.sql

	select emp.LAST_NAME 'Employee', emp.EMPLOYEE_ID 'Emp#', man.LAST_NAME 'Manager', emp.MANAGER_ID 'Mgr#' 
	from employees emp join employees man 
	on emp.MANAGER_ID = man.EMPLOYEE_ID

--5.	Modify lab6_4.sql to display all employees including King, who has no manager. Order the results by the employee number.  Place your SQL statement in a text file named lab6_5.sql. 
  --  修改 lab6_4.sql 增加列出 員工姓名last_name為 King 且沒有主管的員工

    select distinct emp.LAST_NAME 'Employee', emp.EMPLOYEE_ID 'Emp#', man.LAST_NAME 'Manager', emp.MANAGER_ID 'Mgr#' 
	from employees emp join employees man 
	on emp.MANAGER_ID = man.EMPLOYEE_ID
	or emp.LAST_NAME = 'King'



