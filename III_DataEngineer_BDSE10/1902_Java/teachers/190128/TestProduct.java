package interFace;

import java.util.Date;

public class TestProduct {

	public static void main(String[] args) {
			
	// Product product = new Product();
	 
	 Product notebook = new Notebook("Asus",1000,365);
	 Date expireDate = Product.getDate(2019, 2, 10);
	 Product food =  new Food("肉鬆", 200,  expireDate  );
	 Product simcard =  new SimCard("日本漫遊", 600,  Product.getDate(2019, 0, 1) );

	 
	 Expirable expireItem = new Expirable() {
		
		@Override
		public Date 最後使用期限() {
			// TODO Auto-generated method stub
			return Product.getDate(2019, 1, 27);
		}
	};
	 
	 checkExpireDate(expireItem);
	 
	 //Product food =  new Food("肉鬆", 200,  Product.getDate(2019, 2, 10)  );
	 
	 Product[] items = {notebook,food,simcard};
	 for (int i = 0; i < items.length; i++) {
		Product item = items[i];
		System.out.println(item.description());
		if ( item instanceof Expirable) {
			checkExpireDate((Expirable)item);
		}
	 }
	
	}
	
	public static void checkExpireDate(Expirable item) {
		if ( item.最後使用期限().after(new Date()) ) {
			System.out.println("尚未過期");
		}else {
			System.out.println("已過期");
		}
		
	}
	
	
	
	
	

}
