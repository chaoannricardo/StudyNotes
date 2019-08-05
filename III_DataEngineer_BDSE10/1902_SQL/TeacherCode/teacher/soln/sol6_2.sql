SELECT DISTINCT job_id, location_id
FROM employees  JOIN departments
ON employees.department_id = departments.department_id
WHERE employees.department_id = 80
