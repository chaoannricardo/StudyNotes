package func;

/**
 * Created by vincent on 2017/6/28.
 */
public class FuncReturn {

    public static void main(String[] args) {
        int[] x = {1,2,3,4,5};
        int sumValue = sum(x);
        System.out.println(sumValue);
    }

    public static int sum(int[] values ){
        int sum = 0;
        for (int i=0 ;i < values.length ; i++){
            sum = sum + values[i];
        }
        return sum;
    }

}
