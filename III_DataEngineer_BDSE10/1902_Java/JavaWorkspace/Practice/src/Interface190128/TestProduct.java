package Interface190128;

import java.io.ObjectInputStream.GetField;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;

public class TestProduct {

	public static void main(String[] args) {
		
		Notebook Asus = new Notebook("Asus", 40000, 40000);
		Notebook Acer = new Notebook("Acer", 30000, 30000);
		GregorianCalendar meatdate = new GregorianCalendar(2019,0,28);
		Food meat = new Food("meat", 100, meatdate.getTime());
		GregorianCalendar milkdate = new GregorianCalendar(2019,2,25);
		Food milk = new Food("milk", 50, milkdate.getTime());
		GregorianCalendar vegdate = new GregorianCalendar(2019,0,27);
		Food veg = new Food("vegetable", 200, vegdate.getTime());
		Notebook Lenovo = new Notebook("Lenovo", 35000, 35000);
		Notebook Dell = new Notebook("Dell", 50000, 50000);
		GregorianCalendar yogurtdate = new GregorianCalendar(2019,1,15);
		Food yogurt = new Food("yogurt", 300, yogurtdate.getTime());	
		////System.out.println(Asus.description());
		
		//以下開始測試多型Polymorphism
		Product item0 = Asus;
		Product item1 = Acer;
		Product item2 = meat;
		Product item3 = milk;
		Product item4 = veg;
		Product item5 = Lenovo;
		Product item6 = Dell;
		Product item7 = yogurt;		
		////System.out.println(item0.description());
		////System.out.println(item3.description());
		//雖然呼叫得為父類別的decription方法，但因為實際上物件的類別為Notebook及Food，
		//因此所使用的description方法還是Notebook的decription方法。
		
		//使用Product Array來印資料，可以直接把所有資料印出來
		Product[] items = {item0, item1, item2, item3, item4, item5, item6, item7};
		for (Product product : items) {
			//System.out.println(product.description());
		}
		//檢查是否有東西過期
		for (int i = 0; i < items.length; i++) {
			Product check = items[i];
			if (check instanceof Expirable) {
				checkExpireDate((Expirable) check); 
			}
		}
			
		//強制轉型
		Notebook item00 = (Notebook)item0;
		
		//檢查是否為指定型別
		//System.out.println(item0 instanceof Notebook);
		//System.out.println(item0 instanceof Product);
		//System.out.println(item2 instanceof Food);
		
		
		//測試static block
		Product whateverevr = new Product();
		////System.out.println(whateverevr.whatever);
		//可見之static block 至少會被執行一次，並且值中的東西皆會被印出來(因執行sysout)
		//static方法無法呼叫物件方法
		

	}

	//檢查是否有過期的方法
	public static void checkExpireDate(Expirable date) {
		if (date.expireDate().before(new Date())) {
			System.out.println("已經過期");
		}else {
			System.out.println("尚未過期");
		}
	}
}
