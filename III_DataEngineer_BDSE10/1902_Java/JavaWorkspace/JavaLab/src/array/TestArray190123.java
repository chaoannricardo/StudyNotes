package array;



public class TestArray190123 {

	public static void main(String[] args) {
		
		//陣列
		System.out.println("陣列：第一部分：int陣列");
		int[] age = new int[10];
		age[0] = 234; //陣列的編碼是從0開始
		age[1] = 456;
		age[2] = 789;
		System.out.println(age[0]);
		System.out.println(age[9]); //若無給定值，則預設陣列值為0
		//若超出陣列邊界，則程式無法運作
		
		
		//陣列:使用外部資料(Employee190123.java)
		System.out.println();
		System.out.println("陣列：第二部分");
		
		Employee190123[] emps = new Employee190123[10];
		Employee190123 emp2 = new Employee190123();
		emps[0] = emp2;
		emp2.name = "在Heap區設一個新的位置來";
		System.out.println(emp2.name);
		
		
		emps[0].name = "現在把它重新蓋過去了";
		System.out.println(emps[0].name);
		
		
		emps[1] = new Employee190123();
  		emps[1].name = "所以說在陣列中要新增都必須重新new一次";
  		
  		System.out.println(emps.length);
  		
  		//文字陣列
  		System.out.println();
  		System.out.println("//文字陣列");
  		String[] Ricardo = {"1", "2", "3"};
  		
  		//int陣列
  		System.out.println();
  		System.out.println("int陣列");
  		int[][] a = { {1,2,3} , {4,5,6} }; //列數：2；行數：3
  		System.out.println(a[0][2]);
		
		//雙層迴圈，陣列
  		System.out.println();
  		System.out.println("//雙層迴圈，陣列");
  		for (int i = 0; i <= 1; i++) {  //控制列數
			for (int j = 0; j <= 2; j++) {  //控制行數
				System.out.println(a[i][j]);
			}
		}
		
  	    //雙層迴圈，陣列：缺角、總和
  		System.out.println();
  		System.out.println("//雙層迴圈，陣列：缺角、總和");
  		int sum = 0;
		int[][] b = { {10,11,12} , {13,14}  };
		for (int i = 0; i < b.length; i++) {
			for (int j = 0; j < b[i].length; j++) {
				System.out.println("//印缺角陣列");
				System.out.println(b[i][j]);
				sum = sum + b[i][j];
				System.out.println("//印總和");
				System.out.println(sum);
			}
		}
		
		//進階型for迴圈
		System.out.println();
		System.out.println("進階型for迴圈");
		int[] box = {100,101,102,103};
		for (int c : box) {
			System.out.println(c);
		}
		
		

	}

}
