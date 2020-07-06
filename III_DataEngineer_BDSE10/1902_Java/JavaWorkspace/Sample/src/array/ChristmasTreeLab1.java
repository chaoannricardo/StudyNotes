package array;

/**
 * Created by vincent on 2017/6/26.
 */
public class ChristmasTreeLab1 {
    public static void main(String[] args) {

        int n = 5;
        int max = 2*n - 1;

        for (int i=0; i < n ;i++){
            //輸出空格
            for (int j= 0 ; j < (max-(i*2+1))/2 ; j++){
                System.out.print(" ");
            }
            //輸出*
            for (int k= 0 ; k < 2*i+1 ; k++){
                System.out.print("*");
            }
            //輸出換一行
            System.out.println();
        }
    }
}

