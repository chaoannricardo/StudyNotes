package Exception;

public class Exception1 {

	//測試Exception
	public static void main(String[] args) {

		try {
			int a = 1;
			int b = a / 1; //發生ArithmeticException的位置
			System.out.println(b);
			
			int[] c = {1, 2};
			System.out.println(c[2]);

		} catch (ArithmeticException e) {
			System.out.println("抓到了ArithmeticException，因除以零的關係");
		}catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("抓到了ArrayIndexOutOfBoundsException");
			e.printStackTrace();
		}finally {
			System.out.println("一定會執行到。");
		}
		System.out.println("欸欸？"); 

	}

}
