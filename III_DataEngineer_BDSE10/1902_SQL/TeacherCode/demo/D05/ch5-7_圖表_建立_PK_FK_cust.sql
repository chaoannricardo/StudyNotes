--�Ϫ�ƫ��cust PK (�k�� ��ƪ�W/�]�p/�k����� �� �]�w�D������ ���I �ֱ��C �������_��/ �I �x�s(�\���� �ϺФ��ϥ�) )

create table cust2
(
  cno   int  NOT NULL,
  name char(10)
);

--�Ϫ�ƫ�[ FK (�k�� ��ƪ�W/�]�p/�k����� �� ���p�� ���I �ֱ��C ���p�� �ϥ� )
--�I �[�J / ��ƪ�θ�Ʀ�W�� / �I "..." �i�} /�]�w�D�� �Τl������ݩ�
--�]�w ON DELETE CASCADE: �I INSERT �� UPDATE �W�� / �R���W�h / �U�� �� "���|���"
--���W�\��� : �����x�s (�ϺФ� �ϥ�)

create table ord2
(ordno  int  primary key,
 qty    int  check(qty >= 10),
 cno    int  
 )

--�q��Ʈw�Ϫ�ƫ��cust PK / FK
--�k�� �q��Ʈw�Ϫ� / �s�W��Ʈw�Ϫ� / Ctrl + Click �ƿ� �h�Ӹ�ƪ�
--  **�Y�X�{AUTHORIAZATION .�h�̰T������,�b��Ʈw/�ݩ� /�ɮ� / ���w�֦��� �p sa
--�I cust / (�k����� �� �]�w�D������)

create table cust3
(
  cno   int  NOT NULL,
  name char(10)
);

--�q��Ʈw�Ϫ�ƫ�[ FK (��� FK��� �� PK���, �Υk����� �� ���p��/ �x�s )

create table ord3
(ordno  int  primary key,
 qty    int  check(qty >= 10),
 cno    int  
 )

--�q�q��Ʈw �إߪ��
--�ۦ�q�ϫ������m��

--���ո�� �ۦ�ק�
 
 insert into cust2 values (101,'�i�T')
 insert into cust2 values (102,'���|')
 
 insert into ord2 values (1, 15, 101)
 insert into ord2 values (2, 12, 102)
 
 insert into ord2 values (3, 12, 109); --error
 
 select * from cust2
 select * from ord2
 
 
 