package rowset;

import java.io.*;
import java.sql.SQLException;

import javax.sql.rowset.WebRowSet;

import com.sun.rowset.WebRowSetImpl;

public class WebRowSetDemo {

	public static void main(String[] args) {
		

		try (WebRowSet wrset =new WebRowSetImpl()) {
			
				wrset.setCommand("select * from emp");
				wrset.setUsername("scott");
				wrset.setPassword("tiger");
				wrset.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
				//準備資料
				wrset.execute();
				//準備FileWriter
				FileOutputStream out = new FileOutputStream("c:/files_write/webrowset.xml");
				OutputStreamWriter fw = new OutputStreamWriter(out,"UTF8");
				wrset.writeXml(fw);
			
			//讀入WebRowSet
			/*
			FileInputStream in = new FileInputStream("c:/files_write/webrowset.xml");
			InputStreamReader reader = new InputStreamReader(in,"UTF8");
			wrset = new WebRowSetImpl();
			wrset.readXml(reader);
			wrset.absolute(1);
			System.out.println("empname="+wrset.getString("ename"));
			*/
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
