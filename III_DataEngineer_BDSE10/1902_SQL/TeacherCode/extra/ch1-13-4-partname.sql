
-- 1 part name
   select  * from  employees
-- 2 part name
   select  * from  dbo.employees

-- 3 part name
   select  * from  northwind.dbo.employees

-- 4 part name
   select  * from  [III-EEIT].northwind.dbo.employees

--�Y�s�컷�ݾ���, �� �[�J���A��( IP�[�Jhosts��) ,�Ψ��� sa�K�X�@��, 
   select  * from  R1502.northwind.dbo.employees


/* �T�� 7202�A�h�� 11�A���A 2�A�� 1
   �b sys.servers ���䤣����A�� 'R1502'�C�нT�{�ҫ��w�����A���W�٬O�_���T�C�p�G�ݭn�A�а���w�s�{�� sp_addlinkedserver�A�N���A���[�J sys.servers�C
*/	
  
 EXEC sp_addlinkedserver 'R1502'
 select * from sys.servers

--���s�d��

 /*
   �T�� 18452�A�h�� 14�A���A 1�A�� 1
   �n�J���ѡC���n�J�O�Ӧۥ����H��������A����Ω� Windows ���ҡC

   �T�� 18456�A�h�� 14�A���A 1�A�� 1
   �ϥΪ� 'sa' ���n�J���ѡC
 */

--�ﻷ�� sa �K�X�P client�ݦP
--���s�d��

--�[����ip�� client�� hosts��
  ping R1502 -4
  
-- C:\Windows\System32\drivers\etc\hosts
--�[  192.168.31.28          R1502 

--���s�d��


--�R��
 EXEC sp_dropserver 'R1502'
 