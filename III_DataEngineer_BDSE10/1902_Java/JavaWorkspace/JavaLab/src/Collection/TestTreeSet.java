package Collection;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

public class TestTreeSet {

	public static void main(String[] args) {

		// 實作comparator方法
		Comparator comparator = new Comparator() {

			//若需要o1在o2前面，則回傳-1，後面則回傳1，相等則回傳0。
			@Override
			public int compare(Object o1, Object o2) {
				Integer int1 = (Integer) o1;
				Integer int2 = (Integer) o2;
				if (int1 > int2) {
					return -1;
				} else if (int1 < int2) {
					return 1;
				} else {
					return 0;
				}

			}
		};

		// 會自動排序的treeset，注意所輸入的物件只能有一個型態
		Set treeSet = new TreeSet(comparator);
		treeSet.add(4);
		treeSet.add(1);
		treeSet.add(5);
		treeSet.add(2);
		treeSet.add(3);
		treeSet.add(6);

		// for each 迴圈
		for (Object object : treeSet) {
			System.out.println(object);
		}

	}

}
