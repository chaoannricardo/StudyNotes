package batchUpdate;

import java.io.*;
import java.math.BigDecimal;
import java.sql.*;
import java.util.Arrays;

public class PreparedStatementBatchUpdateLab_CSV {

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
            builder.append("編號").append(",").append("姓名").append(",").append("commission");

            while (rs.next()) {
                int empno = rs.getInt("empno");
                String name =rs.getString("ename");

                String location = rs.getString("location");
                if (location.equals("台北")) {
                    builder.append(System.lineSeparator());
                    builder.append(empno).append(",");
                    builder.append(name).append(",");
                    BigDecimal commission = rs.getBigDecimal("commission");
                    commission = commission.add(new BigDecimal("100"));
                    pstmt.setBigDecimal(1, commission);
                    pstmt.setInt(2, empno);
                    builder.append(commission);
                    //加入批次
                    pstmt.addBatch();
                    count ++;
                    //pstmt.executeUpdate();
                    pstmt.clearParameters();
                }

                //每隔20筆送資料庫一次
                if ( count %20 == 0){
                    int results[] = pstmt.executeBatch();
                    //檢查更新是否有錯
                    checkBatchError(results);
                    pstmt.clearBatch();
                }
            }
            //可能有剩下的,必須再送一次
            int results[] = pstmt.executeBatch();
            //檢查更新是否有錯
            checkBatchError(results);
            pstmt.clearBatch();

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

            
            File file  = new File("c:/files_write/report.csv");
            try ( FileOutputStream fos = new FileOutputStream(file);
                 OutputStreamWriter writer = new OutputStreamWriter(fos,"MS950");
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
