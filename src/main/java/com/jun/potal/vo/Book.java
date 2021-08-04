package com.jun.potal.vo;

import java.util.Date;

public class Book {

	private int bIdx;
	private String isbn;
	private char category;
	private String title;
	private String author;
	private String info;
	private int book_amt;
	private Date reg_date;
	private int rent_cnt;
	
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
		return book_amt;
	}

	public void setBook_amt(int book_amt) {
		this.book_amt = book_amt;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getRent_cnt() {
		return rent_cnt;
	}

	public void setRent_cnt(int rent_cnt) {
		this.rent_cnt = rent_cnt;
	}

	@Override
	public String toString() {
		return "Book [bIdx=" + bIdx + ", isbn=" + isbn + ", category=" + category + ", title=" + title + ", author="
				+ author + ", info=" + info + ", book_amt=" + book_amt + ", reg_date=" + reg_date + ", rent_cnt="
				+ rent_cnt + "]";
	}

	
	
	
	
}
