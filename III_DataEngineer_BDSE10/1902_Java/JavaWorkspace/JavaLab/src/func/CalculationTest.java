package func;

public class CalculationTest {

	public static void main(String[] args) {
		
		int result = add(101, 102);
		System.out.println(result);
		
		System.out.println(add(1, 100));

	}

	public static int add(int a, int b) {

		int sum = a + b;

		return sum;

	}
}
