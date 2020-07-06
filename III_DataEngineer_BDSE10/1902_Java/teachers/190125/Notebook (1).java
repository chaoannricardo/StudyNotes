package inheritance;

public class Notebook extends Product {

	public int warranty;
	
	public Notebook(String name, int price, int warranty) {
		this.name = name;
		this.price = price;
		//setName(name);
		//setPrice(price);
		this.warranty = warranty;
	}
	
	public String description() {
		
		return name + ",price = " + price +",過保="+warranty;
		
	}

}
