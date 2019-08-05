--建cust 客戶主表 
use Northwind    --或其他資料庫如 sample2
go

drop table cust4
go
create table cust4
(
  cno   int     ,
  name  char(10),
  c3    int
);
go

--測試
insert into cust4 values (101,'張三',10);
insert into cust4 values (102,'李四',20);
insert into cust4 values (103,'aa',30);
insert into cust4 values (104,'bb',40);
insert into cust4 values (105,'cc',50);
insert into cust4 values (106,'dd',60);
   
--模擬多筆資料
--連續執行 15次以上
insert into cust4 select cno+4 ,name, c3+1 from cust4  

--執行 1次
insert into cust4 values (2222,'ee', 70);   

--查詢 sysindexes 透過子查詢查 cust4 的 object_id
select id, indid from  sys.sysindexes
where id  =   (select  object_id from  sys.tables where name = 'cust4')

--總筆數
select count(*)
from cust4

--資料分佈
select name, count(*)    
from cust4
group by  name

--顯示估計執行計畫 -點快捷列 執行圖示(綠色三角形) 右邊第四個 (三個口的圖示)
--此時 估計執行計畫 應為 資料表掃描
select *    from cust4 where cno  = 103
select cno  from cust4 where cno  = 103

--1建立索引 以cno欄位 再重複上列指令
-- drop  index  cust4.i41 ;
-- create  clustered index  i40 on cust4(cno);
create   index  i41 on cust4(cno);

--查詢索引1-查詢 sysindexes 透過子查詢查 cust4 的 object_id
select id, indid from  sys.sysindexes
where id  =   (select  object_id from  sys.tables where name = 'cust4')

--查詢索引2- 以SP內建procedure
exec sp_helpindex  cust4       --表格名
exec sp_help       cust4

--顯示估計執行計畫 -點快捷列 執行圖示(綠色三角形) 右邊第四個 (三個口的圖示)
--此時 估計執行計畫 應為 INDEX  i41

select *    from cust4 where cno  = 103
select cno  from cust4 where cno  = 103

--2.1以姓名name 查詢 仍是 資料表掃描
select *    from cust4 where name = 'aa'
select *    from cust4 where name = 'ee'     --cno =2222
select name from cust4 where name = 'aa'
select cno  from cust4 where name = 'aa'

--2.2建立索引 以 name欄位 再重複上列指令
create   index  i42 on cust4(name);

--2.3 再查詢 2.2 的指令 觀察 估計執行計畫

--3.1 查詢 多個欄位 
select cno,name  from cust4 where cno  = 103
select cno,name  from cust4 where cno  = 103  and name = 'aa'   --若有 i43 index 則用,否則可能會選 i41
select cno,name  from cust4 where name = 'aa' and cno  = 103    --查詢順序相反, 仍選用 i41

--3.2建立索引 以cno+name欄位 再重複上列指令
create   index  i43 on cust4(cno,name);

--查詢索引
exec sp_helpindex  cust4       --表格名
exec sp_help       cust4

--維護索引1-查看是否有 片斷 Fragmentation
--未來的 Microsoft SQL Server 版本將移除這項功能。改用 sys.dm_db_index_physical_stats


--查看碎裂情形 --刪除前
DBCC SHOWCONTIG(cust4, i41)
DBCC SHOWCONTIG(cust4, i42)

--模擬刪除大量資料
delete from cust4 where name = 'aa'
delete from cust4 where name like 'cc%'

--查看碎裂情形 --刪除後

DBCC SHOWCONTIG(cust4, i41)

--DBCC SHOWCONTIG(cust4, i42) 不用分析 i42 因為刪除 name = aa ,cc 造成cno碎裂嚴重

/*

重整前

DBCC SHOWCONTIG 正在掃描 'cust4' 資料表...
資料表: 'cust4' (597577167); 索引識別碼: 4，資料庫識別碼: 10
已執行 LEAF 層級掃描。
- 掃描頁數................................: 737
- 掃描的範圍..............................: 99
- 範圍切換..............................: 99
- 每個範圍的平均頁數........................: 7.4
- 掃描密度 [Best Count:Actual Count].......: 93.00% [93:100]
- 邏輯掃描片段 ..................: 1.63%
- 範圍掃描片段 ...................: 18.18%
- 每個頁面的平均可用位元組數.....................: 1743.5       <---每個page有 1743 byte 可用free,空太多
- 平均頁面密度 (全滿).....................: 78.46%              <-- page 利用率只有 78.46 %
DBCC 的執行已經完成。如果 DBCC 印出錯誤訊息，請連絡您的系統管理員。

重整後
DBCC SHOWCONTIG 正在掃描 'cust4' 資料表...
資料表: 'cust4' (597577167); 索引識別碼: 4，資料庫識別碼: 10
已執行 LEAF 層級掃描。
- 掃描頁數................................: 588
- 掃描的範圍..............................: 75
- 範圍切換..............................: 74
- 每個範圍的平均頁數........................: 7.8
- 掃描密度 [Best Count:Actual Count].......: 98.67% [74:75]
- 邏輯掃描片段 ..................: 1.02%
- 範圍掃描片段 ...................: 41.33%
- 每個頁面的平均可用位元組數.....................: 133.8      <---每個page有 133 byte 可用free
- 平均頁面密度 (全滿).....................: 98.35%            <-- page 利用率已有 98.35 %
DBCC 的執行已經完成。如果 DBCC 印出錯誤訊息，請連絡您的系統管理員。

*/


--維護索引2查看是否有 片斷 Fragmentation
--未來的 Microsoft SQL Server 版本將移除這項功能(DBCC SHOWCONTIG)。改用 sys.dm_db_index_physical_stats

SELECT * FROM sys.dm_db_index_physical_stats(DB_ID('northwind'), OBJECT_ID('dbo.cust4'), NULL, NULL , 'DETAILED')

/*
database_id object_id   index_id    partition_number index_type_desc                                              alloc_unit_type_desc                                         index_depth index_level avg_fragmentation_in_percent fragment_count       avg_fragment_size_in_pages page_count           avg_page_space_used_in_percent record_count         ghost_record_count   version_ghost_record_count min_record_size_in_bytes max_record_size_in_bytes avg_record_size_in_bytes forwarded_record_count compressed_page_count
----------- ----------- ----------- ---------------- ------------------------------------------------------------ ------------------------------------------------------------ ----------- ----------- ---------------------------- -------------------- -------------------------- -------------------- ------------------------------ -------------------- -------------------- -------------------------- ------------------------ ------------------------ ------------------------ ---------------------- ---------------------
10          277576027   0           1                HEAP                                                         IN_ROW_DATA                                                  1           0           70                           11                   2.27272727272727           25                   77.6239189523103               6526                 0                    0                          21                       29                       21.467                   0                      0
10          277576027   4           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           0           80                           33                   1.21212121212121           40                   48.3518655794416               6526                 0                    0                          22                       22                       22                       NULL                   0
10          277576027   4           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           1           0                            1                    1                          1                    14.801087225105                40                   0                    0                          28                       28                       28                       NULL                   0
10          277576027   5           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           0           60.9756097560976             27                   1.51851851851852           41                   55.0380652335063               6526                 0                    0                          26                       26                       26                       NULL                   0
10          277576027   5           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           1           0                            1                    1                          1                    17.1979243884359               41                   0                    0                          32                       32                       32                       NULL                   0
10          277576027   6           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           0           81.8181818181818             19                   1.15789473684211           22                   65.9433531010625               6526                 0                    0                          16                       16                       16                       NULL                   0
10          277576027   6           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           1           0                            1                    1                          1                    6.49864096861873               22                   0                    0                          22                       22                       22                       NULL                   0

(7 個資料列受到影響)

*/

--消除片斷1: 重組指定資料表或檢視的索引
--語法 DBCC INDEXDEFRAG( database_name, table_name, index_name )
--下一版的 Microsoft SQL Server 將不再提供此功能。 請改用 ALTER INDEX .. REORGANIZE
--微軟建議 片斷(Fragmentation)情形 < 30% 須 REORGANIZE, > 30% 須  REBUILD

DBCC INDEXDEFRAG(northwind, cust4, i41)
 
--或
alter index i42 on cust4 REORGANIZE

--查看碎裂情形 --重組後
DBCC SHOWCONTIG(cust4, i41)

--消除片斷2: 重建-在指定的資料庫中，重建資料表的一或多個索引
--語法 DBCC DBREINDEX( table_name , index_name [ , fillfactor ] )
--下一版的 Microsoft SQL Server 將不再提供此功能。請改用 ALTER INDEX .. REBUILD

DBCC DBREINDEX(cust4, i41)
DBCC DBREINDEX(cust4, i42)
DBCC DBREINDEX(cust4, i42, 70)

--或
alter index i42 on cust4 REBUILD

--查看碎裂情形 --重建後
DBCC SHOWCONTIG(cust4, i41)


------End ----------------
--4. 補充其他 Sort
select *    from cust4 order by cno     --未用到 i41 index
select cno  from cust4 order by cno     --有用到 i41 index


--額外test 複合索引及 INCLUDE語法
--建index i52 三個欄位建索引, 且三個欄位都有排序
create index  i52  on cust4( name, cno, c3)

--建index i53 三個欄位建索引, 但只有name 有排序, cno, c3 沒排序
create index  i53  on cust4( name) include ( cno, c3)

--會用到 i52
select name, cno, c3 from  cust4 where  name = 'aa' and cno = 103 and c3 = 10

--理論上只會用到 i53 但係統可能判斷選擇i52
select name, cno, c3 from  cust4 where  name = 'aa'  
select name, cno, c3 from  cust4 where  name = 'aa' order by name
