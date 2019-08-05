package rowset;

import java.math.BigDecimal;
import java.sql.SQLException;

import javax.sql.RowSet;
import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.FilteredRowSet;
import javax.sql.rowset.Predicate;

import com.sun.rowset.FilteredRowSetImpl;

public class FilteredRowSetDemo {

	public static void main(String[] args) {
		

		try (FilteredRowSet frset = new FilteredRowSetImpl(); ) {
			frset.setCommand("select * from emp");
			frset.setUsername("scott");
			frset.setPassword("tiger");
			frset.setUrl("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB");
			frset.setFilter(new Predicate() {
				@Override
				public boolean evaluate(Object value, String columnName)
						throws SQLException {
					return false;
				}
				
				@Override
				public boolean evaluate(Object value, int column) throws SQLException {
					return false;
				}
				
				@Override
				public boolean evaluate(RowSet rs) {
					CachedRowSet crset = (CachedRowSet)rs;
					//只有薪資大於1000的才要顥示出來
					BigDecimal thousand = new BigDecimal("1000");
					try {
						if ( rs.getRow() == 0 ){
							return true;
						}
						//System.out.println(crset.getRow());
						BigDecimal salary = rs.getBigDecimal("salary");
						if ( salary.compareTo(thousand) >= 0){
							return true;
						}
						return false;
					} catch (SQLException e) {
						e.printStackTrace();
						return false;
					}
				}
			});
			frset.execute();
			while ( frset.next()){
				System.out.println("empno="+frset.getInt("empno")+",salary="+frset.getBigDecimal("salary"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
