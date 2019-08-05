package encoding;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class SystemEncodingTest {

	public static void main(String[] args) throws IOException {
		
		//設定console encoding System.setOut(new PrintStream(System.out, true, "MS950"));
		//用利用terminal執行,java -Dfile.encoding=MS950  -cp . encoding.SystemEncodingTest
		
		System.out.println("JVM encoding = "+System.getProperty("file.encoding"));
		
		System.out.println("開始讀取MS950.txt");
		InputStream in = SystemEncodingTest.class.getResourceAsStream("MS950.txt");
		InputStreamReader isr  = new InputStreamReader(in);
		/*
		 * 指定檔案編碼格式為MS950
		   InputStreamReader isr  = new InputStreamReader(in,"MS950");
        */
 
		System.out.println("Reader預設編碼="+isr.getEncoding());
		BufferedReader br = new BufferedReader(isr);
		String line = null;
		System.out.println("--------------------------");
		while ( (line = br.readLine() )!= null){
			System.out.println(line);			
		}
		System.out.println("--------------------------");
		System.out.println("列印MS950.txt結束");
		isr.close();
		in.close();
		
		System.out.println();
		System.out.println();
		System.out.println();
		
		System.out.println("開始讀取UTF8File.txt");
		in = SystemEncodingTest.class.getResourceAsStream("UTF8File.txt");
		isr  = new InputStreamReader(in);
		/*
		  //指定檔案編碼格式為UTF8
		   isr  = new InputStreamReader(in,"UTF8");
        */
		System.out.println("Reader預設編碼="+isr.getEncoding());
		br = new BufferedReader(isr);
		System.out.println("--------------------------");
		while ( (line = br.readLine() )!= null){
			System.out.println(line);			
		}
		System.out.println("--------------------------");
		System.out.println("列印UTF8File.txt結束");
	}

}
