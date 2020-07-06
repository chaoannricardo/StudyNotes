--SQL 2012 OFFSET FETCH �y�k���N TOP N, �] TOP N �D�зǻy�k,�B������w��X�d��

--�� 1 DB01 DB
USE DB01
GO
--��l���
select  salary , employee_id, last_name
from    employees 
order by  salary  desc

/*
salary      employee_id last_name
----------- ----------- -------------------------
24000       100         King
17000       101         Kochhar
17000       102         De Haan
13000       201         Hartstein
12000       205         Higgins
11000       174         Abel
10500       149         Zlotkey
9000        103         Hunold
8600        176         Taylor
8300        206         Gietz
7000        178         Grant
:
*/
--TOP (N) - �d�߱Ʀ�]�e�X�W�Ϋ�X�W, �A���i�ٲ�

select  TOP  ( 2 )  salary , employee_id, last_name
from    employees 
order by  salary  desc

/*
salary      employee_id last_name
----------- ----------- -------------------------
24000       100         King
17000       102         De Haan  <--�`�N�� 17000 �O 102 �D101 
*/


--OFFSET 3  ROWS FETCH NEXT 5 ROWS ONLY : ���L�e3��, ��ܩ���5�� �Y 4-8
select  salary , employee_id, last_name
from    employees 
order by  salary  desc
OFFSET 3  ROWS FETCH NEXT 5 ROWS ONLY

/*
salary      employee_id last_name
----------- ----------- -------------------------
13000       201         Hartstein
12000       205         Higgins
11000       174         Abel
10500       149         Zlotkey
9000        103         Hunold
*/

--�� 2 Northwind DB
--�Ʀ�]  TOP n 

USE northwind
SELECT TOP 5 orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
GO

--OFFSET n ���w���L�X��  / FETCH NEXT n ��ܩ���X��
--OFFSET 0  ROWS FETCH NEXT 5 ROWS ONLY �P TOP 5 �\��ۦP
USE northwind
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY
GO

/*
orderid     productid   quantity
----------- ----------- --------
10764       39          130
11072       64          130
10398       55          120
10451       55          120
10515       27          120

(5 �Ӹ�ƦC����v�T)

*/

--OFFSET 10  ROWS FETCH NEXT 5 ROWS ONLY : ���L�e10��, ��ܩ���5�� �Y 11-15
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
OFFSET 10  ROWS FETCH NEXT 5 ROWS ONLY
GO
