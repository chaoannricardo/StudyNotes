package constructor;

public class TestCar {
    public static void main(String[] args) {
        // default constructor
        // Car car = new Car();

        Car car = new Car("Yaris");
        System.out.println(car.getInfo());

    }
}
