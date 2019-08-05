use DB01
go

  
--�p�� �U����(department_id) �� �~��(salary)�`�X
  SELECT  d.DEPARTMENT_ID, SUM(SALARY) 'Total Salary'
  FROM    employees e join DEPARTMENTS d
  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
  GROUP   BY  d.DEPARTMENT_ID


--�d�� �U���u�m�W(last_name),�~��(salary),�����s��(department_id) �Ω��ݳ����W��(department_name)  
  SELECT  e.LAST_NAME, e.SALARY, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
  FROM    employees e full outer join DEPARTMENTS d
  on e.DEPARTMENT_ID = d.DEPARTMENT_ID   
 
--�p�� �U�����W��(department_name)  �� �~��(salary)�`�X
  SELECT  d.DEPARTMENT_NAME, SUM(SALARY) 'Total Salary'
  FROM    employees e join DEPARTMENTS d
  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
  GROUP   BY  d.DEPARTMENT_NAME
  

--�p�� �U�����W��(department_id, department_name)  �� �~��(salary)�`�X
  SELECT  d.DEPARTMENT_ID, d.DEPARTMENT_NAME, SUM(SALARY) 'Total Salary'
  FROM    employees e join DEPARTMENTS d
  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
  GROUP   BY  d.DEPARTMENT_NAME, d. DEPARTMENT_ID
    

--�B�~�m�� 
--�d�� �Ȥ�q����Ӹ��





       Customers       (CustomerID) 
       Orders          (OrderID, CustomerID)
       [Order Details] (OrderID, ProductID)
       Products        (ProductID)

USE Northwind
go



