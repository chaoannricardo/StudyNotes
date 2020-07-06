package javaBook;

public class Chapter8 {

	String house;
	int asset;
	double reputation;
	static int a = 25;
	
	public static void main(String[] args) {

		//建立物件陣列
		Chapter8[] Ricardo = new Chapter8[100];
		
		for (int i = 0; i < Ricardo.length; i++) {
			Ricardo[i] = new Chapter8();
			Ricardo[i].asset = new Chapter8().asset;
			Ricardo[i].house = new Chapter8().house;
			Ricardo[i].reputation = new Chapter8().reputation;
			Ricardo[i].asset = 1000000 + i;
			Ricardo[i].house = "趙氏住宅" + i;
			Ricardo[i].reputation = 100 * i;
		}
		
		for (int i = 1; i < Ricardo.length; i++) {
			//System.out.println(Ricardo[i].house);
		}
		
		

	}
	
	
	public void callByValue(int a) {
		a++;
	}

}
