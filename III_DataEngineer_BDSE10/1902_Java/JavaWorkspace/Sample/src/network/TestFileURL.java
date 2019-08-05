package network;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

public class TestFileURL {
    public static void main(String[] args) throws IOException {
        //可以指定local端的檔案，利用file:// 來指定路徑，例如file://c:/aaa.txt
        URL url = new URL("file:///Users/vincent/UTF8.txt");
        InputStream inputStream = url.openConnection().getInputStream();
        InputStreamReader is = new InputStreamReader(inputStream, StandardCharsets.UTF_8);
        BufferedReader reader = new BufferedReader(is);
        List<String> lines = reader.lines().collect(Collectors.toList());
        System.out.println(lines);
    }
}
