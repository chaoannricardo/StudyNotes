--T_SQL  Lab

--Lab 5-1基本查詢
--1 下列語法能成功執行嗎 ?

 SELECT last_name, job_id, salary AS Sal
 FROM   employees;

	--True/False

--2	下列語法有四個錯誤 您能找出來嗎? 

SELECT    employee_id, last_name, SALARY * 12 'ANNUAL SALARY'
FROM      employees;

--3  Create a query to display the last name, job code, hire date, and employee number 
--for each employee, with employee number appearing first. Provide an alias STARTDATE 
--for the HIRE_DATE column. Save your SQL statement to a file named lab1_3.sql.
  -- 建立一個查詢 顯示 員工 last name, job code, hire date, 及 employee number 
   --員工編號顯示於最前面, HIRE_DATE欄位別名 以 STARTDATE顯示 指令存成lab1_3.sql
select LAST_NAME, JOB_ID, HIRE_DATE 'STARTDATE', EMPLOYEE_ID
from employees

--4.	Create a query to display unique job codes from the EMPLOYEES table.
  --  顯示 EMPLOYEES表格 之 JOB_ID , 相同值只顯示一次
  select distinct JOB_ID
  from employees

--5.	Display the last name concatenated with the job ID, separated by a comma and space, and name the column Employee and Title.
  --      顯示 EMPLOYEES之 last name 與 job ID 串聯成一個新的字串, 中間以 ‘逗後’間隔,
    --欄位標示為 ‘Employee and Title.’
	select LAST_NAME + ', ' + JOB_ID 'Employee and Title.'
	from employees


