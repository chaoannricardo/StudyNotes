package rowset;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.math.BigDecimal;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

public class CachedRowSetOnLineStep3UpdateDataBase {

	public static void main(String[] args) throws IOException {

		FileInputStream in = new FileInputStream("c:/files_write/rowset.xxx");
		ObjectInputStream oin = new ObjectInputStream(in);
		try ( CachedRowSet crset =  (CachedRowSet) oin.readObject() ) {
			crset.setUsername("scott");
			crset.setPassword("tiger");
			crset.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
			crset.acceptChanges();

			System.out.println( CachedRowSetOnLineStep3UpdateDataBase.class+" Finished");

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			in.close();
		}
	}

}
