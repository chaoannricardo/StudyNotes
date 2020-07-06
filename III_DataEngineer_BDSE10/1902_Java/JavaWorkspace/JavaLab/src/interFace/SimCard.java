package interFace;

import java.util.Date;

public class SimCard extends Product implements Expirable, Warrantable {

	private Date expireDate;

	public SimCard(String name, int price, Date expireDate) {
		super(name, price);
		this.expireDate = expireDate;
	}
	
	@Override
	public int warranty() {
		// TODO Auto-generated method stub
		return 15;
	}

	@Override
	public Date Expiredate() {
		// TODO Auto-generated method stub
		return this.expireDate;
	}


	
	

}
