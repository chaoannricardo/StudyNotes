package orm;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * User: vincent
 * Date: 13/8/15
 * Time: 上午11:01
 * To change this template use File | Settings | File Templates.
 */
public class EmployeeJDBCDAO implements EmployeeDAO {

    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public DataSource getDataSource() {
        if (dataSource == null) {

            Properties env = new Properties();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.rmi.registry.RegistryContextFactory");
            env.put(Context.PROVIDER_URL, "rmi://localhost:1099");
            Context context = null;
            try {
                context = new InitialContext(env);
                dataSource = (DataSource) context.lookup("jdbc/sqlServer");
            } catch (NamingException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }
        return dataSource;
    }

    /* (non-Javadoc)
	 * @see orm.EmployeeDAO#updateEmployee(orm.Employee)
	 */
    public void updateEmployee(Employee employee) {

        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement("update emp set commission=?,hiredate=?,job=?,ename=?,salary=?,version=version+1 where empno=? and version=?")
        ) {
            stmt.setBigDecimal(1, employee.getCommission());
            //將java.util.Date轉換成java.sql.Date
            java.sql.Date hireDate = new Date(employee.getHiredate().getTime());
            stmt.setDate(2, hireDate);
            stmt.setString(3, employee.getJob());
            stmt.setString(4, employee.getName());
            stmt.setBigDecimal(5, employee.getSalary());
            stmt.setInt(6, employee.getEmpNO());
            stmt.setInt(7, employee.getVersion());
            int result = stmt.executeUpdate();
            if (result == 0) {
                throw new RuntimeException("update fail");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /* (non-Javadoc)
      * @see orm.EmployeeDAO#listEmployees()
      */
    public List<Employee> listEmployees() {

        List<Employee> lists = new ArrayList<Employee>();
        try (Connection conn = getDataSource().getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from emp ")
        ) {
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setCommission(rs.getBigDecimal("commission"));
                employee.setEmpNO(rs.getInt("empno"));
                employee.setHiredate(rs.getDate("hiredate"));
                employee.setJob(rs.getString("job"));
                employee.setName(rs.getString("ename"));
                employee.setSalary(rs.getBigDecimal("salary"));
                employee.setVersion(rs.getInt("version"));
                lists.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return lists;
    }


}
