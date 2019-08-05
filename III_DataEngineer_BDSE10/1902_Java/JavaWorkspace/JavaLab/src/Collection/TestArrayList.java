package Collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class TestArrayList {

	public static void main(String[] args) {
		List<String> list= new ArrayList(); //利用Generic定義list裡面只能有怎麼樣的物件型態
		list.add("Hello");
		list.add("World");
		list.add("3.0"); //要放基本型態的話就必須使用Wrapper Class
		
		//System.out.println("個數=" + list.size()); //size()告訴你物件個數有多少
		//System.out.println("index 1 = " + list.get(0));//get()可以讓你取得第XX物件的資料
		//System.out.println("index 2 = " + list.get(1));
		//System.out.println("index 3 = " + list.get(3)); //若超出物件範圍則會出現錯誤
		
		//利用for印出所有的物件
		for (int i = 0; i < list.size(); i++) {
			String item = list.get(i); //記得get()程式的編號是從0開始，所以上面的i才可以從0開始，並且小於list.size
			System.out.println(item);
		}
		
		//利用iterator來引出所有的物件，iterator比較類似於pointer的作用
		Iterator<String> iteratorpointer = list.iterator(); //在Iterator時就加入Generic，這時所有的物件皆是指定的物件型態
		while (iteratorpointer.hasNext()) {
			String item = iteratorpointer.next();
			System.out.println(item);
		}
		//別忘了ALT+Shift+L
		
		//利用for each loop來列印出物件
		for (String object : list) {
			System.out.println(object);
		}

	}

}
