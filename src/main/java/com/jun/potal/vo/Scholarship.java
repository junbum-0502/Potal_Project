package com.jun.potal.vo;

public class Scholarship {
	
	private int sIdx;
	private int siIdx;
	private int userId;
	private String amount;
	
	@Override
	public String toString() {
		return "Scholarship [sIdx=" + sIdx + ", siIdx=" + siIdx + ", userId=" + userId + ", amount=" + amount + "]";
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	public int getSiIdx() {
		return siIdx;
	}

	public void setSiIdx(int siIdx) {
		this.siIdx = siIdx;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
	
}
