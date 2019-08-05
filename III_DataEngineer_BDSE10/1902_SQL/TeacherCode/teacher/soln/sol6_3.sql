SELECT e.last_name, d.department_name, d.location_id, l.city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL



--method2 因 178 Grant沒部門,所以上述雖有四人領傭金,但只顯示三筆
SELECT e.employee_id, e.last_name,  e.commission_pct, d.department_name, d.location_id, l.city
FROM employees e  LEFT OUTER  JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL

--且須用 WHERE 不可用 AND 
