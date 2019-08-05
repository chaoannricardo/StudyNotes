package reference;

/**
 * Created by vincent on 2017/7/10.
 */
public class PassObjectTest {
    public static void main(String[] args) {
        Employee employee = new Employee();
        employee.name = "David";
        employee.age = 20;
        System.out.println("before update age = "+employee.age);
        update(employee);
        System.out.println("after update age = "+employee.age);
    }

    public static void update(Employee emp){
        emp.age = 18;
    }
}
