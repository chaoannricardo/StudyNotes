package inheritance;

import java.util.GregorianCalendar;

public class TestProduct {

	public static void main(String[] args) {
		
		//使用Overide之前的方法
		Product orange = new Product();
		orange.name = "orange";
		orange.price = 100;
		//System.out.println(orange.Description());
		
		//使用Override之後的方法
		Notebook dell = new Notebook("DellXPS", 40000, 200);
		//System.out.println(dell.Description());
		
		Notebook asus = new Notebook("Zenbook", 30000, 300);
		//System.out.println(asus.Description());
		
		//測試static修飾子在程式裡的影響
		Product apple = new Product();
		//System.out.println(apple.label);
		
		//測試多型的第一種狀況(Polymorphism)
		//關於多型的新玩法(挺重要)
		Product aasus = new Notebook("Zenbook", 30000, 300);
		//System.out.println(aasus.name);
		//System.out.println(aasus.price);
		
		//新增另一個under在food之下的product
		GregorianCalendar calendar = new GregorianCalendar(2019,0,25,16,20);
		Product applejuice = new Food("applejuice", 250, calendar.getTime());
		
		Product[] items = {aasus, applejuice};
		for (int i = 0; i < items.length; i++) {
			Product item = items[i];
			System.out.println(item.Description());
		}
		
		Product baasus = new Notebook("Zenbook", 30000, 300);
		
		//如果要從父類別轉回變成子類別，則所需花費的工夫變大，需額外加括號及子類別名稱
		Notebook abs = (Notebook)baasus;
		
		
		
		
		
		

		

	}

}
