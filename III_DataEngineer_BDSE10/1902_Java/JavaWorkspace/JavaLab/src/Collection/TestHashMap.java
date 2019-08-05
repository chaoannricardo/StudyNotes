package Collection;

import java.io.ObjectInputStream.GetField;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class TestHashMap {

	public static void main(String[] args) {

		Map<String, Double> dog = new HashMap<>(); //利用Map<String, Double>來使用Generic性質
		dog.put("Ricardo", 100000000000000000d);
		dog.put("John", 1d);
		dog.put("Tim", 400d);
		dog.put("Henry", 200d);
		dog.put("Kate", 500d);
		// System.out.println(dog.get("Kate"));

		Set<String> abs = dog.keySet();

		Iterator<String> its = abs.iterator(); 
		//這邊的Iterator只有抓到String，所以將不能在下段的Iterator中沿用
		while (its.hasNext()) {
			Object object = (Object) its.next();
			//System.out.println(object + " = " + dog.get(object));
		}
		//dog是map；abs是所有的key；its是iterator；object是每個iterator抓到的key
		
		
		Set<Entry<String, Double>> abses = dog.entrySet();
		for (Object itses : abses) {
			Map.Entry entry = (Map.Entry) itses;
			//System.out.println(entry.getKey() + "= " + entry.getValue());	
		}
		
		//需使用一個不同的Iterator，Recall上方的Iterator，這邊需定義一個全新的Iterator
		Iterator<Entry<String, Double>> iterator = abses.iterator();
		while (iterator.hasNext()) {
			Map.Entry<String, Double> object =  iterator.next();
			System.out.println(object.getKey() + " = " + object.getValue());
		}

	}
}
