package generic;

import java.util.HashSet;
import java.util.Set;

public class TestHashSet {
    public static void main(String[] args) {

        Set<String> set = new HashSet();
        set.add("Hello");
        set.add("World");
        System.out.println("個數＝"+set.size());

        //利用foreach loop
        for (String item : set) {
            System.out.println(item);
        }
    }
}
