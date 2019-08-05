package network;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.*;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;
import java.nio.charset.StandardCharsets;

public class EchoServer {
    public static void main(String[] args) {


        try(ServerSocket ssc = new ServerSocket(8080);
            Socket socket = ssc.accept();  //在此等候對方的連線，沒有連線程式不會執行
            InputStream inputStream = socket.getInputStream();
            OutputStream outputStream = socket.getOutputStream();
            ReadableByteChannel inChannel = Channels.newChannel(inputStream);
            WritableByteChannel outChannel = Channels.newChannel(outputStream);
        ) {

            InetSocketAddress remoteSocketAddress = (InetSocketAddress) socket.getRemoteSocketAddress();
            System.out.println("收到來自" + remoteSocketAddress.getHostName());

            //練習用nio作法
            ByteBuffer buffer = ByteBuffer.allocate(80);
            while (inChannel.read(buffer) != 0) {
                buffer.flip();
                /*以下範例可以列印出使用者輸入的字
                byte[] bufferBytes = new byte[buffer.limit()];
                buffer.get(bufferBytes);
                System.out.println(new String(bufferBytes, StandardCharsets.UTF_8));
                可利用rewind復原position游標
                buffer.rewind();
                */
                outChannel.write(buffer);
                buffer.clear();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
