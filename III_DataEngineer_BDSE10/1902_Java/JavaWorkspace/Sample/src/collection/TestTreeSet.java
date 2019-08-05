package collection;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

public class TestTreeSet {
    public static void main(String[] args) {

        //Set ints = new TreeSet(); //預設是由小排到大

        //Anonymous class方式產生Comparator,Comparator會比較兩個物件，回傳要排前面或排後面
        //回傳0表示排前面，回傳-1表示排後面,０表示兩物件一樣
        Comparator comparator = new Comparator() {
            @Override
            public int compare(Object o1, Object o2) {
                //回傳三種可能結果，如果o1要排在o2之前，則回傳－1，如果在o2之後，則回傳1,相等則回傳0
                Integer i1 = (Integer) o1; // 2
                Integer i2 = (Integer) o2; // 1
                if ( i1 == i2 ) { //相等則回傳0
                    return 0;
                }else {
                    return i1 > i2 ? -1 : 1;  //大的排前面
                }
            }
        };
        Set ints = new TreeSet(comparator);

        ints.add(1);
        ints.add(4);
        ints.add(2);
        ints.add(3);
        for (Object item : ints) {
            System.out.println(item);
        }
        
    }
}
