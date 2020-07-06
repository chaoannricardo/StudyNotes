package equals;

public class EmployeeTest {

	public static void main(String[] args) {
		Employee emp0 = new Employee("001");
		Employee emp1 = new Employee("001");
		//System.out.println(emp0 == emp1); // false
		//System.out.println(emp0.equals(emp1)); // 原本也是比較記憶體位置，所以也是false

		emp1 = null;
		//System.out.println(emp0.toString());

		//System.gc();

	}

	
	
	//以下finalize()部分，沒有認真聽懂，不過似乎也不是那麼重要
	protected void finalize() throws Throwable {
		System.out.println("emp1被GC了");
	}

}
