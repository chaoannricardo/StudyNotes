
CREATE TABLE  Suppliers 
( 
  id          INT      PRIMARY  KEY,
  CompanyName CHAR(20) UNIQUE
)
GO

insert into Suppliers values (101,'ABC Company');
insert into Suppliers values (102,'ABC Company');

select * from  Suppliers 

