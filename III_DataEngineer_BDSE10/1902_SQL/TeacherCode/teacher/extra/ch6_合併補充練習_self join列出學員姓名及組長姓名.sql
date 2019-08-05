  
 
--ch5 extra
--列出學員姓名及組長姓名
  
/*

select s.id, s.name '組員姓名', s.tid, t.name '組長姓名'
from    student2 s JOIN student2 t
ON    s.tid = t.id
*/

/* output 
id  組員姓名 tid 組長姓名
--  -------- --- --------
1	陳廷     1	 陳廷                  
2	朱凱鴻   1	 陳廷                  
3	蒲怡仁   1	 陳廷                  
4	丁肇毅   1	 陳廷                  
5	曾佩萱   1	 陳廷                  
*/  

use DB01    --若 定序非 Chinese_Taiwan 則另建 DB
go

drop table student2;
go

create table student2
( id    int        PRIMARY KEY,   --學號
  name  nchar(20),                --姓名
  bdate date,
  tel   char(20),
  tid   int
);

 
insert into student2 values ( 1, '陳廷',  '1983-04-21','09205556781',1);
insert into student2 values ( 2, '朱凱鴻','1983-09-23','09205556789',1);
insert into student2 values ( 3, '蒲怡仁','1983-08-25','09205556785',1);
insert into student2 values ( 4, '丁肇毅','1983-07-27','09205556723',1);
insert into student2 values ( 5, '曾佩萱','1983-05-29','09205556889',1);
insert into student2 values ( 6, '王子睿','1983-06-22','09205556729',6);
insert into student2 values ( 7, '陳仕翰','1983-03-24','09205556726',6);
insert into student2 values ( 8, '陳聖豐','1983-01-26','09205556729',6);
insert into student2 values ( 9, '許寧芮','1983-02-28','09205556789',6);
insert into student2 values (10, '白孟玄','1983-11-20','09205556782',6);
insert into student2 values (11, '王興',  '1983-10-21','09205556729',11);
insert into student2 values (12, '陳良煒','1983-04-23','09205556389',11);
insert into student2 values (13, '黃琮文','1983-05-25','09205556728',11);
insert into student2 values (14, '賴偉凡','1983-07-23','09205556029',11);
insert into student2 values (15, '潘奕旬','1983-02-27','09205556783',11);
insert into student2 values (16, '蕭智謙','1983-04-23','09205556789',16);
insert into student2 values (17, '黃柏為','1983-06-29','09205556781',16);
insert into student2 values (18,N'顏?',  '1983-04-22','09205556780',16);
insert into student2 values (19, '蘇昱銘','1983-08-24','09205556789',16);
insert into student2 values (20, '林千雅','1983-04-26','09205556787',16);
insert into student2 values (21, '王彥智','1983-09-28','09205556089',21);
insert into student2 values (22, '孫如意','1983-04-20','09205556189',21);
insert into student2 values (23, '林佳頤','1983-05-25','09205556188',21);
go

select * from student2;

