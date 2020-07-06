--1  Display the highest, lowest, sum, and average salary of all employees. Label the columns
--Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. Place your SQL statement in a text file named lab4_1.sql.
 --查詢員工資料表employees中 最高薪資, 最低薪資, 總薪資, 及平均薪資並將結果四捨五入到整數
   --存檔成 lab7_1.sql
   select ROUND( MAX(SALARY), 0), ROUND( MIN(SALARY), 0), ROUND( SUM(SALARY), 0), ROUND( AVG(SALARY), 0)
   from employees