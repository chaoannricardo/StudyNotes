package encap;

class Car {

	private String model;
	private int price;
	private char color;

	// 建構方法Constructor
	// 預設值的情況
	public Car() {
		//this.color = 'W';
		//setModel("Yaris");
		this("Yaris", 'W');  //Overloaded Constructors
		System.out.println("系統預設參數");

	}

	// 給車型(給入值)以取得資訊的情況
	public Car(String model, char color) {
		this.color = color;
		setModel(model);

	}

	public char getColor() {
		return color;
	}

	public void setColor(char color) {
		this.color = color;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
		// 邏輯
		if (model.equals("Tercel")) {
			this.price = 500000;
		} else if (model.equals("Yaris")) {
			this.price = 650000;
		} else if (model.equals("Corolla")) {
			this.price = 600000;
		} else if (model.equals("Soluna")) {
			this.price = 700000;
		}
		else {
			System.out.println("錯誤車型");

		}
	}

	public int getPrice() {

		return this.price;

	}

}
