package io.reader;

import java.io.*;
import java.nio.charset.Charset;

public class ReadByFileReader {
	public static void main(String[] args) throws IOException {

		System.out.println("目前JVM編碼＝" + Charset.defaultCharset());

		File file = new File("C:\\java\\char_MS950.txt");
		try (
				// 改成InputSteamReader
				FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "MS950");
				BufferedReader br = new BufferedReader(isr))
		// FileReader fr = new FileReader(file))
		{

			int c;
			{
				while ((c = br.read()) != -1) {
					System.out.println((char) c);
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
