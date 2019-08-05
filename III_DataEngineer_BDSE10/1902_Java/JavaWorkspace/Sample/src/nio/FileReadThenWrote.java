package nio;

import java.io.IOException;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class FileReadThenWrote {
    public static void main(String[] args) {

        Path path1 = Paths.get("/Users/vincent/Desktop/io_1.txt");
        Path path2 = Paths.get("/Users/vincent/Desktop/io_2.txt");

        try(
                FileChannel readChannel = (FileChannel) Files.newByteChannel(path1,StandardOpenOption.READ);
                FileChannel writeChannel = (FileChannel) Files.newByteChannel(path2,StandardOpenOption.WRITE,StandardOpenOption.CREATE,StandardOpenOption.TRUNCATE_EXISTING)
        ) {

            ByteBuffer buffer = ByteBuffer.allocate(10);
            //讀取Channel到buffer中，如果回傳為-1表示讀完
            while ( readChannel.read(buffer) != -1 ){
                buffer.flip();
                /*for( int i= 0 ; i < read ; i++){
                    System.out.println((char) buffer.get());
                } */
                //step 2 ,準備writeChannel，註解sout迴圈
                writeChannel.write(buffer);
                buffer.clear();//沒有清除，buffer是滿的，讀不進去，read會回傳0，無法出迴圈
            }
            System.out.println("Finished");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
