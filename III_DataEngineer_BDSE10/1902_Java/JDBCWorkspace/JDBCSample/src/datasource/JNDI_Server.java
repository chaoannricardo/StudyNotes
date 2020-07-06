package datasource;

import javax.naming.*;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;
import java.util.Properties;

public class JNDI_Server {

    public static void main(String[] args) throws RemoteException {

        //起動RMI 型式的JNDI Server,port 1099
        int port = 1099;
        String providerUrl = "rmi://localhost:"+port;
        LocateRegistry.createRegistry(port);
        System.out.println("RMI registry ready.");

        try {

            Properties env = new Properties();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.rmi.registry.RegistryContextFactory");
            env.put(Context.PROVIDER_URL, providerUrl);
            Context context = new InitialContext(env);

            //Reference第一個參數為產生的物件類別,第二個參數為實作javax.naming.spi.ObjectFactory的類別

            Reference ref = new Reference("javax.sql.DataSource", "org.apache.commons.dbcp2.BasicDataSourceFactory", null);
            ref.add(new StringRefAddr("driverClassName", "com.microsoft.sqlserver.jdbc.SQLServerDriver"));
            //將localhost 改成IP
            ref.add(new StringRefAddr("url", "jdbc:sqlserver://localhost:1433;databaseName=JDBCDB"));
            ref.add(new StringRefAddr("username", "scott"));
            ref.add(new StringRefAddr("password", "tiger"));
            ref.add(new StringRefAddr("maxTotal", "50"));
            ref.add(new StringRefAddr("maxIdle", "50"));

            /*
            //使用Microsoft Pool DataSource
            Reference ref = new Reference("com.microsoft.sqlserver.jdbc.SQLServerConnectionPoolDataSource", "com.microsoft.sqlserver.jdbc.SQLServerDataSourceObjectFactory", null);
            ref.add(new StringRefAddr("driverClassName", "com.microsoft.sqlserver.jdbc.SQLServerDriver"));
            ref.add(new StringRefAddr("user", "scott"));
            ref.add(new StringRefAddr("password", "tiger"));
            ref.add(new StringRefAddr("class", "com.microsoft.sqlserver.jdbc.SQLServerConnectionPoolDataSource"));
            ref.add(new StringRefAddr("serverName", "localhost"));
            ref.add(new StringRefAddr("databaseName", "JDBCDB"));
            */
            context.bind("jdbc/sqlServer", ref);
            System.out.println("RMI 型式的JNDI己經啟動,己將DataSource綁定名稱為jdbc/sqlServer");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public static class RemoteObject extends UnicastRemoteObject {

        protected RemoteObject() throws RemoteException {
            super();
        }

        /**
         *
         */
        private static final long serialVersionUID = -1772194380098113751L;
    }

}
