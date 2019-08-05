package io;

import java.io.File;
import java.util.Date;

public class TestIO {

	public static void main(String[] args) {
		
		//測試getName()
		File folder = new File("C:\\Java");
		//System.out.println("folder's name is " + folder.getName());
		
		//測試String[] list()
		String[] filelist = folder.list();
		for (String list : filelist) {
			//System.out.println(list);
		}
		
		//測試.lastModified()指令，注意回傳值型態為long
		long folderlastmodified = folder.lastModified();
		Date datefolderlastmodified = new Date(folderlastmodified);
		System.out.println(datefolderlastmodified);

	}

}
