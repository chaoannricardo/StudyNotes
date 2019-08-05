--��cust �Ȥ�D�� PK in column level

create table cust
(
  cno   int      primary key,
  name  char(10)
);

--�� �Ȥ�D�� PK in table level
create table cust2
(
  cno   int,
  name  char(10),
  primary key(cno)
);

--�� ord�q��l�� �[ FK

create table ord
(ordno  int  primary key,
 qty    int  check(qty >= 10),
 cno    int  foreign key references cust(cno)
 )
 
--����
insert into cust values (101,'�i�T');
insert into cust values (102,'���|');
 
insert into ord values (1, 15, 101);
insert into ord values (2, 12, 102);
 
insert into ord values (3, 12, 109); --error ���s�b���Ȥ�
 
select * from cust
select * from ord

--�R���D���� �] �l�����, ���D�l�� FK�]�� ON DELETE CASCADE

delete from cust where cno=101 
 
 