--1 RAISERROR : 顯示錯誤訊息資訊
--2 sp_addmessage 自訂錯誤訊息
--3 SQL2012 建議將 RAISERROR 改用 THROW

-----------------------------------------------------------------
--RAISERROR : 顯示錯誤訊息資訊

/*
定義
 RAISERROR 也可用來傳回訊息。相較於 PRINT，RAISERROR 有下列優點：
 RAISERROR 支援利用以 C 語言標準程式庫 printf 函數為基礎來建立型模的機制，將引數代入錯誤訊息中。
 除了文字訊息之外，RAISERROR 還可以指定唯一錯誤號碼、嚴重性和狀態碼。
 RAISERROR 可用來傳回利用 sp_addmessage 系統預存程序建立的使用者自訂訊息。

語法
RAISERROR ( { msg_id | msg_str | @local_variable }
           { ,severity ,state }
           [ ,argument [ ,...n ] ] )
          [ WITH option [ ,...n ] ]

註1  severity 使用者自訂嚴重性層級。任何使用者皆可指定從 0 到 18 的嚴重性層級。
       從 19 到 25 的嚴重性層級只能由系統管理員 (sysadmin) 固定伺服器角色成員
       或具有 ALTER TRACE 權限的使用者指定。

註2  state 介於 0 到 255 之間的整數。負值或大於 255 的值會產生錯誤。
      如果相同的使用者自訂錯誤在多個位置引發，針對每個位置使用唯一的
      狀態碼可以協助您找出引發錯誤的程式碼區段。

註3 錯誤號號碼必須從 13000 至 2147483647，不可以是 50000。
*/

-----------------------------------------------------------------------------
--例1

RAISERROR ('錯誤訊息!' ,  8,    1  );   --8 = severity , 1 = state

/*
  錯誤訊息!
  訊息 50000，層級 8，狀態 1
*/

--RAISERROR 與 PRINT 功能類似 都在訊息視窗; SELECT 在結果視窗

RAISERROR ('顯示訊息1!' ,  1,    2  ); 
PRINT      '顯示訊息2!'
SELECT     '顯示訊息3!'

/*

Error Severity gives information about the type of error that occured,
upto Severity level 10 are informational messages.

11-16 are considered errors that can be fixed by the user.
17-19 are considered Non-Fatal errors in Sql Server Resources, Engine and other stuff .
20-25 are considered Fatal Error which causes sql server to shut down the process immediately

severity  = 1-8 黑字,  9-18 紅字, 0 and 10 未顯示 severity 及 state

19-25 只有系統管理員 (sysadmin) 角色的成員，才能使用 WITH LOG 選項指定大於 18 的錯誤嚴重性層級

訊息 2754，層級 16，狀態 1，行 1
只有系統管理員 (sysadmin) 角色的成員，才能使用 WITH LOG 選項指定大於 18 的錯誤嚴重性層級。

其它例子
1 
RAISERROR ('錯誤訊息!' ,  1,    2 ); 

  錯誤訊息!
  訊息 50000，層級 1，狀態 2

2
RAISERROR ('錯誤訊息!' ,  18,    2 ); 

  訊息 50000，層級 18，狀態 2，行 1
  錯誤訊息!

3
RAISERROR ('錯誤訊息!' ,  10,    1  ); 

    錯誤訊息!

*/



---------------------------------------------------------------------------------------
/*
sp_addmessage 自訂錯誤訊息:

在 sys.messages 中建立特定訊息

語法
 
sp_addmessage [ @msgnum = ] msg_id , [ @severity = ] severity , [ @msgtext = ] 'msg' 
     [ , [ @lang = ] 'language' ] 
     [ , [ @with_log = ] { 'TRUE' | 'FALSE' } ] 
     [ , [ @replace = ] 'replace' ] 

參數 
  [@msgnum = ] msg_id : 使用者自訂錯誤訊息的 msg_id 可以是 50,001 和 2,147,483,647 之間的整數。


下列範例會顯示如何引發儲存在 [sys.messages] 目錄檢視的訊息。使用 sp_addmessage 系統預存程序，
將訊息編號為 50005 的訊息加入至 [sys.messages] 目錄檢視中。
*/

---------------------------------------------------------------------------------------
--例 5-1 自訂錯誤訊息 - 中英兩種版本

--須先設成英文版本 訊息 15279，層級 16，狀態 1，程序 sp_addmessage，行 97
--您必須先加入這個訊息的 us_english 版本才能加入 '繁體中文' 版本。

--例 1
EXEC sp_addmessage 66666, 7, 'Update Complete!',  @lang = 'us_english'
GO
RAISERROR (66666, 7, 1)

EXEC sp_addmessage 66666, 7, '更新完成!',  @lang = '繁體中文', @replace = 'replace';
GO

set language '繁體中文'
RAISERROR (66666, 7, 1)    --錯誤代碼, 嚴重層級, 狀態

--自訂的錯誤訊息 儲存在 sys.messages 表

select * from sys.messages where message_id = 66666

/*
message_id  language_id severity is_event_logged text
----------- ----------- -------- --------------- ------------------
66666       1028        7        0               更新完成!
66666       1033        7        0               Update Complete!

*/

--刪除自訂訊息
exec sp_dropmessage @msgnum = 66666;  --刪除自訂訊息

--若刪除訊息發生錯誤, 須先切換成中文, 刪除中文訊息, 再切換成英文才能刪英文訊息
/*   訊息 15280，層級 16，狀態 1，程序 sp_dropmessage，行 62
     All localized versions of this message must be dropped before the us_english version can be dropped.

set language '繁體中文'
set language us_english

*/


--補充--------------------------------------------------

--3 SQL2012 建議將 RAISERROR 改用 THROW
--3.1 使用 THROW 來引發例外狀況

THROW 51000, 'The record does not exist.', 1;

--3.2 使用 THROW 來重新引發例外狀況

BEGIN TRY
      select 1/0;
  END TRY
  BEGIN CATCH
  
      PRINT 'In catch block. 分母(Denominator) an not be Zero';
      THROW;
  END CATCH;


/*
(0 個資料列受到影響)
In catch block. 分母(Denominator) an not be Zero
訊息 8134，層級 16，狀態 1，行 2
發現除以零的錯誤。
*/
--3.3 下列範例示範如何使用 FORMATMESSAGE 陳述式搭配 THROW，以擲回自訂錯誤訊息。 

DECLARE @Message NVARCHAR(2048);
  SELECT @Message = FORMATMESSAGE(1127);
  THROW 50001, @Message, 1;

/*
訊息 50001，層級 16，狀態 1，行 3
*/

--補充-------------------------------------------------------------------------------------
--例2
RAISERROR (N'This is message %s %d.', -- 訊息內容Message text.
           10,                        -- 嚴重性Severity,
           1,                         -- 狀態State,
           N'number',                 -- 第一參數First argument.
           5);                        -- 第二參數Second argument.

-- The message text returned is: This is message number 5.
GO

---------------------------------------------------------------------------------------
--例3

/*
A. 從 CATCH 區塊傳回錯誤資訊 不work 在 try就錯不讓執行到 catch
下列程式碼範例顯示如何在 TRY 區塊內使用 RAISERROR，使執行位置跳到相關聯的 CATCH 區塊。
這個範例也會顯示如何利用 RAISERROR，來傳回叫用 CATCH 區塊之錯誤的相關資訊。
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

--錯誤訊息
/* 訊息 50000，層級 16，狀態 1，行 22
   Error raised in TRY block.
*/


---------------------------------------------------------------------------------------
--例 5-2 
set language us_english
go
exec sp_addmessage @msgnum = 50005,
              @severity = 10,
              @msgtext = N'Error msg!',
              @replace = 'replace' ;
go
exec sp_addmessage @msgnum = 50005,
              @severity = 10,
              @msgtext = N'錯誤訊息!',
              @lang = '繁體中文',
              @replace = 'replace' ;


GO
RAISERROR (50005, -- Message id.
           10,    -- Severity
           1      -- State
           ); 
GO
set language  繁體中文  --切換成中文訊息
GO
RAISERROR (50005, -- Message id.
           10,    -- Severity
           1      -- State
           ); 
GO

exec sp_dropmessage @msgnum = 50005;
GO
set language  繁體中文
