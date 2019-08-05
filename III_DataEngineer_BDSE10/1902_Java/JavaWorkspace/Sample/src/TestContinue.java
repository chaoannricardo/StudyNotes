/**
 * Created by vincent on 2017/6/3.
 */
public class TestContinue {
    public static void main(String[] args) {
        int sum = 0;
        for(  int i = 1 ; i <= 100 ;  i++ ){
            //如果是奇數則跳過
            if ( i % 2 == 1 ){
                continue;
            }
            if ( i == 50 ){
                break;
            }
            System.out.println("i="+i);
            sum = sum + i;
        }
        System.out.println(sum);
    }
}
