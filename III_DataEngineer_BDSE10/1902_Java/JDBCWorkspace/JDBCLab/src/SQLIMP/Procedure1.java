package SQLIMP;

import java.sql.*;

import javax.swing.JOptionPane;

public class Procedure1 {

	public static void main(String[] args) {

		String[] Array0 = { "A廳", "B廳", "C廳" };

		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=DB01", "sa",
				"password");
				Statement statement = connection.createStatement();
				PreparedStatement preparedStatement0 = connection.prepareStatement(
						"select '有' + convert(varchar(50), seat_row*seat_col) + '個位子' from m_room where roomid like ? ");
				PreparedStatement preparedStatement1 = connection
						.prepareStatement("insert into seats values ('2016-12-25 13:00', 1, ?, '0', NULL)");

		) {

			// SQL指令 "insert into playlist values ('2016-12-25 13:00', 1, 'A廳')"
			statement.executeUpdate("insert into playlist values ('2016-12-25 13:00', 1, 'A廳')");

			// 對話框詢問影廳總座位數
			Object selectedvenue = JOptionPane.showInputDialog(null, "請輸入影廳名稱", "影廳座位數查詢", JOptionPane.PLAIN_MESSAGE,
					null, Array0, "A廳");

			preparedStatement0.setString(1, (String) selectedvenue);
			// preparedStatement0執行
			preparedStatement0.executeQuery();
			// 清空preparedStatement0中的參數
			preparedStatement0.clearParameters();

			// 輸入座位表
			if (selectedvenue.equals("A廳")) {
				for (int i = 1; i < 26;) {
					for (int j = 1; j < 21; j++) {
						preparedStatement1.setString(1, i + "-" + j);
						preparedStatement1.executeUpdate();
						preparedStatement1.clearParameters();
					}
					i++;
				}

			} else if (selectedvenue.equals("B廳")) {
				for (int i = 1; i < 21;) {
					for (int j = 1; j < 21; j++) {
						preparedStatement1.setString(1, i + "-" + j);
						preparedStatement1.executeUpdate();
						preparedStatement1.clearParameters();
					}
					i++;
				}
			} else if (selectedvenue.equals("C廳")) {
				for (int i = 1; i < 16;) {
					for (int j = 1; j < 16; j++) {
						preparedStatement1.setString(1, i + "-" + j);
						preparedStatement1.executeUpdate();
						preparedStatement1.clearParameters();
					}
					i++;
				}
			}

		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");
		}

	}

}
