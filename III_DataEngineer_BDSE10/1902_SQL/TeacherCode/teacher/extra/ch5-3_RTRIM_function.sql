USE AdventureWorks2016
GO
SELECT UPPER(RTRIM(LastName)) + ', ' + FirstName AS Name
FROM Person.Person
ORDER BY LastName;
GO

SELECT  LastName,  UPPER( LastName) 
FROM Person.Person
ORDER BY LastName;
GO

--RTRIM remove space
SELECT LEN('ABC    '),  RTRIM('ABC    ') abc, LEN(RTRIM('ABC    '))

select  'ABC     '+'123'
select  RTRIM('ABC    ') +'123'


--> 'ABC      123'
--> 'ABC123'
