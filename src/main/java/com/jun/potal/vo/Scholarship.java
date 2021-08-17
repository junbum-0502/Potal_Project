package com.jun.potal.vo;

public class Scholarship {
	
	private int sIdx;
	private int siIdx;
	private int userId;
	private String amount;
	private String semester;
	
	@Override
	public String toString() {
		return "Scholarship [sIdx=" + sIdx + ", siIdx=" + siIdx + ", userId=" + userId + ", amount=" + amount
				+ ", semester=" + semester + "]";
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
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
