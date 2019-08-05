package statement;

import java.sql.*;
import java.util.Scanner;

public class SQLInjection {

    public static void main(String[] args) {

        try (Connection conn = DriverManager
                .getConnection(
                        "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                        "scott", "tiger");
             Statement stmt = conn.createStatement()) {

            //測試成功例子： 帳號輸入：scott 密碼：tiger
            //測試injection 帳號輸入 admin 密碼 ' or 1 = 1 --

            Scanner console = new Scanner(System.in);
            boolean loop = true;
            while (loop) {
                System.out.println("please input user name: ");
                String username = console.nextLine();
                System.out.println("password for " + username);
                String password = console.nextLine();
                String sql = "select * from users where username ='" + username + "' and password='" + password + "'";
                ResultSet rs = stmt.executeQuery(sql);
                System.out.println("SQL=" + sql + "\n");
                if (rs.next()) {
                    System.out.println("user " + username + " 成功登入 \n");
                } else {
                    System.out.println("user " + username + " 成功失敗 \n");
                }
                System.out.println("continue? yes or no: ");
                String isContinue = console.nextLine();
                if (isContinue.equalsIgnoreCase("no")) {
                    loop = false;
                }
            }
            System.out.println("SQLInjection finished");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
