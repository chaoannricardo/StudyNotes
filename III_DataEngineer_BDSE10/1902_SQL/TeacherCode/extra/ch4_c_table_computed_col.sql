
-- �ϥέp���Ʀ檺�B�⦡
--�� 1 �Q�� ((low + high)/2) �B�⦡�ӭp�� myavg �p���Ʀ�C


CREATE TABLE dbo.mytable 
( low   int, 
  high  int, 
  myavg AS (low + high)/2
) ;
GO


--����  �����J �p�����
insert into mytable values(10,20)
insert into mytable(low,high) values(20,30)

select * from mytable 
GO

--error
insert into mytable values(10,20,15)

--�T�� 213�A�h�� 16�A���A 1�A�� 1
--��Ʀ�W�٩δ��Ѫ��ƭȼƶq�P��ƪ�w�q���۲šC


--�� 2 �ϥέp���Ʀ檺 USER_NAME ���
--�U�C�d�ҷ|�ϥ� myuser_name ��Ʀ椤�� USER_NAME() ���

CREATE TABLE dbo.mylogintable
( date_in     datetime,
  user_id     int,
  myuser_name AS USER_NAME()
) ;
GO

--����
insert into mylogintable values('2009-12-08', 101)

select * from mylogintable
GO