
/*
select * from sys.tables
select * from sys.columns
select * from sys.types
*/

--prcedure
create procedure p_columns @v_tabname varchar(30)
as
select t.name table_name, c.name column_name, ty.name data_type, c.max_length length
from  sys.tables t JOIN sys.columns  c
ON  t.object_id = c.object_id
JOIN  sys.types ty
ON  c.system_type_id = ty.system_type_id
and t.name = @v_tabname
go

--run  exec p_columns 資料表名
exec p_columns departments

/* output
table_name  column_name     data_type length
----------- -------------   --------- -------
DEPARTMENTS	DEPARTMENT_ID	int   	  4
DEPARTMENTS	MANAGER_ID    	int	      4
DEPARTMENTS	LOCATION_ID	    int	      4
DEPARTMENTS	DEPARTMENT_NAME	varchar	  30
*/
--method 1
select t.name, c.name, ty.name, c.max_length
from  sys.tables t JOIN sys.columns  c
ON  t.object_id = c.object_id
JOIN  sys.types ty
ON  c.system_type_id = ty.system_type_id
and t.name = 'DEPARTMENTS'
go
--method 3
Select sysobjects.name As TableName, syscolumns.name As ColName, 
       systypes.name As ColType, syscolumns.length As ColLen 
From sysobjects Left Outer Join syscolumns 
on sysobjects.id = syscolumns.id  Left Outer Join systypes 
On syscolumns.xtype = systypes.xtype
Where (sysobjects.name = N'DEPARTMENTS') 
Order By syscolumns.colorder
