package inheritance;

import java.util.Date;

public class Food extends Product {


    private Date expireDate;

    public Food(String name, int price, Date expireDate) {
        super(name, price);
        this.expireDate = expireDate;
    }

    @Override
    public String Description() {
        String description = super.Description();
        description = description +"\r\n到期日："+expireDate;
        return description;
    }
}
