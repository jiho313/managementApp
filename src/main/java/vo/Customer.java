package vo;

import java.util.Date;

public class Customer {
	
	private String custId;
	private String custPassword;
	private String custName;
	private String custTel;
	private String custEmail;
	private String custDisabled;
	private int custPoint;
	private Date custUpdateDate;
	private Date custCreateDate;
	
	public Customer() {}

	public Customer(String id) {
		this.custId = id;
	}
	
	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustPassword() {
		return custPassword;
	}

	public void setCustPassword(String custPassword) {
		this.custPassword = custPassword;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustTel() {
		return custTel;
	}

	public void setCustTel(String custTel) {
		this.custTel = custTel;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public String getCustDisabled() {
		return custDisabled;
	}

	public void setCustDisabled(String coustDisabled) {
		this.custDisabled = coustDisabled;
	}

	public int getCustPoint() {
		return custPoint;
	}

	public void setCustPoint(int custPoint) {
		this.custPoint = custPoint;
	}

	public Date getCustUpdateDate() {
		return custUpdateDate;
	}

	public void setCustUpdateDate(Date custUpdateDate) {
		this.custUpdateDate = custUpdateDate;
	}

	public Date getCustCreateDate() {
		return custCreateDate;
	}

	public void setCustCreateDate(Date custCreateDate) {
		this.custCreateDate = custCreateDate;
	}
	
	
	

}
