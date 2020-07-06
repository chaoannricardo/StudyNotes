package statement;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PreparedStatementUpdate {

    public static void main(String[] args) {

        //
        try ( Connection conn = DriverManager.getConnection(
                "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                "scott", "tiger");
              PreparedStatement stmt = conn.prepareStatement("update emp set salary=? where empno=?");
        ) {
            stmt.setBigDecimal(1,new BigDecimal(22000));
            stmt.setInt(2, 1001);
            stmt.executeUpdate();

            //如果不執行23,24兩行,則會延用18行設定的22000
            stmt.clearParameters();
            stmt.setBigDecimal(1,new BigDecimal(10000));
            stmt.setInt(2,1002);
            //如果執行clearParameters,但沒有設定薪水,則會發生exception
            stmt.executeUpdate();
            stmt.clearParameters();

            System.out.println("query finished");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
