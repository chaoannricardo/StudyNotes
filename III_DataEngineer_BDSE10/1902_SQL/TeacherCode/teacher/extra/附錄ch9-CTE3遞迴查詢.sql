--CTE
use DB01
go

WITH Managers AS 
(
    SELECT employee_id, last_name, manager_id , 1 as level
    FROM   employees
    WHERE  manager_id IS NULL

    UNION ALL

    SELECT emp.employee_id , emp.last_name  , emp.manager_id, level + 1
    FROM employees emp INNER JOIN Managers mgr
    ON emp.manager_id  = mgr.employee_id  
)
SELECT * FROM Managers 
order by level

--驗證

--level 1: 100
    SELECT employee_id, last_name, manager_id , 1 as level
    FROM   employees
    WHERE  manager_id IS NULL 
    
 --level 2 : 101 , 102, 124, 149, 201
   SELECT emp.employee_id ,  emp.last_name , emp.manager_id   
    FROM employees emp 
    where emp.manager_id  = 100
    
 --level 3:  103, 141, 142, 143, 144,174, 176,178, 200,202,205
    SELECT emp.employee_id ,  emp.last_name , emp.manager_id   
    FROM employees emp 
    where emp.manager_id  in (101 , 102, 124, 149, 201)
    
    
 --level 4:  104, 107,206
    SELECT emp.employee_id ,  emp.last_name , emp.manager_id   
    FROM employees emp 
    where emp.manager_id  in (103, 141, 142, 143, 144,174, 176,178, 200,202,205)
    
-- level 5 : none means 104,107,206 are anyone else's manager
    SELECT emp.employee_id ,  emp.last_name , emp.manager_id   
    FROM employees emp 
    where emp.manager_id  in (104,107,206)


--補充 階層關係 level 以空格 縮排

WITH Managers AS 
(
    SELECT employee_id, last_name, manager_id , 1 as level
    FROM   employees
    WHERE  manager_id IS NULL

    UNION ALL

    SELECT emp.employee_id , emp.last_name  ,
           emp.manager_id, level + 1
    FROM employees emp INNER JOIN Managers mgr
    ON emp.manager_id  = mgr.employee_id  
)
SELECT employee_id, replicate(' ' ,(level-1)*2  ) + last_name, 
manager_id ,  level       
FROM Managers 
order by level
