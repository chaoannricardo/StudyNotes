package resultset;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class ResultSetCursorUpdatable {

public static void main(String[] args) {
		

	try ( Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB","scott","tiger");
		  //注意CONCUR_UPDATABLE 一定要配合 TYPE_SCROLL_SENSITIVE
		  Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);//預設值，等同於conn.createStatement()
		  ResultSet rs = stmt.executeQuery("select * from emp order by empno") ){

			//更新第二筆資料的ename欄位
			/*
			rs.absolute(2);
			rs.updateString("ename","Vincent");
			rs.cancelRowUpdates();
			rs.updateRow();
			
			*/
			
			//loop.刪除1005該筆資料,刪除不需要updateRow()
            /*rs.beforeFirst();
            while ( rs.next()){
                int empno = rs.getInt("empno");
                System.out.println("empno = "+empno);
                if ( empno == 1005){
                    rs.deleteRow();
                }
            }*/

			//新增資料

			rs.moveToInsertRow();
			rs.updateInt("empno", 1012);
			rs.updateString("ename", "小明");
			rs.updateString("job", "工讀生");
			Calendar calendar = Calendar.getInstance();
			calendar.set(2018,Calendar.JANUARY,1);
			java.sql.Date date = new java.sql.Date(calendar.getTimeInMillis());
			rs.updateDate("hiredate", date);
			rs.updateLong("salary", 10000);
			rs.updateInt("commission",0);
			rs.updateInt("deptno", 30);
			rs.insertRow();
			rs.moveToCurrentRow();

			
			System.out.println("finished");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
