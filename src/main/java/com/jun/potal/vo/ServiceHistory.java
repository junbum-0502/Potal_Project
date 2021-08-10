package com.jun.potal.vo;

import java.util.Date;

public class ServiceHistory {

	private int sIdx;
	private int userId;
	private int mId;
	private int allow;
	private Date regDate;
	private int stIdx;
	
	public ServiceHistory() {
		
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public int getAllow() {
		return allow;
	}

	public void setAllow(int allow) {
		this.allow = allow;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	

	public int getStIdx() {
		return stIdx;
	}

	public void setStIdx(int stIdx) {
		this.stIdx = stIdx;
	}

	@Override
	public String toString() {
		return "ServiceHistory [sIdx=" + sIdx + ", userId=" + userId + ", mId=" + mId + ", allow=" + allow
				+ ", regDate=" + regDate + ", stIdx=" + stIdx + "]";
	}

	
	
	
}
