USE AdventureWorks2016
go


SELECT ProductID, Name, ListPrice
FROM   Production.Product
WHERE  ListPrice > $40
ORDER  BY ListPrice ASC