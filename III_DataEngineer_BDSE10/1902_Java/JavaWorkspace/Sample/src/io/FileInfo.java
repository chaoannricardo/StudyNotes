package io;

import java.io.File;
import java.util.Date;

public class FileInfo {
    public static void main(String[] args) {

        String fileName = "/Users/vincent/Desktop/io_1.txt";
        File file = new File(fileName);
        System.out.println(file.getName());

        //取得修改時間
        long modified = file.lastModified();
        Date date = new Date(modified);
        System.out.println(date);
        System.out.println(file.canRead());
        System.out.println(file.canWrite());

        String dirName = "/Users/vincent/Desktop";
        File dir = new File(dirName);
        // listFiles範例
        if ( dir.isDirectory() ){   //是否為目錄
            File[] files = dir.listFiles();   //取得目錄下的所有檔案以子目錄
            for (int i = 0; i < files.length; i++) {
                File f = files[i];
                if ( f.isDirectory()){
                    System.out.println(f.getName()+"是目錄");
                }else{
                    System.out.println(f.getName()+"是檔案");
                }
            }
        }
        

    }
}
