package interFace;

import java.util.Date;
import java.util.GregorianCalendar;

public class Product {

	protected String name;
	protected int price;
	static String label = "1333333";

	// 以下是Getters & Setters 的部分
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
	// 以上是Getters & Setters 的部分

	public Product() {

	}
	//建構一個不需給入值的Product方法，以供繼承使用。

	public Product(String name, int price) {
		this.name = name;
		this.price = price;
	}
	//建構一個不需給入兩個參數的Product方法，以供繼承使用。

	public String Description() {
		return name + ", price=" + price;
	}
	//建構一個供繼承&覆寫使用的方法
	
	
	//public abstract int refund(int price);
	// 但也需在call新增abstract成為abstract類別

	
	public static Date getTime(int year, int month, int day) {
		GregorianCalendar calendar = new GregorianCalendar(year, month, day);
		return calendar.getTime();
	}
	//將Date建置成一個固定需要使用的物件，給予年月日值之後固定回傳。

}
