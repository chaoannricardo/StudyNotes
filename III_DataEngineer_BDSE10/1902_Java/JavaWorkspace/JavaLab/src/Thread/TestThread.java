package Thread;

public class TestThread {

	public static void main(String[] args) {

		/*
		 * 第一種方法，extends Thread, override run() //new
		 * 一個在其他類別之下的執行緒方法，設定多個執行緒方法，則在執行時會有多個執行緒 MyThread1 thread1 = new MyThread1();
		 * thread1.setName("倒數計時"); thread1.start();
		 * 
		 * MyThread1 thread2 = new MyThread1(); thread2.setName("倒數計時2");
		 * thread2.start();
		 * 
		 * MyThread1 thread3 = new MyThread1(); thread3.setName("倒數計時3");
		 * thread3.start();
		 */

		/*
		// 第二種方法，implements Runnable
		Runnable runnable = new MyRunnable();
		Thread t1 = new Thread(runnable);
		t1.setName("倒數計時0");
		t1.start();

		Thread t2 = new Thread(runnable);
		t2.setName("倒數計時1");
		t2.start();

		Thread t3 = new Thread(runnable);
		t3.setName("倒數計時2");
		t3.start();
		*/


		// 第三種方法，實務上最為常用，Runnable Anonymous Class
		Thread t4 = new Thread(new Runnable() {

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
		});
		t4.setName("倒數計時");
		//t4.setDaemon(true); 設為與背景中執行
		t4.start();
		System.out.println("before " + t4.isAlive()); //檢查是否還在執行中
		try {
			t4.join(); //等待該執行緒結束在執行程式向下
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("after " + t4.isAlive());

		// main方法結束告知
		System.out.println("main 方法結束");

	}

}
