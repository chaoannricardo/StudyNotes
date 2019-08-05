/*
**  This file contains examples from 'Module 3: Creating and Managing Databases'.
**  To use the file, highlight and execute each example.
**	
**  FILEGROWTH
**
**Example
**The following example creates a database called Sample with a 10-MB 
**primary data file and a 3-MB log file.
*/

USE MASTER
GO
DROP DATABASE Sample
GO
CREATE DATABASE Sample
ON
  PRIMARY ( NAME=SampleData,  
  FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sample.mdf', 
  SIZE=10MB,
  MAXSIZE=15MB,
  FILEGROWTH=20%) 
LOG ON 
  ( NAME=SampleLog, 
  FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sample.ldf', 
  SIZE=3MB,
  MAXSIZE=5MB,
  FILEGROWTH=1MB)
GO

--查詢資料庫相關資訊

sp_helpdb                    --伺服器上所有db預留空間
sp_helpdb    Northwind
sp_spaceused Employees       --db剩餘空間
dbcc  sqlperf ( logspace )   --查看 log 使用量及狀態


/*
**Sizing the Default Filegroup
**
**The following example creates a user-defined filegroup in the 
**northwind database and adds a secondary data file to the user-defined 
**filegroup.
*/

USE MASTER
GO
ALTER DATABASE Northwind
ADD FILEGROUP OrderHistoryGroup
GO
ALTER DATABASE Northwind
ADD FILE
  ( NAME = 'OrdHistYear1',
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OrdHist1.ndf',
    SIZE = 5MB)
TO FILEGROUP OrderHistoryGroup
GO

/*
**Adding Secondary Database Files
**
**Example
**The following example increases the current log size and adds a 
**secondary data file to the sample database.
*/

USE MASTER
GO
ALTER DATABASE Sample
  MODIFY FILE ( NAME = 'SampleLog',
 SIZE = 15MB)
GO

ALTER DATABASE Sample
ADD FILE
(NAME = 'SampleData2' ,
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sample2.ndf',
SIZE=15MB ,
MAXSIZE=20MB)
GO


/*
**Shrinking an Entire Database
**
**Example --保留可用空間%
**This example shrinks the size of the sample database to have 25 percent 
**free space. 
*/

USE MASTER
GO
DBCC SHRINKDATABASE (Sample, 25)
GO

/*
**Shrinking a Data File in the Database
**
**Example --指定大小(MB)
**This example shrinks the size of the sample data file to 10 MB.
*/

USE SAMPLE
GO
DBCC SHRINKFILE (SampleData, 10)
GO

/*
**Methods of Dropping a Database
**
**Example
**This example drops multiple databases by using one statement.
*/

USE MASTER
GO
DROP DATABASE Sample

GO

