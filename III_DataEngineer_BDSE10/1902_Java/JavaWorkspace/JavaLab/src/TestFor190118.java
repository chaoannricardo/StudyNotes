public class TestFor190118 {

	public static void main(String[] args) {
		// for迴圈
		for (int i = 0; i <= 5; i++) {
			System.out.println("你這傢伙是不是個白癡阿？ " + "X " + i);
		}

		// 計算1加到100的總和
		System.out.println("計算1加到100的總和");
		int sum = 0;
		for (int i = 0; i <= 100; i++) {
			sum = sum + i;
		}
		System.out.println("1加到100的總和是" + sum);

		// 計算100以內奇數的總和(for & break)
		System.out.println("計算100以內奇數的總和1");
		int sum0 = 0;
		for (int i = 0; i < 50; i++) {
			sum0 = sum0 + 1 + i * 2;
		}
		System.out.println(sum0);

		System.out.println("計算100以內奇數的總和2");
		int sum1 = 0;
		for (int i = 1; i <= 100; i = i + 2) {
			sum1 = sum1 + i;
		}
		System.out.println(sum1);

		System.out.println("計算100以內奇數的總和3");
		int sume = 0;
		for (int i = 0; i <= 100; i++) {
			if (i % 2 == 1) {
				sume = sume + i;
			}
		}
		System.out.println(sume);

		System.out.println("計算100以內奇數的總和4");
		int suma = 0;
		for (int i = 0; i <= 100; i++) {
			if (i % 2 == 0) {
				continue;
			}
			suma = suma + i;

			if (i <= 100) {
				continue;
			}

		}
		System.out.println(suma);

		// 使用while來計算1至100的總和
		System.out.println("使用while來計算1至100的總和");
		{
			int i = 1;
			int sum2 = 0;
			while (i <= 100) {
				sum2 = sum2 + i;
				i++;
			}
			System.out.println(sum2);
		}

		// 使用do while來計算1至100的總和
		System.out.println("使用do while來計算1至100的總和");
		int i = 1;
		int sum3 = 0;
		do {
			sum3 = sum3 + i;
			i++;
		} while (i <= 100);
		System.out.println(sum3);

		// 九九乘法表
		for (int a = 1; a <= 9; a++) {
			for (int b = 1; b <= 9; b++) {
				System.out.print(a + "X" + b + "=" + a * b + " ");
			}
			System.out.println();

		}

	}

}
