--PIVOT �N�ǭ��U�즨�Z�ন PIVOT��� (�t�Ǹ�,�U����� 3�����)

select * from course  order by id

--PIVOT
SELECT * 
FROM  course 
PIVOT (SUM(score) FOR name IN ([JAVA],[T-SQL],[�q��])) PVT

--����PIVOT             
select id, CASE name when 'JAVA' then score END  'JAVA',
           CASE name when 'T-SQL' then score END 'T-SQL',
		   CASE name when '�q��' then score END  '�q��'
from course  order by id

select id, SUM(CASE name when 'JAVA' then score END)  'JAVA',
           SUM(CASE name when 'T-SQL' then score END) 'T-SQL',
		   SUM(CASE name when '�q��' then score END)  '�q��'
from course
group by id
order by id


/*
id          JAVA        T-SQL       �q��
----------- ----------- ----------- -----------
1           85          85          81
2           86          85          80
*/