package rowset;

import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.JoinRowSet;

import com.sun.rowset.CachedRowSetImpl;
import com.sun.rowset.JoinRowSetImpl;

public class JoinRowSetDemo {

	public static void main(String[] args) {
		

		
		try ( JoinRowSet jrs = new JoinRowSetImpl() ){

			CachedRowSet crset1 = new CachedRowSetImpl();
			crset1.setCommand("select * from emp");
			crset1.setUsername("scott");
			crset1.setPassword("tiger");
			crset1.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
			crset1.execute();
			crset1.setMatchColumn("deptno");
			
			CachedRowSet crset2 = new CachedRowSetImpl();
			crset2.setCommand("select * from dept");
			crset2.setUsername("scott");
			crset2.setPassword("tiger");
			crset2.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
			crset2.execute();
			crset2.setMatchColumn("deptno");
			
			jrs.addRowSet(crset1);
			jrs.addRowSet(crset2);
			
			while ( jrs.next()){
				System.out.println("empno="+jrs.getInt("empno")+",部門名稱="+jrs.getString("dname"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
