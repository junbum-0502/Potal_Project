package com.jun.potal.book.model.service;

import java.util.List;
import java.util.Map;

import com.jun.potal.vo.Book;
import com.jun.potal.vo.User;

public interface BookService {

	Map<String, Object> selectBook(int page) throws Exception;
	
	Map<String, Object> selectBookSearch(int page,Book book) throws Exception;
	
	List<Book> selectBookByBidx(String bIdx) throws Exception;
	
	int updateBookAmt(int bIdx) throws Exception;
	int insertRentData(Book book) throws Exception;
	
	List<User> selectRentHis(User user) throws Exception;
	
	
	
	List<Book> abcSelect(Book book) throws Exception;
	
}