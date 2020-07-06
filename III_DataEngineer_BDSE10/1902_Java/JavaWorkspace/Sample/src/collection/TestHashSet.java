package collection;

import java.util.*;

public class TestHashSet {
    public static void main(String[] args) {

        Set set = new HashSet();
        set.add("Hello");
        set.add("Hello");
        set.add("World");
        set.add("World");
        set.add(Double.valueOf(3.0));
        System.out.println("個數＝"+set.size());

        /*//利用iterator訪問所有元素
        Iterator iterator = set.iterator();
        while ( iterator.hasNext()){
            Object item = iterator.next();
            System.out.println(item);
        }*/

        //利用foreach loop
        for (Object item : set) {
            System.out.println(item);
        }
    }
}
