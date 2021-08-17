package com.jun.potal.vo;

import java.util.Date;

public class User {

	private int userId;
	private int mIdx;
	private String password;
	private String name;
	private String email;
	private String phone;
	private int type;
	private Date regdate;
	private String birth;
	private int isLeave;
	private int sIdx;
	private int pIdx;
	private int semester;
	
	
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", mIdx=" + mIdx + ", password=" + password + ", name=" + name + ", email="
				+ email + ", phone=" + phone + ", type=" + type + ", regdate=" + regdate + ", birth=" + birth
				+ ", isLeave=" + isLeave + ", sIdx=" + sIdx + ", pIdx=" + pIdx + ", semester=" + semester + "]";
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getmIdx() {
		return mIdx;
	}

	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	
	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getIsLeave() {
		return isLeave;
	}

	public void setIsLeave(int isLeave) {
		this.isLeave = isLeave;
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	public int getpIdx() {
		return pIdx;
	}

	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}
	
	
	
}

