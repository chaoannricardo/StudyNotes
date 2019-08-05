
--------------------------------------------------------------------------------
--1 �ϥε���(Comment): 2��

--��1 ������

-- �@����ѥΨ�� "-" (�)

--��2 �h�����

/* �h����� , �ϥ� /* �}�l ��  */  ����
   �����b��
*/

--------------------------------------------------------------------------------
/*
2 �妸(Batch)����, �ƭ�SQL���O���@�Ӱ���椸(Unit), �@�_�sĶ��������p�e(Execution   Plan), �A�[�H����; 
  - �H GO ���j���P�妸����
  - �U�C���O�u���W�@�ӧ妸����: CREATE VIEW, CREATE DEFAULT, CREATE RULE, CREATE PROCEDURE ..

  -�妸���~�ɨt�Ϊ��B�z�覡
   1 �sĶ�ɿ��~: ���|��������O�Q����
   2 ���椤�o�͸��j���~�� : �p�䤣�� ���w��ƪ�, �h�ߧY�������ζǦ^���~�T��,
     ���᪺�ԭz���|�Q����, �����e�w���T���檺�ԭz���|�Q����
   3 ���椤�o�ͻ��L���~ : �p�s�W�έק��� �H�ϱ������, �h�����ӿ��~�ԭz, ����
     ���ԭz���|�~�����
*/

--�� 1

INSERT INTO �� VALUES (��1)
INSERT INTO �� VALUES (��2)
SELECT * FROM ��
GO

--�� 2 ��ĳ�H ";" ���� �Ϲj�C�ӫ��O

INSERT INTO �� VALUES (��1) ;
INSERT INTO �� VALUES (��2) ;
SELECT * FROM �� ;
GO

--------------------------------------------------------------------------------
/*
3 �ܼ�: �ϰ��ܼ�(Local Varaible) �H @�}�Y, �x�s�妸����ɪ����
        �����ܼ�(Global Varaible) �H @@�}�Y, �Ѩt�δ��ѥΨ��x�s�t�θ�T;�p @@ERROR, @@ROWCOUNT
        -�ŧi�H DECLARE , �]�w�ܼ� �H SET �� SELECT 

*/

--�y�k DECLARE @local_variable [AS] datatype

--��1 �ŧi�ܼƤ� ���w��

DECLARE @name varchar(40)     -- �ϰ��ܼƥH @ ���}�Y

SET @name = 'John'            -- �]�w�ϰ��ܼ�
SELECT @name                  -- ��ܰϰ��ܼƪ����e

SELECT @name = 'Mary'         -- �� SELECT �]�i���ӳ]�w�ܼ�
SELECT @name                  -- ��ܰϰ��ܼƪ����e


SELECT @@CPU_BUSY             -- @@CPU_BUSY ���@�����ܼ� , �����ܼƱ`�O�t���ܼ� 
SELECT @@ERROR                -- @@ERROR ���@�����ܼ� , �����ܼƱ`�O�t���ܼ� 

--�q�`�f�t IF�P�_

IF @@ERROR = 0
  SELECT CAST(@@error AS VARCHAR(10))+'ok'
ELSE
  SELECT  CAST(@@error AS VARCHAR(10))+'error'
  
--��2 DECLARE�]�i�]�w��l��

DECLARE @n int = 5;  --�]�w��l��

SELECT @n            --���

--------------------------------------------------------------------------------
/*
3-2 TABLE ���O���ܼ� : �Ϊk�P �Ȧs��ƪ�(#��##�}�Y)����, �ҥi�Ȯɦs��@�ո�ƪ�������ƶ�,
                       �u��Ω�t-sql���Ψөw�q�ϰ��ܼ� �w�s�{�ǩΦۭq��ƪ��ѼƩζǦ^��,
                       �������ƪ����O; �B����ŧi Primary key, Unique key ��null�T��
                       ���i�Ω� SELECT INTO ���l�y��
*/

--�y�k DECLARE @local_variable  TABLE (���w�q)

--��

DECLARE @mytable  TABLE ( eno int, name varchar(20))

INSERT INTO @mytable SELECT employeeid, lastname from employees

SELECT * FROM @mytable

UPDATE @mytable SET name = 'John' where eno = 1
DELETE FROM @mytable WHERE eno = 1
SELECT * FROM @mytable

--���i�ϥΩ� SELECT INTO

SELECT employeeid, lastname
INTO   @mytable
FROM   employees

--�礣�i
SELECT employeeid, lastname
INTO   #tmp1
FROM   @mytable

--������P�B: �s���Ȧs�� �� �t�θ�Ʈw tempdb
SELECT employeeid, lastname
INTO   #mytable2
FROM   employees

--�P: �s���ä[��ƪ�

SELECT employeeid, lastname
INTO   mytable2
FROM   employees

--------------------------------------------------------------------------------
--3-3 �إ� �ϥΪ̩w�q��ƪ�����

--�y�k CREATE TYPE type_name AS TABLE (���w�q)

--��

CREATE TYPE t_table AS TABLE ( eno  int PRIMARY KEY,
                               name varchar(20))
GO

DECLARE @mytable t_table  --�ŧi�� �ۭq table type

INSERT INTO @mytable SELECT employeeid, lastname from employees;

SELECT * FROM @mytable;


--------------------------------------------------------------------------------
--4 ��� PRINT �� SELECT
 
--�y�k
  PRINT msg_str | @local_variable | string_expr


--��1 

PRINT  '��ܩ�T������'
SELECT '��ܩ󵲪G����'

--------------------------------------------------------------------------------
