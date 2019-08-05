package equals;

public class EmployeeEquals {
    public static void main(String[] args) {

        Employee e1 = new Employee("001");
        Employee e2 = new Employee("001");
        //System.out.println(e1 == e2);
        System.out.println(e1.equals(e2));

    }
}
