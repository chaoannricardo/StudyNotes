
--5 TRY CATCH (���~�B�z)
/*
�w�q
 ��@������ Microsoft Visual C# �P Microsoft Visual C++ �y�������ҥ~���p�B�z�� Transact-SQL ���~�B�z�C
 �z�i�H�N Transact-SQL ���z���s�էt�A�b TRY �϶����C�p�G TRY �϶����o�Ϳ��~�A�N�|�N�����v�ǵ��t�A�b
 CATCH �϶������t�@�ӳ��z���s�աC
--�q CATCH �϶��Ǧ^���~��T ��work �b try�N����������� catch

�y�k

BEGIN TRY
     { sql_statement | statement_block }
END TRY
BEGIN CATCH
     [ { sql_statement | statement_block } ]
END CATCH

����:
1 TRY�KCATCH �غc�|�����Y���ʰ��� 10 �ӥ�������Ʈw�s�����Ҧ�������~�C
2 TRY �϶��᭱�����򱵵۬����p�� CATCH �϶��C�b END TRY �P BEGIN CATCH ���z�������]�t����
  ��L���z���A�N�|���ͻy�k���~�C
3 TRY�KCATCH �غc�����V�h�ӧ妸�CTRY�KCATCH �غc�����V�h�� Transact-SQL ���z���϶��C
  �Ҧp�ATRY�KCATCH �غc�����V Transact-SQL ���z������� BEGIN�KEND �϶��A�]�����V IF�KELSE �غc�C

���~�T���d�I/�^�����~��T
  �b CATCH �϶����d�򤺡A�U�C�t�Ψ�ƥi�ΨӨ��o�y������ CATCH �϶������~��������T�G

ERROR_NUMBER()    �|�Ǧ^���~�X�C
ERROR_SEVERITY()  �|�Ǧ^�Y���ʡC
ERROR_STATE()     �|�Ǧ^���~���A�X�C
ERROR_PROCEDURE() �|�Ǧ^�o�Ϳ��~���w�s�{�ǩ�Ĳ�o�{�Ǫ��W�١C
ERROR_LINE()      �|�Ǧ^�`�����y�����~���渹�C
ERROR_MESSAGE()   �|�Ǧ^���~�T���������r�C��r�]�A���ѵ�����i���N�Ѽƪ��ȡA�Ҧp�A���סB����W�٩Φ��ơC

*/
------------------------------------------------------------------------------------------
--��1 �� try �d�I��  �B�⦳�~�� �� catch  �O�����~�T��

BEGIN TRY
    -- Generate divide-by-zero error.
    SELECT 1/0;
END TRY
BEGIN CATCH
    -- �d�I���~�T��
   SELECT
    ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_LINE() AS ErrorLine
    ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
go

-------------------------------------------------------------

--��2 ��g�� �� procedure �O�����~�T��; �� try �d�I�� �B�⦳�~�� �� catch �I�s procdure ���

USE AdventureWorks2016CTP3;
GO
-- Verify that the stored procedure does not already exist.
IF OBJECT_ID ( 'usp_GetErrorInfo', 'P' ) IS NOT NULL 
    DROP PROCEDURE usp_GetErrorInfo;
GO

-- Create procedure to retrieve error information.
CREATE PROCEDURE usp_GetErrorInfo
AS
SELECT
    ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_LINE() AS ErrorLine
    ,ERROR_MESSAGE() AS ErrorMessage;
GO

BEGIN TRY
    -- Generate divide-by-zero error.
    SELECT 1/0;
END TRY
BEGIN CATCH
    -- Execute error retrieval routine.
    EXECUTE usp_GetErrorInfo;
END CATCH;

--------------------------------------------------------------------------------------------
--�U�C�{���X�d����ܦp��b TRY �϶����ϥ� RAISERROR�A�ϰ����m��������p�� CATCH �϶��C
--�o�ӽd�Ҥ]�|��ܦp��Q�� RAISERROR�A�ӶǦ^�s�� CATCH �϶������~��������T�C
--��3

BEGIN TRY
    RAISERROR (66666, 19, 1) WITH LOG  
    PRINT '�S���o�ͭ��j���~'                   
END TRY                                        
BEGIN CATCH  
    IF ERROR_SEVERITY() > 16   
      PRINT '�o���Y�����~�I�гq���޲z��, ���~�s����:' + 
			CAST(ERROR_NUMBER() AS CHAR)
    ELSE 
	  PRINT '�o�Ϳ��~�I���~�T����:' + ERROR_MESSAGE()
END CATCH

GO

------------------------------------------------------------------------------
--��4

BEGIN TRY
    
    RAISERROR (66666, 19, 1) WITH LOG  
END TRY
BEGIN CATCH
  
    print 'ErrorMessage: '+cast( ERROR_MESSAGE() as char)
    print 'ErrorServerity: '+cast( ERROR_SEVERITY() as char)
    print 'ErrorState: '+cast( ERROR_STATE() as char)
    
END CATCH;

--��3  �u�W�ѽd�Ҧ����D
BEGIN TRY
    -- RAISERROR with severity 11-19 will cause execution to 
    -- jump to the CATCH block.
    RAISERROR ('Error raised in TRY block.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    -- Use RAISERROR inside the CATCH block to return error
    -- information about the original error that caused
    -- execution to jump to the CATCH block.
    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH;

--���~�T��
/*�T�� 50000�A�h�� 16�A���A 1�A�� 22
  Error raised in TRY block.
*/

-------------------------------------------------------------------------------
--��5 �{�����y�k���~�θ�ƪ��s�b �h�����פ�妸 ���|�� CATCH
/* �T�� 208�A�h�� 16�A���A 1�A�� 2
   �L�Ī�����W�� '��ƪ�ABC'�C
*/

BEGIN TRY
    SELECT * FROM ��ƪ�ABC
END TRY
BEGIN CATCH
    PRINT 'TRY�KCATCH �o�{�@�ӿ��~�G' + ERROR_MESSAGE()
END CATCH

-----------------------------------------------------------------------------
--��6 
CREATE TABLE dbo.TableWithKey 
(ColA int PRIMARY KEY, ColB int)
GO

--
SELECT * 
FROM dbo.TableWithKey 
go
--
CREATE PROCEDURE dbo.AddData 
	@a int, @b int 
AS
BEGIN TRY
	INSERT INTO TableWithKey 
	VALUES (@a, @b)
END TRY

BEGIN CATCH 
	SELECT ERROR_NUMBER() N'���~�X', 
			ERROR_MESSAGE() N'���~�T��'
END CATCH

GO

--
EXEC dbo.AddData 1, 1

--
EXEC dbo.AddData 2, 2

-- �H�� Primary Key
EXEC dbo.AddData 1, 3

--
SELECT * FROM TableWithKey

-- �H�� Primary Key
INSERT TableWithKey 
VALUES(1,3)
