package interFace;

import java.util.Date;
import java.util.GregorianCalendar;

import org.omg.CORBA.PUBLIC_MEMBER;

public class TestProduct {

	public static void main(String[] args) {

		// 使用Overide之前的方法
		Product orange = new Product();
		orange.name = "orange";
		orange.price = 100;
		// System.out.println(orange.Description());

		// 使用Override之後的方法
		Notebook dell = new Notebook("DellXPS", 40000, 200);
		// System.out.println(dell.Description());

		Notebook asus = new Notebook("Zenbook", 30000, 300);
		// System.out.println(asus.Description());

		// 測試static修飾子在程式裡的影響
		Product apple = new Product();
		// System.out.println(apple.label);

		// 測試多型的第一種狀況(Polymorphism)
		// 關於多型的新玩法(挺重要)
		Product aasus = new Notebook("Zenbook", 30000, 300);
		// System.out.println(aasus.name);
		// System.out.println(aasus.price);

		// 新增另一個under在food之下的product
		GregorianCalendar calendar = new GregorianCalendar(2019, 0, 25, 16, 20);
		Product applejuice = new Food("applejuice", 250, Product.getTime(2019, 2, 28));

		// 新增一個Simcard物件
		Product simcard0 = new SimCard("中國聯通", 700, Product.getTime(2019, 0, 1));

		//檢查是否有商品過期
		Product[] items = { apple, simcard0, applejuice, aasus, dell, asus };
		for (int i = 0; i < items.length; i++) {
			Product a = items[i];
			// System.out.println(item.Description());
			if (a instanceof Expirable) {
				checkExpireDate((Expirable) a);
			}
		}

		Product baasus = new Notebook("Zenbook", 30000, 300);
		
		//測試getClass
		//System.out.println(aasus.getClass());

		// 如果要從父類別轉回變成子類別，則所需花費的工夫變大，需額外加括號及子類別名稱
		Notebook abs = (Notebook) baasus;

		// 測試新建里的checkExpireDate方法
		// checkExpireDate((Expirable) simcard0);
		// checkExpireDate((Expirable)applejuice);

		///// 測試 Anonymous Class
		Lawyer newlawyer = new Lawyer() {

			@Override
			public void LegalAction() {
				// TODO Auto-generated method stub

			}
		};

		Expirable newexpiredate = new Expirable() {

			@Override
			public Date Expiredate() {
				return Product.getTime(2019, 01, 05);
			}
		};
		///// 測試 Anonymous Class結束
		
		//測試Object
		Object newobject = baasus;

	}

	// 建一個方法來檢測物品是否過期，需注意：
	// 1.使用Expirable介面 2.利用"."來叫出之後的性質3.利用before, after來判斷日期 4.new Date()來表示現在的時間
	public static void checkExpireDate(Expirable date) {
		if (date.Expiredate().after(new Date())) {
			System.out.println("尚未過期");
		} else {
			System.out.println("已經過期");
		}
	}

}
