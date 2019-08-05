package io;

import java.io.*;

public class ReadFileInputStream {

    public static void main(String[] args) {
        
        File file = new File("/Users/vincent/Desktop/io_1.txt");
        /*
        //copy io_1.txt到C:\
        FileInputStream fs = null;
        try {
            fs = new FileInputStream(file);
            char c = (char) fs.read();
            System.out.println("第一個byte為："+c);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                if ( fs != null) {
                    fs.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } */


        //改用try-with-resource
        try (FileInputStream fis = new FileInputStream(file);
             //BufferedInputStream bis = new BufferedInputStream(fis);
        ){
            //step 1
            //單一read
            System.out.println("檔案開始多少可以讀:"+fis.available()+"bytes");
            char c = (char) fis.read();
            System.out.println("第一個byte為："+c);

            //使用byte[]再讀５個byte出來
            byte[] buffer = new byte[5];
            int length = fis.read(buffer);//read會回傳讀了多少進去buffer
            System.out.println("利用buffer讀出長度:"+length);
            for ( int i=0 ; i < length ; i++){
                byte b = buffer[i];
                char c1 = (char) b;
                System.out.println(c1);
            }
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        

    }
}
