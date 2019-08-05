--��cust �Ȥ�D�� 
use Northwind    --�Ψ�L��Ʈw�p sample2
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

--����
insert into cust4 values (101,'�i�T',10);
insert into cust4 values (102,'���|',20);
insert into cust4 values (103,'aa',30);
insert into cust4 values (104,'bb',40);
insert into cust4 values (105,'cc',50);
insert into cust4 values (106,'dd',60);
   
--�����h�����
--�s����� 15���H�W
insert into cust4 select cno+4 ,name, c3+1 from cust4  

--���� 1��
insert into cust4 values (2222,'ee', 70);   

--�d�� sysindexes �z�L�l�d�߬d cust4 �� object_id
select id, indid from  sys.sysindexes
where id  =   (select  object_id from  sys.tables where name = 'cust4')

--�`����
select count(*)
from cust4

--��Ƥ��G
select name, count(*)    
from cust4
group by  name

--��ܦ��p����p�e -�I�ֱ��C ����ϥ�(���T����) �k��ĥ|�� (�T�Ӥf���ϥ�)
--���� ���p����p�e ���� ��ƪ��y
select *    from cust4 where cno  = 103
select cno  from cust4 where cno  = 103

--1�إ߯��� �Hcno��� �A���ƤW�C���O
-- drop  index  cust4.i41 ;
-- create  clustered index  i40 on cust4(cno);
create   index  i41 on cust4(cno);

--�d�߯���1-�d�� sysindexes �z�L�l�d�߬d cust4 �� object_id
select id, indid from  sys.sysindexes
where id  =   (select  object_id from  sys.tables where name = 'cust4')

--�d�߯���2- �HSP����procedure
exec sp_helpindex  cust4       --���W
exec sp_help       cust4

--��ܦ��p����p�e -�I�ֱ��C ����ϥ�(���T����) �k��ĥ|�� (�T�Ӥf���ϥ�)
--���� ���p����p�e ���� INDEX  i41

select *    from cust4 where cno  = 103
select cno  from cust4 where cno  = 103

--2.1�H�m�Wname �d�� ���O ��ƪ��y
select *    from cust4 where name = 'aa'
select *    from cust4 where name = 'ee'     --cno =2222
select name from cust4 where name = 'aa'
select cno  from cust4 where name = 'aa'

--2.2�إ߯��� �H name��� �A���ƤW�C���O
create   index  i42 on cust4(name);

--2.3 �A�d�� 2.2 �����O �[�� ���p����p�e

--3.1 �d�� �h����� 
select cno,name  from cust4 where cno  = 103
select cno,name  from cust4 where cno  = 103  and name = 'aa'   --�Y�� i43 index �h��,�_�h�i��|�� i41
select cno,name  from cust4 where name = 'aa' and cno  = 103    --�d�߶��Ǭۤ�, ����� i41

--3.2�إ߯��� �Hcno+name��� �A���ƤW�C���O
create   index  i43 on cust4(cno,name);

--�d�߯���
exec sp_helpindex  cust4       --���W
exec sp_help       cust4

--���@����1-�d�ݬO�_�� ���_ Fragmentation
--���Ӫ� Microsoft SQL Server �����N�����o���\��C��� sys.dm_db_index_physical_stats


--�d�ݸH������ --�R���e
DBCC SHOWCONTIG(cust4, i41)
DBCC SHOWCONTIG(cust4, i42)

--�����R���j�q���
delete from cust4 where name = 'aa'
delete from cust4 where name like 'cc%'

--�d�ݸH������ --�R����

DBCC SHOWCONTIG(cust4, i41)

--DBCC SHOWCONTIG(cust4, i42) ���Τ��R i42 �]���R�� name = aa ,cc �y��cno�H���Y��

/*

����e

DBCC SHOWCONTIG ���b���y 'cust4' ��ƪ�...
��ƪ�: 'cust4' (597577167); �����ѧO�X: 4�A��Ʈw�ѧO�X: 10
�w���� LEAF �h�ű��y�C
- ���y����................................: 737
- ���y���d��..............................: 99
- �d�����..............................: 99
- �C�ӽd�򪺥�������........................: 7.4
- ���y�K�� [Best Count:Actual Count].......: 93.00% [93:100]
- �޿豽�y���q ..................: 1.63%
- �d�򱽴y���q ...................: 18.18%
- �C�ӭ����������i�Φ줸�ռ�.....................: 1743.5       <---�C��page�� 1743 byte �i��free,�ŤӦh
- ���������K�� (����).....................: 78.46%              <-- page �Q�βv�u�� 78.46 %
DBCC ������w�g�����C�p�G DBCC �L�X���~�T���A�гs���z���t�κ޲z���C

�����
DBCC SHOWCONTIG ���b���y 'cust4' ��ƪ�...
��ƪ�: 'cust4' (597577167); �����ѧO�X: 4�A��Ʈw�ѧO�X: 10
�w���� LEAF �h�ű��y�C
- ���y����................................: 588
- ���y���d��..............................: 75
- �d�����..............................: 74
- �C�ӽd�򪺥�������........................: 7.8
- ���y�K�� [Best Count:Actual Count].......: 98.67% [74:75]
- �޿豽�y���q ..................: 1.02%
- �d�򱽴y���q ...................: 41.33%
- �C�ӭ����������i�Φ줸�ռ�.....................: 133.8      <---�C��page�� 133 byte �i��free
- ���������K�� (����).....................: 98.35%            <-- page �Q�βv�w�� 98.35 %
DBCC ������w�g�����C�p�G DBCC �L�X���~�T���A�гs���z���t�κ޲z���C

*/


--���@����2�d�ݬO�_�� ���_ Fragmentation
--���Ӫ� Microsoft SQL Server �����N�����o���\��(DBCC SHOWCONTIG)�C��� sys.dm_db_index_physical_stats

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

(7 �Ӹ�ƦC����v�T)

*/

--�������_1: ���ի��w��ƪ���˵�������
--�y�k DBCC INDEXDEFRAG( database_name, table_name, index_name )
--�U�@���� Microsoft SQL Server �N���A���Ѧ��\��C �Ч�� ALTER INDEX .. REORGANIZE
--�L�n��ĳ ���_(Fragmentation)���� < 30% �� REORGANIZE, > 30% ��  REBUILD

DBCC INDEXDEFRAG(northwind, cust4, i41)
 
--��
alter index i42 on cust4 REORGANIZE

--�d�ݸH������ --���ի�
DBCC SHOWCONTIG(cust4, i41)

--�������_2: ����-�b���w����Ʈw���A���ظ�ƪ��@�Φh�ӯ���
--�y�k DBCC DBREINDEX( table_name , index_name [ , fillfactor ] )
--�U�@���� Microsoft SQL Server �N���A���Ѧ��\��C�Ч�� ALTER INDEX .. REBUILD

DBCC DBREINDEX(cust4, i41)
DBCC DBREINDEX(cust4, i42)
DBCC DBREINDEX(cust4, i42, 70)

--��
alter index i42 on cust4 REBUILD

--�d�ݸH������ --���ث�
DBCC SHOWCONTIG(cust4, i41)


------End ----------------
--4. �ɥR��L Sort
select *    from cust4 order by cno     --���Ψ� i41 index
select cno  from cust4 order by cno     --���Ψ� i41 index


--�B�~test �ƦX���ޤ� INCLUDE�y�k
--��index i52 �T�����د���, �B�T����쳣���Ƨ�
create index  i52  on cust4( name, cno, c3)

--��index i53 �T�����د���, ���u��name ���Ƨ�, cno, c3 �S�Ƨ�
create index  i53  on cust4( name) include ( cno, c3)

--�|�Ψ� i52
select name, cno, c3 from  cust4 where  name = 'aa' and cno = 103 and c3 = 10

--�z�פW�u�|�Ψ� i53 ���Y�Υi��P�_���i52
select name, cno, c3 from  cust4 where  name = 'aa'  
select name, cno, c3 from  cust4 where  name = 'aa' order by name
