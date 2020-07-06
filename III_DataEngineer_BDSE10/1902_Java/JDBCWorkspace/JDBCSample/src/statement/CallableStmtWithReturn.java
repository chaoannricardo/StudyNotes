package statement;

import java.sql.*;

public class CallableStmtWithReturn {

    public static void main(String[] args) {


        try (Connection conn = DriverManager
                .getConnection(
                        "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                        "scott", "tiger");
             CallableStatement stmt = conn.prepareCall("{ ? = call CheckManager(?)}");
        ) {
            //CheckManager會檢核該員工是否為經理，傳入員工編號(empno)，回傳1表示為經理，回傳0表示不是經理
            stmt.registerOutParameter(1, java.sql.Types.INTEGER);
            stmt.setInt(2, 1002);
            stmt.execute();
            int status = stmt.getInt(1);
            if (status == 1) {
                System.out.println("1002 是經理");
            } else {
                System.out.println("1002 不是經理");
            }

            System.out.println("CallableStmtWithReturn finished");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
