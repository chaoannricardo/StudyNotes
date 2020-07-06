--會員 member2

create table member2
( mno   int primary key,
  name  char(20)
);


--互加好友 friend
create table friend
(  mno  int references member2(mno),
   fmno int references member2(mno)
);

insert into member2  values ( 101,'張三');
insert into member2  values ( 102,'李四');
insert into member2  values ( 103,'王五');
--
insert into friend  values (101, 102);
insert into friend  values (101, 103);
insert into friend  values (102, 101);
insert into friend  values (103, 101);
--error
insert into friend  values (103, 104);
insert into friend  values (104, 101);

--

select * from member2;
--select * from prod;
select * from friend;


--列出好友資料

select *
from  member2 m  JOIN  friend  f
ON    m.mno = f.mno
JOIN  member2  fm
ON    f.fmno = fm.mno


----------------------------
--產品資料表 prod2

create table prod2
(  ino   int primary key,
   smno  int references member2(mno),
   pname char(20),
   price int,
   bmno  int references member2(mno)
);

insert into  prod2  values ( 1, 101, 'p1', 100, 102);
insert into  prod2  values ( 2, 101, 'p1', 110, 103);

--列出賣物品會員及購買人list member name and buyername
--拍賣人及購買人 ,一樣物品只有一購買人

select *
from   member2 m JOIN  prod2  p
ON     m.mno = p.smno
JOIN   member2 bm
ON     p.bmno = bm.mno

