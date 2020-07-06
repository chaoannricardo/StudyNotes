/**
 * Created by vincent on 2017/5/18.
 */
public class TestPrecision {
    public static void main(String[] args) {
        float a= 123.45678901234567890f;
        double b=123.45678901234567890;

        System.out.println(a); //123.45678710937500000
        System.out.println(b); //123.45678901234568000

        
        // float 0.7 跟double 0.7是不同的
        float aFloat = 0.7f ;

        if ( aFloat == 0.7){
            System.out.println("this is the same");
        }else{
            System.out.println("this is the not same");
            System.out.println(String.format("%.15f", aFloat));
        }
    }
}
