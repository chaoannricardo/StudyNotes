package collection;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class TestHashMap {

	public static void main(String[] args) {
		
		Map map = new HashMap();
		map.put("John", 2000);
		map.put("David", 1000);
		map.put("Tom", 5000);
		map.put("Tom", 2500);
		
		Set keys = map.keySet();
		
//		Iterator iterator = keys.iterator();
//		while ( iterator.hasNext() ) {
//			Object key = iterator.next();
//			System.out.println(key + "= " +map.get(key));
//		}
		
		for (Object key : keys) {
			System.out.println(key + "= " +map.get(key));
		}
		
		
	}

}
