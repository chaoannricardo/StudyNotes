
public class TestString190121 {

	public static void main(String[] args) {

		// String記憶體位置比較
		String name = "Ricardo";
		String name1 = "Ricardo";
		String name2 = new String("Ricardo");
		System.out.println("//String記憶體位置比較：name v.s. name1");
		System.out.println(name == name1);
		System.out.println("//String記憶體位置比較：name v.s. name2");
		System.out.println(name == name2);

		// String字串是否相同比較
		System.out.println("//String字串是否相同比較：name v.s. name2");
		System.out.println(name.equals(name2));

		System.out.println("//String字串是否相同比較：name v.s. name1");
		System.out.println(name.equals(name1));

		// String常用的方法
		System.out.println("//String常用的方法：字數");
		System.out.println(name.length());

		System.out.println("//String常用的方法：字數2");
		int a = name.length();
		System.out.println(a);

		System.out.println("//String常用的方法：indexOf");
		String classroom = "資策會教室305";
		System.out.println(classroom.indexOf("30"));
		
		System.out.println("//String常用的方法：substring");
		System.out.println(classroom.substring(3,5));

	}

}