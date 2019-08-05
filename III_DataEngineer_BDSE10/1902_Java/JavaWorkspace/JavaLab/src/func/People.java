package func;

public class People {

	double height;
	double weight;

	public double BMI() {
		return weight / (height * height);
	}

	public static double BMI2(double height1, double weight1) {
		return weight1 / (height1 * height1);
	}
	
	/* public static double BMI3() {
		return weight1 / (height1 * height1);
	} 不能呼叫上面非靜態的方法及屬性 */

}
