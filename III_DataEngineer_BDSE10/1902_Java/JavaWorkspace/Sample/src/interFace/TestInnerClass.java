package interFace;

import java.util.Date;
import java.util.GregorianCalendar;

public class TestInnerClass {
    public static void main(String[] args) {

        Expirable expirable = new Expirable() {
            public static final int a = 1;
            @Override
            public Date 最後使用期限() {
                return new GregorianCalendar(2019,0,2).getTime();
            }
        };
    }
}
