package arrayPackage;



import org.omg.CORBA.PUBLIC_MEMBER;

public class array190121 {

	String name;
	int asset;

	public static void main(String[] args) {

		// 基本資料型別陣列，最普通的int一維陣列
		int[] simplearray = new int[10]; // 建立新的array叫simplearray並有十個元素
		// 物件參考變數陣列
		array190121[] simplearray2 = new array190121[20];

		// 使用大括號產生陣列並指定初值
		int[] simplearray3 = { 1, 2, 3, 4, 5, 6, 7 };
		String[] simplearray4 = { "Ricardo", "Tom", "Kevin", "Alexis" };

		// length以取得陣列長度
		// System.out.println(simplearray3.length);
		// System.out.println(simplearray4.length);

		// 更改元素的值
		simplearray4[3] = "RicardoII";
		// System.out.println(simplearray4[3]);

		// 基本資料型別陣列
		int number[] = new int[10];
		number[0] = 100;
		number[1] = 101;
		number[2] = 102;
		// System.out.println(number[2]);
		// System.out.println(number[9]); //未給定值因此是null，也就是0

		// 物件參考變數陣列：第一種方法
		array190121[] complicatedarray = new array190121[10];
		complicatedarray[0] = new array190121();
		complicatedarray[0].name = "Ricardo";
		complicatedarray[0].asset = 100000000;
		// System.out.println(complicatedarray[0].name);

		// 物件參考變數陣列：第二種方法
		array190121 pointer = new array190121();
		complicatedarray[1] = pointer;
		pointer.name = "Richard";
		pointer.asset = 100000000;
		// System.out.println(pointer.asset);

		// 最簡單的int二維陣列
		int[][] tdarray = new int[5][4];
		int[][] td2array = { { 1, 2, 3 }, { 4, 5, 6 } };
		// System.out.println(td2array.length);
		// System.out.println(td2array[1].length);
		// System.out.println(td2array[1][0]);

		// 再練習一次九九乘法表
		for (int i = 0; i < 10;) {
			for (int j = 0; j < 10; j++) {
				// System.out.print(i + "X" + j + "=" + i*j + " ");
			}
			i++;
			// System.out.println();
		}

		// 列印二維陣列
		int[][] td3array = { { 1, 2, 3 }, { 4, 5, 6 } };
		for (int i = 0; i < 2;) {
			for (int j = 0; j < 3; j++) {
				// System.out.print(td3array[i][j]);
			}
			// System.out.println();
			i++;
		}

		// 列印二維陣列：注意第二列少一個元素
		int[][] td4array = { { 7, 8, 9 }, { 10, 11 } };
		for (int i = 0; i < td4array.length;) {
			for (int j = 0; j < td4array[i].length; j++) {
				// System.out.print(td4array[i][j]);
			}
			// System.out.println();
			i++;
		}

		// lab: 產生一個簡單的int陣列
		int[][] td5array = { { 1, 2, 3 }, { 4, 5, 6 } };

		// lab: 利用迴圈計算總和
		int sum = 0;
		int[][] td6array = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };
		for (int i = 0; i < td6array.length;) {
			for (int j = 0; j < td6array[i].length; j++) {
				sum = sum + td6array[i][j];
			}
			i++;
		}
		//System.out.println(sum);

		// 列印出陣列中的最大值及最小值
		double[] td7array = {1.1, 2.0, 1.2, 1.4, 0.5, 6.0};
		double max = 0;
		double  min = 99;
		double average = 0;
		for (int i = 0; i < td7array.length; i++) {
			if (td7array[i] < min) {
				min = td7array[i];
			}
			if (td7array[i] > max) {
				max = td7array[i];
			}
			average = average + td7array[i];
		}
		average = average / td7array.length;
		//System.out.println("最大值是" + max);
		//System.out.println("最小值是" + min);
		//System.out.println("平均值是" + average);
		
		//lab: 做出四層聖誕樹
		String[][] td8array = {{"    *    "},{"   ***   "},{"  *****  "},{" ******* "},{"*********"},{"   |||   "}};
		for (int i = 0; i < td8array.length; i++) {
			for (int j = 0; j < td8array[i].length; j++) {
				//System.out.print(td8array[i][j]);
			}
			//System.out.println();
		}

		
		//lab: 做出無限層聖誕樹
		int c = 10;
		int max1 = 2 * c - 1 ;
		
		for (int i = 0; i < ( c + 1 ); i++) {
			//輸出空格
			for (int j = 0; j < max1; j++) {
				
			}
		
			
			
		}
		
		
		
		
		
		
		
		
		
	}

}
