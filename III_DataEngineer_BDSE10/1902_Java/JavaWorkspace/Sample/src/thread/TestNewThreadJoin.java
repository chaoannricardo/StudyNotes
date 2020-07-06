package thread;

public class TestNewThreadJoin implements Runnable{

    public static void main(String[] args) {
        
        System.out.println("main thread = "+Thread.currentThread());

        TestNewThreadJoin runObject = new TestNewThreadJoin();
        Thread t1 = new Thread(runObject);
        t1.setName("倒數執行緒");
        t1.start();
        try {
            System.out.println("等待T1, isAlive "+t1.isAlive());
            t1.join();
            System.out.println("T1結束, isAlive "+t1.isAlive());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("main thread 結束");

    }

    @Override
    public void run() {
        try {
            for ( int i= 5  ; i > 0 ;i --){
                System.out.println("倒數 = "+i+","+Thread.currentThread());
                Thread.sleep(1000); //暫停執行1秒
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
