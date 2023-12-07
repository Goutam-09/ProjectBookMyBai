package com.app.bean;

public class Maid {
	private String mId;
	private String mName;
	private String mMob;
	private String mGender;
	private String mOccupation;
	private String mRegType;
	private String mPhoto;
	private String mLocality;
	private String mApartment;
	private String verifiedTag="UNVERIFIED";
	private String password;
	public Maid() {
		super();
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	
	public String getmMob() {
		return mMob;
	}
	public void setmMob(String mMob) {
		this.mMob = mMob;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmOccupation() {
		return mOccupation;
	}
	public void setmOccupation(String mOccupation) {
		this.mOccupation = mOccupation;
	}
	public String getmRegType() {
		return mRegType;
	}
	public void setmRegType(String mRegType) {
		this.mRegType = mRegType;
	}
	public String getmPhoto() {
		return mPhoto;
	}
	public void setmPhoto(String mPhoto) {
		this.mPhoto = mPhoto;
	}
	public String getmLocality() {
		return mLocality;
	}
	public void setmLocality(String mLocality) {
		this.mLocality = mLocality;
	}
	public String getmApartment() {
		return mApartment;
	}
	public void setmApartment(String mApartment) {
		this.mApartment = mApartment;
	}
	public String getVerifiedTag() {
		return verifiedTag;
	}
	public void setVerifiedTag(String verifiedTag) {
		this.verifiedTag = verifiedTag;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Maid [mId=" + mId + ", mName=" + mName + ", mMob=" + mMob + ", mGender=" + mGender + ", mOccupation="
				+ mOccupation + ", mRegType=" + mRegType + ", mPhoto=" + mPhoto + ", mLocality=" + mLocality
				+ ", mApartment=" + mApartment + ", verifiedTag=" + verifiedTag + ", password=" + password + "]";
	}
	
	
}
