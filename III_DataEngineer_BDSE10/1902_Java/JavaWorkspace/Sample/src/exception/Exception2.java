package exception;

public class Exception2 {
    public static void main(String[] args) {
        //2.第8行，分母0改成2，不會產生Exception，但11行會存取到陣列界線外的元素而發生錯誤，ArrayIndexOutOfBoundsException，會印出2,4,5
        try {
            int a = 1;
            int b = a / 2;
            System.out.println("b = " + b);
            int c[] = {1, 2, 3};
            int d = c[2];
            System.out.println("d="+d);
        }catch (ArithmeticException ex) {
            System.out.println("1");
        } catch (ArrayIndexOutOfBoundsException ex) {
            System.out.println("2");
        } catch (Exception ex) {
            System.out.println("3");
        } finally {
            System.out.println("4");
        }
        System.out.println("5");
    }
}
