package Interface190128;

public class Notebook extends Product implements Warrantable {

	// public String name;
	// public int price;
	// 直接繼承父類別即可。

	public int warranty;

	public Notebook(String name, int price, int warranty) {
		super(name, price); // 利用super繼承了父類別的建構方法。
		// setName(name);
		// setPrice(price);
		this.warranty = warranty;

	}

	// Notebook的description函式
	public String description() {
		String ddddescription = super.description();
		ddddescription = ddddescription + "保固時間是" + Warranty() + "天";
		return ddddescription;

	}

	// 實作介面Warranty
	@Override
	public int Warranty() {
		// TODO Auto-generated method stub
		return this.warranty;
	}

}
