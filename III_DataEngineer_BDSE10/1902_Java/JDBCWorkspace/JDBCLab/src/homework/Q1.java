package homework;

import java.sql.*;

public class Q1 {

	public static void main(String[] args) {

		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
				"scott", "tiger");
				PreparedStatement preparedStatement = connection.prepareStatement("select * from EMP");

		) {

			ResultSet resultset = preparedStatement.executeQuery();
			while (resultset.next()) {
				System.out.println("The name is " + resultset.getString("ENAME") + ", and the empno is " + resultset.getInt("EMPNO"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			System.out.println("Finish");
		}

	}

}