package batchupdate;

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

				//建立計數器
				int counter = 0;
				if (location.equals("台北")) {

					// 建立Save Point
//					Savepoint Savepoint = connection.setSavepoint();

					// 建立條件式，設定須執行之指令
					BigDecimal commission = rs.getBigDecimal("commission");
					BigDecimal newcommission = commission.add(new BigDecimal("100"));
					statement.setBigDecimal(1, newcommission);
					statement.setInt(2, empno);
//					statement.executeUpdate();
					
					//將程式加入批次中
					statement.addBatch();
					counter++;

					// 建立判斷
//					BigDecimal salary = rs.getBigDecimal("salary");
//					if (salary.compareTo(new BigDecimal(3000)) > 0) {
//						connection.rollback(Savepoint);
//					}

					// 清除參數
					statement.clearParameters();
					
					//每50個批次送出一次SQL資料
					if (counter % 50 == 0) {
						statement.executeBatch();
					}

				}
				
				//執行最後的數個批次
				statement.executeBatch();

				//Transaction Committ
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
