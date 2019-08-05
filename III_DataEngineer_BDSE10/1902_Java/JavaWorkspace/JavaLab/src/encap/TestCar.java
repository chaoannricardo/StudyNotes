package encap;

public class TestCar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Car toyota = new Car();
		//toyota.setModel("Tercel");
		System.out.println(toyota.getPrice());
		System.out.println(toyota.getColor());
		
		//測試建構方法
		Car toyota2 = new Car("Tercel", 'G');
		//System.out.println(toyota2.getPrice());
		//System.out.println(toyota2.getColor());
		
		
		
	}
}
