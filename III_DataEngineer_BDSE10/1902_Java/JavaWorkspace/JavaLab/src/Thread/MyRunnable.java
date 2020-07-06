package Thread;

public class MyRunnable implements Runnable {

	@Override
	public void run() {
		try {
			for (int i = 5; i > 0; i--) {
				System.out.println("倒數 = " + i + "," + Thread.currentThread());
				Thread.sleep(1000); // 暫停執行1秒
			}
			System.out.println(Thread.currentThread() + "執行結束");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

	}

}
