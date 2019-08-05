package nio;

import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;

public class DirStream {
    public static void main(String[] args) throws IOException {
        Path path = Paths.get("/Users/vincent/Documents");
        List<Path> matches = new ArrayList<>();

        long time = System.currentTimeMillis();
        try {
            Files.walkFileTree(path, new FileVisitor<Path>() {
                @Override
                public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                    //System.out.println("visit "+dir);
                    if (dir.getFileName().startsWith(".")) {
                        return FileVisitResult.SKIP_SUBTREE;
                    }
                    return FileVisitResult.CONTINUE;
                }

                @Override
                public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                    if ( file.getFileName().toString().equals("index.html")){
                        matches.add(file);
                    }
                    return FileVisitResult.CONTINUE;
                }

                @Override
                public FileVisitResult visitFileFailed(Path file, IOException exc) throws IOException {
                    return FileVisitResult.CONTINUE;
                }

                @Override
                public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
                    return FileVisitResult.CONTINUE;
                }
            });
        }finally{
            time = System.currentTimeMillis() - time;
            System.out.println("time = " + time + "ms");
        }

        System.out.println(matches);

    }
}
