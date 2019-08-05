package interFace;

public class Superman extends People implements Lawyer, Accountant {
	// 用implements來載入原有的介面方法
	// extends則是用來繼承父類別，即People

	@Override // 因為載入了介面，所以覆寫當中的方法(legalAction)
	public void LegalAction() {
		// TODO Auto-generated method stub

	}

	@Override // 因為載入了介面，所以覆寫當中的方法(Taxreport)
	public void Taxreport() {
		// TODO Auto-generated method stub

	}

	public static void main(String[] args) {
		Superman superman0 = new Superman();
		Lawyer superman1 = new Superman();
		// superman0繼承到了lawyer&accountant兩個介面，以及People這個父類別
		superman0.LegalAction();
		superman0.Taxreport();
		// superman1只有繼承到lawyer的父類別
		superman1.LegalAction();

	}
}
