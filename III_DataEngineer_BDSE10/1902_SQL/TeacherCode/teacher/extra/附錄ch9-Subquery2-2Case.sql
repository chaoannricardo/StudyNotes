--Scarlar Subquery 位置代號為1800 的部門顯示為 Canada 否則 USA (也可用JOIN 改寫)
--於 SELECT 句子中的子查詢,若回傳超過一筆時(ex location_id = 1700 ), 會出現錯誤

use DB01
go
               
			   
			   SELECT *
                FROM   departments   
SELECT employee_id, last_name, department_id ,
                   (CASE WHEN department_id  =
                                               (SELECT department_id 
                                                FROM   departments
                                                WHERE  location_id = 1800)
                          THEN  'Canada'  
                    ELSE  'USA'  
                    END)  location
FROM   employees;


--或改寫 JOIN
--於 SELECT 句子中改以 欄位值 取代子查詢, 回傳超過一筆時(ex location_id = 1700 ), 就不會出現錯誤

SELECT employee_id, last_name, (CASE WHEN location_id = 1800 THEN 'Canada'
                                ELSE 'USA' END
                               )
FROM   EMPLOYEES e join DEPARTMENTS d
ON     e.department_id = d.department_id 



SELECT employee_id, last_name,  e.DEPARTMENT_ID , d.LOCATION_ID
FROM   EMPLOYEES e join DEPARTMENTS d
ON     e.department_id = d.department_id 

