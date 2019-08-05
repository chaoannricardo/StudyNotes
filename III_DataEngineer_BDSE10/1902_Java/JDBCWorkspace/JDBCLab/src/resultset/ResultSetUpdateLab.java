package resultset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class ResultSetUpdateLab {

	public static void main(String[] args) {

		// 早期載入Driver所必須應用的程式碼(JDK5之前)
		/*
		 * try { Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); } catch
		 * (ClassNotFoundException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

		try (

				Connection connection = DriverManager
						.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB", "scott", "tiger");
				Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = statement.executeQuery("select * from emp");// 執行SQL

		) {
			//更新資料庫中的一筆資料
			rs.absolute(5);
			rs.updateString("ename", "Ricardo");
			rs.updateRow();
			
			//於資料庫中輸入新的一筆資料
			rs.moveToInsertRow();
			rs.updateInt("empno", 1012);
			rs.updateString("ename", "小明");
			rs.updateString("job", "工讀生");
			
			//在資料庫中輸入日期必須使用sql特殊的格式
			Calendar calendar = Calendar.getInstance();
			java.sql.Date date = new java.sql.Date(calendar.getTimeInMillis());
			rs.updateDate("hiredate", date);
			rs.updateLong("salary", 10000);
			rs.updateInt("commission", 0);
			rs.updateInt("deptno", 30);
			rs.insertRow();
			

			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
