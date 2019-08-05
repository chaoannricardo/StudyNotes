package nio;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class FileReadCharacter {
    public static void main(String[] args) {

        try{
            Path path = Paths.get("/Users/vincent/Desktop/char_UTF8.txt");
            List<String> lines = Files.readAllLines(path, Charset.forName("MS950"));
            for (int i = 0; i < lines.size(); i++) {
                String s = lines.get(i);
                System.out.println("s = " + s);
            }
            System.out.println("FileReadCharacter Finished");
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(3333*45);
    }
}
