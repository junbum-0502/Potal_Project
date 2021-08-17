package com.jun.potal.vo;

import java.util.Date;

public class Message {

	private int mIdx;
	private int userId; // 보내는 사람 아이디
	private int rId; // 받는 사람 아이디
	private Date regdate;
	private String content;
	
	@Override
	public String toString() {
		return "Message [mIdx=" + mIdx + ", userId=" + userId + ", rId=" + rId + ", regdate=" + regdate + ", content="
				+ content + "]";
	}
	
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
