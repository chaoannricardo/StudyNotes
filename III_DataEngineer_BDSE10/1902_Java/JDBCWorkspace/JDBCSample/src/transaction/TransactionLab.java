package transaction;

import org.apache.commons.dbutils.DbUtils;

import java.math.BigDecimal;
import java.sql.*;

public class TransactionLab {

    public static void main(String[] args) {

        Connection conn1 = null;
        try (Connection conn = DriverManager.getConnection(
                "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                "scott", "tiger");
             Statement stmt = conn.createStatement();
             PreparedStatement pstmt = conn.prepareStatement("update emp set salary=? where empno=?");
             ResultSet rs = stmt.executeQuery("select * from emp")
        ) {
            conn.setAutoCommit(false);
            conn1 = conn;
            while (rs.next()) {
                int empno = rs.getInt("empno");
                BigDecimal commission = rs.getBigDecimal("commission");
                BigDecimal salary = rs.getBigDecimal("salary");
                commission = commission.add(new BigDecimal(100));
                Savepoint savepoint = conn.setSavepoint();
                System.out.println("Update empno=" + empno + " salary=" + commission);
                pstmt.clearParameters();
                pstmt.setBigDecimal(1, commission);
                pstmt.setInt(2, empno);
                pstmt.execute();
                //如果該員薪資超過3000，利用savePoint 及 rollback方式取消該員調漲。
                if (salary.compareTo(new BigDecimal(3000)) > 0) {
                    conn.rollback(savepoint);
                    System.out.println("rollback empno " + empno);
                }
            }
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn1.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } catch (Exception ex){
            try {
                conn1.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
