--Scarlar Subquery ��m�N����1800 ��������ܬ� Canada �_�h USA (�]�i��JOIN ��g)
--�� SELECT �y�l�����l�d��,�Y�^�ǶW�L�@����(ex location_id = 1700 ), �|�X�{���~

use DB01
go
               
			   
			   SELECT *
                FROM   departments   
SELECT employee_id, last_name, department_id ,
                   (CASE WHEN department_id  =
                                               (SELECT department_id 
                                                FROM   departments
                                                WHERE  location_id = 1800)
                          THEN  'Canada'  
                    ELSE  'USA'  
                    END)  location
FROM   employees;


--�Χ�g JOIN
--�� SELECT �y�l����H ���� ���N�l�d��, �^�ǶW�L�@����(ex location_id = 1700 ), �N���|�X�{���~

SELECT employee_id, last_name, (CASE WHEN location_id = 1800 THEN 'Canada'
                                ELSE 'USA' END
                               )
FROM   EMPLOYEES e join DEPARTMENTS d
ON     e.department_id = d.department_id 



SELECT employee_id, last_name,  e.DEPARTMENT_ID , d.LOCATION_ID
FROM   EMPLOYEES e join DEPARTMENTS d
ON     e.department_id = d.department_id 

