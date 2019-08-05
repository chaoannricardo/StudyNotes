package rowset;

import com.sun.rowset.JdbcRowSetImpl;

import javax.sql.rowset.JdbcRowSet;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCRowSetDemo {

    public static void main(String[] args) {


        try (JdbcRowSet rowSet = new JdbcRowSetImpl()) {
            //SQL Server不支援ResultSet.TYPE_SCROLL_INSENSITIVE及ResultSet.CONCUR_UPDATABLE,
            // JdbcRowSet也無法更新為其它型式的type,
            //所以無法使用JdbcRowSet在SQL Server。會丟出NullPointException
            rowSet.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
            rowSet.setUsername("scott");
            rowSet.setPassword("tiger");
            rowSet.setCommand("select * from emp;");
            rowSet.execute();
            while (rowSet.next()) {
                System.out.println("empno=" + rowSet.getInt("empno") + ",salary=" + rowSet.getBigDecimal("salary"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
