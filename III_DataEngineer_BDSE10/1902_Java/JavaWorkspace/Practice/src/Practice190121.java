
public class Practice190121 {

	double Revenue;
	String CompanyName;

	public static void main(String[] args) {

		// 類別Class及物件
		Practice190121 PRC = new Practice190121();
		PRC.Revenue = 10000000;
		PRC.CompanyName = "瀚亞投資";

		// 實體變數
		Practice190121 APRC = new Practice190121();
		APRC.CompanyName = "Morgan Stanley";
		Practice190121 BPRC = new Practice190121();
		BPRC.CompanyName = "Morgan Stanley";

		// 記憶體位置
		System.out.println("//記憶體位置");
		System.out.println(APRC == BPRC);

		// 記憶體位置回收
		System.out.println("//記憶體位置回收");
		BPRC = APRC;
		System.out.println(APRC == BPRC);

		// null
		System.out.println("//null");
		APRC = null;
		BPRC = null;
		System.out.println(APRC == BPRC);

		// Garbage Collection
		System.gc();

		// String 比較：Heap中的Pool驗證
		System.out.println("//String 比較：Heap中的Pool驗證 ");
		String Ricardo = "Ricardo";
		String Ricardo2 = "Ricardo";
		System.out.println(Ricardo == Ricardo2);

		// String 比較：Heap中的Pool外驗證
		System.out.println("//String 比較：Heap中的Pool外驗證 ");
		String Ricardo3 = new String("Ricardo");
		String Ricardo4 = new String("Ricardo");
		System.out.println(Ricardo == Ricardo3);
		System.out.println(Ricardo4 == Ricardo3);

		// String常用的方法
		System.out.println("//String常用的方法");
		String Name = "我真的不知道是否該做下這樣的決定啊！";
		System.out.println("回傳字串的長度");
		System.out.println(Name.length());
		System.out.println("搜尋字元的位置，0代表第一個字");
		System.out.println(Name.indexOf("是"));
		System.out.println("從beginIndex開始截字");
		System.out.println(Name.substring(6));
		System.out.println("取beginIndex至endIndex中的字");
		System.out.println(Name.substring(6, 16));

	}

}
