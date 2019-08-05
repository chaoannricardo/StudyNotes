WITH 
dept_costs  AS (
                 SELECT d.department_name, SUM(e.salary) AS dept_total
                 FROM   employees e JOIN departments d
                 ON     e.department_id = d.department_id
                 GROUP  BY  d.department_name ),
avg_cost    AS (
                 SELECT SUM(dept_total)/COUNT(*) AS dept_avg
                 FROM   dept_costs)
SELECT  * 
FROM   dept_costs 
WHERE  dept_total  > (SELECT dept_avg 
                      FROM   avg_cost )
ORDER  BY  department_name ;



--©Î
WITH 
dept_costs  AS (
                 SELECT  d.department_name, SUM(e.salary) AS dept_total
                 FROM     employees e, departments d
                 WHERE   e.department_id = d.department_id
                 GROUP  BY  d.department_name ),
avg_cost    AS (
                 SELECT SUM(dept_total)/COUNT(*) AS dept_avg
                 FROM   dept_costs)
SELECT * 
FROM   dept_costs 
WHERE  dept_total  >  (SELECT dept_avg 
                       FROM   avg_cost )
ORDER  BY  department_name ;


--§ï¼g1 Subquery

SELECT d.department_name, SUM(e.salary) AS dept_total
FROM   employees e JOIN departments d
ON     e.department_id = d.department_id
GROUP  BY  d.department_name 
HAVING  SUM(e.salary)   > ( SELECT sum(salary) / (select count(distinct DEPARTMENT_ID) from EMPLOYEES)
                            FROM   employees )
ORDER  BY  department_name ;


--§ï¼g2 Subquery


SELECT d.department_name, SUM(e.salary) AS dept_total
FROM   employees e JOIN departments d
ON     e.department_id = d.department_id
GROUP  BY  d.department_name 
HAVING  SUM(e.salary)   > ( select avg(g_sum)
                            from (SELECT sum(salary) g_sum
                                  FROM   employees
                                  group by department_id)group_sum
                          )                              
ORDER  BY  department_name ;