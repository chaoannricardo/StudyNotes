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

--����

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


--�ɥR ���h���Y level �H�Ů� �Y��

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


---�L�a�j��100����פ�

--�� �̤j���D�� 100 �Y�� manager_id �D NULL�ӬO�t�@�H�� employee_id ex 107 ��,�N�|�L�a�j��100����פ�

/*

�T�� 530�A�h�� 16�A���A 1�A�� 1
���z���w�����C�̤j���j 100 �w�b���z���������e�κɡC

*/

update EMPLOYEES set MANAGER_ID = 107 where EMPLOYEE_ID = 100



/* �䥦���ո��, �̰�h�� 107,104 ���u���]����褧 manager_id �Φۤv���ۤv��manaegr_id, ���|�y�� �L�a�j��
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