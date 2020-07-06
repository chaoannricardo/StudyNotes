package array;

/**
 * Created by vincent on 2017/6/19.
 */
public class EmployeeArray {
    public static void main(String[] args) {
        Employee[] employees = new Employee[2];

        Employee emp1 = new Employee();
        emp1.name = "Vincent";
        emp1.empno = 1001;
        employees[0] = emp1;

        Employee emp2 = new Employee();
        emp2.name = "David";
        emp2.empno = 1002;
        employees[1] = emp2;

        for (int i=0 ;i < employees.length ;i++){
            System.out.println(employees[i].name);
        }

        
    }
}
