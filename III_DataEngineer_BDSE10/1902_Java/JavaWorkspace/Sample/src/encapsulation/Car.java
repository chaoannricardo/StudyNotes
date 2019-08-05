package encapsulation;

/**
 * Created by vincent on 2017/6/3.
 */
public class Car {
    /*將property變成private,並產生public method */
    private String model;
    private int price;
    
    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
        if ( model.equalsIgnoreCase("Yaris")){
            this.price =  575000;
        }else if ( model.equalsIgnoreCase("Prius")){
            this.price = 1099000;
        }else{
            System.out.println("錯誤的型號");
        }

        
    }

    public int getPrice() {
        //return this.price;
        return Car.this.price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
