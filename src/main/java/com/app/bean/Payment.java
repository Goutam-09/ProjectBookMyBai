package com.app.bean;

public class Payment {
	private String pId;
	private String cId;
	private String name;
	private String accNumber;
	private String expDate;
	private String cvvNumber;
	private String payment="Successfull";
	private String bookingStatus = "Pending";
	
	public Payment() {
		super();
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccNumber() {
		return accNumber;
	}

	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}

	public String getExpDate() {
		return expDate;
	}

	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}

	public String getCvvNumber() {
		return cvvNumber;
	}

	public void setCvvNumber(String cvvNumber) {
		this.cvvNumber = cvvNumber;
	}
	
	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getBookingStatus() {
		return bookingStatus;
	}

	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	@Override
	public String toString() {
		return "Payment [pId=" + pId + ", cId=" + cId + ", name=" + name + ", accNumber=" + accNumber + ", expDate="
				+ expDate + ", cvvNumber=" + cvvNumber + ", bookingStatus=" + bookingStatus + "]";
	}

}
