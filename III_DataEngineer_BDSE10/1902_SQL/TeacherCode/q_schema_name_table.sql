select  schema_id, name from sys.tables where name = 'EMPLOYEE'
select  schema_id, name from sys.schemas

select  s.name, t.name
from sys.tables t JOIN  sys.schemas s
ON   t.schema_id = s.schema_id
 where s.name = 'HumanResources'


