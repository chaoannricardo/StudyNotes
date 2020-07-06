package statement;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class CallableStatementNoParameterLab {

	public static void main(String[] args) {

		try (

				Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
						"scott", "tiger");
				CallableStatement statement = connection.prepareCall("{call QueryEmployee}");

		) {
			
			ResultSet rSet = statement.executeQuery();
			while (rSet.next()) {
				System.out.println(rSet.getString("ename"));
			
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
