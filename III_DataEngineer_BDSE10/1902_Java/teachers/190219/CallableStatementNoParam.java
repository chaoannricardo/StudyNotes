package statement;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CallableStatementNoParam {

	public static void main(String[] args) {
		
		

		try (    
				
				Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB", "scott", "tiger");
				CallableStatement statement = connection.prepareCall("{ call QueryEmployee  }");
				
				)   {
			
			
			     ResultSet rs = statement.executeQuery();
			     while ( rs.next()) {
			    	 
			    	 
			    	 System.out.println(rs.getString("ename"));
			    	 
			     }
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		
		System.out.println("Finish");
		
		
	}
	
}
