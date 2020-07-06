-- JAVA    dbmd.gettabletypes()
-- https://docs.microsoft.com/en-us/sql/connect/jdbc/reference/gettabletypes-method-sqlserverdatabasemetadata?view=sql-server-2017

--TSQL 

create procedure  f_gettabletypes
as
   select  distinct  type_desc from sys.objects
     where type_desc  IN ('SYSTEM_TABLE', 'VIEW','USER_TABLE')

/*
SYSTEM_TABLE
USER_TABLE
VIEW
*/

exec   f_gettabletypes


/*
  // getTableTypes Method (SQLServerDatabaseMetaData)

public static void executeGetTableTypes(Connection con) {  
   try {  
      DatabaseMetaData dbmd = con.getMetaData();  
      ResultSet rs = dbmd.getTableTypes();  
      ResultSetMetaData rsmd = rs.getMetaData();  

      // Display the result set data.  
      int cols = rsmd.getColumnCount();  
      while(rs.next()) {  
         for (int i = 1; i <= cols; i++) {  
            System.out.println(rs.getString(i));  
         }  
      }  
      rs.close();  
   }   

   catch (Exception e) {  
      e.printStackTrace();  
   }  
}  
*/




