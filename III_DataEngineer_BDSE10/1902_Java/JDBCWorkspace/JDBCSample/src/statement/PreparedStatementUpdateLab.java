package statement;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.dbutils.DbUtils;

public class PreparedStatementUpdateLab {

    public static void main(String[] args) {


        try (Connection conn = DriverManager
                .getConnection(
                        "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                        "scott", "tiger");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from emp join dept on emp.deptno=dept.deptno");
             PreparedStatement pstmt = conn.prepareStatement("update emp set commission=? where empno=?")
        ) {

            while (rs.next()) {
                String location = rs.getString("location");
                int empno = rs.getInt("empno");
                if (location.equals("台北")) {
                    BigDecimal commission = rs.getBigDecimal("commission");
                    commission = commission.add(new BigDecimal("100"));
                    pstmt.setBigDecimal(1, commission);
                    pstmt.setInt(2, empno);
                    pstmt.executeUpdate();
                    pstmt.clearParameters();
                }
            }

            System.out.println("PreparedStatementUpdateLab finished");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
