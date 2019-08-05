--��3-1 �ا�table ��, �A�ק�[ PRIMARY KEY , ����춷 NOT NULL

create table dep4
( id    INT  NOT NULL,
  name  char(10)  
);

--�H ALTER TABLE �[ ����
ALTER TABLE dep4
   ADD CONSTRAINT PK_dep4 PRIMARY KEY(id)
	
GO

--��3-2 �ا�table ��, �A�ק�[ FOREIGN KEY

create table emp4
(eno   INT      PRIMARY KEY,
 name  CHAR(10),
 dno   INT  
)
GO
 
alter  table emp4  add constraint fk_emp4_id FOREIGN KEY(dno) REFERENCES dep4(id) ON DELETE CASCADE
go
 
/* ���table�N���K�ŧi����
create table emp4
(eno   INT      PRIMARY KEY,
 name  CHAR(10),
 dno   INT      FOREIGN KEY REFERENCES dep4(id) ON DELETE CASCADE
 )
*/
 
--����
 insert into dep4 values(10,'�H��')
 insert into dep4 values(20,'�~��')
 
 insert into emp4 values(101,'�i�T', 10);
 insert into emp4 values(102,'���|', 20);
 insert into emp4 values(103,'�i�T', 99); --error 
 insert into emp4 values(103,'�i�T', 10); --OK
 
 delete from dep4 where id = 10 ;       --OK 

 select * from dep4
 select * from emp4
 

---- �B�~�ɥR
--��3-2 �ƫ�[ PRIMARY KEY , ����춷 NOT NULL
create table dep5
( id    INT  ,
  name  char(10)  
);

--�L�k�b��ƪ� 'dep5' �����i�� Null ����Ʀ�W�w�q PRIMARY KEY ��������C
--�T�� 1750�A�h�� 16�A���A 0�A�� 1
--�L�k�إ߱�������C�Ьd�ݥ��e�����~�C

alter table dep5 alter column id int not null
GO

ALTER TABLE dep5
   ADD CONSTRAINT PK_dep5 PRIMARY KEY(id)

--�R�� PK

alter table dep5 drop constraint pk_dep5
	


-- �B�~�ɥR, �����e�@�d�� cust , ord �ŧi PK FK
 

--�إߪ��ɴN�[ PRIMARY KEY ,�S�[����W��, �|�۰ʳ]�� NOT NULL
create table dep2
( id    INT PRIMARY KEY,
  name  char(10)  
);

--����
insert into dep2 values(10,'�H��');
insert into dep2 values(20,'�~��');
insert into dep2 values(10,'�|�p');  --�H�ϳW�h PK
insert into dep2 values(30,'�|�p');  --��

select * from dep2


--�d�� �������H�� constraint_keys,����constraint_type  �W�� constraint_name
sp_help dep2


--��2 �إ� PRIMARY KEY ,�[����W��
create table dep3
( id    INT      constraint pk_dep3_id PRIMARY KEY,
  name  char(10)  
);

--����
insert into dep3 values(10,'�H��');
insert into dep3 values(20,'�~��');
insert into dep3 values(10,'�|�p');  --�H�ϳW�h PK , �ۭq�W��

select * from dep3

