import PackageTest190121.PackageTest190121;

public class PracticeII190121 {

	public static void main(String[] args) {
		
		System.out.println("Package Import 測試");
		PackageTest190121 CLN = new PackageTest190121();
		System.out.println("Clinic" + CLN.ClinicName);
		CLN.ClinicName = "還是劉耳鼻喉科阿";
		CLN.StreetNo = 15;
		System.out.println(CLN.ClinicName);
		System.out.println(CLN.StreetNo);
	
		
	}

}
