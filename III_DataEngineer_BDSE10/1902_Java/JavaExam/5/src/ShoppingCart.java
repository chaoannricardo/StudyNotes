import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

public class ShoppingCart {
	public static void main(String[] args) {

		// 實作1.加入二台Notebook("Asus",30000),Notebook("Acer",20000),Food("Cookie",200)到shoppingList中
		List<Product> shoppingList = new ArrayList<Product>();

		shoppingList.add(new Notebook("Asus", 30000));
		shoppingList.add(new Notebook("Acer", 20000));
		shoppingList.add(new Food("Cookie", 200));

		// 實作2.利用for迴圈，計算shoppingList中的總金額,並印在Console中
		long shoppingsum = 0;
		for (Product product : shoppingList) {
			shoppingsum = shoppingsum + product.getPrice();
		}
		System.out.println(shoppingsum);

		// 實作3.利用for迴圈，計算shoppingList中是Notebook型態的總金額,並印在Console中
		long shoppingsum4notebook = 0;
		for (Product product : shoppingList) {
			if (product instanceof Notebook) {
				shoppingsum4notebook = shoppingsum4notebook + product.getPrice();
			}
		}
		System.out.println(shoppingsum4notebook);
		
	}

}
