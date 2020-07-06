package constructor;

/**
 * Created by vincent on 2017/6/3.
 */
public class Car {

    private String model;
    private int price;
    private char color;

    /*step1 full constructor,加了之後，則無預設建構子可以呼叫 */
    public Car(String model, char color) {
        this.model = model;
        this.color = color;
    }
    /*
    public Car(){
        //預設建構子，如果沒有任何其它的建構子，編譯器會預設產生一個
    } */

    /* step2 多加一個建構子 再少一個參數,利用this呼叫其它建構子，this必須放在第一行執行
    *  Step3 修改為private，則其它java，則無法呼叫
    * */
    public Car(String model) {
        this(model, 'W');
    }

    /* step 4 */
    public String getInfo(){
        return "車型："+model+",顏色="+this.color;
    }

    public static void main(String[] args) {
        Car car = new Car("Yaris");
        System.out.println(car.getInfo());
    }

}
