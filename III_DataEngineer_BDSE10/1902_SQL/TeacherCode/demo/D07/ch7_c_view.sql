use Northwind 
go

--�R���즳 view
IF OBJECT_ID ('v1', 'V') IS NOT NULL
   DROP VIEW v1 ;
go

--�إ�view
create view v1
as
select EmployeeID, LastName , Country  
from employees
where Country = 'UK'
go

--�z�Lview�d�߸��
select * 
from  v1
where employeeid = 6

--Same as
select * 
from    (
             select EmployeeID, LastName , Country  
             from employees
             where Country = 'UK'

         ) o

--�ˬd�̩ۨ�

EXEC sp_depends  v1           --�d��view�ѦҨ��Ǹ�ƪ�����
EXEC sp_depends  Employees    --�d�߸�ƪ�����view��check����ѦҤޥ�

--�d�� view ���e

EXEC sp_helptext v1

select definition 
from sys.sql_modules 
where object_id = (select object_id from sys.views where name = 'v3')

select definition
from sys.sql_modules 
where object_id =  OBJECT_ID ('v3', 'V')


