package thread;

import java.util.ArrayList;
import java.util.List;

public class TestRaceCondition implements Runnable{

    public static int counter = 0;

    public static void main(String[] args) {

        List<Thread> threads = new ArrayList<>();
        //產生threads，加入ArrayList
        for( int i=0 ; i < 10 ; i++) {
            TestRaceCondition runnable = new TestRaceCondition();
            Thread t1 = new Thread(runnable,"T"+i);
            threads.add(t1);
        }
        //一起發動所有的thread
        for (Thread thread : threads) {
            thread.start();
        }
        try {
            //main thread 等待所有執行緒結束
            for (Thread thread : threads) {
                thread.join();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        //印出最後的值
        System.out.println("finally counter = "+counter);

    }

    @Override
    public void run() {
        for ( int i= 0  ; i < 1000 ;i ++){
        	//synchronized (TestRaceCondition.class) {
            incrementCounter();
            //}
        }
    }

    public static  void incrementCounter(){
        counter = counter + 1;
    }

}
