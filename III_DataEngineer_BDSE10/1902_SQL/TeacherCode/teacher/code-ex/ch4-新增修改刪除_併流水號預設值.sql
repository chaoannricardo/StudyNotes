--ch4 DML
--1�s�W�ǭ����:  INSERT
INSERT INTO student VALUES ( 101 ,'���j�P','1983-04-28' , '0920555678') ;

--�s�W�������
INSERT INTO student( id, name )  VALUES( 102, '�{���C' );

--�� ch5 �d�߾ǭ����:   
SELECT  *  FROM  student;


--�s�W�`�������~1  ���ƥD��
INSERT INTO student VALUES ( 101 ,'���j�P2','1983-04-28' , '0920555678') ;


--INSERT 2 �s�W�ǭ����Z���:
insert  into  course  values (101, 'JAVA', 86);
insert  into  course  values (101, 'SQL' , 88);
insert  into  course  values (101, 'HTML', 90);
insert  into  course  values (102, 'JAVA', 90);
insert  into  course  values (102, 'SQL' , 92);
insert  into  course  values (102, 'HTML', 94);


--�s�W�`�������~2 �䤣��~����
insert  into  course  values (199, 'JAVA', 94);

SELECT  *  FROM  student;
SELECT  *  FROM  course;

--2�B�~�ɥR �@���s�W�h��                         
drop table t1;
create table t1(id int, n char(20))  
go
                       
insert into t1 values (1,'aa'), 
                      (2,'bb'),
                      (3,'cc');

select * from t1;

-3a�s�W�y����,�w�]�� 
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

--�d�߲{�����,�ǳƧ�s

select * from student;
select * from course;

--��s���

UPDATE  student 

SET     tel = '0928555777'

WHERE   id = 101 ;

 
--�R��

DELETE FROM course 
WHERE id = 102;


--�s�W�B�ק�B�R�� �V �`�����~

--1 �H�� constraint : �R���D���, �ѦҨ�l����

DELETE FROM student WHERE id = 101;


--2 �H�� constraint : �ק�l���, �ѦҨ�D����

UPDATE course SET  id = 199
WHERE  id =  101
                    
--truncate table �R���Ҧ����

TRUNCATE TABLE course;


--�B�~�ɥR
select * from shippers
go

--3b�y�����j����J

set IDENTITY_INSERT dbo.shippers ON
go

--���ӧO�C�X���W��
insert into shippers (shipperid,company,phone)  values (80,'ccc','0955555555')
go

--���~- ���ӧO�C�X���W��
/* �T�� 8101�A�h�� 16�A���A 1�A�� 1
����ƪ� 'Shippers' ���ѧO����~��ȥu����ϥΤF��Ʀ�M��
�B IDENTITY_INSERT �� ON �ɤ~����w�C
*/

insert into  shippers values(81,'ccc','0955555555')
go

select * from shippers
go

--3c�^�_���y������J

set IDENTITY_INSERT dbo.shippers OFF
go
insert into shippers(company,phone  ) values('bbb', '0932556678')

--�R���@�����,�A�s�W
delete from shippers where shipperid = 3

--3d�A�s�W��, �ӵ��Q�R�����y����, �|���Шϥζ�
insert into shippers(company,phone  ) values(default, default)
select * from shippers
go


