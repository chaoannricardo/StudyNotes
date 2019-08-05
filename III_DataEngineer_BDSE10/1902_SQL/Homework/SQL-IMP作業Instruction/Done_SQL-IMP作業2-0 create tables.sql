--先執行 scripts 建立相關表格---------------------
 
USE DB01   --或其它 DB
GO

--放映表 : playlist

create table playlist   
(
  ptime      datetime,      --放映時間
  movie      int,           --電影代號
  roomid     varchar(10)    --廳院       
);  
GO

--每廳院座位數表 :  m_room

create table m_room
(
  roomid     varchar(10),   --廳院
  seat_row   int,           --列數
  seat_col   int            --排數      
);   
GO
     
insert into m_room values ('A廳', 25,20);
insert into m_room values ('B廳', 20,20);
insert into m_room values ('C廳', 15,15);
GO

--座位表:  seats  
    
create table seats
(
  ptime      datetime,     --放映時間
  movie      int,          --電影代號
  seat_num   char(5),      --由 row於col組合  12-15　第12排15號
  sold       char(1),      --1 表　售出,  0 表未售出
  ordid     int            --訂單編號 預設 null 
);     
GO

select * from m_room;
go

--結束 scripts ---------------------------------------------------------------
