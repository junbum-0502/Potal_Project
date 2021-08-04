package com.jun.potal.vo;

import java.util.Date;

public class Notice {

	private int nIdx;
	private int mIdx;
	private int userId;
	private Date regDate;
	private String title;
	private String content;
	private int views;
	
	
	public int getnIdx() {
		return nIdx;
	}
	public void setnIdx(int nIdx) {
		this.nIdx = nIdx;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	@Override
	public String toString() {
		return "Notice [nIdx=" + nIdx + ", mIdx=" + mIdx + ", userId=" + userId + ", regDate=" + regDate + ", title="
				+ title + ", content=" + content + ", views=" + views + "]";
	}
	
	
}
