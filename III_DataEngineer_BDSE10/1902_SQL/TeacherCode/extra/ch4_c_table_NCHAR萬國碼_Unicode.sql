--Unicode 萬國碼, 型態要 NCHAR, 新增要加 N' 開頭

drop table nchar_table;
go

create table nchar_table
(
   id   int,
   name nchar(20),
   cname char(20)
);

go

insert into nchar_table values (1, N'爱情厨房', N'爱情厨房');
insert into nchar_table values (2, N'澳大利亚', N'澳大利亚');
insert into nchar_table values (3, N'爱情厨房', N'爱情厨房');
insert into nchar_table values (4, N'战国英豪', N'战国英豪');
insert into nchar_table values (5, N'阿甘正传', N'阿甘正传');
insert into nchar_table values (6, N'阿飞正传', N'阿飞正传');
insert into nchar_table values (7,  '阿飞正传2', '亂碼看不到');
insert into nchar_table values (8, N'Giáp Văn Dương教授', 'Giáp Văn Dương教授');
insert into nchar_table values (9, N'甜點夢卡朵Mon Gâteau', N'甜點夢卡朵Mon Gâteau');
insert into nchar_table values (10, N'曾珦煊 陳惟喆 翁綉蕙', N'曾珦煊 陳惟喆 翁綉蕙');
go

select * from nchar_table;
go