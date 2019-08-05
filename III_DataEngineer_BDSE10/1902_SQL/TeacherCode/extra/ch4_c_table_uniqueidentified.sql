--�b��Ʀ椤�ϥ� uniqueidentifier �������
--�U�C�d�ҷ|�إߤ@���t�� uniqueidentifier ��Ʀ檺��ƪ�C�o�ӽd�ҷ|�Q�� PRIMARY KEY ��������ӫO�@��ƪ�A
�H�K�ϥΪ̴��J���ƪ��ȡA�H�ΧQ�� DEFAULT ����������� NEWSEQUENTIALID() ��ƨӴ��ѷs��ƦC���ȡC
ROWGUIDCOL �ݩʷ|�M�Ψ� uniqueidentifier ��Ʀ�A�H�K�i�H�ϥ� $ROWGUID ����r�ӰѦҥ��C

--�� 1 �g�k
CREATE TABLE dbo.guidData
(guid  uniqueidentifier not null DEFAULT NEWID() ,
 ename varchar(60)      
);
GO

--����
insert into guidData(EName) values('John')

select * from guiddata


--�� 2 �g�k
CREATE TABLE dbo.Globally_Unique_Data
(guid  uniqueidentifier CONSTRAINT Guid_Default DEFAULT NEWSEQUENTIALID() ROWGUIDCOL,
 ename varchar(60)      --�̫�@��ᦳ table constraint��,�i�ٲ� �r�I
       CONSTRAINT Guid_PK PRIMARY KEY (guid)
);
GO

--����
insert into Globally_Unique_Data(ename) values ('Mary')
select * from Globally_Unique_Data

--�� 3 ���q�d�Ҽg�k

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


