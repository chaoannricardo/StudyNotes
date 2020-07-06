package exception;

import java.io.File;
import java.io.FileNotFoundException;

public class Throws {
    public static void main(String[] args) throws FileNotFoundException {

        //如果方法不想處理例外，可以利用throws往外丟
        checkFile();

    }

    /**
     * 因為方法中throw Exception，而Exception不為RuntimeException或者Error的子類別
     * 必須用throws宣告方法會丟出的Exception
     */
    public static void checkFile() throws FileNotFoundException {
        File file = new File("c:\\aaa.txt");
        if ( !file.exists() ){
            throw new FileNotFoundException("找不到檔案");
        }
    }
}
