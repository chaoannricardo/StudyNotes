package encap;

public class Car {
	
	private String model;
	private int price;
	
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
		//邏輯
		if ( model.equals("Yaris")) {
			this.price = 575000;
		}else if (model.equals("Prius")){
			this.price = 1090000;
		}else {
			System.out.println("Error type");
		}
	}
	public int getPrice() {
		return price;
	}
	
	
}
