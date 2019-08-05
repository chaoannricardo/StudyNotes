

-- �W�hRULE: Define the rule for use in the database

CREATE RULE dbo.regioncode_rule AS @value IN ('IA','IL','KS','MO','NY','CA')
GO

--table

create table t4(id int, state varchar(2))

-- Bind the rule to a specific column in a table
EXEC sp_bindrule  regioncode_rule,	'dbo.t4.state'
GO

--test
insert into t4 values (101,'IL')     --OK
 
insert into t4 values (102,'WA')     --Error



--�T�� 513�A�h�� 16�A���A 0�A�� 1
--��Ʀ洡�J�Χ�s�P���e CREATE RULE ���z���ᤩ���W�h�Ĭ�C���z���w�����C
--�Ĭ�o�ͦb��Ʈw 'sample3'�A���--�� 'dbo.t4'�A��Ʀ� 'state'�C���z���w�g�����C

--bindrule �P CHECK��� (�e�̶�����q�ŧi, ��̤@���ŧi)


create table t5
( id    int, 
  state varchar(2)  check (state in ('IA','IL','KS','MO','NY','CA'))
)