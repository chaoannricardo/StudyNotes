package blob;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;

public class BlobWriter {

	public static void main(String[] args) {
		
		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
				"scott", "tiger");) {
			
			 Statement statement = connection.createStatement();
		     statement.execute("delete from Files");

			 PreparedStatement stmt = 
	connection.prepareStatement("insert into files (filename,data) values(?,?)");
			 
			 File file = new File("C:\\files_read\\aaa.jpg");
			 
			 FileInputStream fis  = new FileInputStream(file);
			 
			 stmt.setString(1, file.getName());
			 stmt.setBinaryStream(2, fis);
			 stmt.execute();
			 
			 fis.close();
			 connection.commit();
			 
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
