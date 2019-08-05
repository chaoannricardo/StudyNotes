--建立一個 default 以 today 為 系統時間

CREATE DEFAULT dbo.today AS  getdate()
GO

--建立表格
create table t3
(id int,
 d  date
)
                
-- Bind the default to a column 將 default bind到 表格欄
EXEC sp_bindefault  N'dbo.today',  N'dbo.t3.d'
GO


--測試

insert into t3(id) values (101)
select * from t3


--bindefault 與 default 比較 (前者須分兩段宣告, 後者一次宣告)

create table t31 
(id int,
 d  date  default getdate()
)

