package array;

public class TestArray {

	public static void main(String[] args) {
		
		int[] ages = new int[10]; //10個int元素可以放在列中
		ages[0] = 1; 
		ages[1] = 2;
//		System.out.println(ages[9]);
//		System.out.println(ages[10]);
		
		Employee[] emps = new Employee[10];
		emps[0] = new Employee();
		Employee emp2 = emps[0];	
		emp2.name = "vincent";
		emps[0].name = "vincent";
		
		
		
		
	}

}
