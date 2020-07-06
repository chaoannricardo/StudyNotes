--於新增資料時自動產生識別 identity或流水號, 
--及透過觸發程式重組為特定格式
--ex  1,2,3 -->  T10000001,  T10000002,  T10000003

--建測試表格
create table T1
(id   int identity(1,1),    --識別流水號數字
 sid  char(20),             --觸發程式產生之識別流水號格式
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

--查
select * from T1;

--其它
insert into T1(name) values ('PC2');
insert into T1(name) values ('PC3');

--查
select * from T1;
go
/*
1           T100000001 PC1
2           T100000002 PC2
3           T100000003 PC3
*/

--延伸 2 
--建立觸發程式
alter  trigger tri_t1
on T1
AFTER INSERT
AS
BEGIN
 declare @v_sid char(20);
 
 --重組流水號格式 前面加  T1 後面補滿 7個0 
 select @v_sid =   CAST(datepart(yyyy,getdate()) AS varchar(4))+ right('0000000'+convert(varchar(6), id),6)
 from INSERTED

 --將重組格式寫入表格中
 update T1 set sid = @v_sid FROM T1 JOIN INSERTED I
 ON T1.id = I.id
 
END;
go
--測試
insert into T1(name) values ('PC4');
select * from T1;

--查

select * from T1;

/*
4           2017000002 PC4
*/

---延伸3 亂數
drop table T2
go

create table T2
(id   int default  CAST(round ((rand() *99999) +1 , 0) as int) , --rand數字
 sid  char(20)     primary key default '20170101000000',         --觸發程式產生之識別流水號格式
 name varchar(10)
);
go

/*

select cast(datename(year, getdate()) as varchar(4))  + cast(datepart(month, getdate()) as varchar(2))

select cast(getdate() as varchar(10))
select convert(  varchar(10) , getdate(), 111)

select  substring( convert(  varchar(10) , getdate(), 111),1,4) +
       substring( convert(  varchar(10) , getdate(), 111),6,2) +
	   substring( convert(  varchar(10) , getdate(), 111),9,2) 

go
*/

--2
create function convertd ( @v1 date )
returns varchar(8)
as
begin
  declare @v2 varchar(8)

  set  @v2 = substring( convert(  varchar(10) , @v1, 111),1,4) +
             substring( convert(  varchar(10) , @v1, 111),6,2) +
	        substring( convert(  varchar(10) , @v1, 111),9,2) 
   return @v2
end
go


--建立觸發程式
create  trigger tri_t2
on T2
AFTER INSERT
AS
BEGIN
 declare @v_sid char(20);
 
 --重組流水號格式 前面加  T1 後面補滿 7個0 
 select @v_sid =   dbo.convertd(getdate())+ right('00000'+convert(varchar(6), id),6)
 from INSERTED

 --將重組格式寫入表格中
 update T2 set sid = @v_sid FROM T2 JOIN INSERTED I
 ON T2.id = I.id
 
END;
go
--測試

--測試
insert into T2(name) values ('PC1');
select * from T2;

/*
81487	20171027081487      	PC1
*/