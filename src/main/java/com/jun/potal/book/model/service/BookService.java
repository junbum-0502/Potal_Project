package com.jun.potal.book.model.service;

import java.util.List;

import com.jun.potal.vo.Book;

public interface BookService {

	List<Book> selectBook() throws Exception;

	
}
