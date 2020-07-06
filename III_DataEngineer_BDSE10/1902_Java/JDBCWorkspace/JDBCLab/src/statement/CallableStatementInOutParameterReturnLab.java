package statement;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class CallableStatementInOutParameterReturnLab {

	public static void main(String[] args) {

		try (

				Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
						"scott", "tiger");
				CallableStatement statement = connection.prepareCall("{? = call CheckManager(?)}");

		) {
			statement.registerOutParameter(1, java.sql.Types.INTEGER);
			statement.setInt(2, 1002);
			
			statement.execute();
			
			int status = statement.getInt(1);
			
			if (status ==  1) {
				System.out.println("Is a Manager");
			}else {
				System.out.println("Not a Manager");
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
