package io;

import java.io.*;

public class PrintStreamToFile {
    public static void main(String[] args) {

        try(PrintStream ps = new PrintStream("/Users/vincent/Desktop/io_printstream.txt");
        ){
            ps.println("print to file 中文字也不會有問題");
            System.setOut(ps);
            System.out.println("System.out.println 中文字也不會有問題");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
