SELECT * 
INTO  copy_emp
FROM  employees
WHERE 1=2;

select * from copy_emp;
select * from employees;

MERGE INTO copy_emp c
     USING employees e
     ON (c.employee_id = e.employee_id)
   WHEN MATCHED THEN
     UPDATE SET
       c.first_name     = e.first_name,
       c.last_name      = e.last_name,
       c.email          = e.email,
       c.phone_number   = e.phone_number,
       c.hire_date      = e.hire_date,
       c.job_id         = e.job_id,
       c.salary         = e.salary,
       c.commission_pct = e.commission_pct,
       c.manager_id     = e.manager_id,
       c.department_id  = e.department_id
   WHEN NOT MATCHED THEN
     INSERT VALUES(e.employee_id, e.first_name, e.last_name,
          e.email, e.phone_number, e.hire_date, e.job_id,
          e.salary, e.commission_pct, e.manager_id, 
          e.department_id);

select * from copy_emp;


--新增一筆時, 使用 MERGE會 新增一筆
insert into EMPLOYEES values (223,'張三','張', 'aaa','0122','1987-01-02','AD_VP',20000,null, 100,90)
