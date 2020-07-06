package interFace;

public class Notebook extends Product implements Warrantable {

    public Notebook(String name, int price,int warranty) {
        super(name, price);
        this.warranty = warranty;
    }
    
    private int warranty;

    public int getWarranty() {
        return warranty;
    }

    public void setWarranty(int warranty) {
        this.warranty = warranty;
    }
    @Override
    public int 保固天數() {
        return warranty;
    }
    @Override
    public String description() {
        String description = super.description();
        description = description + "\n保固："+ 保固天數()+"天";
        return description;
    }
}
