--1�ƧǨ�� (�ƦW���)
 

--ROW_NUMBER ���, �� ���u �~�� salary �Ʀ�, �q ����C
SELECT  last_name,  SALARY   
FROM    employees
ORDER BY salary  DESC

SELECT  last_name,  SALARY ,  
        ROW_NUMBER() OVER  ( ORDER BY salary  DESC)
FROM    employees

--RANK ���, �� ���u �~�� salary �Ʀ�, �q ����C
SELECT  last_name,  SALARY ,  
        RANK() OVER  ( ORDER BY salary  DESC)
FROM    employees

--DENSE_RANK ���, �� ���u �~�� salary �Ʀ�, �q ����C
SELECT  last_name,  SALARY ,  
        DENSE_RANK() OVER  ( ORDER BY salary  DESC)
FROM    employees


--2a�ƻs��浲�c+��� - �{�ɸ�ƪ�

SELECT employee_id id,  last_name name ,  salary,  job_id 
INTO   #tmp_sales_reps
FROM   employees
WHERE   job_id  LIKE  '%REP%' ;

--2b �b�P�@session �d��

select * from #tmp_sales_reps

--2c���b�t�@session �d�ߤ���

select * from #tmp_sales_reps


--3a�ƻs��浲�c+���

SELECT employee_id id,  last_name name ,  salary,  job_id 
INTO   sales_reps2
FROM   employees;

--3b�d��

select * from sales_reps2

--4a�ƻs��浲�c�ӥH,���t���, �Q�� 1 = 2 ���p�ޥ�

SELECT employee_id id,  last_name name ,  salary,  job_id 
INTO   sales_reps
FROM   employees
WHERE  1=2;

--4b�q�d�ߤ��s�W���

INSERT  INTO  sales_reps ( id,  name,  salary,  job_id  )
SELECT  employee_id,  last_name,  salary,  job_id 
FROM    employees
WHERE   job_id  LIKE  '%REP%' ;

--4c�d��

select * from sales_reps

