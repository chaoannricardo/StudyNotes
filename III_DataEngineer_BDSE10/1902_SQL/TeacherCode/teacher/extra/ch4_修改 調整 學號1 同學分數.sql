
--�ק� �վ� �Ǹ�1 �P�Ǥ��� + 2��

update course  
set score = score + 2
where id = 1

--Method 1 �ק� �վ� '�\�f��'  �P�Ǥ��� + 2��
update course  
set score = score + 2
where id = ( select id 
             from student
			 where name = '�\�f��'
	   )

select * from course where id =1

--Method 2 �ק� �վ� '�\�f��'  �P�Ǥ��� + 2��
update course 
set score = score + 2
FROM student s JOIN course c
ON s.id = c.id 
and s.name = '�\�f��'