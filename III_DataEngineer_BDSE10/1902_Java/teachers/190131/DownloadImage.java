package nio;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.SeekableByteChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class DownloadImage {

	public static void main(String[] args) {

		try {
			URL url = new URL("https://graph.facebook.com/AppStore/picture?type=large");

			Path filePath = Paths.get("c:/Java/b.jpg");
			try (InputStream is = url.openStream();
					ReadableByteChannel inChannel = Channels.newChannel(is);
					SeekableByteChannel outChannel = Files.newByteChannel(filePath, StandardOpenOption.WRITE,
							StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
			) {

				
				ByteBuffer buffer = ByteBuffer.allocate(10);
				
				while( inChannel.read(buffer) != -1 ) {//-1表示讀到底了
					buffer.flip();
					outChannel.write(buffer);
					buffer.clear();
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

	}

}
