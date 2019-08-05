package io;


import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class WriteFileOutputStream {
    public static void main(String[] args) {

        try (FileOutputStream fos = new FileOutputStream("/Users/vincent/Desktop/io_2.txt")) {
            String content = "1234567890";
            byte buf[] = content.getBytes();
            
            //一次寫一個byte
            for (int i = 0; i < buf.length; i++) {
                fos.write(buf[i]);
            }

            //一次寫多個byte
            fos.write(buf);

            //step2,把bos搬到try中
            BufferedOutputStream bos = new BufferedOutputStream(fos);
            bos.write(buf);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
