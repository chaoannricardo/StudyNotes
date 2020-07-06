package inheritance;

import java.util.GregorianCalendar;

public class TestProduct {

	public static void main(String[] args) {
			
	// Product product = new Product();
	 
	 Product notebook = new Notebook("Asus",1000,365);
	 
	 GregorianCalendar calendar = new GregorianCalendar(2019,2,10);
	 Product food =  new Food("肉鬆", 200, calendar.getTime());

	 Product[] items = {notebook,food};
	 

	 for (int i = 0; i < items.length; i++) {
		Product item = items[i];
		System.out.println(item.description());
	 }
	 
	 Product item1 = new Notebook("Asus",1000,365);
	 Notebook nb = (Notebook)item1;
	 System.out.println(nb.warranty);
	 	 
	 	
	}

}
