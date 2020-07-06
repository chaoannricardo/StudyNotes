/**
 * Created by vincent on 2017/6/3.
 */
public class Employee {
    int empno;
    String name;

    public static void main(String[] args) {

        Employee emp = new Employee();
        emp.name = "1";
        Employee emp2 = new Employee();
        emp2.name = "2";
        emp2 = emp;
        System.out.println("finish");
    }


}
