package datasource;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBCP_JNDI {

    public static void main(String[] args) throws NamingException {

        Properties env = new Properties();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.rmi.registry.RegistryContextFactory");
        env.put(Context.PROVIDER_URL, "rmi://localhost:1099");
        Context context = new InitialContext(env);

        DataSource ds = (DataSource) context.lookup("jdbc/sqlServer");
        //觀察使用connection數量
        //查詢SQL Server連線數 SELECT session_id,auth_scheme,client_net_address,client_tcp_port, local_net_address,local_tcp_port FROM sys.dm_exec_connections
        print(ds);
        print(ds);
        print(ds);
        System.out.println("DBCP_JNDI finished");

    }

    public static void print(DataSource ds) {
        try (Connection conn = ds.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from emp");
        ) {
            while (rs.next()) {
                System.out.println("empno:" + rs.getInt("empno"));
            }
            System.out.println(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
