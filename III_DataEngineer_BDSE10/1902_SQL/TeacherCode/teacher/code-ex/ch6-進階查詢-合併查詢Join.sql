use DB01
go

--原始資料
select employee_id, last_name, department_id from EMPLOYEES 
select department_id, DEPARTMENT_NAME  from   DEPARTMENTS 

--兩表格交叉相乘, 即 Cartesian Product

select *
from EMPLOYEES CROSS JOIN  DEPARTMENTS 

--Equal join
SELECT   employee_id,  last_name,  
         location_id,     departments.department_id, department_name
FROM      employees      JOIN   departments   
ON       employees.department_id  = departments.department_id ;



--Table Alias

SELECT e.employee_id,  e.last_name,  
       d.location_id,  d.department_id
FROM   employees   e   JOIN  departments   d
ON     e.department_id  =  d.department_id 
  

--合併條件外, 用 AND 或  WHERE 過濾額外的條件

SELECT   e.employee_id,  e.last_name, e.MANAGER_ID,  
         d.location_id,  d.department_id
FROM     employees   e   JOIN  departments   d
ON       e.department_id  =  d.department_id 
WHERE e.MANAGER_ID = 149
  
--或 AND
SELECT   e.employee_id,  e.last_name, e.MANAGER_ID,  
         d.location_id,  d.department_id
FROM     employees   e   JOIN  departments   d
ON       e.department_id  =  d.department_id 
AND      e.MANAGER_ID = 149
  
--原始資料
select employee_id, last_name, department_id from EMPLOYEES 
select department_id, DEPARTMENT_NAME ,location_id from   DEPARTMENTS 
select location_id, city from locations

--合併三個表格
SELECT  employee_id, last_name, department_name, city
FROM    employees  e 
JOIN    departments  d
ON      d.department_id = e.department_id 
JOIN    locations  l
ON      d.location_id = l.location_id;

--Non-equal JOIN

SELECT  e.last_name,  e.salary,  j.grade_level, j.LOWEST_SAL ,j.HIGHEST_SAL 
FROM    employees  e  JOIN   job_grades  j
ON      e.salary  BETWEEN  j.lowest_sal   AND   j.highest_sal;


-- Left outer join with tablename prefix

SELECT   employees.employee_id,  employees.last_name,  
         location_id, EMPLOYEES.DEPARTMENT_ID,
         departments.department_id, department_name
FROM     employees   LEFT OUTER   JOIN   departments   
ON       employees.department_id  =  departments.department_id ;

-- RIGHT outer join with tablename prefix

SELECT   employees.employee_id,  employees.last_name,  
         location_id, EMPLOYEES.DEPARTMENT_ID,
         departments.department_id, department_name
FROM     employees   RIGHT OUTER   JOIN   departments   
ON       employees.department_id  =  departments.department_id ;

-- FULL outer join with tablename prefix

SELECT   employees.employee_id,  employees.last_name,  
         location_id, EMPLOYEES.DEPARTMENT_ID,
         departments.department_id, department_name
FROM     employees   FULL OUTER   JOIN   departments   
ON       employees.department_id  =  departments.department_id ;


--Self join

SELECT   worker.last_name  +  ' works for '   +  manager.last_name
FROM      employees  worker  JOIN  employees  manager
ON        worker.manager_id  =  manager.employee_id ;

