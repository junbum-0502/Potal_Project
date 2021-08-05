package com.jun.potal.book.model.service;

import java.util.List;

import com.jun.potal.vo.Book;
import com.jun.potal.vo.Rent;

public interface BookService {

	List<Book> selectBook() throws Exception;
	
	List<Book> selectBookByBidx(String bIdx) throws Exception;
	
	int updateBookAmt(int bIdx) throws Exception;
	int insertRentData(Book book) throws Exception;
	
	List<Rent> selectRentHis(int UserId) throws Exception;
	
}
