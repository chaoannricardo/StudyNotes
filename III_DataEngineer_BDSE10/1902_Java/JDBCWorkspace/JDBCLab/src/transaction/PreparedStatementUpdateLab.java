package transaction;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class PreparedStatementUpdateLab {

	public static void main(String[] args) {

		try (

				Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
						"scott", "tiger");
				
				// 設定指令
				PreparedStatement prepareStatement = connection
						.prepareStatement("update emp set salary = ? where empno = ?");
				
				) {

			// 設定指令參數
			prepareStatement.setBigDecimal(1, new BigDecimal("99999"));
			prepareStatement.setInt(2, 1012);
			// 執行指令
			prepareStatement.executeUpdate();
			// 清除參數
			prepareStatement.clearParameters();

			prepareStatement.setBigDecimal(1, new BigDecimal("500"));
			prepareStatement.setInt(2, 1001);

			prepareStatement.executeUpdate();

			prepareStatement.clearParameters();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
