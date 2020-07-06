package nio;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

/**
 * 本範例為寫入FileChannel
 */
public class FileWrite {
    public static void main(String[] args) {

        Path path = Paths.get("/Users/vincent/Desktop/io_2.txt");

        try(FileChannel channel = (FileChannel) Files.newByteChannel(path,StandardOpenOption.WRITE,StandardOpenOption.CREATE);
        ) {

            ByteBuffer buffer = ByteBuffer.allocate(10);
            String content = "abcdefghij";
            byte[] bytes = content.getBytes();
            buffer.put(bytes);
            buffer.flip();
            channel.write(buffer);
            System.out.println("FileWrite Finished");


        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
