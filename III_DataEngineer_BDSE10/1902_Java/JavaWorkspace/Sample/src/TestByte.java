import java.util.Scanner;

/**
 * Created by vincent on 2017/5/18.
 */
public class TestByte {
    public static void main(String[] args) {
        byte value;

        Scanner console = new Scanner(System.in);
        boolean loop = true;
        while (loop) {
            System.out.println("please input byte value: ");
            value = Byte.parseByte(console.nextLine());
            String s1 = String.format("%8s", Integer.toBinaryString(value & 0xFF)).replace(' ', '0');
            System.out.println("byte: "+s1);
        }

    }
}
