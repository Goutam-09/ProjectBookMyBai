package com.app.bean;

public class Cooking {
	private int nom;
	private int oneshiftrate;
	private int twoshiftrate;
	private int adhoc;
	
	public Cooking() {
		super();
	}
	public int getNom() {
		return nom;
	}
	public void setNom(int nom) {
		this.nom = nom;
	}
	public int getOneshiftrate() {
		return oneshiftrate;
	}
	public void setOneshiftrate(int oneshiftrate) {
		this.oneshiftrate = oneshiftrate;
	}
	public int getTwoshiftrate() {
		return twoshiftrate;
	}
	public void setTwoshiftrate(int twoshiftrate) {
		this.twoshiftrate = twoshiftrate;
	}
	public int getAdhoc() {
		return adhoc;
	}
	public void setAdhoc(int adhoc) {
		this.adhoc = adhoc;
	}
	@Override
	public String toString() {
		return "Cooking [nom=" + nom + ", oneshiftrate=" + oneshiftrate + ", twoshiftrate=" + twoshiftrate + ", adhoc="
				+ adhoc + "]";
	}		
}
