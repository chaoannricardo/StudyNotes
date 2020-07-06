package inheritance;

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

	public Product(String name, int price) {
		this.name = name;
		this.price = price;
	}

	public String Description() {

		return name + ", price=" + price;

	}

	// public abstract int abstracttest(int price);
	// 但也需在call新增abstract成為abstract類別

}
