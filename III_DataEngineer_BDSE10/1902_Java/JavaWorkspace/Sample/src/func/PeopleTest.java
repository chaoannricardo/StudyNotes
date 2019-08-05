package func;

public class PeopleTest {
    public static void main(String[] args) {
        People people = new People();
        people.height = 1.7;
        people.weight = 70;
//        double BMI = people.getBMI();//使用物件方法必須要先有物件
        double BMI = People.BMI(1.7,70.0); //使用靜態方法不用有物件，有類別就可以了
        //System.out.println("BMI="+BMI);

        //靜態方法也可以透過物件呼叫，但不建議
        System.out.println("BMI="+people.BMI(1.7,70.0));

    }
}
