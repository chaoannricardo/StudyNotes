package Blob;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;

public class BlobWriter {

	public static void main(String[] args) {
		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
				"scott", "tiger");) {
			
			Statement sstatement = connection.createStatement();
			sstatement.execute("delete from Files");
			
			PreparedStatement prepareStatement = connection.prepareStatement("insert into files (filename,data) values(?,?)");
			File file = new File("C:\\files_write\\files_read\\123.PNG");
			FileInputStream fis = new FileInputStream(file);
			
			prepareStatement.setString(1, file.getName());
			prepareStatement.setBinaryStream(2, fis);
			prepareStatement.execute();
			
			fis.close();

			connection.commit();
			
			
		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");
		}

		

	}

}
