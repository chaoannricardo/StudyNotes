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
import javax.sql.rowset.spi.SyncFactory;
import javax.sql.rowset.spi.SyncFactoryException;

import com.sun.rowset.CachedRowSetImpl;

public class CachedRowSetDemo {

	public static void main(String[] args) throws IOException, SyncFactoryException {

		try ( CachedRowSet crset = new CachedRowSetImpl() ) {


			//add listener
            /*
			Listener listener = new Listener();
			crset.addRowSetListener(listener);
            */
			

			 //手動設定所有參數,會產生新的connection
			crset.setType(ResultSet.TYPE_SCROLL_SENSITIVE);
			crset.setConcurrency(ResultSet.CONCUR_UPDATABLE);
			crset.setCommand("select * from emp");
			crset.setUsername("scott");
			crset.setPassword("tiger");
			crset.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
			crset.execute();



			 // 利用現行connection
            /*
			Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger");
			crset.setCommand("select * from emp");
			crset.execute(conn);
			*/

			

			// 利用現行connection,resultset
            /*
			Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = stmt.executeQuery("select * from emp");
			crset.populate(rs);
            */


			 //讀取資料

			while ( crset.next()){
				System.out.println("empno="+crset.getInt("empno")+",salary="+crset.getBigDecimal("salary"));
			}

			//修改資料
            /*
			crset.absolute(10);
			System.out.println("empno="+crset.getString("empno"));
			crset.updateBigDecimal("commission", new BigDecimal("70.0"));
			crset.updateRow();
			//接受變更,save到資料庫中
			crset.acceptChanges();
             */

			//分頁,SQL Server配合CachedRowSetImpl在分頁時(Sun的程式寫死TYPE_SCROLL_INSENSITIVE,CONCUR_UPDATABLE),
            //也會因為SQL Server不支援ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE而發生Error
            /*
			crset.setPageSize(4);
            int page = 1;
			while ( crset.nextPage()){
				System.out.println("Page "+page+"-----");
				while ( crset.next()){
					System.out.println("名字:"+crset.getString("ename"));
				}
				page++;
			}
            */


			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
