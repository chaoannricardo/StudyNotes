package datasource;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.*;
import java.math.BigDecimal;
import java.sql.*;
import java.util.Properties;

public class PreparedStatementBatchUpdateLab {

    public static void main(String[] args) throws NamingException {

        /*
        step 1 use data source
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        ds.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
        ds.setUsername("scott");
        ds.setPassword("tiger");
        */

        //step2 start JDNI server and use jndi to connect sql server
        Properties env = new Properties();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.rmi.registry.RegistryContextFactory");
        env.put(Context.PROVIDER_URL, "rmi://localhost:1099");
        Context context = new InitialContext(env);
        DataSource ds = (DataSource) context.lookup("jdbc/sqlServer");

        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("update emp set commission=? where empno=?");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from emp, dept where emp.deptno=dept.deptno")
        ) {

            int count = 0;

            StringBuilder builder = new StringBuilder();
            builder.append("<html>");
            builder.append("<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head>");
            builder.append("<table border=1 >").append("<tr>").append("<th>編號</th>").append("<th>姓名</th>").append("<th>commission</th>").append("</tr>");

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
                    pstmt.executeBatch();
                    pstmt.clearBatch();
                }
            }
            //可能有剩下的,必須再送一次
            pstmt.executeBatch();
            pstmt.clearBatch();

            builder.append("</table></html>");

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

}
