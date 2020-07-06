package encapsulation;

/**
 * Created by vincent on 2017/7/17.
 */
public class TestEncapsulation {
    public static void main(String[] args) {
        /*尚末封裝前*/
        /*
        Car car = new Car();
        car.model = "Prius";
        car.price = 100000;
        System.out.println("售出"+car.model+"，"+car.price);
          */
        Car car = new Car();
        car.setModel("yaris");
        System.out.println("售出"+car.getModel()+"，"+car.getPrice());

    }
}
