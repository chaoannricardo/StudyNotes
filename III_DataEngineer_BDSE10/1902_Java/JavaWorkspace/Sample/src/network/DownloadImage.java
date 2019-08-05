package network;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;

public class DownloadImage {
    public static void main(String[] args) throws IOException {
        
        URL url = new URL("https://attach.mobile01.com/attach/201804/mobile01-f3d4575b4e5c7b1482445bb26617b5ac.jpg");
        System.out.println("url.getProtocol() = " + url.getProtocol());
        System.out.println("url.getHost() = " + url.getHost());
        System.out.println("url.getPort() = " + url.getPort());
        System.out.println("url.getFile() = " + url.getFile());
        URLConnection urlConnection = url.openConnection();
        System.out.println("urlConnection.getContentType() = " + urlConnection.getContentType());
        File file = new File("/Users/vincent/car.jpg");
        try(InputStream inputStream = urlConnection.getInputStream();
            ReadableByteChannel readChannel = Channels.newChannel(inputStream);
            //寫至檔案，利用FileOutputStream再轉成Channel
            FileOutputStream fos = new FileOutputStream(file);
            WritableByteChannel writableByteChannel = Channels.newChannel(fos)
        ){
            ByteBuffer buffer = ByteBuffer.allocate(1000);
            while ( readChannel.read(buffer) != -1 ){
                buffer.flip();
                writableByteChannel.write(buffer);
                buffer.clear();
            }
        }
    }
}
