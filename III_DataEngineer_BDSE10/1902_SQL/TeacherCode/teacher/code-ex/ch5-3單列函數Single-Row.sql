use DB01
go

--查詢  last_name 為 higgings 之員工 (定序設為CS 時,字元會區分大小寫)

SELECT  employee_id,  last_name,  department_id
FROM    employees 
WHERE   last_name  =  'higgins';

--將  last_name 轉為小寫 (定序 一般都是設成 CI)

SELECT  employee_id,  last_name,  department_id
FROM    employees 
WHERE   LOWER ( last_name ) =  'higgins';

--查詢 job_id 第四字元起始為 REP 之員工

SELECT  last_name, job_id,  LEN ( last_name )  AS  LENGTH,
        CHARINDEX ( 'a',  last_name )  AS  INSTR
FROM    employees
WHERE   SUBSTRING ( job_id,  4, 3 )  =  'REP';

--ROUND: 四捨五入函數, 0 表取到整數位, -1 表取到十位數

SELECT  ROUND ( 45.926, 2 ),  ROUND ( 45.926, 0 ),  ROUND ( 45.926, -1 )

--日期函數
SELECT GETDATE()  --取得現在時間

SELECT DATEADD(month, 6, '2006-03-30') 

SELECT DATEDIFF(YEAR, '2006-01-30' , '2009-03-30'); 
SELECT DATEDIFF(MONTH, '2006-01-30' , '2009-03-30');
 
SELECT DATENAME(YEAR, '2009-03-30'); 
SELECT DATENAME(DAY, '2009-03-30'); 
SELECT DATEPART(DAY, '2009-03-30'); 

SELECT YEAR('2009-03-30'); 
SELECT MONTH('2009-03-30'); 
SELECT DAY('2009-03-30'); 

--例 查詢 1999 年到職的員工

SELECT employee_id, last_name, hire_date, YEAR(hire_date) 
FROM   employees
WHERE  hire_date >= '1999-1-1' and hire_date <='1999-12-31'

--改寫為

SELECT employee_id, last_name, hire_date, YEAR(hire_date) 
FROM   employees
WHERE  YEAR(hire_date) = 1999;

--Implict VS Explict 轉換
SELECT  2 + '3' 
SELECT  2 + CAST( '3' AS  INT)  

--轉換 date 日期格式
SELECT  getdate(),                                      --yyyy-mm-dd 取得現在時間
        CONVERT ( VARCHAR ( 40 ),   getdate(), 101 ) ,  --mm/dd/yyyy
        CONVERT ( VARCHAR ( 40 ),   getdate(), 102 ) ,  --yyyy.mm.dd
	CONVERT ( VARCHAR ( 40 ),   getdate(), 103 ) ,  --dd/mm/yyyy
	CONVERT ( VARCHAR ( 40 ),   getdate(), 121 )    --yyyy-mm-dd

--轉換 員工之  hire_date 日期格式

SELECT  last_name,   
        CONVERT ( VARCHAR ( 40 ),   hire_date, 101  )   AS  HIREDATE
FROM    employees;

--轉換 員工 commission_pct 空值者轉為 0

SELECT last_name, salary, commission_pct,  ISNULL( commission_pct,  0 )
FROM   employees;

--註 ISNULL 與  IS NULL 不同處

SELECT last_name, salary, commission_pct,  ISNULL( commission_pct,  0 ) --遇到空值時 轉為指定值
FROM   employees
WHERE  commission_pct IS NULL  -- 判斷是否為空值


--CASE函數 依 員工 job_id  調整 salary

SELECT   last_name,  job_id,  salary,
         CASE  job_id  WHEN  'IT_PROG'  THEN  1.10 * salary
                       WHEN 'ST_CLERK'  THEN  1.15 * salary
                       WHEN 'SA_REP'    THEN  1.20 * salary
                       ELSE      salary 
         END     "REVISED_SALARY"
  FROM   employees;

--CASE函數另一種寫法 依 員工 job_id  調整 salary
SELECT   last_name,  job_id,  salary,
         CASE  WHEN job_id  = 'IT_PROG'  THEN  1.10 * salary
               WHEN job_id  = 'ST_CLERK' THEN  1.15 * salary
               WHEN job_id  ='SA_REP'    THEN  1.20 * salary
               ELSE      salary 
         END     "REVISED_SALARY"
  FROM   employees;
