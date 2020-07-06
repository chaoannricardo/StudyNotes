--basic

create table member1
( id    INT,
  name  char(10),
  bdate datetime
);

--with filegroup

create table member2
( id    INT,
  name  char(10),
  bdate datetime
)
ON [PRIMARY]     


--�ק� table
--�[���

alter table member1 add tel char(15)

--��e��
alter table member1 ALTER COLUMN name char(15)

--�R���
alter table member1 DROP COLUMN tel 

--�����W��  name --->  ename
sp_rename 'member1.name', 'ename', 'COLUMN' 

--����W��  member1 --> customer
sp_rename N'member1', N'customer', 'OBJECT'  

--�R�����
drop table customer


--�إ߸�ƪ� with identity �y����
create table member3
( id    INT IDENTITY(10,1),
  name  char(10),
  bdate datetime
)

insert into member3(name, bdate) values('John','1980-12-01')
insert into member3(name, bdate) values('Mary','1981-10-21')

select * from member3

--�H $identity ���N id ���W
select $identity, id, name from member3

/*
id  id  name
------------
10	10	John      
11	11	Mary      
*/
--error ���i�j����J

insert into member3 values(15,'Smith','1982-02-15')

--���D �] IDENTITY_INSERT �� ���w���W��
set IDENTITY_INSERT dbo.member3 ON
insert into member3(id,name,bdate) values(15,'Smith','1982-02-15')

--�B���i �����w���W��
insert into member3 values(15,'Smith','1982-02-15')

--�d�߬y�����ثe�s��X��
select @@IDENTITY as '�ثe��'

select IDENT_CURRENT('member3')  as '�ثe��',  
       IDENT_SEED('member3')     as '�ҩl��', 
       IDENT_INCR('member3')     as '���W��'  


--�ɥR �Y �R����ƦC id = 12 ��, ���s insert�����, �y�����O�q�X���}�l ? 12 ? �̫�@�Ӹ��X���U�@��
set IDENTITY_INSERT dbo.member3 OFF
delete from  member3 where id = 12
insert into member3(name, bdate) values('Mary2','1981-10-21')
select * from member3


--2012 T-SQL �y����2  

 CREATE SEQUENCE dbo.myseq
 AS INT
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 1000
 CYCLE
 CACHE;
go

--�إ߸�ƪ�
create table tseq ( id int, c2 char(20))
go

insert into tseq values (NEXT VALUE FOR dbo.myseq, 'John')
insert into tseq values (NEXT VALUE FOR dbo.myseq, 'Mary')
select * from tseq;
go

-- ��l��k
--�إ߸�ƪ� with identity �y����
create table member3
( id    INT IDENTITY(10,1),
  name  char(10),
  bdate datetime
)

insert into member3(name, bdate) values('John2','1980-12-01')
insert into member3(name, bdate) values('Mary2','1981-10-21')

select * from member3

--���Ͱߤ@�� ���q�d�Ҽg�k: uniqueidentifier ��� 16 �줸�ժ� GUID, 36�r����

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

--ex 2 �H $ROWGUID ���o custid ����

CREATE TABLE Customer2
(CustID   uniqueidentifier NOT NULL DEFAULT NEWID() ROWGUIDCOL,
 CustName char(30) NOT NULL) 
GO

insert into customer2 (Custname) values('John');
insert into customer2 (Custname) values('Mary');
select * from customer2
select $ROWGUID, custid, Custname from customer2
go
/*
CustID                               custid                               Custname
------------------------------------ ------------------------------------ ------------------------------
340F5F75-D4A1-46D8-9212-8AD06AF60EA0 340F5F75-D4A1-46D8-9212-8AD06AF60EA0 John                          
FC6B2227-09BC-4E8B-A9BE-99A05383E483 FC6B2227-09BC-4E8B-A9BE-99A05383E483 Mary                          
*/
