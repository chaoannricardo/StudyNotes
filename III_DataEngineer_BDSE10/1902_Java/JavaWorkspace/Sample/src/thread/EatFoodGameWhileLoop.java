package thread;

public class EatFoodGameWhileLoop extends Thread{


    private boolean hasFood = false;
    public void eat(){
        while (!hasFood) {
            //利用這種方式會一直執行，浪費cpu cycle
            //System.out.println(Thread.currentThread().getName()+":沒有食物，等待中");
        }
        System.out.println(Thread.currentThread().getName()+":吃了");
        hasFood = false;

    }

    public void feed(){
        hasFood =true;
        System.out.println("通知有食物了");
    }

    @Override
    public void run() {
        while ( true ) {
            eat();
        }
    }

    public static void main(String[] args) throws InterruptedException {

        EatFoodGameWhileLoop food = new EatFoodGameWhileLoop();
        food.setName("Food Thread");
        food.start();

        for ( int i=0 ; i < 5 ;i++){
            System.out.println("餵食");
            food.feed();
            Thread.sleep(1000);
        }
        
        System.out.println("End");
        System.exit(0);


    }

    

    

}
