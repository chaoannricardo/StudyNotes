package Collection190130;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TestArrayList {

	public static void main(String[] args) {

		List<String> list0 = new ArrayList<>();
		// 記得ArrayList是從0起算的，具有順序，並且可以有重複的元素
		boolean A0 = list0.add("Ricardo"); //加進去的結果回傳為boolean
		boolean A1 = list0.add("Tim");
		boolean A2 = list0.add("Wendy");
		boolean A3 = list0.add("Jack");
		boolean A4 = list0.add("Henry");
		boolean A5 = list0.add("Ricardo");
		// 列印ArrayList的大小
		System.out.println("The size of list0 is " + list0.size());

		// 利用for each進行列印
		for (String label : list0) {
			// System.out.println(label);
		}
		// 利用普通for迴圈來列印
		for (int i = 0; i < list0.size(); i++) {
			// System.out.println("index " + i + " " + list0.get(i));
		}
		// 利用iterator進行迴圈列印
		Iterator<String> iterator = list0.iterator();
		while (iterator.hasNext()) {
			String label = (String) iterator.next();
			System.out.println("The name is " + " " + label);
		}

		// 別忘了Wrapper Class

	}

}
