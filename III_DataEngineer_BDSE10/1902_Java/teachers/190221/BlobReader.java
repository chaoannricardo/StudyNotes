package blob;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

public class BlobReader {

	public static void main(String[] args) {
		
		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
				"scott", "tiger");) {
			
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select * from files");
			if ( rs.next() ) {
				
				String name = rs.getString("filename");
				
				InputStream is = rs.getBinaryStream("data");
				
				 File file = new File("C:\\files_write\\"+name);
				 FileOutputStream fos = new FileOutputStream(file);
				 
				 
				 byte[] buffer = new byte[1024];
				 int length = 0;
				 while ( ( length = is.read(buffer) ) != -1) {
					 fos.write(buffer, 0, length);
				 }	
				 fos.close();
			}
			
			

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
