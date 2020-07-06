package blob;

import java.io.*;
import java.sql.*;

/**
 * Created with IntelliJ IDEA.
 * User: vincent
 * Date: 13/8/7
 * Time: 上午9:23
 * To change this template use File | Settings | File Templates.
 */
public class Clob_ReadFromDataBase {

    public static void main(String[] args) {

        try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB", "scott", "tiger");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from files")
        ) {
            while (rs.next()) {

                String filename = rs.getString("filename");
                Reader reader = rs.getCharacterStream("contents");

                File file = new File("c:/files_write/"+filename);
                FileOutputStream fs = new FileOutputStream(file);

                OutputStreamWriter fos = new OutputStreamWriter(fs, "MS950");
                char[] buffer = new char[1024];
                int length;
                while ((length = reader.read(buffer)) != -1) {
                    fos.write(buffer, 0, length);
                }
                fos.close();
                System.out.println("寫出檔案=" + file.getPath());
            }
            System.out.println(Clob_ReadFromDataBase.class.getName() + "執行結束");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
