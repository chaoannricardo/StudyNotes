-- student 學員資料表 
-- course  學員各科成績

--** 單純 23 學員中 每人考三科, 有一學員 3科都沒考 , 沒登記分數 非登記成 零分
--** 難一點則 10號學員只考兩科   這時 平均分數 就會有爭議

--ch5
--查出分數(score) 大於90分以上的學員(不管那一科)
--查出課程名稱(name) 為 JAVA 且分數(score) 介於85分及90分之間的學員 
--列出學員各科分數,從高到低排序(不管那一科)
--列出學員各科分數,先依課程名稱(name)排序, 相同名稱再依分數從高到低排列 

--ch6
--列出學員姓名及各科成績
--列出學員姓名及各科成績 (未參加考試的學員也要列出)

--ch7
--查出 平均 的分數是幾分 (不管那一科)
--依各科(name)分組, 列出各科(name)最高 的分數是幾分
--依學號(id)分組, 列出各人總分
--依學號(id)分組, 列出各人總分 大於 250 以上者  (列出學號,總分)

--ch8
--查出學員任一科分數大於總平均的有那些 (含學號,個人分數)
--依學號(id)分組, 計算學員總分最高者 (含學號,總分)

--進階
--ch67
--列出學員姓名及總分
--列出學員學號,姓名及總分
--查出學員總分數最高 (含姓名,總分)
--查出學員總分數最高 (含學號,姓名,總分)

--ch678
--查出學員任一科分數大於總平均的有那些 (含姓名,個人分數) 
--查出學員各科分數大於該科平均的有那些 (含姓名,個人分數) 

--ch9
--PIVOT 將學員各科成績轉成 PIVOT欄位 (含學號,[JAVA],[T-SQL],[電概]) 各科分數  )

--ch9 adv Subquery
--列出學員任一科分數及總平均分數 (含學號,個人分數,平均分數)
--查出學員任一科分數大於總平均的有那些 (含學號,個人分數,平均分數)



use DB01    --若 定序非 Chinese_Taiwan 則另建 DB

go

drop table course;
drop table student;
go

create table student
( id    int        PRIMARY KEY,   --學號
  name  nchar(20),                --姓名
  bdate date,
  tel   char(20)
);

create table course
( id    int     ,   --學號
  name  nchar(20),  --課名
  score int,        --分數
  FOREIGN KEY(id) REFERENCES student(id) 
);
go
insert into student values ( 1, '楊鎮安','1983-04-21','09205556781');
insert into student values ( 2, '林庭宇','1983-09-23','09205556789');
insert into student values ( 3, '趙上涵','1983-08-25','09205556785');
insert into student values ( 4, '繆謹仲','1983-07-27','09205556723');
insert into student values ( 5, '葉上豪','1983-05-29','09205556889');
insert into student values ( 6, '黃鈺麟','1983-06-22','09205556729');
insert into student values ( 7, '趙念瑤','1983-03-24','09205556726');
insert into student values ( 8, '李盈瑩','1983-01-26','09205556729');
insert into student values ( 9, '呂芝儀','1983-02-28','09205556789');
insert into student values (10, '施養欣','1983-11-20','09205556782');
insert into student values (11, '林嘉銘','1983-10-21','09205556729');
insert into student values (12, '吳蒨','1983-04-23','09205556389');
insert into student values (13, '簡欣正','1983-05-25','09205556728');
insert into student values (14, '吳岱凌','1983-07-23','09205556029');
insert into student values (15, '黃煜展','1983-02-27','09205556783');
insert into student values (16, '沈宥廷','1983-04-23','09205556789');
insert into student values (17, '蔡穎傑','1983-06-29','09205556781');
insert into student values (18, '黃靖','1983-04-22','09205556780');
insert into student values (19, '陳韻雯','1983-08-24','09205556789');
insert into student values (20, '蔡豫周','1983-04-26','09205556787');
insert into student values (21, '呂沛育','1983-09-28','09205556089');
insert into student values (22, '陳羿安','1983-04-20','09205556189');
insert into student values (23, '林杰煒','1983-05-25','09205556188');
go

insert into course values ( 1,'JAVA',85);
insert into course values ( 2,'JAVA',86);
insert into course values ( 3,'JAVA',80);
insert into course values ( 4,'JAVA',85);
insert into course values ( 5,'JAVA',75);
insert into course values ( 6,'JAVA',70);
insert into course values ( 7,'JAVA',92);
insert into course values ( 8,'JAVA',85);
insert into course values ( 9,'JAVA',83);
insert into course values (11,'JAVA',87);
insert into course values (12,'JAVA',85);
insert into course values (13,'JAVA',86);
insert into course values (14,'JAVA',85);
insert into course values (15,'JAVA',84);
insert into course values (16,'JAVA',75);
insert into course values (17,'JAVA',81);
insert into course values (18,'JAVA',85);
insert into course values (19,'JAVA',79);
insert into course values (20,'JAVA',85);
insert into course values (21,'JAVA',78);
insert into course values (22,'JAVA',85);

go

insert into course values ( 1,'電概',81);
insert into course values ( 2,'電概',80);
insert into course values ( 3,'電概',82);
insert into course values ( 4,'電概',84);
insert into course values ( 5,'電概',64);
insert into course values ( 6,'電概',83);
insert into course values ( 7,'電概',85);
insert into course values ( 8,'電概',87);
insert into course values ( 9,'電概',86);
insert into course values (10,'電概',85);
insert into course values (11,'電概',82);
insert into course values (12,'電概',81);
insert into course values (13,'電概',89);
insert into course values (14,'電概',85);
insert into course values (15,'電概',88);
insert into course values (16,'電概',87);
insert into course values (17,'電概',86);
insert into course values (18,'電概',85);
insert into course values (19,'電概',84);
insert into course values (20,'電概',82);
insert into course values (21,'電概',85);
insert into course values (22,'電概',81);
go

insert into course values ( 1,'T-SQL',85);
insert into course values ( 2,'T-SQL',85);
insert into course values ( 3,'T-SQL',80);
insert into course values ( 4,'T-SQL',85);
insert into course values ( 5,'T-SQL',85);
insert into course values ( 6,'T-SQL',83);
insert into course values ( 7,'T-SQL',85);
insert into course values ( 8,'T-SQL',82);
insert into course values ( 9,'T-SQL',91);
insert into course values (10,'T-SQL',85);
insert into course values (11,'T-SQL',85);
insert into course values (12,'T-SQL',87);
insert into course values (13,'T-SQL',85);
insert into course values (14,'T-SQL',85);
insert into course values (15,'T-SQL',86);
insert into course values (16,'T-SQL',85);
insert into course values (17,'T-SQL',85);
insert into course values (18,'T-SQL',89);
insert into course values (19,'T-SQL',85);
insert into course values (20,'T-SQL',88);
insert into course values (21,'T-SQL',85);
insert into course values (22,'T-SQL',84);
go

/* Unicode
insert into student values (24, N'黃瀞賢','1993-07-23','09206256029');
insert into student values (25, N'曾珦煊','1983-06-22','09205556789');
insert into student values (26, N'黃頎晧','1983-04-23','09207556789');
*/

select * from student;
select * from course;
