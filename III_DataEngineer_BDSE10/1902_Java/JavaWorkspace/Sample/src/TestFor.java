public class TestFor {
    public static void main(String[] args) {

        for (int i = 1 ;i  <= 100 ;i++){
            //System.out.println(i);
        }

        /*
        int i=1;
        for (  ;i  <= 100 ;i++){
            System.out.println(i);
        }
        System.out.println(i);
          */

        //Lab計算1加到100的總和
        int sum = 0;
        for (int i = 1  ; i <= 100 ; i++ ){
            System.out.println("第"+ i +"次執行，sum 原本的值為 " + sum +" + "+ i);
            sum = sum + i;
        }
        System.out.println("總和="+sum);

        //Lab計算1加到100的奇數的總和
        sum = 0;
        for (int i = 1  ; i <= 100 ; i++ ){
            if ( i % 2 == 1 ) {
                sum = sum + i;
            }
        }
        System.out.println("總和="+sum);


    }
}
