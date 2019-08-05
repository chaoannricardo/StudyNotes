-- 誰的薪水是該部門最低

select last_name, department_id, salary
from  employees e
where  salary  =  (  select  MIN(salary)
                     from  employees
					 where department_id = e.department_id
					)

--method 2
select last_name, e.department_id, salary, g.mins
from  employees e JOIN (  select department_id, MIN(salary) mins
                          from  employees
                          group by department_id) g
ON   e.department_id =  g.department_id  and
     e.salary  =  g.mins


NULL	7000
10	4400
20	6000
50	2500
60	4200
80	8600
90	17000
110	8300


  select department_id, MIN(salary)
  from  employees
   group by department_id
