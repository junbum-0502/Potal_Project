package com.jun.potal.book.model.service;

import java.util.List;

import com.jun.potal.vo.Book;

public interface BookService {

	List<Book> selectAll(Book book);
	List<Book> selectBookByTitle(String title);
	List<Book> selectBookByAuthor(String author);
	List<Book> selectBookByPublisher(String publisher);
	
}
