package io;

import java.io.ByteArrayInputStream;
import java.io.IOException;

/**
 * 介紹使用  ByteArrayInputStream
 * ByteArrayInputStream 利用byte[]當做來源
 * reset會回到最開頭
 */
public class ByteArrayInputStreamTest {
    public static void main(String[] args) {
        String content = "1234567890";
        byte buf[] = content.getBytes();
        try(ByteArrayInputStream bis = new ByteArrayInputStream(buf)){

            char c = (char) bis.read();
            System.out.println(c);

            //reset會回到stream的最開頭，等於重讀
            bis.reset();
            c = (char) bis.read();
            System.out.println(c);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
