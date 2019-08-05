import java.math.BigDecimal;


public class TestPrecision {
	//說明電腦精度問題,從4分02秒開始
	//https://www.youtube.com/watch?v=Y2vC3G8qVxw
	public static void main(String[] args) {
		
//		double val = 0;
//		for(int i=0;i<10;i++) {
//			val+=0.1;
//		    System.out.println(val);
//		}
		
		BigDecimal val1 = new BigDecimal("0");
		for(int i=0;i<10;i++) {
			val1 = val1.add(new BigDecimal("0.1"));
		   System.out.println(val1);
		}

	}

}
