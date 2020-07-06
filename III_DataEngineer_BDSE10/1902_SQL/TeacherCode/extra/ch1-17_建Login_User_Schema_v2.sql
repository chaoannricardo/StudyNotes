-- 建 Login: L1 + 建 User : u1 + 建 Schema : s1 + 建 表格 a1 

--1 建 Login: L1, 密碼有分大小寫
USE master
GO
CREATE LOGIN  L1 WITH PASSWORD= 'l1'              --建 Login: L1, 密碼有分大小寫
GO

--檢查: SSMS 工具 / 物件總管 / 展開最外層 安全性 /  登入 / 是否出現 L1 

--2建 Database User : u1 於指定資料庫  (每個資料庫要有一db user 綁定 登入帳號)
use Northwind  --或 use DB01
go
CREATE USER u1 FOR LOGIN L1                       --建 User : u1
GO

--檢查: SSMS 工具 / 物件總管 / 展開 資料庫  northwind or  DB01
--展開 安全性 / 使用者 / 確認是否有 u1
 
--3建 Schema : s1 授權 u1 使用
CREATE SCHEMA s1 AUTHORIZATION u1                 --建 Schema : s1
GO
ALTER USER u1 WITH DEFAULT_SCHEMA=s1              --設定 u1 預設 schema 為 s1
GO

--檢查: SSMS 工具 / 物件總管 / 展開 資料庫  northwind or  DB01
--展開 安全性 / 結構描述 / 確認是否有 s1

--3.2 授權 db user: u1 權限 有 read, write, ddl 權限
EXEC sp_addrolemember 'db_datawriter', 'u1'       --授權 u1 有 read, write, ddl 權限
GO
EXEC sp_addrolemember 'db_ddladmin'  , 'u1'
GO
EXEC sp_addrolemember 'db_datareader', 'u1'
GO

--4複製 37-59行 指令
--以 L1 登入  ( SSMS 左上方 連線 /  資料庫引擎 )
use Northwind --或 use DB01
go

--5.1  SSMS 工具 / 物件總管 / 點 L1 登入連線 / 點 新增查詢 /  
--5.2 複製貼上 剛才步驟4 指令  於空白 命令編輯視窗

--6 建 表格 emp 於 northwind or DB01  
create table emp(id int)
go

--檢查: SSMS 工具 / 物件總管 / 展開 資料庫  northwind or  DB01  / 展開 資料表 
--確認 是否出現 s1.emp  若出現 dbo.emp 則表示做錯了 

--6.2 新增幾筆資料 到 emp 表格
insert into    emp values (101);
insert into s1.emp values (102);

select * from     emp;     
select * from  s1.emp;
select * from  dbo.emp;    --失敗, 為什麼 ?
go


--刪除 反向順序
DROP TABLE  s1.emp
GO
DROP SCHEMA s1
GO
--中斷 L1 連線 (左邊 SSMS)
DROP USER u1
GO

--回另一管理者視窗 + 開啟活動監視器 (右鍵 Server名) + 點"處理序"+ 右鍵  L1 + 終止 L1 處理程序
USE [master]
GO
DROP LOGIN L1
GO




