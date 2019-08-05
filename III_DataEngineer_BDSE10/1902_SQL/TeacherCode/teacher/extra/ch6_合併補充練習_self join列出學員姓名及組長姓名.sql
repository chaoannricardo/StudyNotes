  
 
--ch5 extra
--�C�X�ǭ��m�W�βժ��m�W
  
/*

select s.id, s.name '�խ��m�W', s.tid, t.name '�ժ��m�W'
from    student2 s JOIN student2 t
ON    s.tid = t.id
*/

/* output 
id  �խ��m�W tid �ժ��m�W
--  -------- --- --------
1	����     1	 ����                  
2	�����E   1	 ����                  
3	�Z�ɤ�   1	 ����                  
4	�B�F��   1	 ����                  
5	���ظ�   1	 ����                  
*/  

use DB01    --�Y �w�ǫD Chinese_Taiwan �h�t�� DB
go

drop table student2;
go

create table student2
( id    int        PRIMARY KEY,   --�Ǹ�
  name  nchar(20),                --�m�W
  bdate date,
  tel   char(20),
  tid   int
);

 
insert into student2 values ( 1, '����',  '1983-04-21','09205556781',1);
insert into student2 values ( 2, '�����E','1983-09-23','09205556789',1);
insert into student2 values ( 3, '�Z�ɤ�','1983-08-25','09205556785',1);
insert into student2 values ( 4, '�B�F��','1983-07-27','09205556723',1);
insert into student2 values ( 5, '���ظ�','1983-05-29','09205556889',1);
insert into student2 values ( 6, '���l��','1983-06-22','09205556729',6);
insert into student2 values ( 7, '���K��','1983-03-24','09205556726',6);
insert into student2 values ( 8, '���t��','1983-01-26','09205556729',6);
insert into student2 values ( 9, '�\��ͺ','1983-02-28','09205556789',6);
insert into student2 values (10, '�թs��','1983-11-20','09205556782',6);
insert into student2 values (11, '����',  '1983-10-21','09205556729',11);
insert into student2 values (12, '���}�m','1983-04-23','09205556389',11);
insert into student2 values (13, '���z��','1983-05-25','09205556728',11);
insert into student2 values (14, '�శ�Z','1983-07-23','09205556029',11);
insert into student2 values (15, '�﫳��','1983-02-27','09205556783',11);
insert into student2 values (16, '������','1983-04-23','09205556789',16);
insert into student2 values (17, '���f��','1983-06-29','09205556781',16);
insert into student2 values (18,N'�C?',  '1983-04-22','09205556780',16);
insert into student2 values (19, 'Ĭ�R��','1983-08-24','09205556789',16);
insert into student2 values (20, '�L�d��','1983-04-26','09205556787',16);
insert into student2 values (21, '���۴�','1983-09-28','09205556089',21);
insert into student2 values (22, '�]�p�N','1983-04-20','09205556189',21);
insert into student2 values (23, '�L���[','1983-05-25','09205556188',21);
go

select * from student2;

