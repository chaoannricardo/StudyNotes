/**
 * Created by vincent on 2017/6/3.
 */
public class TestDoWhile {
    public static void main(String[] args) {
        //範例:取亂數，至少要> 0.5
        double random;
        //do while至少會執行一次
        do{
            random = Math.random();
        }
        while ( random <= 0.5 );
        System.out.println(random);
    }
}
