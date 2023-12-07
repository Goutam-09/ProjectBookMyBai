package com.app.bean;

public class DayCare {
	private int childCareRate;
	private int elderlyCareRate;
	private int hourRate;
	public DayCare() {
		super();
	}
	public int getChildCareRate() {
		return childCareRate;
	}
	public void setChildCareRate(int childCareRate) {
		this.childCareRate = childCareRate;
	}
	public int getElderlyCareRate() {
		return elderlyCareRate;
	}
	public void setElderlyCareRate(int elderlyCareRate) {
		this.elderlyCareRate = elderlyCareRate;
	}
	public int getHourRate() {
		return hourRate;
	}
	public void setHourRate(int hourRate) {
		this.hourRate = hourRate;
	}
	@Override
	public String toString() {
		return "DayCare [childCareRate=" + childCareRate + ", elderlyCareRate=" + elderlyCareRate + ", hourRate="
				+ hourRate + "]";
	}
	
	
}
