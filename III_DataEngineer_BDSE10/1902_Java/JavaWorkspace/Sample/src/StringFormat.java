public class StringFormat {
    public static void main(String[] args) {

        System.out.println(String.format("Hello, %s","David"));  // Hello, David
        System.out.println(String.format("|%10f|",123.456));  //總長10，後面補0 = 123.456000
        System.out.println(String.format("%.2f",123.456));  //小數點2位= 123.46
        System.out.println(String.format("%,.2f",1234.5678));  //小數點2位,加上千分號= 1,234.57
        System.out.println(String.format("|%10d|",1234));  //總長10，前方補空白
        System.out.println(String.format("%.2f%%",12.34));  //
        
    }
}
