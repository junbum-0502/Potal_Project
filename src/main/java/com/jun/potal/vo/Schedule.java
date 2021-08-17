package com.jun.potal.vo;

public class Schedule {

	private int cIdx;
	private int userId;
	private String title;
	private String time;
	private String pName;
	private String sName;
	private String classRoom;
	private int proId;
	
	@Override
	public String toString() {
		return "Schedule [cIdx=" + cIdx + ", userId=" + userId + ", title=" + title + ", time=" + time + ", pName="
				+ pName + ", sName=" + sName + ", classRoom=" + classRoom + ", proId=" + proId + "]";
	}

	public int getcIdx() {
		return cIdx;
	}

	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getClassRoom() {
		return classRoom;
	}

	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}
	
	
	
	
}
