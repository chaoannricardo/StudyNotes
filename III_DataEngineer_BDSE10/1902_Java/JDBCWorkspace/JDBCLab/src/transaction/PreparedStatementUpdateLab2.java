package transaction;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.sql.Statement;
import java.util.Calendar;

public class PreparedStatementUpdateLab2 {

	public static void main(String[] args) {

		try (

				Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
						"scott", "tiger");
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(" select * from emp join dept on emp.deptno=dept.DEPTNO");
				// 準備要執行指令的
				PreparedStatement statement = connection
						.prepareStatement("update emp set commission = ? where empno = ?");

		) {

			// Transaction Start
//			connection.setAutoCommit(false);

			while (rs.next()) {
				String location = rs.getString("location");
				int empno = rs.getInt("empno");
				System.out.println(empno + "=" + location);

				if (location.equals("台北")) {

					// 建立Save Point
//					Savepoint Savepoint = connection.setSavepoint();

					// 建立條件式，設定須執行之指令
					BigDecimal commission = rs.getBigDecimal("commission");
					BigDecimal newcommission = commission.add(new BigDecimal("100"));
					statement.setBigDecimal(1, newcommission);
					statement.setInt(2, empno);
					statement.executeUpdate();

					// 建立判斷
//					BigDecimal salary = rs.getBigDecimal("salary");
//					if (salary.compareTo(new BigDecimal(3000)) > 0) {
//						connection.rollback(Savepoint);
//					}

					// 清除參數
					statement.clearParameters();

				}

				connection.commit();

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
