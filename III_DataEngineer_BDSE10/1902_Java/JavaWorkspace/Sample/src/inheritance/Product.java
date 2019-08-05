package inheritance;

public class Product {

    public Product(){

    }

    public Product(String name, int price){
        this.name = name;
        this.price = price;
    }

    //商品名稱
     String name;
    //商品價錢
     int price;

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
}
