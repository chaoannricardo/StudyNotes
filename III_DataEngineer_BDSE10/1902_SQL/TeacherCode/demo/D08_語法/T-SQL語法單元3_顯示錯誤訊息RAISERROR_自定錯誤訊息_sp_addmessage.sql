--1 RAISERROR : ��ܿ��~�T����T
--2 sp_addmessage �ۭq���~�T��
--3 SQL2012 ��ĳ�N RAISERROR ��� THROW

-----------------------------------------------------------------
--RAISERROR : ��ܿ��~�T����T

/*
�w�q
 RAISERROR �]�i�ΨӶǦ^�T���C�۸��� PRINT�ARAISERROR ���U�C�u�I�G
 RAISERROR �䴩�Q�ΥH C �y���зǵ{���w printf ��Ƭ���¦�ӫإ߫��Ҫ�����A�N�޼ƥN�J���~�T�����C
 ���F��r�T�����~�ARAISERROR �٥i�H���w�ߤ@���~���X�B�Y���ʩM���A�X�C
 RAISERROR �i�ΨӶǦ^�Q�� sp_addmessage �t�ιw�s�{�ǫإߪ��ϥΪ̦ۭq�T���C

�y�k
RAISERROR ( { msg_id | msg_str | @local_variable }
           { ,severity ,state }
           [ ,argument [ ,...n ] ] )
          [ WITH option [ ,...n ] ]

��1  severity �ϥΪ̦ۭq�Y���ʼh�šC����ϥΪ̬ҥi���w�q 0 �� 18 ���Y���ʼh�šC
       �q 19 �� 25 ���Y���ʼh�ťu��Ѩt�κ޲z�� (sysadmin) �T�w���A�����⦨��
       �Ψ㦳 ALTER TRACE �v�����ϥΪ̫��w�C

��2  state ���� 0 �� 255 ��������ơC�t�ȩΤj�� 255 ���ȷ|���Ϳ��~�C
      �p�G�ۦP���ϥΪ̦ۭq���~�b�h�Ӧ�m�޵o�A�w��C�Ӧ�m�ϥΰߤ@��
      ���A�X�i�H��U�z��X�޵o���~���{���X�Ϭq�C

��3 ���~�����X�����q 13000 �� 2147483647�A���i�H�O 50000�C
*/

-----------------------------------------------------------------------------
--��1

RAISERROR ('���~�T��!' ,  8,    1  );   --8 = severity , 1 = state

/*
  ���~�T��!
  �T�� 50000�A�h�� 8�A���A 1
*/

--RAISERROR �P PRINT �\������ ���b�T������; SELECT �b���G����

RAISERROR ('��ܰT��1!' ,  1,    2  ); 
PRINT      '��ܰT��2!'
SELECT     '��ܰT��3!'

/*

Error Severity gives information about the type of error that occured,
upto Severity level 10 are informational messages.

11-16 are considered errors that can be fixed by the user.
17-19 are considered Non-Fatal errors in Sql Server Resources, Engine and other stuff .
20-25 are considered Fatal Error which causes sql server to shut down the process immediately

severity  = 1-8 �¦r,  9-18 ���r, 0 and 10 ����� severity �� state

19-25 �u���t�κ޲z�� (sysadmin) ���⪺�����A�~��ϥ� WITH LOG �ﶵ���w�j�� 18 �����~�Y���ʼh��

�T�� 2754�A�h�� 16�A���A 1�A�� 1
�u���t�κ޲z�� (sysadmin) ���⪺�����A�~��ϥ� WITH LOG �ﶵ���w�j�� 18 �����~�Y���ʼh�šC

�䥦�Ҥl
1 
RAISERROR ('���~�T��!' ,  1,    2 ); 

  ���~�T��!
  �T�� 50000�A�h�� 1�A���A 2

2
RAISERROR ('���~�T��!' ,  18,    2 ); 

  �T�� 50000�A�h�� 18�A���A 2�A�� 1
  ���~�T��!

3
RAISERROR ('���~�T��!' ,  10,    1  ); 

    ���~�T��!

*/



---------------------------------------------------------------------------------------
/*
sp_addmessage �ۭq���~�T��:

�b sys.messages ���إ߯S�w�T��

�y�k
 
sp_addmessage [ @msgnum = ] msg_id , [ @severity = ] severity , [ @msgtext = ] 'msg' 
     [ , [ @lang = ] 'language' ] 
     [ , [ @with_log = ] { 'TRUE' | 'FALSE' } ] 
     [ , [ @replace = ] 'replace' ] 

�Ѽ� 
  [@msgnum = ] msg_id : �ϥΪ̦ۭq���~�T���� msg_id �i�H�O 50,001 �M 2,147,483,647 ��������ơC


�U�C�d�ҷ|��ܦp��޵o�x�s�b [sys.messages] �ؿ��˵����T���C�ϥ� sp_addmessage �t�ιw�s�{�ǡA
�N�T���s���� 50005 ���T���[�J�� [sys.messages] �ؿ��˵����C
*/

---------------------------------------------------------------------------------------
--�� 5-1 �ۭq���~�T�� - ���^��ت���

--�����]���^�媩�� �T�� 15279�A�h�� 16�A���A 1�A�{�� sp_addmessage�A�� 97
--�z�������[�J�o�ӰT���� us_english �����~��[�J '�c�餤��' �����C

--�� 1
EXEC sp_addmessage 66666, 7, 'Update Complete!',  @lang = 'us_english'
GO
RAISERROR (66666, 7, 1)

EXEC sp_addmessage 66666, 7, '��s����!',  @lang = '�c�餤��', @replace = 'replace';
GO

set language '�c�餤��'
RAISERROR (66666, 7, 1)    --���~�N�X, �Y���h��, ���A

--�ۭq�����~�T�� �x�s�b sys.messages ��

select * from sys.messages where message_id = 66666

/*
message_id  language_id severity is_event_logged text
----------- ----------- -------- --------------- ------------------
66666       1028        7        0               ��s����!
66666       1033        7        0               Update Complete!

*/

--�R���ۭq�T��
exec sp_dropmessage @msgnum = 66666;  --�R���ۭq�T��

--�Y�R���T���o�Ϳ��~, ��������������, �R������T��, �A�������^��~��R�^��T��
/*   �T�� 15280�A�h�� 16�A���A 1�A�{�� sp_dropmessage�A�� 62
     All localized versions of this message must be dropped before the us_english version can be dropped.

set language '�c�餤��'
set language us_english

*/


--�ɥR--------------------------------------------------

--3 SQL2012 ��ĳ�N RAISERROR ��� THROW
--3.1 �ϥ� THROW �Ӥ޵o�ҥ~���p

THROW 51000, 'The record does not exist.', 1;

--3.2 �ϥ� THROW �ӭ��s�޵o�ҥ~���p

BEGIN TRY
      select 1/0;
  END TRY
  BEGIN CATCH
  
      PRINT 'In catch block. ����(Denominator) an not be Zero';
      THROW;
  END CATCH;


/*
(0 �Ӹ�ƦC����v�T)
In catch block. ����(Denominator) an not be Zero
�T�� 8134�A�h�� 16�A���A 1�A�� 2
�o�{���H�s�����~�C
*/
--3.3 �U�C�d�ҥܽd�p��ϥ� FORMATMESSAGE ���z���f�t THROW�A�H�Y�^�ۭq���~�T���C 

DECLARE @Message NVARCHAR(2048);
  SELECT @Message = FORMATMESSAGE(1127);
  THROW 50001, @Message, 1;

/*
�T�� 50001�A�h�� 16�A���A 1�A�� 3
*/

--�ɥR-------------------------------------------------------------------------------------
--��2
RAISERROR (N'This is message %s %d.', -- �T�����eMessage text.
           10,                        -- �Y����Severity,
           1,                         -- ���AState,
           N'number',                 -- �Ĥ@�Ѽ�First argument.
           5);                        -- �ĤG�Ѽ�Second argument.

-- The message text returned is: This is message number 5.
GO

---------------------------------------------------------------------------------------
--��3

/*
A. �q CATCH �϶��Ǧ^���~��T ��work �b try�N����������� catch
�U�C�{���X�d����ܦp��b TRY �϶����ϥ� RAISERROR�A�ϰ����m��������p�� CATCH �϶��C
�o�ӽd�Ҥ]�|��ܦp��Q�� RAISERROR�A�ӶǦ^�s�� CATCH �϶������~��������T�C
*/

BEGIN TRY
    -- RAISERROR with severity 11-19 will cause execution to 
    -- jump to the CATCH block.
    RAISERROR ('Error raised in TRY block.', -- Message text.
               19, -- Severity.
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
/* �T�� 50000�A�h�� 16�A���A 1�A�� 22
   Error raised in TRY block.
*/


---------------------------------------------------------------------------------------
--�� 5-2 
set language us_english
go
exec sp_addmessage @msgnum = 50005,
              @severity = 10,
              @msgtext = N'Error msg!',
              @replace = 'replace' ;
go
exec sp_addmessage @msgnum = 50005,
              @severity = 10,
              @msgtext = N'���~�T��!',
              @lang = '�c�餤��',
              @replace = 'replace' ;


GO
RAISERROR (50005, -- Message id.
           10,    -- Severity
           1      -- State
           ); 
GO
set language  �c�餤��  --����������T��
GO
RAISERROR (50005, -- Message id.
           10,    -- Severity
           1      -- State
           ); 
GO

exec sp_dropmessage @msgnum = 50005;
GO
set language  �c�餤��
