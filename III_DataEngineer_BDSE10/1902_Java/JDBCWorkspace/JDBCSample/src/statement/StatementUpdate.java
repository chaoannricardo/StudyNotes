package statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StatementUpdate {

	public static void main(String[] args) {
		
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				conn = DriverManager
						.getConnection(
								"jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
								"scott", "tiger");
				stmt = conn.createStatement();
				int updated = stmt.executeUpdate("update emp set salary = 20000 where empno=1001");
				if ( updated > 0 ){
					System.out.println("update successed");
				}else{
					System.out.println("update failed");					
				}
				System.out.println("query finished");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {

				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}

			}
	}

}
