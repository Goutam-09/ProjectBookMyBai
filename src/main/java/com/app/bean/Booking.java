package com.app.bean;

public class Booking {
	private String bId;
	private String cId;
	private String mId;
	private String maidName;
	private String maidService;
	private String customerName;
	private String customerAddress;
	private Integer totalPayment;
	private String bookigStatus="Pending";
	
	public Booking() {
		super();
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getMaidName() {
		return maidName;
	}

	public void setMaidName(String maidName) {
		this.maidName = maidName;
	}

	public String getMaidService() {
		return maidService;
	}

	public void setMaidService(String maidService) {
		this.maidService = maidService;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}	

	public Integer getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(Integer totalPayment) {
		this.totalPayment = totalPayment;
	}

	public String getBookigStatus() {
		return bookigStatus;
	}

	public void setBookigStatus(String bookigStatus) {
		this.bookigStatus = bookigStatus;
	}

	@Override
	public String toString() {
		return "Booking [bId=" + bId + ", cId=" + cId + ", mId=" + mId + ", maidName=" + maidName + ", maidService="
				+ maidService + ", customerName=" + customerName + ", customerAddress=" + customerAddress
				+ ", totalPayment=" + totalPayment + ", bookigStatus=" + bookigStatus + "]";
	}

}
