--T_SQL  Lab

--Lab 4��ƪ��s�W�B�ק�B�R��

--2.	Add the first row of data to the MY_EMPLOYEE table from the following sample data. Do not list the columns in the INSERT clause.
  -- �s�WINSERT�@����ƨ�MY_EMPLOYEE ��ƪ�, �p���u�s��ID 3,�m�Wlast_name: Dancs ;���n�C�X���W��
insert into MY_EMPLOYEE (id, last_name) values(3, 'Dancs')

--3.	Confirm your addition to the table
    --�T�{��Ƥv�s�W�� ��椤(�Y �d�� ��ƪ�)

select *
from my_employee
 

--4.	Change the last name of employee 3 to Drexler.
  --  �ק�UPDATE���u�s��(employee_id) 3 �����u�m�Wlast_name�� Drexler

update MY_EMPLOYEE 
set LAST_NAME = 'Drexler'
where ID = 3

--5.	Delete Drexler from the MY_EMPLOYEE table.
   -- �R�� ���u�m�Wlast_name�� Drexler�����u���

   delete from MY_EMPLOYEE
   where LAST_NAME = 'Drexler'

--6.	Empty the entire table.
  --  �R�� MY_EMPLOYEE��椤�Ҧ�����ƦC

  truncate table MY_EMPLOYEE

--Lab 9�ɥR �i��SQL���O ����
 --�Ѧ� ���q�d��
