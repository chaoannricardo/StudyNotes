package equals;

public class StringEquals {
    public static void main(String[] args) {
        String a = "a";
        String b = new String("a");
        System.out.println(a == b);
        System.out.println(a.equals(b));
        int x = new Integer(1);
    }
}
