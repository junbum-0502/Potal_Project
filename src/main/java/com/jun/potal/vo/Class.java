package com.jun.potal.vo;

public class Class {

	private int cIdx;
	private int userId;
	private String title;
	private String content;
	private int lCnt; // 수강인원
	private int fCnt; // 수강정원
	private int levels; // 학년
	private int semester; // 학기
	private int time; // 수업시간
	private int sIdx; // 학번
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getlCnt() {
		return lCnt;
	}
	public void setlCnt(int lCnt) {
		this.lCnt = lCnt;
	}
	public int getfCnt() {
		return fCnt;
	}
	public void setfCnt(int fCnt) {
		this.fCnt = fCnt;
	}
	public int getLevels() {
		return levels;
	}
	public void setLevels(int levels) {
		this.levels = levels;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	@Override
	public String toString() {
		return "Class [cIdx=" + cIdx + ", userId=" + userId + ", title=" + title + ", content=" + content + ", lCnt="
				+ lCnt + ", fCnt=" + fCnt + ", levels=" + levels + ", semester=" + semester + ", time=" + time
				+ ", sIdx=" + sIdx + "]";
	}

	
	
	
	
	
	
	
}
