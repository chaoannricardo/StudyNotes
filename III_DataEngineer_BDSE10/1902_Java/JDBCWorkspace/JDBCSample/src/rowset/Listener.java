package rowset;

import java.sql.SQLException;

import javax.sql.RowSet;
import javax.sql.RowSetEvent;
import javax.sql.RowSetListener;

public class Listener implements RowSetListener {

	@Override
	public void rowSetChanged(RowSetEvent event) {
		
		System.out.println("rowSetChanged");
	}

	@Override
	public void rowChanged(RowSetEvent event) {
		
		System.out.println("rowChanged");
	}

	@Override
	public void cursorMoved(RowSetEvent event) {
		RowSet rowset  = (RowSet) event.getSource();
		try {
			System.out.println("cursor moved at"+rowset.getRow());
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
