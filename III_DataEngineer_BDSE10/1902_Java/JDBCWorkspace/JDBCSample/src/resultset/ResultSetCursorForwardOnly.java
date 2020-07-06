package resultset;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ResultSetCursorForwardOnly {

public static void main(String[] args) {
		

		try ( Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger");
			  Statement stmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);//預設值，等同於conn.createStatement()
			  ResultSet rs = stmt.executeQuery("select * from emp order by empno") ){

			rs.last();
			//rs.previous();
			int lastempo = rs.getInt("empno");
			String lastname = rs.getString("ename");
			System.out.println("empno="+lastempo+",name="+lastname);
			
			while ( rs.next() ){
				int empno = rs.getInt("empno");
				String name = rs.getString("ename");
				System.out.println("empno="+empno+",name="+name);
			}
			System.out.println("finished");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
