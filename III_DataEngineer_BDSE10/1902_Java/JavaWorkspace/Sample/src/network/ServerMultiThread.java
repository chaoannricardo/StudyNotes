package network;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;

public class ServerMultiThread {
    public static void main(String[] args) throws IOException {

        InetAddress localHost = InetAddress.getLocalHost();
        System.out.println("本機電腦名稱："+localHost.getHostName());   // get computer name
        System.out.println("本機電腦IP："+localHost.getHostAddress()); //get ip

        ServerSocket ssc = new ServerSocket(8080);

        while ( true ) {
            Socket socket = ssc.accept();
            new Thread(() -> {
                try(InputStream inputStream = socket.getInputStream();
                OutputStream outputStream = socket.getOutputStream();){
                    //練習用nio作法
                    ReadableByteChannel inChannel = Channels.newChannel(inputStream);
                    WritableByteChannel outChannel = Channels.newChannel(outputStream);
                    WritableByteChannel systemOutChannel = Channels.newChannel(System.out);
                    ByteBuffer buffer = ByteBuffer.allocate(80);
                    while ( inChannel.read(buffer) != 0) {
                        buffer.flip();
                        System.out.println(Thread.currentThread()+":");
                        systemOutChannel.write(buffer);
                        buffer.flip();
                        outChannel.write(buffer);
                        buffer.clear();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }).start();
        }

    }
}
