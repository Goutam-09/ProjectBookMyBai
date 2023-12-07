package com.app.bean;

public class Cleaning {
	private int propertyRate;
	private int regularShift;
	private int weeklyShift;
	private int monthlyShift;
	private int adhocShift;
	
	public Cleaning() {
		super();
	}

	public int getPropertyRate() {
		return propertyRate;
	}

	public void setPropertyRate(int propertyRate) {
		this.propertyRate = propertyRate;
	}

	public int getRegularShift() {
		return regularShift;
	}

	public void setRegularShift(int regularShift) {
		this.regularShift = regularShift;
	}

	public int getWeeklyShift() {
		return weeklyShift;
	}

	public void setWeeklyShift(int weeklyShift) {
		this.weeklyShift = weeklyShift;
	}

	public int getMonthlyShift() {
		return monthlyShift;
	}

	public void setMonthlyShift(int monthlyShift) {
		this.monthlyShift = monthlyShift;
	}

	public int getAdhocShift() {
		return adhocShift;
	}

	public void setAdhocShift(int adhocShift) {
		this.adhocShift = adhocShift;
	}

	@Override
	public String toString() {
		return "Cleaning [propertyRate=" + propertyRate + ", regularShift=" + regularShift + ", weeklyShift="
				+ weeklyShift + ", monthlyShift=" + monthlyShift + ", adhocShift=" + adhocShift + "]";
	}
	
}
