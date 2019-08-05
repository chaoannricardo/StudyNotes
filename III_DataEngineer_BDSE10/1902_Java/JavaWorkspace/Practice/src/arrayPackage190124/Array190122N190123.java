package arrayPackage190124;

import org.omg.CORBA.PUBLIC_MEMBER;

public class Array190122N190123 {

	String name;
	int asset;
	double reputation;
	

	public static void main(String[] args) {

		// 基本資料型別陣列，最普通的int一維陣列
		int[] simplearray = new int[10]; // 建立新的array叫simplearray並有十個元素
		// 物件參考變數陣列
		Array190122N190123[] simplearray2 = new Array190122N190123[20];

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
		Array190122N190123[] complicatedarray = new Array190122N190123[10];
		complicatedarray[0] = new Array190122N190123();
		complicatedarray[0].name = "Ricardo";
		complicatedarray[0].asset = 100000000;
		// System.out.println(complicatedarray[0].name);

		// 物件參考變數陣列：第二種方法
		Array190122N190123 pointer = new Array190122N190123();
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
		// System.out.println(sum);

		// 列印出陣列中的最大值及最小值
		double[] td7array = { 1.1, 2.0, 1.2, 1.4, 0.5, 6.0 };
		double max = 0;
		double min = 99;
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
		// System.out.println("最大值是" + max);
		// System.out.println("最小值是" + min);
		// System.out.println("平均值是" + average);

		// lab: 做出四層聖誕樹
		String[][] td8array = { { "    *    " }, { "   ***   " }, { "  *****  " }, { " ******* " }, { "*********" },
				{ "   |||   " } };
		for (int i = 0; i < td8array.length; i++) {
			for (int j = 0; j < td8array[i].length; j++) {
				// System.out.print(td8array[i][j]);
			}
			// System.out.println();
		}

		// 以下開始是1/24的練習

		// 以下為來自(http://dic.vbird.tw/java/unit07.php)的練習題目
		// 假設你要讓使用者輸入 X 與 Y 軸，然後透過以雙層迴圈的行為， 輸出一個矩形的星號圖示，該如何處理？
		int x = 10;
		int y = 10;
		for (int i = 1; i < (x + 1); i++) {
			for (int j = 1; j < (y + 1); j++) {
				// System.out.print("*");
			}
			// System.out.println(i);
		}

		// 寫一個可以繪製出直角三角形，讓使用者輸入一個數值來處理喔！
		int a = 10; // 直角三角形的層數
		for (int i = 1; i < (a + 1); i++) { // 若未到達規定的層數，則迴圈必須繼續運行
			for (int j = 1; j < (i + 1); j++) {
				// 輸出*(該層"*"的數量，與當時的層數數目值相等。)
				// System.out.print( "*" );
			}
			// System.out.println(i); //檢查用，檢查直角三角形的層數是否和指定的相符。
		}

		//終於要來挑戰聖誕樹了！！！！
		int c = 10; //先指定聖誕樹的層數
		for (int i = 1; i < (c + 1); i++) { //在聖誕樹還未達指定的層數時，不能停止運行。
			for (int j = 1; j < (c - i + 1); j++) { //每一層聖誕樹的空白及*的總和，恰為層數-1，因此要不小於層數。
				//先來印個空白吧
				//System.out.print(" ");
			}
			//接下來來研究如何印出聖誕樹的"*"
			for (int j = 1; j < (2 * i); j++) {
				//System.out.print("*");
			}
			
			//System.out.println(i); //當然還是要來換個行，順便做個編號
			
		} //好啦那我成功了！！！！！！！！
		
		
		
		
		
		
		
	}

}
