package version;

import java.io.Console;
import java.math.BigDecimal;
import java.sql.*;

/**
 * Created with IntelliJ IDEA.
 * User: vincent
 * Date: 13/8/21
 * Time: 上午9:48
 * To change this template use File | Settings | File Templates.
 */
public class AccountsUpdate_NoVersion {

    public static void main(String[] args) {
        //該程式只能利用java -cp bin;lib/* version.AccountsUpdate_NoVersion
        Console console = System.console();
        if ( console!=null ){

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JDBCDB",
                    "scott", "tiger");
                  PreparedStatement updatePstmt = conn.prepareStatement("update accounts set balance =? where accountName=?");
                  PreparedStatement pstmt = conn.prepareStatement("select * from Accounts where accountName=?");
                ){

                conn.createStatement().executeUpdate("update accounts set balance=1000");
                console.printf("己回復帳戶餘額為1000\n");
                conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
                printIsolation(conn.getTransactionIsolation());
                console.printf("請輸入帳戶名稱:");
                String outAccountName = console.readLine();
                conn.setAutoCommit(false);
                pstmt.setString(1,outAccountName);
                ResultSet rs = pstmt.executeQuery();
                BigDecimal outAccountBalance;
                if ( rs.next() ){
                    outAccountBalance = rs.getBigDecimal("balance");
                    String name = rs.getString("accountName");
                    console.printf("帳戶"+outAccountName+",餘額="+outAccountBalance+"\n");
                }else{
                    console.printf("查無帳戶："+outAccountName+"\n");
                    return;
                }
//
                console.printf("請輸入欲轉入帳戶:");
                String inAccount = console.readLine();
                pstmt.setString(1,inAccount);
                ResultSet resultSet = pstmt.executeQuery();
                if ( resultSet.next()){
                    BigDecimal inAccountBalance = resultSet.getBigDecimal("balance");
                    console.printf("請輸入轉帳金額:");
                    BigDecimal balance = new BigDecimal(console.readLine());
                    if ( outAccountBalance.compareTo(balance) > 0) {
                        outAccountBalance = outAccountBalance.subtract(balance);
                        inAccountBalance = inAccountBalance.add(balance);
                        updatePstmt.setBigDecimal(1,inAccountBalance);
                        updatePstmt.setString(2,inAccount);
                        updatePstmt.executeUpdate();
                        updatePstmt.clearParameters();
                        updatePstmt.setBigDecimal(1,outAccountBalance);
                        updatePstmt.setString(2,outAccountName);
                        updatePstmt.executeUpdate();
                        updatePstmt.clearParameters();
                        console.printf("更新結束:"+outAccountName+":餘額="+outAccountBalance+", "+inAccount+"：餘額＝"+inAccountBalance);
                        conn.commit();
                    }else{
                        console.printf(outAccountName+" 餘額不足：\n");
                    }
                }else{
                    console.printf("查無帳戶："+inAccount+"\n");
                    return;
                }
                console.printf("更新結束\n");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    static void printIsolation(int transactionIsolation) {
        System.out.print("交易隔離性為：");
        switch (transactionIsolation) {
            case Connection.TRANSACTION_READ_COMMITTED:
                System.out.println("READ_COMMITTED");
                break;
            case Connection.TRANSACTION_REPEATABLE_READ:
                System.out.println("REPEATABLE_READ");
                break;
            case Connection.TRANSACTION_SERIALIZABLE:
                System.out.println("SERIALIZABLE");
                break;
            default:
                System.out.println("不對哦");

        }

    }
}
