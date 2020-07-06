--��l���
SELECT employee_id,  job_id
FROM   employees
order by employee_id

SELECT employee_id,  job_id
FROM   job_history
order by employee_id

delete from  employees where employee_id = 223

--��ܭ��u�{¾�θg��, ���ƭȥu��ܤ@�� 28 �� (20 + (10-2) �� �涰������¾��)

SELECT employee_id,  job_id
FROM   employees
UNION
SELECT employee_id,  job_id
FROM   job_history;

--��ܩҦ����u�{¾�θg�� 30�� (20+ 10)

SELECT employee_id,  job_id,  department_id
FROM   employees
UNION  ALL
SELECT employee_id, job_id, department_id
FROM   job_history
ORDER  BY   employee_id;

--��ܭ��u�ب�{¾�P�e¾�ȬۦP�� (2�H)

SELECT  employee_id,  job_id
FROM    employees
INTERSECT
SELECT  employee_id,  job_id
FROM    job_history;

--�����L¾�ȥB�{¾, 5�� 101,102, 176, 200, 201, �t2�H��¾ 114, 122
SELECT  employee_id 
FROM    employees
INTERSECT
SELECT  employee_id 
FROM    job_history;

--��ܭ��u�����󴫹L¾�Ȫ� (18�� �D�������󴫹L¾�� �� �����զ^�{�Ȫ� 20-2 = 18)

SELECT employee_id,job_id
FROM   employees 
EXCEPT
SELECT employee_id,job_id
FROM   job_history;

-- 7�� �հʹL¾�� �u�� employee_id ���� job_id
SELECT distinct employee_id
FROM   job_history;

--���u�����󴫹L¾�Ȫ� , 15�� (20 - 5 ���涰 = 15) �����L¾�� �B�{¾
SELECT employee_id 
FROM   employees 
EXCEPT
SELECT employee_id 
FROM   job_history;

--�Χ�g
--��ܭ��u�����󴫹L¾�Ȫ�
select  employee_id,last_name
from   employees
where  employee_id  not in ( select distinct employee_id 
                             FROM    job_history
						  )

--��ܭ��u�����L¾��,���S�w��¾��( �b���ʾ��l��Ƥ���,���o�b�{¾�W��S��) 114, 122 (2 �H) 
SELECT employee_id 
FROM   job_history
EXCEPT
SELECT employee_id 
FROM   employees ;

--�Χ�g
select distinct employee_id 
FROM    job_history
where  employee_id  not in (select  employee_id
                            from   employees)
