package com.jun.potal.vo;

import java.util.Date;

public class Rent {

	private int rIdx;
	private int userId;
	private int bIdx;
	private int allow;
	private Date returnDate;
	
	public Rent() {
		
	}

	public int getrIdx() {
		return rIdx;
	}

	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public int getAllow() {
		return allow;
	}

	public void setAllow(int allow) {
		this.allow = allow;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	@Override
	public String toString() {
		return "Rent [rIdx=" + rIdx + ", userId=" + userId + ", bIdx=" + bIdx + ", allow=" + allow + ", returnDate="
				+ returnDate + "]";
	}
	
	
	
}
