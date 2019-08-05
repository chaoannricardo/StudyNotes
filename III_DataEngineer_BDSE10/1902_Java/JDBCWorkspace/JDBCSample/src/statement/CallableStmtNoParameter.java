package statement;

import java.sql.*;

public class CallableStmtNoParameter
{

	public static void main(String[] args) {
		

		try (Connection conn = DriverManager
				.getConnection(
						"jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
						"scott", "tiger");
			 CallableStatement stmt = conn.prepareCall("{ call dbo.QueryEmployee}");
			 ResultSet rs = stmt.executeQuery()
		) {
            //SQL Studio: exec QueryEmployee

			//Procedure QueryEmployee沒有回傳東西，只是單純select from emp
			while (rs.next()) {
				int empno = rs.getInt("empno");
				String name = rs.getString("ename");
				System.out.println("empno=" + empno + ",name=" + name);
			}

			System.out.println("CallableStmtNoParameter finished");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
