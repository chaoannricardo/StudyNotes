
-- 1 part name
   select  * from  employees
-- 2 part name
   select  * from  dbo.employees

-- 3 part name
   select  * from  northwind.dbo.employees

-- 4 part name
   select  * from  [III-EEIT].northwind.dbo.employees

--若連到遠端機器, 須 加入伺服器( IP加入hosts檔) ,及兩邊 sa密碼一樣, 
   select  * from  R1502.northwind.dbo.employees


/* 訊息 7202，層級 11，狀態 2，行 1
   在 sys.servers 中找不到伺服器 'R1502'。請確認所指定的伺服器名稱是否正確。如果需要，請執行預存程序 sp_addlinkedserver，將伺服器加入 sys.servers。
*/	
  
 EXEC sp_addlinkedserver 'R1502'
 select * from sys.servers

--重新查詢

 /*
   訊息 18452，層級 14，狀態 1，行 1
   登入失敗。此登入是來自未受信任的網域，不能用於 Windows 驗證。

   訊息 18456，層級 14，狀態 1，行 1
   使用者 'sa' 的登入失敗。
 */

--改遠端 sa 密碼與 client端同
--重新查詢

--加遠端ip於 client端 hosts檔
  ping R1502 -4
  
-- C:\Windows\System32\drivers\etc\hosts
--加  192.168.31.28          R1502 

--重新查詢


--刪除
 EXEC sp_dropserver 'R1502'
 