package inheritance;

//ctrl+1
public class Notebook extends Product {

	public int warranty;
	
	public Notebook(String name, int price, int warranty) {
		//this.name = name;
		//this.price = price;
		//setName(name);
		//setPrice(price);
		//super();
		super(name, price);
		this.warranty = warranty;
	}

	
	public String description() {
		//alt+shit + l;
		//System.out.println("AAA");
		String description = super.description();
		return description +",過保="+warranty;
	}


	
	public int refund() {
		return 0;
	}
	
}








