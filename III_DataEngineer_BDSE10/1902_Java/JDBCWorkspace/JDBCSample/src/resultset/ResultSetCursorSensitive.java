package resultset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ResultSetCursorSensitive {

public static void main(String[] args) {
		
		try ( Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger");
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);//預設值，等同於conn.createStatement()
		ResultSet rs = stmt.executeQuery("select * from emp order by empno") ){
			//在rs.next()設中斷點
			rs.next();
			System.out.println("empno=" + rs.getInt("empno") + ",name=" + rs.getString("ename"));
			rs.beforeFirst();
			//中斷點停在beforeFirst()時，修改DB資料,再往下執行新資料會顯示
			rs.next();
			System.out.println("empno=" + rs.getInt("empno") + ",name=" + rs.getString("ename"));

			System.out.println("ResultSetCursorSensitive finished");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
