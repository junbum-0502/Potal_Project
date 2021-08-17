package com.jun.potal.book.model.service;

import java.util.List;
<<<<<<< HEAD
import java.util.Map;

import com.jun.potal.vo.Book;
=======

import com.jun.potal.vo.Book;
import com.jun.potal.vo.Rent;
>>>>>>> f5d471e33576b1abe1e80bd91349115fd1a216d4
import com.jun.potal.vo.User;

public interface BookService {

<<<<<<< HEAD
	Map<String, Object> selectBook(int page) throws Exception;
	
	Map<String, Object> selectBookSearch(int page,Book book) throws Exception;
=======
	List<Book> selectBook() throws Exception;
>>>>>>> f5d471e33576b1abe1e80bd91349115fd1a216d4
	
	List<Book> selectBookByBidx(String bIdx) throws Exception;
	
	int updateBookAmt(int bIdx) throws Exception;
	int insertRentData(Book book) throws Exception;
	
	List<User> selectRentHis(User user) throws Exception;
	
<<<<<<< HEAD
	
	
	List<Book> abcSelect(Book book) throws Exception;
	
=======
>>>>>>> f5d471e33576b1abe1e80bd91349115fd1a216d4
}
