import java.util.jar.Attributes.Name;

public class TestEmployee190120 {

	public static void main(String[] args) {
		// 類別及物件
		
		System.out.println("//新增物件");
		Employee190121 emp = new Employee190121();
		emp.name = "李大明";
		emp.empno = 1;
		System.out.println(emp.name);
		
		
		Employee190121 emp1 = new Employee190121();
		emp1.name = "張大華";
		
		System.out.println("//比較記憶體位置是否相同");
		System.out.println(emp == emp1); //布林值
		
		//定義新的記憶體位置檢查是否相同
		System.out.println("//定義新的記憶體位置檢查是否相同");
		emp1 = emp;
		System.out.println(emp == emp1);

		//給予null值，並且驗證是否能找到記憶體位置
		System.out.println("//給予null值，並且驗證是否能找到記憶體位置");
		emp = null;
		emp1 = null;
		System.out.println(emp == emp1);
		System.out.println(emp.name);
		
		
		
		
	}

}
