package network;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class EchoServerWithScaner {
    public static void main(String[] args) throws IOException {

        ServerSocket ssc = new ServerSocket(8080);
        Socket socket = ssc.accept();
        InetSocketAddress remoteSocketAddress = (InetSocketAddress) socket.getRemoteSocketAddress();
        System.out.println("收到來自" + remoteSocketAddress.getHostName());
        InputStream inputStream = socket.getInputStream();
        OutputStream outputStream = socket.getOutputStream();
        //練習用nio作法
        ReadableByteChannel inChannel = Channels.newChannel(inputStream);
        WritableByteChannel outChannel = Channels.newChannel(outputStream);
        ByteBuffer buffer = ByteBuffer.allocate(100);
        
        //利用Scaner可以取得Console中的輸入
        Scanner scanner = new Scanner(System.in);
        while ( inChannel.read(buffer) != 0) {
            buffer.flip();
            byte[] bytes = buffer.array();
            String message = new String(bytes, 0, buffer.limit(), StandardCharsets.UTF_8);
            System.out.print(message);
            //讀入要回傳的文字
            System.out.println("請輸入回傳文字:");
            String response = scanner.nextLine();
            response = response + "\r\n";
            //將使用者輸入轉為bytebuffer，先清除buffer
            buffer.clear();
            //buffer填入使用者輸入的資料
            buffer.put(response.getBytes(StandardCharsets.UTF_8));
            //buffer flip後才能再度被讀取或寫入
            buffer.flip();
            outChannel.write(buffer);
            buffer.clear();
        }
    }

}
