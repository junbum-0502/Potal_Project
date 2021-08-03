package com.jun.potal.vo;

import java.util.Date;

public class Service {

	private int sIdx;
	private int userId;
	private int mId;
	private int allow;
	private String type;
	private Date regDate;
	
	public Service() {
		
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Service [sIdx=" + sIdx + ", userId=" + userId + ", mId=" + mId + ", allow=" + allow + ", type=" + type
				+ ", regDate=" + regDate + "]";
	}
	
	
	
}
