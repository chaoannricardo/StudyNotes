package network;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;

public class Client {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try (Socket socket = new Socket("127.0.0.1", 8080);
				InputStream inputStream = socket.getInputStream();
				OutputStream outputStream = socket.getOutputStream();
				OutputStreamWriter osw = new OutputStreamWriter(outputStream, StandardCharsets.UTF_8);
				InputStreamReader isr = new InputStreamReader(inputStream, StandardCharsets.UTF_8);
				BufferedReader bReader = new BufferedReader(isr);) {
			
			osw.write("Hello 你好嗎？ \r\n" );
			osw.flush(); //送出資料
			System.out.println(bReader.readLine());//收傳輸過來的資料

		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
