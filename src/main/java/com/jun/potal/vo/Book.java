package com.jun.potal.vo;

import java.util.Date;

public class Book {

	private int bIdx;
	private String isbn;
	private char category;
	private String title;
	private String author;
	private String info;
	private int bookAmt;
	private Date regDate;
	private int rentCnt;
	
	public Book() {
		
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public char getCategory() {
		return category;
	}

	public void setCategory(char category) {
		this.category = category;
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

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getBookAmt() {
		return bookAmt;
	}

	public void setBookAmt(int bookAmt) {
		this.bookAmt = bookAmt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getRentCnt() {
		return rentCnt;
	}

	public void setRentCnt(int rentCnt) {
		this.rentCnt = rentCnt;
	}

	@Override
	public String toString() {
		return "Book [bIdx=" + bIdx + ", isbn=" + isbn + ", category=" + category + ", title=" + title + ", author="
				+ author + ", info=" + info + ", bookAmt=" + bookAmt + ", regDate=" + regDate + ", rentCnt=" + rentCnt
				+ "]";
	}

	
	
	
	
	
}
