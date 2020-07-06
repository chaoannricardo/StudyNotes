package thread;

public class TestNewThread3 {


    public static void main(String[] args) {
        //這個範例是使用Anonymous class來實作Runnable，很常看到的作法
        Thread t1 = new Thread(new Runnable() {
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
        });
        t1.setName("倒數執行緒");
        t1.start();
        System.out.println("main thread exit");

    }
}
