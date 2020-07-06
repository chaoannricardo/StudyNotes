--�ϥΪ̦ۭq��������覡 2 sp_addtype �� create type ; ��ĳ�v���ĥΫ��

--��1 **Creating a User-Defined Data Type 
USE Northwind
GO
EXEC  sp_addtype  city,    'nvarchar(15)', NULL

--�i�H�q SSMS / ��Ʈw�W / �i�{�� / ���� / �ϥΪ̦ۭq���� �d��

--�إߪ�� ��쬰 �ۭq����
create table t11( id     int,
                  addr   city)


--�R������ Dropping a User-Defined Data Type  
USE Northwind
GO
drop table t11     --���R��� 
EXEC sp_droptype city  --�~��R �ۭq����
GO

/*
EXEC  sp_addtype  region,  'nvarchar(15)', NULL
EXEC  sp_addtype  country, 'nvarchar(15)', NULL
GO
*/

--��ĳ�H CREATE TYPE ���N sp_addtype
--��2 �ۭq����
CREATE TYPE state from varchar(2) NOT NULL
GO

--�إߪ�� ��쬰 �ۭq����
create table t2(id    int,
                addr  state)  --�ۭq����
GO

drop table t2     --���R���
drop type state   --�~��R �ۭq����

