package metadata;

import java.sql.*;

public class DatabaseMetaDataLab {

	public static void main(String[] args) {
		try (Connection connection = 
		DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
				"scott", "tiger");) {

			DatabaseMetaData dbmd = connection.getMetaData();
			System.out.println(dbmd.getDatabaseProductName());
			System.out.println(dbmd.getDatabaseProductVersion());
			System.out.println(dbmd.getDriverName());
			System.out.println(dbmd.getJDBCMajorVersion());
			System.out.println(dbmd.getJDBCMinorVersion());
			
			
			ResultSet rs = dbmd.getTables("JDBCDB", "dbo", null, new String[]{"TABLE"});
			while (rs.next()) {
				
				String tableName = rs.getString("TABLE_NAME");
				System.out.println(tableName);
				
				ResultSet columnrs = dbmd.getColumns("JDBCDB", "dbo", tableName, null);
				while ( columnrs.next()) {
					
					String name = columnrs.getString("COLUMN_NAME");
					int type  = columnrs.getInt("DATA_TYPE");
					if ( type == java.sql.Types.NUMERIC ) {
						int size = columnrs.getInt("COLUMN_SIZE");
						int digits = columnrs.getInt("DECIMAL_DIGITS");
						System.out.println(name+"("+size+","+digits+")");
					}else {
						System.out.println(name);
					}
					
					
				}
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
