import java.io.IOException;
import java.util.Properties;


public class JDBCProperties {
	static Properties properties;
	
	private static String JDBCURL;
	static {
		properties = new Properties();
		try {
			properties.load(JDBCProperties.class.getClassLoader().getResourceAsStream("jdbc.properties"));
			JDBCURL = "jdbc:sqlserver://"+properties.getProperty("ip")+":"+properties.getProperty("port")+";databaseName="+properties.getProperty("dataBase");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String JDBCURL(){
		return JDBCURL;
	}
	public static String getUser(){
		return properties.getProperty("user");
	}
	public static String getPassword(){
		return properties.getProperty("password");
	}
}
