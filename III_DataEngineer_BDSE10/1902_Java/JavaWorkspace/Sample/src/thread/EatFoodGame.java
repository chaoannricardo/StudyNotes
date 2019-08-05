package thread;

public class EatFoodGame extends Thread{


    private boolean  hasFood = false;
    public void eat(){
        synchronized (this) {
            while (!hasFood) {
                System.out.println(Thread.currentThread().getName()+":沒有食物，wait()等待中");
                try {
                    //因為有wait，所以雖然在while迴圈中，但其實沒有執行了，不會浪費cpu等待
                    this.wait();
                    System.out.println("等待結束");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println(Thread.currentThread().getName()+":吃了");
            hasFood = false;
        }
    }

    public void feed(){
        synchronized (this){
            hasFood =true;
            System.out.println("通知有食物了");
            this.notify();//會喚醒之前wait的執行緒
        }
    }

    @Override
    public void run() {
        while ( true ) eat();
    }

    public static void main(String[] args) throws InterruptedException {

        EatFoodGame food = new EatFoodGame();
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
