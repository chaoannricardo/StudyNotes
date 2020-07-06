package array;

/**
 * Created by vincent on 2017/6/23.
 */
public class Array2Dimension {
    public static void main(String[] args) {
        
        int[][] x = { {1,2,3} ,{4,5} };

        for (int i=0 ; i < x.length ; i ++){
            for (int j=0 ; j < x[i].length ; j++){
                System.out.println(x[i][j]);
            }
        }

    }
}
