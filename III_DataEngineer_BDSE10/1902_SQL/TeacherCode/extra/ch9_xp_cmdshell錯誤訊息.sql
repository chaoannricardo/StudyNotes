--第一次執行時 會有錯誤, 因預設是安全理由而封鎖, 須先 sp_configure 開啟服務

EXEC master..xp_cmdshell 'dir c:\'


--開啟服務
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;


--關閉服務
EXEC sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell', 0;RECONFIGURE;

/*
SQL Server 已封鎖元件 'xp_cmdshell' 之存取，因為此元件已經由此伺服器的安全性組態關閉。
系統管理員可以使用 sp_configure 來啟用 'xp_cmdshell' 的使用。如需有關啟用 'xp_cmdshell' 
的詳細資訊，請參閱《SQL Server 線上叢書》中的＜介面區組態＞(Surface Area Configuration)。

解決方法：

開啟服務
EXEC sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell', 1;RECONFIGURE;
關閉服務
EXEC sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell', 0;RECONFIGURE;
*/