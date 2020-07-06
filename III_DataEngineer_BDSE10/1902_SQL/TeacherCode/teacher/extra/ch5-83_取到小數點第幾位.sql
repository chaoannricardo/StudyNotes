--http://ithelp.ithome.com.tw/question/10010829
--�w�]��X�O�H �Q�B����쪺��ƨӭq
--�p salary��� *1.1 ,  *1.25 , *1.275 ��X�N�O���O�p���I 1, 2 3��
--���D�� CAST ����

select last_name, salary,  salary*1.1, salary*1.25, salary*1.275
from employees

--���O�|�ˤ��J��p�ƨ�� ������ܤT�� 45.930,  46.000,  50.000
select ROUND(45.926,2),ROUND(45.926,0), ROUND(45.926,-1)

--���D CAST  45.93
select CAST(ROUND(45.926,2) as decimal(5,2)) ,
       ROUND(45.926,0), ROUND(45.926,-1)


--���w��X���p���I�X��, �H CHARINDEX�d "." ��m �A�f�t LEFT���
DECLARE @pi float  
  
-- �]�w��l��   
SET @pi=3.1415926   
  
-- ��ܭ쥻����   
SELECT �쥻���� = @pi   
  
-- ����p���I��� 1 ��   
SELECT [����p���I��� 1 ��] = LEFT(@pi, CHARINDEX('.', @pi) + 1) 

--�]�i�H�ϥγo�Ӥ覡�ӭp��p�Ʀ�� , ���G�� 3.142 �o�˷|�۰ʥ|�ˤ��J

SELECT [����p���I��� 3 ��] = convert(decimal(8,3),@pi)  

--�p�G���n�|�ˤ��J�A�i�H�b @pi ��h .(�Q�����+1)5 ��
--�p����p�ƲĤT�� @pi-0.0005

SELECT [����p���I��� 1 ��] = convert(decimal(8,3),@pi-0.0005)  


-- �إߨϥΪ̦ۭq���   
CREATE FUNCTION dbo.GetDecimal(@number float, @point int)   
RETURNS float  
AS   
BEGIN   
    RETURN LEFT(@number, CHARINDEX('.', @number) + @point)   
END   
GO   
  
-- ���լݬ�   
SELECT [����p���I��� 3 ��] = dbo.GetDecimal(3.1415926, 3)  
