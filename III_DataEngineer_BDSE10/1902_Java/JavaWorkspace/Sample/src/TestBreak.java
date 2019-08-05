/**
 * Created by vincent on 2017/6/3.
 */
public class TestBreak {
    public static void main(String[] args) {
        //取random大於0.9，最多取100次
        double random;
        int counter = 0;
        do{
            random = Math.random();
            counter ++;
            if ( counter == 100){
                break;
            }
        }while( random <= 0.9);
        System.out.println(random);
        System.out.println(counter);
    }
}
