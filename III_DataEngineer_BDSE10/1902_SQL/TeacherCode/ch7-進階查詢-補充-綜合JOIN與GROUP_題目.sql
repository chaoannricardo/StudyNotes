use DB01
go

  
--計算 各部門(department_id) 的 薪資(salary)總合
  SELECT  d.DEPARTMENT_ID, SUM(SALARY) 'Total Salary'
  FROM    employees e join DEPARTMENTS d
  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
  GROUP   BY  d.DEPARTMENT_ID


--查詢 各員工姓名(last_name),薪資(salary),部門編號(department_id) 及所屬部門名稱(department_name)  
  SELECT  e.LAST_NAME, e.SALARY, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
  FROM    employees e full outer join DEPARTMENTS d
  on e.DEPARTMENT_ID = d.DEPARTMENT_ID   
 
--計算 各部門名稱(department_name)  的 薪資(salary)總合
  SELECT  d.DEPARTMENT_NAME, SUM(SALARY) 'Total Salary'
  FROM    employees e join DEPARTMENTS d
  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
  GROUP   BY  d.DEPARTMENT_NAME
  

--計算 各部門名稱(department_id, department_name)  的 薪資(salary)總合
  SELECT  d.DEPARTMENT_ID, d.DEPARTMENT_NAME, SUM(SALARY) 'Total Salary'
  FROM    employees e join DEPARTMENTS d
  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
  GROUP   BY  d.DEPARTMENT_NAME, d. DEPARTMENT_ID
    

--額外練習 
--查詢 客戶訂單明細資料





       Customers       (CustomerID) 
       Orders          (OrderID, CustomerID)
       [Order Details] (OrderID, ProductID)
       Products        (ProductID)

USE Northwind
go



