package network;

import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;

public class Client {
    public static void main(String[] args)  {
        try (Socket socket = new Socket("127.0.0.1", 8080);
             InputStream inputStream = socket.getInputStream();
             OutputStream outputStream = socket.getOutputStream();
        ) {


            //送Hello World出去
            outputStream.write("Hello World".getBytes(StandardCharsets.UTF_8)); //文字轉byte[]用getBytes()

            byte[] buffer = new byte[1000];
            int length;
            while ((length = inputStream.read(buffer)) != -1) {
                System.out.println(new String(buffer, 0, length, StandardCharsets.UTF_8));//byte[]轉文字用建構方法
            }

        } catch (UnknownHostException e) {
            System.out.println("找不到主機");
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
