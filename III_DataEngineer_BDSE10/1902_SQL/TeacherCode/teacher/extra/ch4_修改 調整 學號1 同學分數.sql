
--修改 調整 學號1 同學分數 + 2分

update course  
set score = score + 2
where id = 1

--Method 1 修改 調整 '許惠菁'  同學分數 + 2分
update course  
set score = score + 2
where id = ( select id 
             from student
			 where name = '許惠菁'
	   )

select * from course where id =1

--Method 2 修改 調整 '許惠菁'  同學分數 + 2分
update course 
set score = score + 2
FROM student s JOIN course c
ON s.id = c.id 
and s.name = '許惠菁'