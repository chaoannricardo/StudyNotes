/*砰浪"璣ゅ或弧!? 
1. health Checkup.(胺眃浪琩)
2. physical examination.(ō砰浪琩)
3. medical inspection.(洛厩浪琩)
  常ノㄓ暗"砰浪"弧猭
  ぃ筁ρゑ耕策篋弧 health checkup.ゑ耕粂て
  τphysical examinationゑ耕熬盡穨ノ粂.

  浪喷兜ヘ	タ盽
﹀瞴璸计(RBC)	╧┦(4.0~5.5)⊙1012/L (400~500窾/ul)
┦(3.5~5.0)⊙1012/L(350~500窾/ul)
﹀矹フ(Hb)	╧┦120~160g/L(12~16g/dl)
┦110~150g/L(11~15g/dl)
フ﹀瞴璸计(WBC)	(4.0~10.0)X109/L 4000~10,000/ul
フ﹀瞴だ摸璸计	        
遁い┦盿瞴	3~5%
遁い┦瞴	50~70%
遁荒瞴	0.5~5%
遁芇┦瞴	0~6%
睴ぺ瞴	20~35%
虫瞴	1~8%

*/


--虏1 case 

drop table rangecheck;
drop table healthcheckup;
go
create table healthcheckup
( pid    int,
  item  varchar(20),
  value int
)
go

create table rangecheck
(  item  varchar(20),
   low   int,
   high  int,
   level char(20)
)
go

insert into healthcheckup values (101,  'フ﹀瞴璸计', 5);
insert into healthcheckup values (102,  'フ﹀瞴璸计', 3);
insert into healthcheckup values (103,  'フ﹀瞴璸计', 12);

insert into healthcheckup values (104,  'フ﹀瞴璸计', 6);
insert into healthcheckup values (105,  'フ﹀瞴璸计', 2);
insert into healthcheckup values (106,  'フ﹀瞴璸计', 15);


insert into healthcheckup values (107, '﹀瞴璸计', 5);
insert into healthcheckup values (108, '﹀瞴璸计', 3);
insert into healthcheckup values (109, '﹀瞴璸计', 12);

insert into healthcheckup values (110, '﹀瞴璸计', 4);
insert into healthcheckup values (111, '﹀瞴璸计', 2);
insert into healthcheckup values (112, '﹀瞴璸计', 15);

insert into rangecheck values ('﹀瞴璸计', 4, 6,  'タ盽');
insert into rangecheck values ('フ﹀瞴璸计', 4, 10,  'タ盽');

---

select * from   healthcheckup;
/*
101	フ﹀瞴璸计	5
102	フ﹀瞴璸计	3
103	フ﹀瞴璸计	12
104	フ﹀瞴璸计	6
*/

select  * from    rangecheck;
/*
﹀瞴璸计	4	6	タ盽                
フ﹀瞴璸计	4	10	タ盽                
*/
--
select h.pid,  h.item, h.value,  case when h.value  > r.low and h.value <= r.high then 'タ盽'
                                      else 'ぃタ盽'
                                 end, 
       r.low, r.high
from  healthcheckup h JOIN rangecheck r
ON  h.item = r.item    
--where h.pid = 101
order by h.pid


/* output
101	フ﹀瞴璸计	5	タ盽	4	10
102	フ﹀瞴璸计	3	ぃタ盽	4	10
103	フ﹀瞴璸计	12	ぃタ盽	4	10
104	フ﹀瞴璸计	6	タ盽	4	10
105	フ﹀瞴璸计	2	ぃタ盽	4	10
106	フ﹀瞴璸计	15	ぃタ盽	4	10
107	﹀瞴璸计	5	タ盽	4	6
108	﹀瞴璸计	3	ぃタ盽	4	6
109	﹀瞴璸计	12	ぃタ盽	4	6
110	﹀瞴璸计	4	ぃタ盽	4	6
111	﹀瞴璸计	2	ぃタ盽	4	6
112	﹀瞴璸计	15	ぃタ盽	4	6

*/
---虏2


drop table rangecheck;
drop table healthcheckup;
go
create table healthcheckup
( pid    int,
  item  varchar(20),
  value int
)
go

create table rangecheck
(  item  varchar(20),
   low   int,
   high  int,
   level char(20)
)
go

insert into healthcheckup values (101,  'フ﹀瞴璸计', 5);
insert into healthcheckup values (102,  'フ﹀瞴璸计', 3);
insert into healthcheckup values (103,  'フ﹀瞴璸计', 12);

insert into healthcheckup values (104,  'フ﹀瞴璸计', 6);
insert into healthcheckup values (105,  'フ﹀瞴璸计', 2);
insert into healthcheckup values (106,  'フ﹀瞴璸计', 15);


insert into healthcheckup values (107, '﹀瞴璸计', 5);
insert into healthcheckup values (108, '﹀瞴璸计', 3);
insert into healthcheckup values (109, '﹀瞴璸计', 12);

insert into healthcheckup values (110, '﹀瞴璸计', 4);
insert into healthcheckup values (111, '﹀瞴璸计', 2);
insert into healthcheckup values (112, '﹀瞴璸计', 15);

insert into rangecheck values ('﹀瞴璸计', 4, 6,  'タ盽');
insert into rangecheck values ('﹀瞴璸计', 1, 4,  'ぃタ盽-筁');
insert into rangecheck values ('﹀瞴璸计', 6, 100,'ぃタ盽-筁蔼');

insert into rangecheck values ('フ﹀瞴璸计', 4, 10,  'タ盽');
insert into rangecheck values ('フ﹀瞴璸计', 1, 4,   'ぃタ盽-筁');
insert into rangecheck values ('フ﹀瞴璸计', 10, 100,'ぃタ盽-筁蔼');

---

select * from   healthcheckup;
/*
101	フ﹀瞴璸计	5
102	フ﹀瞴璸计	3
103	フ﹀瞴璸计	12
*/
select  * from    rangecheck;
/*
フ﹀瞴璸计	4	10	タ盽                
フ﹀瞴璸计	1	4	ぃタ盽-筁         
フ﹀瞴璸计	10	100	ぃタ盽-筁蔼         
*/

--
select h.pid,  h.item, h.value, r.level, r.low, r.high
from  healthcheckup h JOIN rangecheck r
ON  h.item = r.item     and 
	h.value  > r.low and  
	h.value <= r.high
--where h.pid = 101
order by h.pid

/* output
101	フ﹀瞴璸计	5	タ盽                	4	10
102	フ﹀瞴璸计	3	ぃタ盽-筁         	1	4
103	フ﹀瞴璸计	12	ぃタ盽-筁蔼         	10	100
*/



---糤┦
drop table rangecheck;
drop table healthcheckup;
go
create table healthcheckup
( pid    int,
  gender char(2),
  item  varchar(20),
  value int
)
go

create table rangecheck
(  item  varchar(20),
   gender char(2),
   low   int,
   high  int,
   level char(20)
)
go

insert into healthcheckup values (101, '╧', 'フ﹀瞴璸计', 5);
insert into healthcheckup values (102, '╧', 'フ﹀瞴璸计', 3);
insert into healthcheckup values (103, '╧', 'フ﹀瞴璸计', 12);

insert into healthcheckup values (104, '', 'フ﹀瞴璸计', 6);
insert into healthcheckup values (105, '', 'フ﹀瞴璸计', 2);
insert into healthcheckup values (106, '', 'フ﹀瞴璸计', 15);


insert into healthcheckup values (107, '╧', '﹀瞴璸计', 5);
insert into healthcheckup values (108, '╧', '﹀瞴璸计', 3);
insert into healthcheckup values (109, '╧', '﹀瞴璸计', 12);

insert into healthcheckup values (110, '', '﹀瞴璸计', 4);
insert into healthcheckup values (111, '', '﹀瞴璸计', 2);
insert into healthcheckup values (112, '', '﹀瞴璸计', 15);

insert into rangecheck values ('﹀瞴璸计', '╧', 4, 6,'タ盽');
insert into rangecheck values ('﹀瞴璸计', '╧', 1, 4,'ぃタ盽-筁');
insert into rangecheck values ('﹀瞴璸计', '╧', 5, 100,'ぃタ盽-筁蔼');

insert into rangecheck values ('﹀瞴璸计', '', 3, 5,'タ盽');
insert into rangecheck values ('﹀瞴璸计', '', 1, 3,'ぃタ盽-筁');
insert into rangecheck values ('﹀瞴璸计', '', 5, 100,'ぃタ盽-筁蔼');

insert into rangecheck values ('フ﹀瞴璸计', '╧', 4, 10,'タ盽');
insert into rangecheck values ('フ﹀瞴璸计', '╧', 1, 4,'ぃタ盽-筁');
insert into rangecheck values ('フ﹀瞴璸计', '╧', 10, 100,'ぃタ盽-筁蔼');

insert into rangecheck values ('フ﹀瞴璸计', '', 4, 10,'タ盽');
insert into rangecheck values ('フ﹀瞴璸计', '', 1, 4,'ぃタ盽-筁');
insert into rangecheck values ('フ﹀瞴璸计', '', 10, 100,'ぃタ盽-筁蔼');

---

select * from   healthcheckup;
select  * from    rangecheck;

--
select h.pid, h.gender, h.item, h.value, r.level, r.low, r.high
from  healthcheckup h JOIN rangecheck r
ON  h.item = r.item     and 
    h.gender = r.gender and
	h.value  > r.low and  
	h.value <= r.high
--where h.pid = 101
order by h.pid


/*  output
101	╧	フ﹀瞴璸计	5	タ盽                	4	10
102	╧	フ﹀瞴璸计	3	ぃタ盽-筁         	1	4
103	╧	フ﹀瞴璸计	12	ぃタ盽-筁蔼         	10	100
104		フ﹀瞴璸计	6	タ盽                	4	10
105		フ﹀瞴璸计	2	ぃタ盽-筁         	1	4
106		フ﹀瞴璸计	15	ぃタ盽-筁蔼         	10	100
107	╧	﹀瞴璸计	5	タ盽                	4	6
108	╧	﹀瞴璸计	3	ぃタ盽-筁         	1	4
109	╧	﹀瞴璸计	12	ぃタ盽-筁蔼         	5	100
110		﹀瞴璸计	4	タ盽                	3	5
111		﹀瞴璸计	2	ぃタ盽-筁         	1	3
112		﹀瞴璸计	15	ぃタ盽-筁蔼         	5	100
*/
