--子查詢用於資料來源 FROM

use DB01
go

SELECT name, pay, startyear
FROM   ( SELECT first_name,  salary  , YEAR ( hire_date )
         FROM   employees
         WHERE  job_id  =  'ST_CLERK'
       ) AS  clerks  ( name,  pay,  startyear )
WHERE  pay < 3000  and  startyear <  2000;
