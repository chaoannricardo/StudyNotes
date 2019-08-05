--於新增資料時自動產生識別 identity或流水號, 
--及透過觸發程式重組為特定格式
--ex  1,2,3 -->  T10000001,  T10000002,  T10000003

--建測試表格
create table T1
(id   int identity(1,1),    --識別流水號數字
 sid  char(10),             --觸發程式產生之識別流水號格式
 name varchar(10)
);
go


--建立觸發程式
create trigger tri_t1
on T1
AFTER INSERT
AS
BEGIN
 declare @v_sid char(10);
 
 --重組流水號格式 前面加  T1 後面補滿 7個0 
 select @v_sid = 'T1'+ right('0000000'+convert(varchar(8), id),8)
 from INSERTED

 --將重組格式寫入表格中
 update T1 set sid = @v_sid FROM T1 JOIN INSERTED I
 ON T1.id = I.id
 
END;
go

--測試
insert into T1(name) values ('PC1');
insert into T1(name) values ('PC2');
insert into T1(name) values ('PC3');

--查

select * from T1;

1           T100000001 PC1
2           T100000002 PC2
3           T100000003 PC3
