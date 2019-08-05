--程式開始


BEGIN
  DECLARE   @v_row     int;
  DECLARE   @v_col     int;
  DECLARE   @v_ptime   varchar(20); 
  DECLARE   @v_movie   int;
  DECLARE   @v_roomid  varchar(10);
  DECLARE   @x_row     int;
  DECLARE   @x_col     int;

  --設定變數值
  SET @v_ptime  = '2016-12-25 13:00';
  SET @v_movie  = 1;
  SET @v_roomid = 'A廳';

  --先查尋 指定廳院之座位數 row, col
  select @v_row = seat_row , @v_col = seat_col
  from   m_room
  where  roomid = @v_roomid

  --根據座位數 @v_row, @v_col 產生座位表
  SET @x_row = 1;       
    WHILE ( @x_row  <= @v_row )
      BEGIN
        SET @x_col = 1;     
        WHILE ( @x_col  <= @v_col )
          BEGIN
            insert into seats values (cast (@v_ptime as datetime), @v_movie, cast(@x_row as varchar(2)) + '-' + cast(@x_col as varchar(2)), '0', NULL);
            set @x_col = @x_col + 1   --增加 @x_col
          END; 
        -- 設定 @x_row, @x_col
		set @x_row = @x_row + 1
		set @x_col = 1
      END;
END;
    
--程式結束
   