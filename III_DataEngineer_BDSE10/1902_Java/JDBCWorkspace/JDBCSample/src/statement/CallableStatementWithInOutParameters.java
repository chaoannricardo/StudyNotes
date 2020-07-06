package statement;

import java.math.BigDecimal;
import java.sql.*;

public class CallableStatementWithInOutParameters {

	public static void main(String[] args) {
		

		try ( Connection conn = DriverManager
				.getConnection(
						"jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
						"scott", "tiger");
			  CallableStatement stmt = conn.prepareCall("{ call SUM_SALARY(?,?)}")){
            //use sql studio to execute SUM_SALARY(按右鍵,執行預存程序)
			//設定傳入的第一個參數為部門編號20
			stmt.setInt(1, 20);
			//設定第二個參數為out parameter，傳回部門薪水總和
			stmt.registerOutParameter(2, java.sql.Types.NUMERIC);
			stmt.executeUpdate();
			
			//取得最後結果
			BigDecimal summary = stmt.getBigDecimal(2);
			System.out.println("the sum of salry is "+summary);
			
			System.out.println("CallableStatementWithInOutParameters finished");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
