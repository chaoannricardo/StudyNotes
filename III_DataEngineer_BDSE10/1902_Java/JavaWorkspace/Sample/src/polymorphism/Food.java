package polymorphism;

public class Food extends Product {


    private String expireDate;

    public Food(String name, int price, String expireDate) {
        super(name, price);
        this.expireDate = expireDate;
    }

    @Override
    public String description() {
        String description = super.description();
        description = description +"\r\n到期日："+expireDate;
        return description;
    }
}
