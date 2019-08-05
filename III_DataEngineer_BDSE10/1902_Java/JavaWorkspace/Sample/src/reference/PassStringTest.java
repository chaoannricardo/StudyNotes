package reference;

/**
 * Created by vincent on 2017/7/10.
 */
public class PassStringTest {
    public static void main(String[] args) {
        
        String string1 = "David";
        System.out.println("before update string = "+string1);
        update(string1);
        System.out.println("after update string = "+string1);
        
    }

    public static void update(String string){
        string = "Vincent";
    }
}
