package func;

/**
 * Created by vincent on 2017/6/29.
 */
public class CalculatorTest {
    
    public static void main(String[] args) {
        int sum = add(1,2);
        System.out.println(sum);
    }

    public static int add(int a,int b){
        int sum = a + b;
        return sum;
    }
    
}
