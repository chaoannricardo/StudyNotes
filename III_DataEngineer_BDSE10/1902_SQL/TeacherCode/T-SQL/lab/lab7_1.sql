--1  Display the highest, lowest, sum, and average salary of all employees. Label the columns
--Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. Place your SQL statement in a text file named lab4_1.sql.
 --�d�߭��u��ƪ�employees�� �̰��~��, �̧C�~��, �`�~��, �Υ����~��ñN���G�|�ˤ��J����
   --�s�ɦ� lab7_1.sql
   select ROUND( MAX(SALARY), 0), ROUND( MIN(SALARY), 0), ROUND( SUM(SALARY), 0), ROUND( AVG(SALARY), 0)
   from employees