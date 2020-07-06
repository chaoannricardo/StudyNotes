package exception;

public class Exception3 {
    public static void main(String[] args) {

        try {
            calculate();
            System.out.println(5);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(6);
        }
        System.out.println(7);

    }


    public static void calculate() throws Exception{

        try{
            System.out.println("1");
            if ( true ) {
                throw new Exception();
            }
        }catch (Exception ex){
            System.out.println(3);
            throw ex;
        }
        System.out.println(4);
    }
}
