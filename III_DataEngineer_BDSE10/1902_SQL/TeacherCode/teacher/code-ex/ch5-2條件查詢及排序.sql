use DB01
go

--�d�� department_id = 90 �����u

SELECT  employee_id,  last_name,   job_id,   department_id
FROM     employees
WHERE  department_id  =  90;

--�d�� last_name �� Whalen �����u

SELECT employee_id,  last_name,   job_id,   department_id
FROM   employees
WHERE  last_name = 'Whalen' ;

--�d�� hire_date �� 1994-06-07 �����u

SELECT employee_id,  last_name,   job_id,   hire_date
FROM   employees
WHERE  hire_date = '1994-06-07'

--�d�� salary ���� 2500 �� 3500 �����u (�@)

SELECT  last_name,  salary
FROM     employees
WHERE  salary  >= 2500  AND  salary <=  3500;

--�d�� salary ���� 2500 �� 3500 �����u (�G)

SELECT  employee_id,  last_name,   job_id,   salary
FROM     employees
WHERE  salary  BETWEEN  2500  AND  3500;  --���p����,�A�j����

--�d�� manager_id �ݩ� 100, 101, 201 ���@�����u

SELECT  employee_id,  last_name,  salary,  manager_id
FROM     employees
WHERE  manager_id  IN  ( 100,  101,  201 );

--�H OR ��g

SELECT  employee_id,  last_name,  salary,  manager_id
FROM     employees
WHERE  manager_id = 100 OR
       manager_id = 101 OR
       manager_id = 201
       
--�d�� first_name �� S �}�Y �����u

SELECT	  first_name
FROM 	  employees
WHERE	  first_name  LIKE  'S%';

--�аݵ��׬����W�z���G���@��
SELECT	  last_name
FROM 	  employees
WHERE	  first_name  LIKE  'S%';

--�d��  manager_id �O  NULL �����u
SELECT  last_name,  manager_id
FROM     employees
WHERE   manager_id  IS  NULL;

--�d��  manager_id ���O  NULL �����u
SELECT  last_name,  manager_id
FROM     employees
WHERE   manager_id  IS   NOT  NULL

--AND ����ӱ��󳣦��� (TRUE)

SELECT employee_id,  last_name,  job_id,  salary
FROM   employees
WHERE  salary  >= 10000
AND    job_id  LIKE  '%MAN%';

--OR �u�����@���󦨥� (TRUE)
SELECT employee_id,  last_name,  job_id,  salary
FROM   employees
WHERE  salary  >= 10000
OR     job_id  LIKE  '%MAN%';

--Job_id  AND salary �u���B��

SELECT  last_name,  job_id,  salary
FROM    employees
WHERE   job_id  =  'SA_REP'
OR      job_id  =  'AD_PRES'
AND     salary  >  15000;

--�Q�άA�����ܹB�ⶶ��
SELECT  employee_id,  last_name,  job_id,  salary
FROM     employees
WHERE  ( job_id = 'SA_REP'
OR            job_id = 'AD_PRES' )
AND         salary > 15000;

--�Ƨ�SORT
--���u��ƥH salary �Ƨ� ���W

SELECT   last_name,  job_id,  department_id,  salary
FROM     employees
ORDER   BY  salary ;


--���u��ƥH salary �Ƨ� ����

SELECT   last_name,  job_id,  department_id,  salary
FROM     employees
ORDER   BY  salary  DESC;

--�h���Ƨ�

SELECT  last_name,  department_id,  salary
FROM     employees
ORDER   BY  department_id,  salary  DESC;

--TOP (N) - �d�߱Ʀ�]�e�X�W�Ϋ�X�W, �A���i�ٲ�
select  TOP  ( 2 )  salary , employee_id, last_name
from    employees 
order by  salary  desc

--WITH  TIES - �d�߱Ʀ�]�e�X�W�� �P�W����C�J
select  TOP  2  WITH  TIES  salary , employee_id, last_name
from    employees 
order by salary desc

