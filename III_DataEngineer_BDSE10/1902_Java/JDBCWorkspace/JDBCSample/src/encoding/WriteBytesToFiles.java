package encoding;

import java.io.FileOutputStream;
import java.io.IOException;

public class WriteBytesToFiles {

    public static void main(String[] args) throws IOException {

        byte[] bytes = new byte[]{-92,-92};
        FileOutputStream fos  = new FileOutputStream("c:/files_write/encoding.txt");
        fos.write(bytes);
        fos.close();
        System.out.println("檔案寫入完成");
    }

}
