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
    
    
 --level 3:  104, 107,206
    SELECT emp.employee_id ,  emp.last_name , emp.manager_id   
    FROM employees emp 
    where emp.manager_id  in (103, 141, 142, 143, 144,174, 176,178, 200,202,205)
    
-- level 4 : none means 104,107,206 are anyone else's manager
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


---無窮迴圈100次後終止

--當 最大的主管 100 若其 manager_id 非 NULL而是另一人之 employee_id ex 107 時,就會無窮迴圈100次後終止

/*

訊息 530，層級 16，狀態 1，行 1
陳述式已結束。最大遞迴 100 已在陳述式完成之前用盡。

*/

update EMPLOYEES set MANAGER_ID = 107 where EMPLOYEE_ID = 100



/* 其它測試資料, 最基層之 107,104 員工互設為對方之 manager_id 或自己為自己之manaegr_id, 不會造成 無窮迴圈
select * from employees where employee_id = 107
update EMPLOYEES set MANAGER_ID = 107 where EMPLOYEE_ID = 107

update EMPLOYEES set MANAGER_ID = 103 where EMPLOYEE_ID = 107
update EMPLOYEES set MANAGER_ID = 103 where EMPLOYEE_ID = 104

*/

WITH Managers AS 
(
    SELECT employee_id, last_name, manager_id , 1 as level
    FROM   employees
    WHERE  employee_id = 100

    UNION ALL

    SELECT emp.employee_id , emp.last_name  , emp.manager_id, level + 1
    FROM employees emp INNER JOIN Managers mgr
    ON emp.manager_id  = mgr.employee_id  
)
SELECT * FROM Managers 
order by level