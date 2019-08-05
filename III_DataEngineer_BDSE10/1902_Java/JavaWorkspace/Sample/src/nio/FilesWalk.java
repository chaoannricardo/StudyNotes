package nio;

import java.io.IOException;
import java.nio.file.FileVisitOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class FilesWalk {

    public static void main(String[] args) throws IOException {
        Path path = Paths.get("/Users/vincent/Downloads");
        List<Path> matches = new ArrayList<>();

        long time = System.currentTimeMillis();
        try {
            Stream<Path> walk = Files.walk(path, Integer.MAX_VALUE, FileVisitOption.FOLLOW_LINKS);
            walk.filter(path1 -> path1.getFileName().toString().equals("index.html")).forEach(path1 -> matches.add(path1));
        } finally {
            time = System.currentTimeMillis() - time;
            System.out.println("time = " + time + "ms");
        }
        System.out.println(matches);

    }
}
