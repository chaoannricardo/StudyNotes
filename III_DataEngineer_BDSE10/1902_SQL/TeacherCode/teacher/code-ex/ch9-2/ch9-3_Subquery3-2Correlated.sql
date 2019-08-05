--Scarlar Subquery 列出部門名稱及該部門最高薪資 (也可用JOIN 改寫)

use DB01
go
                  

SELECT   d.department_name  , (SELECT  max(salary)
                               FROM    employees  e
                               WHERE   e.department_id  = d.department_id ) 
FROM     departments  d


--JOIN 改寫
SELECT  d.department_name  ,  maxsal
FROM    departments  d JOIN (SELECT  department_id, max(salary) maxsal
                             FROM     employees 
                             GROUP BY department_id 
                             )  e
ON e.department_id  = d.department_id


--JOIN 改寫2 ch45

select  department_name, max(salary)
from   employees JOIN  departments
ON     employees.DEPARTMENT_ID  = departments.DEPARTMENT_ID
group by  department_name