package interFace;

import java.util.Date;

public class SimCard extends Product implements Warrantable, Expirable {

	@Override
	public Date 最後使用期限() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int 保固天數() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int refund() {
		return 0;
	}

}
