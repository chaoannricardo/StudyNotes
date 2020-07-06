package batchupdate;

import java.sql.*;

public class batchupdatelab {

	public static void main(String[] args) {
		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
				"scott", "tiger");) {

			connection.setAutoCommit(false);

			Statement stmt = connection.createStatement();
			stmt.addBatch("update emp set salary = 10000 where empno = 1001");
			stmt.addBatch("update emp set salary = 10000 where empno = 1001");
			stmt.addBatch("select * from emp");  //不能使用select指令

			int[] results = stmt.executeBatch();
			for (int i = 0; i < results.length; i++) {
				System.out.println("第" + (i + 1) + "結果=" + results[i]);
			}

			stmt.clearBatch();
			/*
			 * stmt.addBatch("update emp set salary = 10000 where empno = 1001");
			 * stmt.addBatch("update emp set salary = 10000 where empno = 1001"); results =
			 * stmt.executeBatch(); System.out.println("第二次執行送出"+results.length);
			 */

			connection.commit();

			System.out.println("finish");

		} catch (BatchUpdateException be) {
			int[] results = be.getUpdateCounts();
			for (int i = 0; i < results.length; i++) {
				System.out.println("第" + (i + 1) + "結果=" + results[i]);
				
				if (results[i] == Statement.EXECUTE_FAILED) {
					System.out.println("執行失敗");
				}
				
			}
		}

		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");
		}

	}

}
