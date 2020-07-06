package array;

/**
 * Created by vincent on 2017/6/26.
 */
public class ForLab2 {
    public static void main(String[] args) {

        int[][] x = { {1,2,3} ,{4,5,6} ,{7,8,9} };
        int sum = 0;
        for (int i=0 ; i < x.length ; i++ ){
            for (int j=0 ; j < x[i].length ; j++){
                sum = sum + x[i][j];
            }
        }

        for ( int[] y : x ){
            for ( int a : y ) {
                System.out.println(a);
            }
        }

//        System.out.println("sum = "+sum);
    }
}
