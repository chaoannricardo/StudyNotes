package orm;

import java.util.List;

public interface EmployeeDAO {

	public List<Employee> listEmployees();

	public void updateEmployee(Employee employee);

}