--COMPUTE 1

SELECT  department_id,  employee_id , salary
FROM    employees
COMPUTE SUM ( salary );


--COMPUTE 2
SELECT  department_id,  employee_id ,salary
FROM    employees
ORDER   BY  department_id
COMPUTE SUM ( salary )  BY  department_id
COMPUTE SUM ( salary );