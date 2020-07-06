package time;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class TestTime {
    public static void main(String[] args) {

        Calendar calendar = Calendar.getInstance();
        calendar.set(2017,10,3);
        calendar.set(Calendar.HOUR_OF_DAY,9);
        calendar.set(Calendar.MINUTE,0);
        calendar.set(Calendar.SECOND,0);
        calendar.set(Calendar.MILLISECOND,0);
        Date date = calendar.getTime();
        System.out.println(calendar.getTimeZone());
        DateFormat formatter1 = new SimpleDateFormat("MM/dd HH:mm");
        System.out.println(formatter1.format(date));
        DateFormat formatter = new SimpleDateFormat("MM/dd HH:mm");
//        System.out.println(ZoneId.getAvailableZoneIds());

        //GMT+3 夏令時間, GMT+2冬令時間
        TimeZone timeZone = TimeZone.getTimeZone("Europe/Bucharest");
        formatter.setTimeZone(timeZone);

        System.out.println(formatter.format(date));



    }
}
