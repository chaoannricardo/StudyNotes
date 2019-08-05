use DB01
go


--��l���
  select employee_id, last_name, department_id,salary, commission_pct from EMPLOYEES 

--�p�� ���u salary ����, �`�X, �̰�, �̧C

  SELECT  AVG (salary)
  FROM    employees;

  SELECT  AVG (salary), MAX(salary), MIN(salary), SUM(salary)
  FROM    employees;

--���~�ܽd, �Ҧ���Ʒ��@�ӷJ�`��X, ���i���ӧO��� 

  SELECT  last_name, AVG(salary),  MAX(salary), MIN(salary), SUM(salary)
  FROM    employees;

--count
  SELECT  COUNT (*),  COUNT(commission_pct),  COUNT(last_name)
  FROM    employees;


--�p�� ����  commission_pct
  SELECT AVG(commission_pct),  AVG(ISNULL(commission_pct,0)),
         SUM(commission_pct), 
         SUM(commission_pct)/count(commission_pct),
         SUM(commission_pct) / 20
  FROM   employees;
  
--�p�� �U���� ���� �� �`�X salary

  SELECT  department_id, AVG(salary), SUM(salary)
  FROM    employees
  GROUP   BY  department_id;

--group without column name
  SELECT  AVG(salary), SUM(salary), COUNT(*)
  FROM    employees
  GROUP   BY  department_id;
  
  
 --�h�����s
  SELECT   department_id, job_id,  AVG (salary), SUM (salary),COUNT(*)
  FROM     employees
  GROUP    BY  department_id, job_id
  order by department_id, job_id;


--���~�ܽd, WHERE ���i�H�ΨӹL�o���s���

  SELECT department_id,  AVG(salary)
  FROM   employees
  WHERE  AVG (salary) >  8000
  GROUP  BY  department_id;
  
  --before fileter
  SELECT  department_id, AVG (salary)
  FROM    employees
  GROUP   BY  department_id;

--HAVING filter
 SELECT  department_id, AVG(salary)
 FROM    employees
 GROUP   BY  department_id
 HAVING  AVG ( salary ) >  8000
 
 --WHERE and HAVING �å�
 SELECT  department_id,   AVG (salary)
 FROM    employees
 WHERE   DEPARTMENT_ID >= 50
 GROUP   BY  department_id
 HAVING  AVG (salary) >  8000
 

--ch8 �i���y�k group �p�p

  SELECT    department_id, SUM( salary), COUNT(*)
  FROM      employees
  GROUP BY  ROLLUP( department_id )
  ORDER BY  department_id;
