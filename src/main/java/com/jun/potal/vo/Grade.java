package com.jun.potal.vo;

import java.util.Date;

public class Grade {

	private int cIdx; // 수업번호
	private int userId;
	private int proId;
	private Date regdate;
	private int midScore;
	private int finalScore;
	private int score;
	private String grade;
	private String name;
	private String yearSemester;
	private int credit;
	
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
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getMidScore() {
		return midScore;
	}
	public void setMidScore(int midScore) {
		this.midScore = midScore;
	}
	public int getFinalScore() {
		return finalScore;
	}
	public void setFinalScore(int finalScore) {
		this.finalScore = finalScore;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getYearSemester() {
		return yearSemester;
	}
	public void setYearSemester(String yearSemester) {
		this.yearSemester = yearSemester;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	@Override
	public String toString() {
		return "Grade [cIdx=" + cIdx + ", userId=" + userId + ", proId=" + proId + ", regdate=" + regdate
				+ ", midScore=" + midScore + ", finalScore=" + finalScore + ", score=" + score + ", grade=" + grade
				+ ", name=" + name + ", yearSemester=" + yearSemester + ", credit=" + credit + "]";
	}
	
	

	
	
	
	
	
	
	
}
