package io;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class ReadFile {

	public static void main(String[] args) {
		File newfile = new File("C://Java//io_1.txt");
		// FileInputStream fis = null; //使用新寫法之後不必再做finally語法關閉檔案

		try (FileInputStream fis = new FileInputStream(newfile); // JDK7之後的新語法，在這裡放了兩個等一下要做關閉的檔案
			BufferedInputStream bis = new BufferedInputStream(fis); //利用BufferInputStream一次載入比較多的資料
				) {
			// fis = new FileInputStream(newfile); //最原始的code

			// 測試 int read()，
			char b = (char) bis.read();
			System.out.println(b);
			b = (char) bis.read();
			System.out.println(b);

			// 一次read多個byte
			byte[] buffer = new byte[10]; // 先定義出欲讀取的byte數
			int readlength = bis.read(buffer); // read 出定義好的byte數

			System.out.println("讀取byte數= " + readlength); // 實際 read 出的byte數

			// 利用for迴圈將read的byte印出
			for (int i = 0; i < buffer.length; i++) {
				byte bu = buffer[i]; // 每一個被read的byte
				char ba = (char) bu; // 將原本的byte形式，強制轉換成char形式
				System.out.println(ba);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
		}
		// 使用新寫法之後不必再做finally語法關閉檔案
		/*
		 * finally { // 記得關檔案，避免resource leak try { if (fis != null) { fis.close(); //
		 * 有可能產生NoPointerException } }
		 */

	}

}
