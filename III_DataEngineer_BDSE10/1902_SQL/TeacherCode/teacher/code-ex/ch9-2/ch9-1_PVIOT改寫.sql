--PIVOT 將學員各科成績轉成 PIVOT欄位 (含學號,各科分數 3個欄位)

select * from course  order by id

--PIVOT
SELECT * 
FROM  course 
PIVOT (SUM(score) FOR name IN ([JAVA],[T-SQL],[電概])) PVT

--不用PIVOT             
select id, CASE name when 'JAVA' then score END  'JAVA',
           CASE name when 'T-SQL' then score END 'T-SQL',
		   CASE name when '電概' then score END  '電概'
from course  order by id

select id, SUM(CASE name when 'JAVA' then score END)  'JAVA',
           SUM(CASE name when 'T-SQL' then score END) 'T-SQL',
		   SUM(CASE name when '電概' then score END)  '電概'
from course
group by id
order by id


/*
id          JAVA        T-SQL       電概
----------- ----------- ----------- -----------
1           85          85          81
2           86          85          80
*/