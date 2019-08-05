--Scarlar Subquery 列出原工姓名,薪資及總平均薪資

use db01
go
                  
SELECT employee_id, last_name, SALARY, (SELECT AVG(salary) 
                                        FROM   employees ) as AVGS
FROM   employees

go


--改寫
SELECT employee_id, last_name, SALARY, avgs                                           
FROM   employees e  CROSS JOIN   ( SELECT AVG(salary)  avgs
                                   FROM   employees
                                 )   b
go
 

