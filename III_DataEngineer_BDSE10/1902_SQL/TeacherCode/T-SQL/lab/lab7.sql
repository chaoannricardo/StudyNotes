--T_SQL  Lab
--Lab 7�i���d��-�s�չB��(Group)

--3.	Write a query to display the number of people with the same job.
   -- �̦U¾��job_id����, ��ܦU¾�����O���H��
   select JOB_ID ,count(JOB_ID) 'Job ID Count'
   from employees
   group by JOB_ID

--4.	Write a query that displays the difference between the highest and lowest salaries. Label the column DIFFERENCE.
   --�p����u �̰� �P�̧C�~�ꪺ�t�� ���O�W�� DIFFERENCE
   select (MAX(SALARY) - MIN(SALARY)) 'DIFFERENCE'
   from employees

--5.	Display the manager number and the salary of the lowest paid employee for that manager.
	--Exclude anyone whose manager is not known. Exclude any groups where the minimum
	--salary is $6,000 or less. Sort the output in descending order of salary.
    --�̦U�D��manager_id����, �p��U�D�ޤ����ݭ��u�̧C�~��salary,�B 6000 (�t)�H�W��, �è��~��
    --�Ѱ���C�Ƨ�

	select MIN(SALARY) 'MINIMAL SALARY', MANAGER_ID
	from employees
	group by MANAGER_ID
	having MIN(SALARY) > 6000
	order by MIN(SALARY) desc