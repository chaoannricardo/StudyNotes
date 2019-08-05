import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class IOTest {
	public static void main(String[] args) {
		// http://iosnetworkdemo.appspot.com/json.jsp?msg=helloWorld
		// 此將此網址回傳的結果示在Console中

		try {
			URL url = new URL("http://iosnetworkdemo.appspot.com/json.jsp?msg=helloWorld");

			try (InputStream is = url.openStream();
					BufferedInputStream bis = new BufferedInputStream(is);
					InputStreamReader isr = new InputStreamReader(bis, "UTF8");
					BufferedReader br = new BufferedReader(isr)
					) {

				while ((br.read()) != -1) { // -1時代表檔案讀取完成了
					System.out.println(br.readLine());
					
				}
				

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (MalformedURLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}
}