package generic;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class TestHashMap {
    public static void main(String[] args) {
        HashMap<String,Integer> map = new HashMap();
        map.put("John", 2000);
        map.put("David", 1000);
        map.put("Tom", 5000);

        System.out.println(map.get("John"));

        //利用keySet來取得所有的key值
        Set<String> keys = map.keySet();
        for (String key : keys) {
            System.out.println("name="+key+", salary = "+map.get(key));
        }

    }
}
