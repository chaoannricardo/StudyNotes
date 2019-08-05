package resultset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ResultSetLab {

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
				Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				ResultSet rs = statement.executeQuery("select * from emp");// 執行SQL

		) {
			
			//rs.absolute(5);

			// 利用while迴圈將所有資料取出
			while (rs.next()) {
				String ename = rs.getString("ename");
				int empno = rs.getInt("empno");
				System.out.println("No. = " + empno + ", name= " + ename);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
