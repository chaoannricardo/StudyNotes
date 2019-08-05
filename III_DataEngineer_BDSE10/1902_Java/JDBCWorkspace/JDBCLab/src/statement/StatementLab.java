package statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class StatementLab {

	public static void main(String[] args) {



		try (

				Connection connection = DriverManager
						.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB", "scott", "tiger");
				Statement statement = connection.createStatement();
				

		) {
			//使用statement.executeUpdate指令更新資料庫，回傳為更新筆數
			int changedRows = statement.executeUpdate("update emp set ename = 'Charley' where empno = 1012");
			
			//檢查是否有資料被隔年
			if (changedRows > 0) {
				System.out.println("Data has been modified.");
			}else {
				System.out.println("Data failed to be modified.");
			}
			

			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");

		}

	}

}
