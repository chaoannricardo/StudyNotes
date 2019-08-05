package func;

public class TestPeople {

	public static void main(String[] args) {
		
		People p = new People();
		p.height = 1.7;
		p.weight = 70;
		//alt + shift + l(local variable)
		//double bmi = people.getBMI();
		
		double bmi2 = p.BMI(1.7, 70);
		
		System.out.println(bmi2);
		
		
		
		
		
		
	}

}
