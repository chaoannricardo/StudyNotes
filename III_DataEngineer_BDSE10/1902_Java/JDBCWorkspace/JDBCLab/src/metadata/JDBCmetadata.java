package metadata;

import java.sql.*;import javax.imageio.plugins.bmp.BMPImageWriteParam;

public class JDBCmetadata {

	public static void main(String[] args) {
		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=JDBCDB",
				"scott", "tiger");
				) {
			
			DatabaseMetaData dbm = connection.getMetaData();
			System.out.println(dbm.getDatabaseProductName());
			System.out.println(dbm.getDatabaseProductVersion());
			System.out.println(dbm.getDatabaseMajorVersion());
			System.out.println(dbm.getDatabaseMinorVersion());
			System.out.println(dbm.getJDBCMajorVersion());
			System.out.println(dbm.getDriverName());
			
			ResultSet rs = dbm.getTables("JDBCDB", "dbo", null, new String[] {"Table"});
			while (rs.next()) {
				String tablename = rs.getString("TABLE_NAME");
				System.out.println(tablename);
				
				
				ResultSet columnrs = dbm.getColumns("JDBCDB", "dbo", tablename, null);
				
				while (columnrs.next()) {
					String name = columnrs.getString("COLUMN_NAME");
					int Type = columnrs.getInt("DATA_TYPE");
					if (Type == java.sql.Types.NUMERIC) {
						int size = columnrs.getInt("COLUMN_SIZE");
						int digits = columnrs.getInt("DECIMAL_DIGITS");
						System.out.println(name+"("+size+","+digits+")");
						
					}else {
						System.out.println(name);
					}
				}
			}
			
			
			

			
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			System.out.println("Finish");
		}

		

	}

}
