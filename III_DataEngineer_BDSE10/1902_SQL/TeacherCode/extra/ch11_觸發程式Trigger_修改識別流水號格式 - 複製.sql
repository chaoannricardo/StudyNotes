--��s�W��Ʈɦ۰ʲ����ѧO identity�άy����, 
--�γz�LĲ�o�{�����լ��S�w�榡
--ex  1,2,3 -->  T10000001,  T10000002,  T10000003

--�ش��ժ��
create table T1
(id   int identity(1,1),    --�ѧO�y�����Ʀr
 sid  char(10),             --Ĳ�o�{�����ͤ��ѧO�y�����榡
 name varchar(10)
);
go


--�إ�Ĳ�o�{��
create trigger tri_t1
on T1
AFTER INSERT
AS
BEGIN
 declare @v_sid char(10);
 
 --���լy�����榡 �e���[  T1 �᭱�ɺ� 7��0 
 select @v_sid = 'T1'+ right('0000000'+convert(varchar(8), id),8)
 from INSERTED

 --�N���ծ榡�g�J��椤
 update T1 set sid = @v_sid FROM T1 JOIN INSERTED I
 ON T1.id = I.id
 
END;
go

--����
insert into T1(name) values ('PC1');
insert into T1(name) values ('PC2');
insert into T1(name) values ('PC3');

--�d

select * from T1;

1           T100000001 PC1
2           T100000002 PC2
3           T100000003 PC3
