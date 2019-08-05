package Collection190130;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

public class TestTreeSet {

	public static void main(String[] args) {

		// 實作Comparator方法，記得Override原本的方法
		Comparator comparator = new Comparator() {

			@Override
			public int compare(Object o1, Object o2) {
				Integer T1 = (Integer) o1;
				Integer T2 = (Integer) o2;
				if (T1 > T2) {
					return -1;
				} else if (T1 < T2) {
					return 1;
				} else {
					return 0;
				}
			}
		};

		//建立treeset
		Set<Integer> treeset = new TreeSet(comparator);
		boolean A0 = treeset.add(100); // 加進去的結果回傳為boolean
		boolean A1 = treeset.add(101);
		boolean A2 = treeset.add(102);
		boolean A3 = treeset.add(103);
		boolean A4 = treeset.add(104);
		boolean A5 = treeset.add(105);
		boolean A6 = treeset.add(106);
		boolean A7 = treeset.add(107);
		
		//利用for each迴圈將排列好的treeset列印出來
		for (Integer Tlabel : treeset) {
			System.out.println(Tlabel);
		}

	}

}
