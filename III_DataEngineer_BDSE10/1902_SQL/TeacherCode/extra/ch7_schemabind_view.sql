
--建立檢視表加schemabinding時, 欄位不可以用 '*' 及 須加 schema

create view v41 
with schemabinding
as
select cno, name from dbo.cust4

--以下是錯誤訊息

create view v42
with schemabinding
as
select * from cust4

--訊息 1054，層級 15，狀態 6，程序 v42，行 5
--結構描述繫結的物件中不允許使用 '*' 語法。

create view v42
with schemabinding
as
select cno, name from cust4

--訊息 4512，層級 16，狀態 3，程序 v52，行 4
--無法結構描述繫結 檢視 'v42'，因為名稱 'cust4' 對結構描述繫結而言是無效的。
--名稱的格式必須包含兩個部分，且物件不得自我參考。

--檢查相依性

EXEC sp_depends @objname = v41

--查詢 view 內容

EXEC sp_helptext v41

--有加 schemabinding時 無法刪除表格,必須先刪除 view

drop table cust4

--訊息 3729，層級 16，狀態 1，行 1
--無法 DROP TABLE cust4，因為物件 'v41' 正在參考它。

drop view v41
