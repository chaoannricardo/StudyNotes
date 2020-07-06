package SQLIMP;

import java.sql.*;

import javax.swing.JOptionPane;

public class test {

	public static void main(String[] args) {

		// 建立對話框所需要的陣列
		String[] arrayyear = { "2019", "2020", "2021", "2022", "2023", "2024", "2025" };
		String[] arraymonth = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };
		String[] arrayday = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
				"16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" };
		String[] arrayhour = { "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14",
				"15", "16", "17", "18", "19", "20", "21", "22", "23" };
		String[] arrayminute = { "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13",
				"14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
				"31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47",
				"48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59" };
		Integer[] movieID = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		String[] roomID = { "A廳", "B廳", "C廳" };

		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=DB01", "sa",
				"password");
				// PrepareStatement設定playlist值
				PreparedStatement Preparestatement0 = connection
						.prepareStatement("insert into playlist values (?-?-? ?:?, ?, ?)");

		) {
			// 對話框輸入預定參數
			Object selectedyear = JOptionPane.showInputDialog(null, "請輸入預定年分", "請輸入預定日期", JOptionPane.PLAIN_MESSAGE,
					null, arrayyear, "2019");
			Object selectedmonth = JOptionPane.showInputDialog(null, "請輸入預定月分", "請輸入預定日期", JOptionPane.PLAIN_MESSAGE,
					null, arraymonth, "01");
			Object selectedday = JOptionPane.showInputDialog(null, "請輸入預定日期", "請輸入預定日期", JOptionPane.PLAIN_MESSAGE,
					null, arrayday, "01");
			Object selectedhour = JOptionPane.showInputDialog(null, "請輸入預定時間(時)", "請輸入預定時間", JOptionPane.PLAIN_MESSAGE,
					null, arrayhour, "00");
			Object selectedminute = JOptionPane.showInputDialog(null, "請輸入預定時間(分)", "請輸入預定時間",
					JOptionPane.PLAIN_MESSAGE, null, arrayminute, "00");
			Object selectedmovieID = JOptionPane.showInputDialog(null, "請輸入預定電影代號", "請輸入預定電影代號",
					JOptionPane.PLAIN_MESSAGE, null, movieID, 1);
			Object selectedroomID = JOptionPane.showInputDialog(null, "請輸入預定電影廳", "請輸入預定電影廳", JOptionPane.PLAIN_MESSAGE,
					null, roomID, "A廳");

			// 傳入參數
			Preparestatement0.setString(1, (String) selectedyear);
			Preparestatement0.setString(2, (String) selectedmonth);
			Preparestatement0.setString(3, (String) selectedday);
			Preparestatement0.setString(4, (String) selectedhour);
			Preparestatement0.setString(5, (String) selectedminute);
			Preparestatement0.setInt(6, (Integer) selectedmovieID);
			Preparestatement0.setString(7, (String) selectedroomID);

			// preparedStatement0執行
			Preparestatement0.execute();
			// 清空preparedStatement0中的參數
			Preparestatement0.clearParameters();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");
		}

	}

}
