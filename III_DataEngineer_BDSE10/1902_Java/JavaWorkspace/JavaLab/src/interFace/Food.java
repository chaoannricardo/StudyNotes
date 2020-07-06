package interFace;

import java.util.Date;

public class Food extends Product implements Expirable {

	private Date expireDate;

	public Food(String name, int price, Date expireDate) {
		super(name, price);
		this.expireDate = expireDate;
	}
	

	@Override //嘗試"覆寫"繼承來的方法
	public String Description() {
		String description = super.Description();
		description = description + "\r\n到期日：" + expireDate;
		return description;
	}

	@Override // 此為新增Expirable介面得來的屬性
	public Date Expiredate() {
		return this.expireDate;
	}

}
