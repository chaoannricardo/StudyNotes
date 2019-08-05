--Exists

SELECT employee_id,  last_name,  job_id,  department_id
FROM   employees  emp
WHERE  EXISTS   ( SELECT  *
                  FROM  employees
                  where manager_id = emp.employee_id 
                );

--�� IN ��g
SELECT employee_id,  last_name,  job_id,  department_id
FROM   employees  emp
WHERE  employee_id in   ( SELECT  distinct manager_id 
                          FROM  employees
                        );

