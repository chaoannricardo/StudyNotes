package metadata;

import java.sql.*;

public class MetaData_ResultSetMetaData {

    public static void main(String[] args) {


        //copy from HelloJDBC7

        try (Connection conn = DriverManager.getConnection(
                "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                "scott", "tiger");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from emp");
        ) {
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                //取得欄位label
                String label = rsmd.getColumnLabel(i);
                //取得欄位名稱,SQL Server回傳跟getColumnLabel一致,不正確.
                String name = rsmd.getColumnName(i);
                //取得java對應的型態 java.sql.Types, CallableStatement outparameter時用
                int type = rsmd.getColumnType(i);
                //取得資料庫中欄位的型態
                String dbType = rsmd.getColumnTypeName(i);
                String classname = rsmd.getColumnClassName(i);
                System.out.println("label=" + label + ",name=" + name + ",dbTypeName=" + dbType + ",dbTypeClass=" + classname);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
