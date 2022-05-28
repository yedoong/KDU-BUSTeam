package pay;

public class Pay {
	private String studentID;
	private String pay_bus_location;
	private String date;
	private String merchant_uid;
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getPay_bus_location() {
		return pay_bus_location;
	}
	public void setPay_bus_location(String pay_bus_location) {
		this.pay_bus_location = pay_bus_location;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

}