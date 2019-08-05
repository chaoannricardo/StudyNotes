package exception;


import pack.Employee;

public class NullException {
    public static void main(String[] args) {

        Employee employee = null;
        System.out.println("employee.name = " + employee.name);

    }
}
