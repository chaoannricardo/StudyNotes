package io.reader;

import java.io.*;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

public class WriteByOutputStreamWriter {
    public static void main(String[] args) {

        System.out.println(Charset.defaultCharset());
        try(FileOutputStream fis = new FileOutputStream("C:\\java\\char_1.txt");
            OutputStreamWriter osw = new OutputStreamWriter(fis, "MS950");
//            BufferedWriter bw = new BufferedWriter(osw)
        ){

            osw.write("中文測試2");
            
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
