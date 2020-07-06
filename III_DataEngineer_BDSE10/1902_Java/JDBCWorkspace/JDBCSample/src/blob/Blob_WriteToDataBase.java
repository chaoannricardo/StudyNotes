package blob;

import java.io.File;
import java.io.FileInputStream;
import java.sql.*;

public class Blob_WriteToDataBase {

	public static void main(String[] args) {


		try (Connection conn = DriverManager.getConnection(
				"jdbc:sqlserver://localhost:1433;databaseName=JDBCDB", "scott", "tiger");
			 Statement statement = conn.createStatement();
			 PreparedStatement stmt = conn.prepareStatement("insert into Files (filename,data) values(?,?)")
		) {

			conn.setAutoCommit(false);
			statement.execute("delete from Files");
			File file = new File("c:/files_read/xxx");
			FileInputStream fis = new FileInputStream(file);
			stmt.setString(1, file.getName());
			stmt.setBinaryStream(2, fis);
			stmt.execute();
			System.out.println("檔案=" + file.getPath() + "寫入資料庫");
			fis.close();
			stmt.clearParameters();
			conn.commit();
            System.out.println(Blob_WriteToDataBase.class.getName()+ " 執行結束");
		} catch (SQLException e ) {
			e.printStackTrace();
        }catch( Exception e ){
            e.printStackTrace();
        }
	}

}
