package reference;

/**
 * Created by vincent on 2017/7/10.
 */
public class PassValueTest {
    public static void main(String[] args) {
        int a = 10;
        addOne(a);
        System.out.println(a);
    }

    public static void addOne(int b){
        b = b+ 1;
        System.out.println(b);
    }

}
