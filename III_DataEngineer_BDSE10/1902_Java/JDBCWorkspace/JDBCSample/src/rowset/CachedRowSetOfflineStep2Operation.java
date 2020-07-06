package rowset;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.math.BigDecimal;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

public class CachedRowSetOfflineStep2Operation {

	public static void main(String[] args) throws IOException, ClassNotFoundException{

		FileInputStream in = new FileInputStream("c:/files_write/rowset.xxx");
		ObjectInputStream oin = new ObjectInputStream(in);

		try ( CachedRowSet crset =  (CachedRowSet) oin.readObject() ) {

			crset.absolute(2);
			crset.updateBigDecimal("commission", new BigDecimal("100.0"));
			System.out.println("更新 empno="+crset.getString("empno")+",name="+crset.getString("ename")+" commission="+100);
			crset.updateRow();

            crset.beforeFirst();
            while ( crset.next()){
                int empno = crset.getInt("empno");
                String name = crset.getString("ename");
                BigDecimal commission = crset.getBigDecimal("commission");
                System.out.println("empno="+empno+",name="+name+",commission="+commission);
            }
			
			//再次寫到檔案
			// 將crset寫到檔案中
			FileOutputStream fos = new FileOutputStream("c:/files_write/rowset.xxx");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(crset);
			fos.close();

			System.out.println( CachedRowSetOfflineStep2Operation.class+" Finished");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
