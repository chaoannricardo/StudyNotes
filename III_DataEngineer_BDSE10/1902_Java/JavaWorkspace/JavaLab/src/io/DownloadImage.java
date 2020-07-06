package io;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class DownloadImage {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			URL url = new URL("https://graph.facebook.com/AppStore/picture?type=large");

			try (InputStream is = url.openStream();
					BufferedInputStream bis = new BufferedInputStream(is);
					FileOutputStream fos = new FileOutputStream("C://Java//DownloadImage.jpg");
					BufferedOutputStream bos = new BufferedOutputStream(fos);) {

				byte[] bytes = new byte[1024];
				// int length = bis.read(bytes);
				int length;
				while ((length = bis.read(bytes)) != -1) { //-1時代表檔案讀取完成了
					System.out.println(length);
					bos.write(bytes, 0, length);
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (MalformedURLException e) { // 也可以直接往外丟，會寫錯這的也太low了
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
