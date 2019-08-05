package abs;

public class TestAbstract {
    public static void main(String[] args) {

        //無法產生abstract class的物件
        //Animal animal = new Animal();
        
        Animal dog = new Dog();
        System.out.println(dog.sound());

    }
}
