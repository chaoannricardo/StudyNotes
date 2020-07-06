package thread;

public class TestThread {

	public static void main(String[] args) {
		
		MyThread1 t1 = new MyThread1();
		t1.setName("Count Down");
		t1.start();
		
		System.out.println("main 方法結束");
		
		
	}

}
