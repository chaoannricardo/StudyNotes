--1排序函數 (排名函數)
 

--ROW_NUMBER 函數, 依 員工 薪資 salary 排行, 從 高到低
SELECT  last_name,  SALARY   
FROM    employees
ORDER BY salary  DESC

SELECT  last_name,  SALARY ,  
        ROW_NUMBER() OVER  ( ORDER BY salary  DESC)
FROM    employees

--RANK 函數, 依 員工 薪資 salary 排行, 從 高到低
SELECT  last_name,  SALARY ,  
        RANK() OVER  ( ORDER BY salary  DESC)
FROM    employees

--DENSE_RANK 函數, 依 員工 薪資 salary 排行, 從 高到低
SELECT  last_name,  SALARY ,  
        DENSE_RANK() OVER  ( ORDER BY salary  DESC)
FROM    employees


--2a複製表格結構+資料 - 臨時資料表

SELECT employee_id id,  last_name name ,  salary,  job_id 
INTO   #tmp_sales_reps
FROM   employees
WHERE   job_id  LIKE  '%REP%' ;

--2b 在同一session 查詢

select * from #tmp_sales_reps

--2c但在另一session 查詢不到

select * from #tmp_sales_reps


--3a複製表格結構+資料

SELECT employee_id id,  last_name name ,  salary,  job_id 
INTO   sales_reps2
FROM   employees;

--3b查詢

select * from sales_reps2

--4a複製表格結構而以,不含資料, 利用 1 = 2 的小技巧

SELECT employee_id id,  last_name name ,  salary,  job_id 
INTO   sales_reps
FROM   employees
WHERE  1=2;

--4b從查詢中新增資料

INSERT  INTO  sales_reps ( id,  name,  salary,  job_id  )
SELECT  employee_id,  last_name,  salary,  job_id 
FROM    employees
WHERE   job_id  LIKE  '%REP%' ;

--4c查詢

select * from sales_reps

