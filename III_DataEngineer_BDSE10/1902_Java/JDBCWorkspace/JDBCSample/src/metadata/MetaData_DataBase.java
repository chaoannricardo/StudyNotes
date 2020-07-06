package metadata;

import java.sql.*;

public class MetaData_DataBase {

	public static void main(String[] args) {


		try ( Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger"); ) {

			DatabaseMetaData dbmd = conn.getMetaData();
			//取得資料庫版本
			System.out.println("Database name ="+dbmd.getDatabaseProductName());
			System.out.println("driver version ="+dbmd.getDatabaseProductVersion()); //11.00.2100
			//取得driver
			System.out.println("driver name="+dbmd.getDriverName());
			System.out.println("driver version="+dbmd.getDriverVersion());
			System.out.println("JDBC Version="+dbmd.getJDBCMajorVersion()+"."+dbmd.getJDBCMinorVersion());
			
			try ( ResultSet rs = dbmd.getTables("JDBCDB", "dbo", null,new String[]{"TABLE"}) ){
//				ResultSetMetaData rsmd = rs.getMetaData();
				while ( rs.next()){
					String category = rs.getString("TABLE_CAT");
					String tableschema = rs.getString("TABLE_SCHEM");
					String tablename = rs.getString("TABLE_NAME");
					String type = rs.getString("TABLE_TYPE");
					String remark = rs.getString("REMARKS");
					//String typeOfCategory = rs.getString("TYPE_CAT");   //SQL Server不會回傳
					//String typeOfSchema = rs.getString("TYPE_SCHEM");   //SQL Server不會回傳
					//String typeOfName = rs.getString("TYPE_NAME");      //SQL Server不會回傳

					System.out.println("name="+tablename+",schema="+tableschema+",category="+category+",type="+type);

					//取得Columns Lab
					try ( ResultSet columnrs =  dbmd.getColumns("JDBCDB",tableschema,tablename,null) ){
						while ( columnrs.next()){
							String columnName = columnrs.getString("COLUMN_NAME");
							String typename = columnrs.getString("TYPE_NAME");
							int dataType = columnrs.getInt("DATA_TYPE");
							if ( dataType == java.sql.Types.NUMERIC ) {
								int size = columnrs.getInt("COLUMN_SIZE");
								int digits = columnrs.getInt("DECIMAL_DIGITS");
								typename = typename+"("+size+","+digits+")";
							}
							System.out.println("\tcolname"+columnName+",type="+typename);
						}
					}catch (SQLException ex){
						ex.printStackTrace();
					}
				}
			}catch ( SQLException ex){
				ex.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
