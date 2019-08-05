package statement;

import java.sql.*;
import java.util.Scanner;

public class SQLInjectionFixed {

    public static void main(String[] args) {

        try (Connection conn = DriverManager
                .getConnection(
                        "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                        "scott", "tiger");
             PreparedStatement stmt = conn.prepareStatement("select * from users where username = ? and password= ?")) {

            //測試成功例子： 帳號輸入：scott 密碼：tiger
            //測試injection 帳號輸入 admin 密碼 ' or 1 = 1 --

            Scanner console = new Scanner(System.in);
            boolean loop = true;
            while (loop) {
                System.out.println("please input user name: ");
                String username = console.nextLine();
                System.out.println("password for "+username);
                String password = console.nextLine();
                stmt.setString(1, username);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        System.out.println("user "+username+" 登入成功 \n");
                    } else {
                        System.out.println("user "+username+" 登入失敗 \n");
                    }
                    System.out.println("continue? yes or no: ");
                    String isContinue = console.nextLine();
                    if (isContinue.equals("no")) {
                        loop = false;
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            System.out.println("query finished");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
