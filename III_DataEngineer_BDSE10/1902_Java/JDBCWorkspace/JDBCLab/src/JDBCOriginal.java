import java.sql.*;

public class JDBCOriginal {

	public static void main(String[] args) {
		
		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
				"scott", "tiger");) {
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");
		}

		


	}

}
