package nio;

import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

public class FileInfo {
    public static void main(String[] args) {

        Path path = Paths.get("/Users/vincent/Desktop/io_1.txt");
        System.out.println(path.getFileName().toString());

        try {
            BasicFileAttributes attributes = Files.readAttributes(path, BasicFileAttributes.class);
            System.out.println(attributes.lastModifiedTime());
            System.out.println(attributes.isDirectory());
            System.out.println(Files.isReadable(path));
            System.out.println(Files.isWritable(path));
        } catch (IOException e) {
            e.printStackTrace();
        }

        Path dirPath = Paths.get("/Users/vincent/Desktop");
        try (DirectoryStream<Path> files  = Files.newDirectoryStream(dirPath) ){

            for (Path path1 : files) {
                BasicFileAttributes attributes = Files.readAttributes(path1, BasicFileAttributes.class);
                if (attributes.isDirectory()) {
                    System.out.println(path1.getFileName().toString()+"是目錄");
                }else{
                    System.out.println(path1.getFileName().toString()+"是檔案");
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
