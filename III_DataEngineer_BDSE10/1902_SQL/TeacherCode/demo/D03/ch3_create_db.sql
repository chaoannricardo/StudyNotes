--create db  basic on default 

CREATE DATABASE sample1
GO

--create db  with primary file group + log 
/* SQL 2012 PRIMARY 檔案至少要有 5 MB , Log日誌檔至少須 512KB 
   訊息 1803，層級 16，狀態 1，行 1
   CREATE DATABASE 陳述式失敗。主要檔案至少要有 5 MB，才能容納模型資料庫的副本。

   訊息 5174，層級 16，狀態 1，行 1
   每個檔案的大小必須大於或等於 512 KB。
*/

--註 須事先建好目錄 C:\mydb

CREATE DATABASE sample2
ON PRIMARY
	(NAME = sample2,
	  FILENAME = N'C:\mydb\sample2.mdf',
          SIZE = 5MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB)
LOG ON
	( NAME = sample2_log,
	  FILENAME = N'C:\mydb\sample2.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)
GO

--create db  with multiple  file group + log 
CREATE DATABASE sample3
ON PRIMARY
	(NAME = sample3,
	  FILENAME = N'C:\mydb\sample3.mdf',
          SIZE = 5MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
FILEGROUP  FILEGROUP2
	(NAME = sample3_fg2,
	  FILENAME = N'C:\mydb\sample3_fg2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB)
LOG ON
	( NAME = sample3_log,
	  FILENAME = N'C:\mydb\sample3.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)
GO

 /* 建資料表 emp 於 sample 3資料庫 的 FILEGROUP2 檔案群組上
USE sample3
go

create table emp(id int)
ON  FILEGROUP2   

--右鍵 emp 表 / 屬性/ 儲存體 : 看到建於 FILEGROUP2

*/    
--create db  with 2 files + 2 log files 
CREATE DATABASE sample4
ON PRIMARY
	(NAME = sample4_1,
	  FILENAME = N'C:\mydb\sample4_1.mdf',
          SIZE = 5MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
	 (NAME = sample4_2,
	  FILENAME = N'C:\mydb\sample4_2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB)
LOG ON
	( NAME = sample4_log_1,
	  FILENAME = N'C:\mydb\sample4_1.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),
     ( NAME = sample4_log_2,
	   FILENAME = N'C:\mydb\sample4_2.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)      
GO
                     
--create db  with 3 file groups / 2files + 2 logs files
CREATE DATABASE sample5
ON PRIMARY
	(NAME = sample5_1,
	  FILENAME = N'C:\mydb\sample5_1.mdf',
          SIZE = 5MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
	 (NAME = sample5_2,
	  FILENAME = N'C:\mydb\sample5_2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
FILEGROUP  FILEGROUP2
	(NAME = sample5_fg2_1,
	  FILENAME = N'C:\mydb\sample5_fg2_1.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
	 (NAME = sample5_fg2_2,
	  FILENAME = N'C:\mydb\sample5_fg2_2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB), 
FILEGROUP  FILEGROUP3
	(NAME = sample5_fg3_1,
	  FILENAME = N'C:\mydb\sample5_fg3_1.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
	 (NAME = sample5_fg3_2,
	  FILENAME = N'C:\mydb\sample5_fg3_2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB)                              
LOG ON
	( NAME = sample5_log_1,
	  FILENAME = N'C:\mydb\sample5_1.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),
     ( NAME = sample5_log_2,
	   FILENAME = N'C:\mydb\sample5_2.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)      
GO