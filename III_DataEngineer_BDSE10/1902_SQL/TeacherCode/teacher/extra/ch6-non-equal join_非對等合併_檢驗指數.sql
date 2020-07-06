/*����"���^����!? 
1. health Checkup.(���d�ˬd)
2. physical examination.(�����ˬd)
3. medical inspection.(����ˬd)
  �H�W���i�ΨӰ���"����"�����k
  ���L�Ѭ�����ߺD�� health checkup.�]������f�y��
  ��physical examination������M�~�λy�F.

  ���綵��	���`��
����y�p��(RBC)	�k�ʡG(4.0~5.5)��1012/L (400~500�U/ul)
�k�ʡG(3.5~5.0)��1012/L(350~500�U/ul)
����J��(Hb)	�k�ʡG120~160g/L�@(12~16g/dl)
�k�ʡG110~150g/L�@(11~15g/dl)
�զ�y�p��(WBC)	(4.0~10.0)X109/L�@ 4000~10,000/ul
�զ�y�����p��	�@�@�@�@ �@�@ �@�@�@�@ �@�@�@�@ �@�@ �@�@�@�@�@ �@�@ �@�@�@�@�@ �@�@
�ݤ��ʱa���y	3~5%
�ݤ��ʦh�ֲy	50~70%
�ݻį��h�ֲy	0.5~5%
���P�ʦh�ֲy	0~6%
�O�ڲy	20~35%
��ֲy	1~8%

*/


--²����1 case 

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

insert into healthcheckup values (101,  '�զ�y�p��', 5);
insert into healthcheckup values (102,  '�զ�y�p��', 3);
insert into healthcheckup values (103,  '�զ�y�p��', 12);

insert into healthcheckup values (104,  '�զ�y�p��', 6);
insert into healthcheckup values (105,  '�զ�y�p��', 2);
insert into healthcheckup values (106,  '�զ�y�p��', 15);


insert into healthcheckup values (107, '����y�p��', 5);
insert into healthcheckup values (108, '����y�p��', 3);
insert into healthcheckup values (109, '����y�p��', 12);

insert into healthcheckup values (110, '����y�p��', 4);
insert into healthcheckup values (111, '����y�p��', 2);
insert into healthcheckup values (112, '����y�p��', 15);

insert into rangecheck values ('����y�p��', 4, 6,  '���`');
insert into rangecheck values ('�զ�y�p��', 4, 10,  '���`');

---

select * from   healthcheckup;
/*
101	�զ�y�p��	5
102	�զ�y�p��	3
103	�զ�y�p��	12
104	�զ�y�p��	6
*/

select  * from    rangecheck;
/*
����y�p��	4	6	���`                
�զ�y�p��	4	10	���`                
*/
--
select h.pid,  h.item, h.value,  case when h.value  > r.low and h.value <= r.high then '���`'
                                      else '�����`'
                                 end, 
       r.low, r.high
from  healthcheckup h JOIN rangecheck r
ON  h.item = r.item    
--where h.pid = 101
order by h.pid


/* output
101	�զ�y�p��	5	���`	4	10
102	�զ�y�p��	3	�����`	4	10
103	�զ�y�p��	12	�����`	4	10
104	�զ�y�p��	6	���`	4	10
105	�զ�y�p��	2	�����`	4	10
106	�զ�y�p��	15	�����`	4	10
107	����y�p��	5	���`	4	6
108	����y�p��	3	�����`	4	6
109	����y�p��	12	�����`	4	6
110	����y�p��	4	�����`	4	6
111	����y�p��	2	�����`	4	6
112	����y�p��	15	�����`	4	6

*/
---²����2


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

insert into healthcheckup values (101,  '�զ�y�p��', 5);
insert into healthcheckup values (102,  '�զ�y�p��', 3);
insert into healthcheckup values (103,  '�զ�y�p��', 12);

insert into healthcheckup values (104,  '�զ�y�p��', 6);
insert into healthcheckup values (105,  '�զ�y�p��', 2);
insert into healthcheckup values (106,  '�զ�y�p��', 15);


insert into healthcheckup values (107, '����y�p��', 5);
insert into healthcheckup values (108, '����y�p��', 3);
insert into healthcheckup values (109, '����y�p��', 12);

insert into healthcheckup values (110, '����y�p��', 4);
insert into healthcheckup values (111, '����y�p��', 2);
insert into healthcheckup values (112, '����y�p��', 15);

insert into rangecheck values ('����y�p��', 4, 6,  '���`');
insert into rangecheck values ('����y�p��', 1, 4,  '�����`-�L�C');
insert into rangecheck values ('����y�p��', 6, 100,'�����`-�L��');

insert into rangecheck values ('�զ�y�p��', 4, 10,  '���`');
insert into rangecheck values ('�զ�y�p��', 1, 4,   '�����`-�L�C');
insert into rangecheck values ('�զ�y�p��', 10, 100,'�����`-�L��');

---

select * from   healthcheckup;
/*
101	�զ�y�p��	5
102	�զ�y�p��	3
103	�զ�y�p��	12
*/
select  * from    rangecheck;
/*
�զ�y�p��	4	10	���`                
�զ�y�p��	1	4	�����`-�L�C         
�զ�y�p��	10	100	�����`-�L��         
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
101	�զ�y�p��	5	���`                	4	10
102	�զ�y�p��	3	�����`-�L�C         	1	4
103	�զ�y�p��	12	�����`-�L��         	10	100
*/



---�W�[�ʧO
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

insert into healthcheckup values (101, '�k', '�զ�y�p��', 5);
insert into healthcheckup values (102, '�k', '�զ�y�p��', 3);
insert into healthcheckup values (103, '�k', '�զ�y�p��', 12);

insert into healthcheckup values (104, '�k', '�զ�y�p��', 6);
insert into healthcheckup values (105, '�k', '�զ�y�p��', 2);
insert into healthcheckup values (106, '�k', '�զ�y�p��', 15);


insert into healthcheckup values (107, '�k', '����y�p��', 5);
insert into healthcheckup values (108, '�k', '����y�p��', 3);
insert into healthcheckup values (109, '�k', '����y�p��', 12);

insert into healthcheckup values (110, '�k', '����y�p��', 4);
insert into healthcheckup values (111, '�k', '����y�p��', 2);
insert into healthcheckup values (112, '�k', '����y�p��', 15);

insert into rangecheck values ('����y�p��', '�k', 4, 6,'���`');
insert into rangecheck values ('����y�p��', '�k', 1, 4,'�����`-�L�C');
insert into rangecheck values ('����y�p��', '�k', 5, 100,'�����`-�L��');

insert into rangecheck values ('����y�p��', '�k', 3, 5,'���`');
insert into rangecheck values ('����y�p��', '�k', 1, 3,'�����`-�L�C');
insert into rangecheck values ('����y�p��', '�k', 5, 100,'�����`-�L��');

insert into rangecheck values ('�զ�y�p��', '�k', 4, 10,'���`');
insert into rangecheck values ('�զ�y�p��', '�k', 1, 4,'�����`-�L�C');
insert into rangecheck values ('�զ�y�p��', '�k', 10, 100,'�����`-�L��');

insert into rangecheck values ('�զ�y�p��', '�k', 4, 10,'���`');
insert into rangecheck values ('�զ�y�p��', '�k', 1, 4,'�����`-�L�C');
insert into rangecheck values ('�զ�y�p��', '�k', 10, 100,'�����`-�L��');

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
101	�k	�զ�y�p��	5	���`                	4	10
102	�k	�զ�y�p��	3	�����`-�L�C         	1	4
103	�k	�զ�y�p��	12	�����`-�L��         	10	100
104	�k	�զ�y�p��	6	���`                	4	10
105	�k	�զ�y�p��	2	�����`-�L�C         	1	4
106	�k	�զ�y�p��	15	�����`-�L��         	10	100
107	�k	����y�p��	5	���`                	4	6
108	�k	����y�p��	3	�����`-�L�C         	1	4
109	�k	����y�p��	12	�����`-�L��         	5	100
110	�k	����y�p��	4	���`                	3	5
111	�k	����y�p��	2	�����`-�L�C         	1	3
112	�k	����y�p��	15	�����`-�L��         	5	100
*/
