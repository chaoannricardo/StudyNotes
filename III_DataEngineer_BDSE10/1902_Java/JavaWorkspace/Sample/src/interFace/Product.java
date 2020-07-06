package interFace;

import java.util.Date;
import java.util.GregorianCalendar;

public class Product {

    public Product(){
        
    }

    public Product(String name, int price){
        this.name = name;
        this.price = price;
    }

    //商品名稱
    protected String name;
    //商品價錢
    private int price;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }


    public String description(){
        String description = "品名："+name+"\r\n價錢："+price;
        return  description;
    }

    public static Date getDate(int year, int month, int date){
        GregorianCalendar calendar = new GregorianCalendar(year,month,date);
        return calendar.getTime();
    }

}
