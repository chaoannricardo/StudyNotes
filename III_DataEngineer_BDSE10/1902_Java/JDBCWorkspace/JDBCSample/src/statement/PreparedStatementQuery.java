package statement;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PreparedStatementQuery {

    public static void main(String[] args) {


        try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB", "scott", "tiger");
             PreparedStatement stmt = conn.prepareStatement("select * from emp where empno=?")
        ) {

            //利用 prepare statment 指定empno查詢

            List<Integer> empnos = new ArrayList<>();
            empnos.add(1001);
            empnos.add(1003);

            for (Integer empno : empnos) {
                stmt.setInt(1, empno);
                //再度使用try with resource 語法
                try ( ResultSet rs = stmt.executeQuery() ) {
                    if (rs.next()) {
                        int no = rs.getInt("empno");
                        String name = rs.getString("ename");
                        //Date hiredate = rs.getDate("hiredate");
                        BigDecimal salary = rs.getBigDecimal("salary");
                        System.out.println("empno=" + no + ",name=" + name + ",salary=" + salary);
                    }
                } //可以不用catch
                stmt.clearParameters();
            }

            System.out.println("query finished");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
