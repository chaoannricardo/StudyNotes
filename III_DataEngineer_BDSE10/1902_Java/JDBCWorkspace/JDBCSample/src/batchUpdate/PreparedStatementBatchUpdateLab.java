package batchUpdate;

import java.io.*;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Arrays;

public class PreparedStatementBatchUpdateLab {

    public static void main(String[] args) {


        try (Connection conn = DriverManager
                .getConnection(
                        "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                        "scott", "tiger");
             PreparedStatement pstmt = conn.prepareStatement("update emp set commission=? where empno=?");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from emp, dept where emp.deptno=dept.deptno")
        ) {

            conn.setAutoCommit(false);

            int count = 0;

            StringBuilder builder = new StringBuilder();
            builder.append("<html>");
            builder.append("<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head>");
            builder.append("<table border=1 ><tr><th>編號</th><th>姓名</th><th>commission</th></tr>");

            while (rs.next()) {
                int empno = rs.getInt("empno");
                String name =rs.getString("ename");

                String location = rs.getString("location");
                if (location.equals("台北")) {
                    builder.append("<tr>");
                    builder.append("<td>").append(empno).append("</td>");
                    builder.append("<td>").append(name).append("</td>");
                    BigDecimal commission = rs.getBigDecimal("commission");
                    commission = commission.add(new BigDecimal("100"));
                    pstmt.setBigDecimal(1, commission);
                    pstmt.setInt(2, empno);
                    builder.append("<td>").append(commission).append("</td>");
                    builder.append("</tr>");
                    //加入批次
                    pstmt.addBatch();
                    count ++;
                    //pstmt.executeUpdate();
                    pstmt.clearParameters();
                }

                //每隔20筆送資料庫一次
                if ( count %20 == 0){
                    int results[] = pstmt.executeBatch();
                    //檢查更新是否有錯,有錯則丟exception, rollback
                    checkBatchError(results);
                    pstmt.clearBatch();
                }
            }
            //可能有剩下的,必須再送一次
            int results[] = pstmt.executeBatch();
            //檢查更新是否有錯,有錯則丟exception, rollback
            checkBatchError(results);
            pstmt.clearBatch();
            builder.append("</table></html>");
            conn.commit();

            //nio
            /*
            Path path = Paths.get("c:/files_write/report.html");
            try (BufferedWriter bufferedWriter = Files.newBufferedWriter(path, Charset.forName("UTF8"))) {
                bufferedWriter.write(builder.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
            */

            System.out.println("html="+builder.toString());

            File file  = new File("c:/files_write/report.html");
            try ( FileOutputStream fos = new FileOutputStream(file);
                 OutputStreamWriter writer = new OutputStreamWriter(fos,"UTF8");
                 BufferedWriter bufferedWriter = new BufferedWriter(writer) ){
                bufferedWriter.write(builder.toString());
            }catch (IOException ex){
                ex.printStackTrace();
            }

            System.out.println("PreparedStatementBatchUpdateLab finished");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void checkBatchError(int[] results) {
        boolean zeroUpdate = Arrays.stream(results).anyMatch(update -> update == 0);
        if ( zeroUpdate ){
            throw new RuntimeException("update fail");
        }
    }

}
