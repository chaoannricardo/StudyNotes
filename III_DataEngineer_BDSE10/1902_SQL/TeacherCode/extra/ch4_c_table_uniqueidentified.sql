--在資料行中使用 uniqueidentifier 資料類型
--下列範例會建立一份含有 uniqueidentifier 資料行的資料表。這個範例會利用 PRIMARY KEY 條件約束來保護資料表，
以免使用者插入重複的值，以及利用 DEFAULT 條件約束中的 NEWSEQUENTIALID() 函數來提供新資料列的值。
ROWGUIDCOL 屬性會套用到 uniqueidentifier 資料行，以便可以使用 $ROWGUID 關鍵字來參考它。

--例 1 寫法
CREATE TABLE dbo.guidData
(guid  uniqueidentifier not null DEFAULT NEWID() ,
 ename varchar(60)      
);
GO

--測試
insert into guidData(EName) values('John')

select * from guiddata


--例 2 寫法
CREATE TABLE dbo.Globally_Unique_Data
(guid  uniqueidentifier CONSTRAINT Guid_Default DEFAULT NEWSEQUENTIALID() ROWGUIDCOL,
 ename varchar(60)      --最後一行後有 table constraint時,可省略 逗點
       CONSTRAINT Guid_PK PRIMARY KEY (guid)
);
GO

--測試
insert into Globally_Unique_Data(ename) values ('Mary')
select * from Globally_Unique_Data

--例 3 講義範例寫法

USE Northwind
GO
CREATE TABLE Customer
(CustID uniqueidentifier NOT NULL
	DEFAULT NEWID(),
	CustName char(30) NOT NULL) 
GO

insert into customer(Custname) values('John');
insert into customer(Custname) values('Mary');
select * from customer
go


