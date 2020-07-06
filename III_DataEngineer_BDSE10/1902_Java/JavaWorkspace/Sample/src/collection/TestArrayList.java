package collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TestArrayList {
    public static void main(String[] args) {
        List list = new ArrayList();
        list.add("Hello");
        list.add("World");
        list.add(3.0);
        

        System.out.println("個數＝"+list.size());
        System.out.println("index 0 為 " + list.get(0));
        System.out.println("index 1 為 " + list.get(1));

        //利用for迴圈以及,get(int)訪問所有元素，會按照順序印出
        for (int i = 0; i < list.size(); i++) {
            Object item = list.get(i);
            System.out.println(item);
        }


        //利用iterator訪問所有元素
        Iterator iterator = list.iterator();
        while ( iterator.hasNext()){
            Object item = iterator.next();
            System.out.println(item);
        }

        //利用foreach loop，會按照順序印出
        for (Object item : list) {
            System.out.println(item);
        }

        //remove
        list.remove("Hello");
        System.out.println(list);

    }
}
