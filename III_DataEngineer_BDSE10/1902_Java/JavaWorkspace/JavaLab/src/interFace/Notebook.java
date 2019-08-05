package interFace;

//繼承的屬性就不用再打一遍：同樣會存在在新建的類別中
public class Notebook extends Product implements Warrantable {

	public int warranty;

	//再一次測試super；其中此為呼叫建構方法的應用。
	public Notebook(String name, int price, int warranty) {
		this.name = name; //父類別封裝之後就不能再使用該類別的封裝後的屬性了。
		this.price = price; //但是若protected的話，子類別是可以存取父類別的屬性的。
		//setName(name); //需使用新設的
		//setPrice(price);
		//super(name, price);
		this.warranty = warranty;
	}
	

	//使用super方法，以繼承父類別
	public String Description() {
		//return name + ", price=" + price + ", 保固=" + warranty;	//這是原本copy過來的方法。
		String Description = super.Description();
		return Description + ", 保固=" + this.warranty;
		}


	//使用Warrantable介面
	@Override
	public int warranty() {
		// TODO Auto-generated method stub
		return 0;
	}




}
