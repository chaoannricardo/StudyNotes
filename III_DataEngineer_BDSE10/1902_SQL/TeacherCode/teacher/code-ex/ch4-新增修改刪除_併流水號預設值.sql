--ch4 DML
--1新增學員資料:  INSERT
INSERT INTO student VALUES ( 101 ,'李大同','1983-04-28' , '0920555678') ;

--新增部份欄位
INSERT INTO student( id, name )  VALUES( 102, '程幼青' );

--註 ch5 查詢學員資料:   
SELECT  *  FROM  student;


--新增常見的錯誤1  重複主鍵
INSERT INTO student VALUES ( 101 ,'李大同2','1983-04-28' , '0920555678') ;


--INSERT 2 新增學員成績資料:
insert  into  course  values (101, 'JAVA', 86);
insert  into  course  values (101, 'SQL' , 88);
insert  into  course  values (101, 'HTML', 90);
insert  into  course  values (102, 'JAVA', 90);
insert  into  course  values (102, 'SQL' , 92);
insert  into  course  values (102, 'HTML', 94);


--新增常見的錯誤2 找不到外部鍵
insert  into  course  values (199, 'JAVA', 94);

SELECT  *  FROM  student;
SELECT  *  FROM  course;

--2額外補充 一次新增多筆                         
drop table t1;
create table t1(id int, n char(20))  
go
                       
insert into t1 values (1,'aa'), 
                      (2,'bb'),
                      (3,'cc');

select * from t1;

-3a新增流水號,預設值 
use DB01
go
drop table shippers
go

create table Shippers(shipperid int identity,
                       company char(30) default 'abc',
                       phone   char(20) default '0920333555')
go
insert into shippers(company,phone  ) values('aaa', '0932556677')
insert into shippers(company,phone  ) values(default, default)
insert into shippers default values
go
select * from shippers
go

--查詢現有資料,準備更新

select * from student;
select * from course;

--更新資料

UPDATE  student 

SET     tel = '0928555777'

WHERE   id = 101 ;

 
--刪除

DELETE FROM course 
WHERE id = 102;


--新增、修改、刪除 – 常見錯誤

--1 違反 constraint : 刪除主表時, 參考到子表資料

DELETE FROM student WHERE id = 101;


--2 違反 constraint : 修改子表時, 參考到主表資料

UPDATE course SET  id = 199
WHERE  id =  101
                    
--truncate table 刪除所有資料

TRUNCATE TABLE course;


--額外補充
select * from shippers
go

--3b流水號強迫輸入

set IDENTITY_INSERT dbo.shippers ON
go

--須個別列出欄位名稱
insert into shippers (shipperid,company,phone)  values (80,'ccc','0955555555')
go

--錯誤- 未個別列出欄位名稱
/* 訊息 8101，層級 16，狀態 1，行 1
位於資料表 'Shippers' 的識別欄位其外顯值只有當使用了資料行清單
且 IDENTITY_INSERT 為 ON 時才能指定。
*/

insert into  shippers values(81,'ccc','0955555555')
go

select * from shippers
go

--3c回復成流水號輸入

set IDENTITY_INSERT dbo.shippers OFF
go
insert into shippers(company,phone  ) values('bbb', '0932556678')

--刪除一筆資料,再新增
delete from shippers where shipperid = 3

--3d再新增時, 該筆被刪除的流水號, 會重覆使用嗎
insert into shippers(company,phone  ) values(default, default)
select * from shippers
go


