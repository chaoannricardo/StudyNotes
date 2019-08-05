--2.  Modify the query in lab7_1.sql to display the minimum, maximum, sum, and average salary for each job type. 	Resave lab7_1.sql to lab7_2.sql. Run the statement in lab7_2.sql
   --修改lab7_1.sql 為依 職務job_id分類, 計算各job_id之最高薪資, 最低薪資, 總薪資, 及平均薪資
   --存檔成 lab7_2.sql
   select JOB_ID ,ROUND( MAX(SALARY), 0) 'max salary', ROUND( MIN(SALARY), 0) 'min salary', 
   ROUND( SUM(SALARY), 0) 'total salary', ROUND( AVG(SALARY), 0) 'average salary'
   from employees
   group by JOB_ID