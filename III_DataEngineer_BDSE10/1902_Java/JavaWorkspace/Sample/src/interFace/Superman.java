package interFace;

public class Superman extends People implements Lawyer {

    @Override
    public void sue() {
        System.out.println("訴訟");
    }

    public static void main(String[] args) {
        Superman a = new Superman();
        Lawyer lawyer = a;
        lawyer.sue();
    }

}
