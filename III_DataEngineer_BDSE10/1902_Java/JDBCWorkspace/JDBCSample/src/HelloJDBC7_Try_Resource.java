import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class HelloJDBC7_Try_Resource {

	public static void main(String[] args) {
		
		//將要自動關閉的資源寫在try中
		try ( Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger");
				) {
			try (Statement stmt = conn.createStatement();
				 ResultSet rs =  stmt.executeQuery("select * from emp")){
				while ( rs.next()){
					int empno = rs.getInt("empno");
					String name = rs.getString("ename");
					System.out.println("empno="+empno+",name="+name);
				}
			}catch(SQLException ex){
			    conn.rollback();
			}catch (Exception ex){
				conn.rollback();
			}
			System.out.println("query finished");
		} catch (SQLException e) {
			e.printStackTrace();
		}//執行到這裏connection及stmt會自動關閉,不用再寫finally執行關閉動作
		
		
		//http://docs.oracle.com/javase/7/docs/technotes/guides/jdbc/jdbc_41.html
		System.out.println("test the connection!,it's gone!");
		
	}

}
