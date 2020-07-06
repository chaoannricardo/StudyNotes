package batchUpdate;

import java.math.BigDecimal;
import java.sql.*;
import java.util.Calendar;

public class PreparedStatement_BatchUpdate {

    public static void main(String[] args) {

        try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB", "scott", "tiger");
             PreparedStatement stmt = conn.prepareStatement("insert into emp (empno,ename,salary,job,hiredate,deptno,commission) "
                     + "values (next value for emp_seq,?,?,?,?,?,?)")
        ) {
            conn.setAutoCommit(false);
            stmt.setString(1, "John1");
            stmt.setBigDecimal(2, new BigDecimal("500"));
            stmt.setString(3, "Manager");
            Calendar cal = Calendar.getInstance();
            cal.set(1981, 0, 10);
            stmt.setDate(4, new java.sql.Date(cal.getTimeInMillis()));
            stmt.setInt(5, 30);
            stmt.setBigDecimal(6, new BigDecimal("0.0"));
            stmt.addBatch();

            stmt.clearParameters(); //清除參數後,再繼續執行

            stmt.setString(1, "Mary");
            stmt.setBigDecimal(2, new BigDecimal("600"));
            stmt.setString(3, "Sales");
            Calendar cal1 = Calendar.getInstance();
            cal1.set(1981, 0, 1);
            stmt.setDate(4, new java.sql.Date(cal1.getTimeInMillis()));
            stmt.setInt(5, 30);
            stmt.setBigDecimal(6, new BigDecimal("0.0"));
            stmt.addBatch();

            int[] updated = stmt.executeBatch();

            PreparedStatement_BatchUpdate.printResult(updated); //列印出執行結果

            stmt.clearBatch();
            conn.commit();
        } catch (BatchUpdateException be) {
            be.printStackTrace();
            PreparedStatement_BatchUpdate.printResult(be.getUpdateCounts());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void printResult(int[] result) {
        for (int i = 0; i < result.length; i++) {
            if (result[i] == Statement.SUCCESS_NO_INFO) {
                System.out.println("第 " + (i + 1) + " SQL執行結果成功,無回傳筆數");
            } else if (result[i] == Statement.EXECUTE_FAILED) {
                System.out.println("第 " + (i + 1) + " SQL執行結果失敗");
            } else {
                System.out.println("第 " + (i + 1) + " SQL執行結果,筆數 =" + result[i]);
            }
        }
    }

}
