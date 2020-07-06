package practiceFunc190124;

public class PracticeFuncTest190124 {

	public static void main(String[] args) {
		
		//簡易物件方法
		PracticeFunc Ricardo = new PracticeFunc();
		Ricardo.height = 1.73568;
		Ricardo.weight = 63.548923;
		Ricardo.assetvalue = 100000000000d;
		Ricardo.propertyname = "趙氏住宅";
		//System.out.println(Ricardo.BMI());
		
		//簡易物件方法II
		PracticeFunc Spencer = new PracticeFunc();
		Spencer.height = 1.72656565;
		Spencer.weight = 65.216464;
		Spencer.assetvalue = 99999999d;
		Spencer.propertyname = "也是趙氏住宅";
		//System.out.println(Spencer.propertyname);
		//一般的方法及屬性是建立在有物件才存在
		
		
		//靜態方法應用
		//System.out.println(PracticeFunc.KBMI(2, 80));
		//靜態方法不建議用物件呼叫(重要)，要用class做呼叫
		
		
		//試驗使用一般方法呼叫靜態方法
		//System.out.println(Ricardo.PBMI());
		

	}

}
