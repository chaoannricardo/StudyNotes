package blob;

import org.apache.commons.io.input.BOMInputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

/**
 * Created with IntelliJ IDEA.
 * User: vincent
 * Date: 13/8/7
 * Time: 上午9:24
 * To change this template use File | Settings | File Templates.
 */
public class Clob_WritToDataBase {

    public static void main(String[] args) {

        try (Connection conn = DriverManager.getConnection(
                "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB;sendStringParametersAsUnicode=false", "scott", "tiger");
            Statement statement = conn.createStatement();
             PreparedStatement stmt = conn.prepareStatement("insert into files (filename,contents) values(?,?)")
        ) {
            conn.setAutoCommit(false);
            statement.execute("delete from Files");
            File file = new File("c:/files_read/MS950.txt");
            //指定檔案的編碼格式,才能正確讀取檔案中的中文字
            FileInputStream fis = new FileInputStream(file);
            //如果使用notepad而產生的UTF8檔案，因為前含有bom，必須使用BOMInputStream
            //BOMInputStream bis = new BOMInputStream(fis);
            //手動指定編碼
            InputStreamReader fr = new InputStreamReader(fis, "MS950");
            //System.out.println("ENCODING "+fr.getEncoding());
            stmt.setString(1, file.getName());
            stmt.setCharacterStream(2, fr);
            System.out.println("檔案=" + file.getPath() + "寫入資料庫");
            stmt.execute();
            fr.close();
            stmt.clearParameters();
            conn.commit();
            System.out.println(Clob_WritToDataBase.class.getName() + "執行結束");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
