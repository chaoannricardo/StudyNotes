
--�إ��˵���[schemabinding��, ��줣�i�H�� '*' �� ���[ schema

create view v41 
with schemabinding
as
select cno, name from dbo.cust4

--�H�U�O���~�T��

create view v42
with schemabinding
as
select * from cust4

--�T�� 1054�A�h�� 15�A���A 6�A�{�� v42�A�� 5
--���c�y�zô�������󤤤����\�ϥ� '*' �y�k�C

create view v42
with schemabinding
as
select cno, name from cust4

--�T�� 4512�A�h�� 16�A���A 3�A�{�� v52�A�� 4
--�L�k���c�y�zô�� �˵� 'v42'�A�]���W�� 'cust4' �ﵲ�c�y�zô���Ө��O�L�Ī��C
--�W�٪��榡�����]�t��ӳ����A�B���󤣱o�ۧڰѦҡC

--�ˬd�̩ۨ�

EXEC sp_depends @objname = v41

--�d�� view ���e

EXEC sp_helptext v41

--���[ schemabinding�� �L�k�R�����,�������R�� view

drop table cust4

--�T�� 3729�A�h�� 16�A���A 1�A�� 1
--�L�k DROP TABLE cust4�A�]������ 'v41' ���b�Ѧҥ��C

drop view v41
