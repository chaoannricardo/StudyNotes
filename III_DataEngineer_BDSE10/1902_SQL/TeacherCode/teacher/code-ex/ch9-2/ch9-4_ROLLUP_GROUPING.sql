--Rollup 1 總計

SELECT     department_id,  SUM(salary) as SUMSAL
FROM       employees
GROUP  BY ROLLUP ( department_id )


--Rollup 2 分組小計
SELECT   department_id DEPTID, job_id JOB, SUM(salary)  AS  SUMSAL
FROM     employees
WHERE    department_id < 50
GROUP  BY  ROLLUP ( department_id,  job_id ) ;


--Cube 交叉分組小計

SELECT   department_id DEPTID, job_id JOB, SUM(salary)  AS  SUMSAL
FROM     employees
WHERE    department_id < 50
GROUP  BY  CUBE ( department_id,  job_id ) ;

--GROUPING 判斷是否為摘要值還是原始值

SELECT   department_id DEPTID, job_id JOB, SUM(salary)  AS  SUMSAL,
         GROUPING(department_id) GRP_DEPT,
         GROUPING(job_id) GRP_JOB
FROM     employees
WHERE    department_id < 50
GROUP  BY  ROLLUP ( department_id,  job_id ) ;
