package io;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;

public class DownloadImage {
    public static void main(String[] args) throws MalformedURLException {

        //URL可以取得網站的內容，利用openStream可以取得InputStream
        URL url = new URL("https://graph.facebook.com/AppStore/picture?type=large");
        File file = new File("/Users/vincent/Desktop/a.jpg");
        try (InputStream inputStream = url.openStream();
             BufferedInputStream bis = new BufferedInputStream(inputStream);
             FileOutputStream fos = new FileOutputStream(file);
             BufferedOutputStream bos = new BufferedOutputStream(fos)
        ) {

           byte[] buffer = new byte[1024];
           int length;
           while ( (length = bis.read(buffer)) != -1 ){
               bos.write(buffer,0,length);
           }
           
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
