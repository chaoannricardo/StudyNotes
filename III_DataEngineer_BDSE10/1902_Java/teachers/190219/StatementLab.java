package statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class StatementLab {

	public static void main(String[] args) {
		
		

		try (    
				
				Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB", "scott", "tiger");
				Statement statement = connection.createStatement();
				
				)   {
			
			int updatedRows = statement.executeUpdate("update emp set ename='David' where empno=1100");
			
			if ( updatedRows > 0 ) {
				System.out.println("更新成功");
			}else {
				System.out.println("更新不成功");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		
		System.out.println("Finish");
		
		
	}
	
}
