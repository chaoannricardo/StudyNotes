package practiceFunc190124;

public class PracticeFunc {

	double height;
	double weight;
	double assetvalue;
	String propertyname;

	// 物件方法
	public double BMI() {
		return weight / (height * height);
	}

	// 靜態方法
	public static double KBMI(double hhh, double www) {
		return www / (hhh * hhh);
	}

	//方法：一般方法呼叫靜態方法
	public double PBMI() {
		return weight / (height * height) + PracticeFunc.KBMI(2, 80);
	}
	
	
	
	
}
