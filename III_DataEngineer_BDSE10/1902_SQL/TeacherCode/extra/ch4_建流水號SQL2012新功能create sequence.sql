--2012 T-SQL �y���� �s�\�� create sequence vs identity
-- https://dotblogs.com.tw/dc690216/2012/09/26/75082

/*�y�k�G

CREATE SEQUENCE [schema_name . ] sequence_name
 [ AS [ built_in_integer_type | user-defined_integer_type ] ]
 [ START WITH <constant> ]
 [ INCREMENT BY <constant> ]
 [ { MINVALUE [ <constant> ] } | { NO MINVALUE } ]
 [ { MAXVALUE [ <constant> ] } | { NO MAXVALUE } ]
 [ CYCLE | { NO CYCLE } ]
 [ { CACHE [ <constant> ] } | { NO CACHE } ]
 [ ; ]
*/

--
 CREATE SEQUENCE dbo.myseq
 AS INT
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 1000
 CYCLE
 CACHE;
go

--�إ߸�ƪ�
create table tseq ( id int, c2 char(20))
go

insert into tseq values (NEXT VALUE FOR dbo.myseq, 'John')
insert into tseq values (NEXT VALUE FOR dbo.myseq, 'Mary')
select * from tseq;
go

-- ��l��k
--�إ߸�ƪ� with identity �y����
create table member3
( id    INT IDENTITY(10,1),
  name  char(10),
  bdate datetime
)

insert into member3(name, bdate) values('John2','1980-12-01')
insert into member3(name, bdate) values('Mary2','1981-10-21')

select * from member3
