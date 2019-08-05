package thread;

public class TestNewThread2 implements Runnable{

    public static void main(String[] args) {
        
        System.out.println("main thread = "+Thread.currentThread());

        TestNewThread2 runObject = new TestNewThread2();
        Thread t1 = new Thread(runObject);
        t1.setName("倒數執行緒");
        t1.start();
        System.out.println("main thread exit");

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
