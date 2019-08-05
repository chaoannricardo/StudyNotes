package func;

/**
 * Created by vincent on 2017/6/28.
 */
public class ChristmasTreeFunc {
    public static void main(String[] args) {

        printTree(4,"-");

    }

    public static void printTree(int layer, String symbol){
        
        int max = 2*layer - 1;
        for (int i=0; i < layer ;i++){
            
            for (int j= 0 ; j < (max-(i*2+1))/2 ; j++){
                System.out.print(" ");
            }

            for (int k= 0 ; k < 2*i+1 ; k++){
                System.out.print(symbol);
            }
            System.out.println();
        }
    }

}
