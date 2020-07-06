package nio;

import java.nio.ByteBuffer;

public class BufferOperation {
    public static void main(String[] args) {
        ByteBuffer buffer = ByteBuffer.allocate(10);
        printBufferInfo(buffer,"allocate");

        byte a[] = new byte[6];
        buffer.put(a);
        printBufferInfo(buffer,"put");

        buffer.flip();
        printBufferInfo(buffer,"flip");

        buffer.clear();
        printBufferInfo(buffer,"clear");

        buffer.rewind();
        printBufferInfo(buffer,"rewind");

    }

    private static void printBufferInfo(ByteBuffer buffer,String operation) {
        System.out.println("operation = " + operation);
        System.out.println("position = " + buffer.position());
        System.out.println("limit = " + buffer.limit());
    }

}
