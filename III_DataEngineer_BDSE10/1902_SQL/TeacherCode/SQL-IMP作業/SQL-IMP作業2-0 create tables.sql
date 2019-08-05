--������ scripts �إ߬������---------------------
 
USE DB01   --�Ψ䥦 DB
GO

--��M�� : playlist

create table playlist   
(
  ptime      datetime,      --��M�ɶ�
  movie      int,           --�q�v�N��
  roomid     varchar(10)    --�U�|       
);  
GO

--�C�U�|�y��ƪ� :  m_room

create table m_room
(
  roomid     varchar(10),   --�U�|
  seat_row   int,           --�C��
  seat_col   int            --�Ƽ�      
);   
GO
     
insert into m_room values ('A�U', 25,20);
insert into m_room values ('B�U', 20,20);
insert into m_room values ('C�U', 15,15);
GO

--�y���:  seats  
    
create table seats
(
  ptime      datetime,     --��M�ɶ�
  movie      int,          --�q�v�N��
  seat_num   char(5),      --�� row��col�զX  12-15�@��12��15��
  sold       char(1),      --1 ��@��X,  0 ����X
  ordid     int            --�q��s�� �w�] null 
);     
GO

select * from m_room;
go

--���� scripts ---------------------------------------------------------------
