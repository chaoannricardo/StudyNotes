use DB01
go

  
--計算 各部門(department_id) 的 薪資(salary)總合

  SELECT  
  FROM    employees
  GROUP   BY  department_id;


--查詢 各員工姓名(last_name),薪資(salary),部門編號(department_id) 及所屬部門名稱(department_name)  

  SELECT  
  FROM    
  ON      
 
--計算 各部門名稱(department_name)  的 薪資(salary)總合

  SELECT  
  FROM    
  ON      
  GROUP   BY 
  

--計算 各部門名稱(department_id, department_name)  的 薪資(salary)總合

  SELECT  
  FROM    
  ON     
  GROUP   BY  
    

--額外練習 
--查詢 客戶訂單明細資料

       Customers       (CustomerID) 
       Orders          (OrderID, CustomerID)
       [Order Details] (OrderID, ProductID)
       Products        (ProductID)

USE Northwind
go



