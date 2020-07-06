-- �� Login: L1 + �� User : u1 + �� Schema : s1 + �� ��� a1 

--1 �� Login: L1, �K�X�����j�p�g
USE master
GO
CREATE LOGIN  L1 WITH PASSWORD= 'l1'              --�� Login: L1, �K�X�����j�p�g
GO

--�ˬd: SSMS �u�� / �����`�� / �i�}�̥~�h �w���� /  �n�J / �O�_�X�{ L1 

--2�� Database User : u1 ����w��Ʈw  (�C�Ӹ�Ʈw�n���@db user �j�w �n�J�b��)
use Northwind  --�� use DB01
go
CREATE USER u1 FOR LOGIN L1                       --�� User : u1
GO

--�ˬd: SSMS �u�� / �����`�� / �i�} ��Ʈw  northwind or  DB01
--�i�} �w���� / �ϥΪ� / �T�{�O�_�� u1
 
--3�� Schema : s1 ���v u1 �ϥ�
CREATE SCHEMA s1 AUTHORIZATION u1                 --�� Schema : s1
GO
ALTER USER u1 WITH DEFAULT_SCHEMA=s1              --�]�w u1 �w�] schema �� s1
GO

--�ˬd: SSMS �u�� / �����`�� / �i�} ��Ʈw  northwind or  DB01
--�i�} �w���� / ���c�y�z / �T�{�O�_�� s1

--3.2 ���v db user: u1 �v�� �� read, write, ddl �v��
EXEC sp_addrolemember 'db_datawriter', 'u1'       --���v u1 �� read, write, ddl �v��
GO
EXEC sp_addrolemember 'db_ddladmin'  , 'u1'
GO
EXEC sp_addrolemember 'db_datareader', 'u1'
GO

--4�ƻs 37-59�� ���O
--�H L1 �n�J  ( SSMS ���W�� �s�u /  ��Ʈw���� )
use Northwind --�� use DB01
go

--5.1  SSMS �u�� / �����`�� / �I L1 �n�J�s�u / �I �s�W�d�� /  
--5.2 �ƻs�K�W ��~�B�J4 ���O  ��ť� �R�O�s�����

--6 �� ��� emp �� northwind or DB01  
create table emp(id int)
go

--�ˬd: SSMS �u�� / �����`�� / �i�} ��Ʈw  northwind or  DB01  / �i�} ��ƪ� 
--�T�{ �O�_�X�{ s1.emp  �Y�X�{ dbo.emp �h��ܰ����F 

--6.2 �s�W�X����� �� emp ���
insert into    emp values (101);
insert into s1.emp values (102);

select * from     emp;     
select * from  s1.emp;
select * from  dbo.emp;    --����, ������ ?
go


--�R�� �ϦV����
DROP TABLE  s1.emp
GO
DROP SCHEMA s1
GO
--���_ L1 �s�u (���� SSMS)
DROP USER u1
GO

--�^�t�@�޲z�̵��� + �}�Ҭ��ʺʵ��� (�k�� Server�W) + �I"�B�z��"+ �k��  L1 + �פ� L1 �B�z�{��
USE [master]
GO
DROP LOGIN L1
GO




