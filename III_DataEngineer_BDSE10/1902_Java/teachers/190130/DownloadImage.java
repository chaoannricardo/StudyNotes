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
		
		try {
			URL url = new URL("https://graph.facebook.com/AppStore/picture?type=large");
			
			try ( InputStream is = url.openStream();
					BufferedInputStream bis = new BufferedInputStream(is);
					 FileOutputStream fos = new FileOutputStream("c:/Java/a.jpg");
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					){
				
				
				byte[] buffer = new byte[1024];//512
				
				int length = bis.read(buffer);//512, 0-512 a.jpg,其它0
				
				bos.write(buffer, 0, length);//從0位置開始，寫length長度到bos
				
				
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		
		
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
