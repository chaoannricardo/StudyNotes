SELECT e.last_name, d.department_name, d.location_id, l.city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL



--method2 �] 178 Grant�S����,�ҥH�W�z�����|�H��Ī�,���u��ܤT��
SELECT e.employee_id, e.last_name,  e.commission_pct, d.department_name, d.location_id, l.city
FROM employees e  LEFT OUTER  JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL

--�B���� WHERE ���i�� AND 
