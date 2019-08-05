package Collection;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

public class TestHashSet {

	public static void main(String[] args) {

		Set hashset = new LinkedHashSet(); 
		//HashSet不保證順序，LinkedHashSet保證順序，同樣的可以藉由Set<String>的方式來指定在set中的物件型態
		Object test0 = hashset.add("Hello"); // 存入的為boolean
		Object test1 = hashset.add("World");
		Object test2 = hashset.add("Hello"); // 不能重複存入相同的元素
		boolean test3 = hashset.add(3.0);
		// System.out.println(test0);
		// System.out.println(test1);
		// System.out.println(test2); //沒存成功
		// System.out.println(hashset.size()); //列出目前hashsize的大小，為2，即第二次的"Hello"沒有被印出來

		// 測試元素是否在Hashset當中
		boolean tests = hashset.contains("World");
		// System.out.println(tests);

		// 利用iterator來撰寫程式
		Iterator iterator = hashset.iterator();
		while (iterator.hasNext()) { // iterator的hasNext測試式
			Object object = iterator.next(); // iterator的next抓取元素式
			//System.out.println(object);
		}

		// 利用for each迴圈來撰寫程式
		for (Object object : hashset) {
			//System.out.println(object);
		}
		
		//補充：檢查HashSet是依照hashcode來進行填入內容驗證的
		Employee emp1 = new Employee("001");
		Employee emp2 = new Employee("001");
		hashset.add(emp1);
		System.out.println(hashset.add(emp2));

	}

}
