--�Ĥ@������� �|�����~, �]�w�]�O�w���z�Ѧӫ���, ���� sp_configure �}�ҪA��

EXEC master..xp_cmdshell 'dir c:\'


--�}�ҪA��
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;


--�����A��
EXEC sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell', 0;RECONFIGURE;

/*
SQL Server �w���ꤸ�� 'xp_cmdshell' ���s���A�]��������w�g�Ѧ����A�����w���ʲպA�����C
�t�κ޲z���i�H�ϥ� sp_configure �ӱҥ� 'xp_cmdshell' ���ϥΡC�p�ݦ����ҥ� 'xp_cmdshell' 
���ԲӸ�T�A�аѾ\�mSQL Server �u�W�O�ѡn�����դ����ϲպA��(Surface Area Configuration)�C

�ѨM��k�G

�}�ҪA��
EXEC sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell', 1;RECONFIGURE;
�����A��
EXEC sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell', 0;RECONFIGURE;
*/