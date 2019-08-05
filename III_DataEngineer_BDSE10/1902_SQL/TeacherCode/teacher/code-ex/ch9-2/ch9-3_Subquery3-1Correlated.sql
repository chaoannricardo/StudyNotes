--Correlated Subauery

SELECT last_name,  salary,  department_id
FROM   employees as emp
WHERE  salary  >  ( SELECT AVG ( salary )
                    FROM   employees
                    WHERE  department_id =  emp.department_id
                  ) ;
                  
--§ï¼g join                  
SELECT last_name,  salary,  a.department_id, b.avgs
FROM   employees a join ( select department_Id, AVG(salary) avgs
                         from EMPLOYEES   
                         group by DEPARTMENT_ID
                        )     b 
ON  a.DEPARTMENT_ID = b.DEPARTMENT_ID 
and a.SALARY > b.avgs 
                         