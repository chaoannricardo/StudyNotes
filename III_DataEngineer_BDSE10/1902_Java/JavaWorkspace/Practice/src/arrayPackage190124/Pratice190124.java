package arrayPackage190124;

public class Pratice190124 {

	String notname;
	Double notmoney;
	int notage;

	public static void main(String[] args) {

		// 建立一個簡易的int整數陣列。
		int[] array1 = new int[100];
		array1[0] = 20;
		array1[1] = 21;
		array1[99] = 22;
		// array1[100] = 23;
		/*
		 * 因為在java程式語言中，0為計算序數的起始點， 也因此array[100]已經超出了前先所新設的範圍，在接下來的sysout指令中將無法執行。
		 */
		// System.out.println(array1[100]);
		// System.out.println(array1[99]);

		// 物件參考變數陣列，所使用的物件定義為來自於同package的"Array190122N190123"
		Array190122N190123 array2 = new Array190122N190123();
		array2.name = "Ricardo";
		array2.asset = 100000000;
		array2.reputation = 100.56789;

		// 使用大括號產生陣列並指定初值
		int[] array3 = { 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110 };
		// System.out.println(array3);
		// 這樣列印出的會是label(非記憶體位置)，陣列中每一個變數都是獨立變數，需要一個一個取出再列印。
		// 以下上網查到一種可以列印出陣列全部值的方法
		for (int e : array3) {
			// System.out.print(e + "\t"); //"\t"就是用來補空格的指令，有些複雜就先跳過了。
		}
		// 才發現原來老師上課有教過印出陣列的方法
		for (int i = 0; i < array3.length; i++) {
			// System.out.print(array3[i] + ", ");

		}

		// length以取得陣列長度
		// System.out.println(array3.length);

		// 更改元素的值
		array3[2] = 103;
		// System.out.println(array3[2] == array3[3]);
		// 更改陣列中元素的值，並檢查更改後是否相等

		// 再做一次物件參考變數陣列
		Pratice190124 array4 = new Pratice190124();
		array4.notage = 23;
		array4.notmoney = 100000d;
		array4.notname = "I am not Ricardo";
		// System.out.println(array4.notname);

		// 最簡單的int二維陣列
		int[][] array5 = { { 101, 102, 103, 104, 105, 106 }, { 110, 111, 112, 113, 114, 115 } };
		// System.out.println(array5[0][1]);
		// System.out.println(array5[1][3]);

		// 再練習一次九九乘法表
		for (int i = 1; i < 10;) {
			for (int j = 1; j < 10; j++) {
				// System.out.print(i + "X" + j + "=" + i*j + " ");
			}
			// System.out.println();
			i++;
		}

		// 列印二維陣列
		for (int i = 0; i < array5.length; i++) {
			for (int j = 0; j < array5[i].length; j++) {
				// System.out.print(array5[i][j] + ", ");
			}
			// System.out.println();
		}

		// 列印缺角的二維陣列
		int[][] array6 = { { 101, 102, 103, 104 }, { 111, 112, 113 } };
		for (int i = 0; i < array6.length; i++) {
			for (int j = 0; j < array6[i].length; j++) {
				// System.out.print(array6[i][j] + ", ");
			}
			// System.out.println();
		}

		// 計算陣列總和
		double sum = 0;
		for (int i = 0; i < array6.length; i++) {
			for (int j = 0; j < array6[i].length; j++) {
				sum = sum + array6[i][j];
			}
		}
		// System.out.println(sum);

		// 列印出陣列中的最大值及最小值
		double max = 0;
		double min = 999999;
		for (int i = 0; i < array6.length; i++) {
			for (int j = 0; j < array6[i].length; j++) {
				if (array6[i][j] > max) {
					max = array6[i][j];
				}
				if (array6[i][j] < min) {
					min = array6[i][j];
				}
			}
		}
		// System.out.println(max);
		// System.out.println(min);

		// 來製造個一百層聖誕樹吧
		int ceng = 100;
		for (int i = 1; i < (ceng + 1); i++) { // 設定迴圈須執行的次數
			for (int j = 1; j < ceng - i + 1; j++) { // 先來輸出空格吧
				// System.out.print(" ");
			}
			for (int j = 1; j < i * 2; j++) {
				// System.out.print("*");
			}
			// System.out.println();

		}

		// 練習不夠，來建立一萬層聖誕樹吧
		int ceng2 = 100;
		for (int i = 1; i < (ceng2 + 1); i++) {
			for (int j = 1; j < (ceng2 - i + 1); j++) {
				//System.out.print(" ");
			}
			for (int j = 1; j < (i * 2); j++) {
				// System.out.print("*");
			}
			// System.out.println();
		}
		
		
		//午休回來，自己再做一次聖誕樹
		int ceng3 = 10;
		for (int i = 1; i < (ceng3 + 1); i++) {
			//印出聖誕樹空格的迴圈
			for (int j = 1; j < (ceng3 - i + 1); j++) {
				//System.out.print(" ");
			}
			//印出聖誕樹點點的迴圈
			for (int j = 1; j < ( i * 2 ); j++) {
				//System.out.print("*");
			}
			//換行
			//System.out.println(i);
		}
		
		//再練習做一次聖誕樹
		int ceng4 = 20;
		for (int i = 1; i < (ceng4 + 1); i++) {
			//印出聖誕樹的空格
			for (int j = 1; j < (ceng4 - i + 1); j++) {
				//System.out.print(" ");
			}
			//印出聖誕樹的星號
			for (int j = 1; j < (i * 2); j++) {
				//System.out.print("*");
			}
			//換行，並列出該行是第幾行
			//System.out.println(i);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
