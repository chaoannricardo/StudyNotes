/**
 * Created by vincent on 2017/6/5.
 */
public class JavaString {
    public static void main(String[] args) {

        //string pool
        String name = "vincent";
        String name1 = "vincent";
        System.out.println(name == name1);  //true

        //new String
        String name2 = new String("vincent");
        System.out.println(name == name2);  //false

        //String compare
        System.out.println(name.equals(name2));

        //String length
        System.out.println("資策會".length());

        //String indexOf
        System.out.println("資策會305".indexOf("305"));

        //String substring
        System.out.println("資策會305".substring(3));

        //String substring
        System.out.println("資策會305".substring(3,5));

        //split
        String csv = "課程,老師,時數";
        String[] split = csv.split(",");
        for ( int i=0 ; i< split.length ; i++){
            System.out.println(split[i]);
        }



        

    }
}
