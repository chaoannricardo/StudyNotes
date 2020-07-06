use DB01
go

--�d�� �֪� salary �j�� Abel?

  SELECT  last_name,  job_id,  salary
  FROM     employees
  WHERE  salary  >  ( select SALARY
                      from EMPLOYEES 
                      where LAST_NAME = 'Abel'
                     )
  
--�d�� �֪� salary �̧C ?

  SELECT  last_name,  job_id,  salary
  FROM     employees
  WHERE  salary  = 
                  (SELECT  MIN (salary)
                   FROM     employees );
                   
                   
--�d�ߦU�����̧C salary �B �j�� ���� 50 �̧C salary

  SELECT   department_id, MIN(salary)
  FROM      employees
  GROUP   BY  department_id
  HAVING   MIN ( salary )  >
                           (SELECT MIN ( salary )
                            FROM   employees
                            WHERE  department_id  =  50 );
                                               

--error ��C�B��Ÿ�, �l�d�߶Ǧ^�h�C

  SELECT  employee_id,  last_name
  FROM     employees
  WHERE  salary  =
                                 (SELECT   MIN ( salary )
                                   FROM     employees
                                   GROUP  BY  department_id );

--�l�d�߶ǥ��Ǧ^��ƦC

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
  
--�l�d�ߤ����ŭ�, ��X�D�D��¾�Ȫ����u

SELECT  emp.last_name
  FROM      employees  emp
  WHERE   emp.employee_id   NOT  IN
                          (SELECT  mgr.manager_id
                           FROM     employees  mgr );

--��g 

SELECT  emp.last_name
  FROM      employees  emp
  WHERE   emp.employee_id   NOT  IN
                          (SELECT  mgr.manager_id
                           FROM    employees  mgr 
                           WHERE   manager_id is not null);
