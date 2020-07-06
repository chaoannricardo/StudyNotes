package array;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

public class TestArrayMemory {
    public static void main(String[] args) {
        meminfo();
        double[] doubles = new double[10000000];
        //產生10000000 double,一個double 8 byte,所以會佔約80MB
        //如果是Double[]，則為物件參考，會只佔4byte，總共約40MB
        meminfo();

        Date date = Calendar.getInstance().getTime();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        java.sql.Time time = new Time(date.getTime());
        java.sql.Timestamp timestamp = new Timestamp(date.getTime());
        System.out.println(timestamp);
        System.out.println(timestamp.getNanos());

    }

    private static void meminfo() {
        //long maxMemory = Runtime.getRuntime().maxMemory();
        //int max = (int) (maxMemory / 1000000);
        //System.out.println("max memory = "+ max + "MB");
        long totalMemory = Runtime.getRuntime().totalMemory();
        int total = (int) (totalMemory / 1000000);
        System.out.println("total memory = "+ total+"MB");
        long freeMemory = Runtime.getRuntime().freeMemory();
        int free = (int) (freeMemory / 1000000);
        System.out.println("free memory = "+free+"MB");
        long usedMemory = total - free;
        System.out.println("used memory = "+usedMemory);
    }
}
