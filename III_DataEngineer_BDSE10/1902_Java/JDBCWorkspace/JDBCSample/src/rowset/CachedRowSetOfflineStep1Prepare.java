package rowset;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.rowset.CachedRowSet;

import com.sun.rowset.CachedRowSetImpl;

public class CachedRowSetOfflineStep1Prepare {

	public static void main(String[] args) {
		
		try ( CachedRowSet crset = new CachedRowSetImpl() ) {

			 //手動設定所有參數,會產生新的connection
			crset.setType(ResultSet.TYPE_SCROLL_SENSITIVE);
			crset.setConcurrency(ResultSet.CONCUR_UPDATABLE);
			crset.setCommand("select * from emp");
			crset.setUsername("scott");
			crset.setPassword("tiger");
			crset.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
			crset.execute();
						
			// 將crset寫到檔案中
			FileOutputStream fos = new FileOutputStream("c:/files_write/rowset.xxx");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(crset);
			fos.close();
			System.out.println( CachedRowSetOfflineStep1Prepare.class+" Finished");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
