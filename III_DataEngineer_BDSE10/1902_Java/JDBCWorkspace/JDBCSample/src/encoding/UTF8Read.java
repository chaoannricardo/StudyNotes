package encoding;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
//from http://openhome.cc/Gossip/Encoding/UTF8.html
public class UTF8Read {

    public static void main(String[] args) throws IOException {

        FileInputStream in = new FileInputStream("c:/files_read/encoding.txt");
        byte[] first = new byte[1];
        byte[] remain = new byte[3];
        while(in.read(first) != -1) {
            if(first[0] >= 0) { // ASCII 字元  ,因為第一個位元一定是0開頭，為正值
                System.out.print(new String(first, "UTF-8"));
                System.out.printf("  %h%n", first[0] & 0x00FF);
            }
            else if(first[0] >= -16) {  // 四個位元組字元，11110，－16
                in.read(remain, 0, 3);
                System.out.print(
                        new String(new byte[] {
                                first[0], remain[0],
                                remain[1], remain[2]}
                                , "UTF-8"));
                System.out.printf(" %h %h %h %h%n", first[0] & 0x00FF,
                        remain[0] & 0x00FF, remain[1] & 0x00FF, remain[2] & 0x00FF);
            }
            else if(first[0] >= -32) { // 三個位元組字元，第一個位元組由1110開始, 扣除第一個bit 負值，～反轉後為0001，為－32
                in.read(remain, 0, 2);
                System.out.print(
                        new String(new byte[] {
                                first[0], remain[0], remain[1]}
                                , "UTF-8"));
                System.out.printf(" %h %h %h%n", first[0] & 0x00FF,
                        remain[0] & 0x00FF, remain[1] & 0x00FF);
            }
            else if(first[0] >= -64) { //兩個位元組字元，第一個位元組由110開始, 扣除第一個bit 負值，～反轉後為00100000，－64
                in.read(remain, 0, 1);
                System.out.print(
                        new String(new byte[] {first[0], remain[0]}, "UTF-8"));
                System.out.printf(" %h %h%n", first[0] & 0x00FF,
                        remain[0] & 0x00FF);
            }
        }
        in.close();
    }

}
