
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class JDBCODBCTest {

	public static void main(String[] args){
		
		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection("jdbc:odbc:DataSource","scott","tiger");
			stmt = conn.createStatement();
			 rs =  stmt.executeQuery("select * from emp");
			while ( rs.next()){
				int empno = rs.getInt(1);
				System.out.println("empno="+empno+",name="+rs.getString("ename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if ( rs != null){
				try{
					rs.close();
				}catch(SQLException ex){
					ex.printStackTrace();
				}
			}
			if ( stmt != null){
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if ( conn != null ){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

	}

}
