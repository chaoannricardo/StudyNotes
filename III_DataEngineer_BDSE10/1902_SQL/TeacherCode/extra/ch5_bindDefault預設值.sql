--�إߤ@�� default �H today �� �t�ήɶ�

CREATE DEFAULT dbo.today AS  getdate()
GO

--�إߪ��
create table t3
(id int,
 d  date
)
                
-- Bind the default to a column �N default bind�� �����
EXEC sp_bindefault  N'dbo.today',  N'dbo.t3.d'
GO


--����

insert into t3(id) values (101)
select * from t3


--bindefault �P default ��� (�e�̶�����q�ŧi, ��̤@���ŧi)

create table t31 
(id int,
 d  date  default getdate()
)

