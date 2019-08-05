use DB01
go

--琩高 街 salary  Abel?

  SELECT  last_name,  job_id,  salary
  FROM     employees
  WHERE  salary  >  ( select SALARY
                      from EMPLOYEES 
                      where LAST_NAME = 'Abel'
                     )
  
--琩高 街 salary 程 ?

  SELECT  last_name,  job_id,  salary
  FROM     employees
  WHERE  salary  = 
                  (SELECT  MIN (salary)
                   FROM     employees );
                   
                   
--琩高场程 salary   场 50 程 salary

  SELECT   department_id, MIN(salary)
  FROM      employees
  GROUP   BY  department_id
  HAVING   MIN ( salary )  >
                           (SELECT MIN ( salary )
                            FROM   employees
                            WHERE  department_id  =  50 );
                                               

--error 虫笲衡才腹, 琩高肚

  SELECT  employee_id,  last_name
  FROM     employees
  WHERE  salary  =
                                 (SELECT   MIN ( salary )
                                   FROM     employees
                                   GROUP  BY  department_id );

--琩高肚ゼ肚戈

  SELECT  last_name,  job_id
  FROM     employees
  WHERE   job_id =
                 (SELECT  job_id
                  FROM      employees
                  WHERE   last_name  =  'Haas' );

-- < ANY

  SELECT  employee_id, last_name, job_id, salary
  FROM     employees
  WHERE  salary  <  ANY
                     (SELECT  salary
                      FROM      employees
                      WHERE   job_id  =  'IT_PROG' )
  AND    job_id  <>  'IT_PROG';

-- < ALL

  SELECT  employee_id, last_name, job_id, salary
  FROM     employees
  WHERE  salary  <  ALL
                     (SELECT  salary
                      FROM      employees
                      WHERE   job_id  =  'IT_PROG' )
  AND    job_id  <>  'IT_PROG';
  
--琩高いΤ, т獶恨戮叭

SELECT  emp.last_name
  FROM      employees  emp
  WHERE   emp.employee_id   NOT  IN
                          (SELECT  mgr.manager_id
                           FROM     employees  mgr );

--э糶 

SELECT  emp.last_name
  FROM      employees  emp
  WHERE   emp.employee_id   NOT  IN
                          (SELECT  mgr.manager_id
                           FROM    employees  mgr 
                           WHERE   manager_id is not null);
