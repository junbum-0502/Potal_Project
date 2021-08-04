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

	public int getBook_amt() {
		return bookAmt;
	}

	public void setBook_amt(int book_amt) {
		this.bookAmt = book_amt;
	}

	public Date getReg_date() {
		return regDate;
	}

	public void setReg_date(Date reg_date) {
		this.regDate = reg_date;
	}

	public int getRent_cnt() {
		return rentCnt;
	}

	public void setRent_cnt(int rent_cnt) {
		this.rentCnt = rent_cnt;
	}

	@Override
	public String toString() {
		return "Book [bIdx=" + bIdx + ", isbn=" + isbn + ", category=" + category + ", title=" + title + ", author="
				+ author + ", info=" + info + ", book_amt=" + bookAmt + ", reg_date=" + regDate + ", rent_cnt="
				+ rentCnt + "]";
	}

	
	
	
	
}
