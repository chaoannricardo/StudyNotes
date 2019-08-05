package inheritance;

public class TestProduct {

	public static void main(String[] args) {
			
	// Product product = new Product();
	 
	 Product product = new Notebook("Asus",1000,365);
	 Product food =  new Food("肉鬆", 200, "2019-02-10");
	 
	 System.out.println(product.description());
		
	}

}
