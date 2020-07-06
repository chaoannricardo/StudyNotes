import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class HelloJDBC {

	public static void main(String[] args) {
		
		//查詢SQL Server連線數，確認沒有leaking: SELECT session_id,auth_scheme,client_net_address,client_tcp_port, local_net_address,local_tcp_port FROM sys.dm_exec_connections 
		
		/*try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}*/
		
		Connection conn = null;
		Statement stmt  = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger");
			stmt  = conn.createStatement();
			rs =  stmt.executeQuery("select * from emp");
			while ( rs.next()){
				int empno = rs.getInt("empno");
				String name = rs.getString("ename");
				System.out.println("empno="+empno+",name="+name);
			}
			System.out.println("query finished");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if ( rs != null){
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if ( stmt != null){
					stmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if ( conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

}
