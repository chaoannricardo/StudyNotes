package interFace;

import java.util.Date;

/**
 * 例如 漫遊Sim卡 2017-10-10之前一定要開卡，開卡後15天內要用完
 */
public class SimDataCard extends Product implements Warrantable, Expirable {

    private Date expireDate;

    public SimDataCard(String name, int price,Date expireDate) {
        super(name, price);
        this.expireDate = expireDate;
    }

    @Override
    public Date 最後使用期限() {
        return this.expireDate;
    }

    @Override
    public int 保固天數() {
        return 15;
    }
}
