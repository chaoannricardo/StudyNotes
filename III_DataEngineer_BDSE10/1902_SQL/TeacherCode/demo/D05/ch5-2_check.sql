--check 
--�� 1
create table ck1
(  id int ,
   qty  int  check (qty >=10)
  )

--ok
insert into ck1 values(101, 25)

--not ok
insert into ck1 values(102, 5)

/*
�T�� 547�A�h�� 16�A���A 0�A�� 1
INSERT ���z���P CHECK ������� "CK__ck1__qty__1367E606" �Ĭ�C�Ĭ�o�ͦb��Ʈw "sample2"�A��ƪ� "dbo.ck1", column 'qty'�C
���z���w�g�����C
*/

--�� 2 �[ Constraint name
create table ck11
(  id int ,
   qty  int  constraint ck_ck11_qty_greater_than_10 check (qty >=10)
)
go

--not ok
insert into ck11 values(102, 5)

/*
�T�� 547�A�h�� 16�A���A 0�A�� 2
INSERT ���z���P CHECK ������� "ck_ck11_qty_greater_than_10" �Ĭ�C�Ĭ�o�ͦb��Ʈw "sample2"�A��ƪ� "dbo.ck11", column 'qty'�C
���z���w�g�����C
*/


--�d�� check �]�w
sp_help ck1
