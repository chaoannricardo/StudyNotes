package Collection190130;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class TestHashSet {

	public static void main(String[] args) {
		// 記得ArrayList是從0起算的，沒有順序，不能有重複的元素
		Set<Integer> hashset = new HashSet<Integer>();
		boolean A0 = hashset.add(100); // 加進去的結果回傳為boolean
		boolean A1 = hashset.add(101);
		boolean A2 = hashset.add(102);
		boolean A3 = hashset.add(103);
		boolean A4 = hashset.add(104);
		boolean A5 = hashset.add(105);
		boolean A6 = hashset.add(106);
		boolean A7 = hashset.add(107);
		boolean A8 = hashset.add(100); // 沒有存成功
		// 證明A8並沒有存成功
		// System.out.println(A8);
		
		//檢查某值是否存入hashset中
		//System.out.println(hashset.contains(106));

		// 利用iterator進行迴圈列印
		Iterator<Integer> iterator = hashset.iterator();
		while (iterator.hasNext()) {
			Integer Alabel = (Integer) iterator.next();
			// System.out.println(Alabel);
		}

		// 利用for each迴圈進行列印，原始版for迴圈不太能因應相關需求
		for (Integer Alabel : hashset) {
			//System.out.println(Alabel);
		}
		

	}

}
