--T_SQL  Lab
--Lab 5-3單列函數(Single-Row Functions)
--1  For each employee, display the employee number, last_name, salary, and salary increased by 15% and expressed as a whole number. Label the column New Salary. Place your SQL statement in a text file named  lab53_1.sql.
  -- 查詢 員工編號employee_id, 員工姓名last_name, 薪資salary, 及 薪資salary提升15%後取整數
   --取別名為 “New Salary” 將指令存成 lab33_1.sql
   select EMPLOYEE_ID, LAST_NAME, SALARY, (SALARY * 1.15) 'Adjusted Salary'
   from employees

--2 Write a query that displays the employee’s last names with lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees’ last names.
  --找出員工姓名last_name為 J,A,M 開頭者, 列出小寫員工姓名last_name , 及 姓名長度 取別名, 並依姓名last_name 排序
  select LOWER( LAST_NAME ) 'Last Name', LEN(LAST_NAME) 'Length'
  from employees
  where LAST_NAME like '[JAM]%'
  order by LAST_NAME

--3.	For each employee, display the employee’s last name, and calculate the number of months between  today and the date the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. Round the number of months up to the closest whole number.
  -- 列出員工姓名last_name 及就職月數(現在日期 減去 到職日hire_date), 取別名為 MONTHS_WORKED, 並依就職月數 排序
  select LAST_NAME, DATEDIFF(MONTH, HIRE_DATE, GETDATE()) 'MONTHS_WORKED'
  from employees
  order by MONTHS_WORKED

  
--4.	Create a query that displays the employees’ last names and commission amounts. If an employee does not earn commission, put “No Commission.” Label the column COMM.
  -- 列出員工姓名last_name 及傭金commission_pct, 若沒有傭金commission_pct之員工, 顯示為
 --“No Commission” 取別名為 COMM
 select LAST_NAME, COMMISSION_PCT, 
 case 
 when COMMISSION_PCT is null then 'No Commission'
 else CONVERT(varchar(50), COMMISSION_PCT) 
 end "COMM"
 from employees

--5.	Using the CASE function, write a query that displays the grade of all employees based on the value of the
--column JOB_ID, as per the following data:
--使用 CASE函數依員工 JOB_ID 分級為下列等級, 顯示員工姓名last_name, 職務job_id及分級

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
end '分級'
from employees 



