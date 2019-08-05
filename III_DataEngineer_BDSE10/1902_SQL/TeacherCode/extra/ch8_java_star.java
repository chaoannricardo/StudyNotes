package tw.ehterlin.myproject.Hw;

public class Hw2_3 {

	public static void main(String[] args) {
		for (int i = -9; i < 10; i++) {
			if (i <= 0) {
				for (int j = -9-i; j < 1; j++) {
					System.out.print("*");
				}
			}
			if (i > 0) {
				for (int j = i; j < 10; j++) {
					System.out.print("*");
				}
			}
			System.out.print("\n");
		}

	}
}
