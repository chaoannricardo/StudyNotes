package datasource;

import java.sql.Connection;
import java.sql.DriverManager;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPDataSource {
	
	public static void main(String[] args) throws Exception {
		
		long startTime = System.currentTimeMillis();
        for (int i = 0; i < 100; i++) {
        	Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger");
        	conn.close();
        }
        long endTime = System.currentTimeMillis();
        System.out.println("沒有Connection Pool 歷時: " + (endTime - startTime));
		
	    BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		ds.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
		ds.setUsername("scott");
		ds.setPassword("tiger");
		ds.setMaxTotal(50); //設定最多connection上線,超過使用量必須等待
		ds.setMaxIdle(50);   //設定最多idle的connection,超過的connection會被執行connection.close()

		startTime = System.currentTimeMillis();

        for (int i = 0; i < 100; i++) {
        	Connection conn = ds.getConnection();
			//System.out.println(ds.getNumActive()+ " connection active");
			conn.close(); //如果 comment close則active connection會上升,超過MaxTotal,則會停住
		}
        endTime = System.currentTimeMillis();
		System.out.println("BasicDataSource 歷時: " + (endTime - startTime));
		ds.close();

	}
}
