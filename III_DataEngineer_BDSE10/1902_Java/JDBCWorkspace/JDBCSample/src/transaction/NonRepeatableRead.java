package transaction;

import java.math.BigDecimal;
import java.sql.*;

public class NonRepeatableRead {

	public static void main(String[] args) {
		


		try (Connection conn = DriverManager.getConnection(
				"jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
				"scott", "tiger");
			 Statement stmt = conn.createStatement();

		) {
//			conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			conn.setAutoCommit(false);
			System.out.println("交易開始");
			printSalary(stmt, 1);
			System.out.println("breakpoint1 here");
			//設定中斷點於此,debug停於此時,執行以下SQL
			/*  在SQL Studio中執行以下指令 
			 *   1. java執行到printSalary(stmt, 1)時,SQL Studio還能下select,但無法update
			 *   2. SQL Studio如果先執行到update尚未commit,java連printSalary(stmt, 1)都無法執行,設breakpoint在printSalary
			   begin transaction
			   select * from emp where empno=1001
			   update emp set SALARY= salary+100 where EMPNO=1001
			   select * from emp where empno=1001
			   commit;
			 */			
			printSalary(stmt, 2);
			conn.commit();
			System.out.println("交易結束");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void printSalary(Statement stmt,int i) throws SQLException {
		BigDecimal total = new BigDecimal("0");
		try( ResultSet resultSet = stmt.executeQuery("select * from emp") ){
			while (resultSet.next()) {
				total = total.add(resultSet.getBigDecimal("salary"));
				BigDecimal salary = resultSet.getBigDecimal("salary");
				int empno = resultSet.getInt("empno");
				System.out.println("第"+i+"次讀取:"+empno+",薪水="+salary);
			}
			System.out.println("報告副總 :全公司總薪水總和為"+total);
		}catch ( SQLException ex){
			ex.printStackTrace();
		}
	}

}
