package func;

import javax.swing.plaf.basic.BasicMenuItemUI;

public class PeopleTest {

	public static void main(String[] args) {
		
		//使用BMI方法
		People Ricardo = new People();
		Ricardo.height = 1.73;
		Ricardo.weight = 63;
		double bmi = Ricardo.BMI();
		System.out.println(bmi);
		
		//使用BMI2靜態方法
		People Spencer = new People();
		double bmi2 = People.BMI2(1.69, 65);
		System.out.println(bmi2);
		
		
		System.out.println(String.join("l", "s", "s", "a", "q", "e", "r"));
		
		
		

	}

}
