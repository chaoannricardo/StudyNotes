--2.  Modify the query in lab7_1.sql to display the minimum, maximum, sum, and average salary for each job type. 	Resave lab7_1.sql to lab7_2.sql. Run the statement in lab7_2.sql
   --�ק�lab7_1.sql ���� ¾��job_id����, �p��Ujob_id���̰��~��, �̧C�~��, �`�~��, �Υ����~��
   --�s�ɦ� lab7_2.sql
   select JOB_ID ,ROUND( MAX(SALARY), 0) 'max salary', ROUND( MIN(SALARY), 0) 'min salary', 
   ROUND( SUM(SALARY), 0) 'total salary', ROUND( AVG(SALARY), 0) 'average salary'
   from employees
   group by JOB_ID