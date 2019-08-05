SELECT   employee_id, last_name, salary,               
         ROUND(salary * 1.15, 0) 'New Salary'      
FROM     employees