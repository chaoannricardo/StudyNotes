/*
Transact-SQL �y�{����y������r�p�U�G

BEGIN...END      RETURN 
BREAK            TRY...CATCH 
CONTINUE         WAITFOR 
GOTO label       WHILE 
IF...ELSE 
  
*/ 
-----------------------------------------------------------------------------
/*
�y�{����
1 IF ELSE : ���ܵ{������y�{
2 WHILE   : ���а���϶��������O
*/

-----------------------------------------------------------------------------
/*
1 IF ELSE �w�q:
�b Transact-SQL ���z��������W�j�[����C�p�G IF ����r��������o�����A�N�|����b IF ����r�Ψ����
���᪺ Transact-SQL ���z���G���L�B�⦡�|�Ǧ^ TRUE�C��ܩʪ� ELSE ����r�ɤJ�F�t�@�Ӧb IF ������
�����ɩҰ��檺 Transact-SQL ���z���G���L�B�⦡�|�Ǧ^ FALSE�C
�b Transact-SQL ���z��������W�j�[����C�p�G Boolean_expression �o�X TRUE�A�K�|����b
Boolean_expression ���᪺ Transact-SQL ���z�� (sql_statement)�C��ܩʪ� ELSE ����r�O
Boolean_expression �o�X FALSE �� NULL �ɡA�Ұ��檺���N Transact-SQL ���z���C

*/

/*
�y�k
IF Boolean_expression 
     { sql_statement | statement_block } 
[ ELSE 
     { sql_statement | statement_block } ] 
*/

-----------------------------------------------------------------------------
--��

DECLARE @n int;

SET @n=5;
IF @n >= 1 
  PRINT '�j��1'
ELSE
  PRINT '�p��1'

-----------------------------------------------------------------------------
/*
2 WHILE �w�q: 
  �u�n���w�����󬰯u�AWHILE ���z����N�@�ӳ��z���γ��z���϶����ư���C
  ����� Transact-SQL ���z���g�`�P WHILE �X�ΡGBREAK �� CONTINUE�CBREAK ���z���i�ѳ̤��h�� WHILE �j����X�A
  �� CONTINUE ���z���h���s�Ұ� WHILE �j��C�b�S����L��ƦC�ݭn���檺���p�U�A�{���|���� BREAK ���z���C
  �b�ݭn�~�����{���X�����p�U�A�{���|���� CONTINUE ���z���C

*/
/*
�y�k
WHILE Boolean_expression 
     { sql_statement | statement_block } 
     [ BREAK ] 
     { sql_statement | statement_block } 
     [ CONTINUE ] 
     { sql_statement | statement_block } 

����
{sql_statement | statement_block} 
  �o�O�Q�γ��z���϶��өw�q������ Transact-SQL ���z���γ��z�����աC�Y�n�w�q���z���϶��A
  �Шϥάy�{��������r BEGIN �M END�C

BREAK
  �����̤��h�� WHILE �j��C�N����X�{�b END ����r (��ܰj�鵲��) ���᪺���󳯭z���C

CONTINUE
  ���s�Ұ� WHILE �j��A���� CONTINUE ����r���᪺���󳯭z���C
*/

-----------------------------------------------------------------------------
--��1

DECLARE @n int;

SET @n=1;
WHILE ( @n <= 10 )
  BEGIN
    PRINT 'n= '+ CAST(@n AS varchar(2));
    SET @n = @n + 1 ;   --�� SET @n += 1; 
  END

-----------------------------------------------------------------------------
--��2 CONTINUTE
DECLARE @i int
SET @i=0

WHILE (@i< 10)
  BEGIN
    SET @i = @i + 1
      IF @i % 2 = 0
         PRINT '����'+cast(@i as varchar(2))
      ELSE
         CONTINUE   --�q�Y����
  END


-----------------------------------------------------------
/*4 BEGIN END

�w�q
BEGIN �M END ���z���O�ΥH�N�h�� Transact-SQL ���z���s�զ��@���޿�϶��C�Y���y�{����z����������
�t���G�Φh�� Transact-SQL ���z�����϶��A�N�i�H�ϥ� BEGIN �M END ���z���C

*/
-----------------------------------------------------------
--��1

BEGIN
  INSERT INTO �� VALUES (��1)
  INSERT INTO �� VALUES (��2)
  SELECT * FROM ��
END

--��

BEGIN
  DECLARE @cnt  int;

  UPDATE �� SET �� = ��1;
  BEGIN
    SET @cnt = 1; 
    SELECT * FROM �� where �� = @cnt;
  END
END
GO

--��2 IF ���z������Ȱ���@�� Transact-SQL ���z�������p�ɡA�N���ݭn�ϥ� BEGIN �� END ���z���G

  IF (@@ERROR <> 0)
   SET @ErrorSaveVariable = @@ERROR

--��3 �� IF ���������G�� FALSE �ɡA�ϥ� BEGIN �M END ���z����� IF ���z�����L���z���϶��G

IF (@@ERROR <> 0)
  BEGIN
    SET @ErrorSaveVariable = @@ERROR
    PRINT 'Error encountered, ' + 
         CAST(@ErrorSaveVariable AS VARCHAR(10))
  END
-----------------------------------------------------------
/*
BEGIN �M END ���z�����ϥήɾ����G
  1 WHILE �j��ݭn�]�t���z���϶��C
  2 CASE ��ƶ��ػݭn�]�t���z���϶��C
  3 IF �� ELSE �l�y�ݭn�]�t���z���϶��C

*/
-------------------------------------------------------------
/*
�y�{���� �䥦�Ҥl
*/
--��1  �� OBJECT_ID�P�_ object�O�_�s�b

USE AdventureWorks2016CTP3
GO

IF OBJECT_ID ( 'HumanResources.uspGetAllEmployees', 'P' ) IS NOT NULL 
    DROP PROCEDURE HumanResources.uspGetAllEmployees;
GO

-----------------------------------------------------------------------------
--��2 �� system table�P�_ object �O�_�s�b 

USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'DB01')
   DROP DATABASE [DB01]
GO

-----------------------------------------------------------------------------
--��3 �� system table�P�_ object �O�_�s�b 

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'employees')      
   DROP TABLE employees
GO
-----------------------------------------------------------------------------
--��4 �� system table�P�_ object �O�_�s�b 

IF 'employees' IN  (SELECT name FROM sysobjects WHERE type = 'U' )
   PRINT '���w�s�b'
ELSE
   PRINT '��椣�s�b'


-----------------------------------------------------------------------------
--��5  �� OBJECTPROPERTY�P�_ object�O�_�s�b
IF OBJECTPROPERTY ( object_id('employees'),'ISTABLE') = 1
   PRINT '���w�s�b'

-----------------------------------------------------------------------------
/*��L���Ī� WHILE ������աG

1 WHILE (@ACounterVariable < 100)
2 WHILE EXISTS(SELECT LastName FROM Person.Contact WHERE FirstName = N'Anne')

*/

/*
��2
�f�t�_�� IF...ELSE �M WHILE �Өϥ� BREAK �M CONTINUE
�b�U�C�d�Ҥ��A�p�G���~�������л��p�� $300�AWHILE �j��|�N�л��[���A�A����̤j����C
�p�G�̤j����p��ε��� $500�AWHILE �j��|���s�ҰʡA����|�A�[���C�o�Ӱj��|�~��ϻ���[���A
����̤j����j�� $500�A�A���� WHILE �j��ΦC�L�T���C
*/

USE AdventureWorks2016CTP3;
GO
WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $300
BEGIN
   UPDATE Production.Product
      SET ListPrice = ListPrice * 2
   SELECT MAX(ListPrice) FROM Production.Product
   IF (SELECT MAX(ListPrice) FROM Production.Product) > $500
      BREAK
   ELSE
      CONTINUE
END
PRINT 'Too much for the market to bear';

--------------------------------------------------------------
/*3 RETURN

�w�q: 
  RETURN ���z���i�L����פ�d�ߡB�w�s�{�ǩΧ妸�C��b RETURN ���z���᭱���w�s�{�ǩΧ妸����
  ���󳯭z���A�����|����C
  RETURN �Ω�w�s�{�ǮɡA������w��ƭȶǦ^�ܵo�I�s�����ε{���B�妸�ε{�ǡC�p�G RETURN ���S�����w�ȡA
  �h�w�s�{�ǶǦ^�Ȭ� 0�C

  �j�����w�s�{�ǿ�ӨϥζǦ^�X���D�ҡA�ӫ��X�w�s�{�Ǧ��\�Υ��ѡC�Y�S���o�{���~�A�h�w�s�{�ǶǦ^ 0 �ȡC
  �D�s�Ȫ�ܦ��o�Ϳ��~�C�Ҧp�G
*/
--------------------------------------------------------------
--��1 procedure �ǭȫ� �^��OUTPUT ��Ƥ� return ���A

USE AdventureWorks2016CTP3;
GO
-- Create a procedure that takes one input parameter
-- and returns one output parameter and a return code.

CREATE PROCEDURE SampleProcedure @EmployeeIDParm INT,
                                 @MaxTotal INT OUTPUT
AS
  -- Declare and initialize a variable to hold @@ERROR.
  DECLARE @ErrorSave int;
  SET @ErrorSave = 0;
  -- Do a SELECT using the input parameter.
  SELECT c.FirstName, c.LastName, e.Title
  FROM HumanResources.Employee AS e JOIN Person.Contact AS c 
  ON e.ContactID = c.ContactID
  WHERE EmployeeID = @EmployeeIDParm;

  -- Save any nonzero @@ERROR value.
  IF (@@ERROR <> 0)
     SET @ErrorSave = @@ERROR;
  -- Set a value in the output parameter.
  SELECT @MaxTotal = MAX(TotalDue)
  FROM Sales.SalesOrderHeader;
  IF (@@ERROR <> 0)
     SET @ErrorSave = @@ERROR;

  -- Returns 0 if neither SELECT statement had
  -- an error, otherwise returns the last error.
  RETURN @ErrorSave;
GO

--run ����w�s�{�Ǫ� Transact-SQL �妸�ιw�s�{�ǡA�i�^���Ǧ^�X�é�����ܼƤ��G

DECLARE @ReturnStatus int;
DECLARE @MaxTotalVariable int;
DECLARE @MaxTotal int;
EXECUTE @ReturnStatus = SampleProcedure @EmployeeIDParm = 65 ,@MaxTotal = @MaxTotalVariable OUTPUT;
PRINT ' ';
PRINT 'Return code = ' + CAST(@ReturnStatus AS CHAR(10));
PRINT 'Maximum Order Total = ' + CAST(@MaxTotalVariable AS CHAR(15));
GO


