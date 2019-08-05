--例3-1 建完table 後, 再修改加 PRIMARY KEY , 該欄位須 NOT NULL

create table dep4
( id    INT  NOT NULL,
  name  char(10)  
);

--以 ALTER TABLE 加 條件
ALTER TABLE dep4
   ADD CONSTRAINT PK_dep4 PRIMARY KEY(id)
	
GO

--例3-2 建完table 後, 再修改加 FOREIGN KEY

create table emp4
(eno   INT      PRIMARY KEY,
 name  CHAR(10),
 dno   INT  
)
GO
 
alter  table emp4  add constraint fk_emp4_id FOREIGN KEY(dno) REFERENCES dep4(id) ON DELETE CASCADE
go
 
/* 原建table就順便宣告條件
create table emp4
(eno   INT      PRIMARY KEY,
 name  CHAR(10),
 dno   INT      FOREIGN KEY REFERENCES dep4(id) ON DELETE CASCADE
 )
*/
 
--測試
 insert into dep4 values(10,'人事')
 insert into dep4 values(20,'業務')
 
 insert into emp4 values(101,'張三', 10);
 insert into emp4 values(102,'李四', 20);
 insert into emp4 values(103,'張三', 99); --error 
 insert into emp4 values(103,'張三', 10); --OK
 
 delete from dep4 where id = 10 ;       --OK 

 select * from dep4
 select * from emp4
 

---- 額外補充
--例3-2 事後加 PRIMARY KEY , 該欄位須 NOT NULL
create table dep5
( id    INT  ,
  name  char(10)  
);

--無法在資料表 'dep5' 中的可為 Null 的資料行上定義 PRIMARY KEY 條件約束。
--訊息 1750，層級 16，狀態 0，行 1
--無法建立條件約束。請查看先前的錯誤。

alter table dep5 alter column id int not null
GO

ALTER TABLE dep5
   ADD CONSTRAINT PK_dep5 PRIMARY KEY(id)

--刪除 PK

alter table dep5 drop constraint pk_dep5
	


-- 額外補充, 類似前一範例 cust , ord 宣告 PK FK
 

--建立表格時就加 PRIMARY KEY ,沒加限制名稱, 會自動設成 NOT NULL
create table dep2
( id    INT PRIMARY KEY,
  name  char(10)  
);

--測試
insert into dep2 values(10,'人事');
insert into dep2 values(20,'業務');
insert into dep2 values(10,'會計');  --違反規則 PK
insert into dep2 values(30,'會計');  --更正

select * from dep2


--查詢 那個欄位違反 constraint_keys,類型constraint_type  名稱 constraint_name
sp_help dep2


--例2 建立 PRIMARY KEY ,加限制名稱
create table dep3
( id    INT      constraint pk_dep3_id PRIMARY KEY,
  name  char(10)  
);

--測試
insert into dep3 values(10,'人事');
insert into dep3 values(20,'業務');
insert into dep3 values(10,'會計');  --違反規則 PK , 自訂名稱

select * from dep3

