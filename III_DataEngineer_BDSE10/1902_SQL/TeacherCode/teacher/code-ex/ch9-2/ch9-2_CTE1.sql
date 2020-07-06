--��X�`�~���X���B�̰�������

use DB01
go

WITH  payroll  (deptno , totalpay )  
AS
  ( SELECT department_id , SUM(salary) 
    FROM   employees
    GROUP  BY  department_id
  ) 
SELECT  deptno
FROM    payroll
WHERE   totalpay  =  ( SELECT MAX(totalpay) 
                       FROM   payroll 
                     )

--method2


SELECT TOP 1 department_id , SUM(salary) 
FROM   employees
GROUP  BY  department_id
ORDER BY SUM(salary)  desc



