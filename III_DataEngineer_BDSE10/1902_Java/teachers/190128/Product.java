package interFace;

import java.util.Date;
import java.util.GregorianCalendar;

public abstract class Product {
	
	String name;
	
	int price;
		
	public Product() {
		System.out.println("Product()");
	}

	public Product(String name, int price) {
		this.name = name;
		this.price = price;
		System.out.println("Product(name,price)");

	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String description() {
		return name + ",price = " + price;
		
	}
	
	public abstract int refund();
	
	public static Date getDate(int year,int month,int day) {
		
		GregorianCalendar calendar = new GregorianCalendar(year,month,day);
		return calendar.getTime();
		
	}
	
	
	
}








