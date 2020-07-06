package interFace;

import java.util.Date;

public class Food extends Product implements Expirable {

    private Date expireDate;

    public Food(String name, int price,Date expireDate) {
        super(name, price);
        this.expireDate = expireDate;
    }

    @Override
    public Date 最後使用期限() {
        return this.expireDate;
    }

    @Override
    public String description() {
        String description = super.description();
        description = description +"\r\n到期日："+ 最後使用期限();
        return description;
    }
}
