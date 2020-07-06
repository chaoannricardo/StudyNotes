package Collection190130;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class TestHashMap {

	public static void main(String[] args) {
		
		//製作HashMap，不具有順序
		Map<String, Integer> hashmap = new HashMap();
		hashmap.put("Ricardo", 100);
		hashmap.put("Tim", 101);
		hashmap.put("Jack", 102);
		hashmap.put("Kate", 103);
		hashmap.put("Daisy", 104);
		hashmap.put("Danny", 105);
		
		//列印出單個HashMap值
		//System.out.println(hashmap.get("Ricardo"));
		
		//利用while & iterator & keyset列印出所有的map值
		Set keys = hashmap.keySet();
		Iterator iteratorkey = keys.iterator();
		while (iteratorkey.hasNext()) {
			Object keyi = (Object) iteratorkey.next();
			//System.out.println(hashmap.get(keyi));
		}
		
		//利用entryset列印所有的map值
		Set<Entry<String, Integer>> entryset123 = hashmap.entrySet();
		for (Entry<String, Integer> entrysetI : entryset123) {
			Map.Entry newentry = (Map.Entry) entrysetI;
			//System.out.println(newentry.getKey());
		}
		
		//利用entryset與iterator列印所有的map值
		Iterator iteratorentry = entryset123.iterator();
		while (iteratorentry.hasNext()) {
			Map.Entry object = (Map.Entry) iteratorentry.next();
			//System.out.println(object.getKey());
		}
		
		

	}

}
