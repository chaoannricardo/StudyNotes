package Exception;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import equals.Employee;

public class CheckException {

	public static void main(String[] args) throws FileNotFoundException  {

		File file = new File("C:\\aaa.txt");
		
		/*try {
			checkFile();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e; //如果再往外丟的話，則會需要再寫指令處理exception
		}*/
		//兩種處理方式：1.利用trycatch 2.利用throw指令
		
		
		//FileInputStream fis = new FileInputStream(file);
		// 以上是原本的程式碼，但因為有Checked Exception，所以編譯器會要求一定要處理
		// 兩種處理方式：1.利用trycatch 2.利用throw指令
		// 通常不會無止盡的往外丟，所以一定會在特定時刻做try-catch
		// IOException是比FileNotFoundException更高一階的Exception

		System.out.println("finish"); // 如果有Exception(不管有沒有throw，就無法執行到此程式碼)
		
		
		//NullPointerException
		CheckException employee = null;;
		System.out.println("employee name =" + employee);
		

	}

	//throw方法
	public static void checkFile() throws FileNotFoundException {
		File file = new File("C:\\aaa.txt");
		if (!file.exists()) {
			FileNotFoundException error = new FileNotFoundException("找不到檔案");
			throw error;
		} // 因為throw出來的exception一定要被處理，所以在外面要額外使用code
		//throw new FileNotFoundException("找不到檔案");
		//以上是慣例只寫一行程式碼的情況
	}

}
