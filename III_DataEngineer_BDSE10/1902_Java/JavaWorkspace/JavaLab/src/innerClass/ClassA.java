package innerClass;

import org.w3c.dom.css.Counter;

public class ClassA {

	///////// 設置計數器
	private int counter = 0;

	private class ExampleInnerClass {
		public int Add() {
			counter = counter + 1;
			return counter;
			// 亦可寫成 counter = ++counter
		}
	}
	/////////// 計數器設置完成

	// 新建一個方法以使用建立private class中的Add方法
	public void increment() {
		ExampleInnerClass innerlass = new ExampleInnerClass();
		innerlass.Add();
		System.out.println(counter);
	}

	// 老樣子的main方法，作為整個程式的進入點
	public static void main(String[] args) {
		// ExampleInnerClass abs = new ExampleInnerClass(); 是不行在main方法中直接new Innerclass的，有替代方案可以達成這點，但一般不使用。
		
		ClassA classA = new ClassA();
		classA.increment(); // 使用新建立，在與ExampleInnerClass中的Add方法

	}

}
