--T_SQL  Lab
--Lab 7進階查詢-群組運算(Group)

--3.	Write a query to display the number of people with the same job.
   -- 依各職務job_id分類, 顯示各職務類別的人數
   select JOB_ID ,count(JOB_ID) 'Job ID Count'
   from employees
   group by JOB_ID

--4.	Write a query that displays the difference between the highest and lowest salaries. Label the column DIFFERENCE.
   --計算員工 最高 與最低薪資的差異 取別名為 DIFFERENCE
   select (MAX(SALARY) - MIN(SALARY)) 'DIFFERENCE'
   from employees

--5.	Display the manager number and the salary of the lowest paid employee for that manager.
	--Exclude anyone whose manager is not known. Exclude any groups where the minimum
	--salary is $6,000 or less. Sort the output in descending order of salary.
    --依各主管manager_id分類, 計算各主管之所屬員工最低薪資salary,且 6000 (含)以上者, 並依薪資
    --由高到低排序

	select MIN(SALARY) 'MINIMAL SALARY', MANAGER_ID
	from employees
	group by MANAGER_ID
	having MIN(SALARY) > 6000
	order by MIN(SALARY) desc