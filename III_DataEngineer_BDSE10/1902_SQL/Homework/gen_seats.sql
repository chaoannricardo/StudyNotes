--�{���}�l


BEGIN
  DECLARE   @v_row     int;
  DECLARE   @v_col     int;
  DECLARE   @v_ptime   varchar(20); 
  DECLARE   @v_movie   int;
  DECLARE   @v_roomid  varchar(10);
  DECLARE   @x_row     int;
  DECLARE   @x_col     int;

  --�]�w�ܼƭ�
  SET @v_ptime  = '2016-12-25 13:00';
  SET @v_movie  = 1;
  SET @v_roomid = 'A�U';

  --���d�M ���w�U�|���y��� row, col
  select @v_row = seat_row , @v_col = seat_col
  from   m_room
  where  roomid = @v_roomid

  --�ھڮy��� @v_row, @v_col ���ͮy���
  SET @x_row = 1;       
    WHILE ( @x_row  <= @v_row )
      BEGIN
        SET @x_col = 1;     
        WHILE ( @x_col  <= @v_col )
          BEGIN
            insert into seats values (cast (@v_ptime as datetime), @v_movie, cast(@x_row as varchar(2)) + '-' + cast(@x_col as varchar(2)), '0', NULL);
            set @x_col = @x_col + 1   --�W�[ @x_col
          END; 
        -- �]�w @x_row, @x_col
		set @x_row = @x_row + 1
		set @x_col = 1
      END;
END;
    
--�{������
   