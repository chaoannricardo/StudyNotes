package Interface190128;

import java.util.Date;
import java.util.GregorianCalendar;

import javax.print.attribute.TextSyntax;

public class Product{
	
	private String name;
	private int price;
	//若是protected，則就同個package，以及subclass皆能看見。(比預設再高一級)
	
	//product的建構方法
	public Product(){
		
	};
	public Product(String name, int price) {
		this.name = name;
		this.price = price;
	}
	
	
	//利用Getters&Setters
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
	
	//description
	public String description() {
		return name + ", 價格是" + price + ", "; 
	}
	
	//測試static block
	public static double whatever;
	 static {
		 whatever = 100;
		 //System.out.println("測試static block");
	 }
	 
	 //實作簡易getDate方法
	public static Date getDate(int year, int month, int day) {
		GregorianCalendar a = new GregorianCalendar(year, month, day);
		return a.getTime();
	}
	 
	

}
