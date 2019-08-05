use DB01
go

--查詢 department_id = 90 之員工

SELECT  employee_id,  last_name,   job_id,   department_id
FROM     employees
WHERE  department_id  =  90;

--查詢 last_name 為 Whalen 之員工

SELECT employee_id,  last_name,   job_id,   department_id
FROM   employees
WHERE  last_name = 'Whalen' ;

--查詢 hire_date 為 1994-06-07 之員工

SELECT employee_id,  last_name,   job_id,   hire_date
FROM   employees
WHERE  hire_date = '1994-06-07'

--查詢 salary 介於 2500 及 3500 之員工 (一)

SELECT  last_name,  salary
FROM     employees
WHERE  salary  >= 2500  AND  salary <=  3500;

--查詢 salary 介於 2500 及 3500 之員工 (二)

SELECT  employee_id,  last_name,   job_id,   salary
FROM     employees
WHERE  salary  BETWEEN  2500  AND  3500;  --先小的值,再大的值

--查詢 manager_id 屬於 100, 101, 201 之一的員工

SELECT  employee_id,  last_name,  salary,  manager_id
FROM     employees
WHERE  manager_id  IN  ( 100,  101,  201 );

--以 OR 改寫

SELECT  employee_id,  last_name,  salary,  manager_id
FROM     employees
WHERE  manager_id = 100 OR
       manager_id = 101 OR
       manager_id = 201
       
--查詢 first_name 為 S 開頭 之員工

SELECT	  first_name
FROM 	  employees
WHERE	  first_name  LIKE  'S%';

--請問答案為何跟上述結果不一樣
SELECT	  last_name
FROM 	  employees
WHERE	  first_name  LIKE  'S%';

--查詢  manager_id 是  NULL 之員工
SELECT  last_name,  manager_id
FROM     employees
WHERE   manager_id  IS  NULL;

--查詢  manager_id 不是  NULL 之員工
SELECT  last_name,  manager_id
FROM     employees
WHERE   manager_id  IS   NOT  NULL

--AND 須兩個條件都成立 (TRUE)

SELECT employee_id,  last_name,  job_id,  salary
FROM   employees
WHERE  salary  >= 10000
AND    job_id  LIKE  '%MAN%';

--OR 只須任一條件成立 (TRUE)
SELECT employee_id,  last_name,  job_id,  salary
FROM   employees
WHERE  salary  >= 10000
OR     job_id  LIKE  '%MAN%';

--Job_id  AND salary 優先運算

SELECT  last_name,  job_id,  salary
FROM    employees
WHERE   job_id  =  'SA_REP'
OR      job_id  =  'AD_PRES'
AND     salary  >  15000;

--利用括號改變運算順序
SELECT  employee_id,  last_name,  job_id,  salary
FROM     employees
WHERE  ( job_id = 'SA_REP'
OR            job_id = 'AD_PRES' )
AND         salary > 15000;

--排序SORT
--員工資料以 salary 排序 遞增

SELECT   last_name,  job_id,  department_id,  salary
FROM     employees
ORDER   BY  salary ;


--員工資料以 salary 排序 遞減

SELECT   last_name,  job_id,  department_id,  salary
FROM     employees
ORDER   BY  salary  DESC;

--多欄位排序

SELECT  last_name,  department_id,  salary
FROM     employees
ORDER   BY  department_id,  salary  DESC;

--TOP (N) - 查詢排行榜前幾名或後幾名, 括號可省略
select  TOP  ( 2 )  salary , employee_id, last_name
from    employees 
order by  salary  desc

--WITH  TIES - 查詢排行榜前幾名中 同名次亦列入
select  TOP  2  WITH  TIES  salary , employee_id, last_name
from    employees 
order by salary desc

