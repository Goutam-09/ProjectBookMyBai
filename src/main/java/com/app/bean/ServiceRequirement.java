package com.app.bean;

public class ServiceRequirement {
	private String sId;
	private String cId;
	private String cName;
	private String service;
	private String serviceShift;
	private String serviceStartDate;
	private String serviceEndDate;
	private String timeSlot;
	private String locality;
	public ServiceRequirement() {
		super();
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}	
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getServiceShift() {
		return serviceShift;
	}
	public void setServiceShift(String serviceShift) {
		this.serviceShift = serviceShift;
	}
	public String getServiceStartDate() {
		return serviceStartDate;
	}
	public void setServiceStartDate(String serviceStartDate) {
		this.serviceStartDate = serviceStartDate;
	}	
	public String getServiceEndDate() {
		return serviceEndDate;
	}
	public void setServiceEndDate(String serviceEndDate) {
		this.serviceEndDate = serviceEndDate;
	}
	public String getTimeSlot() {
		return timeSlot;
	}
	public void setTimeSlot(String timeSlot) {
		this.timeSlot = timeSlot;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	@Override
	public String toString() {
		return "ServiceRequirement [sId=" + sId + ", cId=" + cId + ", cName=" + cName + ", service=" + service
				+ ", serviceShift=" + serviceShift + ", serviceStartDate=" + serviceStartDate + ", serviceEndDate="
				+ serviceEndDate + ", timeSlot=" + timeSlot + ", locality=" + locality + "]";
	}
	
}
