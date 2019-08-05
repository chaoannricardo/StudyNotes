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
	 try(	
			 Socket socket = new Socket("127.0.0.1", 8080); 
			 InputStream is = socket.getInputStream();
			 OutputStream os = socket.getOutputStream();			
			 OutputStreamWriter osw = new OutputStreamWriter(os,StandardCharsets.UTF_8);
			 InputStreamReader isr = new InputStreamReader(is,StandardCharsets.UTF_8);
			 BufferedReader br = new BufferedReader(isr)
			 ){
		 
		 System.out.println("Client");
		 osw.write("中文Hello\r\n");
		 
		 System.out.println(br.readLine());
		 
		 
		 
		 
	 } catch (UnknownHostException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		
		
	}

}
