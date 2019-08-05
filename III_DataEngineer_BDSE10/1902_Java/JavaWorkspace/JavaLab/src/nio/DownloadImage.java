package nio;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.SeekableByteChannel;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class DownloadImage {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			URL url = new URL("https://graph.facebook.com/AppStore/picture?type=large");

			Path filepath = Paths.get("C:\\java\\nio_jpg.jpg"); // 設定最後檔案輸出的位置

			try (InputStream is = url.openStream();
				ReadableByteChannel inChannel = Channels.newChannel(is);
				// 建立一個Channel來傳輸(輸入)，所使用指令包括：Channels.newChannel()
				SeekableByteChannel OutChannel = Files.newByteChannel(filepath, StandardOpenOption.WRITE,
							StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
			   // 建立一個Channel來傳輸(輸出)，所使用指令包括：Files.newByteChannel, StandardOpenOption(可以做串接)
			) {
				ByteBuffer bufferstream = ByteBuffer.allocate(10);
				// 建立ByteBuffer，所使用指令為ByteBuffer
				while (inChannel.read(bufferstream) != -1) { //-1是代表讀取完成
					bufferstream.flip();
					OutChannel.write(bufferstream);
					bufferstream.clear();
					// 傳輸BufferStream，其中需注意必須要有Buffer.flip()以協助記憶體正確讀入、輸出
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
