package exception;

import java.io.File;
import java.io.FileNotFoundException;

public class Throw {
    public static void main(String[] args) {




    }

    public static void checkFile() throws FileNotFoundException{
        File file = new File("c:\\aaa.txt");
        if ( !file.exists() ){
            //step1. throw new FileNotFoundException("找不到檔案");
            //step2.並在方法上加上throws
        }
    }
}
