package com.app.bean;

public class Customer {
	private String cId;
	private String cName;
	private String roleType="CUSTOMER";
	private String cEmail;
	private String cMob;
	private String cGender;
	private String cPass;
	private String customertype;
	private String propertyType;
	private int propertySize;
	private int noOfFamilyMembers;
	private String serviceRequirement;
	public Customer() {
		super();
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
	public String getRoleType() {
		return roleType;
	}
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getcMob() {
		return cMob;
	}
	public void setcMob(String cMob) {
		this.cMob = cMob;
	}
	public String getcGender() {
		return cGender;
	}
	public void setcGender(String cGender) {
		this.cGender = cGender;
	}
	public String getcPass() {
		return cPass;
	}
	public void setcPass(String cPass) {
		this.cPass = cPass;
	}
	public String getCustomertype() {
		return customertype;
	}
	public void setCustomertype(String customertype) {
		this.customertype = customertype;
	}
	public String getPropertyType() {
		return propertyType;
	}
	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}
	public int getPropertySize() {
		return propertySize;
	}
	public void setPropertySize(int propertySize) {
		this.propertySize = propertySize;
	}
	public int getNoOfFamilyMembers() {
		return noOfFamilyMembers;
	}
	public void setNoOfFamilyMembers(int noOfFamilyMembers) {
		this.noOfFamilyMembers = noOfFamilyMembers;
	}
	public String getServiceRequirement() {
		return serviceRequirement;
	}
	public void setServiceRequirement(String serviceRequirement) {
		this.serviceRequirement = serviceRequirement;
	}
	@Override
	public String toString() {
		return "Customer [cId=" + cId + ", cName=" + cName + ", roleType=" + roleType + ", cEmail=" + cEmail + ", cMob="
				+ cMob + ", cGender=" + cGender + ", cPass=" + cPass + ", customertype=" + customertype
				+ ", propertyType=" + propertyType + ", propertySize=" + propertySize + ", noOfFamilyMembers="
				+ noOfFamilyMembers + ", serviceRequirement=" + serviceRequirement + "]";
	}
	
}
