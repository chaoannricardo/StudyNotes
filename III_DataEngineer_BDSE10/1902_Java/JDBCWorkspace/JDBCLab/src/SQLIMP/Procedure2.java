package SQLIMP;

import java.sql.*;

import javax.swing.JOptionPane;

public class Procedure2 {

	public static void main(String[] args) {

		// 建立對話框所需要的陣列
		Integer[] movieID = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		String[] roomID = { "A廳", "B廳", "C廳" };

		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=DB01", "sa",
				"password");
				// PrepareStatement設定playlist值
				PreparedStatement Preparestatement0 = connection
						.prepareStatement("insert into playlist values (cast(? as datetime), ?, ?)");
				PreparedStatement Preparestatement1 = connection
						.prepareStatement("use DB01 exec gen_seats @v_ptime = ?, @v_movie = ?, @v_roomid = ?");

		) {
			// 對話框輸入預定參數
			String selectedtime = JOptionPane.showInputDialog("格式範例：2016-12-25 13:00", "請輸入預定日期及時間");
			Object selectedmovieID = JOptionPane.showInputDialog(null, "請輸入預定電影代號", "請輸入預定電影代號",
					JOptionPane.PLAIN_MESSAGE, null, movieID, 1);
			Object selectedroomID = JOptionPane.showInputDialog(null, "請輸入預定電影廳", "請輸入預定電影廳", JOptionPane.PLAIN_MESSAGE,
					null, roomID, "A廳");

			// 傳入參數
			Preparestatement0.setString(1, (String) selectedtime);
			Preparestatement0.setInt(2, (Integer) selectedmovieID);
			Preparestatement0.setString(3, (String) selectedroomID);
			Preparestatement1.setString(1, (String) selectedtime);
			Preparestatement1.setInt(2, (Integer) selectedmovieID);
			Preparestatement1.setString(3, (String) selectedroomID);

			// preparedStatement1、0執行
			Preparestatement0.execute();
			Preparestatement1.execute();
			// 清空preparedStatement1、0中的參數
			Preparestatement0.clearParameters();
			Preparestatement1.clearParameters();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");
		}

	}

}
