create table t1
(
 id  int  --- 4byte  * 8bit = 32  =- 2^31
)
go

 insert  into t1  values ( 102)              --ok
 insert  into t1  values ( 2147483647)       --ok
 insert  into t1  values ( 2147483648)       -not ok

/* �T�� 8115�A�h�� 16�A���A 2�A�� 34
   �ഫ expression �������� int �ɵo�ͺ�N������~�C ���z���w�g�����C
*/

--���O�W (Alias)

SELECT  last_name  "�m�W",  salary * 12  "Annual Salary"
FROM    employees;

--Concatenation (��s�B��) 
  SELECT    last_name + job_id  AS  "Employees"
  FROM 	    employees;

--Literal Character Strings
SELECT  last_name   +  ' is a'  + job_id   AS  "Employee Details"
FROM    employees;

--v.s

SELECT  last_name   ,  ' is a'  ,  job_id   AS  "Employee Details"
FROM    employees;


--v.s

SELECT  last_name   +  ' �NŪ��EEIT103'   
FROM    employees;


--DISTINCT (�������_�C) 
SELECT  DISTINCT   department_id
FROM     employees;


--��z
select * from departments

select  employee_id,last_name,  department_id
from    employees

select  department_id
from    employees

select distinct department_id
from   employees


--dep 8  but  emp  7+null  wh

NULL
10
20
50
60
80
90
110


SELECT  location_id,  country_id , city
FROM     locations

SELECT  DISTINCT  country_id 
FROM     locations

USA
TW
UK
..
SELECT  DISTINCT  country_id, city
FROM     locations

USA LA
USA NY
USA SF
USA SF

