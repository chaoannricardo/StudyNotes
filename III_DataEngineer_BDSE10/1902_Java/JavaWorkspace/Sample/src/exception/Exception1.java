package exception;

public class Exception1 {
    public static void main(String[] args) {
        //1.測試時，會印出１，４，５
        //try {
            int a = 1;
            int b = a / 0;
            System.out.println("b = " + b);
            System.out.println("注意：發生例外以下的程式，不會被執行");
        //}catch (ArithmeticException ex) {
        //    System.out.println("1");
        //}finally {
        //    System.out.println("4");
        //}
        System.out.println("5");
    }
}
