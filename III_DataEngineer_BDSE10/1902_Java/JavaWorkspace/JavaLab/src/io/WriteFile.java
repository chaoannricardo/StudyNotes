package io;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;

public class WriteFile {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try (FileOutputStream fos = new FileOutputStream("C://Java//io_2.txt");
				BufferedOutputStream bos = new BufferedOutputStream(fos);) {

			//測試PrintStream .println
			PrintStream ps = new PrintStream("C://Java//printouput.txt");
			System.setOut(ps);
			System.out.println("123456789");
			System.out.println("123456789");
			System.out.println("123456789");

			//測試FileOutputStream, BufferedOutputStream
			String content = "中文試打噠噠噠噠噠";
			byte[] bytes = content.getBytes();
			bos.write(bytes);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
