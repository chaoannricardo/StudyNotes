package Interface190128;

import java.util.Date;
import java.util.GregorianCalendar;

public class Food extends Product implements Expirable{
	
	//public String name;
	//public int price;
	public Date expireDate;
	
	public Food() {
		
	}
	
	public Food(String name, int price, Date expireDate) {
		setName(name);
		setPrice(price);
		this.expireDate = expireDate;
	}
	
	public String description() {
		String aaadescription = super.description();
		aaadescription = aaadescription + "有效日期是" + expireDate();
		return aaadescription;
	}

	//實作Expirable
	@Override
	public Date expireDate() {
		return this.expireDate;
		
	}
	
	

}
