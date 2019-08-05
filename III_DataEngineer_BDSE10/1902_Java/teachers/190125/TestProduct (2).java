package inheritance;

public class TestProduct {

	public static void main(String[] args) {
			
	// Product product = new Product();
	 
	 Product notebook = new Notebook("Asus",1000,365);
	 Product food =  new Food("肉鬆", 200, "2019-02-10");
	 
	 Product[] items = {notebook,food};
	 for (int i = 0; i < items.length; i++) {
		Product item = items[i];
		System.out.println(item.description());
	 }
	 
	 
	 //System.out.println(notebook.warranty);
	 
	 	
	}

}
