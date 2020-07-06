

--�l�d�ߥΩ��ƨӷ� FROM
use DB01
go

SELECT  a.last_name,  a.salary,   a.department_id,  b.salavg
FROM    employees  a JOIN   (SELECT   department_id,  AVG ( salary )  salavg
                             FROM     employees
                             GROUP  BY  department_id )  b
ON    a.department_id  =  b.department_id
WHERE a.salary  >  b.salavg ;


--�� 

SELECT  a.last_name,  a.salary,   a.department_id,  b.salavg
FROM    employees  a ,  (SELECT   department_id,  AVG ( salary )  salavg
                         FROM     employees
                         GROUP  BY  department_id
                        )  b
WHERE  a.department_id  =  b.department_id
AND    a.salary  >  b.salavg ;

