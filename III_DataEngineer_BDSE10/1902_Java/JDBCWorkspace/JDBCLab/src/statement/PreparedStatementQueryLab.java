package statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class PreparedStatementQueryLab {

	public static void main(String[] args) {



		try (

				Connection connection = DriverManager
						.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB", "scott", "tiger");
				
				//使用prepareStatement來進行大量的重複查詢(preparedStatement為Statement的多型)
				PreparedStatement prepareStatement = connection.prepareStatement("select * from emp where empno = ?");
		) {
			
			
			//設置第幾個？，及？的值
			prepareStatement.setInt(1, 1012);
			//執行Query指令
			ResultSet rs = prepareStatement.executeQuery();
			//將內容印出來
			if (rs.next()) {
				System.out.println("His name is " + rs.getString("ename") + ", and empno is " + rs.getInt("empno"));
			}
			
			//查詢萬計的要做清除
			prepareStatement.clearParameters();
			
			prepareStatement.setInt(1, 1001);
			rs = prepareStatement.executeQuery();
			if (rs.next()) {
				System.out.println("His name is " + rs.getString("ename") + ", and empno is " + rs.getInt("empno"));
			}
		

			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
