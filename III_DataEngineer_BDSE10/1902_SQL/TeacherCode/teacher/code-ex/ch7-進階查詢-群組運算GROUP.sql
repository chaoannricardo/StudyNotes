use DB01
go


--原始資料
  select employee_id, last_name, department_id,salary, commission_pct from EMPLOYEES 

--計算 員工 salary 平均, 總合, 最高, 最低

  SELECT  AVG (salary)
  FROM    employees;

  SELECT  AVG (salary), MAX(salary), MIN(salary), SUM(salary)
  FROM    employees;

--錯誤示範, 所有資料當做一個彙總輸出, 不可有個別欄位 

  SELECT  last_name, AVG(salary),  MAX(salary), MIN(salary), SUM(salary)
  FROM    employees;

--count
  SELECT  COUNT (*),  COUNT(commission_pct),  COUNT(last_name)
  FROM    employees;


--計算 平均  commission_pct
  SELECT AVG(commission_pct),  AVG(ISNULL(commission_pct,0)),
         SUM(commission_pct), 
         SUM(commission_pct)/count(commission_pct),
         SUM(commission_pct) / 20
  FROM   employees;
  
--計算 各部門 平均 及 總合 salary

  SELECT  department_id, AVG(salary), SUM(salary)
  FROM    employees
  GROUP   BY  department_id;

--group without column name
  SELECT  AVG(salary), SUM(salary), COUNT(*)
  FROM    employees
  GROUP   BY  department_id;
  
  
 --多欄位分群
  SELECT   department_id, job_id,  AVG (salary), SUM (salary),COUNT(*)
  FROM     employees
  GROUP    BY  department_id, job_id
  order by department_id, job_id;


--錯誤示範, WHERE 不可以用來過濾分群資料

  SELECT department_id,  AVG(salary)
  FROM   employees
  WHERE  AVG (salary) >  8000
  GROUP  BY  department_id;
  
  --before fileter
  SELECT  department_id, AVG (salary)
  FROM    employees
  GROUP   BY  department_id;

--HAVING filter
 SELECT  department_id, AVG(salary)
 FROM    employees
 GROUP   BY  department_id
 HAVING  AVG ( salary ) >  8000
 
 --WHERE and HAVING 並用
 SELECT  department_id,   AVG (salary)
 FROM    employees
 WHERE   DEPARTMENT_ID >= 50
 GROUP   BY  department_id
 HAVING  AVG (salary) >  8000
 

--ch8 進階語法 group 小計

  SELECT    department_id, SUM( salary), COUNT(*)
  FROM      employees
  GROUP BY  ROLLUP( department_id )
  ORDER BY  department_id;
