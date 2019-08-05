/**
 * Created by vincent on 2017/5/22.
 */
public class TestOperators {

    public static void main(String[] args) {

        // + - * /
        /*
        int a = 10, b = 3;
        System.out.println("a+b="+(a+b));
        System.out.println("a-b="+(a-b));
        System.out.println("a*b="+(a*b));
        System.out.println("a/b="+(a/b));
        System.out.println("a%b="+(a%b));
        double c = a / b;
        System.out.println("a/b="+(c));
        */

        /*
        //Binary Numeric Promotion
        
        System.out.println("10+3="+(10+3));
        System.out.println("10+3.0="+(10+3.0));
        System.out.println("10/3="+(10/3));
        System.out.println("10/3.0="+(10/3.0));
        */
        

        //比較運算 <=
        /*
        System.out.println(" 200 > 100 " + (200 > 100));
        System.out.println(" 200 >= 100 " + (200 >= 100));
        System.out.println(" 200 <= 100 " + (200 <= 100));
        System.out.println(" 200 < 100 " + (200 < 100));
        System.out.println(" 200 == 100 " + (200 == 100));
        System.out.println(" 200 != 100 " + (200 != 100));
         */
        //條件運算 <=
        /*
        int age = 25;
        System.out.println(age > 18 && age < 30);
        System.out.println(age > 18 || age < 30);
        System.out.println( !(age < 18) );
        System.out.println( false ^ true);
          */

        //位元運算
        //  0 0 0 0 0 0 0 1  的值為1,往左移一個bit，則為乘2
       /* int value1 = -126;
        int value3 = value1 >> 33;
        System.out.println(Integer.toBinaryString(value1));
        System.out.println(Integer.toBinaryString(value3));*/

        //遞增、遞減運算
        /*int a = 10;
        System.out.println(++a);
        System.out.println(a);
        a++; // 如果有只一行程式，則等於++a
        System.out.println(a);
        */

        //指定運算
        /*int b = 10;
        int c = 2;
        //int d = 10 + 0.2; //compile error
        c += b; //測試+-*//* %
        System.out.println(c);
        */
        
        //三元運算
        int age = 18;
        System.out.println( age >= 18 ?"成年":"未成年");

        int sales = 2000;
        int commission = 100;
        //如果銷售大於1000，則傭金加10，否則傭金不變
        commission = sales > 1000 ? commission +10 : commission-10;
        System.out.println("傭金="+commission);
        //換成if else寫法
        if ( sales > 1000 ){
            commission = commission + 10;
        }else {
            commission = commission - 10;
        }
        System.out.println("傭金="+commission);

        

    }

}
