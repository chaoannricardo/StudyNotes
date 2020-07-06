create table t1
(
 id  int  --- 4byte  * 8bit = 32  =- 2^31
)
go

 insert  into t1  values ( 102)              --ok
 insert  into t1  values ( 2147483647)       --ok
 insert  into t1  values ( 2147483648)       -not ok

/* 訊息 8115，層級 16，狀態 2，行 34
   轉換 expression 到資料類型 int 時發生算術溢位錯誤。 陳述式已經結束。
*/

--欄位別名 (Alias)

SELECT  last_name  "姓名",  salary * 12  "Annual Salary"
FROM    employees;

--Concatenation (串連運算) 
  SELECT    last_name + job_id  AS  "Employees"
  FROM 	    employees;

--Literal Character Strings
SELECT  last_name   +  ' is a'  + job_id   AS  "Employee Details"
FROM    employees;

--v.s

SELECT  last_name   ,  ' is a'  ,  job_id   AS  "Employee Details"
FROM    employees;


--v.s

SELECT  last_name   +  ' 就讀於EEIT103'   
FROM    employees;


--DISTINCT (消除重復列) 
SELECT  DISTINCT   department_id
FROM     employees;


--原理
select * from departments

select  employee_id,last_name,  department_id
from    employees

select  department_id
from    employees

select distinct department_id
from   employees


--dep 8  but  emp  7+null  wh

NULL
10
20
50
60
80
90
110


SELECT  location_id,  country_id , city
FROM     locations

SELECT  DISTINCT  country_id 
FROM     locations

USA
TW
UK
..
SELECT  DISTINCT  country_id, city
FROM     locations

USA LA
USA NY
USA SF
USA SF

