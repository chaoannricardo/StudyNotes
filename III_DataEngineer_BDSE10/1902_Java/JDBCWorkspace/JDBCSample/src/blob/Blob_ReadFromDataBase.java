package blob;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.ReadableByteChannel;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Blob_ReadFromDataBase {

	public static void main(String[] args) {

		try (Connection conn = DriverManager.getConnection(
				"jdbc:sqlserver://localhost:1433;databaseName=JDBCDB", "scott", "tiger");
			 Statement stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery("select * from files");
		) {
			while (rs.next()) {
				Blob fileData = rs.getBlob("data");
				String filename = rs.getString("filename");
				//InputStream is = fileData.getBinaryStream();
				InputStream is = rs.getBinaryStream("data");
				File file = new File("c:/files_write/"+filename);

				//io
				try (FileOutputStream fos = new FileOutputStream(file) ) {
					byte[] bytes = new byte[1024];
					int length;
					while ((length = is.read(bytes)) != -1) {
						fos.write(bytes, 0, length);
					}
				}catch(IOException ie){
					ie.printStackTrace();
					System.out.println("error while writing file "+file);
				}

                /*//nio
				try (FileOutputStream fos = new FileOutputStream(file) ) {
					FileChannel outChannel = fos.getChannel();
					ReadableByteChannel readableChannel = Channels.newChannel(is);
					ByteBuffer buffer = ByteBuffer.allocateDirect(1024);
					while (readableChannel.read(buffer) != -1) {
						buffer.flip();
						outChannel.write(buffer);
						buffer.clear();
					}
				}catch(IOException ioe ){
					ioe.printStackTrace();
					System.out.println("error while writing file");
				}*/
				System.out.println("寫出檔案＝"+file.getPath());

			}
            System.out.println(Blob_ReadFromDataBase.class.getName()+ " 執行結束");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
