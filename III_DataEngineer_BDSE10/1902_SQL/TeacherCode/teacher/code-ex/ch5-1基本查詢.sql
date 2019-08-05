use DB01
go

--ch5-1 基本查詢

--查詢所有欄位 
SELECT   *
  FROM      departments


--查詢部份欄位 
SELECT   department_id, location_id
FROM     departments

--補充 sp_columns  查詢表格的所有欄位名稱/資料型態如  :  
EXEC  sp_columns  departments

--數學運算
SELECT  last_name,  salary,  12 * salary + 100
FROM    employees;

SELECT  last_name,  salary,  12 *  ( salary + 100 )
FROM    employees;
 

--NULL  Value (空值) 
  SELECT  last_name,  job_id,  salary,  commission_pct
  FROM    employees;

--NULL  Value 數學運算
  SELECT  last_name,  12 * salary * commission_pct
  FROM    employees;

--欄位別名 (Alias)
SELECT  last_name  AS  name,  commission_pct   comm
FROM    employees;

SELECT  last_name  "Name",  salary * 12  "Annual Salary"
FROM    employees;

--Concatenation (串連運算) 
  SELECT    last_name  +  job_id  AS  "Employees"
  FROM 	    employees;

--Literal Character Strings
SELECT  last_name   +  ' is a'  +  job_id   AS  "Employee Details"
FROM    employees;

--DISTINCT (消除重復列) 
SELECT  DISTINCT   department_id
FROM     employees;
