package transaction;

import java.math.BigDecimal;
import java.sql.*;

public class PhantomRead {

	public static void main(String[] args) {
		


		try (Connection conn = DriverManager.getConnection(
				"jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
				"scott", "tiger");
			 Statement stmt = conn.createStatement()
		) {
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
//			conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE); //table lock prevent insert and delete
			conn.setAutoCommit(false);
			System.out.println("交易開始");
			printSummary(stmt,1);
		    System.out.println("breakpoint here");
		    /*
		     * 新增一筆資料到資料庫或者刪除一筆資料
		      begin transaction
		      INSERT INTO EMP (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO)
		      VALUES (next value for emp_seq,'秦生生','行銷',CAST('1981-12-17' as datetime),2000,0.0,20);
		      commit
		     */
		    printSummary(stmt,2);
		    conn.commit();
			System.out.println("交易結束");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private static void printSummary(Statement stmt,int i) throws SQLException {
		try ( ResultSet resultSet = stmt.executeQuery("select sum(salary) from emp") ){
			while ( resultSet.next()){
				BigDecimal sum = resultSet.getBigDecimal(1);
				System.out.println("報告副總 第"+i+"次計算 :全公司總薪水總和為"+sum);
			}
		}catch (SQLException ex){
			ex.printStackTrace();
		}
	}

}
