package inheritance;

public class Notebook extends Product {

    /*step2 產生建構子,不同的access modifier 會對子類別產生不同的影響
      如果Product使用protected，則 Notebook可以使用this.name
      如果Product使用預設（都不寫)，則 Notebook如果跟Product在同一個package，可以使用this.name
      如果Product使用private，則 Item3C不以使用this.name，只能使用setName
      step3，測試呼叫父類別建構子
      3.1 呼叫super(name,price,catetory)，並移至其它行
      3.1 不呼叫super，並暫時將super()註解
      */
    public Notebook(String name, int price, int warranty) {
        super(name,price);//一定要在第一行
        this.name = name; //只有public, protected 或者package條件符合時才能繼承
        this.price = price;   //只有public, protected 或者package條件符合時才能繼承
        setName(name);
        setPrice(price);
        this.warranty = warranty;
    }
    
    private int warranty;

    public int getWarranty() {
        return warranty;
    }

    public void setWarranty(int warranty) {
        this.warranty = warranty;
    }

    public String description() {
        String description = super.description();
        description = description + "\n保固："+warranty+"天";
        return description;
    }
}
