package array;

/**
 * Created by vincent on 2017/6/16.
 */
public class IntArray {
    public static void main(String[] args) {

        int[] ages = new int[3];
        ages[0] = 10;
        ages[1] = 20;
        ages[2] = 18;

        //使用大括號產生array並指定初值
        //int[] ages = {10,20,18};

        for (int i=0 ; i< ages.length ;i++){
            System.out.println(""+i + "="+ages[i]);
        }
        
    }
}
