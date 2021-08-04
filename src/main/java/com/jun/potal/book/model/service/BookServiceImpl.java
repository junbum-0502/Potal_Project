package com.jun.potal.book.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jun.potal.book.model.repository.BookDao;
import com.jun.potal.book.model.repository.BookRepository;
import com.jun.potal.vo.Book;

@Service
@Repository
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDao bookDao;


	@Override
	public List<Book> selectBook() throws Exception{	
		/* List<Book> bookList = bookDao.selectBook(); */
		
		/*
		 * Book book = (Book) bookDao.selectBook(); Map<String,Object> commandMap = new
		 * HashMap<String, Object>(); commandMap.put("bList", book); return commandMap;
		 */
		return bookDao.selectBook();
	}





}
