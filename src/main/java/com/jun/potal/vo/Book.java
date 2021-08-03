package com.jun.potal.vo;

import java.util.Date;

public class Book {

	private int bIdx;
	private String title;
	private String author;
	private String publisher;
	private Date open_date;
	private int cnt;
	private int isLoan;
	
	public Book() {
		
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getOpen_date() {
		return open_date;
	}

	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getIsLoan() {
		return isLoan;
	}

	public void setIsLoan(int isLoan) {
		this.isLoan = isLoan;
	}

	@Override
	public String toString() {
		return "Book [bIdx=" + bIdx + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", open_date=" + open_date + ", cnt=" + cnt + ", isLoan=" + isLoan + "]";
	}
	
	
	
}
