package encoding;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class PrintEncoding {


    public static void main(String[] args) throws UnsupportedEncodingException {

        String testWord = "中";

        List<String> encodings = new ArrayList<String>();
        encodings.add("MS950");
        encodings.add("UTF8");

        for (String encoding : encodings){
            byte[] bytes  =  testWord.getBytes(encoding);
            System.out.print(testWord + "(" + encoding + "):");
            for (byte eachByte : bytes){
                System.out.print(eachByte);
            }
            System.out.print("\n16進位");
            for (byte eachByte : bytes){
                System.out.printf(" %h ",eachByte & 0x00FF);
            }
            System.out.println();
        }
    }
}
