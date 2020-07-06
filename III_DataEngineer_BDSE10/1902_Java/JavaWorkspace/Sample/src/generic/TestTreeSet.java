package generic;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

public class TestTreeSet {
    public static void main(String[] args) {

        Set ints = new TreeSet(new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                //回傳三種可能結果，如果o1要排在o2之前，則回傳－1，如果在o2之後，則回傳1,相等則回傳0
                if ( o1 == o2 ) { //相等則回傳0
                    return 0;
                }else {
                    return o1 > o2 ? -1 : 1;  //大的排前面
                }
            }
        });
        ints.add(4);
        ints.add(3);
        ints.add(2);
        ints.add(1);
        for (Object item : ints) {
            System.out.println(item);
        }
        
    }
}
