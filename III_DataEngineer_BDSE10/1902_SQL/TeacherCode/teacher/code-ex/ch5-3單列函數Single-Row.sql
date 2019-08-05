use DB01
go

--�d��  last_name �� higgings �����u (�w�ǳ]��CS ��,�r���|�Ϥ��j�p�g)

SELECT  employee_id,  last_name,  department_id
FROM    employees 
WHERE   last_name  =  'higgins';

--�N  last_name �ର�p�g (�w�� �@�볣�O�]�� CI)

SELECT  employee_id,  last_name,  department_id
FROM    employees 
WHERE   LOWER ( last_name ) =  'higgins';

--�d�� job_id �ĥ|�r���_�l�� REP �����u

SELECT  last_name, job_id,  LEN ( last_name )  AS  LENGTH,
        CHARINDEX ( 'a',  last_name )  AS  INSTR
FROM    employees
WHERE   SUBSTRING ( job_id,  4, 3 )  =  'REP';

--ROUND: �|�ˤ��J���, 0 ������Ʀ�, -1 �����Q���

SELECT  ROUND ( 45.926, 2 ),  ROUND ( 45.926, 0 ),  ROUND ( 45.926, -1 )

--������
SELECT GETDATE()  --���o�{�b�ɶ�

SELECT DATEADD(month, 6, '2006-03-30') 

SELECT DATEDIFF(YEAR, '2006-01-30' , '2009-03-30'); 
SELECT DATEDIFF(MONTH, '2006-01-30' , '2009-03-30');
 
SELECT DATENAME(YEAR, '2009-03-30'); 
SELECT DATENAME(DAY, '2009-03-30'); 
SELECT DATEPART(DAY, '2009-03-30'); 

SELECT YEAR('2009-03-30'); 
SELECT MONTH('2009-03-30'); 
SELECT DAY('2009-03-30'); 

--�� �d�� 1999 �~��¾�����u

SELECT employee_id, last_name, hire_date, YEAR(hire_date) 
FROM   employees
WHERE  hire_date >= '1999-1-1' and hire_date <='1999-12-31'

--��g��

SELECT employee_id, last_name, hire_date, YEAR(hire_date) 
FROM   employees
WHERE  YEAR(hire_date) = 1999;

--Implict VS Explict �ഫ
SELECT  2 + '3' 
SELECT  2 + CAST( '3' AS  INT)  

--�ഫ date ����榡
SELECT  getdate(),                                      --yyyy-mm-dd ���o�{�b�ɶ�
        CONVERT ( VARCHAR ( 40 ),   getdate(), 101 ) ,  --mm/dd/yyyy
        CONVERT ( VARCHAR ( 40 ),   getdate(), 102 ) ,  --yyyy.mm.dd
	CONVERT ( VARCHAR ( 40 ),   getdate(), 103 ) ,  --dd/mm/yyyy
	CONVERT ( VARCHAR ( 40 ),   getdate(), 121 )    --yyyy-mm-dd

--�ഫ ���u��  hire_date ����榡

SELECT  last_name,   
        CONVERT ( VARCHAR ( 40 ),   hire_date, 101  )   AS  HIREDATE
FROM    employees;

--�ഫ ���u commission_pct �ŭȪ��ର 0

SELECT last_name, salary, commission_pct,  ISNULL( commission_pct,  0 )
FROM   employees;

--�� ISNULL �P  IS NULL ���P�B

SELECT last_name, salary, commission_pct,  ISNULL( commission_pct,  0 ) --�J��ŭȮ� �ର���w��
FROM   employees
WHERE  commission_pct IS NULL  -- �P�_�O�_���ŭ�


--CASE��� �� ���u job_id  �վ� salary

SELECT   last_name,  job_id,  salary,
         CASE  job_id  WHEN  'IT_PROG'  THEN  1.10 * salary
                       WHEN 'ST_CLERK'  THEN  1.15 * salary
                       WHEN 'SA_REP'    THEN  1.20 * salary
                       ELSE      salary 
         END     "REVISED_SALARY"
  FROM   employees;

--CASE��ƥt�@�ؼg�k �� ���u job_id  �վ� salary
SELECT   last_name,  job_id,  salary,
         CASE  WHEN job_id  = 'IT_PROG'  THEN  1.10 * salary
               WHEN job_id  = 'ST_CLERK' THEN  1.15 * salary
               WHEN job_id  ='SA_REP'    THEN  1.20 * salary
               ELSE      salary 
         END     "REVISED_SALARY"
  FROM   employees;
