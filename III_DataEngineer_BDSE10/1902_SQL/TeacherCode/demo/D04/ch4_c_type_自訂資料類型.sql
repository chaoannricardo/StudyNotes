--使用者自訂資料類型方式 2 sp_addtype 及 create type ; 建議逐漸採用後者

--例1 **Creating a User-Defined Data Type 
USE Northwind
GO
EXEC  sp_addtype  city,    'nvarchar(15)', NULL

--可以從 SSMS / 資料庫名 / 可程式 / 類型 / 使用者自訂類型 查詢

--建立表格 欄位為 自訂類型
create table t11( id     int,
                  addr   city)


--刪除類型 Dropping a User-Defined Data Type  
USE Northwind
GO
drop table t11     --先刪表格 
EXEC sp_droptype city  --才能刪 自訂類型
GO

/*
EXEC  sp_addtype  region,  'nvarchar(15)', NULL
EXEC  sp_addtype  country, 'nvarchar(15)', NULL
GO
*/

--建議以 CREATE TYPE 取代 sp_addtype
--例2 自訂類型
CREATE TYPE state from varchar(2) NOT NULL
GO

--建立表格 欄位為 自訂類型
create table t2(id    int,
                addr  state)  --自訂類型
GO

drop table t2     --先刪表格
drop type state   --才能刪 自訂類型

