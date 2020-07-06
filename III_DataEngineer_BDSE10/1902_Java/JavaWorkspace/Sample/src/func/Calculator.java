package func;

/**
 * Created by vincent on 2017/6/29.
 */
public class Calculator {

    int mode = 0;

    public int add(int a,int b){
        int sum = a + b;
        return sum;
    }

    /* 無法利用不同的回傳值達到overloading
    public long add(int a,int b){
        long sum = a + b;
        return sum;
    }
     */
    public double add(double a,double b){
        double sum = a + b;
        return sum;
    }

    public float add(float a,float b){
        float sum = a + b;
        return sum;
    }
    
    /*
    public static int add(int a,int b){
        mode = 2;
        int sum = a + b;
        //print(sum);
        return sum;
    }
    */
    public void print(int c){
        System.out.println(c);
    }

}
