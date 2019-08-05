
public class Manager extends Employee{

	private long bonus;

	public Manager(int empno, String name, long salary, long bonus) {
		super();
		this.bonus = bonus;
		setEmpno(empno);
		setName(name);
		setSalary(salary);
	}
	
	@Override
	public long getSalary() {
		long totalSalary = super.getSalary();
		totalSalary = totalSalary + bonus;
		return totalSalary;
	}
	
	
}
