package inheritance.origin;

public class Product {


    //商品名稱
    public String name;
    //商品價錢
    public int price;

    public String description(){
        String description = "品名："+name+"\r\n價錢："+price;
        return  description;
    }

}
