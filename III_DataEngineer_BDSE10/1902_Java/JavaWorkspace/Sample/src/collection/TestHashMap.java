package collection;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class TestHashMap {
    public static void main(String[] args) {
        HashMap map = new HashMap();
        map.put("John", 2000);
        map.put("David", 1000);
        map.put("Tom", 5000);
        map.put("Tom", 2500);


        System.out.println(map.get("Tom"));

        //利用keySet來取得所有的key值
        Set keys = map.keySet();
        for (Object key : keys) {
            String name = (String) key;
            System.out.println("name="+name+", salary = "+map.get(name));
        }

        /*Iterator 範例
        Iterator keysIterator = keys.iterator();
        while ( keysIterator.hasNext()){
            String key = (String) keysIterator.next();
            System.out.println("name="+key+", salary = "+map.get(key));
        } */

        //利用entrySet來loop
        Set entrySet = map.entrySet();
        for(Object e : entrySet){
            Map.Entry entry = (Map.Entry) e;
            System.out.println(entry.getKey()+"="+entry.getValue());
        }

        /*Iterator 範例
        Iterator entryIterator = entrySet.iterator();
        while ( entryIterator.hasNext()){
            Map.Entry entry = (Map.Entry) entryIterator.next();
            System.out.println(entry.getKey()+"="+entry.getValue());
        } */

        
        int sum = 0;
        for (Object element : map.entrySet()) {
            Map.Entry entry = (Map.Entry) element;
            sum = sum + (int)entry.getValue();
        }
        System.out.println("總和="+sum);

        System.out.println("a".hashCode());
        System.out.println(new String("a").hashCode());

    }
}
