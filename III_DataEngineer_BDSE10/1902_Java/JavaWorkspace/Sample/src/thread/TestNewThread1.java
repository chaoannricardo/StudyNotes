package thread;

public class TestNewThread1 extends Thread{

    public static void main(String[] args) {
        
        System.out.println("main thread = "+Thread.currentThread());
        TestNewThread1 t1 = new TestNewThread1();
        t1.setName("倒數執行緒");
        t1.start();
        System.out.println("main thread 結束");

    }

    @Override
    public void run() {
        try {
            for ( int i= 5  ; i > 0 ;i --){
                System.out.println("倒數 = "+i+","+Thread.currentThread());
                Thread.sleep(1000); //暫停執行1秒
            }
            System.out.println(Thread.currentThread()+"執行結束");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
