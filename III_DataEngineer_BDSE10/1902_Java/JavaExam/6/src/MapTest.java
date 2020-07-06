import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.HashMap;
import java.util.Iterator;

public class MapTest {
	public static void main(String[] args) {

		People p1 = new People("001", 20);
		People p2 = new People("002", 30);
		People p3 = new People("003", 45);

		// 實作1:請實作一個泛型的Map中的key值為people的id，value為people物件，將上述三個people放入Map中
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put(p1.getName(), p1.getAge());
		map.put(p2.getName(), p2.getAge());
		map.put(p3.getName(), p3.getAge());

		// 實作2:請用for迴圈或者iterator，計算Map中三人的平均年齡
		Set<Entry<String, Integer>> entryset = map.entrySet();
		//iterator
		Iterator<Entry<String, Integer>> iterator1 = entryset.iterator();
		long average0 = 0;
		while (iterator1.hasNext()) {
			Map.Entry<String, Integer> entry = (Map.Entry<String, Integer>) iterator1.next();
			average0 = average0 + entry.getValue();
		}
		average0 = average0 / map.size();
		System.out.println(average0);
		//for
		long average1 = 0;
		for (Entry<String, Integer> entry : entryset) {
			average1 = average1 + entry.getValue();
		}
		average1 = average1 / map.size();
		System.out.println(average1);
	}
}
