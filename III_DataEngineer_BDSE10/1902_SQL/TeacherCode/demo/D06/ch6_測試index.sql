--1 �}�� �į�u��/ SQL Profiler / �s�W�l��
--2 ���J ���U�妸 SQL���O ����workload
--3 ���� SQL Profiler / �x�s�� *.trc
--4 �}�� �į�u��/ Database Engine Tuning Advisor/ Ū�J�ɮ� *.trc / ��ܸ�Ʈw/ 
--       �L�տﶵ �i�� �Ŷ� 2M�H�W / �}�l���R
--5 �N��ĳ  �K��ŶKï 
   /*
     CREATE NONCLUSTERED INDEX i5 ON [dbo].[Orders] ([CustomerID] ASC,[OrderID] ASC)
     INCLUDE ( [OrderDate]) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
   */ 
--6 �� SQL �s�边����إ�index
--7 �A�� "��ܦ��p����p�e" ��SQL ���O�ݬO�_���B�Ψ��index
    --�ϦӤ��O�H where�� customerid ����ĳ �ӬO �H SELECT �� �T�����
    select customerid, orderid, orderdate from orders where customerid= 'VINET' and OrderID    = 10248
    select customerid, orderid, orderdate from orders where customerid= 'VINET'

--��h INCLUDE���Ҥl
    CREATE INDEX i52 ON Orders (CustomerID ) INCLUDE ( OrderID, OrderDate, shipcity)
    select customerid, orderid, orderdate,ShipCity from orders where customerid= 'VINET'
  
--�妸 SQL���O ����workload 
use northwind
go

select *  from customers

select *  from customers where customerid = 'VINET'
select customerid, companyname from customers where customerid = 'VINET'
select customerid, orderid, orderdate from orders where customerid= 'VINET'

--�䥦���

select *  from customers where companyname=  'Vins et alcools Chevalier'
select *  from customers where companyname like 'Vins%'
select *  from customers where companyname like '%lier'


--�X�֬d�� customers --> orders ---> [order details]
--���p             customerid   orderid
--�d�X customer 'VINET' �ҤU orders

select c.customerid, c.companyname, o.customerid, o.orderid, o.orderdate
from customers c JOIN orders  o
ON   c.customerid = o.customerid
where  c.customerid= 'VINET'

--�d�X orders 10248 ��  orders details

select o.customerid, o.orderid, o.orderdate, od.orderid, od.productid, od.quantity
from orders  o JOIN [order details] od
ON   o.orderid = od.orderid
where  o.orderid = 10248

--�d�X customer 'VINET �ҤU ordder 10248 ��orders details

select c.customerid cid, c.companyname cname, o.customerid ocid, 
       o.orderid oid , o.orderdate odate,
       od.orderid odid, od.productid odpid , od.quantity odqty
from   customers c JOIN orders  o
ON     c.customerid = o.customerid
JOIN   [order details] od
ON     o.orderid = od.orderid
where  c.customerid= 'VINET' and
       o.orderid = 10248
