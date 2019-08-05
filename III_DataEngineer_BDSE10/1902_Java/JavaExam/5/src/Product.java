public class Product {

    public Product(String name, int price){
        this.name = name;
        this.price = price;
    }

    //商品名稱
    private String name;
    //商品價錢
    private int price;

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

}
