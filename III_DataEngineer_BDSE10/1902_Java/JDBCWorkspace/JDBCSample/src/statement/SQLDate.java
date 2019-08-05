package statement;

import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class SQLDate {

	public static void main(String[] args) {
		
		
		try (Connection conn =DriverManager.getConnection(
				"jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
				"scott", "tiger");
			 PreparedStatement stmt = conn.prepareStatement("update emp set hiredate=? where empno=?")
		){
			Calendar cal = new GregorianCalendar();
			//設定 2013/8/1 為hireDate
//			cal.set(Calendar.YEAR, 2013);
//			cal.set(Calendar.MONTH,0);
//			cal.set(Calendar.DATE, 1);
			//月份從0開始,要減一
			cal.set(2013,7,1);
			java.sql.Date hireDate = new java.sql.Date(cal.getTimeInMillis());
			//System.out.println("the hireDate is "+hireDate);
			stmt.setDate(1, hireDate);
			stmt.setInt(2, 1001);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
