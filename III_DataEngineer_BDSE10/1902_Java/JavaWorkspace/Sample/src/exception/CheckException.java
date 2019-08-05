package exception;

import java.io.File;
import java.io.FileInputStream;

public class CheckException {
    public static void main(String[] args) {
        
        File file = new File("c:\\aaa.txt");
        //FileInputStream fis = new FileInputStream(file);
        //Checked Exception必明確處理，利用try catch或者throws
        System.out.println("Finish");
    }
}
