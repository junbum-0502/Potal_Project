package com.jun.potal.book.model.service;

import java.util.List;

import com.jun.potal.vo.Book;
import com.jun.potal.vo.Rent;
import com.jun.potal.vo.User;

public interface BookService {

	List<Book> selectBook() throws Exception;
	
	List<Book> selectBookByBidx(String bIdx) throws Exception;
	
	int updateBookAmt(int bIdx) throws Exception;
	int insertRentData(Book book) throws Exception;
	
	List<User> selectRentHis(User user) throws Exception;
	
}
