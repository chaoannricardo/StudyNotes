--��l���� 120���O 10398, 10451, 10515
SELECT orderid, productid, quantity
FROM [order details]
where  quantity in (120,130)

10398	55	120   <--10398, 10451, 10515
10451	55	120
10515	27	120
10595	61	120
10678	41	120
10711	53	120
10764	39	130
10776	51	120
10894	75	120
11072	64	130

--�±Ƨ� �� 120���O  10776, 10711, 10894

USE northwind
go
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
GO

10764	39	130
11072	64	130
10776	51	120    <--10776, 10711, 10894
10711	53	120
10894	75	120
10398	55	120    <--10398,10451, 10515 order by���Ǧb�� 
10451	55	120
10515	27	120

 
--�Ʀ�]  TOP n ���O������Ƨ�, ���O TOP n �z���ƮɽT�O�q��l���ǧ�

--����
USE northwind
SELECT TOP 5 orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
GO

10764	39	130
11072	64	130
10398	55	120     <--10398 ��120 ���D Order by �����ǲĤ@�� 
10451	55	120     <--10451
10515	27	120     <--10515


