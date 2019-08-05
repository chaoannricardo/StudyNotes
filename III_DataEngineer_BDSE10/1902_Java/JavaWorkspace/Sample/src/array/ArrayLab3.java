package array;

/**
 * Created by vincent on 2017/6/26.
 */
public class ArrayLab3 {
    public static void main(String[] args) {
        int[] x = { 1,11,34,14,55,6};
        int max = 0;
        int min = 99999;
        int sum = 0;
        for (int  i= 0; i < x.length ; i++ ){
            if ( x[i] > max  ){
                max = x[i];
            }
            if ( x[i] < min ){
                min = x[i];
            }
            sum = sum + x[i];
        }

        System.out.println("max="+max+",min="+min);
        System.out.println("avg="+(double)sum/x.length);
        
    }
}
