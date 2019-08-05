--改寫成1 Subquery

select * 
from  ( 
        SELECT department_id deptno, SUM(salary)  totalpay
        FROM   employees
        GROUP  BY  department_id    
      ) payroll
where totalpay  =  (
                        SELECT  top 1 (SUM(salary) )
                        FROM   employees
                        GROUP  BY  department_id   
                        order by SUM(salary) desc    
                   )
                   

--分解求 max
SELECT  top 1 (SUM(salary) )
        FROM   employees
        GROUP  BY  department_id   
        order by SUM(salary) desc                  
                   

--改寫成2 Subquery-------------------------------------------------

 select department_id,SUM(salary) 
 from employees 
 group by department_id
 having sum(salary)=                     
                   (select max(bb.aa)                 
                     from 
                     	(select department_id, SUM(salary) aa
	                 	from employees
	                 	group by department_id ) bb
                   )
	