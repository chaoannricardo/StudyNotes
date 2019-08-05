package network;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;

public class EchoServer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try (ServerSocket serversocket = new ServerSocket(8080);
				Socket socket = serversocket.accept(); // 在此等候對方的連線，沒有連線程式不會執行
				InputStream inputStream = socket.getInputStream();
				OutputStream outputStream = socket.getOutputStream();
				ReadableByteChannel newChannel = Channels.newChannel(inputStream);
				WritableByteChannel newChannel2 = Channels.newChannel(outputStream);) {

			ByteBuffer bufferstream = ByteBuffer.allocate(10);
			// 建立ByteBuffer，所使用指令為ByteBuffer
			while (newChannel.read(bufferstream) != -1) { // -1是代表讀取完成
				bufferstream.flip();
				newChannel2.write(bufferstream);
				bufferstream.clear();
				// 傳輸BufferStream，其中需注意必須要有Buffer.flip()以協助記憶體正確讀入、輸出

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
