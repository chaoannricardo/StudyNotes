package Collection;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

public class TestNote {

	public static void main(String[] args) {
		//測試Generic所寫的方法
		Note<String> test0 = new Note<>("HAO123");
		Note<Integer> test1 = new Note<>(123456789);
		System.out.println(test0.getContent());
		System.out.println(test1.getContent());
		
		//測試Generic方法(Array.asList)，記得Alt+Shift+L
		List<String> TestArraysList0 = Arrays.asList("HAO123", "HAO456", "HAO789");
		List<Integer> TestArraysList1 = Arrays.asList(1,2,3,4,5,6);

	}

}
