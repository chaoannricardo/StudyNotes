package statement;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class CallableStatementInOutParameterLab {

	public static void main(String[] args) {

		try (

				Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
						"scott", "tiger");
				CallableStatement statement = connection.prepareCall("{call SUM_SALARY(?,?)}");

		) {
			statement.setInt(1, 20);
			statement.registerOutParameter(2, java.sql.Types.NUMERIC);

			statement.execute();

			BigDecimal summary = statement.getBigDecimal(2);
			System.out.println(summary);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
