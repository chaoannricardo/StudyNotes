package statement;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PreparedStatementUpdateLab2 {

	public static void main(String[] args) {

		try (
				Connection connection = DriverManager
						.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB", "scott", "tiger");
				
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(" select * from emp join dept on emp.deptno=dept.DEPTNO");
				
		PreparedStatement statement =
				connection.prepareStatement("update emp set commission = ? where empno = ?");
		) {
			
			
			while ( rs.next()) {
				String location = rs.getString("location");
				int empno = rs.getInt("empno");
				System.out.println(rs.getInt("empno")+"="+rs.getString("location"));
				if ( location.equals("台北") ) {
					BigDecimal commission = rs.getBigDecimal("commission");
					BigDecimal newCommission = commission.add(new BigDecimal(100));
					statement.setBigDecimal(1, newCommission);
					statement.setInt(2, empno);
					statement.executeUpdate();
					statement.clearParameters();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("Finish");

	}

}