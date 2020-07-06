package nio;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.channels.Channel;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.SeekableByteChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class DownloadImage {
    public static void main(String[] args) throws MalformedURLException {

        //URL可以取得網站的內容，利用openStream可以取得InputStream
        URL url = new URL("https://graph.facebook.com/AppStore/picture?type=large");
        Path filePath = Paths.get("/Users/vincent/Desktop/a.jpg");

        try (InputStream inputStream = url.openStream();
             ReadableByteChannel inChannel = Channels.newChannel(inputStream);
             SeekableByteChannel outChannel= Files.newByteChannel(filePath,StandardOpenOption.WRITE,StandardOpenOption.CREATE,StandardOpenOption.TRUNCATE_EXISTING)
        ) {

            ByteBuffer buffer = ByteBuffer.allocate(10);
            //讀取Channel到buffer中，如果回傳為-1表示讀完
            while ( inChannel.read(buffer) != -1 ) {
                buffer.flip();
                outChannel.write(buffer);
                buffer.clear();
            }
            

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
